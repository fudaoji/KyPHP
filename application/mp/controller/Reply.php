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
     * @var \app\common\model\MpRule
     */
    private $ruleM;
    /**
     * @var \app\common\model\MpSpecial
     */
    private $specialM;
    /**
     * @var \app\common\model\Addons
     */
    private $addonsM;
    /**
     * @var \app\common\model\MpAddon
     */
    private $mpAddonM;
    public function initialize(){
        parent::initialize();
        $this->ruleM = model('mpRule');
        $this->specialM = model('mpSpecial');
        $this->addonsM = model('addons');
        $this->mpAddonM = model('mpAddon');
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
     * @throws \think\Exception
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
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
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
                //refresh
                model('media_' . $data['media_type'])->getOne(['id' => $data['media_id'], 'uid' => $this->adminId], true);
                $this->success('保存成功');
            }else{
                $this->error('保存失败，请刷新重试', '', ['token' => request()->token()]);
            }
        }

        $id = input('id');
        $data = $this->ruleM->getOne(['rule_mpid' => $this->mpId, 'id' => $id], true);
        if(empty($data)){
            $this->error('数据不存在');
        }

        if($data['media_type'] == 'addon'){
            $material = model('addons')->getOne($data['media_id'], true);
        }else{
            $material = model('media_' . $data['media_type'])->getOne(['uid' => $this->adminId, 'id' => $data['media_id']], true);
            if($data['media_type'] == 'news'){
                $material['children'] = model('mediaNews')->getAll([
                    'where' => ['uid' => $this->adminId, 'pid' => $material['id']],
                    'field' => 'cover_url,title',
                    'order' => ['index' => 'asc'],
                    'refresh' => true
                ]);
            }
        }

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
     * @throws \think\exception\DbException
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
        $field = ['ru.id','ru.keyword','ru.status'];
        switch ($type) {
            case 'text':
            case 'news':
            case 'voice':
            case 'image':
            case 'video':
            case 'music':
                $fields = [
                    'text' => ['content'],
                    'image' => ['url'],
                    'voice' => ['url','title'],
                    'video' => ['url','title'],
                    'music' => ['url','title','desc'],
                    'news' => ['title','cover_url','digest'],
                ];
                $data = $this->ruleM->pageJoin([
                    'alias' => 'ru',
                    'join' => [
                        [model('media_' . $type)->getTrueTable(['uid' => $this->adminId]).' m', 'm.id=ru.media_id', 'left']
                    ],
                    'page_size' => $this->pageSize,
                    'where' => $where,
                    'field' => array_merge($field, $fields[$type]),
                    'order' => ['ru.id' => 'desc'],
                    'refresh' => 1
                ]);
                //dump($data);exit;
                break;
            case 'addon':
                $data = $this->ruleM->pageJoin([
                    'alias' => 'ru',
                    'join' => [['addons a', 'a.id=ru.media_id']],
                    'page_size' => $this->pageSize,
                    'where' => $where,
                    'field' => array_merge($field, ['a.name', 'a.desc', 'a.logo']),
                    'order' => ['ru.id' => 'desc'],
                    'refresh' => 1
                ]);
                break;
            default:
                $data = $this->ruleM->page($this->pageSize, [
                    'rule_mpid' => $this->mpId,
                    'keyword' => ['like', '%'.$search_key.'%']
                ]);
                break;

        }

        $assign = [
            'type' => $type,
            'data' => $data,
            'types' => $this->ruleM->types(),
            'page' => $data->appends(['keyword' => $search_key])->render(),
            'keyword' => $search_key
        ];
        return $this->show($assign);
    }

    /**
     * 特殊回复
     * @return mixed
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
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

        $addons = $this->mpAddonM->pageJoin([
            'alias' => 'ma',
            'join' => [['addons a', 'a.addon=ma.addon']],
            'page_size' => 7,
            'where' => ['mpid' => $this->mpId, 'a.status' => 1],
            'field' => ['a.id','a.name', 'a.addon'],
            'order' => ['ma.id' => 'desc'],
            'refresh' => 1
        ]);

        $assign = [
            'replies' => $replies,
            'events' => $events,
            'addons' => $addons
        ];
        return $this->show($assign);
    }
}