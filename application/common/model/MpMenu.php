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
 * Script Name: MpMenu.php
 * Create: 2020/6/7 下午3:42
 * Description: 公众号自定义菜单
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\model;

use ky\BaseModel;

class MpMenu extends BaseModel
{
    /**
     * 菜单类型
     * @param null $id
     * @return array|mixed
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public static function types($id = null){
        $list = [
            'click' => '触发关键词',
            'view' => '跳转URL',
            'miniprogram' => '跳转小程序',
            /*'scancode_push' => '扫码推事件',
            'scancode_waitmsg' => '扫码推事件且弹出“消息接收中”提示框',
            'pic_sysphoto' => '弹出系统拍照发图',
            'pic_photo_or_album' => '弹出拍照或者相册发图',
            'pic_weixin' => '弹出微信相册发图器',
            'location_select' => '弹出地理位置选择器',
            'media_id' => '下发永久素材', //图片、音频、视频、图文
            'view_limited' => '跳转图文消息URL' //其实可以是view的一种形式*/
        ];
        return isset($list[$id]) ? $list[$id] : $list;
    }
}