<?php
/**
 * Created by PhpStorm.
 * Script Name: ModifySignature.php
 * Create: 2018/8/30 13:59
 * Description: 修改功能介绍
 * Author: Jason<dcq@kuryun.cn>
 */
namespace ky\MiniPlatform\Request;

use ky\MiniPlatform\RequestCheckUtil;

class ModifySignature
{
    private $url = "https://api.weixin.qq.com/cgi-bin/account/modifysignature";
    private $signature;
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
     * 设置signature
     * @param string $signature
     * @author Jason<dcq@kuryun.cn>
     */
    public function setSignature($signature) {
        $this->signature = $signature;
        $this->postParams['signature'] = $signature;
    }

    /**
     * 获取signature
     * @author Jason<dcq@kuryun.cn>
     */
    public function getSignature() {
        return $this->signature;
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
        RequestCheckUtil::checkNotNull($this->signature, "signature");
    }
}