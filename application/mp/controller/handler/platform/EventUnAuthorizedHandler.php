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
use think\facade\Log;

class EventUnAuthorizedHandler extends WechatMp implements EventHandlerInterface
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
     * 取消授权
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function handle($payload = null) {
        Log::write("取消授权：" . $payload['AuthorizerAppid']);
        $this->mpInfo = $this->mpM->getOneByMap(['appid' => $payload['AuthorizerAppid']]);
        $this->mpInfo && $this->mpInfo = $this->mpM->updateOne(['id' => $this->mpInfo['id'], 'is_auth' => 0]);
    }
}