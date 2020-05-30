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
     * Author: Doogie<fdj@kuryun.cn>
     */
    public static function serviceTypes($id = null){
        $list = [
            0 => '订阅号',
            1 => '历史老帐号升级后的订阅号',
            2 => '服务号',
        ];
        return isset($list[$id]) ? $list[$id] : $list;
    }

    /**
     * 认证类型
     * @param null $id
     * @return array|mixed
     * Author: Doogie<fdj@kuryun.cn>
     */
    public static function verifyTypes($id = null){
        $list = [
            -1 => '未认证',
            0 => '微信认证',
            1 => '新浪微博认证',
            2 => '腾讯微博认证',
            3 => '已资质认证通过但还未通过名称认证',
            4 => '已资质认证通过、还未通过名称认证，但通过了新浪微博认证',
            5 => '已资质认证通过、还未通过名称认证，但通过了腾讯微博认证'
        ];
        return isset($list[$id]) ? $list[$id] : $list;
    }
}