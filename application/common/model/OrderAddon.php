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
 * Script Name: OrderAddon.php
 * Create: 2020/7/21 9:00
 * Description: 应用订单
 * Author: fudaoji<fdj@kuryun.cn>
 */
namespace app\common\model;

use ky\BaseModel;

class OrderAddon extends BaseModel
{
    /**
     * 支付状态
     * @param null $id
     * @return array|mixed
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public static function paids($id = null){
        $list = [
            -1 => '支付失败',
            0 => '待支付',
            1 => '支付成功',
            2 => '已退款'
        ];
        return isset($list[$id]) ? $list[$id] : $list;
    }
}