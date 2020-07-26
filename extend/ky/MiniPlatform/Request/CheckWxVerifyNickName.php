<?php
/**
 * Created by PhpStorm.
 * Script Name: CheckWxVerifyNickName.php
 * Create: 2018/8/30 13:56
 * Description: 微信认证名称检测
 * Author: Jason<dcq@kuryun.cn>
 */
namespace ky\MiniPlatform\Request;

use ky\MiniPlatform\RequestCheckUtil;

class CheckWxVerifyNickName
{
    private $url = "https://api.weixin.qq.com/cgi-bin/wxverify/checkwxverifynickname";
    private $nickName;  //名称（昵称）
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
     * 设置nickName
     * @param string $nickName
     * @author Jason<dcq@kuryun.cn>
     */
    public function setNickName($nickName) {
        $this->nickName = $nickName;
        $this->postParams['nick_name'] = $nickName;
    }

    /**
     * 获取nickName
     * @author Jason<dcq@kuryun.cn>
     */
    public function getNickName() {
        return $this->nickName;
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
        RequestCheckUtil::checkNotNull($this->nickName, "nickName");
    }
}