<?php
/**
 * Created by PhpStorm.
 * Script Name: Api.php
 * Create: 2020/4/14 15:46
 * Description: 与微信服务器交互事件
 * Author: fudaoji<fdj@kuryun.cn>
 */
namespace app\mp\controller;

use app\common\controller\WechatMp;
use app\mp\controller\handler\mp\SpecialMessageHandler;
use app\mp\controller\handler\platform\EventAuthorizedHandler;
use app\mp\controller\handler\platform\EventUnAuthorizedHandler;
use app\mp\controller\handler\platform\EventUpdateAuthorizedHandler;
use app\mp\controller\handler\platform\ReleaseMessageHandler;
use EasyWeChat\OpenPlatform\Server\Guard;
use EasyWeChat\Kernel\Messages\Message;
use app\mp\controller\handler\mp\TextMessageHandler;
use app\mp\controller\handler\mp\EventMessageHandler;
use think\facade\Log;

class Api extends WechatMp
{
    /**
     * @var \think\Model
     */
    private $followM;

    /**
     * 构造函数
     * @author Jason<dcq@kuryun.cn>
     */
    public function initialize() {
        parent::initialize();
        //$this->followM = model('mpFollow');
    }

    /**
     * 公众号消息与事件接收
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function index() {
        if(in_array($this->appId, ['wx570bc396a51b8ff8', 'wxd101a85aa106f53e'])) {
            //全网发布
            return $this->release();
        }
        $this->mpApp->server->push(TextMessageHandler::class, Message::TEXT);
        $this->mpApp->server->push(EventMessageHandler::class, Message::EVENT);
        $this->mpApp->server->push(SpecialMessageHandler::class, Message::IMAGE|Message::LOCATION|Message::VOICE|Message::VIDEO|Message::LINK);
        //其他事件可按此依次注册事件处理器...
        $this->mpApp->server->serve()->send();
    }

    /**
     * 开放平台第三方平台推送事件处理
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function ticket() {
        $this->openPlatform->server->push(EventAuthorizedHandler::class, Guard::EVENT_AUTHORIZED);
        $this->openPlatform->server->push(EventUpdateAuthorizedHandler::class, Guard::EVENT_UPDATE_AUTHORIZED);
        $this->openPlatform->server->push(EventUnAuthorizedHandler::class, Guard::EVENT_UNAUTHORIZED);
        $this->openPlatform->server->serve()->send();
    }

    /**
     * 全网发布
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function release() {
        $this->mpApp->server->push(ReleaseMessageHandler::class, Message::TEXT|Message::EVENT);
        $this->mpApp->server->serve()->send();
    }
}