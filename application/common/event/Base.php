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
use Intervention\Image\ImageManagerStatic as Image;
use ky\ErrorCode;
use ky\Logger;
use ky\Upload\Driver\Qiniu;
use Symfony\Component\Cache\Adapter\RedisAdapter;

class Base
{
    public function __construct()
    {
        model('common/setting')->settings();
    }

    /**
     * 通用生成海报
     * @param array $list
     * @return string
     * Author: Doogie<fdj@kuryun.cn>
     */
    public function generatePoster($list = [])
    {
        Image::configure(['driver' => 'imagick']);
        //背景图片
        $image = Image::make($list['bg']);
        foreach ($list['items'] as $params){
            switch ($params['type']){
                case 'text':
                    if(empty($params['value'])){
                        break;
                    }
                    try {
                        $image->text($params['value'], $params['position'][0], $params['position'][1], function ($font) use($params) {
                            $font->file(empty($params['family']) ? '/usr/share/fonts/chinese/MSYH.TTF' : $params['family']);
                            $font->size($params['size']);
                            $font->color($params['color']);
                            !empty($params['align']) && $font->align($params['align']);
                            !empty($params['valign']) && $font->valign($params['valign']);
                        });
                    }catch(\Exception $e){
                        Logger::write('写' . $params['title'].'错误：' . json_encode($e->getMessage()));
                        //return false;
                    }
                    break;
                case 'image':
                    if(empty($params['value'])){
                        break;
                    }
                    $flag = false;
                    $count = 0;
                    while ($flag === false && $count < 10) {
                        $count++;
                        try {
                            $head = Image::make($params['value']);
                            if(!empty($params['size'])){
                                $head = $head->fit($params['size'][0], $params['size'][1]);
                            }
                            if(!empty($params['corner'])){
                                //$head->filter(new RoundCornerFilter($params['corner'][0]));
                                //$head->getCore()->roundCorners($params['corner'][0], $params['corner'][1]); //getCore()方法指向了原生的Imagick类的对象
                            }
                            $image->insert($head, $params['position_name'], $params['position'][0], $params['position'][1]);
                            $flag = true;
                        } catch (\Exception $e) {
                            Logger::write($params['title'] . '放入背景图出错：' . json_encode($e->getMessage()));
                            //return false;
                        }
                    }
                    /*if($flag === false){
                        return false;
                    }*/
                    break;
                case 'line':
                    try {
                        $image->line($params['point1'][0], $params['point1'][1], $params['point2'][0],$params['point2'][1], function ($draw) use($params) {
                            $draw->color($params['color']);
                            !empty($params['with']) && $draw->with($params['with']);
                        });
                    }catch(\Exception $e){
                        Logger::write('画' . $params['title'].'错误：' . json_encode($e->getMessage()));
                        //return false;
                    }
                    break;
            }
        }

        try {
            $pic_name = $list['pic_name'].'-'.time() . '.png';
            return $this->getQiniu()->putString(['key' => $pic_name, 'string' => $image->stream('png', 80)]);
        } catch (\Exception $e) {
            Logger::write('保存海报失败： ' . json_encode($e->getMessage()));
            return false;
        }
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