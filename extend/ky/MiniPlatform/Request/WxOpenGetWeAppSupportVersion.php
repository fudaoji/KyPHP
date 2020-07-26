<?php
/**
 * Created by PhpStorm.
 * Script Name: WxOpenGetWeAppSupportVersion.php
 * Create: 2018/9/4 14:40
 * Description:查询当前设置的最低基础库版本及各版本用户占比
 * Author: Jason<dcq@kuryun.cn>
 */
namespace ky\MiniPlatform\Request;

class WxOpenGetWeAppSupportVersion
{
    private $url = "https://api.weixin.qq.com/cgi-bin/wxopen/getweappsupportversion";
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