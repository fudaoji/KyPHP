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
 * Script Name: MpQrcode.php
 * Create: 2020/6/18 13:39
 * Description: 场景二维码
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\validate;

use think\Validate;

class MpQrcode extends Validate
{
    protected $rule = [
        '__token__' => 'require|token',
        'title'  =>  'require|max:25|checkTitleExists',
        'keyword'  =>  'require|max:40',
        'scene_str'  =>  'require|max:64|checkSceneStrExists',
        'type'  => 'require|in:0,1',
        'expire'  => 'checkExpire'
    ];

    //错误消息
    protected $message  =   [
        'title.require' => '场景名称必须',
        'title.max'     => '场景名称不能超过25个字符',
        'title.checkTitleExists'     => '场景名称已存在',
        'keyword.require' => '关键词必须',
        'keyword.max'     => '关键词不能超过40个字符',
        'scene_str.require' => '场景值必须',
        'scene_str.max'     => '场景值不能超过64个字符',
        'scene_str.checkSceneStrExists'     => '场景值已存在',
        'type.require' => '类型非法',
        'expire.checkExpire' => '临时二维码的有效时间必须在0~2592000之间',
    ];

    /**
     * 验证expire是否合法
     * @param $value
     * @param $rule
     * @param $data
     * @return bool
     * @author: fudaoji<fdj@kuryun.cn>
     */
    protected function checkExpire($value, $rule, $data){
        if($data['type'] == 1){
            return  $value > 0 && $value < 2592000;
        }
        return true;
    }

    /**
     * 验证title是否被占用
     * @param $value
     * @param $rule
     * @param $data
     * @return bool
     * @author: fudaoji<fdj@kuryun.cn>
     */
    protected function checkTitleExists($value, $rule, $data){
        $where = ['title' => $value, 'mpid' => $data['mpid']];
        if(isset($data['id'])){
            $where['id'] = ['neq', $data['id']];
        }
        $data = model('mpQrcode')->getOneByMap($where);
        return $data ? false : true;
    }

    /**
     * 验证scene_str是否被占用
     * @param $value
     * @param $rule
     * @param $data
     * @return bool
     * @author: fudaoji<fdj@kuryun.cn>
     */
    protected function checkSceneStrExists($value, $rule, $data){
        $where = ['scene_str' => $value, 'mpid' => $data['mpid']];
        if(isset($data['id'])){
            $where['id'] = ['neq', $data['id']];
        }
        $data = model('mpQrcode')->getOneByMap($where);
        return $data ? false : true;
    }
}