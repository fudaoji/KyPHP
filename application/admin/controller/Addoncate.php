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
 * Script Name: Addoncate.php
 * Create: 2020/7/17 下午10:35
 * Description: 应用分类
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\admin\controller;

class Addoncate extends Base
{
    /**
     * @var \app\common\model\AddonsCate
     */
    private $cateM;
    public function initialize(){
        parent::initialize();
        $this->cateM = model('addonsCate');
    }

    /**
     * 保存数据
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function savePost(){
        if (request()->isPost()) {
            $post_data = input('post.');
            $res = $this->validate($post_data, 'AddonsCate.' . (isset($post_data['id']) ? 'edit' : 'add'));
            if($res !== true){
                $this->error($res, '', ['token' => request()->token()]);
            }
            $data = [
                'title' => $post_data['title'],
                'sort' => $post_data['sort']
            ];
            if(!empty($post_data['id'])){
                $data['id'] = $post_data['id'];
                $this->cateM->updateOne($data);
            }else{
                $this->cateM->addOne($data);
            }
            $this->success('操作成功', url('index'));

        }
    }

    /**
     * 编辑分类
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function edit()
    {
        if(!$data = $this->cateM->getOne(input('id', 0, 'intval'))){
            $this->error('数据不存在');
        }
        $builder = new FormBuilder();
        $builder->setPostUrl(url('savePost'))
            ->addFormItem('id', 'hidden', 'id', 'id', 'required')
            ->addFormItem('title', 'text', '名称', '不超过20个字', [], 'required maxlength=20')
            ->addFormItem('sort', 'number', '排序', '数字越小越靠前', [], 'required min=0')
            ->setFormData($data);
        return $builder->show();
    }

    /**
     * 增加分类
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function add()
    {
        $builder = new FormBuilder();
        $builder
            ->setPostUrl(url('savePost'))
            ->addFormItem('title', 'text', '名称', '不超过20个字', [], 'required maxlength=20')
            ->addFormItem('sort', 'number', '排序', '数字越小越靠前', [], 'required min=0')
            ->setFormData(['sort' => 0]);
        return $builder->show();
    }

    /**
     * 菜单列表
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function index()
    {
        if(request()->isPost()){
            $id = input('id', 0);
            $menu = $this->cateM->getOne($id);
            $this->cateM->updateOne(['id' => $id, 'status' => abs($menu['status'] - 1)]);
            $this->success('操作成功');
        }
        $this->assign['data_list'] = $this->cateM->getAll(['order' => ['sort' => 'asc']]);
        return $this->show();
    }

    /**
     * 更新排序
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function updateSort()
    {
        if (request()->isPost()) {
            $post_data = input();
            $update_data = [];
            foreach ($post_data as $key => $val) {
                if (!empty($arr = explode('_', $key))) {
                    $update_data[] = ['id' => $arr[0], 'sort' => $val];
                }
            }
            $this->cateM->updateBatch($update_data);
            $this->success('更新成功');
        }
    }
}