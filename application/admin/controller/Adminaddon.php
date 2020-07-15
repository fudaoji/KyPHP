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
 * Script Name: Adminaddon.php
 * Create: 2020/7/9 16:16
 * Description: 用户开通应用
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\admin\controller;

use think\Db;
use think\facade\Log;

class Adminaddon extends Base
{
    /**
     * @var \app\common\model\AdminAddon
     */
    private $model;
    /**
     * @var \app\common\model\Admin
     */
    private $adminM;
    /**
     * @var \app\common\model\Addons
     */
    private $addonsM;
    public function initialize(){
        parent::initialize();
        $this->model = model('adminAddon');
        $this->adminM = model('admin');
        $this->addonsM = model('addons');
    }

    /**
     * 保存数据
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function savePost(){
        if(request()->isPost()){
            $post_data = input('post.');
            $res = $this->validate($post_data, 'AdminAddon.' . (isset($post_data['id']) ? 'edit' : 'add'));
            if($res !== true){
                $this->error($res, '', ['token' => request()->token()]);
            }

            $data = [
                'deadline' => strtotime($post_data['deadline']),
            ];
            Db::startTrans();
            try {
                if(!empty($post_data['id'])){
                    $data['id'] = $post_data['id'];
                    $this->model->updateOne($data);
                }else{
                    $post_data['addon'] = explode(',', $post_data['addon']);
                    foreach ($post_data['addon'] as $addon){
                        if($this->model->total(['uid' => $post_data['uid'], 'addon' => $addon], 1)){
                            continue;
                        }
                        $data['uid'] = $post_data['uid'];
                        $data['addon'] = $addon;
                        $this->model->addOne($data);
                    }
                }

                Db::commit();
                $flag = true;
            }catch (\Exception $e){
                $flag = false;
                Log::write($e->getMessage());
                Db::rollback();
            }
            if($flag === true){
                $this->success('保存成功', url('index'));
            }else{
                $this->error('系统出错，请刷新重试', '', ['token' => request()->token()]);
            }
        }
    }

    /**
     * 新增用户应用
     * @return mixed
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function add(){
        $admin_list = $this->adminM->getField('id,username', ['status' => 1], 1);
        $addon_list = $this->addonsM->getField('addon,name', ['status' => 1], 1);
        $builder = new FormBuilder();
        $builder->setPostUrl(url('savePost'))
            ->addFormItem('addon', 'chosen_multi', '应用', '应用', $addon_list, 'required')
            ->addFormItem('uid', 'chosen', '会员', '会员', [0 => '']+$admin_list, 'required')
            ->addFormItem('deadline', 'datetime', '到期时间', '到期时间', [], 'required');
        return $builder->show();
    }

    /**
     * 编辑用户应用
     * @return mixed
     * Author: fudaoji<fdj@kuryun.cn>
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function edit(){
        $data = $this->model->getOne(input('id', 0));
        if(empty($data)){
            $this->error('数据不存在');
        }
        $data['addon'] = $this->addonsM->getOneByMap(['addon' => $data['addon']])['name'];
        $data['uid'] = $this->adminM->getOne($data['uid'])['username'];
        $data['deadline'] = date('Y-m-d H:i:s', $data['deadline']);
        $builder = new FormBuilder();
        $builder->setPostUrl(url('savePost'))
            ->addFormItem('id', 'hidden', 'id', 'id')
            ->addFormItem('addon', 'static', '应用', '应用', [])
            ->addFormItem('uid', 'static', '会员', '会员', [])
            ->addFormItem('deadline', 'datetime', '到期时间', '到期时间', [], 'required')
            ->setFormData($data);
        return $builder->show();
    }

    /**
     * 用户应用列表
     * @return mixed
     * Author: fudaoji<fdj@kuryun.cn>
     * @throws \think\exception\DbException
     */
    public function index(){
        $data_list = $this->model->pageJoin([
            'alias' => 'aa',
            'join' => [
                ['admin a', 'a.id=aa.uid'],
                ['addons ad', 'ad.addon=aa.addon']
            ],
            'order' => ['aa.update_time' => 'desc'],
            'page_size' => $this->pageSize,
            'field' => 'aa.*,a.username,a.mobile,a.realname,ad.name',
            'refresh' => 1
        ]);
        $page = $data_list->render();
        return $this->show(['data_list' => $data_list, 'page' => $page]);
    }
}