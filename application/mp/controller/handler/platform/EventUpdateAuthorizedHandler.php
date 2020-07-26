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
 * Script Name: EventAuthorizedHandler.php
 * Create: 2020/4/15 10:54
 * Description: 第三方公众号/小程序授权成功处理器
 * Author: fudaoji<fdj@kuryun.cn>
 */
namespace app\mp\controller\handler\platform;

use app\common\controller\WechatMp;
use EasyWeChat\Kernel\Contracts\EventHandlerInterface;

class EventUpdateAuthorizedHandler extends WechatMp implements EventHandlerInterface
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
     * @param null $payload
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function handle($payload = null) {
        $authorizer_info = $this->openPlatform->getAuthorizer($payload['AuthorizerAppid']);
        if(isset($authorizer_info['authorizer_info']['MiniProgramInfo'])) {
            //小程序类型授权
            controller('mini/mini', 'event')->updateAuthInfo($authorizer_info);
        }else{
            //公众号类型授权
            controller('mp/mp', 'event')->updateAuthInfo($authorizer_info);
        }
    }
}