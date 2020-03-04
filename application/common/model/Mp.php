<?php
// +----------------------------------------------------------------------
// | [KyPHP System] Copyright (c) 2020 http://www.kuryun.com/
// +----------------------------------------------------------------------
// | [KyPHP] 并不是自由软件,你可免费使用,未经许可不能去掉KyPHP相关版权
// +----------------------------------------------------------------------
// | Author: fudaoji <461960962@qq.com>
// +----------------------------------------------------------------------
/**
 * Created by PhpStorm.
 * Script Name: ${FILE_NAME}
 * Create: 2020/3/1 12:18
 * Description: 公众号 model
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\model;

use ky\BaseModel;

class Mp extends BaseModel
{

    /**
     * 授权方公众号类型
     * @param null $id
     * @return array|mixed
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public static function serviceTypes($id = null){
        $list = [
            1 => '普通订阅号',
            2 => '认证订阅号',
            3 => '普通服务号',
            4 => '认证服务号(媒体、政府)'
        ];
        return isset($list[$id]) ? $list[$id] : $list;
    }
}