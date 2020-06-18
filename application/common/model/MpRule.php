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
 * Script Name: ${FILE_NAME}
 * Create: 2020/3/3 下午11:16
 * Description: 回复规则
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\model;

use ky\BaseModel;

class MpRule extends BaseModel
{
    protected $autoWriteTimestamp = false;
    protected $isCache = true;
    protected $key = 'rule_mpid';
    protected $rule = [
        'type' => 'mod', // 分表方式
        'num'  => 5      // 分表数量
    ];

    /**
     * 回复类型
     * @param null $id
     * @return array|mixed
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public static function types($id = null){
        $list = [
            'text' => '文本',
            'image' => '图片',
            //'news' => '图文',
            'voice' => '语音',
            'music' => '音乐',
            'video' => '视频',
            'addon' => '应用'
        ];
        return isset($list[$id]) ? $list[$id] : $list;
    }
}