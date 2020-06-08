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
 * Script Name: Reply
 * Create: 2020/3/3 下午4:35
 * Description: 回复设置
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\mp\controller;
use app\admin\controller\FormBuilder;
use think\Validate;

class Reply extends Base
{
    /**
     * @var \think\Model
     */
    private $ruleM;
    /**
     * @var \think\Model
     */
    private $specialM;
    /**
     * @var \think\Model
     */
    private $addonsM;
    public function initialize(){
        parent::initialize();
        $this->ruleM = model('mpRule');
        $this->specialM = model('mpSpecial');
        $this->addonsM = model('addons');
    }

    /**
     * 启用／禁用
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function setStatusPost(){
        if(request()->isPost()){
            $post_data = input('post.');
            $post_data['rule_mpid'] = $this->mpId;
            if($this->ruleM->updateOne($post_data)){
                $this->success('操作成功');
            }else{
                $this->error('操作失败，请刷新重试');
            }
        }
    }


    /**
     * 增加关键词
     * @return mixed
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function add(){
        if(request()->isPost()){
            $post_data = input('post.');
            $post_data['rule_mpid'] = $this->mpId;
            $res = $this->validate($post_data,'MpRule');
            if($res !== true){
                $this->error($res, '', ['token' => request()->token()]);
            }
            $data = [
                'rule_mpid' => $post_data['rule_mpid'],
                'keyword' => $post_data['keyword'],
                'status' => $post_data['status'],
                'media_type' => $post_data['media_type'],
                'media_id' => $post_data['media_id']
            ];
            $this->uploadMedia2Wx($data['media_type'], $data['media_id']);
            if($this->ruleM->addOne($data)){
                $this->success('保存成功');
            }else{
                $this->error('保存失败，请刷新重试', '', ['token' => request()->token()]);
            }
        }
        $builder = new FormBuilder();
        $builder->setTemplate('common/form')
            ->addFormItem('keyword', 'text', '关键词', '不超过40字', [], 'required maxlength=40')
            ->addFormItem('status', 'radio', '是否开启', '是否开启', [1 => '是', 0 => '否'], 'required')
            ->addFormItem('media', 'choose_media', '回复类型', '回复类型', ['types' => $this->ruleM->types()], 'required')
            ->setFormData(['status' => 1]);
        return $builder->show();
    }

    /**
     * 编辑关键词回复
     * @return mixed
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function edit(){
        if(request()->isPost()){
            $post_data = input('post.');
            $post_data['rule_mpid'] = $this->mpId;
            $res = $this->validate($post_data,'MpRule');
            if($res !== true){
                $this->error($res, '', ['token' => request()->token()]);
            }

            $data = [
                'id' => $post_data['id'],
                'rule_mpid' => $post_data['rule_mpid'],
                'keyword' => $post_data['keyword'],
                'status' => $post_data['status'],
                'media_type' => $post_data['media_type'],
                'media_id' => $post_data['media_id']
            ];
            $this->uploadMedia2Wx($data['media_type'], $data['media_id']);
            if($this->ruleM->updateOne($data)){
                $this->success('保存成功');
            }else{
                $this->error('保存失败，请刷新重试', '', ['token' => request()->token()]);
            }
        }
        $id = input('id');
        $data = $this->ruleM->getOne(['rule_mpid' => $this->mpId, 'id' => $id]);
        if(empty($data)){
            $this->error('数据不存在');
        }
        $material = model('media_' . $data['media_type'])->getOne(['uid' => $this->adminId, 'id' => $data['media_id']]);
        $builder = new FormBuilder();
        $builder->addFormItem('id', 'hidden', 'ID', 'ID', [], 'required')
            ->addFormItem('keyword', 'text', '关键词', '不超过40字', [], 'required maxlength=40')
            ->addFormItem('status', 'radio', '是否开启', '是否开启', [1 => '是', 0 => '否'], 'required')
            ->addFormItem('media', 'choose_media', '回复类型', '回复类型', ['types' => $this->ruleM->types(), 'id' => $data['media_id'], 'type' => $data['media_type']], 'required')
            ->setFormData($data);
        return $builder->show(['material' => $material]);
    }

    /**
     * 自动回复
     * @param string $type
     * @return mixed
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function index($type = 'all')
    {
        $where = ['rule_mpid' => $this->mpId];
        $type != 'all' && $where['ru.media_type'] = $type;
        if($search_key = input('keyword', '')){
            $where['ru.keyword'] = ['like', '%'.$search_key.'%'];
            $type = 'all';
        }

        switch ($type) {
            case 'text':
            case 'news':
            case 'voice':
            case 'image':
            case 'video':
            case 'music':
                $field = ['ru.id','ru.keyword','ru.status'];
                $fields = [
                    'text' => ['content'],
                    'image' => ['url'],
                    'voice' => ['url','title'],
                    'video' => ['url','title'],
                    'music' => ['url','title','desc']
                ];
                $data = $this->ruleM->pageJoin([
                    'alias' => 'ru',
                    'join' => [[model('media_' . $type)->getTrueTable(['uid' => $this->adminId]).' m', 'm.id=ru.media_id']],
                    'page_size' => $this->pageSize,
                    'where' => $where,
                    'field' => array_merge($field, $fields[$type]),
                    'order' => ['ru.id' => 'desc']
                ]);
                break;
            case 'addon':
                $data = model('mpRule')->pageJoin([
                    'alias' => 'ru',
                    'join' => [['addons a', 'a.addon=ru.addon']],
                    'page_size' => $this->pageSize,
                    'where' => $where,
                    'field' => 'ru.id,ru.keyword,ru.status,ru.addon, ru.type, a.name,a.desc,a.logo',
                    'order' => ['ru.id' => 'desc']
                ]);
                break;
            default:
                $data = $this->ruleM->page($this->pageSize, [
                    'rule_mpid' => $this->mpId,
                    'keyword' => ['like', '%'.$search_key.'%']
                ]);
                break;

        }

        $assign = ['type' => $type, 'data' => $data, 'types' => $this->ruleM->types()];
        return $this->show($assign);
    }

    /**
     * 特殊回复
     * @return mixed
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function special(){
        $events = $this->specialM->events();
        if(request()->isPost()){
            $post_data = input('post.');
            foreach ($events as $k => $event){
                $special = $this->specialM->getOneByMap(['event' => $k]);
                $update_data = [
                    'id' => $special['id'],
                    'ignore' => 0,
                    'keyword' => '',
                    'addon' => ''
                ];
                $dict = [
                    'ignore' => 1,
                    'keyword' => $post_data[$k . '_keyword'],
                    'addon' => $post_data[$k . '_addons']
                ];
                $update_data[$post_data[$k]] = $dict[$post_data[$k]];
                $this->specialM->updateOne($update_data);
            }
            $this->success('保存成功');
        }
        $replies = $this->specialM->getAll([
            'where' => ['spe_mpid' => $this->mpId],
            'refresh' => 1
        ]);
        if(!count($replies)){
            $insert_data = [];
            foreach ($events as $k => $event){
                $insert_data[] = [
                    'event' => $k,
                    'spe_mpid' => $this->mpId
                ];
            }
            $this->specialM->addBatch($insert_data);
            $replies = $this->specialM->getAll([
                'where' => ['spe_mpid' => $this->mpId]
            ]);
        }

        $assign = [
            'replies' => $replies,
            'events' => $events,
            'addons' => $this->addonsM->getField('addon,name', ['status' => 1])
        ];
        return $this->show($assign);
    }
}