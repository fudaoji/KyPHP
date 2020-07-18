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
 * Script Name: AdminGroup.php
 * Create: 2020/7/18 上午9:20
 * Description:
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\event;

class AdminGroup extends Base
{
    /**
     * 当前用户是否可以添加平台
     * @param array $params ['admin_info' => [], 'type' => 'mp/mini']
     * @return bool
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function canAddStore($params = []){
        if($params['admin_info']['id'] != config('founder_id')){
            $group = model('adminGroup')->getOne($params['admin_info']['group_id']);
            $group['store_config'] = json_decode($group['store_config'], true);
            $count = model(ucfirst($params['type']))->total(['uid' => $params['admin_info']['id']], 1);
            if($group['store_config'][$params['type'].'_limit'] <= $count){
                return false;
            }
        }

        return true;
    }
}