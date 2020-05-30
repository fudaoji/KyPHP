<?php
/**
 * Created by PhpStorm.
 * Script Name: TextMessageHadler.php
 * Create: 2020/4/15 10:40
 * Description: 公众号文本消息处理器
 * Author: fudaoji<fdj@kuryun.cn>
 */
namespace app\mp\controller\handler\mp;

use app\common\controller\WechatMp;
use EasyWeChat\Kernel\Contracts\EventHandlerInterface;
use EasyWeChat\Kernel\Messages\Text;
use think\facade\Log;

class TextMessageHandler extends WechatMp implements EventHandlerInterface
{
    /**
     * 初始化
     * @author Jason<dcq@kuryun.cn>
     */
    public function __construct() {
        parent::__construct();
    }

    /**
     * 处理器
     * @param null $payload
     * @return mixed
     * @author Jason<dcq@kuryun.cn>
     */
    public function handle($payload = null) {
        return new Text($payload['Content']);
    }
}