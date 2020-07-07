<?
// +----------------------------------------------------------------------
// | [KyPHP System] Copyright (c) 2020 http://www.kuryun.com/
// +----------------------------------------------------------------------
// | [KyPHP] 并不是自由软件,你可免费使用,未经许可不能去掉KyPHP相关版权
// +----------------------------------------------------------------------
// | Author: fudaoji <fdj@kuryun.cn>
// +----------------------------------------------------------------------
/**
 * Created by PhpStorm.
 * Script Name: TextMessageHadler.php
 * Create: 2020/4/15 10:40
 * Description: 公众号文本消息处理器
 * Author: fudaoji<fdj@kuryun.cn>
 */
namespace app\mp\controller\handler\mp;

use think\facade\Log;

class TextMessageHandler extends MessageHandler
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
        parent::handle($payload);
        $res = $this->replyKeyword($payload['Content'], $payload);
        if($res){
            return $res;
        }
    }
}