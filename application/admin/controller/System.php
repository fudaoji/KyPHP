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
 * Script Name: ${FILE_NAME}
 * Create: 2020/3/3 下午10:09
 * Description: 
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\admin\controller;

class System extends Base
{
    public function initialize(){
        parent::initialize();
    }

    public function index()
    {
        $this->redirect('mp/index/mplist');
    }

    /**
     * set page width mode
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function setScreen()
    {
        if (cookie('setScreen')) {
            cookie('setScreen', null);
        } else {
            cookie('setScreen', 1);
        }
    }
}