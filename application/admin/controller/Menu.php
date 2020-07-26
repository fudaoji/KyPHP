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
 * Script Name: Menu.php
 * Create: 2020/3/3 下午10:09
 * Description: 菜单
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\admin\controller;
use app\common\facade\KyTree;

class Menu extends Base
{
    /**
     * @var \app\common\model\Menu
     */
    private $menuM;
    public function initialize(){
        parent::initialize();
        $this->menuM = model('menu');
    }

    /**
     * 菜单列表
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\Exception
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function index()
    {
        if(request()->isPost()){
            $id = input('id', 0);
            $menu = $this->menuM->getOne($id);
            $this->menuM->updateOne(['id' => $id, 'status' => abs($menu['status'] - 1)]);
            $this->success('操作成功');
        }
        $all_menu = model('menu')->getAll(['order' => ['sort' => 'asc']]);
        return $this->show(['menu_list' => KyTree::toFormatTree($all_menu)]);
    }

    /**
     * 更新菜单
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function edit()
    {
        $id = input('id');
        if (request()->isPost()) {
            $post_data = input('post.');
            $post_data['id'] = $id;
            model('menu')->updateOne($post_data);
            $this->success('更新成功', url('index'));
        }
        $data = model('menu')->getOne($id);
        $tree = [0 => '顶级菜单'] + select_list_as_tree(model('menu'), ['type' => 1]);
        $builder = new FormBuilder();
        $builder->addFormItem('id', 'hidden', 'id', 'id')
            ->addFormItem('type', 'radio', '类型', '类型', [1 => '菜单', 2 => '权限'])
            ->addFormItem('title', 'text', '菜单名称', '不超过8个字', [], 'required maxlength=10')
            ->addFormItem('pid', 'select', '上级菜单', '上级菜单', $tree, 'required')
            ->addFormItem('url', 'text', 'URL', '注意：(小写)模块/控制器/操作方法')
            ->addFormItem('sort', 'number', '排序', '数字越小越靠前', [], 'min=0')
            ->addFormItem('icon', 'icon', '图标', '图标')
            ->addFormItem('status', 'radio', '状态', '状态', [0 => '禁用', 1 => '启用'])
            ->setFormData($data);
        return $builder->show();
    }


    /**
     * 菜单排序
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
            model('menu')->updateBatch($update_data);
            $this->success('更新成功');
        }
    }

    /**
     * 删除菜单
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function delete(){
        if (request()->isPost()) {
            $id = input('id');
            model('menu')->delOne($id);
            $this->success('删除成功');
        }
    }

    /**
     * 增加菜单
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function add()
    {
        if (request()->isPost()) {
            $post_data = input('post.');
            if (model('menu')->addOne($post_data)) {
                $this->success('操作成功', url('index'));
            } else {
                $this->error('操作失败，请刷新重试', '', ['token' => request()->token()]);
            }
        }
        $tree = [0 => '顶级菜单'] + select_list_as_tree(model('menu'), ['type' => 1]);
        $builder = new FormBuilder();
        $builder->addFormItem('type', 'radio', '类型', '类型', [1 => '菜单', 2 => '权限'], 'required')
            ->addFormItem('title', 'text', '菜单名称', '不超过8个字', [], 'required maxlength=10')
            ->addFormItem('pid', 'select', '上级菜单', '上级菜单', $tree, 'required')
            ->addFormItem('url', 'text', 'URL', '注意：(小写)模块/控制器/操作方法')
            ->addFormItem('sort', 'number', '排序', '数字越小越靠前', [], 'min=0')
            ->addFormItem('icon', 'icon', '图标', '图标')
            ->setFormData(['type' => 1, 'sort' => 0, 'pid' => input('pid', 0, 'intval')]);
        return $builder->show();
    }


}