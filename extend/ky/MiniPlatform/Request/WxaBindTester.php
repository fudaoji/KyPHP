<?php
/**
 * Created by PhpStorm.
 * Script Name: WxaBindTester.phpphp
 * Create: 2018/8/30 14:12
 * Description: 绑定微信用户为小程序体验者
 * Author: Jason<dcq@kuryun.cn>
 */
namespace ky\MiniPlatform\Request;

use ky\MiniPlatform\RequestCheckUtil;

class WxaBindTester
{
    private $url = "https://api.weixin.qq.com/wxa/bind_tester";
    private $wechatId;
    private $getParams = array();
    private $postParams = array();

    /**
     * 获取请求url
     * @author Jason<dcq@kuryun.cn>
     */
    public function getUrl(){
        return $this->url;
    }

    /**
     * 设置请求地址
     * @param string $url
     * @author Jason<dcq@kuryun.cn>
     */
    public function setUrl($url) {
        $this->url = $url;
    }

    /**
     * 设置wechatId
     * @param string $wechatId
     * @author Jason<dcq@kuryun.cn>
     */
    public function setWechatId($wechatId) {
        $this->wechatId = $wechatId;
        $this->postParams['wechatid'] = $wechatId;
    }

    /**
     * 获取$wechatId
     * @author Jason<dcq@kuryun.cn>
     */
    public function getWechatId() {
        return $this->wechatId;
    }

    /**
     * get请求参数
     * @author Jason<dcq@kuryun.cn>
     */
    public function getParams() {
        return $this->getParams;
    }

    /**
     * post请求参数
     * @author Jason<dcq@kuryun.cn>
     */
    public function postParams() {
        return $this->postParams;
    }

    /**
     * 参数验证
     * @author Jason<dcq@kuryun.cn>
     */
    public function check() {
        RequestCheckUtil::checkNotNull($this->wechatId, "wechatId");
    }
}