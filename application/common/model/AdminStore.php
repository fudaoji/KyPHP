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
 * Script Name: AdminStore.php
 * Create: 2020/5/27 下午11:11
 * Description: 用户平台
 * Author: fudaoji<fdj@kuryun.cn>
 */
namespace app\common\model;

use ky\BaseModel;

class AdminStore extends BaseModel
{
    const MP = 'mp';
    const MINIAPP = 'miniapp';
    const APP = 'app';
    const PC = 'pc';
}