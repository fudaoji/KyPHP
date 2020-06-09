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
 * Script Name: MessageHandler.php
 * Create: 2020/6/9 9:16
 * Description: 处理器基类
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\mp\controller\handler\mp;

use app\common\controller\WechatMp;
use EasyWeChat\Kernel\Contracts\EventHandlerInterface;
use EasyWeChat\Kernel\Messages\Image;
use EasyWeChat\Kernel\Messages\Music;
use EasyWeChat\Kernel\Messages\News;
use EasyWeChat\Kernel\Messages\NewsItem;
use EasyWeChat\Kernel\Messages\Text;
use EasyWeChat\Kernel\Messages\Video;
use EasyWeChat\Kernel\Messages\Voice;
use think\facade\Log;

class MessageHandler extends WechatMp implements EventHandlerInterface
{
    protected $mpMsg;
    /**
     * @var \think\Model
     */
    private $mpMsgM;
    /**
     * @var \think\Model
     */
    private $specialM;
    /**
     * @var \think\Model
     */
    private $ruleM;
    /**
     * @inheritDoc
     */
    public function __construct()
    {
        parent::__construct();
        $this->mpMsgM = model('mpMsg');
        $this->specialM = model('mpSpecial');
        $this->ruleM = model('mpRule');
    }
    /**
     * @inheritDoc
     */
    public function handle($payload = null)
    {
        $this->recordFollowMsg($payload);
    }

    /**
     * 针对关键词的回复
     * @param string $keyword
     * @return string
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function replyKeyword($keyword = ''){
        $res = '';
        $rule = $this->ruleM->getOneByMap(['keyword' => $keyword, 'rule_mpid' => $this->mpInfo['id']]);
        if(empty($rule)){ //不存在关键词则寻找默认回复
            $special = $this->specialM->getOneByMap(['spe_mpid' => $this->mpInfo['id'], 'event' => 'default']);
            if($special){
                if($special['keyword']){
                    $rule = $this->ruleM->getOneByMap(['keyword' => $special['keyword'], 'rule_mpid' => $this->mpInfo['id']]);
                }elseif ($special['addon']){
                    $media = model('addons')->getOneByMap(['name' => $special['addon']]);
                    $media_type = 'addon';
                }
            }
        }

        if($rule){ //关键词精确回复
            $media_type = $rule['media_type'];
            if($rule['media_type'] != 'addon'){
                $media = model('Media'.ucfirst($rule['media_type']))->getOneByMap(['id' => $rule['media_id'], 'uid' => $this->mpInfo['uid']]);
            }else{
                $media = model('addons')->getOne($rule['media_id']);
            }
        }

        if(!empty($media_type) && !empty($media)){
            $method = camel_case('reply' . $media_type);
            try {
                $res = $this->$method($media);
            }catch (\Exception $e){
                Log::write($e->getMessage());
            }
        }
        return $res;
    }

    /**
     * 特殊消息的回复
     * @param string $event
     * @return bool
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function replySpecial($event = ''){
        $res = '';
        //执行关注时回复
        $special = $this->specialM->getOneByMap(['event' => $event, 'spe_mpid' => $this->mpInfo['id']]);
        if($special && $special['ignore'] == 0){
            if(!empty($special['keyword'])){
                //关键词回复
                $res = $this->replyKeyword($special['keyword']);
            }else{
                //应用回复
                $media = model('addons')->getOne($special['addon']);
                $res = $this->replyAddon($media);
            }
        }
        if($res){
            return $res;
        }
    }

    /**
     * 交给应用处理
     * @param array $addon
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function replyAddon($addon = []){

    }

    /**
     * 文本回复
     * @param array $media
     * @return Text
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function replyText($media = []){
        $text = new Text($media['content']);
        $this->recordMpReply($text);
        return $text;
    }

    /**
     * 图片回复
     * @param array $media
     * @return Image
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function replyImage($media = []){
        $image = new Image($media['media_id']);
        $this->recordMpReply($image);
        return $image;
    }

    /**
     * 语音回复
     * @param array $media
     * @return Voice
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function replyVoice($media = []){
        $voice = new Voice($media['media_id']);
        $this->recordMpReply($voice);
        return $voice;
    }

    /**
     * 视频回复
     * @param array $media
     * @return Video
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function replyVideo($media = []){
        $video = new Video($media['media_id'], [
            'title' => $media['title'],
            'description' => $media['desc'],
        ]);
        $this->recordMpReply($video);
        return $video;
    }

    /**
     * 音乐回复
     * @param array $media
     * @return Music
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function replyMusic($media = []){
        $music = new Music([
            'title' => $media['title'],
            'description' => $media['desc'],
            'url' => $media['url'],
            'hq_url' => $media['hq_url'],
            'thumb_media_id' => $media['thumb_media_id']
        ]);
        $this->recordMpReply($music);
        return $music;
    }

    /**
     * 图文回复
     * @param array $media
     * @return News
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function replyNews($media = []){
        $items = [
            new NewsItem([
                'title'       => $media['title'],
                'description' => $media['digest'],
                'url'         => $media['content_source_url'] != '' ? $media['content_source_url'] : '',
                'image'       => $media['cover_url'],
            ]),
        ];
        if($list = model('MediaNews')->getAll([
            'where' => ['mpid' => $this->mpInfo['id'], 'pid' => $media['id']],
            'order' => ['sort' => 'asc']
        ])) {
            foreach ($list as $vo) {
                array_push($items, new NewsItem([
                    'title'         => $vo['title'],
                    'description'   => $vo['digest'],
                    'url'           => $vo['content_source_url'] != '' ? $vo['content_source_url'] : '',
                    'image'         => $vo['cover_url'],
                ]));
            }
        }
        $news = new News($items);
        $this->recordMpReply($news);
        return $news;
    }

    /**
     * 消息公共处理，例如记录粉丝消息
     * @param $message
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function recordFollowMsg($message){
        try{
            $this->mpMsg = $this->mpMsgM->addOne([
                'mpid' => $this->mpInfo['id'],
                'type' => $message['MsgType'],
                'openid' => $message['FromUserName'],
                'content' => json_encode($message, JSON_UNESCAPED_UNICODE)
            ]);
        }catch (\Exception $e){
            Log::write("记录粉丝消息出错:\n");
            Log::write($e->getMessage());
        }
    }

    /**
     * 公众号回复粉丝
     * @param $media
     */
    public function recordMpReply($media){
        if(!empty($this->mpMsg)){
            try{
                $type = $media->getType();
                $media_array = $media->toXmlArray();
                $content = $type == 'text' ? $media_array : $media_array[ucfirst($type)];
                Log::write($content);
                $this->mpMsgM->addOne([
                    'pid' => $this->mpMsg['id'],
                    'openid' => $this->mpMsg['openid'],
                    'mpid' => $this->mpInfo['id'],
                    'type' => $type,
                    'is_reply' => 1,
                    'content' => json_encode($content, JSON_UNESCAPED_UNICODE)
                ]);
            }catch (\Exception $e){
                Log::write("回复粉丝消息记录出错:\n");
                Log::write($e->getMessage());
            }
        }
    }
}