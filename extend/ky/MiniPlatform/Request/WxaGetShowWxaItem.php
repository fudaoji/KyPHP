<?php
/**
 * Created by PhpStorm.
 * Script Name: WxaGetShowWxaItem.php
 * Create: 2020/11/17 11:12
 * Description: 获取展示的公众号信息
 * @link https://developers.weixin.qq.com/doc/oplatform/Third-party_Platforms/Mini_Programs/subscribe_component/getshowwxaitem.html
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace ky\MiniPlatform\Request;

class WxaGetShowWxaItem
{
    private $url = "https://api.weixin.qq.com/wxa/getshowwxaitem";
    private $getParams = array();
    private $postParams = array();

    /**
     * 获取请求url
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function getUrl(){
        return $this->url;
    }

    /**
     * 设置请求地址
     * @param string $url
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function setUrl($url) {
        $this->url = $url;
    }

    /**
     * get请求参数
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function getParams() {
        return $this->getParams;
    }

    /**
     * post请求参数
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function postParams() {
        return $this->postParams;
    }
}