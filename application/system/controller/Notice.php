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
 * Script Name: Notice.php
 * Create: 2020/7/16 17:21
 * Description: 系统公告
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\system\controller;

class Notice extends Base
{
    /**
     * @var \app\common\model\Notice
     */
    private $noticeM;
    /**
     * @var \app\common\model\NoticeRead
     */
    private $readM;
    public function initialize()
    {
        parent::initialize(); // TODO: Change the autogenerated stub
        $this->noticeM = model('notice');
        $this->readM = model('noticeRead');
    }

    /**
     * 系统公告
     * @return mixed
     * Author: fudaoji<fdj@kuryun.cn>
     * @throws \think\exception\DbException
     */
    public function index(){
        $data_list = $this->noticeM->page($this->pageSize, [], ['publish_time' => 'desc'],true, 1);
        $read = $this->readM->getOneByMap(['uid' => $this->adminId]);
        foreach ($data_list as $k => $value){
            if(strpos($read['notice'], 'id'.$value['id']) !== false){
                $value['read'] = true;
            }else{
                $value['read'] = false;
            }
            $data_list[$k] = $value;
        }

        $page = $data_list->render();
        return $this->show(['data_list' => $data_list, 'page' => $page]);
    }

    /**
     * 设置已读
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function setReadPost(){
        if(request()->isPost()){
            $id = input('post.id');
            $read = $this->readM->getUserRead(['uid' => $this->adminId]);
            strpos($read['notice'], 'id'.$id) === false
            && $this->readM->updateOne(['id' => $read['id'], 'notice' => $read['notice'] . ',id'.$id]);
            $this->readM->getOneByMap(['uid' => $this->adminId], true, true); //删除缓存
            $this->success('success');
        }
    }

    /**
     * 获取是否有未读公告
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function hasNewPost(){
        if(request()->isPost()){
            $read = $this->readM->getUserRead(['uid' => $this->adminId]);
            $ids = explode(',', str_replace('id', '', $read['notice']));
            $total = $this->noticeM->total(['id' => ['notin', count($ids) ? $ids : [0]]]);
            $this->success('success', '',['total' => $total]);
        }
    }
}