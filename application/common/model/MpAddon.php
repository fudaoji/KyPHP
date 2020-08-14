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
 * Script Name: MpAddon.php
 * Create: 2020/6/23 16:13
 * Description: 公众号-应用关联表
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\model;

use ky\BaseModel;

class MpAddon extends BaseModel
{
    protected $isCache = true;
    
    /**
     * 插件信息
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function addons(){
        $this->hasOne('Addons', 'addon', 'addon');
    }
}