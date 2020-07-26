<?php
/**
 * Created by PhpStorm.
 * Script Name: WxOpenAddCategorytegory.php
 * Create: 2018/8/30 14:06
 * Description: 添加类目
 * Author: Jason<dcq@kuryun.cn>
 */
namespace ky\MiniPlatform\Request;

use ky\MiniPlatform\RequestCheckUtil;

class WxOpenAddCategory
{
    private $url = "https://api.weixin.qq.com/cgi-bin/wxopen/addcategory";
    private $first; //一级类目ID
    private $second; //二级类目ID
    private $key; //资质名称
    private $value; //资质图片
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
     * 设置first
     * @param string $first
     * @author Jason<dcq@kuryun.cn>
     */
    public function setFirst($first) {
        $this->first = $first;
        $this->postParams['categories']['first'] = $first;
    }

    /**
     * 获取first
     * @author Jason<dcq@kuryun.cn>
     */
    public function getFirst() {
        return $this->first;
    }

    /**
     * 设置second
     * @param string $second
     * @author Jason<dcq@kuryun.cn>
     */
    public function setSecond($second) {
        $this->first = $second;
        $this->postParams['categories']['second'] = $second;
    }

    /**
     * 获取second
     * @author Jason<dcq@kuryun.cn>
     */
    public function getSecond() {
        return $this->second;
    }

    /**
     * 设置key
     * @param string $key
     * @author Jason<dcq@kuryun.cn>
     */
    public function setKey($key) {
        $this->key = $key;
        $this->postParams['categories']['certicates']['key'] = $key;
    }

    /**
     * 获取key
     * @author Jason<dcq@kuryun.cn>
     */
    public function getKey() {
        return $this->key;
    }

    /**
     * 设置value
     * @param string $value
     * @author Jason<dcq@kuryun.cn>
     */
    public function setValue($value) {
        $this->value= $value;
        $this->postParams['categories']['certicates']['value'] = $value;
    }

    /**
     * 获取value
     * @author Jason<dcq@kuryun.cn>
     */
    public function getValue() {
        return $this->value;
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
        RequestCheckUtil::checkNotNull($this->first, "first");
        RequestCheckUtil::checkNotNull($this->second, "second");
        RequestCheckUtil::checkNotNull($this->key, "key");
        RequestCheckUtil::checkNotNull($this->value, "value");
    }
}