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
        Log::write('release::' . json_encode($payload));
        $message = $payload;
        switch($message['MsgType']) {
            case "event":
                //全网发布检测1: 事件消息
                return new Text($message['Event'] . 'from_callback');
                break;
            case "text":
                //全网发布检测2: 文本检测
                $content = $message['Content'];
                if($content == 'TESTCOMPONENT_MSG_TYPE_TEXT') {
                    return new Text('TESTCOMPONENT_MSG_TYPE_TEXT_callback');
                } else {
                    //全网发布检测3: API验证
                    $query_auth_code = explode(":", $content)[1];
                    //接受微信放发来的query_auth_code
                    $response = $query_auth_code . '_from_api';
                    //使用授权码换取公众号的授权信息
                    $this->openPlatform->handleAuthorize($query_auth_code);
                    $text = new Text($response);
                    $this->mpApp->customer_service->message($text)->to($message['FromUserName'])->send();
                }
                break;
        }
    }
}