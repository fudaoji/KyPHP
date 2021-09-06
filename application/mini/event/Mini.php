<?php
// +----------------------------------------------------------------------
// | [KyPHP System] Copyright (c) 2020 http://www.kuryun.com/
// +----------------------------------------------------------------------
// | [KyPHP] 并不是自由软件,你可免费使用,未经许可不能去掉KyPHP相关版权
// +----------------------------------------------------------------------
// | Author: fudaoji <fdj@kuryun.cn>
// +----------------------------------------------------------------------
/**
 * Created by PhpStorm.
 * Script Name: Mini.php
 * Create: 2020/7/22 18:05
 * Description: 小程序相关
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\mini\event;

use app\common\event\Base;
use app\common\model\AdminStore;
use EasyWeChat\Factory;
use ky\ErrorCode;
use ky\Logger;
use ky\MiniPlatform\ErrorMsg;
use think\Db;
use think\facade\Log;

class Mini extends Base
{
    /**
     * 生成活动小程序码
     * @param array $params {mini_info,filename,type,path,filename}
     * @return bool|string
     * Author: Doogie<fdj@kuryun.cn>
     * @throws \Exception
     */
    public function generateQr($params = []){
        //生成活动小程序码
        $app = $this->getApp($params['mini_info']);
        //生成活动小程序码
        if(isset($params['type']) && $params['type'] == 'unlimit'){
            $response = $app->app_code->getUnlimit($params['scene'], [
                'page'  => $params['path'],
            ]);
        }else{
            $response = $app->app_code->get($params['path']);
        }
        if ($response instanceof \EasyWeChat\Kernel\Http\StreamResponse) {
            $save_path = UPLOAD_PATH . '/qrcode/';
            if(!is_dir($save_path)){
                @mkdir($save_path, 0777, true);
            }
            $code_name = $response->saveAs($save_path, $params['filename']);
            $code_url = '/public/uploads/qrcode/' . $code_name;  //小程序码访问url

            $qiniuClass = $this->getQiniu();
            $qiniu_key = $qiniuClass->fetch(request()->domain() . $code_url, time() . $params['filename']);
            if($qiniu_key){
                @unlink('.' . $code_url);
                return $qiniuClass->downLink($qiniu_key);
            }else{
                Logger::write('生成小程序码失败: ' . $qiniuClass->getError());
            }
        }else{
            Logger::write('生成小程序码失败: ' . ErrorMsg::getErrorMsg($response['errcode']));
        }
        return false;
    }

    /**
     * 获取公众号APP
     * @param $mini_info
     * Author: fudaoji<fdj@kuryun.cn>
     * @return \EasyWeChat\MiniProgram\Application|\EasyWeChat\OpenPlatform\Authorizer\MiniProgram\Application
     * @throws \Exception
     */
    public function getApp($mini_info){
        $config = [
            'app_id'   => '',
            'secret'   => '',
            'response_type' => 'array',
            'log' => [
                'level' => 'error',
                'file'  => RUNTIME_PATH . 'log/mini-'.$mini_info['id'].'.log',
            ],
        ];
        if($mini_info['appsecret']){
            $config['app_id'] = $mini_info['appid'];
            $config['secret'] = $mini_info['appsecret'];
            return Factory::miniProgram($config);
        }else{
            return $this->getOpenPlatform()->miniProgram($mini_info['appid'], $mini_info['refresh_token']);
        }
    }

    /**
     * 授权方小程序信息入库
     * @param array $auth_info
     * @param int $uid
     * @return mixed
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function updateAuthInfo($auth_info, $uid = 0) {
        $result = false;
        $insert_data = [
            'appid'             => $auth_info['authorization_info']['authorizer_appid'],
            'refresh_token'     => $auth_info['authorization_info']['authorizer_refresh_token'],
            'nick_name'         => $auth_info['authorizer_info']['nick_name'],
            'service_type_info' => $auth_info['authorizer_info']['service_type_info']['id'],
            'verify_type_info'  => $auth_info['authorizer_info']['verify_type_info']['id'],
            'user_name'         => $auth_info['authorizer_info']['user_name'],
            'principal_name'    => $auth_info['authorizer_info']['principal_name'],
            'alias'             => $auth_info['authorizer_info']['alias'],
            'business_info'     => json_encode($auth_info['authorizer_info']['business_info']),
            'qrcode_url'        => fetch_to_qiniu($auth_info['authorizer_info']['qrcode_url']),
            'idc'               => $auth_info['authorizer_info']['idc'],
            'signature'         => $auth_info['authorizer_info']['signature'],
            'func_info'         => json_encode($auth_info['authorization_info']['func_info']),
            'mini_program_info' => json_encode($auth_info['authorizer_info']['MiniProgramInfo']),
            'is_auth'           => 1
        ];
        //未设置头像时，无该字段
        if(isset($auth_info['authorizer_info']['head_img'])) {
            $insert_data['head_img'] = $auth_info['authorizer_info']['head_img'];
        }
        if($mini = model('Mini')->getOneByMap(['appid' => $insert_data['appid']], true, true)) {
            $insert_data['id'] = $mini['id'];
            $result = model('Mini')->updateOne($insert_data);
        }elseif($uid || $insert_data['appid'] === 'wxd101a85aa106f53e'){
            Db::startTrans();
            try {
                $store = model('adminStore')->addOne(['uid' => $uid, 'type' => AdminStore::MINI]);
                $insert_data['uid'] = $uid;
                $insert_data['id'] = $store['id'];
                $result = model('Mini')->addOne($insert_data);
                Db::commit();
            }catch (\Exception $e){
                Db::rollback();
                Log::write($e->getMessage());
            }
        }

        return $result;
    }

    /**
     * 获取小程序支付配置
     * @param int $mini_id
     * @return array
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function getPayConfig($mini_id = 0){
        $setting = model('common/miniSetting')->getOneByMap(['mini_id' => $mini_id, 'name' => 'wxpay']);
        $config = json_decode($setting['value'], true);
        if(empty($config)){
            abort(ErrorCode::WxpayException, '请先配置小程序支付参数');
        }
        $base_path = ROOT_PATH . 'data/mini/';
        if(! is_dir($base_path)){
            mkdir($base_path, 0755, true);
        }
        $cert_path = $base_path . md5($mini_id . '_apiclient_cert.pem');
        $key_path = $base_path . md5($mini_id . '_apiclient_key.pem');
        $rsa_path = $base_path . md5($mini_id . '_public_rsa.pem');
        if(!file_exists($key_path) || !file_exists($cert_path) || !file_exists($rsa_path)){
            !empty($config['cert_path']) && file_put_contents($cert_path, $config['cert_path']);
            !empty($config['key_path']) && file_put_contents($key_path, $config['key_path']);
            !empty($config['rsa_path']) && file_put_contents($rsa_path, $config['rsa_path']);
        }
        return [
            'appid'     => $config['appid'], //appid
            'mchid'     => $config['mchid'], //商户号
            'p_appid'     => $config['p_appid'], //服务商appid
            'p_mchid' => $config['p_mchid'], //服务商户号
            'key'       => $config['key'], //API秘钥
            'sslcert_path' => $cert_path,
            'sslkey_path' => $key_path,
            'rsa_path'  => $rsa_path
        ];
    }
}