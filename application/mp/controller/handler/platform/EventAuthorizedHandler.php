<?php
/**
 * Created by PhpStorm.
 * Script Name: EventAuthorizedHandler.php
 * Create: 2020/4/15 10:54
 * Description: 第三方公众号授权成功处理器
 * Author: fudaoji<fdj@kuryun.cn>
 */
namespace app\mp\controller\handler\platform;

use app\common\controller\WechatMp;
use EasyWeChat\Kernel\Contracts\EventHandlerInterface;

class EventAuthorizedHandler extends WechatMp implements EventHandlerInterface
{
    /**
     * 初始化
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function __construct() {
        parent::__construct();
    }

    /**
     * 处理器
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function handle($payload = null) {
        $authorizer_info = $this->openPlatform->getAuthorizer($payload['AuthorizerAppid']);
        //公众号类型授权
        controller('mp/mp', 'event')->updateAuthInfo($authorizer_info);
    }
}