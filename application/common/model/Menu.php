<?php
// +----------------------------------------------------------------------
// | [KyPHP System] Copyright (c) 2020 http://www.kuryun.com/
// +----------------------------------------------------------------------
// | [KyPHP] 并不是自由软件,你可免费使用,未经许可不能去掉KyPHP相关版权
// +----------------------------------------------------------------------
// | Author: fudaoji <461960962@qq.com>
// +----------------------------------------------------------------------
/**
 * Created by PhpStorm.
 * Script Name: ${FILE_NAME}
 * Create: 2020/3/1 16:49
 * Description: Menu model
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\model;

use ky\BaseModel;

class Menu extends BaseModel
{
    protected $isCache = false;

    /**
     * 获取顶部菜单
     * @param array $group_info
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function getTopMenus($group_info = []){
        $where = ['pid' => 0, 'status' => 1];
        $aid = (int)session("adminId");
        if($aid != config('founder_id')) { //非创始人
            $where['id'] = ['in', $group_info['menu_config']];
        }

        return $this->getAll(['where' => $where, 'order' => 'sort asc']);
    }

    /**
     * 获取侧边菜单栏
     * @param int $pid
     * @param array $group_info
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function getSideMenus($pid = 0, $group_info = []){
        $where = ['pid' => $pid, 'status' => 1,'type' => 1];
        $aid = (int)session("adminId");
        if($aid != config('founder_id')) { //非创始人
            $where['id'] = ['in', $group_info['menu_config']];
        }
        return $this->getAll([
            'where' => $where,
            'order' => ['sort' => 'asc']
        ]);
    }
}