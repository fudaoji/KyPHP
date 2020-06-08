<?php
/**
 * Created by PhpStorm.
 * Script Name: WechatMp.php
 * Create: 2020/4/15 11:03
 * Description: 微信公众号基类
 * Author: fudaoji<fdj@kuryun.cn>
 */
namespace app\common\controller;

class WechatMp extends BaseCtl
{
    protected $openPlatform;
    protected $mpApp;
    protected $mpInfo;
    /**
     * @var \think\Model
     */
    protected $mpM;
    protected $appId;

    /**
     * 构造函数
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function __construct() {
        parent::initialize();
        $this->appId = input('appid', '');
        $this->mpM = model('mp');
        $this->setMpInfo();
        $this->setApp();
    }

    /**
     * 设置微信公众号信息
     * @author fudaoji<fdj@kuryun.cn>
     */
    protected function setMpInfo() {
        $this->mpInfo = $this->mpM->getOneByMap(['appid' => $this->appId]);
    }

    /**
     * 设置授权公众号应用
     * @author fudaoji<fdj@kuryun.cn>
     */
    protected function setApp() {
        if($this->mpInfo) {
            $this->mpApp = controller('mp', 'event')->getApp($this->mpInfo);
        }
        $this->openPlatform = controller('mp', 'event')->getOpenPlatform();
    }
}