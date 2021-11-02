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
 * Script Name: SensitiveWord.php
 * Create: 2021/10/21 14:02
 * Description: 敏感词库
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\model;

class SensitiveWord extends Base
{
    protected $isCache = true;
    protected $autoWriteTimestamp = false;
}