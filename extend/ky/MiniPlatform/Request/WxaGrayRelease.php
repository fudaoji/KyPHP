<?php
/**
 * Created by PhpStorm.
 * Script Name: WxaGrayRelease.php
 * Create: 2018/9/4 14:56
 * Description: 小程序分阶段发布--分阶段发布接口
 * Author: Jason<dcq@kuryun.cn>
 */
namespace ky\MiniPlatform\Request;

use ky\MiniPlatform\RequestCheckUtil;

class WxaGrayRelease
{
    private $url = "https://api.weixin.qq.com/wxa/grayrelease";
    private $grayPercentage;   //灰度的百分比，1到100的整数
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
     * 设置grayPercentage
     * @param string $grayPercentage
     * @author Jason<dcq@kuryun.cn>
     */
    public function setGrayPercentage($grayPercentage) {
        $this->grayPercentage = $grayPercentage;
        $this->postParams['gray_percentage'] = $grayPercentage;
    }

    /**
     * 获取grayPercentage
     * @author Jason<dcq@kuryun.cn>
     */
    public function getGrayPercentage() {
        return $this->grayPercentage;
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
        RequestCheckUtil::checkNotNull($this->grayPercentage, "grayPercentage");
    }
}