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
 * Script Name: MiniTester.php
 * Create: 2020/5/23 下午4:22
 * Description: 小程序体验账号
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\validate;
use think\Validate;

class MiniTester extends Validate
{
    protected $rule = [
        '__token__' => 'require|token',
        'wechat_id'  =>  'require|max:60',
        'remark'  => 'require|max:20'
    ];

    //错误消息
    protected $message  =   [
        'wechat_id.require' => '微信号必须',
        'wechat_id.max'     => '微信号不合法',
        'remark.require' => '备注必须',
        'remark.max'     => '备注最多不能超过20个字符'
    ];
}