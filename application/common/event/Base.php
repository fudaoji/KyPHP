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

use EasyWeChat\Factory;
use ky\ErrorCode;
use ky\Upload\Driver\Qiniu;
use Symfony\Component\Cache\Adapter\RedisAdapter;

class Base
{
    public function __construct()
    {
        model('common/setting')->settings();
    }

    /**
     * 获取开放平台
     * @return \EasyWeChat\OpenPlatform\Application
     * Author: fudaoji<fdj@kuryun.cn>
     * @throws \Exception
     */
    public function getOpenPlatform(){
        $platform = config('system.weixin.platform');
        if(empty($platform)){
            exception("开放平台参数未配置", ErrorCode::WxCompException);
        }
        $config = [
            'app_id' => $platform['appid'],
            'secret'   => $platform['appsecret'],
            'token'    => $platform['token'],
            'aes_key'  => $platform['aes_key']
        ];
        $app = Factory::openPlatform($config);
        /*$client = new \Predis\Client('tcp://'.config('cache.redis')['host'].':' . config('cache.redis')['port']);
        $app->rebind('cache', new RedisAdapter($client));*/
        return  $app;
    }

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