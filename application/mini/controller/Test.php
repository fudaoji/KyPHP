<?php
// +----------------------------------------------------------------------
// | [KyPHP System] Copyright (c) 2020 http://www.kuryun.com/
// +----------------------------------------------------------------------
// | [KyPHP] 并不是自由软件,你可免费使用,未经许可不能去掉KyPHP相关版权
// +----------------------------------------------------------------------
// | License  https://gitee.com/fudaoji/KyPHP/blob/master/LICENSE
// +----------------------------------------------------------------------

/**
 * Created by PhpStorm.
 * Script Name: Test.php
 * Create: 2020/8/14 上午12:31
 * Description: 测试
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\mini\controller;

use ky\MiniPlatform\Request\ComponentGetPrivacySetting;
use ky\MiniPlatform\Request\ComponentModifyWxaServerDomain;
use ky\MiniPlatform\Request\ComponentSetPrivacySetting;
use ky\MiniPlatform\Request\WxaModifyDomain;
use ky\MiniPlatform\RequestClient;

class Test extends Base
{
    /**
     * @var RequestClient
     */
    private $client;

    public function initialize()
    {
        parent::initialize(); // TODO: Change the autogenerated stub
        $this->client = new RequestClient();
    }

    /**
     * 获取小程序服务器域名
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function testWxaModifyDomain(){
        $access_token = $this->miniApp->access_token->getToken()['authorizer_access_token'];
        $request = new WxaModifyDomain();
        $request->setAction('get');
        $response = $this->client->execute($request, $access_token);
        dump($response);exit;
    }

    public function testGetWxaDomain(){
        $access_token = controller('mp/mp', 'event')->getOpenPlatform()->access_token->getToken()['component_access_token'];

        $request = new ComponentModifyWxaServerDomain();
        $request->setAction('get');
        $response = $this->client->execute($request, $access_token);
        dump($response);
        /*$request->setAction('set');
        $request->setIsModifyPublishedTogether(true);
        $request->setWxaServerDomain($response['testing_wxa_server_domain']);
        $response = $this->client->execute($request, $access_token);
        dump($response);
        $request->setAction('get');
        $response = $this->client->execute($request, $access_token);
        dump($response);*/
    }

    /**
     * 设置用户隐私保护协议
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function testSetPrivacySetting(){
        $addon = model('addons')->getOneByMap(['addon' => 'gxtea']);
        $access_token = $this->miniApp->access_token->getToken()['authorizer_access_token'];
        $config = json_decode($addon['config'], true);
        if(empty($config)){
            $this->error('请让平台运营方先对此应用进行配置', '', ['token' => request()->token]);
        }
        $request = new ComponentSetPrivacySetting();
        $request->setOwnerSetting([
            'contact_phone' => $config['contact_phone'],
            'notice_method' => $config['notice_method']
        ]);

        $setting_list = [];
        foreach ($config['setting_list'] as $k => $v){
            $setting_list[] = [
                'privacy_key' => $k,
                'privacy_text' => $v
            ];
        }
        $request->setOwnerSetting([
            'contact_phone' => $config['contact_phone'],
            'notice_method' => $config['notice_method']
        ]);
        $request->setSettingList($setting_list);
        $response = $this->client->execute($request, $access_token);

        dump($response);exit;
    }

    /**
     * 获取用户隐私保护协议
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function testGetPrivacySetting(){
        $access_token = $this->miniApp->access_token->getToken()['authorizer_access_token'];

        $request = new ComponentGetPrivacySetting();
        $response = $this->client->execute($request, $access_token);

        dump($response);exit;
    }
}