<?php
/**
 * Created by PhpStorm.
 * Script Name: SnsOauth2AccessToken.php
 * Create: 2019/12/12 16:28
 * Description: 网站应用微信登录code换取access_token接口
 * Author: Jason<dcq@kuryun.cn>
 */
namespace ky\MiniPlatform\Request;

use ky\MiniPlatform\RequestCheckUtil;

class SnsOauth2AccessToken
{
    private $url = "https://api.weixin.qq.com/sns/oauth2/access_token";
    private $appid;  //网站应用appid，应用唯一标识，在微信开放平台提交应用审核通过后获得
    private $secret; //应用密钥AppSecret，在微信开放平台提交应用审核通过后获得
    private $code; //填写第一步获取的code参数
    private $grant_type; //填authorization_code
    private $getParams = array();
    private $postParams = array();

    /**
     * 获取请求url
     * @author Jason<dcq@kuryun.cn>
     */
    public function getUrl() {
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
     * 设置appid
     * @param string $appid
     * @author Jason<dcq@kuryun.cn>
     */
    public function setAppid($appid) {
        $this->appid = $appid;
        $this->getParams['appid'] = $appid;
    }

    /**
     * 获取appid
     * @author Jason<dcq@kuryun.cn>
     */
    public function getAppid() {
        return $this->appid;
    }

    /**
     * 设置secret
     * @param string $appid
     * @author Jason<dcq@kuryun.cn>
     */
    public function setSecret($secret) {
        $this->secret = $secret;
        $this->getParams['secret'] = $secret;
    }

    /**
     * 获取secret
     * @author Jason<dcq@kuryun.cn>
     */
    public function getSecret() {
        return $this->secret;
    }

    /**
     * 设置code
     * @param string $appid
     * @author Jason<dcq@kuryun.cn>
     */
    public function setCode($code) {
        $this->code = $code;
        $this->getParams['code'] = $code;
    }

    /**
     * 获取code
     * @author Jason<dcq@kuryun.cn>
     */
    public function getCode() {
        return $this->code;
    }

    /**
     * 设置grant_type
     * @param string $grant_type
     * @author Jason<dcq@kuryun.cn>
     */
    public function setGrantType($grant_type) {
        $this->grant_type = $grant_type;
        $this->getParams['grant_type'] = $grant_type;
    }

    /**
     * 获取grant_type
     * @author Jason<dcq@kuryun.cn>
     */
    public function getGrantType() {
        return $this->grant_type;
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
        RequestCheckUtil::checkNotNull($this->appid, "appid");
        RequestCheckUtil::checkNotNull($this->secret, "secret");
        RequestCheckUtil::checkNotNull($this->code, "code");
        RequestCheckUtil::checkNotNull($this->grant_type, "grant_type");
    }
}