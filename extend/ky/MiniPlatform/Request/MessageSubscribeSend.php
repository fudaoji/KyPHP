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
 * Script Name: MessageSubscribeSend.php
 * Create: 2021/09/01 14:12
 * Description: 发送订阅消息
 * @link  https://developers.weixin.qq.com/miniprogram/dev/api-backend/open-api/subscribe-message/subscribeMessage.send.html
 * Author: fudaoji<fdj@kuryun.cn>
 */
namespace ky\MiniPlatform\Request;

use ky\MiniPlatform\RequestCheckUtil;

class MessageSubscribeSend
{
    private $url = "https://api.weixin.qq.com/cgi-bin/message/subscribe/send";
    private $toUser;
    private $templateId;
    private $page;
    private $data;
    private $miniprogramState;
    private $lang;
    private $getParams = array();
    private $postParams = array();

    /**
     * Author: fudaoji<fdj@kuryun.cn>
     * @return mixed
     */
    public function getTemplateId()
    {
        return $this->templateId;
    }

    /**
     * @param mixed $templateId
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function setTemplateId($templateId)
    {
        $this->templateId = $templateId;
        $this->postParams['template_id'] = $templateId;
    }

    /**
     * Author: fudaoji<fdj@kuryun.cn>
     * @return mixed
     */
    public function getPage()
    {
        return $this->page;
    }

    /**
     * @param mixed $page
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function setPage($page)
    {
        $this->page = $page;
        $this->postParams['page'] = $page;
    }

    /**
     * Author: fudaoji<fdj@kuryun.cn>
     * @return mixed
     */
    public function getData()
    {
        return $this->data;
    }

    /**
     * @param mixed $data
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function setData($data)
    {
        $this->data = $data;
        $this->postParams['data'] = $data;
    }

    /**
     * Author: fudaoji<fdj@kuryun.cn>
     * @return mixed
     */
    public function getMiniprogramState()
    {
        return $this->miniprogramState;
    }

    /**
     * @param mixed $miniprogramState
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function setMiniprogramState($miniprogramState)
    {
        $this->miniprogramState = $miniprogramState;
        $this->postParams['miniprogram_state'] = $miniprogramState;
    }

    /**
     * Author: fudaoji<fdj@kuryun.cn>
     * @return mixed
     */
    public function getLang()
    {
        return $this->lang;
    }

    /**
     * @param mixed $lang
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function setLang($lang)
    {
        $this->lang = $lang;
        $this->postParams['lang'] = $lang;
    }



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
     * 设置toUser
     * @param string $toUser
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function setToUser($toUser = '') {
        $this->toUser = $toUser;
        $this->postParams['touser'] = $toUser;
    }

    /**
     * 获取toUser
     * Author fudaoji<fdj@kuryun.cn>
     */
    public function getToUser() {
        return $this->toUser;
    }

    /**
     * get请求参数
     * Author fudaoji<fdj@kuryun.cn>
     */
    public function getParams() {
        return $this->getParams;
    }

    /**
     * post请求参数
     * Author fudaoji<fdj@kuryun.cn>
     */
    public function postParams() {
        return $this->postParams;
    }

    /**
     * 参数验证
     * Author fudaoji<fdj@kuryun.cn>
     */
    public function check() {
        RequestCheckUtil::checkNotNull($this->toUser, "toUser");
        RequestCheckUtil::checkNotNull($this->templateId, "templateId");
        RequestCheckUtil::checkArray($this->data, "data");
    }
}