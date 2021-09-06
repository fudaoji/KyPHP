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
 * Script Name: Base.php
 * Create: 2020/2/29 下午10:18
 * Description: admin controller base
 * Author: Doogie<461960962@qq.com>
 */

namespace app\admin\controller;
use app\common\controller\BaseCtl;
use ky\KyTree;

class Base extends BaseCtl
{
    protected $adminId;
    protected $adminInfo;
    protected $pageSize = 15;
    protected $adminGroupInfo;

    public function initialize()
    {
        parent::initialize();

        if(CONTROLLER_NAME !== 'auth' && !request()->isPost()){
            //记录当前url
            cookie('redirect_url', request()->domain().request()->url());
        }

        $this->isLogin();
        //后台菜单层级是确定的 顶部（带URL）-》侧栏父菜单（无URL）-》侧栏功能菜单（带URL）-》页面权限（带URL，不显示在菜单栏）
        $node = MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME;
        $current_menu = model('menu')->getOneByMap(['url' => $node]);
        $top_menu = [];
        $side_menu = [];
        $side_menus = [];
        $t_menus = model("menu")->getTopMenus($this->adminGroupInfo);
        if(!empty($current_menu)){
            if($current_menu['pid'] == 0){ //说明是顶部菜单
                $top_menu = $current_menu;
                $side_menu = model('menu')->getOneByMap(['url' => $node, 'pid' => ['gt', 0]]);
            }else{
                $p_menu = model('menu')->getOneByMap(['id' => $current_menu['pid']]);
                if($current_menu['type'] == 1){
                    $side_menu = $current_menu;
                }else{
                    if($p_menu['pid'] == 0){ //说明是顶部菜单的直属权限
                        $top_menu = $p_menu;
                    }else{
                        $side_menu = $p_menu;
                    }
                }
                if(empty($top_menu) && $side_menu){
                    $p_side_menu = model('menu')->getOneByMap(['id' => $side_menu['pid']]);
                    $top_menu = model('menu')->getOneByMap(['id' => $p_side_menu['pid']]);
                }

            }

            $side_menus = (array) model('menu')->getSideMenus($top_menu['id'], $this->adminGroupInfo);
            foreach ($side_menus as &$v){
                $v['child'] = model('menu')->getSideMenus($v['id'], $this->adminGroupInfo);
            }
            
        }

        $this->assign('t_menus', $t_menus);
        $this->assign('top_menu', $top_menu);
        $this->assign('side_menu', $side_menu);
        $this->assign('side_menus', $side_menus);
        $this->assign('node', $node);
        $this->assign('current_menu', $current_menu);
        $this->assign('controller_name', CONTROLLER_NAME);
        $this->assign('action_name', ACTION_NAME);
        $this->assign('admin', $this->adminInfo);
        $this->assign('mp_info', cookie('mpInfo'));
        $this->assign('screen_size', (int)cookie('screen_size'));
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
        $this->adminGroupInfo = model('adminGroup')->getOne($this->adminInfo['group_id']);
        if($this->adminGroupInfo){
            $this->adminGroupInfo['menu_config'] = explode(',', $this->adminGroupInfo['menu_config']);
            $this->adminGroupInfo['store_config'] = json_decode($this->adminGroupInfo['store_config'], true);
        }
    }
}