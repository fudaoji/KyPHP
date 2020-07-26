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
 * Script Name: Mp.php
 * Create: 2020/7/23 下午13:28
 * Description: 小程序验证器
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\validate;

use think\Validate;

class Mini extends Validate
{
    protected $rule = [
        '__token__' => 'require|token',
        'nick_name'  =>  'require|max:20',
        'signature'  => 'max:200',
        'verify_type_info'  => 'require',
        'appid'     => 'require|max:64|checkExists',
        'appsecret'  => 'require|max:64',
        'user_name'  => 'require|max:32',
        'head_img'  => 'url',
        'qrcode_url'  => 'url'
    ];

    //错误消息
    protected $message  =   [
        'nick_name.require' => '昵称必须',
        'nick_name.max'     => '昵称最多不能超过20个字符',
        'signature.max'     => '描述最多不能超过200个字符',
        'verify_type_info.require' => '认证状态必须',
        'appid.checkExists' => 'appID已存在',
        'appid.require'     => 'appID必须',
        'appid.max'     => 'appID错误',
        'appsecret.require'     => 'appsecret必须',
        'appsecret.max'     => 'appsecret错误',
        'user_name.require'     => '原始ID必须',
        'user_name.max'     => '原始ID错误',
        'head_img'     => '头像链接错误',
        'qrcode_url'     => '二维码链接错误',
    ];

    /**
     * 验证appid是否被占用
     * @param $value
     * @param $rule
     * @param $data
     * @return bool
     * @author: fudaoji<fdj@kuryun.cn>
     */
    protected function checkExists($value, $rule, $data){
        $where = ['appid' => $value];
        if(isset($data['id'])){
            $where['id'] = ['neq', $data['id']];
        }
        $admin = model('mini')->getOneByMap($where);
        return $admin ? false : true;
    }

    /**
     * add 验证场景定义
     * @return \app\common\model\Mini
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function sceneAdd()
    {
        return $this->only([
            '__token__','nick_name','signature','verify_type_info',
            'appid','appsecret', 'user_name', 'head_img', 'qrcode_url']);
    }

    /**
     * edit 验证场景定义
     * @return \app\common\model\Mini
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function sceneEdit()
    {
        return $this->only([
            '__token__','nick_name','signature','verify_type_info',
            'appid','appsecret', 'user_name', 'head_img', 'qrcode_url']);
    }
}