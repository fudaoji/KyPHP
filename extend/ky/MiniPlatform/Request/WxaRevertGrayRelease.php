<?php
/**
 * Created by PhpStorm.
 * Script Name: WxaRevertGrayRelease.php
 * Create: 2018/9/4 15:05
 * Description: 小程序分阶段发布--取消分阶段发布
 * Author: Jason<dcq@kuryun.cn>
 */
namespace ky\MiniPlatform\Request;

class WxaRevertGrayRelease
{
    private $url = "https://api.weixin.qq.com/wxa/revertgrayrelease";
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