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
 * Create: 2020/7/2 16:45
 * Description: 插件验证器
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\validate;

use think\Validate;

class Addon extends Validate
{
    protected $rule = [
        'name' => 'require',
        'addon' => 'require',
        'version' => 'require',
        'logo' => 'require',
        'author' => 'require',
    ];

    protected $message = [
        'title.require' => '应用名称不能为空',
        'addon.require' => '应用标识不能为空',
        'version.require' => '版本不能为空',
        'logo.require' => 'Logo不能为空',
        'author.require' => '作者信息不能为空',
    ];
}