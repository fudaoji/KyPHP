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
 * Script Name: AddonMpApi.php
 * Create: 2020/7/7 15:34
 * Description: 公众号微信回复接口控制器基类
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\controller;

abstract class AddonMpApi
{
    /**
     * @param \EasyWeChat\Kernel\Messages\Message $message
     * @param array $params
     * @return mixed
     * Author: fudaoji<fdj@kuryun.cn>
     */
    abstract function message($message, $params = []);
}