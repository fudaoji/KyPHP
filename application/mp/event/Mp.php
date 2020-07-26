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
 * Script Name: Mp.php
 * Create: 2020/5/28 15:15
 * Description: 微信相关
 * Author: fudaoji<fdj@kuryun.cn>
 */
namespace app\mp\event;

use app\common\event\Base;
use app\common\model\AdminStore;
use EasyWeChat\Factory;
use ky\ErrorCode;

class Mp extends Base
{
    /**
     * 获取公众号APP
     * @param $mp_info
     * @return \EasyWeChat\OfficialAccount\Application|\EasyWeChat\OpenPlatform\Authorizer\OfficialAccount\Application
     * Author: fudaoji<fdj@kuryun.cn>
     * @throws \Exception
     */
    public function getApp($mp_info){
        $config = [
            'app_id'   => '',
            'secret'   => '',
            'token'    => '',
            'response_type' => 'array',
            'log' => [
                'level' => 'error',
                'file'  => RUNTIME_PATH . 'log/mp-'.$mp_info['id'].'.log',
            ],
        ];
        if($mp_info['appsecret']){
            $config['aes_key'] = $mp_info['encodingaeskey'];
            $config['app_id'] = $mp_info['appid'];
            $config['secret'] = $mp_info['appsecret'];
            $config['token'] = $mp_info['refresh_token'];
            return Factory::officialAccount($config);
        }else{
            return $this->getOpenPlatform()->officialAccount($mp_info['appid'], $mp_info['refresh_token']);
        }    
    }
    
    /**
     * 授权方微信公众号信息入库
     * @param array $auth_info
     * @param int $uid
     * @return mixed
     * @author Jason<dcq@kuryun.cn>
     */
    public function updateAuthInfo($auth_info = [], $uid = 0) {
        $result = false;
        $insert_data = [
            'appid'             => $auth_info['authorization_info']['authorizer_appid'],
            'appsecret'         => '', //区分手动接入
            'refresh_token'     => $auth_info['authorization_info']['authorizer_refresh_token'],
            'nick_name'         => $auth_info['authorizer_info']['nick_name'],
            'service_type_info' => $auth_info['authorizer_info']['service_type_info']['id'],
            'verify_type_info'  => $auth_info['authorizer_info']['verify_type_info']['id'],
            'user_name'         => $auth_info['authorizer_info']['user_name'],
            'principal_name'    => $auth_info['authorizer_info']['principal_name'],
            'alias'             => $auth_info['authorizer_info']['alias'],
            'business_info'     => json_encode($auth_info['authorizer_info']['business_info']),
            'qrcode_url'        => $auth_info['authorizer_info']['qrcode_url'],
            'idc'               => $auth_info['authorizer_info']['idc'],
            'signature'         => $auth_info['authorizer_info']['signature'],
            'func_info'         => json_encode($auth_info['authorization_info']['func_info']),
            'is_auth'           => 1
        ];
        //未设置头像时，无该字段
        if(isset($auth_info['authorizer_info']['head_img'])) {
            $insert_data['head_img'] = $auth_info['authorizer_info']['head_img'];
        }
        if($mp = model('mp')->getOneByMap(['appid' => $insert_data['appid']], true, true)) {
            $insert_data['id'] = $mp['id'];
            $result = model('mp')->updateOne($insert_data);
        }elseif($uid > 0) {
            $store = model('adminStore')->addOne(['uid' => $uid, 'type' => AdminStore::MP]);
            $insert_data['uid'] = $uid;
            $insert_data['id'] = $store['id'];
            $result = model('mp')->addOne($insert_data);
        }
        return $result;
    }

    /**
     * 获取公众号支付配置
     * @param int $mpid
     * @return array
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function getPayConfig($mpid = 0){
        $setting = model('common/mpSetting')->getOneByMap(['mpid' => $mpid, 'name' => 'wxpay']);
        $config = json_decode($setting['value'], true);
        if(empty($config)){
            abort(ErrorCode::WxpayException, '请先配置公众号支付参数');
        }
        $base_path = ROOT_PATH . 'data/mp/';
        if(! is_dir($base_path)){
            mkdir($base_path, 0755, true);
        }
        $cert_path = $base_path . md5($mpid . '_apiclient_cert.pem');
        $key_path = $base_path . md5($mpid . '_apiclient_key.pem');
        $rsa_path = $base_path . md5($mpid . '_public_rsa.pem');
        if(!file_exists($key_path) || !file_exists($cert_path) || !file_exists($rsa_path)){
            file_put_contents($cert_path, empty($config['cert_path']) ? '' : $config['cert_path']);
            file_put_contents($key_path, empty($config['key_path']) ? '' : $config['key_path']);
            file_put_contents($rsa_path, empty($config['rsa_path']) ? '' : $config['rsa_path']);
        }
        return [
            'appid'     => $config['appid'],
            'appsecret' => $config['secret'],
            'mchid'     => $config['merchant_id'], //商户号
            'key'       => $config['key'], //API秘钥
            'sslcert_path' => $cert_path,
            'sslkey_path' => $key_path,
            'rsa_path'  => $rsa_path
        ];
    }
}