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
 * Create: 2020/3/1 12:13
 * Description: Base controller
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\mp\controller;

class Base extends \app\admin\controller\Base
{
    protected $mpId;
    protected $mpInfo;
    protected $app;
    protected $openPlatform;
    protected $needMpId = true;

    public function initialize(){
        parent::initialize();
        $this->setMpInfo();
        $this->setApp();
    }

    /**
     * 设置授权公众号应用
     * @author fudaoji<fdj@kuryun.cn>
     */
    protected function setApp() {
        if($this->mpInfo) {
            $this->app = controller('mp', 'event')->getApp($this->mpInfo);
        }
        $this->openPlatform = controller('mp', 'event')->getOpenPlatform();
    }

    /**
     * set mp info
     * @author: fudaoji<fdj@kuryun.cn>
     */
    protected function setMpInfo(){
        $mp_id = input('mid', 0,'intval');
        if(empty($mp_id)){
            $mp_id = (int)session("mpId");
        }
        if($mp_id <= 0){
            $mp_ids = model('mp')->getAll([
                'where' => ['status' => 1, 'uid' => $this->adminId],
                'order' => ['update_time' => 'desc']
            ]);
            if(count($mp_ids)){
                $mp_info = array_shift($mp_ids);
                $mp_id = $mp_info['id'];
            }
        }
        if($mp_id <= 0){
            $this->needMpId && $this->error("请先添加公众号", url('system/mp/choose'));
        }
        $this->mpId = $mp_id;
        if(empty($mp_info)){
            $mp_info = model('mp')->getOne($this->mpId);
        }
        if(empty($mp_info) || $mp_info['uid'] != $this->adminId){
            $this->needMpId && $this->error("请先添加公众号", url('system/mp/choose'));
        }
        session("mpId", $this->mpId);
        session("storeId", $this->mpId);
        $this->mpInfo = $mp_info;
        cookie('mpInfo', $mp_info);
        // $this->mpListByMenu();
        $this->assign('mp_info', $this->mpInfo);
        $this->assign('mp_id',$this->mpId);
        //$this->getAddonForMenu();
    }

    /**
     * 获取应用放入菜单中
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function getAddonForMenu(){
        $list = model('addons')->getAll(['menu_show'=>1, 'status'=>1]);
        $this->assign['menu_app'] = $list;
        $this->assign['menu_app_title'] = '应用扩展';
    }
}