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
     * 手动设置分表key，因为多表关联查询时会有表别名，因此需要临时修改分表key
     * Author: fudaoji<fdj@kuryun.cn>
     * @param string $key
     * @return \ky\BaseModel
     */
    public function setKey($key = ''){
        $this->key = $key;
        return $this;
    }

    /**
     * 获取实际表名，用于被关联表有多个分表的情况
     * @param $key_id
     * @return string
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function getRealTableName($key_id){
        switch ($this->rule['type']){
            case 'year':
                $table = $this->getTable() .'_' . ($key_id - $this->rule['expr'] + 1);
                break;
            default:
                $table = $this->getTable() .'_' . ($key_id % $this->rule['num'] + 1);
                break;
        }
        return $table;
    }
}