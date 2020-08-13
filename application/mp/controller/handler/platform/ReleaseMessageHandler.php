<?php
/**
 * Created by PhpStorm.
 * Script Name: ReleaseMessageHandler.php
 * Create: 2020/4/15 10:48
 * Description: 全网发布事件消息处理器
 * Author: fudaoji<fdj@kuryun.cn>
 */
namespace app\mp\controller\handler\platform;

use app\common\controller\WechatMp;
use EasyWeChat\Kernel\Contracts\EventHandlerInterface;
use EasyWeChat\Kernel\Messages\Text;
use think\facade\Log;

class ReleaseMessageHandler extends WechatMp implements EventHandlerInterface
{
    /**
     * 初始化
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function __construct() {
        parent::__construct();
    }

    /**
     * 全网发布处理器
     * @param null $payload
     * @return Text
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function handle($payload = null) {
        Log::error('release::' . json_encode($payload, JSON_UNESCAPED_UNICODE));
        $message = $payload;
        switch($message['MsgType']) {
            case "event":
                //全网发布检测2: 事件消息   //这个貌似废弃了
                return new Text($message['Event'] . 'from_callback');
                break;
            case "text":
                //全网发布检测1: 文本检测
                $content = $message['Content'];
                if($content == 'TESTCOMPONENT_MSG_TYPE_TEXT') {
                    return new Text('TESTCOMPONENT_MSG_TYPE_TEXT_callback');
                } elseif(strpos($content, 'QUERY_AUTH_CODE:') !== false) {
                    //全网发布检测3: API验证
                    $query_auth_code = explode(":", $content)[1];
                    //接受微信放发来的query_auth_code
                    $response = $query_auth_code . '_from_api';
                    //使用授权码换取公众号的授权信息
                    $handleAuthorize = $this->openPlatform->handleAuthorize($query_auth_code);
                    $appId = $handleAuthorize['authorization_info']['authorizer_appid'];
                    // 获取授权方的帐号基本信息,主要目的是更新微信测试号的refresh_token
                    $authorizer_info = $this->openPlatform->getAuthorizer($appId);
                    $this->mpInfo = controller('mp', 'event')->updateAuthInfo($authorizer_info);
                    $this->mpApp = controller('mp', 'event')->getApp($this->mpInfo);
                    $text = new Text($response);
                    $this->mpApp->customer_service->message($text)->to($message['FromUserName'])->send();
                }
                break;
        }
    }
}