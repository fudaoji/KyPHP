<?php
// +----------------------------------------------------------------------
// | [KyPHP System] Copyright (c) 2020 http://www.kuryun.com/
// +----------------------------------------------------------------------
// | [KyPHP] 并不是自由软件,你可免费使用,未经许可不能去掉KyPHP相关版权
// +----------------------------------------------------------------------
// | Author: fudaoji <461960962@qq.com>
// +----------------------------------------------------------------------


namespace app\mp\controller;

use app\common\model\Addons;
use think\Controller;
use think\facade\Request;
use think\facade\View;

class Call extends Controller
{
    private $addon;
    private $col;
    private $act;
    private $adParam;
    private $addonsM;

    public function __construct()
    {
        $param = request()->param();
        $this->adParam = $param;
        session('addonRule', $param);
        $this->addon = $param['addon'];
        $this->col = $param['col'];
        $this->act = $param['act'];
        $this->addonsM = new Addons();
    }

    /**
     * 应用调起
     * @author geeson myrhzq@qq.com
     */
    public function run()
    {
        if ($this->addon && $this->col && $this->act) {

            $_addon = $this->addonsM->setCache(true)->getOneByMap(['addon' => $this->addon]);
            if (empty($_addon)) {
                $this->error('此应用不存在，可能已经撤消或者没有被安装');
            };
            if ($_addon['status'] != 1) {
                $this->error('此应用停用状态或者没有被安装');
            }
            session('addonName', $this->addon);

            if (file_exists($common_file = ADDON_PATH . $this->addon . '/Common.php')) {
                include $common_file; //加载公共文件
            }

            $view_config = [
                'tpl_replace_string' =>
                    [
                        '__STATIC__' => '/public/static/',
                        '__ADDONSTATIC__' => '/addons/' . $this->addon . '/static/'
                    ]
            ];
            View::config($view_config);

            $filename = ADDON_PATH . $this->addon . '/controller/' . ucfirst($this->col) . '.php';

            if (file_exists($filename)) {
                include_once $filename;
                $class = '\addons\\' . $this->addon . '\controller\\' . ucfirst($this->col);
                if (class_exists($class)) {
                    $model = new $class;
                    if (!method_exists($model, $this->act)) {
                        abort(500, lang($this->act . '方法不存在'));
                    }
                    return call_user_func_array([$model, $this->act], []);
                } else {
                    abort(500, lang($class . '不存在'));
                }
            } else {
                abort(500, lang($this->col . '控制器不存在'));
            }
        } else {
            abort(500, lang($this->addon . '找不到此应用'));
        }
    }

}