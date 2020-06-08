<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

/**
 * 下载远程文件到本地
 * @param $url
 * @param string $type
 * @param string $filename
 * @return string
 * Author: Doogie<fdj@kuryun.cn>
 */
function download_file($url, $type = 'image', $filename = '')
{
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 30);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
    $file = curl_exec($ch);
    curl_close($ch);
    switch ($type){
        case 'voice':
            $ext = '.mp3';
            break;
        case 'video':
            $ext = '.mp4';
            break;
        default:
            $ext = '.png';
    }
    $filename = $filename ? $filename : md5(pathinfo($url, PATHINFO_BASENAME) . time()).$ext;
    $path = UPLOAD_PATH . '/temp/';
    if(! file_exists($path)){
        @mkdir($path, 0777);
    }
    $resource = fopen($path . $filename, 'a');
    fwrite($resource, $file);
    fclose($resource);
    return $path . $filename;
}
/**
 * 获取服务器ip
 * @return array|false|mixed|string
 * Author: fudaoji<fdj@kuryun.cn>
 */
function get_server_ip()
{
    if (isset($_SERVER['SERVER_NAME'])) {
        return gethostbyname($_SERVER['SERVER_NAME']);
    } else {
        if (isset($_SERVER)) {
            if (isset($_SERVER['SERVER_ADDR'])) {
                $server_ip = $_SERVER['SERVER_ADDR'];
            } elseif (isset($_SERVER['LOCAL_ADDR'])) {
                $server_ip = $_SERVER['LOCAL_ADDR'];
            }
        } else {
            $server_ip = getenv('SERVER_ADDR');
        }
        return $server_ip ? $server_ip : '获取不到服务器IP';
    }
}

/**
 * 将下划线命名转换为驼峰式命名
 * @param string $str
 * @param boolean $ucfirst
 * @return string
 * @author Jason<dcq@kuryun.cn>
 */
function camel_case($str , $ucfirst = false) {
    $str = ucwords(str_replace('_', ' ', $str));
    $str = str_replace(' ', '', lcfirst($str));

    return $ucfirst ? ucfirst($str) : $str;
}

/**
 * hash密码加密
 * @param $password
 * @return bool|string
 * @author: fudaoji<fdj@kuryun.cn>
 */
function ky_generate_password($password) {
    $options['cost']  = 10;
    return password_hash($password, PASSWORD_DEFAULT, $options);
}

/**
 * 递归删除文件夹
 * @param $path
 * @param bool $del_dir
 * @return bool
 * Author: fudaoji<fdj@kuryun.cn>
 */
function del_dir_recursively($path, $del_dir = true)
{
    $handle = opendir($path);
    if ($handle) {
        while (false !== ($item = readdir($handle))) {
            if ($item != '.' && $item != '..')
                is_dir("$path/$item") ? del_dir_recursively("$path/$item", $del_dir) : unlink("$path/$item");
        }
        closedir($handle);
        if ($del_dir)
            return rmdir($path);
    } else {
        if (file_exists($path)) {
            return unlink($path);
        }
    }
    return true;
}

/**
 * sql执行文件
 * @param $sql_path
 * @throws \think\db\exception\BindParamException
 * @throws \think\exception\PDOException
 * @author: fudaoji<fdj@kuryun.cn>
 */
function execute_addon_install_sql($sql_path)
{
    $sql = file_get_contents($sql_path);
    $sql = str_replace("\r", "\n", $sql);
    $sql = explode(";\n", $sql);
    $original = '`rh_';
    $prefix = '`'.config('database.prefix');
    $sql = str_replace("{$original}", "{$prefix}", $sql);

    foreach ($sql as $k => $value) {
        $value = trim($value);
        if (!empty($value)) {
            if (substr($value, 0, 12) == 'CREATE TABLE') {
                // $name = preg_replace("/^CREATE TABLE `(\w+)` .*/s", "\\1", $value);
                $name = '';
                preg_match('|EXISTS `(.*?)`|', $value, $table_name1);
                preg_match('|TABLE `(.*?)`|', $value, $table_name2);
                if (isset($table_name1[1]) && !empty($table_name1[1])) {
                    $name = $table_name1[1];
                }
                if (isset($table_name2[1]) && !empty($table_name2[1])) {
                    $name = $table_name2[1];
                }
                if (!$name) {
                    $this->error($name . ' SQL语句有误，获取不到表名');
                }
                $res = model('addons')->query("SHOW TABLES LIKE '{$name}'");
                if ($res) {
                    $this->error($name . '表已经存在，请先手动卸载');
                }
            }
            $sql[$k] = $value;
        }
    }
    foreach ($sql as $value) {
        if (empty($value)) {
            continue;
        }
        model('addons')->execute($value);
    }
}

/**
 * curl post 请求
 * @param $url
 * @param $data
 * @param bool $curlFile
 * @return bool|mixed
 * @author: fudaoji<fdj@kuryun.cn>
 */
function http_post($url, $data, $curlFile = false)
{

    if ($curlFile == true) {
        $data = json_decode($data, true);
        if (is_array($data)) {
            foreach ($data as &$value) {
                if (is_string($value) && $value[0] === '@' && class_exists('CURLFile', false)) {
                    $filename = realpath(trim($value, '@'));
                    file_exists($filename) && $value = new CURLFile($filename);
                }
            }
        }
    }
    $cl = curl_init();
    curl_setopt($cl, CURLOPT_URL, $url);
    curl_setopt($cl, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($cl, CURLOPT_SSL_VERIFYHOST, false);
    curl_setopt($cl, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($cl, CURLOPT_HEADER, false);
    curl_setopt($cl, CURLOPT_POST, true);
    curl_setopt($cl, CURLOPT_TIMEOUT, 60);
    curl_setopt($cl, CURLOPT_POSTFIELDS, http_build_query($data));
    list($content, $status) = array(curl_exec($cl), curl_getinfo($cl), curl_close($cl));
    return (intval($status["http_code"]) === 200) ? $content : false;
}

/**
 * 扩展应用 URL 生成
 * @author geeson myrhzq@qq.com
 * @param $url  string 应用url/应用名称/控制器/方法
 * @param $arr array 参数
 */
function addon_url($url = '', $vars = '', $suffix = true, $domain = false)
{
    if (!empty($addonRule = session('addonRule')) || $url != '') {
        $addonName = isset($addonRule['addon']) ? $addonRule['addon'] : '';
        $addonController = isset($addonRule['col']) ? $addonRule['col'] : '';
        $addonAction = isset($addonRule['act']) ? $addonRule['act'] : '';
        $node = '';
        if ($url == '') {
            $node = $addonName . '/' . $addonController . '/' . $addonAction;
        } else {
            $nodeArr = array_values(array_filter(explode('/', $url)));
            switch (count($nodeArr)) {
                case 1:
                    $node = $addonName . '/' . $addonController . '/' . $nodeArr[0];
                    break;
                case 2:
                    $node = $addonName . '/' . $nodeArr[0] . '/' . $nodeArr[1];
                    break;
                case 3:
                    $node = $nodeArr[0] . '/' . $nodeArr[1] . '/' . $nodeArr[2];
                    break;
            }
        }
        if (!empty($_mid = input('_mid')) || isset($vars['_mid'])) {
            if (empty($_mid) && isset($vars['_mid'])) {
                $_mid = $vars['_mid'];
            }
            $url = \think\facade\Url::build('/api/' . $_mid . '/' . $node, $vars, $suffix, $domain);

        } else {
            if (!empty($mid = input('mid'))) {
                if (is_array($vars)) {
                    $vars = array_merge($vars, ['mid' => $mid]);
                } elseif ($vars != '' && !is_array($vars)) {
                    $vars = $vars . '&' . 'mid=' . $mid;
                } else {
                    $vars = ['mid' => $mid];
                }
            }
            $url = \think\facade\Url::build(ADDON_ROUTE . $node, $vars, $suffix, $domain);
        }
        return str_replace('.' . config('template.view_suffix'), '', $url);
    }
}

/**
 * +----------------------------------------------------------
 * 产生随机字串，可用来自动生成密码 默认长度6位 字母和数字混合
 * +----------------------------------------------------------
 * @param int $len 长度
 * @param string $type 字串类型
 * 0 字母 1 数字 其它 混合
 * @param string $addChars 额外字符
 * +----------------------------------------------------------
 * @return string
 * +----------------------------------------------------------
 */
function get_rand_char($len = 6, $type = '', $addChars = '')
{
    $str = '';
    switch ($type) {
        case 0:
            $chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz' . $addChars;
            break;
        case 1:
            $chars = str_repeat('0123456789', 3);
            break;
        case 2:
            $chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' . $addChars;
            break;
        case 3:
            $chars = 'abcdefghijklmnopqrstuvwxyz' . $addChars;
            break;
        case 4:
            $chars = "们以我到他会作时要动国产的一是工就年阶义发成部民可出能方进在了不和有大这主中人上为来分生对于学下级地个用同行面说种过命度革而多子后自社加小机也经力线本电高量长党得实家定深法表着水理化争现所二起政三好十战无农使性前等反体合斗路图把结第里正新开论之物从当两些还天资事队批点育重其思与间内去因件日利相由压员气业代全组数果期导平各基或月毛然如应形想制心样干都向变关问比展那它最及外没看治提五解系林者米群头意只明四道马认次文通但条较克又公孔领军流入接席位情运器并飞原油放立题质指建区验活众很教决特此常石强极土少已根共直团统式转别造切九你取西持总料连任志观调七么山程百报更见必真保热委手改管处己将修支识病象几先老光专什六型具示复安带每东增则完风回南广劳轮科北打积车计给节做务被整联步类集号列温装即毫知轴研单色坚据速防史拉世设达尔场织历花受求传口断况采精金界品判参层止边清至万确究书" . $addChars;
            break;
        default:
            // 默认去掉了容易混淆的字符oOLl和数字01，要添加请使用addChars参数
            $chars = 'ABCDEFGHIJKMNPQRSTUVWXYZabcdefghijkmnpqrstuvwxyz23456789' . $addChars;
            break;
    }
    if ($len > 10) {
        //位数过长重复字符串一定次数
        $chars = $type == 1 ? str_repeat($chars, $len) : str_repeat($chars, 5);
    }
    if ($type != 4) {
        $chars = str_shuffle($chars);
        $str = substr($chars, 0, $len);
    } else {
        // 中文随机字
        for ($i = 0; $i < $len; $i++) {
            $str .= msubstr($chars, floor(mt_rand(0, mb_strlen($chars, 'utf-8') - 1)), 1);
        }
    }
    return $str;
}

/*
 * 行为侦听
 * @author geeson myrhzq@qq.com
 * @param $name  string 行为名称
 * @param $arr array 参数
 */
function hook($name = '', $params = [])
{
    think\facade\Hook::listen($name, $params);
}

/**
 * 获取所有数据并转换成一维数组
 * @param $model
 * @param array $where
 * @param null $extra
 * @param string $key
 * @param array $order
 * @return array
 * @author: fudaoji<fdj@kuryun.cn>
 */
function select_list_as_tree($model, $where = [], $extra = null, $key = 'id', $order=['sort' => 'asc']) {
    //获取列表
    $con['status'] = 1;
    if ($where) {
        $con = array_merge($con, $where);
    }

    $list = $model->getAll([
        'where' => $con,
        'order' => $order
    ]);

    $result = [];
    if($list){
        //转换成树状列表(非严格模式)
        $list = app\common\facade\KyTree::toFormatTree($list, 'title', 'id', 'pid', 0, false);

        if ($extra) {
            $result[0] = $extra;
        }

        //转换成一维数组
        foreach ($list as $val) {
            $result[$val[$key]] = $val['title_show'];
        }
    }

    return $result;
}

// 应用公共文件
/**
 * 将list_to_tree的树还原成列表
 * @param  array $tree 原来的树
 * @param  string $child 孩子节点的键
 * @param  string $order 排序显示的键，一般是主键 升序排列
 * @param  array $list 过渡用的中间数组，
 * @return array        返回排过序的列表数组
 * @author yangweijie <yangweijiester@gmail.com>
 */
function tree_to_list($tree, $child = 'child', $order = 'id', &$list = array())
{
    if (is_array($tree)) {
        $refer = array();
        foreach ($tree as $key => $value) {
            $reffer = $value;
            if (isset($reffer[$child])) {
                if ($reffer[$child] == null) {

                } else {
                    unset($reffer[$child]);
                    tree_to_list($value[$child], $child, $order, $list);
                }

            }
            $list[] = $reffer;
        }
        $list = list_sort_by($list, $order, $sortby = 'asc');
    }
    return $list;
}

/**
 * 对查询结果集进行排序
 * @access public
 * @param array $list 查询结果
 * @param string $field 排序的字段名
 * @param array $sortby 排序类型
 * asc正向排序 desc逆向排序 nat自然排序
 * @return array
 */
function list_sort_by($list, $field, $sortby = 'asc')
{
    if (is_array($list)) {
        $refer = $resultSet = array();
        foreach ($list as $i => $data)
            $refer[$i] = &$data[$field];
        switch ($sortby) {
            case 'asc': // 正向排序
                asort($refer);
                break;
            case 'desc':// 逆向排序
                arsort($refer);
                break;
            case 'nat': // 自然排序
                natcasesort($refer);
                break;
        }
        foreach ($refer as $key => $val)
            $resultSet[] = &$list[$key];
        return $resultSet;
    }
    return false;
}