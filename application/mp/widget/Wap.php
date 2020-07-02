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
 * Script Name: Wap.php
 * Create: 2019/8/12 9:33
 * Description: 微信相关
 * Author: Doogie<fdj@kuryun.cn>
 */

namespace app\mp\widget;

class Wap
{
    /**
     * 微信分享
     * @param array $params
     * @return string
     * Author: Doogie<fdj@kuryun.cn>
     */
    public function wxShare($params = []){
        $apis = [
            'onMenuShareTimeline',
            'onMenuShareAppMessage',
            'updateAppMessageShareData',
            'updateTimelineShareData',
        ];
        $js_config = $params['app']->jssdk->buildConfig($apis, false, false, true);
        return <<<SHARE
<script src="https://res.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
<script>
    wx.config({$js_config});
    //微信分享
        wx.ready(function () {
            var title = '{$params['share_title']}',
                desc = '{$params['share_desc']}',
                imgUrl = '{$params['share_img']}',
                link = '{$params['share_link']}';
            // 2.1 监听“分享给朋友”，按钮点击、自定义分享内容及分享结果接口
            wx.updateAppMessageShareData({
                title: title,
                link: link,
                imgUrl: imgUrl,
                desc: desc
            });
            //分享到朋友圈
            wx.updateTimelineShareData({
                title: title,
                link: link,
                imgUrl: imgUrl,
                desc: desc
            });
        });
</script>
SHARE;
    }
}