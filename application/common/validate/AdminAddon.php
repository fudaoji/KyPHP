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
 * Script Name: AdminAddon.php
 * Create: 2020/7/15 16:45
 * Description: 用户-应用
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\validate;

class AdminAddon extends Base
{
    protected $rule = [
        'id'    => 'checkId',
        'addon' => 'require',
        'uid' => 'require|checkUid',
        'deadline' => 'require|date'
    ];

    protected $message = [
        'addon.require' => '请选择应用',
        'uid.require' => '请选择会员',
        'uid.checkUid' => '会员不存在',
        'deadline.require' => '请选择到期时间',
        'deadline.date' => '到期时间格式错误',
    ];

    /**
     * 验证UID是否存在
     * @param $value
     * @param $rule
     * @param $data
     * @return bool
     * @author: fudaoji<fdj@kuryun.cn>
     */
    protected function checkUid($value, $rule, $data)
    {
        return model('admin')->getOne((int)$value) ? true : false;
    }

    /**
     * 验证ID是否存在
     * @param $value
     * @param $rule
     * @param $data
     * @return bool
     * @author: fudaoji<fdj@kuryun.cn>
     */
    protected function checkId($value, $rule, $data)
    {
        return model('adminAddon')->getOne((int)$value) ? true : false;
    }

    /**
     * add 验证场景定义
     * @return Admin
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function sceneEdit()
    {
        return $this->only(['__token__','id', 'deadline']);
    }

    /**
     * add 验证场景定义
     * @return Admin
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function sceneAdd()
    {
        return $this->only(['__token__', 'addon','uid','deadline']);
    }
}