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
 * Script Name: Addon.php
 * Create: 2020/5/17 下午8:53
 * Description: 插件event
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\event;

use think\Db;
use think\facade\Log;

class Addon extends Base
{
    /**
     * 获取公众号插件模板风格
     * @param array $params
     * @return array|bool
     * Author: fudaoji<fdj@kuryun.cn>
     */
    function getAddonThemes($params = []){
        $name = $params['name'];
        $themes = [];
        $view_path = ADDON_PATH . $name . '/view/';
        if (!is_dir($view_path))
            return false;
        $handle = opendir($view_path);
        if ($handle) {
            while (false !== ($item = readdir($handle))) {
                if ($item != '.' && $item != '..' && $item != 'common' && $item != 'admin') {
                    if (!strpos($item, '.')) {
                        $themes[] = $item;
                    }
                }
            }
            closedir($handle);
        }
        return $themes;
    }

    /**
     * 情况插件数据
     * @param array $params
     * @return bool|mixed
     * Author: fudaoji<fdj@kuryun.cn>
     */
    function clearAddonData($params = []){
        $name = $params['name'];
        Db::startTrans();
        try {
            $cf = model('addons')->getAddonConfigByFile($name);
            if (isset($cf['install_sql']) && $cf['install_sql'] != '') {
                $install_file = ADDON_PATH . $name . DS . $cf['install_sql'];
                if (is_file($install_file)) {//有数据表安装文件
                    $sql = file_get_contents($install_file);
                    $sql = str_replace("\r", "\n", $sql);
                    $sql = explode(";\n", $sql);
                    $original = '`__PREFIX__';
                    $prefix = '`'.config('database.prefix');
                    $sql = str_replace("{$original}", "{$prefix}", $sql);

                    foreach ($sql as $value) {
                        $value = trim($value);
                        if (!empty($value)) {
                            if (substr($value, 0, 12) == 'CREATE TABLE') {
                                $table_name = '';
                                preg_match('|EXISTS `(.*?)`|', $value, $table_name1);
                                preg_match('|TABLE `(.*?)`|', $value, $table_name2);

                                !empty($table_name1[1]) && $table_name = $table_name1[1];
                                empty($table_name) && !empty($table_name2[1]) && $table_name = $table_name2[1];

                                if ($table_name) {//如果存在表名
                                    $res = model('addons')->query("SHOW TABLES LIKE '{$table_name}'");
                                    if ($res) {//数据库中存在着表，
                                        model('addons')->execute("DROP TABLE `{$table_name}`;");
                                    }
                                }
                            }
                        }
                    }
                }
            }

            model('addons')->where('addon', '=', $name)->delete();
            model('mpAddon')->where('addon', '=', $name)->delete();
            Db::commit();
            $res = true;
        }catch (\Exception $e){
            Log::write("错误原因：" . json_encode($e->getMessage()));
            Db::rollback();
            $res = false;
        }
        return $res;
    }
}