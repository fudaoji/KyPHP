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
            $cf = model('addons')->getAddonConfigByFile();
            if (isset($cf['install_sql']) && $cf['install_sql'] != '') {
                $install_file = ADDON_PATH . $name . DS . $cf['install_sql'];
                if (is_file($install_file)) {//有数据表安装文件
                    $sql = file_get_contents($install_file);
                    $sql = str_replace("\r", "\n", $sql);
                    $sql = explode(";\n", $sql);
                    $original = '`rh_';
                    $prefix = '`'.config('database.prefix');
                    $sql = str_replace("{$original}", "{$prefix}", $sql);
                    foreach ($sql as $value) {
                        $value = trim($value);
                        if (!empty($value)) {
                            if (substr($value, 0, 12) == 'CREATE TABLE') {
                                $table_name = '';
                                preg_match('|EXISTS `(.*?)`|', $value, $out_value1);
                                preg_match('|TABLE `(.*?)`|', $value, $out_value2);
                                if (isset($out_value1[1]) && !empty($out_value1[1])) {
                                    $table_name = $out_value1[1];
                                }
                                if (isset($out_value2[1]) && !empty($out_value2[1])) {
                                    $table_name = $out_value2[1];
                                }
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
            model('addonInfo')->where('addon', '=', $name)->delete();
            Db::commit();
            $res = true;
        }catch (\Exception $e){
            \think\facade\Log::write("错误原因：" . json_encode($e->getMessage()));
            Db::rollback();
            $res = false;
        }
        return $res;
    }

    /**
     * 获取插件logo
     * @param array $params
     * @return bool|string
     * @author: fudaoji<fdj@kuryun.cn>
     */
    function getAddonLogoLocal($params = [])
    {
        $name = isset($params['name']) ? $params['name'] : '';
        $type = empty($params['type']) ? 'mp' : $params['type'];
        if ($name == '') {
            return false;
        }
        $url = '';
        if ($type == 'mp') {
            $info = model('addons')->getAddonConfigByFile($name);
            $logo_file = env('root_path') . '/addons/' . $name . '/' . $info['logo'];

            if (is_file($logo_file)) {
                if ($fp = fopen($logo_file, "rb", 0)) {
                    $gambar = fread($fp, filesize($logo_file));
                    fclose($fp);
                    $base64 = chunk_split(base64_encode($gambar));
                    $url = 'data:image/jpg/png/gif;base64,' . $base64;
                }
                //return getHostDomain() . '/addons/' . $name . '/' . $info['logo'];
            }
        } elseif ($type == 'miniapp') {
            $model = new \app\common\model\MiniappAddon();
            $info = $model->getAddonByFile($name);
            $loginFile = MINIAPP_PATH . $name . '/' . $info['logo'];
            if (is_file($loginFile)) {
                $url = getHostDomain() . '/miniapp/' . $name . '/' . $info['logo'];
            }
        }
        return $url;
    }
}