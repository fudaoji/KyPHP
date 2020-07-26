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
 * Script Name: Mp.php
 * Create: 2020/5/24 下午3:22
 * Description: 公众号全局相关方法
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\common\event;

class Mp extends Base
{
    /**
     * 返回公众号的认证类型
     * @param array $mp
     * @return string
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function getTypeDesc($mp = []){
        return (
            ($mp['verify_type_info'] == -1 ? '未认证' : '认证') .
            ($mp['service_type_info'] < 2 ? '订阅号' : '服务号')
        );
    }
}