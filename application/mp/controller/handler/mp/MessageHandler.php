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
use app\common\model\MpSpecial;
use EasyWeChat\Kernel\Contracts\EventHandlerInterface;
use EasyWeChat\Kernel\Messages\Image;
use EasyWeChat\Kernel\Messages\Message;
use EasyWeChat\Kernel\Messages\Music;
use EasyWeChat\Kernel\Messages\News;
use EasyWeChat\Kernel\Messages\NewsItem;
use EasyWeChat\Kernel\Messages\Text;
use EasyWeChat\Kernel\Messages\Video;
use EasyWeChat\Kernel\Messages\Voice;
use think\facade\Log;

class MessageHandler extends WechatMp implements EventHandlerInterface
{
    /**
     * @var \app\common\model\MpMsg
     */
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
     * @var \think\Model
     */
    private $followM;
    private $follow;
    /**
     * @inheritDoc
     */
    public function __construct()
    {
        parent::__construct();
        $this->mpMsgM = model('mpMsg');
        $this->specialM = model('mpSpecial');
        $this->ruleM = model('mpRule');
        $this->followM = model('mpFollow');
    }

    /**
     * 设置粉丝信息
     * @param null $message
     * Author: fudaoji<fdj@kuryun.cn>
     */
    private function setFollow($message = null){
        if(!empty($message['FromUserName']) && $this->mpInfo){
            $this->follow = $this->followM->getOneByMap(['mpid' => $this->mpInfo['id'], 'openid' => $message['FromUserName']]);
        }
    }

    /**
     * @inheritDoc
     */
    public function handle($payload = null)
    {
        $this->setFollow($payload);
        $this->recordFollowMsg($payload);
    }

    /**
     * 针对关键词的回复
     * @param string $keyword
     * @param Message $message
     * @return string
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function replyKeyword($keyword = '', $message){
        $res = '';
        $rule = $this->ruleM->getOneByMap(['keyword' => $keyword, 'rule_mpid' => $this->mpInfo['id']]);
        if(empty($rule)){ //不存在关键词则寻找默认回复
            $res = $this->replySpecial(MpSpecial::DEFAULT_ANS, $message);
        } else { //关键词精确回复
            $media_type = $rule['media_type'];
            if($rule['media_type'] != 'addon'){
                $media = model('Media'.ucfirst($rule['media_type']))->getOneByMap(['id' => $rule['media_id'], 'uid' => $this->mpInfo['uid']]);
            }else{
                $media = model('addons')->getOne($rule['media_id']);
            }
            if(!empty($media)){
                $method = camel_case('reply' . $media_type);
                try {
                    $res = $this->$method($media, $message);
                }catch (\Exception $e){
                    Log::write($e->getMessage());
                }
            }
        }
        return $res;
    }

    /**
     * 特殊消息的回复
     * @param string $event
     * @param Message $message
     * @return bool
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function replySpecial($event = '', $message){
        $res = '';
        //执行关注时回复
        $special = $this->specialM->getOneByMap(['event' => $event, 'spe_mpid' => $this->mpInfo['id']]);
        if($special && $special['ignore'] == 0){
            if(!empty($special['keyword'])){
                //关键词回复
                $res = $this->replyKeyword($special['keyword'], $message);
            }else{
                //应用回复
                $media = model('addons')->getOne($special['addon']);
                $res = $this->replyAddon($media, $message);
            }
        }
        if($res){
            return $res;
        }
    }

    /**
     * 交给应用处理
     * @param array $addon
     * @param \EasyWeChat\Kernel\Messages\Message $message
     * @return string
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function replyAddon($addon = [], $message){
        $res = '';
        $filename = ADDON_PATH . $addon['addon'] . '/controller/Api.php';
        $common_file = ADDON_PATH . $addon['addon'] . '/common.php';
        if (file_exists($common_file)) {
            include_once $common_file;
        }

        if (file_exists($filename)) {
            include_once $filename;
            $class = '\addons\\' . $addon['addon'] . '\controller\Api';
            if (class_exists($class)) {
                $obj = new $class;
                if (method_exists($obj, 'message')) {
                    $res = $obj->message($message, ['mpid' => $this->mpInfo['id']]);
                }
            }
        }
        return $res;
    }

    /**
     * 文本回复
     * @param array $media
     * @return Text
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function replyText($media = []){
        $text = MessageObj::text($media);
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
        $image = MessageObj::image($media);
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
        $voice = MessageObj::voice($media);
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
        $video = MessageObj::video($media);
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
        $music = MessageObj::music($media);
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
        $news = MessageObj::news($media);
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
            if(! in_array($message['MsgType'], ['event'])){
                $this->mpMsg = $this->mpMsgM->addOne([
                    'mpid' => $this->mpInfo['id'],
                    'type' => $message['MsgType'],
                    'openid' => $message['FromUserName'],
                    'content' => json_encode($message, JSON_UNESCAPED_UNICODE),
                    'nickname' => $this->follow['nickname'],
                    'headimgurl' => $this->follow['headimgurl']
                ]);
            }
        }catch (\Exception $e){
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
                $this->mpMsgM->addOne([
                    'pid' => $this->mpMsg['id'],
                    'openid' => $this->mpMsg['openid'],
                    'mpid' => $this->mpInfo['id'],
                    'type' => $type,
                    'is_reply' => 1,
                    'content' => json_encode($content, JSON_UNESCAPED_UNICODE),
                    'nickname' => $this->mpInfo['nick_name'],
                    'headimgurl' => $this->mpInfo['head_img']
                ]);
                $this->mpMsg = $this->mpMsgM->updateOne([
                    'id' => $this->mpMsg['id'],
                    'mpid' => $this->mpInfo['id'],
                    'status' => 1
                ]);
            }catch (\Exception $e){
                Log::write($e->getMessage());
            }
        }
    }
}