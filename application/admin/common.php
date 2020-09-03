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
 * Script Name: common.php
 * Create: 2020/2/29 下午10:26
 * Description: admin common functions
 * Author: Doogie<461960962@qq.com>
 */

/**
 * 更新包sql执行文件
 * @param $sql_path
 * @return bool|string
 * @throws \think\db\exception\BindParamException
 * @throws \think\exception\PDOException
 * @author: fudaoji<fdj@kuryun.cn>
 */
function execute_addon_upgrade_sql($sql_path)
{
    $sql = file_get_contents($sql_path);
    $sql = str_replace("\r", "\n", $sql);
    $sql = explode(";\n", $sql);
    $original = '`__PREFIX__';
    $prefix = '`'.config('database.prefix');
    $sql = str_replace("{$original}", "{$prefix}", $sql); //替换掉表前缀

    foreach ($sql as $k => $value) {
        $value = trim($value, "\n");
        if(stripos($value, 'drop') !== false){
            return 'SQL语句包含了DROP TABLE类似的语句';
        }
        if (!empty($value)) {
            $sql[$k] = $value;
        }
    }

    foreach ($sql as $value) {
        if (empty($value) || strlen($value) < 2) { //过滤空行
            continue;
        }
        model('addons')->execute($value);
    }
    return true;
}

/**
 * sql执行文件
 * @param $sql_path
 * @return bool|string
 * @throws \think\db\exception\BindParamException
 * @throws \think\exception\PDOException
 * @author: fudaoji<fdj@kuryun.cn>
 */
function execute_addon_install_sql($sql_path)
{
    $sql = file_get_contents($sql_path);
    $sql = str_replace("\r", "\n", $sql);
    $sql = explode(";\n", $sql);
    $original = '`__PREFIX__';
    $prefix = '`'.config('database.prefix');
    $sql = str_replace("{$original}", "{$prefix}", $sql); //替换掉表前缀

    foreach ($sql as $k => $value) {
        $value = trim($value, "\n");
        if(stripos($value, 'drop') !== false){
            return 'SQL语句包含了DROP TABLE类似的语句';
        }
        if (!empty($value)) {
            if (substr($value, 0, 12) == 'CREATE TABLE') {
                $name = '';
                preg_match('|EXISTS `(.*?)`|', $value, $table_name1);
                preg_match('|TABLE `(.*?)`|', $value, $table_name2);

                !empty($table_name1[1]) && $name = $table_name1[1];
                empty($name) && !empty($table_name2[1]) && $name = $table_name2[1];

                if (empty($name)) {
                    return ($name . ' SQL语句有误，获取不到表名');
                }
                $res = model('addons')->query("SHOW TABLES LIKE '{$name}'");
                if ($res) {
                    return ($name . '表已经存在，请先手动卸载');
                }
            }
            $sql[$k] = $value;
        }
    }

    foreach ($sql as $value) {
        if (empty($value) || strlen($value) < 2) {
            continue;
        }
        model('addons')->execute($value);
    }
    return true;
}