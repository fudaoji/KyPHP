<?php
/**
 * Created by PhpStorm.
 * Script Name: WxaSetWebViewDomain.phpphp
 * Create: 2018/8/30 13:41
 * Description: 设置小程序业务域名（仅供第三方代小程序调用）
 * Author: Jason<dcq@kuryun.cn>
 */
namespace ky\MiniPlatform\Request;

use ky\MiniPlatform\RequestCheckUtil;

class WxaSetWebViewDomain
{
    private $url = "https://api.weixin.qq.com/wxa/setwebviewdomain";
    private $action; //add添加, delete删除, set覆盖, get获取。当参数是get时不需要填webviewdomain字段。
    private $webViewDomain = array();  //小程序业务域名，当action参数是get时不需要此字段
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
     * 设置webViewDomain
     * @param string/array $webViewDomain
     * @author Jason<dcq@kuryun.cn>
     */
    public function setWebViewDomain($webViewDomain) {
        $this->webViewDomain = $webViewDomain;
        $this->postParams['webviewdomain'] = $webViewDomain;
    }

    /**
     * 获取webViewDomain
     * @author Jason<dcq@kuryun.cn>
     */
    public function getWebViewDomain() {
        return $this->webViewDomain;
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
        RequestCheckUtil::checkArray($this->webViewDomain, 'webViewDomain');
    }
}