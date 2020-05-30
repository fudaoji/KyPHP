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
 * Script Name: Admin.php
 * Create: 2020/5/19 下午8:29
 * Description:
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace addons\demo\controller;

use addons\demo\model\DemoArticle;
use think\Controller;

class Admin extends Controller
{
    private $articleM;

    public function initialize()
    {
        parent::initialize(); // TODO: Change the autogenerated stub
        $this->articleM = new DemoArticle();
    }


    public function index(){
        dump($this->articleM->getAll(['where' => ['status' => 1]]));exit;
    }
}