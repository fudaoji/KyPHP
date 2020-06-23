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
    const IMAGE = 'image';
    const VOICE = 'voice';
    const VIDEO = 'video';
    const SHORTVIDEO = 'shortvideo';
    const LOCATION= 'location';
    const LINK = 'link';
    const EVENT_LOCATION = 'event_location';
    const VIEW = 'view';
    const CARD = 'card';
    const DEFAULT_ANS = 'default';

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
            self::IMAGE => '图片消息',
            self::VOICE => '语音消息',
            self::VIDEO => '视频消息',
            self::SHORTVIDEO => '短视频消息',
            self::LOCATION => '地理位置消息',
            self::LINK => "链接消息",
            self::EVENT_LOCATION => '上报地理位置事件',
            //self::VIEW => "点击自定义菜单的链接事件",
            self::CARD => '卡券事件',
            self::DEFAULT_ANS => '默认回复'
        ];
        return isset($list[$id]) ? $list[$id] : $list;
    }
}