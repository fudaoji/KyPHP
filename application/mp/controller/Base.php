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

use ky\ErrorCode;

class Base extends \app\admin\controller\Base
{
    protected $mpId;
    protected $mpInfo;
    protected $mpApp;
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
            $this->mpApp = controller('mp/mp', 'event')->getApp($this->mpInfo);
        }
        $this->openPlatform = controller('mp/mp', 'event')->getOpenPlatform();
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
        $this->assign('mp_info', $this->mpInfo);
        $this->assign('mp_id',$this->mpId);
        $this->getAddonForMenu();
    }

    /**
     * 获取应用放入菜单中
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function getAddonForMenu(){
        $where = [
            'a.menu_show'=>1,
            'a.status' => 1,
            'ma.uid' => $this->adminId,
            'ma.status' => 1,
            'ma.deadline' => ['gt', time()]
        ];
        $list = model('AdminAddon')->getAllJoin([
            'alias' => 'ma',
            'join' => [
                ['addons a', 'ma.addon=a.addon']
            ],
            'field' => 'a.*',
            'where' => $where,
            'order' => ['ma.update_time' => 'desc'],
            'refresh' => 1
        ]);
        $this->assign('menu_app', $list);
        $this->assign('menu_app_title', '应用扩展');
    }

    /**
     * 将素材传至微信
     * @param string $media_type
     * @param int $id
     * @return bool
     * Author: fudaoji<fdj@kuryun.cn>
     */
    protected function uploadMedia2Wx($media_type = 'image', $id = 0){
        if(!in_array($media_type, ['image', 'voice', 'video', 'news'])){
            return  true;
        }
        $media = model('media_' . $media_type)->getOne(['id' => $id, 'uid' => $this->adminId]);
        if(empty($media) || $media['media_id'] != ''){
            return true;
        }
        $media_id = '';
        if(strtolower($media['location']) === 'local'){
            $path = $media['path'];
        }else{
            $path = download_file($media['url'], $media_type);
        }
        switch ($media_type){
            case 'image':
                $res = $this->mpApp->material->uploadImage($path);
                break;
            case 'voice':
                $res = $this->mpApp->material->uploadVoice($path);
                break;
            case 'video':
                $res = $this->mpApp->material->uploadVideo($path, $media['title'], $media['desc']);
                break;
        }
        if(isset($res['errcode'])){
            $this->error('上传素材至公众号失败,错误码:'.$res['errcode'].'，错误说明：' . ErrorCode::mpError($res['errcode']));
        }else{
            $media_id = $res['media_id'];
            strtolower($media['location']) !== 'local' && @unlink($path);
        }
        if($media_id){
            return model('media_' . $media_type)->updateOne([
                'id' => $id,
                'uid' => $this->adminId,
                'media_id' => $media_id
            ]);
        }
    }
}