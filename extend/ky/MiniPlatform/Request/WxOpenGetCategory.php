<?php
/**
 * Created by PhpStorm.
 * Script Name: WxOpenGetCategory.phpry.php
 * Create: 2018/8/30 14:09
 * Description: 获取账号已经设置的所有类目
 * Author: Jason<dcq@kuryun.cn>
 */
namespace ky\MiniPlatform\Request;

class WxOpenGetCategory
{
    private $url = "https://api.weixin.qq.com/cgi-bin/wxopen/getcategory";
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