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
 * Script Name: MessageObj.php
 * Create: 2020/6/9 下午10:47
 * Description:
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\mp\controller\handler\mp;

use EasyWeChat\Kernel\Messages\Image;
use EasyWeChat\Kernel\Messages\Music;
use EasyWeChat\Kernel\Messages\News;
use EasyWeChat\Kernel\Messages\NewsItem;
use EasyWeChat\Kernel\Messages\Text;
use EasyWeChat\Kernel\Messages\Video;
use EasyWeChat\Kernel\Messages\Voice;

class MessageObj
{
    /**
     * 图文
     * @param $media
     * @return News
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public static function news($media){
        $items = [
            new NewsItem([
                'title'       => $media['title'],
                'description' => $media['digest'],
                'url'         => $media['content_source_url'] != '' ? $media['content_source_url'] : '',
                'image'       => $media['cover_url'],
            ]),
        ];
        if($list = model('MediaNews')->getAll([
            'where' => ['mpid' => $media['mpid'], 'pid' => $media['id']],
            'order' => ['sort' => 'asc']
        ])) {
            foreach ($list as $vo) {
                array_push($items, new NewsItem([
                    'title'         => $vo['title'],
                    'description'   => $vo['digest'],
                    'url'           => $vo['content_source_url'] != '' ? $vo['content_source_url'] : '',
                    'image'         => $vo['cover_url'],
                ]));
            }
        }
        return new News($items);
    }

    /**
     * 音乐
     * @param $media
     * @return Music
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public static function music($media){
        return new Music([
            'title' => $media['title'],
            'description' => $media['desc'],
            'url' => $media['url'],
            'hq_url' => $media['hq_url'],
            'thumb_media_id' => $media['thumb_media_id']
        ]);
    }

    /**
     * 视频
     * @param $media
     * @return Video
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public static function video($media){
        return new Video($media['media_id'], [
            'title' => $media['title'],
            'description' => $media['desc'],
        ]);
    }

    /**
     * 语音
     * @param $media
     * @return Voice
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public static function voice($media){
        return new Voice($media['media_id']);
    }

    /**
     * 文本
     * @param $media
     * @return Text
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public static function text($media){
        return new Text($media['content']);
    }

    /**
     * 图片
     * @param $media
     * @return Image
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public static function image($media){
        return new Image($media['media_id']);
    }
}