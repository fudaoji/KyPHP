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
 * Script Name: Tester.php
 * Create: 2020/7/24 下午9:21
 * Description: 体验者管理
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\mini\controller;

use app\admin\controller\FormBuilder;
use ky\MiniPlatform\Request\MessageSubscribeSend;
use ky\MiniPlatform\Request\WxaBindTester;
use ky\MiniPlatform\Request\WxaUnbindTester;
use ky\MiniPlatform\RequestClient;

class Tester extends Base
{
    /**
     * @var \app\common\model\MiniTester
     */
    private $model;
    /**
     * @var RequestClient
     */
    private $client;

    public function initialize()
    {
        parent::initialize(); // TODO: Change the autogenerated stub
        $this->model = model('miniTester');
        $this->client = new RequestClient();
    }

    public function testSubscribeMsg(){
        $request = new MessageSubscribeSend();
        $request->setToUser('oUcHy5LOrkjDoZtHqGFsiKJlLcQs');
        $request->setTemplateId('T335VHIRBJ0-F21icyLRwyj7_QSuMof5BQHwZA1QJp4');
        $request->setData([
            'thing2' => ['value' => '清风明月'],
            'time3' => ['value' => date('Y年m月d日 H:i', time())],
            'thing4' => ['value' => '时间就要到了，请及时续单']
        ]);
        $response = $this->client->execute($request, $this->getAccessToken());

        var_dump($response);
    }

    /**
     * 设置状态
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function setStatusPost(){
        if(request()->isPost()){
            $post_data = input('post.');
            $data = $this->model->getOne($post_data['id']);
            if(empty($data)){
                $this->error('参数错误');
            }
            if($data['status']){
                $request = new WxaUnbindTester();
            }else{
                $request = new WxaBindTester();
            }
            $request->setWechatId($data['wechat_id']);
            $response = $this->client->execute($request, $this->getAccessToken());

            if($response['errcode'] == 0) {
                $this->model->updateOne(['id' => $data['id'], 'status' => abs($data['status'] - 1)]);
                $this->success('操作成功');
            }else{
                $this->error($response['errmsg']);
            }
        }
    }

    /**
     * 首页
     * @return mixed
     * @throws \think\exception\DbException
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function index(){
        $where = ['mini_id' => $this->miniId];
        $search_key = input('search_key', '');
        $search_key && $where['wechat_id|remark'] = ['like', '%'.$search_key.'%'];
        $data_list = $this->model->page($this->pageSize, $where, ['id' => 'desc'], true, 1);
        $page = $data_list->appends(['search_key' => $search_key])->render();
        $assign = ['search_key' => $search_key, 'data_list' => $data_list, 'page' => $page];
        return $this->show($assign);
    }

    /**
     * 新增体验者
     * @return mixed
     * Author: fudaoji<fdj@kuryun.cn>
     * @throws \think\Exception
     */
    public function add(){
        if(request()->isPost()){
            $post_data = input('post.');
            $res = $this->validate($post_data, 'MiniTester');
            if($res !== true){
                $this->error($res, '', ['token' => request()->token()]);
            }
            $request = new WxaBindTester();
            $request->setWechatId($post_data['wechat_id']);
            $response = $this->client->execute($request, $this->getAccessToken());

            if($response['errcode'] == 0) {
                //数据入库
                $insert_data = [
                    'mini_id'   => $this->miniId,
                    'wechat_id' => $post_data['wechat_id'],
                    'remark'    => $post_data['remark']
                ];
                $this->model->addOne($insert_data);
                $this->success('添加成功', url('index'));
            }else{
                $this->error($response['errmsg'], '', ['token' => request()->token()]);
            }
        }
        if($this->model->total(['status' => 1, 'mini_id' => $this->miniId]) >= 30){
            $this->error('体验者人数最多只能添加30个');
        }
        $builder = new FormBuilder();
        $builder->addFormItem('wechat_id', 'text', '微信号', '微信账号的微信号，不是昵称', [], 'required maxlength=60')
            ->addFormItem('remark', 'text', '备注', '此处建议写体验者的姓名', [], 'required maxlegnth=20');
        return $builder->show();
    }
}