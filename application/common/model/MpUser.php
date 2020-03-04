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
 * Create: 2020/3/3 下午4:51
 * Description: 公众号粉丝表
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\model;

use ky\BaseModel;

class MpUser extends BaseModel
{
    protected $isCache = true;

    protected $key = 'mpid';
    protected $rule = [
        'type' => 'mod', // 分表方式
        'num'  => 10      // 分表数量
    ];

    /**
     * 获取粉丝报告
     * @param int $mid
     * @return mixed
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function getReport($mid = 0)
    {
        $subscribe = [];
        $subscribe_where = ['mpid' =>  $mid, 'subscribe' => 1];
        $ranges = [
            'today' => 'today', 'yesterday' => 'yesterday', 'week' => 'week',
            'lastweek' => 'last week', 'month' => 'month', 'lastmonth' => 'last month',
            'year' => "year", 'lastyear' => 'last year'];
        foreach($ranges as $k => $t){
            $subscribe[$k] = $this->totalByTime([
                'where' => $subscribe_where,
                'timeFields' => [
                    ['subscribe_time', $t]
                ]
            ]);
        }
        $data['subscribe'] = $subscribe;

        $unsubscribe = [];
        $unsubscribe_where = ['mpid' =>  $mid, 'subscribe' => 0];
        foreach($ranges as $k => $t){
            $unsubscribe[$k] = $this->totalByTime([
                'where' => $unsubscribe_where,
                'timeFields' => [
                    ['unsubscribe_time', $t]
                ]
            ]);
        }
        $data['unsubscribe'] = $unsubscribe;

        $subscribe_total = $this->total($subscribe_where);//关注总数
        $unsubscribe_total = $this->total($unsubscribe_where);//取消关注总数

        $data['total'] = [
            'total' => $subscribe_total + $unsubscribe_total,
            'subscribe_total' => $subscribe_total,
            'unsubscribe_total' => $unsubscribe_total
        ];
        return $data;

    }

}