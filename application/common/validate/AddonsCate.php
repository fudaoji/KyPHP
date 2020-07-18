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
 * Description: 应用分类验证器
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\validate;

use think\Validate;

class AddonsCate extends Validate
{
    protected $rule = [
        '__token__' => 'require|token',
        'title'  =>  'require|max:20|checkExists',
        'sort'  => 'require|min:0',
    ];

    //错误消息
    protected $message  =   [
        'title.require' => '名称必须',
        'title.max'     => '名称最多不能超过20个字符',
        'title.checkExists' => '该分类已存在',
        'sort.require' => '排序值必填',
        'sort.min' => '排序值不能小于0',

    ];

    /**
     * 验证title是否被占用
     * @param $value
     * @param $rule
     * @param $data
     * @return bool
     * @author: fudaoji<fdj@kuryun.cn>
     */
    protected function checkExists($value, $rule, $data){
        $where = ['title' => $value];
        if(isset($data['id'])){
            $where['id'] = ['neq', $data['id']];
        }
        $admin = model('addonsCate')->getOneByMap($where, true, true);
        return $admin ? false : true;
    }

    /**
     * add 验证场景定义
     * @return \app\common\model\AdminGroup
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function sceneAdd()
    {
        return $this->only(['__token__','title','sort']);
    }

    /**
     * edit 验证场景定义
     * @return \app\common\model\AdminGroup
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function sceneEdit()
    {
        return $this->only([
            '__token__','id','title','sort']);
    }
}