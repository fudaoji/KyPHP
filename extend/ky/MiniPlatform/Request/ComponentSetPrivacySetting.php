<?php
/**
 * Created by PhpStorm.
 * Script Name: ComponentGetPrivacySetting.php
 * Create: 2021/11/11 09:24
 * Description: 查询小程序用户隐私保护指引
 * link: https://developers.weixin.qq.com/doc/oplatform/Third-party_Platforms/2.0/api/privacy_config/get_privacy_setting.html
 * Author: fdj<fdj@kuryun.cn>
 */
namespace ky\MiniPlatform\Request;

use ky\Logger;

class ComponentSetPrivacySetting
{
    private $url = "https://api.weixin.qq.com/cgi-bin/component/setprivacysetting";
    private $getParams = array();
    private $postParams = array('{}');
    private $ownerSetting = [];
    private $settingList = [];

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

    public function getOwnerSetting(){
        return $this->ownerSetting;
    }

    public function setOwnerSetting($owner_setting = []){
        $this->ownerSetting = $owner_setting;
        $this->postParams['owner_setting'] = $owner_setting;
    }
    public function getSettingList(){
        return $this->settingList;
    }
    public function setSettingList($setting_list = []){
        $this->settingList = $setting_list;
        $this->postParams['setting_list'] = $setting_list;
    }

    /**
     * 参数验证
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function check() {
        $this->checkOwnerSetting();
    }

    private function checkOwnerSetting(){
        if((empty($this->ownerSetting['contact_email']) && empty($this->ownerSetting['contact_qq'])
            && empty($this->ownerSetting['contact_phone']) && empty($this->ownerSetting['contact_weixin'])) || empty($this->ownerSetting['notice_method'])){
            Logger::setMsgAndCode("缺少必要参数: owner_setting" );
        }
    }
}