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
 * Script Name: FriendLink.php
 * Create: 2020/8/1 下午4:22
 * Description: 友链验证
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\validate;
use think\Validate;

class FriendLink extends Validate
{
    const NAME_LEN = 30;
    const LINK_LEN = 30;
    protected $rule = [
        '__token__' => 'require|token',
        'id'    => 'checkId',
        'title'  =>  'require|checkExists|max:' . self::NAME_LEN,
        'link'  => 'require|max:' . self::LINK_LEN,
        'sort.require' => '排序值必填',
        'sort.min' => '排序值不能小于0',
    ];

    //错误消息
    protected $message  =   [
        'id.checkId' => '数据不存在',
        'title.require' => '名称必须',
        'title.max'     => '名称最多不能超过'.self::NAME_LEN.'个字符',
        'title.checkExists' => '名称已存在',
        'link.require' => '链接必须',
        'link.max'     => '链接最多不能超过'.self::LINK_LEN.'个字符',
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
        return model('FriendLink')->getOne((int)$value) ? true : false;
    }

    /**
     * 验证是否已存在
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
        $admin = model('friendLink')->getOneByMap($where);
        return $admin ? false : true;
    }

    /**
     * edit 验证场景定义
     * @return \app\common\model\FriendLink
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function sceneEdit()
    {
        return $this->only(['__token__','id', 'title','link','sort']);
    }

    /**
     * add 验证场景定义
     * @return \app\common\model\FriendLink
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function sceneAdd()
    {
        return $this->only(['__token__', 'title','link']);
    }
}