<?php
/**
 * Created by PhpStorm.
 * Script Name: ComponentRebindAdmin.php
 * Create: 2018/8/30 14:03
 * Description: 第三方平台调用快速注册API完成管理员换绑
 * Author: Jason<dcq@kuryun.cn>
 */
namespace ky\MiniPlatform\Request;

use ky\MiniPlatform\RequestCheckUtil;

class ComponentRebindAdmin
{
    private $url = "https://api.weixin.qq.com/cgi-bin/account/componentrebindadmin";
    private $taskId; //换绑管理员任务序列号(公众平台最终点击提交回跳到第三方平台时携带)
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
     * 设置taskId
     * @param string $taskId
     * @author Jason<dcq@kuryun.cn>
     */
    public function setTaskId($taskId) {
        $this->taskId = $taskId;
        $this->postParams['taskId'] = $taskId;
    }

    /**
     * 获取taskId
     * @author Jason<dcq@kuryun.cn>
     */
    public function getTaskId() {
        return $this->taskId;
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
        RequestCheckUtil::checkNotNull($this->taskId, "taskId");
    }
}