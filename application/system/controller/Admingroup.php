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

namespace app\system\controller;

class Admingroup extends Base
{
    private $groupM;
    public function initialize(){
        parent::initialize();
        $this->groupM = model('adminGroup');
    }

    /**
     * 新增用户组
     * @return mixed
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function add(){
        return $this->show();
    }

    /**
     * 用户组列表
     * @return mixed
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function index(){
        $data_list = $this->groupM->page($this->pageSize, [], ['sort' => 'asc'], true, 1);
        $page = $data_list->render();
        return $this->show(['data_list' => $data_list, 'page' => $page]);
    }
}