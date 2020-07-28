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
use think\Db;
use think\facade\Log;

class Mini extends Base
{
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
        }else {
            if($uid){
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
        }

        return $result;
    }
}