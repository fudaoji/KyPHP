<?php
/**
 * Created by PhpStorm.
 * Script Name: WxaGetGrayReleasePlan.php
 * Create: 2018/9/4 15:15
 * Description: 小程序分阶段发布--查询当前分阶段发布详情
 * Author: Jason<dcq@kuryun.cn>
 */
namespace ky\MiniPlatform\Request;

class WxaGetGrayReleasePlan
{
    private $url = "https://api.weixin.qq.com/wxa/getgrayreleaseplan";
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