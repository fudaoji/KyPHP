<?php
// +----------------------------------------------------------------------
// | [KyPHP System] Copyright (c) 2020 http://www.kuryun.com/
// +----------------------------------------------------------------------
// | [KyPHP] 并不是自由软件,你可免费使用,未经许可不能去掉KyPHP相关版权
// +----------------------------------------------------------------------
// | Author: fudaoji <461960962@qq.com>
// +----------------------------------------------------------------------
/**
 * Created by PhpStorm.
 * Script Name: Base.php
 * Create: 2020/7/22 18:13
 * Description: Base controller
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\mini\controller;

class Base extends \app\admin\controller\Base
{
    protected $miniId;
    protected $miniInfo;
    protected $miniApp;
    protected $openPlatform;
    protected $needMiniId = true;

    public function initialize(){
        parent::initialize();
        $this->setMiniInfo();
        $this->setApp();
    }

    /**
     * 设置授权公众号应用
     * @author fudaoji<fdj@kuryun.cn>
     */
    protected function setApp() {
        if($this->miniInfo) {
            $this->miniApp = controller('mini/mini', 'event')->getApp($this->miniInfo);
        }
        $this->openPlatform = controller('mini/mini', 'event')->getOpenPlatform();
    }

    /**
     * set mini info
     * @author: fudaoji<fdj@kuryun.cn>
     */
    protected function setMiniInfo(){
        $mini_id = input('mini_id', 0, 'intval');
        if(empty($mini_id)){
            $mini_id = (int)session("miniId");
        }

        if($mini_id <= 0){
            $mini_ids = model('mini')->getAll([
                'where' => ['status' => 1, 'uid' => $this->adminId],
                'order' => ['is_auth' => 'desc', 'update_time' => 'desc'],
                'refresh' => 1
            ]);
            if(count($mini_ids)){
                $mini_info = array_shift($mini_ids);
                $mini_id = $mini_info['id'];
            }
        }

        if($mini_id <= 0){
            $this->needMiniId && $this->error("请先添加小程序", url('system/mini/choose'));
        }
        $this->miniId = $mini_id;
        if(empty($mini_info)){
            $mini_info = model('mini')->getOne($this->miniId);
        }
        if(empty($mini_info) || $mini_info['uid'] != $this->adminId){
            $this->needMiniId && $this->error("请先添加小程序", url('system/mini/choose'));
        }
        session("miniId", $this->miniId);
        session("storeId", $this->miniId);
        $this->miniInfo = $mini_info;
        cookie('miniInfo', $mini_info);
        $this->assign('mini_info', $this->miniInfo);
        $this->assign('mini_id',$this->miniId);
        $this->getAddonForMenu();
    }

    /**
     * 获取应用放入菜单中
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function getAddonForMenu(){
        $template_log = model('miniTemplateLog')->getOneByOrder([
            'where' => ['mini_id' => $this->miniId, 'is_current' => 1],
            'order' => ['id' => 'desc'],
            'refresh' => 1
        ]);
        $list = [];
        if($template_log){
            $addon = model('addons')->getOneByMap(['addon' => $template_log['addon']], true, true);
            if($addon){
                $list[] = $addon;
            }
        }
        $this->assign('menu_app', $list);
        $this->assign('menu_app_title', '当前应用');
    }

    /**
     * 获取小程序app的access token
     * @return mixed
     * Author: fudaoji<fdj@kuryun.cn>
     */
    protected function getAccessToken(){
        return $this->miniApp->access_token->getToken()['authorizer_access_token'];
    }

    /**
     * 小程序接口请求客户端
     * @return \ky\MiniPlatform\RequestClient
     * Author: fudaoji<fdj@kuryun.cn>
     */
    protected function getClient(){
        return new \ky\MiniPlatform\RequestClient();
    }
}