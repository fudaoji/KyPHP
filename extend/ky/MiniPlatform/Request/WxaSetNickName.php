<?php
/**
 * Created by PhpStorm.
 * Script Name: WxaSetNickNameame.php
 * Create: 2018/8/30 13:49
 * Description: 小程序名称设置及改名
 * Author: Jason<dcq@kuryun.cn>
 */
namespace ky\MiniPlatform\Request;

use ky\MiniPlatform\RequestCheckUtil;

class WxaSetNickName
{
    private $url = "https://api.weixin.qq.com/wxa/setnickname";
    private $nickName;  //昵称
    private $idCard;  //身份证照片–临时素材mediaid
    private $license; //组织机构代码证或营业执照–临时素材mediaid
    private $namingOtherStuff_1;  //其他证明材料---临时素材 mediaid  选填
    private $namingOtherStuff_2;
    private $namingOtherStuff_3;
    private $namingOtherStuff_4;
    private $namingOtherStuff_5;
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
        $this->postParams['nickName'] = $nickName;
    }

    /**
     * 获取nickName
     * @author Jason<dcq@kuryun.cn>
     */
    public function getNickName() {
        return $this->nickName;
    }

    /**
     * 设置idCard
     * @param string $idCard
     * @author Jason<dcq@kuryun.cn>
     */
    public function setIdCard($idCard) {
        $this->idCard = $idCard;
        $this->postParams['idCard'] = $idCard;
    }

    /**
     * 获取idCard
     * @author Jason<dcq@kuryun.cn>
     */
    public function getIdCard() {
        return $this->idCard;
    }

    /**
     * 设置license
     * @param string $license
     * @author Jason<dcq@kuryun.cn>
     */
    public function setLicense($license) {
        $this->license = $license;
        $this->postParams['license'] = $license;
    }

    /**
     * 获取license
     * @author Jason<dcq@kuryun.cn>
     */
    public function getLicense() {
        return $this->license;
    }

    /**
     * 设置namingOtherStuff_1
     * @param string $namingOtherStuff_1
     * @author Jason<dcq@kuryun.cn>
     */
    public function setNamingOtherStuff_1($namingOtherStuff_1) {
        $this->namingOtherStuff_1 = $namingOtherStuff_1;
        $this->postParams['naming_other_stuff_1'] = $namingOtherStuff_1;
    }

    /**
     * 获取namingOtherStuff_1
     * @author Jason<dcq@kuryun.cn>
     */
    public function getNamingOtherStuff_1() {
        return $this->namingOtherStuff_1;
    }

    /**
     * 设置namingOtherStuff_2
     * @param string $namingOtherStuff_2
     * @author Jason<dcq@kuryun.cn>
     */
    public function setNamingOtherStuff_2($namingOtherStuff_2) {
        $this->namingOtherStuff_2 = $namingOtherStuff_2;
        $this->postParams['naming_other_stuff_2'] = $namingOtherStuff_2;
    }

    /**
     * 获取namingOtherStuff_2
     * @author Jason<dcq@kuryun.cn>
     */
    public function getNamingOtherStuff_2() {
        return $this->namingOtherStuff_2;
    }

    /**
     * 设置namingOtherStuff_3
     * @param string $namingOtherStuff_3
     * @author Jason<dcq@kuryun.cn>
     */
    public function setNamingOtherStuff_3($namingOtherStuff_3) {
        $this->namingOtherStuff_3 = $namingOtherStuff_3;
        $this->postParams['naming_other_stuff_3'] = $namingOtherStuff_3;
    }

    /**
     * 获取namingOtherStuff_3
     * @author Jason<dcq@kuryun.cn>
     */
    public function getNamingOtherStuff_3() {
        return $this->namingOtherStuff_3;
    }

    /**
     * 设置namingOtherStuff_4
     * @param string $namingOtherStuff_4
     * @author Jason<dcq@kuryun.cn>
     */
    public function setNamingOtherStuff_4($namingOtherStuff_4) {
        $this->namingOtherStuff_4 = $namingOtherStuff_4;
        $this->postParams['naming_other_stuff_4'] = $namingOtherStuff_4;
    }

    /**
     * 获取namingOtherStuff_4
     * @author Jason<dcq@kuryun.cn>
     */
    public function getNamingOtherStuff_4() {
        return $this->namingOtherStuff_4;
    }

    /**
     * 设置namingOtherStuff_5
     * @param string $namingOtherStuff_5
     * @author Jason<dcq@kuryun.cn>
     */
    public function setNamingOtherStuff_5($namingOtherStuff_5) {
        $this->namingOtherStuff_5 = $namingOtherStuff_5;
        $this->postParams['naming_other_stuff_5'] = $namingOtherStuff_5;
    }

    /**
     * 获取namingOtherStuff_5
     * @author Jason<dcq@kuryun.cn>
     */
    public function getNamingOtherStuff_5() {
        return $this->namingOtherStuff_5;
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
        RequestCheckUtil::checkNotNull($this->idCard, "idCard");
        RequestCheckUtil::checkNotNull($this->license, "license");
    }
}