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
 * Description: 公众号授权登录
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\mp\controller;

use think\facade\Log;

class Auth extends Base
{
    protected $needMpId = false; //授权接入公众号，不需进入公众号管理
    public function initialize()
    {
        parent::initialize();
    }

    /**
     * 公众号授权
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function index() {
        $redirect_url = request()->domain() . url('authCallback');
        $url = $this->openPlatform->getPreAuthorizationUrl($redirect_url);

        $assign = [
            'url' => $url
        ];
        return $this->show($assign);
    }

    /**
     * 公众号授权回调
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function authCallback() {
        try {
            // 使用授权码换取接口调用凭据和授权信息
            $handleAuthorize = $this->openPlatform->handleAuthorize($authCode = null);
            $appId = $handleAuthorize['authorization_info']['authorizer_appid'];
            // 获取授权方的帐号基本信息
            $authorizer_info = $this->openPlatform->getAuthorizer($appId);
            $result = controller('mp', 'event')->updateAuthInfo($authorizer_info, $this->adminId);
        } catch (\Exception $e){
            Log::write(json_encode($e->getMessage()));
            $result = false;
        }

        if($result) {
            $this->redirect('system/mp/index');
        }else {
            $this->error('授权回调处理错误');
        }
    }
}