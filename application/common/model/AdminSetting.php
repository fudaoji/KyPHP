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
 * Script Name: AdminSetting.php
 * Create: 2021/7/30 17:36
 * Description: 用户配置
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\model;

use ky\BaseModel;

class AdminSetting extends BaseModel
{

    public static function smsDrivers($id = null){
        $list = [
            'qcloud' => '腾讯云',
            'yunxin' => '云信使',
            'shiyuan' => '示远科技',
            'zhutong' => '助通科技'
        ];
        return isset($list[$id]) ? $list[$id] : $list;
    }
}