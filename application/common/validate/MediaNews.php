<?php
// +----------------------------------------------------------------------
// | [KyPHP System] Copyright (c) 2020 http://www.kuryun.com/
// +----------------------------------------------------------------------
// | [KyPHP] 并不是自由软件,你可免费使用,未经许可不能去掉KyPHP相关版权
// +----------------------------------------------------------------------
// | License  https://gitee.com/fudaoji/KyPHP/blob/master/LICENSE
// +----------------------------------------------------------------------
/**
 * Created by PhpStorm.
 * Script Name: MaterialNews.php
 * Create: 2020/10/29 10:51
 * Description: 图文验证器
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\validate;

use think\Validate;

class MediaNews extends Validate
{
    protected $rule = [
        'id'    => 'checkId',
        'title' => 'require|max:32',
        'cover_url' => 'require|url',
        'thumb_media_id' => 'require|max:200',
        'content_source_url' => 'url',
        'digest' => 'max:64',
        'author' => 'max:20',
        'content' => 'require',
    ];

    //错误消息
    protected $message  =   [
        'id.checkId' => '数据不存在',
        'title.require' => '标题必填',
        'title.max' => '标题长度不超过32',
        'cover_url.require' => '请上传封面图',
        'cover_url.url' => '封面图无效',
        'thumb_media_id.require' => '封面图media_id丢失',
        'thumb_media_id.max' => '封面图media_id非法',
        'content_source_url.url' => '跳转链接格式非法',
        'digest.max' => '摘要长度不超过64',
        'author.max' => '作者长度不超过20',
        'content.require' => '文章内容必填',
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
        return model('mediaNews')->total(['uid' => $data['uid'], 'id' => $value]) ? true : '非法操作';
    }

    /**
     * 图文链接
     * @return MediaNews
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function sceneLink()
    {
        return $this->only(['title', 'cover_url', 'content_source_url', 'digest']);
    }

    /**
     * 微信图文
     * @return MediaNews
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function sceneWx()
    {
        return $this->only(['title', 'thumb_media_id', 'cover_url', 'content_source_url', 'digest', 'content', 'author']);
    }
}