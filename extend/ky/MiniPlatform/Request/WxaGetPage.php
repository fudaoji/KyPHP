<?php
/**
 * Created by PhpStorm.
 * Script Name: WxaGetPage.php
 * Create: 2018/9/3 18:01
 * Description: 获取小程序的第三方提交代码的页面配置
 * Author: Jason<dcq@kuryun.cn>
 */
namespace ky\MiniPlatform\Request;

class WxaGetPage
{
    private $url = "https://api.weixin.qq.com/wxa/get_page";
    private $getParams = array();
    private $postParams = array();
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