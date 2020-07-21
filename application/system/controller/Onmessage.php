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
 * Script Name: Onmessage.php
 * Create: 2020/7/21 10:36
 * Description: 第三方回调
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\system\controller;

use ky\Payment;
use app\common\controller\BaseCtl;
use think\Db;
use think\facade\Log;

class Onmessage extends BaseCtl
{
    /**
     * @var \app\common\model\OrderAddon
     */
    protected $orderAddonM;

    /**
     * 初始化
     * @author Jason<dcq@kuryun.cn>
     */
    public function initialize()
    {
        parent::initialize();
        $this->orderAddonM = model('OrderAddon');
    }

    /**
     * 开通应用支付回调
     * @throws \Exception
     * @author fudaoji<fdj@kuryun.cn>
     */
    public function payAddonCallBack()
    {
        $pay_api = new Payment(get_pay_config('wx'));
        $data = $pay_api->notify();
        Log::write(json_encode($data));
        if ($data['ky_pay_result'] === true) {
            Db::startTrans();
            try {
                //获取订单信息
                $order_info = $this->orderAddonM->getOneByMap(['order_no' => $data['out_trade_no']]);
                if ($order_info['paid'] != 1) {
                    //修改订单状态
                    $this->orderAddonM->updateOne([
                        'id' => $order_info['id'], 'paid' => 1, 'pay_time' => time(),
                        'transaction_id' => $data['transaction_id']
                    ]);
                    $addon = model('addons')->getOneByMap(['addon' => $order_info['addon']]);
                    //开通的应用
                    controller('common/addon', 'event')->afterBuyAddon([
                        'addon' => $addon,
                        'uid' => $order_info['uid']
                    ]);
                    Db::commit();
                }
            } catch (\Exception $e) {
                Log::write('修改订单状态出错，错误信息：', json_encode($e->getMessage()));
                Db::rollback();
            }
            $pay_api->replyNotify($data);
        } else {
            Log::write('支付失败，失败原因：' . $data['return_msg']);
            $pay_api->replyNotify($data);
        }
    }

}