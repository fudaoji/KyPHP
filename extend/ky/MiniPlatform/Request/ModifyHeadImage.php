<?php
/**
 * Created by PhpStorm.
 * Script Name: ModifyHeadImage.php
 * Create: 2018/8/30 13:57
 * Description: 修改头像
 * Author: Jason<dcq@kuryun.cn>
 */
namespace ky\MiniPlatform\Request;

use ky\MiniPlatform\RequestCheckUtil;

class ModifyHeadImage
{
    private $url = "https://api.weixin.qq.com/cgi-bin/account/modifyheadimage";
    private $headImgMediaId;  //头像素材media_id
    private $x1; //裁剪框左上角x坐标（取值范围：[0, 1]）
    private $y1; //裁剪框左上角y坐标（取值范围：[0, 1]）
    private $x2; //裁剪框右下角x坐标（取值范围：[0, 1]）
    private $y2; //裁剪框右下角y坐标（取值范围：[0, 1]）
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
     * 设置headImgMediaId
     * @param string $headImgMediaId
     * @author Jason<dcq@kuryun.cn>
     */
    public function setHeadImgMediaId($headImgMediaId) {
        $this->headImgMediaId = $headImgMediaId;
        $this->postParams['headImgMediaId'] = $headImgMediaId;
    }

    /**
     * 获取headImgMediaId
     * @author Jason<dcq@kuryun.cn>
     */
    public function getHeadImgMediaId() {
        return $this->headImgMediaId;
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
        RequestCheckUtil::checkNotNull($this->headImgMediaId, "headImgMediaId");
        RequestCheckUtil::checkNotNull($this->x1, "x1");
        RequestCheckUtil::checkNotNull($this->y1, "y1");
        RequestCheckUtil::checkNotNull($this->x2, "x2");
        RequestCheckUtil::checkNotNull($this->y2, "y2");
    }
}