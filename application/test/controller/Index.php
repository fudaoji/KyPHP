<?php
// +----------------------------------------------------------------------
// | [KyPHP System] Copyright (c) 2020 http://www.kuryun.com/
// +----------------------------------------------------------------------
// | [KyPHP] 并不是自由软件,你可免费使用,未经许可不能去掉KyPHP相关版权
// +----------------------------------------------------------------------
// | License  https://gitee.com/fudaoji/KyPHP/blob/master/LICENSE
// +----------------------------------------------------------------------

/**
 * Created by PhpStorm.
 * Script Name: Index.php
 * Create: 2020/8/14 上午12:31
 * Description:
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\test\controller;

class Index
{
    /**
     * 消息队列测试
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function queue(){
        controller('common/TaskQueue', 'event')->push([
            'delay' => 2,
            'params' => [
                'do' => ['\\app\\common\\event\\TaskQueue', 'testTask']
            ]
        ]);
        echo '任务入队列';
    }
}