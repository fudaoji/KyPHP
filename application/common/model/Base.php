<?php
/**
 * Created by PhpStorm.
 * Script Name: Base.php
 * Create: 2020/9/29 15:45
 * Description: 项目模型基类
 * Author: fudaoji<fdj@kuryun.cn>
 */
namespace app\common\model;

use ky\BaseModel;

class Base extends BaseModel
{
    /**
     * 手动设置分表key，因为多表关联查询时会遇到
     * Author: fudaoji<fdj@kuryun.cn>
     * @param string $key
     * @return \ky\BaseModel
     */
    public function setKey($key = ''){
        $this->key = $key;
        return $this;
    }

    /**
     * 获取所在表名称
     * @param $key_id
     * @return string
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function getRealTableName($key_id){
        return $this->getTable() .'_' . ($key_id % $this->rule['num'] + 1);
    }
}