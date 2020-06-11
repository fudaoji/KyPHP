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
 * Script Name: Base.php
 * Create: 2020/5/17 下午8:53
 * Description: event base
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\event;

use ky\Upload\Driver\Qiniu;

class Base
{
    /**
     * 获取七牛对象
     * @return Qiniu
     * Author: Doogie<fdj@kuryun.cn>
     */
    public function getQiniu(){
        $config = config('system.upload');
        return new Qiniu([
            'secrectKey' => $config['qiniu_sk'], //七牛服务器
            'accessKey' => $config['qiniu_ak'], //七牛用户
            'domain' => $config['qiniu_domain'], //七牛密码
            'bucket' => $config['qiniu_bucket'], //空间名称
        ]);
    }

    /**
     * redis对象
     * @return mixed
     * Author: Doogie<fdj@kuryun.cn>
     */
    public function getRedis(){
        $redis = new \think\cache\driver\Redis(config('cache.redis'));
        return $redis->handler();
    }

}