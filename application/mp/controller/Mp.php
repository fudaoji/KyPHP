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
 * Script Name: ${FILE_NAME}
 * Create: 2020/3/3 下午4:35
 * Description:
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\mp\controller;
use think\Validate;

class Mp extends Base
{
    public function initialize(){
        parent::initialize();
    }

    public function editAutoreply()
    {
        $id = input('id', 0, 'intval');

        $rule = model('mpRule')->getOne(['id' => $id, 'rule_mpid' => $this->mpId]);
        if (empty($rule)) {
            $this->error('数据不存在');
        }
        $reply = model('mpReply')->getOne(['id' => $rule['reply_id'], 'rp_mpid' => $this->mpId]);
        if (request()->isPost()) {
            $post = input('post.');
            $validate = new Validate(
                [
                    'keyword' => 'require',
                ],
                [
                    'keyword.require' => '关键词不能为空',
                ]
            );
            $result = $validate->check($post);
            if ($result === false) {
                $this->error($validate->getError());
            }
            $status = isset($post['status']) ? 1 : 0;
            $data['status'] = $status;
            model('mpRule')->updateOne([
                'rule_mpid' => $this->mpId,
                'id' => $id,
                'keyword' => trim($post['keyword']),
                'status' => $status
            ]);
            switch ($rule['type']) {
                case 'text':
                    model('mpReply')->updateOne([
                        'rp_mpid' => $this->mpId,
                        'id' => $rule['reply_id'],
                        'content' => $post['content']
                    ]);
                    $this->success('修改成功');
                    break;
                case 'news':
                    $validate = new Validate(
                        [
                            'title' => 'require',
                            'picurl' => 'require',
                            'link' => 'require',
                        ],
                        [
                            'title.require' => '标题不能为空',
                            'picurl.require' => '请上传图文封面图',
                            'link.require' => '连接不能为空',
                        ]
                    );
                    $result = $validate->check($post);
                    if ($result === false) {
                        ajaxMsg(0, $validate->getError());
                    }
                    $data['title'] = $post['title'];
                    $data['url'] = $post['picurl'];
                    $data['content'] = $post['news_content'];
                    $data['link'] = $post['link'];
                    MpReply::update($data, ['reply_id' => $rePly['reply_id']]);
                    ajaxMsg(1, '修改成功');
                    break;
                case 'addon':
                    $validate = new Validate(
                        [
                            'addons' => 'require',
                        ],
                        [
                            'addons.require' => '应用不能为空',
                        ]
                    );
                    $result = $validate->check(input());
                    if ($result === false) {
                        ajaxMsg(0, $validate->getError());
                    }
                    $data['addon'] = $post['addons'];
                    MpRule::update(['addon' => $post['addons']], ['mpid' => $this->mid, 'id' => $id]);
                    ajaxMsg(1, '修改成功');
                    break;
                case 'voice':
                    $validate = new Validate(
                        [
                            'voice_title' => 'require',
                            'voice' => 'require',
                        ],
                        [
                            'voice_title.require' => '语音名称不能为空',
                            'voice.require' => '请上传语音',
                        ]
                    );

                    $result = $validate->check(input());
                    if ($result === false) {
                        ajaxMsg(0, $validate->getError());
                    }
                    if ($rePly['url'] != $post['voice'] || $rePly['status_type'] != $post['voice_staus_type']) {
                        $filePath = explode(getHostDomain(), $post['voice']);
                        if (isset($filePath[1]) && !empty($filePath[1])) {//认为新上传
                            $data['path'] = $filePath[1];
                            if ($post['voice_staus_type'] == '0') {
                                $media = uploadMedia($filePath[1], 'voice');
                            }
                            if ($post['voice_staus_type'] == '1') {

                                $media = uploadForeverMedia($filePath[1], 'voice');

                            }

                        } else {//认为选择了永久或者暂时音频
                            if (isset($filePath[0])) {
                                $materialModel = new \app\common\model\Material();
                                $materialArray = $materialModel->getMaterialByFind(['media_id' => $filePath[0], 'mpid' => $this->mid]);
                                if ($materialArray['from_type'] == 0) {//临时
                                    if (empty($materialArray['url'])) ajaxMsg('0', '失败！资源地址为空');
                                    $filePath = explode(getHostDomain(), $materialArray['url']);
                                    if ($post['voice_staus_type'] == '0') {
                                        $media = uploadMedia($filePath[1], 'voice');
                                    }
                                    if ($post['voice_staus_type'] == '1') {

                                        $media = uploadForeverMedia($filePath[1], 'voice');

                                    }

                                } else {//永久
                                    $media['media_id'] = $materialArray['media_id'];
                                }
                            }
                        }
                        $data['media_id'] = $media['media_id'];
                        $material = [
                            'mpid' => $this->mid,
                            'title' => $post['voice_title'],
                            'url' => $post['voice'],
                            'media_id' => $data['media_id']
                        ];
                        $this->material('voice', $material, $post['voice_staus_type']);
                    }
                    $data['title'] = $post['voice_title'];
                    $data['url'] = $post['voice'];
                    $data['type'] = 'voice';
                    $data['status_type'] = $post['voice_staus_type'];
                    MpReply::update($data, ['reply_id' => $rePly['reply_id']]);
                    ajaxMsg(1, '修改成功');
                    break;
                case 'image':
                    $input = $post;
                    $materialModel = new \app\common\model\Material();
                    $validate = new Validate(
                        [
                            'reply_image' => 'require',
                        ],
                        [
                            'reply_image.require' => '请上传图片',
                        ]
                    );
                    $result = $validate->check(input());
                    if ($result === false) {
                        ajaxMsg(0, $validate->getError());
                    }
                    if ($rePly['url'] != $input['reply_image'] || $rePly['status_type'] != $post['image_staus_type']) {
                        $sting = getSetting($this->mid, 'cloud');
                        if (isset($sting['qiniu']['status']) && $sting['qiniu']['status'] == 1) {
                            $ext = strrchr($input['reply_image'], '.');
                            $fileName_h = md5(rand_string(12)) . $ext;
                            $filePath[1] = dowloadImage($input['reply_image'], './uploads/', $fileName_h);
                            if (!$filePath[1]) {
                                ajaxMsg(0, '获取图片失败');
                            }
                        } else {
                            $ext = strrchr($input['reply_image'], '.');
                            $fileName_h = md5(rand_string(12)) . $ext;
                            $filePath[1] = dowloadImage($input['reply_image'], './uploads/', $fileName_h);
                            // $filePath = explode(getHostDomain(),$input['reply_image']);//strpos
                        }
                        if (!strpos($input['reply_image'], 'show/image') || !strpos($input['reply_image'], 'qpic.cn')) {
                            //认为本地资源或者新上传
                            if (isset($filePath[1]) && !empty($filePath[1])) {
                                $data['path'] = $filePath[1];
                                if ($input['image_staus_type'] == '0') {
                                    $media = uploadMedia($filePath[1], 'image');
                                }
                                if ($input['image_staus_type'] == '1') {
                                    $media = uploadForeverMedia($filePath[1], 'image');
                                }

                            }
                        } else {
                            //认为永久、类型永久或者临时请忽略
                            $materialArray = $materialModel->getMaterialByFind(['url' => $input['reply_image'], 'mpid' => $this->mid]);
                            $media['media_id'] = $materialArray['media_id'];

                        }
                        $data['url'] = $input['reply_image'];
                        $data['type'] = 'image';
                        $data['media_id'] = $media['media_id'];
                        $data['status_type'] = $input['image_staus_type'];
                        $material = [
                            'mpid' => $this->mid,
                            'url' => $data['url'],
                            'media_id' => $data['media_id']
                        ];
                        $this->material('image', $material, $input['image_staus_type']);
                        MpReply::update($data, ['reply_id' => $rePly['reply_id']]);
                    }
                    ajaxMsg(1, '修改成功');
                    break;
                case 'video':
                    $input = $post;
                    $validate = new Validate(
                        [
                            'video_title' => 'require',
                            'reply_video' => 'require',
                        ],
                        [
                            'video_title.require' => '视频标题不能为空',
                            'reply_video.require' => '请上传视频',
                        ]
                    );
                    $result = $validate->check(input());
                    if ($result === false) {
                        ajaxMsg(0, $validate->getError());
                    }
                    if ($rePly['url'] != $input['reply_video'] || $rePly['status_type'] != $post['video_staus_type']) {
                        $filePath = explode(getHostDomain(), $input['reply_video']);
                        if (isset($filePath[1]) && !empty($filePath[1])) {
                            if ($input['video_staus_type'] == '0') {
                                $media = uploadMedia($filePath[1], 'video');
                            }
                            if ($input['video_staus_type'] == '1') {

                                $media = uploadForeverMedia($filePath[1], 'video', true, ['title' => $input['video_title'], 'introduction' => $input['video_content']]);

                            }

                        } else {//认为选择了永久或者暂时音频
                            if (isset($filePath[0])) {
                                $materialModel = new \app\common\model\Material();
                                $materialArray = $materialModel->getMaterialByFind(['media_id' => $filePath[0], 'mpid' => $this->mid]);
                                if ($materialArray['from_type'] == 0) {//临时
                                    if (empty($materialArray['url'])) ajaxMsg('0', '失败！资源地址为空');
                                    $filePath = explode(getHostDomain(), $materialArray['url']);
                                    if ($input['video_staus_type'] == '0') {
                                        $media = uploadMedia($filePath[1], 'video');
                                    }
                                    if ($input['video_staus_type'] == '1') {

                                        $media = uploadForeverMedia($filePath[1], 'video', true, ['title' => $input['video_title'], 'introduction' => $input['video_content']]);

                                    }

                                } else {//永久
                                    $media['media_id'] = $materialArray['media_id'];
                                }
                            }
                        }

                        $data['url'] = $input['reply_video'];
                        $data['status_type'] = $input['video_staus_type'];
                        $data['media_id'] = $media['media_id'];
                        $material = [
                            'mpid' => $this->mid,
                            'title' => $input['video_title'],
                            'content' => $input['video_content'],
                            'url' => $data['url'],
                            'media_id' => $data['media_id']
                        ];
                        $this->material('video', $material, $input['video_staus_type']);
                    }
                    $data['title'] = $input['video_title'];
                    $data['content'] = $input['video_content'];
                    MpReply::update($data, ['reply_id' => $rePly['reply_id']]);
                    ajaxMsg(1, '修改成功');
                    break;
                case 'music':
                    $input = $post;
                    $validate = new Validate(
                        [
                            'music_title' => 'require',
                            'music' => 'require',
                        ],
                        [
                            'music_title.require' => '音乐标题不能为空',
                            'music.require' => '请上传音乐',
                        ]
                    );
                    $result = $validate->check(input());
                    if ($result === false) {
                        ajaxMsg(0, $validate->getError());
                    }
                    $data['title'] = $input['music_title'];
                    $data['url'] = $input['music'];
                    $data['link'] = $input['music_link'];
                    $data['type'] = 'music';
                    $data['content'] = $input['music_content'];
                    $material = [
                        'mpid' => $this->mid,
                        'title' => $data['title'],
                        'content' => $data['content'],
                        'url' => $data['url'],
                    ];
                    $this->material('music', $material);
                    MpReply::update($data, ['reply_id' => $rePly['reply_id']]);
                    ajaxMsg(1, '修改成功');
                    break;
            }

        }

        $assign = [
            'rule' => $rule,
            'reply' => $reply
        ];
        if ($rule['type'] == 'addon') {
            $addons = model('addons')->getAll([], ['id' => 'asc']);
            $assign['addons'] = $addons;
        }
        return $this->show($assign);
    }

    /**
     * 自动回复
     * @param string $type
     * @return mixed
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function autoReply($type = 'text')
    {
        $where = ['rule_mpid' => $this->mpId, 'ru.type' => $type];
        if($search_key = input('keyword', '')){
            $where['ru.keyword'] = ['like', '%'.$search_key.'%'];
        }

        if (input('search_type') == 1) {
            $data = model('mpRule')->page(10, ['mpid' => $this->mpId]);
            $type = 'search';
        }else{
            switch ($type) {
                case 'text':
                case 'news':
                case 'voice':
                case 'image':
                case 'video':
                case 'music':
                    $data = model('mpRule')->pageJoin([
                        'alias' => 'ru',
                        'join' => [[model('mpReply')->getTrueTable(['rp_mpid' => $this->mpId]).' rp', 'rp.id=ru.reply_id']],
                        'page_size' => 10,
                        'where' => $where,
                        'field' => 'ru.id,ru.keyword,ru.status,rp.content',
                        'order' => ['ru.id' => 'desc']
                    ]);
                    break;
                case 'addon':
                    $data = model('mpRule')->pageJoin([
                        'alias' => 'ru',
                        'join' => [['addons a', 'a.addon=ru.addon']],
                        'page_size' => 10,
                        'where' => $where,
                        'field' => 'ru.id,ru.keyword,ru.status,ru.addon, ru.type, a.name,a.desc,a.logo',
                        'order' => ['ru.id' => 'desc']
                    ]);
                    break;

            }
        }

        $search_type = input('search_type', 1);
        $assign = ['type' => $type, 'search_type' => $search_type, 'data' => $data];
        return $this->show($assign);
    }

    /**
     * index
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function index(){
        $report = model('mpUser')->getReport($this->mpId);
        return $this->show(['report' => $report, 'data_by_api' => [], 'app_by_api' => []]);
    }
}