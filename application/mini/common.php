<?php
// +----------------------------------------------------------------------
// | [KyPHP System] Copyright (c) 2020 http://www.kuryun.com/
// +----------------------------------------------------------------------
// | [KyPHP] 并不是自由软件,你可免费使用,未经许可不能去掉KyPHP相关版权
// +----------------------------------------------------------------------
// | License  https://gitee.com/fudaoji/KyPHP/blob/master/LICENSE
// +----------------------------------------------------------------------
/**
 * Created by PhpStorm.
 * Script Name: common.php
 * Create: 2020/8/4 17:13
 * Description: 小程序相关函数
 * Author: fudaoji<fdj@kuryun.cn>
 */

/**
 * 获取小程序微信支付配置
 * @param int $mini_id
 * @return array
 * Author: fudaoji<fdj@kuryun.cn>
 */
function get_mini_pay_config($mini_id = 0) {
    return controller('mini/mini', 'event')->getPayConfig($mini_id);
}