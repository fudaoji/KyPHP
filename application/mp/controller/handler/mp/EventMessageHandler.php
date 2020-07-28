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

use app\common\model\MiniTemplateLog;
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
        if(!empty($event['EventKey']) && strpos($event['EventKey'], 'qrscene_') !== false) {
            //todo 根据生成二维码创建的规则处理对应事件
            return $this->eventSCAN($event);
        }

        //执行关注时回复
        $res = $this->replySpecial(MpSpecial::SUBSCRIBE, $event);

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

        $this->replySpecial(MpSpecial::UNSUBSCRIBE, $event);
    }

    /**
     * 扫描带参二维码事件
     * @param $event
     * @return bool|mixed
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function eventSCAN($event) {
        $qr = model('mpQrcode')->getOneByMap(['ticket' => $event['Ticket'], 'mpid' => $this->mpInfo['id']]);
        if(empty($qr)){
            return false;
        }
        if($qr['type'] == 1 && $qr['create_time'] + $qr['expire'] < time()){
            return new Text('二维码已失效');
        }
        //统计二维码
        try {
            $qr_update = [
                'id' => $qr['id'],
                'scan_num' => $qr['scan_num'] + 1
            ];
            $event['Event'] == 'subscribe' && $qr_update['gz_num'] = $qr['gz_num'] + 1;
            model('mpQrcode')->updateOne($qr_update);

            if($log = model('mpQrcodeLog')->getOneByMap(['qrcode_id' => $qr['id'], 'log_mpid' => $this->mpInfo['id'], 'openid' => $event['FromUserName']])){
                model('mpQrcodeLog')->updateOne(['id' => $log['id'], 'log_mpid' => $this->mpInfo['id'], 'scan_num' => $log['scan_num'] + 1]);
            }else{
                model('mpQrcodeLog')->addOne([
                    'qrcode_id' => $qr['id'],
                    'log_mpid' => $this->mpInfo['id'],
                    'openid' => $event['FromUserName'],
                    'ticket' => $qr['ticket'],
                    'type' => $event['Event'] == 'SCAN' ? 0 : 1
                ]);
            }
            //refresh data
            model('mpQrcode')->getOneByMap(['ticket' => $event['Ticket'], 'mpid' => $this->mpInfo['id']], true, 1);
            model('mpQrcodeLog')->getOneByMap(
                [
                    'qrcode_id' => $qr['id'],
                    'log_mpid' => $this->mpInfo['id'],
                    'openid' => $event['FromUserName']
                ], true, 1
            );
        }catch (\Exception $e){
            Log::error($e->getMessage());
        }

        return $this->replyKeyword($qr['keyword'], $event);
    }

    /**
     * 上报位置消息
     * @param $event
     * @return bool|mixed
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function eventLocation($event) {
        $res = $this->replySpecial(MpSpecial::EVENT_LOCATION, $event);
        if($res){
            return $res;
        }
    }

    /**
     * 自定义菜单拉取消息事件
     * @param $event
     * @return bool|mixed
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function eventClick($event) {
        $res = $this->replyKeyword($event['EventKey'], $event);
        if($res){
            return $res;
        }
    }

    /**
     * 小程序审核通过事件
     * @param $event
     * @link https://developers.weixin.qq.com/doc/oplatform/Third-party_Platforms/Mini_Programs/code/audit_event.html
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function eventWeappAuditSuccess($event){
        model('miniTemplateLog')->updateByMap(
            ['mini_id' => $this->mpInfo['id'], 'status' => MiniTemplateLog::VERIFYING],
            ['status' => MiniTemplateLog::SUCCESS]
        );
    }

    /**
     * 小程序审核不通过事件
     * @param $event
     * @link https://developers.weixin.qq.com/doc/oplatform/Third-party_Platforms/Mini_Programs/code/audit_event.html
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function eventWeappAuditFail($event){
        model('miniTemplateLog')->updateByMap(
            ['mini_id' => $this->mpInfo['id'], 'status' => MiniTemplateLog::VERIFYING],
            ['reason' => $event['Reason'], 'status' => MiniTemplateLog::FAIL]
        );
    }

    /**
     * 小程序审核延后事件
     * @param $event
     * @link https://developers.weixin.qq.com/doc/oplatform/Third-party_Platforms/Mini_Programs/code/audit_event.html
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function eventWeappAuditDelay($event){
        model('miniTemplateLog')->updateByMap(
            ['mini_id' => $this->mpInfo['id'], 'status' => MiniTemplateLog::VERIFYING],
            ['reason' => $event['Reason'], 'status' => MiniTemplateLog::DELAY]
        );
    }
}