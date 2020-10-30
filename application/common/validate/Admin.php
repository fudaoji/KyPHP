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
 * Script Name: Admin.php
 * Create: 2020/5/23 下午4:22
 * Description:
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\validate;
use think\Validate;

class Admin extends Validate
{
    protected $rule = [
        '__token__' => 'require|token',
        'id'    => 'checkId',
        'group_id' => 'require',
        'username'  =>  'require|min:3|max:20',
        'password'  => 'require|min:6|max:20',
        'repassword'  => 'confirm:password',
        'email' =>  'email',
        'tel' =>  'mobile',
        'realname'  => 'min:2|max:10',
    ];

    //错误消息
    protected $message  =   [
        'id.checkId' => '数据不存在',
        'group_id.require' => '请选择角色',
        'username.require' => '账号必须',
        'username.max'     => '账号最多不能超过20个字符',
        'username.min'     => '账号至少3个字符',
        'username.checkExists' => '账号已存在',
        'password.require' => '密码必须',
        'password.max'     => '密码最多不能超过20个字符',
        'password.min'     => '密码至少6个字符',
        'repassword'       => '两次密码不一致',
        'tel'  => '手机号码格式错误',
        'email'        => '邮箱格式错误',
        'realname.max'     => '姓名最多不能超过10个字符',
        'realname.min'     => '姓名至少2个字符',
    ];

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
        return model('admin')->getOne((int)$value) ? '非法操作' : false;
    }

    /**
     * 验证账号是否被占用
     * @param $value
     * @param $rule
     * @param $data
     * @return bool
     * @author: fudaoji<fdj@kuryun.cn>
     */
    protected function checkExists($value, $rule, $data){
        $where = ['username' => $value];
        if(isset($data['id'])){
            $where['id'] = ['neq', $data['id']];
        }
        $admin = model('admin')->getOneByMap($where);
        return $admin ? '账号已被占用' : true;
    }

    /**
     * add 验证场景定义
     * @return Admin
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function sceneEdit()
    {
        return $this->only(['__token__','id', 'username','email','mobile','realname'])
            ->append('username', 'checkExists')
            ->append('id', 'checkId');
    }

    /**
     * add 验证场景定义
     * @return Admin
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function sceneAdd()
    {
        return $this->only(['__token__','username','password','email','mobile','realname'])
            ->append('username', 'checkExists');
    }

    /**
     * resetPwd 验证场景定义
     * @return Admin
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function sceneResetPwd()
    {
        return $this->only(['__token__','password','repassword']);
    }

}