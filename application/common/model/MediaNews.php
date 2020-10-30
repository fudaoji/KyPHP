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
 * Script Name: MediaNews.php
 * Create: 2020/10/28 18:14
 * Description: 微信图文素材
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\model;

use ky\BaseModel;

class MediaNews extends BaseModel
{
    protected $isCache = true;
    protected $key = 'uid';
    protected $rule = [
        'type' => 'mod', // 分表方式
        'num'  => 5      // 分表数量
    ];

    const TYPE_WX = 1;
    const TYPE_LINK = 2;

    /**
     * 类型
     * @param null $id
     * @return array|mixed
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public static function types($id = null){
        $list = [
            self::TYPE_WX => '微信图文',
            self::TYPE_LINK => '消息图文'
        ];
        return isset($list[$id]) ? $list[$id] : $list;
    }
}