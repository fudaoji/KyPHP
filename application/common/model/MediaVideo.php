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
 * Script Name: MediaVoice.php
 * Create: 2020/6/5 16:00
 * Description: 视频素材
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\model;

use ky\BaseModel;

class MediaVideo extends BaseModel
{
    protected $isCache = true;
    protected $key = 'uid';
    protected $rule = [
        'type' => 'mod', // 分表方式
        'num'  => 5      // 分表数量
    ];
}