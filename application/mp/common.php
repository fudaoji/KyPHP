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
 * Script Name: common.php
 * Create: 2020/7/1 16:25
 * Description: 微信模块方法
 * Author: fudaoji<fdj@kuryun.cn>
 */

/**
 * 获取微信支付配置
 * @param int $mpid
 * @return array
 * Author: fudaoji<fdj@kuryun.cn>
 */
function get_wx_pay_config($mpid = 0) {
    return controller('mp/mp', 'event')->getPayConfig($mpid);
}