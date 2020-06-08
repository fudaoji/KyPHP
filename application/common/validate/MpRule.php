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

class MpRule extends Validate
{
    protected $rule = [
        '__token__' => 'require|token',
        'keyword'  =>  'require|max:40|checkExists',
        'media_type'  => 'require|checkMediaType',
        'media_id'  => 'require'
    ];

    //错误消息
    protected $message  =   [
        'keyword.require' => '关键词必须',
        'keyword.max'     => '关键词不能超过40个字符',
        'keyword.checkExists'     => '关键词已存在',
        'media_type.require' => '回复类型必须',
        'media_type.checkMediaType' => '回复类型错误',
        'media_id.require' => '请选择回复素材',
    ];

    /**
     * 验证keyword是否被占用
     * @param $value
     * @param $rule
     * @param $data
     * @return bool
     * @author: fudaoji<fdj@kuryun.cn>
     */
    protected function checkMediaType($value, $rule, $data){
        $types = model('mpRule')->types();
        return isset($types[$value]) ? true : false;
    }

    /**
     * 验证keyword是否被占用
     * @param $value
     * @param $rule
     * @param $data
     * @return bool
     * @author: fudaoji<fdj@kuryun.cn>
     */
    protected function checkExists($value, $rule, $data){
        $where = ['keyword' => $value, 'rule_mpid' => $data['rule_mpid']];
        if(isset($data['id'])){
            $where['id'] = ['neq', $data['id']];
        }
        $data = model('mpRule')->getOneByMap($where);
        return $data ? false : true;
    }
}