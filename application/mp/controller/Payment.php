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
 * Script Name: Payment.php
 * Create: 2020/7/1 15:34
 * Description: 公众号统一支付
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\mp\controller;

use app\common\controller\BaseCtl;
use ky\Payment as PayApi;
use think\facade\View;

class Payment extends BaseCtl
{
    /**
     * @var \app\common\model\MpOrder
     */
    private $orderM;
    public function initialize()
    {
        parent::initialize(); // TODO: Change the autogenerated stub
        $this->orderM = model('mpOrder');

        View::config('view_path', env('root_path') . 'themes/mobile/' . request()->module() . '/'); //调用手机端视图
    }

    /**
     * 发起支付页，所有公众号应用涉及到的网页支付都要跳到此处进行统一支付，因为微信支付的域名配置只有5个
     * @return mixed
     * @throws \think\exception\DbException
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function pay(){
        $order_no = input('order_no', '');
        $order_info = $this->orderM->getOneByMap(['order_no' => $order_no]);
        if (empty($order_info) || $order_info['paid'] == 1){
            $this->error('订单不存在或已支付');
        }
        $params = [
            'openid' => $order_info['openid'],
            'body' => $order_info['body'],
            'out_trade_no' => $order_info['order_no'],
            'total_fee' => (int)$order_info['amount'],
            'notify_url' => $order_info['notify_url'],
        ];

        $pay_api = new PayApi(get_wx_pay_config($order_info['mpid']));
        $js_api_parameters = $pay_api->pay($params);

        $assign = [
            'js_api' => json_encode($js_api_parameters),
            'order_info' => $order_info,
        ];

        return $this->show($assign);
    }
}