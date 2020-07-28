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
 * Script Name: MiniTemplateLog.php
 * Create: 2020/7/25 下午11:09
 * Description: 小程序版本
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\model;

use ky\BaseModel;

class MiniTemplateLog extends BaseModel
{
    //0待提交审核 1为， 2为审核成功，3为审核失败，4为已发布, 5:为已撤回 6审核延后
    const READY = 0;
    const VERIFYING = 1;
    const SUCCESS = 2;
    const FAIL = 3;
    const PUBLISHED = 4;
    const CANCEL = 5;
    const DELAY = 6;

    /**
     * 版本状态
     * @param null $id
     * @return array|mixed
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public static function statusList($id = null){
        $list = [
            self::READY => '待提交审核',
            self::VERIFYING => '审核中',
            self::SUCCESS => '审核通过',
            self::FAIL => '审核失败',
            self::PUBLISHED => '已发布',
            self::CANCEL => '已撤回',
            self::DELAY => '审核延后'
        ];
        return isset($list[$id]) ? $list[$id] : $list;
    }
}