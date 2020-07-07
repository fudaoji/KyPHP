<?php
/**
 * Created by PhpStorm.
 * Script Name: Addons.php
 * Create: 2020/5/16 下午2:35
 * Description: 插件应用
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\model;

use ky\BaseModel;

class Addons extends BaseModel
{
    /**
     * 获取应用的配置文件信息
     * @param string $name
     * @return bool|mixed
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function getAddonConfigByFile($name = '')
    {
        if (empty($name)) {
            return false;
        }

        $path = ADDON_PATH . $name . DIRECTORY_SEPARATOR . 'config.php';

        if (is_file($path)) {
            $config = @include($path);
            if ($config && is_array($config) && isset($config['addon'])
                && $config['addon'] == $name) {
                return $config;
            }
        }

        return false;
    }

    /**
     * 获取当前公众号对当前应用参数配置
     * @param string $name 当前应用标识
     * @param int $mpid 当前公众号标识
     * @return bool|mixed|null
     */
    public function getAddonConfigByMp($name='', $mpid=0)
    {
        if (empty($name)) {
            return false;
        }
        $where = ['addon' => $name];
        $mpid && $where['mpid'] = $mpid;
        $result = model('mpAddon')->getOneByMap($where);
        if (!empty($result)) {
            return json_decode($result['infos'], true);
        }
        return null;
    }

}