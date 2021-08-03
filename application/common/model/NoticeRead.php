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
 * Script Name: NoticeRead.php
 * Create: 2020/7/16 19:50
 * Description: 已读公告
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\model;

use ky\BaseModel;

class NoticeRead extends BaseModel
{
    protected $isCache = true;
    protected $autoWriteTimestamp = false;

    public function getUserRead($params = []){
        $read = $this->getOneByMap(['uid' => $params['uid']]);
        if(empty($read)){
            $this->addOne(['uid' => $params['uid']]);
        }
        return $this->getOneByMap(['uid' => $params['uid']], true, true);
    }
}