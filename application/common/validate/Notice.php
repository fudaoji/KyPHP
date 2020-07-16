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
 * Script Name: Notice.php
 * Create: 2020/7/15 16:45
 * Description: 系统公告
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\validate;

class Notice extends Base
{
    protected $rule = [
        'id'    => 'checkId',
        'title' => 'require|max:60',
        'content' => 'require|max:50000',
        'publish_time' => 'require|date',
        'status' => 'require'
    ];

    protected $message = [
        'id.checkId' => 'id非法',
        'title.require' => '标题必填',
        'title.max' => '标题长度不超过50字',
        'content.require' => '请填写内容',
        'content.max' => '公告内容过长',
        'publish_time.require' => '请选择发布时间',
        'publish_time.date' => '发布时间格式错误',
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
        return model('notice')->getOne((int)$value) ? true : false;
    }

    /**
     * add 验证场景定义
     * @return \app\common\model\Notice
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function sceneEdit()
    {
        return $this->only(['__token__','id', 'title', 'content','status', 'publish_time']);
    }

    /**
     * add 验证场景定义
     * @return Admin
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function sceneAdd()
    {
        return $this->only(['__token__', 'title', 'content','publish_time']);
    }
}