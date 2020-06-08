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
 * Script Name: MpSpecial.php
 * Create: 2020/6/4 10:22
 * Description: 公众号特殊消息/事件回复
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\model;

use ky\BaseModel;

class MpSpecial extends BaseModel
{
    protected $autoWriteTimestamp = false;
    const SUBSCRIBE = 'subscribe';
    const UNSUBSCRIBE = 'unsubscribe';
    /**
     * 事件类型
     * @param null $id
     * @return array|mixed
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public static function events($id = null){
        $list = [
            self::SUBSCRIBE => '关注事件',
            self::UNSUBSCRIBE => '取关事件',
            'image' => '图片消息',
            'voice' => '语音消息',
            'video' => '视频消息',
            'shortvideo' => '短视频消息',
            'location' => '地理位置消息',
            'link' => "链接消息",
            'event_location' => '上报地理位置事件',
            'view' => "点击自定义菜单的链接事件",
            'card' => '卡券事件',
            'default' => '默认回复'
        ];
        return isset($list[$id]) ? $list[$id] : $list;
    }
}