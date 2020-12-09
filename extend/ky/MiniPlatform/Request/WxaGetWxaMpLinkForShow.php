<?php
/**
 * Created by PhpStorm.
 * Script Name: WxaGetWxaMpLinkForShow.php
 * Create: 2020/11/17 11:12
 * Description: 获取可以用来设置的公众号列表
 * @link https://developers.weixin.qq.com/doc/oplatform/Third-party_Platforms/Mini_Programs/subscribe_component/getwxamplinkforshow.html
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace ky\MiniPlatform\Request;

use ky\MiniPlatform\RequestCheckUtil;

class WxaGetWxaMpLinkForShow
{
    private $url = "https://api.weixin.qq.com/wxa/getwxamplinkforshow";
    private $getParams = array();
    private $postParams = array();
    private $page;  //当前页
    private $num;  //每页显示数量

    /**
     * 设置page
     * @param int $page
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function setPage($page) {
        $this->page= $page;
        $this->getParams['page'] = $page;
    }

    /**
     * 获取page
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function getPage() {
        return $this->page;
    }

    /**
     * 设置num
     * @param int $num
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function setNum($num) {
        $this->num= $num;
        $this->getParams['num'] = $num;
    }

    /**
     * 获取num
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function getNum() {
        return $this->num;
    }

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

    /**
     * 参数验证
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function check() {
        RequestCheckUtil::checkNumberic($this->page, "page");
        RequestCheckUtil::checkNumberic($this->num, "num");
    }
}