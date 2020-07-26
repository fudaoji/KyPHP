<?php
/**
 * Created by PhpStorm.
 * Script Name: WxaChangeVisitStatus.php
 * Create: 2018/9/4 14:32
 * Description: 修改小程序线上代码的可见状态
 * Author: Jason<dcq@kuryun.cn>
 */
namespace ky\MiniPlatform\Request;

use ky\MiniPlatform\RequestCheckUtil;

class WxaChangeVisitStatus
{
    private $url = "https://api.weixin.qq.com/wxa/change_visitstatus";
    private $action;
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
     * 设置action
     * @param string $action
     * @author Jason<dcq@kuryun.cn>
     */
    public function setAction($action) {
        $this->action = $action;
        $this->postParams['action'] = $action;
    }

    /**
     * 获取action
     * @author Jason<dcq@kuryun.cn>
     */
    public function getAction() {
        return $this->action;
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
        RequestCheckUtil::checkNotNull($this->action, "action");
    }
}