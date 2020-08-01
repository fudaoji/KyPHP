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
 * Script Name: SetTheme.php
 * Create: 2020/2/29 下午10:37
 * Description: set theme files position
 * Author: Doogie<461960962@qq.com>
 */

namespace app\behavior;

use think\facade\View;

class SetTheme
{
    public function run()
    {
        $root_path = env('root_path');
        $model = request()->module();
        /*if (request()->isMobile()) {
            $view_path = $root_path . 'themes/mobile/' . $model . '/';
        } else {
            $view_path = $root_path . 'themes/pc/' . $model . '/';
        }*/
        $view_path = $root_path . 'themes/pc/' . $model . '/';
        View::config('view_path', $view_path);
    }
}