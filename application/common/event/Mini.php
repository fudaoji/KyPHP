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
 * Script Name: Mini.php
 * Create: 2020/7/23 13:58
 * Description:
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\event;


class Mini extends Base
{
    /**
     * 返回小程序的认证类型
     * @param array $data
     * @return string
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function getTypeDesc($data = []){
        return $data['verify_type_info'] == -1 ? '未认证' : '认证';
    }
}