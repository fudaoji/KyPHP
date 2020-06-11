<?php
/**
 * Created by PhpStorm.
 * Script Name: EventMessageHandler.php
 * Create: 2020/4/15 10:48
 * Description: 公众号事件消息处理器
 * @link https://developers.weixin.qq.com/doc/offiaccount/Message_Management/Receiving_event_pushes.html  微信官方文档
 * Author: fudaoji<fdj@kuryun.cn>
 */
namespace app\mp\controller\handler\mp;

use app\common\model\MpSpecial;
use EasyWeChat\Kernel\Messages\Text;
use think\facade\Log;

class EventMessageHandler extends MessageHandler
{
    /**
     * @var \think\Model
     */
    private $mpFollowM;
    /**
     * @var \think\Model
     */
    private $specialM;
    /**
     * @var \think\Model
     */
    private $ruleM;

    /**
     * 初始化
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function __construct() {
        parent::__construct();
        $this->mpFollowM = model('mpFollow');
        $this->specialM = model('mpSpecial');
        $this->ruleM = model('mpRule');
    }

    /**
     * 处理器
     * @param null $payload
     * @return mixed
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function handle($payload = null) {
        parent::handle($payload);
        $method = camel_case('event_' . $payload['Event']);
        if(method_exists($this, $method)) {
            return call_user_func_array([$this, $method], [$payload]);
        }
        Log::write('无此事件处理方法:' . $method);
    }

    /**
     * 关注事件
     * @param $event
     * @return bool|mixed
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function eventSubscribe($event) {
        $res = '';
        //消息订阅
        if($this->mpInfo['verify_type_info'] == -1){
            $data = [
                'mpid'          => $this->mpInfo['id'],
                'openid'        => $event['FromUserName'],
                'subscribe'     => 1,
                'subscribe_time' => time(),
            ];
        }else{
            $wx_user = $this->mpApp->user->get($event['FromUserName']);
            $data = [
                'mpid'     => $this->mpInfo['id'],
                'openid'        => $wx_user['openid'],
                'nickname'      => $wx_user['nickname'],
                'subscribe'     => $wx_user['subscribe'],
                'headimgurl'    => $wx_user['headimgurl'],
                'country'       => $wx_user['country'],
                'province'      => $wx_user['province'],
                'city'          => $wx_user['city'],
                'sex'           => $wx_user['sex'],
                'remark'        => $wx_user['remark'],
                'language'      => $wx_user['language'],
                'groupid'       => $wx_user['groupid'],
                'subscribe_time' => $wx_user['subscribe_time'],
                'tagid_list'    => json_encode($wx_user['tagid_list']),
                'subscribe_scene' => $wx_user['subscribe_scene'],
                'unionid' => isset($wx_user['unionid']) ?: '',
                'qr_scene' => isset($wx_user['qr_scene']) ?: '',
                'qr_scene_str' => isset($wx_user['qr_scene_str']) ?: '',
            ];
        }

        $follow = $this->mpFollowM->getOneByMap(['mpid' => $this->mpInfo['id'], 'openid' => $event['FromUserName']], true, 1);
        if($follow) {
            $data['id'] = $follow['id'];
            $this->mpFollowM->updateOne($data);
        }else {
            $this->mpFollowM->addOne($data);
        }
        //扫描带参数二维码事件
        if(strpos($event['EventKey'], 'qrscene_') !== false) {
            //todo 根据生成二维码创建的规则处理对应事件
        }

        /*$special = $this->specialM->getOneByMap(['event' => MpSpecial::SUBSCRIBE, 'spe_mpid' => $this->mpInfo['id']]);
        if($special && $special['ignore'] == 0){
            if(!empty($special['keyword'])){
                //关键词回复
                $rule = $this->ruleM->getOneByMap(['keyword' => $special['keyword'], 'rule_mpid' => $this->mpInfo['id']]);
                if($rule){
                    $media_type = $rule['media_type'];
                    if($rule['media_type'] != 'addon'){
                        $media = model('Media'.ucfirst($rule['media_type']))->getOneByMap(['id' => $rule['media_id'], 'uid' => $this->mpInfo['uid']]);
                    }else{
                        $media = model('addons')->getOne($rule['media_id']);
                    }
                }
            }else{
                //应用回复
                $media_type = 'addon';
                $media = model('addons')->getOne($special['addon']);
            }
        }

        if(!empty($media_type) && !empty($media)){
            $method = camel_case('reply' . $media_type);
            try {
                $res = $this->$method($media);
            }catch (\Exception $e){
                Log::write($e->getMessage());
            }
        }*/
        //执行关注时回复
        $res = $this->replySpecial(MpSpecial::SUBSCRIBE);

        if($res !== ''){
            return $res;
        }
    }

    /**
     * 取消订阅
     * @param $event
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function eventUnsubscribe($event) {
        $follow = $this->mpFollowM->getOneByMap(['openid' => $event['FromUserName'], 'mpid' => $this->mpInfo['id']], true, 1);
        if($follow){
            $this->mpFollowM->updateOne([
                'id'        => $follow['id'],
                'mpid'      => $this->mpInfo['id'],
                'subscribe' => 0,
                'unsubscribe_time' => time()
            ]);
        }

        $this->replySpecial(MpSpecial::UNSUBSCRIBE);
    }

    /**
     * 扫描带参二维码事件
     * @param $event
     * @return bool|mixed
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function eventSCAN($event) {
        $key_arr = explode('@', $event['EventKey']);
        if(!empty($key_arr) && count($key_arr) < 2) {
            Log::write('约定二维码场景值应由处理方法名@场景值构成');
            return false;
        }
        $method = camel_case($key_arr[0]);
        if(method_exists($this, $method)) {
            return call_user_func_array([$this, $method], [$event]);
        }
        Log::write('无此事件处理方法:' . $method);
    }

    /**
     * 上报位置消息
     * @param $event
     * @return bool|mixed
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function eventLocation($event) {
        return  new Text(json_encode($event));
    }

}