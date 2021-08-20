<?php

namespace ky;

class Express
{
    protected $api;
    protected $driver;
    protected $error;

    public function __construct($config = [], $driver='')
    {
        $this->driver = $driver ? $driver : 'kuaidi';
        $class = '\\ky\\Express\\' . ucfirst(strtolower($this->driver));
        $this->api = new $class($config);
        if(!$this->api){
            throw new \Exception("不存在物流驱动：{$driver}");
        }
    }

    /**
     * 查询
     * @param array $params
     * @return bool|mixed
     * @author: Doogie<461960962@qq.com>
     */
    public function query($params){
        return $this->api->query($params);
    }

    /**
     * 返回错误信息
     * @return mixed
     * @author: Doogie<461960962@qq.com>
     */
    public function getError(){
        return $this->api->getError();
    }
}