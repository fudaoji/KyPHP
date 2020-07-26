<?php
/**
 * Created by PhpStorm.
 * Script Name: WxOpenQrCodeJumpGet.php
 * Create: 2018/9/4 20:16
 * Description: 设置小程序“扫普通链接二维码打开小程序”能力--获取已设置的二维码规则
 * Author: Jason<dcq@kuryun.cn>
 */
namespace ky\MiniPlatform\Request;

class WxOpenQrCodeJumpGet
{
    private $url = "https://api.weixin.qq.com/cgi-bin/wxopen/qrcodejumpget";
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