<?php
// +----------------------------------------------------------------------
// | [KyPHP System] Copyright (c) 2020 http://www.kuryun.com/
// +----------------------------------------------------------------------
// | [KyPHP] 并不是自由软件,你可免费使用,未经许可不能去掉KyPHP相关版权
// +----------------------------------------------------------------------
// | Author: fudaoji <fdj@kuryun.cn>
// +----------------------------------------------------------------------

/**
 * Created by PhpStorm.
 * Script Name: WxaGetQrcode.php
 * Create: 2020/7/27 下午10:25
 * Description:
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace ky\MiniPlatform\Request;

use ky\MiniPlatform\RequestCheckUtil;

class WxaGetQrcode
{
    private $url = "https://api.weixin.qq.com/wxa/get_qrcode";
    private $page; //页面路径


    private $getParams = array();
    private $postParams = array();
    public $checkRequest = false;

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
     * @return mixed
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function getPage()
    {
        return $this->page;
    }

    /**
     * @param mixed $page
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function setPage($page)
    {
        $this->page = urlencode($page);
        $this->postParams['page'] = $this->page;
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