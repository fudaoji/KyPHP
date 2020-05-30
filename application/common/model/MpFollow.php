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
 * Script Name: MpFollow
 * Create: 2020/3/3 下午4:51
 * Description: 公众号粉丝表
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\model;

use ky\BaseModel;

class MpFollow extends BaseModel
{
    protected $isCache = true;

    protected $key = 'mpid';
    protected $rule = [
        'type' => 'mod', // 分表方式
        'num'  => 5      // 分表数量
    ];

    /**
     * 获取粉丝报告
     * @param int $mid
     * @return mixed
     * @throws \Exception
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function getReport($mid = 0)
    {
        $subscribe = [];
        $subscribe_where = ['mpid' =>  $mid, 'subscribe' => 1];
        $ranges = [
            'today' => 'today', 'yesterday' => 'yesterday'
        ];
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

        $data['subscribe']['total'] = $this->total($subscribe_where);//截止今日关注总数
        $subscribe_where['subscribe_time'] = ['lt', strtotime(date('Y-m-d 00:00:00'))];
        $data['subscribe']['beforetoday'] = $this->total($subscribe_where);//截止昨日关注总数
        return $data;

    }

}