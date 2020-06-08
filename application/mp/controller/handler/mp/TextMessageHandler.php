<?php
/**
 * Created by PhpStorm.
 * Script Name: TextMessageHadler.php
 * Create: 2020/4/15 10:40
 * Description: 公众号文本消息处理器
 * Author: fudaoji<fdj@kuryun.cn>
 */
namespace app\mp\controller\handler\mp;

use app\common\controller\WechatMp;
use EasyWeChat\Kernel\Contracts\EventHandlerInterface;
use EasyWeChat\Kernel\Messages\Text;
use EasyWeChat\Kernel\Messages\Image;
use EasyWeChat\Kernel\Messages\News;
use EasyWeChat\Kernel\Messages\NewsItem;
use think\facade\Log;

class TextMessageHandler extends WechatMp implements EventHandlerInterface
{
    /**
     * @var \think\Model
     */
    private $ruleM;
    /**
     * @var \think\Model
     */
    private $specialM;
    /**
     * 初始化
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function __construct() {
        parent::__construct();
        $this->ruleM = model('mpRule');
        $this->specialM = model('mpSpecial');
    }

    /**
     * 处理器
     * @param null $payload
     * @return mixed
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function handle($payload = null) {
        $res = '';
        $message = $payload;
        $rule = $this->ruleM->getOneByMap(['keyword' => $message['Content'], 'rule_mpid' => $this->mpInfo['id']]);
        if(empty($rule)){ //不存在关键词则寻找默认回复
            $special = $this->specialM->getOneByMap(['mpid' => $this->mpInfo['id'], 'event' => 'default']);
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
                $res = controller('mp/mp', 'event')->$method($media); //切记在app\mp\event\mp 创建对应的方法
            }catch (\Exception $e){
                Log::write($e->getMessage());
            }
        }

        if($res !== ''){
            return $res;
        }
    }
}