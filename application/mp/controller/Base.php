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
 * Script Name: ${FILE_NAME}
 * Create: 2020/3/1 12:13
 * Description: Base controller
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\mp\controller;

class Base extends \app\admin\controller\Base
{
    protected $mpId;
    protected $mpInfo;

    public function initialize(){
        parent::initialize();
        $this->setMp();
    }

    /**
     * set mp info
     * @author: fudaoji<fdj@kuryun.cn>
     */
    protected function setMp(){
        $mp_id = input('mid', 0,'intval');
        if(empty($mp_id)){
            $mp_id = (int)session("mpId");
        }
        if($mp_id <= 0){
            $mp_ids = model('mp')->getAll([
                'where' => ['status' => 1, 'user_id' => $this->adminId],
                'order' => ['update_time' => 'desc']
            ]);
            if(count($mp_ids)){
                $mp_info = array_shift($mp_ids);
                $mp_id = $mp_info['id'];
            }
        }
        if($mp_id <= 0){
            $this->error("请先添加公众号", url('mp/index/addmp'));
        }
        $this->mpId = $mp_id;
        if(empty($mp_info)){
            $mp_info = model('mp')->getOne($this->mpId);
        }
        if(empty($mp_info) || $mp_info['user_id'] != $this->adminId){
            $this->error("请先添加公众号", url('mp/index/addmp'));
        }
        session("mpId", $this->mpId);
        $this->mpInfo = $mp_info;

        /*$options = array(
            'appid' => $this->mpInfo['appid'],
            'appsecret' => $this->mpInfo['appsecret'],
            'token' => $this->mpInfo['valid_token'],
            'encodingaeskey' => $this->mpInfo['encodingaeskey']
        );*/
        //$this->getAddonForMenu();
        // $this->mpListByMenu();
        $this->assign('mp_info', $this->mpInfo);
        $this->assign('mp_id',$this->mpId);
    }
}