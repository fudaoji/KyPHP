<?php
// +----------------------------------------------------------------------
// | [KyPHP System] Copyright (c) 2020 http://www.kuryun.com/
// +----------------------------------------------------------------------
// | [KyPHP] 并不是自由软件,你可免费使用,未经许可不能去掉KyPHP相关版权
// +----------------------------------------------------------------------
// | Author: fudaoji <fdj@kuryun.cn>
// +----------------------------------------------------------------------
/**
 * Created by PhpStorm.
 * Script Name: WxaDeleteTemplate.php
 * Create: 2018/8/30 14:12
 * Description: 删除指定代码模板
 * @link  https://developers.weixin.qq.com/doc/oplatform/Third-party_Platforms/Mini_Programs/code_template/deletetemplate.html
 * Author: fudaoji<fdj@kuryun.cn>
 */
namespace ky\MiniPlatform\Request;

use ky\MiniPlatform\RequestCheckUtil;

class WxaDeleteTemplate
{
    private $url = "https://api.weixin.qq.com/wxa/deletetemplate";
    private $templateId;
    private $getParams = array();
    private $postParams = array();

    /**
     * 获取请求url
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function getUrl(){
        return $this->url;
    }

    /**
     * 设置请求地址
     * @param string $url
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function setUrl($url) {
        $this->url = $url;
    }

    /**
     * 设置draft_id
     * @param string $template_id
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function setTemplateId($template_id) {
        $this->templateId = $template_id;
        $this->postParams['template_id'] = $template_id;
    }

    /**
     * 获取$template_id
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function getTemplateId() {
        return $this->templateId;
    }

    /**
     * get请求参数
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function getParams() {
        return $this->getParams;
    }

    /**
     * post请求参数
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function postParams() {
        return $this->postParams;
    }

    /**
     * 参数验证
     * @throws \Exception
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function check() {
        RequestCheckUtil::checkNotNull($this->templateId, "templateId");
    }
}