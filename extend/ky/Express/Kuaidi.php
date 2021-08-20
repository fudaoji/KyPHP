<?php
/**
 * Created by PhpStorm.
 * Script Name: Yb.php
 * Create: 2018/7/4 19:37
 * Description: 快递100
 * Author: Doogie<fdj@kuryun.cn>
 */

namespace ky\Express;

class Kuaidi
{
    private $error = '';
    private $api = [
        'dev' => 'http://highapi.kuaidi.com/sandbox-query.html',
        'live' => 'http://highapi.kuaidi.com/openapi-querycountordernumber.html'
    ];
    private $config = [
        'key' => '8e4c5c30a979160c4e853764a5515b8b',
        'mode' => 'live'
    ];

    public function __construct($config = [])
    {
        $config && $this->config = array_merge($this->config, $config);
    }

    public function query($params = []){
        $params = array_merge([
            'id' => $this->config['key'],
            'com' => '',
            'nu' => '',
            'phone' => '',
            'show' => 0,
            'muti' => 0,
            'order' => 'desc'
        ], $params);
        $res = $this->sendPost($params);
        $res = json_decode($res, true);
        if($res['success']){
            //0 物流单号暂⽆结果，3 在途，4 揽件，5 疑难，6 签收，7 退签， 8 派件，9 退回
            $data = [];
            if(count($res['data'])){
                foreach ($res['data'] as $r){
                    $data[] = ['time' => $r['time'], 'context' => $r['context']];
                }
            }
            return [
                'success' => true,
                'com' => $params['com'],
                'num' => $params['nu'],
                'data' => $data,
                'status' => $res['status']
            ];
        }else{
            $this->setError($res['reason']);
        }
        return false;
    }

    public function sendPost($params = []){
        $url = $this->api[$this->config['mode']] . '?' . http_build_query($params);
        return file_get_contents($url);
    }

    /**
     * 设置错误
     * @param string $msg
     * @return mixed
     * Author: Doogie<fdj@kuryun.cn>
     */
    private function setError($msg = ''){
        $this->error = $msg;
    }


    public function getError(){
        return $this->error;
    }
}