<?php
// +----------------------------------------------------------------------
// | [KyPHP System] Copyright (c) 2020 http://www.kuryun.com/
// +----------------------------------------------------------------------
// | [KyPHP] 并不是自由软件,你可免费使用,未经许可不能去掉KyPHP相关版权
// +----------------------------------------------------------------------
// | Author: fudaoji <461960962@qq.com>
// +----------------------------------------------------------------------
/**
 * Created by PhpStorm.
 * Script Name: Define.php
 * Create: 2020/3/1 16:59
 * Description:  Define some constance
 * Author: fudaoji<fdj@kuryun.cn>
 */
namespace app\behavior;
class Define
{
    public function run()
    {

        $module = strtolower(request()->module());
        $Controller = strtolower(request()->controller());
        $action = strtolower(request()->action());
        define('MODULE_NAME', $module);
        define('CONTROLLER_NAME', $Controller);
        define('ACTION_NAME', $action);
    }
}