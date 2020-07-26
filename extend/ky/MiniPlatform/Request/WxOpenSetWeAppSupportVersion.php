<?php
/**
 * Created by PhpStorm.
 * Script Name: WxOpenSetWeAppSupportVersion.php
 * Create: 2018/9/4 14:43
 * Description: 设置最低基础库版本
 * Author: Jason<dcq@kuryun.cn>
 */
namespace ky\MiniPlatform\Request;

use ky\MiniPlatform\RequestCheckUtil;

class WxOpenSetWeAppSupportVersion
{
    private $url = "https://api.weixin.qq.com/cgi-bin/wxopen/setweappsupportversion";
    private $version;
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
     * 设置version
     * @param string $version
     * @author Jason<dcq@kuryun.cn>
     */
    public function setVersion($version) {
        $this->version = $version;
        $this->postParams['version'] = $version;
    }

    /**
     * 获取version
     * @author Jason<dcq@kuryun.cn>
     */
    public function getVersion() {
        return $this->version;
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
        RequestCheckUtil::checkNotNull($this->version, "version");
    }
}