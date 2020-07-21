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
 * Script Name: Payment.php
 * Create: 2020/7/21 9:54
 * Description: 支付相关
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\event;

use ky\ErrorCode;

class Payment extends Base
{
    /**
     * 支付类型
     * @param string $type
     * Author: fudaoji<fdj@kuryun.cn>
     * @return array
     */
    public function getPayConfig($type = ''){
        $config = config('system.pay');
        if(empty($config)){
            abort(ErrorCode::ParamException, '请先配置支付参数');
        }
        $return = [];
        switch ($type){
            default://默认公众号
                $base_path = ROOT_PATH . 'data/mp/';
                if(! is_dir($base_path)){
                    mkdir($base_path, 0755, true);
                }
                $cert_path = $base_path . md5('platform_apiclient_cert.pem');
                $key_path = $base_path . md5('platform_apiclient_key.pem');
                $rsa_path = $base_path . md5( 'platform_public_rsa.pem');
                if(!file_exists($key_path) || !file_exists($cert_path) || !file_exists($rsa_path)){
                    file_put_contents($cert_path, empty($config['wx_cert_path']) ? '' : $config['wx_cert_path']);
                    file_put_contents($key_path, empty($config['wx_key_path']) ? '' : $config['wx_key_path']);
                    file_put_contents($rsa_path, empty($config['wx_rsa_path']) ? '' : $config['wx_rsa_path']);
                }
                $return = [
                    'appid'     => $config['wx_appid'],
                    'appsecret' => $config['wx_secret'],
                    'mchid'     => $config['wx_merchant_id'], //商户号
                    'key'       => $config['wx_key'], //API秘钥
                    'sslcert_path' => $cert_path,
                    'sslkey_path' => $key_path,
                    'rsa_path'  => $rsa_path
                ];
                break;
        }
        return $return;
    }
}