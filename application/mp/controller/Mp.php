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
 * Create: 2020/3/3 下午4:35
 * Description:
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\mp\controller;

class Mp extends Base
{
    public function initialize(){
        parent::initialize();
    }

    /**
     * 自动回复
     * @param string $type
     * @return mixed
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function autoReply($type = 'text')
    {
        $where = ['mpid' => $this->mpId, 'ru.type' => $type];
        if($search_key = input('keyword', '')){
            $where['ru.keyword'] = ['like', '%'.$search_key.'%'];
        }
        if (input('search_type') == 1) {
            $data = model('mpRule')->page(10, ['mpid' => $this->mpId]);
            $type = 'search';
        }else{
            switch ($type) {
                case 'text':
                case 'news':
                case 'voice':
                case 'image':
                case 'video':
                case 'music':
                    $data = model('mpRule')->pageJoin([
                        'alias' => 'ru',
                        'join' => [[model('mpReply')->getTrueTable(['mp_id' => $this->mpId]).' rp', 'rp.id=ru.reply_id']],
                        'page_size' => 10,
                        'where' => $where,
                        'field' => 'ru.id,ru.keyword,ru.status,rp.content',
                        'order' => ['ru.id' => 'desc']
                    ]);
                    break;
                case 'addon':
                    $ruleModel = new MpRule();
                    $data = $ruleModel->alias('r')
                        ->where(['r.mpid' => $this->mid, 'r.type' => 'addon'])
                        ->join('__ADDONS__ a', 'a.addon=r.addon')->field('r.keyword,r.id,r.mpid,r.addon,r.type,r.status,a.name,a.desc,a.logo')
                        ->select();
                    $this->assign('data', $data);
                    $this->assign('type', $type);
                    break;

            }
        }

        $search_type = input('search_type', 1);
        $assign = ['type' => $type, 'search_type' => $search_type, 'data' => $data];
        return $this->show($assign);
    }

    /**
     * index
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function index(){
        $report = model('mpUser')->getReport($this->mpId);
        return $this->show(['report' => $report, 'data_by_api' => [], 'app_by_api' => []]);
    }
}