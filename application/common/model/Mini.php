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
 * Script Name: Mini.php
 * Create: 2020/7/22 18:12
 * Description: 小程序
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\model;

use ky\BaseModel;

class Mini extends BaseModel
{
    protected $isCache = true;

    /**
     * 认证类型
     * @param null $id
     * @return array|mixed
     * Author: Doogie<fdj@kuryun.cn>
     */
    public static function verifyTypes($id = null){
        $list = [
            -1 => '未认证',
            0 => '微信认证'
        ];
        return isset($list[$id]) ? $list[$id] : $list;
    }
}