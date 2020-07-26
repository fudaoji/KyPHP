<?php
/**
 * Created by PhpStorm.
 * Script Name: WxaMemberAuth.phpphp
 * Create: 2018/8/30 14:15
 * Description: 获取体验者列表
 * Author: Jason<dcq@kuryun.cn>
 */
namespace ky\MiniPlatform\Request;

use ky\MiniPlatform\RequestCheckUtil;

class WxaMemberAuth
{
    private $url = "https://api.weixin.qq.com/wxa/memberauth";
    private $action;
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
     * 设置action
     * @param string $action
     * @author Jason<dcq@kuryun.cn>
     */
    public function setAction($action) {
        $this->action = $action;
        $this->postParams['action'] = $action;
    }

    /**
     * 获取action
     * @author Jason<dcq@kuryun.cn>
     */
    public function getAction() {
        return $this->action;
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
        RequestCheckUtil::checkNotNull($this->action, "action");
    }
}