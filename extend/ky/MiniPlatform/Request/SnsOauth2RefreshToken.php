<?php
/**
 * Created by PhpStorm.
 * Script Name: SnsOauth2AccessToken.php
 * Create: 2019/12/12 16:28
 * Description: 网站应用微信登录code刷新access_token有效期接口
 * Author: Jason<dcq@kuryun.cn>
 */

namespace ky\MiniPlatform\Request;

use ky\MiniPlatform\RequestCheckUtil;

class SnsOauth2RefreshToken
{
    private $url = "https://api.weixin.qq.com/sns/oauth2/refresh_token";
    private $appid;  //网站应用appid，应用唯一标识，在微信开放平台提交应用审核通过后获得
    private $grant_type; //填authorization_code
    private $refresh_token; //填写通过access_token获取到的refresh_token参数
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
     * 设置refresh_token
     * @param string $appid
     * @author Jason<dcq@kuryun.cn>
     */
    public function setRefreshToken($refresh_token) {
        $this->refresh_token = $refresh_token;
        $this->getParams['refresh_token'] = $refresh_token;
    }

    /**
     * 获取refresh_token
     * @author Jason<dcq@kuryun.cn>
     */
    public function getRefreshToken() {
        return $this->refresh_token;
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
        RequestCheckUtil::checkNotNull($this->refresh_token, "refresh_token");
        RequestCheckUtil::checkNotNull($this->grant_type, "grant_type");
    }
}