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
 * Script Name: MpFollow
 * Create: 2020/7/24 下午4:51
 * Description: 小程序粉丝表
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\model;

use ky\BaseModel;

class MiniFollow extends BaseModel
{
    protected $isCache = true;

    protected $key = 'mini_id';
    protected $rule = [
        'type' => 'mod', // 分表方式
        'num'  => 5      // 分表数量
    ];

    /**
     * 性别
     * @param null $id
     * @return array|mixed
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public static function genders($id = null){
        $list = [
            0 => '未知',
            1 => '男',
            2 => '女'
        ];
        return isset($list[$id]) ? $list[$id] : $list;
    }
}