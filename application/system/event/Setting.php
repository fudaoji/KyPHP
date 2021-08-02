<?php
/**
 * Created by PhpStorm.
 * Script Name: Setting.php
 * Create: 2021/7/30 下午11:25
 * Description:
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\system\event;


namespace app\system\event;

use app\common\event\Base;
use ky\ErrorCode;
use ky\Sms;

class Setting extends Base
{
    /**
     * @param array $params
     * @return Sms
     * @throws \Exception Author: fudaoji<fdj@kuryun.cn>
     */
    public function getSms($params = []){
        $sms = model('common/adminSetting')->getOneByMap(['name' => 'sms', 'uid' => $params['uid']]);
        $config = json_decode($sms['value'], true);
        return new Sms($config['account'], $config['pwd'], $config['driver']);
    }
}