<?php
/**
 * Created by PhpStorm.
 * Script Name: WxaUnbindTesterter.php
 * Create: 2018/8/30 14:14
 * Description: 解除绑定小程序的体验者
 * Author: Jason<dcq@kuryun.cn>
 */
namespace ky\MiniPlatform\Request;

use ky\MiniPlatform\RequestCheckUtil;

class WxaUnbindTester
{
    private $url = "https://api.weixin.qq.com/wxa/unbind_tester";
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