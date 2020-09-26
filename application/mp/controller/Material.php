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
 * Script Name: Material.php
 * Create: 2020/5/25 下午9:28
 * Description: 素材管理
 * @link https://developers.weixin.qq.com/doc/offiaccount/Asset_Management/Adding_Permanent_Assets.html  (微信素材文档说明)
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\mp\controller;

use app\common\model\MediaImage;
use app\common\model\MediaMusic;
use app\common\model\MediaText;
use app\common\model\MediaVideo;
use app\common\model\MediaVoice;
use app\common\model\Upload;

class Material extends Base
{
    /**
     * @var \think\Model
     */
    private $uploadM;
    /**
     * @var \think\Model
     */
    private $imageM;
    /**
     * @var \think\Model
     */
    private $textM;
    /**
     * @var \think\Model
     */
    private $voiceM;
    /**
     * @var \think\Model
     */
    private $videoM;
    /**
     * @var \think\Model
     */
    private $musicM;
    /**
     * @var \app\common\model\Addons
     */
    private $addonsM;
    /**
     * @var \app\common\model\mpAddon
     */
    private $mpAddonM;
    private $types = [
        'text','image', 'video', 'voice', 'music', 'news', 'addon'
    ];
    protected $needMpId  = false;
    public function initialize()
    {
        parent::initialize(); // TODO: Change the autogenerated stub
        $this->uploadM = new Upload();
        $this->imageM = new MediaImage();
        $this->textM = new MediaText();
        $this->voiceM = new MediaVoice();
        $this->videoM = new MediaVideo();
        $this->musicM = new MediaMusic();
        $this->addonsM = model('addons');
        $this->mpAddonM = model('mpAddon');
        $this->assign('config', config('system.upload'));
        set_time_limit(0);
    }

    /**
     * 素材上传
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function uploadPost(){
        if(request()->isPost()) {
            $post_data = input('');
            $res = $this->uploadM->upload($_FILES, Upload::config($post_data['type']), ['uid' => $this->adminId]);

            if($res['code']){
                foreach ($res['data'] as $item){
                    $insert_data = [
                        'uid' => $item['uid'],
                        'mpid' => $this->mpId,
                        'title' => $item['original_name'],
                        'url' => $item['url'],
                        'size' => $item['size'],
                        'ext' => $item['ext'],
                        'location' => $item['location']
                    ];
                    $data = model('media_' . $post_data['type'])->addOne($insert_data);
                    if($post_data['from'] == 'mp'){
                        $this->uploadMedia2Wx($post_data['type'], $data['id']);
                    }
                }
                $this->success('上传成功');
            }else{
                $this->error($res['msg']);
            }
        }
    }

    /**
     * 上传素材至微信
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function materialSyncPost(){
        if(request()->isPost()){
            $post_data = input('post.');
            $media = model('media_'.$post_data['type'])->getOne(['id' => $post_data['id'], 'uid' => $this->adminId, 'mpid' => $this->mpId]);
            if(empty($media)){
                $this->error('非法操作');
            }
            $this->uploadMedia2Wx($post_data['type'], $post_data['id']);
            $this->success('上传成功');
        }
    }

    /**
     * 删除素材
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function materialDelPost(){
        $post_data = input();
        $ids = $post_data['ids'];
        $model = model('media_'.$post_data['type']);
        foreach ($ids as $id){
            $data = $model->getOne(['uid' => $this->adminId, 'id' => $id], 1);
            if($model->delOne(['uid' => $this->adminId, 'id' => $id])){
                !empty($data['location']) && strtolower($data['location']) == 'local' && @unlink($data['path']); //删除本地文件
                !empty($data['media_id']) && $this->mpApp->material->delete($data['media_id']); //删除永久素材
            }
        }
        $this->success('删除成功');
    }

    /**
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function index(){
        $types = [
            'image' => '图片',
            //'news' => '图文',
            'voice' => '音频',
            'video' => '视频'
        ];
        $froms = [
            'local' => '本地',
            'mp' => '微信',
        ];
        $from = input('from', 'local');
        $type = input('type', 'image');
        $search_key = input('search_key', '');
        $where = ['uid' => $this->adminId, 'media_id' => '', 'mpid' => $this->mpId];
        $from == 'mp' && $where['media_id'] = ['neq', ''];
        $search_key && $where['title'] = ['like', '%'.$search_key.'%'];
        $data_list = model('media_' . $type)->page(12, $where, ['id' => 'desc'], true, 1);
        $pager = $data_list->appends(['from' => $from, 'type' => $type, 'search_key' => $search_key])->render();
        $assign = [
            'data_list' => $data_list,
            'from' => $from,
            'froms' => $froms,
            'type' => $type,
            'types' => $types,
            'pager' => $pager
        ];
        return $this->show($assign);
    }

    /**
     * frame素材列表
     * @return mixed
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function handle(){
        $params = input();
        if(empty($params['type'])){
            $type = 'image';
        }else{
            if(in_array($params['type'], $this->types)){
                $type = $params['type'];
            }else{
                echo "type参数错误";exit;
            }
        }
        if(method_exists($this, $type)){
            return call_user_func([$this, $type]);
        }else{
            echo $type . "方法不存在";exit;
        }
    }

    /**
     * 音频
     * @return mixed
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function voice(){
        $from = input('from', 'local'); //本地或微信
        $field = input('field', ''); //目标input框
        $where = ['uid' => $this->adminId, 'media_id' => ''];
        $controller = input('controller', '');
        $controller == 'reply' && $where['mpid'] = $this->mpId;
        if($from == 'mp'){
            $where['media_id'] = ['neq', ''];
        }
        $data_list = $this->voiceM->page(7, $where, ['id' => 'desc'], 'id,title,url', 1);
        $pager = $data_list->render();
        $assign = ['data_list' => $data_list, 'pager' => $pager, 'field' => $field, 'from' => $from];
        return $this->show($assign, __FUNCTION__);
    }

    /**
     * 文本
     * @return mixed
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function text(){
        if(request()->isPost()){
            $post_data = input('post.');
            $post_data['uid'] = $this->adminId;
            if($res = $this->textM->addOne($post_data)){
                $this->success('保存成功');
            }
            $this->error('保存失败，请刷新重试');
        }
        $field = input('field', ''); //目标input框
        $where = ['uid' => $this->adminId];
        $data_list = $this->textM->page(7, $where, ['id' => 'desc'], 'id,content', 1);
        $pager = $data_list->render();
        $assign = ['data_list' => $data_list, 'pager' => $pager, 'field' => $field];
        return $this->show($assign, __FUNCTION__);
    }

    /**
     * 删除文本素材
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function textDelPost(){
        $post_data = input();
        $ids = $post_data['ids'];
        foreach ($ids as $id){
            $this->textM->delOne(['uid' => $this->adminId, 'id' => $id]);
        }
        $this->success('操作成功');
    }

    /**
     * 图片
     * @return mixed
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function image(){
        $from = input('from', 'local'); //本地或微信
        $field = input('field', ''); //目标input框
        $where = ['uid' => $this->adminId, 'media_id' => ''];
        $controller = input('controller', '');
        $controller == 'reply' && $where['mpid'] = $this->mpId;
        if($from == 'mp'){
            $where['media_id'] = ['neq', ''];
        }
        $data_list = $this->imageM->page(12, $where, ['id' => 'desc'], 'id,url,title', 1);
        $pager = $data_list->appends(['from' => $from])->render();
        $assign = ['data_list' => $data_list, 'pager' => $pager, 'from' => $from, 'field' => $field];
        return $this->show($assign, __FUNCTION__);
    }

    /**
     * 音乐
     * @return mixed
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function music(){
        if(request()->isPost()){
            $post_data = input('post.');
            $post_data['uid'] = $this->adminId;
            $post_data['mpid'] = $this->mpId;
            if($res = $this->musicM->addOne($post_data)){
                $this->success('保存成功');
            }
            $this->error('保存失败，请刷新重试');
        }
        $from = input('from', 'local'); //本地或微信
        $field = input('field', ''); //目标input框
        $where = ['uid' => $this->adminId];
        $controller = input('controller', '');
        $controller == 'reply' && $where['mpid'] = $this->mpId;
        $data_list = $this->musicM->page(7, $where, ['id' => 'desc'], 'id,url,title', 1);
        $pager = $data_list->appends(['from' => $from])->render();
        $assign = ['data_list' => $data_list, 'pager' => $pager, 'field' => $field];
        return $this->show($assign, __FUNCTION__);
    }

    /**
     * 视频
     * @return mixed
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function video(){
        $from = input('from', 'local'); //本地或微信
        $field = input('field', ''); //目标input框
        $where = ['uid' => $this->adminId, 'media_id' => ''];
        $controller = input('controller', '');
        $controller == 'reply' && $where['mpid'] = $this->mpId;
        if($from == 'mp'){
            $where['media_id'] = ['neq', ''];
        }
        $data_list = $this->videoM->page(12, $where, ['id' => 'desc'], 'id,url,title', 1);
        $pager = $data_list->appends(['from' => $from])->render();
        $assign = ['data_list' => $data_list, 'pager' => $pager, 'from' => $from, 'field' => $field];
        return $this->show($assign, __FUNCTION__);
    }

    /**
     * 应用插件
     * @return mixed
     * @throws \think\exception\DbException
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function addon(){
        $field = input('field', ''); //目标input框
        $where = ['mpid' => $this->mpId, 'a.status' => 1];
        $data_list = $this->mpAddonM->pageJoin([
            'alias' => 'ma',
            'join' => [['addons a', 'a.addon=ma.addon']],
            'page_size' => 7,
            'where' => $where,
            'field' => ['a.id','a.name', 'a.desc', 'a.logo'],
            'order' => ['ma.id' => 'desc'],
            'refresh' => 1
        ]);
        $pager = $data_list->render();
        $assign = ['data_list' => $data_list, 'pager' => $pager, 'field' => $field];
        return $this->show($assign, __FUNCTION__);
    }
}