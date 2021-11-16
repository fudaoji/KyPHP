<?php
/**
 * Created by PhpStorm.
 * Script Name: ComponentGetPrivacySetting.php
 * Create: 2021/11/11 09:24
 * Description: 查询小程序用户隐私保护指引
 * link: https://developers.weixin.qq.com/doc/oplatform/Third-party_Platforms/2.0/api/privacy_config/get_privacy_setting.html
 * Author: fdj<fdj@kuryun.cn>
 */
namespace ky\MiniPlatform\Request;

class ComponentGetPrivacySetting
{
    private $url = "https://api.weixin.qq.com/cgi-bin/component/getprivacysetting";
    private $getParams = array();
    private $postParams = array('{}');
    public $checkRequest = false;

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
}