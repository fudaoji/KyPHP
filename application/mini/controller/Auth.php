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
 * Script Name: Auth.php
 * Create: 2020/5/28 15:05
 * Description: 小程序授权登录
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\mini\controller;

use think\facade\Log;

class Auth extends Base
{
    protected $needMiniId = false; //授权接入
    public function initialize()
    {
        parent::initialize();
    }

    /**
     * 小程序授权失败
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function fail() {
        $code = input('code', 1, 'intval');
        //授权失败重新授权
        $redirect_url = request()->domain() . url('authCallback');
        $url = $this->openPlatform->getPreAuthorizationUrl($redirect_url);

        $assign = [
            'code'      => $code,
            'url'       => $url,
        ];
        return $this->show($assign);
    }

    /**
     * 授权回调
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function authCallback() {
        // 使用授权码换取接口调用凭据和授权信息
        $handleAuthorize = $this->openPlatform->handleAuthorize($authCode = null);
        $app_id = $handleAuthorize['authorization_info']['authorizer_appid'];
        // 获取授权方的帐号基本信息
        $auth_info = $this->openPlatform->getAuthorizer($app_id);

        //判断是否是小程序类型授权
        if(isset($auth_info['authorizer_info']['MiniProgramInfo'])) {
            //判断小程序是否授权给其他第三方平台
            $func_info = $auth_info['authorization_info']['func_info'];
            $has_auth = false;
            if(! empty($func_info)) {
                foreach ($func_info as $value) {
                    //小程序授权给开发者的权限集列表，ID为17到19时分别代表： 17.帐号管理权限 18.开发管理权限 19.客服消息管理权限
                    if($value['funcscope_category']['id'] == 18) {
                        $has_auth = true;
                        break;
                    }
                }
            }

            if(! $has_auth) {
                //小程序已授权给其他第三方平台，跳转授权失败
                $this->redirect(url('fail', ['code' => 2]));

            }
            //写入授权信息
            controller('mini/mini', 'event')->updateAuthInfo($auth_info, $this->adminId);
            $this->redirect(url('system/mini/index'));
        }else {
            //非小程序授权，跳转授权失败
            $this->redirect(url('fail'));
        }
    }
}