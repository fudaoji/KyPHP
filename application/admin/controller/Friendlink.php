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
 * Script Name: admin.php
 * Create: 2020/8/3 下午10:09
 * Description: 友情链接
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\admin\controller;

class Friendlink extends Base
{

    /**
     * @var \app\common\model\FriendLink
     */
    private $model;

    public function initialize(){
        parent::initialize();
        $this->model = model('FriendLink');
    }

    /**
     * 保存
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function savePost(){
        if (request()->isPost()) {
            $post_data = input('post.');

            $res = $this->validate($post_data,'FriendLink.' . (empty($post_data['id']) ? 'add' : 'edit'));
            if($res !== true){
                $this->error($res, '', ['token' => request()->token()]);
            }

            if (empty($post_data['id'])) {
                $this->model->addOne($post_data);
            } else {
                $this->model->updateOne($post_data);
            }
            $this->success('操作成功', url('index'));
        }
    }

    /**
     * 编辑用户
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function edit(){
        $data = $this->model->getOne(input('id', 0));
        if(empty($data)){
            $this->error('数据不存在');
        }
        $builder = new FormBuilder();
        $builder->setPostUrl(url('savePost'))
            ->addFormItem('id', 'hidden', 'id', 'id')
            ->addFormItem('title', 'text', '名称', '30字内', [],'required maxlength=30')
            ->addFormItem('link', 'text', '链接', '链接', [], 'required maxlength=200 ')
            ->addFormItem('sort', 'number', '排序', '数字越小越靠前', [], 'required min=0')
            ->addFormItem('status', 'radio', '状态', '状态', [0 => '禁用', 1 => '启用'])
            ->setFormData($data);
        return $builder->show();
    }

    /**
     * 新增
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function add(){
        $builder = new FormBuilder();
        $builder->setPostUrl(url('savePost'))
            ->addFormItem('title', 'text', '名称', '30字内', [],'required maxlength=30')
            ->addFormItem('link', 'text', '链接', '链接', [], 'required maxlength=200 ');
        return $builder->show();
    }

    /**
     * 友链列表
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function index()
    {
        $data_list = $this->model->page($this->pageSize, [], ['sort' => 'asc'], true, true);
        $this->assign['page'] = $data_list->render();
        $this->assign['data_list'] = $data_list;
        return $this->show();
    }
}