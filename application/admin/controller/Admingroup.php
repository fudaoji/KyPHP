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
 * Script Name: admingroup.php
 * Create: 2020/7/9 16:16
 * Description: 用户组
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\admin\controller;


use app\common\facade\KyTree;

class Admingroup extends Base
{
    private $groupM;
    public function initialize(){
        parent::initialize();
        $this->groupM = model('adminGroup');
    }

    /**
     * 保存信息
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function savePost(){
        if(request()->isPost()){
            $post_data = input('post.');
            $res = $this->validate($post_data, 'AdminGroup.add');
            if($res !== true){
                $this->error($res, '', ['token' => request()->token()]);
            }
            $data = [
                'title' => $post_data['title'],
                'sort' => $post_data['sort'],
                'status' => $post_data['status'],
                'menu_config' => $post_data['menu_config'],
                'store_config' => json_encode($post_data['store_config'])
            ];

            if (empty($post_data['id'])) {
                $res = $this->groupM->addOne($data);
            } else {
                $data['id'] = $post_data['id'];
                $res = $this->groupM->updateOne($data);
            }
            if($res){
                $this->success('保存成功', url('index'));
            }else{
                $this->error('系统繁忙，请刷新重试', '', ['token' => request()->token()]);
            }
        }
    }

    /**
     * 编辑用户组
     * @return mixed
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function edit(){
        $id = input('id', 0);
        $data = $this->groupM->getOne($id);
        if(empty($data)){
            $this->error('数据不存在');
        }
        $data['menu_config'] = explode(',', $data['menu_config']);
        $data['store_config'] = json_decode($data['store_config'], true);

        $top_menu = model('menu')->getAll([
            'field' => 'id,title',
            'where' => ['pid' => 0, 'status' => 1],
            'order' => ['sort' => 'asc'],
            'refresh' => 1
        ]);

        $menu_tree = [];
        foreach ($top_menu as $menu){
            if(in_array($menu['id'], $data['menu_config'])){
                $menu['checked'] = 1;
            }
            $menu['children'] = model('menu')->getAll([
                'field' => 'id,title',
                'where' => ['pid' => $menu['id'], 'status' => 1],
                'order' => ['sort' => 'asc'],
                'refresh' => 1
            ]);
            foreach ($menu['children'] as $k => $menu1) {
                if(in_array($menu1['id'], $data['menu_config'])){
                    $menu1['checked'] = 1;
                }
                $menu1['children'] = model('menu')->getAll([
                    'field' => 'id,title',
                    'where' => ['pid' => $menu1['id'], 'status' => 1],
                    'order' => ['sort' => 'asc'],
                    'refresh' => 1
                ]);
                foreach ($menu1['children'] as $j => $menu2){
                    if(in_array($menu2['id'], $data['menu_config'])){
                        $menu2['checked'] = 1;
                    }
                    $menu1['children'][$j] = $menu2;
                }
                $menu['children'][$k] = $menu1;
            }
            $menu_tree[] = $menu;
        }
        $assign = [
            'menu_tree' => $menu_tree,
            'store_config' => $data['store_config'],
            'data' => $data
        ];
        return $this->show($assign);
    }

    /**
     * 新增用户组
     * @return mixed
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function add(){
        $top_menu = model('menu')->getAll([
            'field' => 'id,title',
            'where' => ['pid' => 0, 'status' => 1],
            'order' => ['sort' => 'asc'],
            'refresh' => 1
        ]);

        $menu_tree = [];
        foreach ($top_menu as $menu){
            $menu['children'] = model('menu')->getAll([
                'field' => 'id,title',
                'where' => ['pid' => $menu['id'], 'status' => 1],
                'order' => ['sort' => 'asc'],
                'refresh' => 1
            ]);
            foreach ($menu['children'] as $k => $menu1) {
                $menu1['children'] = model('menu')->getAll([
                    'field' => 'id,title',
                    'where' => ['pid' => $menu1['id'], 'status' => 1],
                    'order' => ['sort' => 'asc'],
                    'refresh' => 1
                ]);
                $menu['children'][$k] = $menu1;
            }
            $menu_tree[] = $menu;
        }
        $assign = [
            'menu_tree' => $menu_tree
        ];
        return $this->show($assign);
    }

    /**
     * 用户组列表
     * @return mixed
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function index(){
        $data_list = $this->groupM->page($this->pageSize, [], ['sort' => 'asc'], true, 1);
        foreach ($data_list as $k => $v){
            $v['store_config'] = json_decode($v['store_config'], true);
            $data_list[$k] = $v;
        }
        $page = $data_list->render();
        return $this->show(['data_list' => $data_list, 'page' => $page]);
    }
}