<?php
/**
 * Created by PhpStorm.
 * Script Name: WxOpenQrCodeJumpAdd.php
 * Create: 2018/9/4 17:25
 * Description:设置小程序“扫普通链接二维码打开小程序”能力--增加或修改二维码规则
 * Author: Jason<dcq@kuryun.cn>
 */
namespace ky\MiniPlatform\Request;

use ky\MiniPlatform\RequestCheckUtil;

class WxOpenQrCodeJumpAdd
{
    private $url = "https://api.weixin.qq.com/cgi-bin/wxopen/qrcodejumpadd";
    private $prefix;
    private $permitSubRule;
    private $path;
    private $openVersion;
    private $debugUrl = array();
    private $isEdit;
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
     * 设置prefix
     * @param string $prefix
     * @author Jason<dcq@kuryun.cn>
     */
    public function setPrefix($prefix) {
        $this->prefix = $prefix;
        $this->postParams['prefix'] = $prefix;
    }

    /**
     * 获取prefix
     * @author Jason<dcq@kuryun.cn>
     */
    public function getPrefix() {
        return $this->prefix;
    }

    /**
     * 设置permitSubRule
     * @param string $permitSubRule
     * @author Jason<dcq@kuryun.cn>
     */
    public function setPermitSubRule($permitSubRule) {
        $this->prefix = $permitSubRule;
        $this->postParams['permit_sub_rule'] = $permitSubRule;
    }

    /**
     * 获取permitSubRule
     * @author Jason<dcq@kuryun.cn>
     */
    public function getPermitSubRule() {
        return $this->permitSubRule;
    }

    /**
     * 设置path
     * @param string $path
     * @author Jason<dcq@kuryun.cn>
     */
    public function setPath($path) {
        $this->path = $path;
        $this->postParams['path'] = $path;
    }

    /**
     * 获取path
     * @author Jason<dcq@kuryun.cn>
     */
    public function getPath() {
        return $this->path;
    }

    /**
     * 设置openVersion
     * @param string $openVersion
     * @author Jason<dcq@kuryun.cn>
     */
    public function setOpenVersion($openVersion) {
        $this->openVersion = $openVersion;
        $this->postParams['open_version'] = $openVersion;
    }

    /**
     * 获取openVersion
     * @author Jason<dcq@kuryun.cn>
     */
    public function getOpenVersion() {
        return $this->openVersion;
    }

    /**
     * 设置debugUrl
     * @param string $debugUrl
     * @author Jason<dcq@kuryun.cn>
     */
    public function setDebugUrl($debugUrl) {
        $this->debugUrl = $debugUrl;
        $this->postParams['debug_url'] = $debugUrl;
    }

    /**
     * 获取debugUrl
     * @author Jason<dcq@kuryun.cn>
     */
    public function getDebugUrl() {
        return $this->debugUrl;
    }

    /**
     * 设置isEdit
     * @param string $isEdit
     * @author Jason<dcq@kuryun.cn>
     */
    public function setIsEdit($isEdit) {
        $this->isEdit = $isEdit;
        $this->postParams['is_edit'] = $isEdit;
    }

    /**
     * 获取isEdit
     * @author Jason<dcq@kuryun.cn>
     */
    public function getIsEdit() {
        return $this->isEdit;
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
        RequestCheckUtil::checkNotNull($this->prefix, "prefix");
        RequestCheckUtil::checkNotNull($this->permitSubRule, "permitSubRule");
        RequestCheckUtil::checkNotNull($this->path, "path");
        RequestCheckUtil::checkNotNull($this->openVersion, "openVersion");
        RequestCheckUtil::checkArray($this->debugUrl, "debugUrl");
        RequestCheckUtil::checkNotNull($this->isEdit, "isEdit");
    }
}