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
 * Script Name: ImageMessageHandler.php
 * Create: 2020/6/8 下午11:12
 * Description: 特殊消息类型处理器
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\mp\controller\handler\mp;

class SpecialMessageHandler extends MessageHandler
{
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

        $res = $this->replySpecial($payload['MsgType']);
        if($res){
            return $res;
        }
    }
}