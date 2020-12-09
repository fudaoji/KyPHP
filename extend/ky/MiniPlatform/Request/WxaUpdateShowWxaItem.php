<?php
/**
 * Created by PhpStorm.
 * Script Name: WxaGetShowWxaItem.php
 * Create: 2020/11/17 11:12
 * Description: 设置展示的公众号信息
 * @link https://developers.weixin.qq.com/doc/oplatform/Third-party_Platforms/Mini_Programs/subscribe_component/getshowwxaitem.html
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace ky\MiniPlatform\Request;

use ky\MiniPlatform\RequestCheckUtil;

class WxaUpdateShowWxaItem
{
    private $url = "https://api.weixin.qq.com/wxa/updateshowwxaitem";
    private $getParams = array();
    private $postParams = array();
    private $wxaSubscribeBizFlag;  //是否开启组件
    private $appId;  //新公众appid

    /**
     * 设置appid
     * @param string $appid
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function setAppId($appid) {
        $this->appId= $appid;
        $this->postParams['appid'] = $appid;
    }

    /**
     * 获取value
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function getAppId() {
        return $this->appId;
    }

    /**
     * 设置wxa_subscribe_biz_flag
     * @param int $wxa_subscribe_biz_flag
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function setWxaSubscribeBizFlag($wxa_subscribe_biz_flag) {
        $this->wxaSubscribeBizFlag= $wxa_subscribe_biz_flag;
        $this->postParams['wxa_subscribe_biz_flag'] = $wxa_subscribe_biz_flag;
    }

    /**
     * 获取value
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function getWxaSubscribeBizFlag() {
        return $this->wxaSubscribeBizFlag;
    }

    /**
     * 获取请求url
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function getUrl(){
        return $this->url;
    }

    /**
     * 设置请求地址
     * @param string $url
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function setUrl($url) {
        $this->url = $url;
    }

    /**
     * get请求参数
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function getParams() {
        return $this->getParams;
    }

    /**
     * post请求参数
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function postParams() {
        return $this->postParams;
    }

    /**
     * 参数验证
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function check() {
        RequestCheckUtil::checkNotNull($this->appId, "appid");
        RequestCheckUtil::checkNumberic($this->wxaSubscribeBizFlag, "wxa_subscribe_biz_flag");
    }
}