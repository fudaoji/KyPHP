<?php
// +----------------------------------------------------------------------
// | [KyPHP System] Copyright (c) 2020 http://www.kuryun.com/
// +----------------------------------------------------------------------
// | [KyPHP] 并不是自由软件,你可免费使用,未经许可不能去掉KyPHP相关版权
// +----------------------------------------------------------------------
// | Author: fudaoji <fudaoji@gmail.com>
// +----------------------------------------------------------------------

/**
 * Created by PhpStorm.
 * Script Name: ${FILE_NAME}
 * Create: 2020/2/29 下午10:18
 * Description: admin controller base
 * Author: Doogie<461960962@qq.com>
 */

namespace app\admin\controller;
use app\common\controller\BaseCtl;
use ky\KyTree;

class Base extends BaseCtl {
    protected $adminId;
    protected $adminInfo;

    public function initialize()
    {
        if(CONTROLLER_NAME !== 'auth'){
            //记录当前url
            cookie('redirect_url', request()->domain().request()->url());
        }

        $this->isLogin();

        $node = MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME;
        $t_menus = model("menu")->getAll(['where' => ['pid' => 0], 'order' => 'sort asc']);
        $all_menus = model("menu")->getAll(['order' => 'sort asc']);
        $current_menu = model('menu')->getOneByMap(['url' => $node]);
        $top_node = null;
        $menu2 = null;
        $menu_title = '';
        if (!empty($current_menu)) {
            foreach ($t_menus as $key => $val) {//处理顶级菜单高亮
                if ($val['url'] == $current_menu['url']) {
                    $menu2 = $this->getSubMenus($all_menus, $val['url']);
                    $top_node = $val['url'];
                    break;
                } else {
                    $parent = KyTree::getParents($all_menus, $current_menu['id']);
                    if (isset($parent['0']['url'])) {
                        if ($parent['0']['url'] == $val['url']) {
                            $menu2 = $this->getSubMenus($all_menus, $val['url']);
                            $top_node = $val['url'];
                            break;
                        }
                    }
                }
            }
            $parent = KyTree::getParents($all_menus, $current_menu['id']);
            $tree = tree_to_list($menu2, 'child', 'sort');
            if ($tree) {
                foreach ($tree as $key => $val) {
                    foreach ($parent as $key2 => $val2) {
                        if ($tree[$key]['id'] == $parent[$key2]['id']) {
                            $tree[$key]['shows'] = 1;
                            $menu_title = $val2['name'];
                            break;
                        }
                    }
                }
                $menu2 = KyTree::getTreeNoFindChild($tree);
            }
        }
        if (MODULE_NAME . '/' . CONTROLLER_NAME == 'mp/app') {
            $top_node = 'mp/mp/index';
        }
        if (MODULE_NAME . '/' . CONTROLLER_NAME == 'miniapp/app') {
            $top_node = 'miniapp/miniapp/topnav';
        }
        $this->mpListByMenu();
        $this->assign('t_menu', $t_menus);
        $this->assign('topNode', $top_node);
        $this->assign('menu_title', $menu_title);
        $this->assign('node', $node);
        $this->assign('menu', $menu2);
        $this->assign('controller_name', CONTROLLER_NAME);
        $this->assign('action_name', ACTION_NAME);
        $this->assign('admin', $this->adminInfo);
        $this->assign('mpInfo', session('mpInfo'));
        $this->assign('setScreen', cookie('setScreen'));
    }

    public function mpListByMenu()
    {
        $list = model('mp')->getAll(['where' => ['user_id' => $this->adminId, 'status' => '1']]);
        $this->assign('mpByMenu', $list);
    }

    /**
     *  get sub menus
     * @param array $all_menus
     * @param $node
     * @return array
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function getSubMenus($all_menus, $node)
    {
        $menu = model('menu')->getOneByMap(['pid' => 0, 'url' => $node]);
        return KyTree::makeTree($all_menus, $menu['id']);
    }

    /**
     * check if login
     * Author: fudaoji<fdj@kuryun.cn>
     */
    protected function isLogin(){
        $this->adminId = (int)session("adminId");
        $this->adminInfo = model("admin")->getOne($this->adminId);
        if (empty($this->adminInfo)) {
            $this->redirect(url('admin/auth/login'));
        }
    }
}