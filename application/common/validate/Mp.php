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
 * Create: 2020/5/24 下午6:28
 * Description: 公众号验证器
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\validate;

use think\Validate;

class Mp extends Validate
{
    protected $rule = [
        '__token__' => 'require|token',
        'nick_name'  =>  'require|max:20',
        'service_type_info'  => 'require',
        'verify_type_info'  => 'require',
        'appid'     => 'require|max:64',
        'appsecret'  => 'require|max:64',
        'user_name'  => 'require|max:32',
        'alias' =>  'max:32',
        'head_img'  => 'url',
        'qrcode_url'  => 'url',
        'refresh_token' => 'require|min:4'
    ];

    //错误消息
    protected $message  =   [
        'nick_name.require' => '昵称必须',
        'nick_name.max'     => '昵称最多不能超过20个字符',
        'service_type_info.require' => '类型必须',
        'verify_type_info.require' => '认证状态必须',
        'appid.checkExists' => 'appID已存在',
        'appid.require'     => 'appID必须',
        'appid.max'     => 'appID错误',
        'appsecret.require'     => 'appsecret必须',
        'appsecret.max'     => 'appsecret错误',
        'user_name.require'     => '原始ID必须',
        'user_name.max'     => '原始ID错误',
        'alias.max'     => '微信号格式错误',
        'head_img'     => '头像链接错误',
        'qrcode_url'     => '二维码链接错误',
        'refresh_token.require' => 'Token令牌必须',
        'refresh_token.min'     => 'Token令牌至少4个字符',
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
        $admin = model('mp')->getOneByMap($where);
        return $admin ? false : true;
    }

    /**
     * add 验证场景定义
     * @return Mp
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function sceneAdd()
    {
        return $this->only([
            '__token__','nick_name','service_type_info','verify_type_info',
            'appid','appsecret', 'user_name', 'alias', 'head_img', 'qrcode_url'])
            ->append('appid', 'checkExists');
    }

    /**
     * edit 验证场景定义
     * @return Mp
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function sceneEdit()
    {
        return $this->only([
            '__token__','nick_name','service_type_info','verify_type_info',
            'appid','appsecret', 'user_name', 'alias', 'head_img', 'qrcode_url'])
            ->append('appid', 'checkExists');
    }
}