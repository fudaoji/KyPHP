<?php
/**
 * Created by PhpStorm.
 * Script Name: WxaUndoCodeAudit.php
 * Create: 2018/9/4 14:54
 * Description: 小程序审核撤回
 * @link https://developers.weixin.qq.com/doc/oplatform/Third-party_Platforms/Mini_Programs/code/undocodeaudit.html
 * Author: Jason<dcq@kuryun.cn>
 */
namespace ky\MiniPlatform\Request;

class WxaUndoCodeAudit
{
    private $url = "https://api.weixin.qq.com/wxa/undocodeaudit";
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