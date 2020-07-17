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
 * Script Name: AdminStore.php
 * Create: 2020/5/27 下午11:11
 * Description: 用户平台
 * Author: fudaoji<fdj@kuryun.cn>
 */
namespace app\common\model;

use ky\BaseModel;

class AdminStore extends BaseModel
{
    const MP = 'mp';
    const MINI = 'mini';
    const APP = 'app';
    const PC = 'pc';

    /**
     * 类型
     * @param null $id
     * @return array|mixed
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public static function types($id = null){
        $list = [
            self::MP => '微信公众号',
            self::MINI => '微信小程序'
        ];
        return isset($list[$id]) ? $list[$id] : $list;
    }
}