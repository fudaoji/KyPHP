<?php
/**
 * Created by PhpStorm.
 * Script Name: WxaCommit.php
 * Create: 2018/9/3 17:04
 * Description: 为授权的小程序帐号上传小程序代码
 * @link https://developers.weixin.qq.com/doc/oplatform/Third-party_Platforms/Mini_Programs/code/commit.html
 * Author: Jason<dcq@kuryun.cn>
 */
namespace ky\MiniPlatform\Request;

use ky\MiniPlatform\RequestCheckUtil;

class WxaCommit
{
    private $url = "https://api.weixin.qq.com/wxa/commit";
    private $templateId; //代码库中的代码模版ID
    private $extJson; //第三方自定义的配置
    private $userVersion; //代码版本号，开发者可自定义
    private $userDesc; //代码描述，开发者可自定义
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
     * 设置templateId
     * @param string $templateId
     * @author Jason<dcq@kuryun.cn>
     */
    public function setTemplateId($templateId) {
        $this->templateId = $templateId;
        $this->postParams['template_id'] = $templateId;
    }

    /**
     * 获取templateId
     * @author Jason<dcq@kuryun.cn>
     */
    public function getTemplateId() {
        return $this->templateId;
    }

    /**
     * 设置extJson
     * @param string $extJson
     * @author Jason<dcq@kuryun.cn>
     */
    public function setExtJson($extJson) {
        $this->extJson = $extJson;
        $this->postParams['ext_json']= $extJson;
    }

    /**
     * 获取extJson
     * @author Jason<dcq@kuryun.cn>
     */
    public function getExtJson() {
        return $this->extJson;
    }

    /**
     * 设置userVersion
     * @param string $userVersion
     * @author Jason<dcq@kuryun.cn>
     */
    public function setUserVersion($userVersion) {
        $this->userVersion = $userVersion;
        $this->postParams['user_version'] = $userVersion;
    }

    /**
     * 获取userVersion
     * @author Jason<dcq@kuryun.cn>
     */
    public function getUserVersion() {
        return $this->userVersion;
    }

    /**
     * 设置userDesc
     * @param string $userDesc
     * @author Jason<dcq@kuryun.cn>
     */
    public function setUserDesc($userDesc) {
        $this->userDesc = $userDesc;
        $this->postParams['user_desc'] = $userDesc;
    }

    /**
     * 获取userDesc
     * @author Jason<dcq@kuryun.cn>
     */
    public function getUserDesc() {
        return $this->userDesc;
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
        RequestCheckUtil::checkNotNull($this->templateId, "templateId");
        RequestCheckUtil::checkNotNull($this->extJson, "extJson");
        RequestCheckUtil::checkNotNull($this->userVersion, "userVersion");
        RequestCheckUtil::checkNotNull($this->userDesc, "userDesc");
    }
}