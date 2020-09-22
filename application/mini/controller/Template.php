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
 * Script Name: Template.php
 * Create: 2020/7/25 下午9:36
 * Description: 版本管理
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\mini\controller;

use app\admin\controller\FormBuilder;
use app\common\model\MiniTemplateLog;
use ky\ErrorCode;
use ky\Helper;
use ky\MiniPlatform\Request\WxaCommit;
use ky\MiniPlatform\Request\WxaGetAuditStatus;
use ky\MiniPlatform\Request\WxaGetCategory;
use ky\MiniPlatform\Request\WxaGetPage;
use ky\MiniPlatform\Request\WxaGetQrcode;
use ky\MiniPlatform\Request\WxaModifyDomain;
use ky\MiniPlatform\Request\WxaRelease;
use ky\MiniPlatform\Request\WxaSetWebViewDomain;
use ky\MiniPlatform\Request\WxaSpeedupAudit;
use ky\MiniPlatform\Request\WxaSubmitAudit;
use ky\MiniPlatform\Request\WxaUndoCodeAudit;
use ky\MiniPlatform\RequestClient;
use think\Db;

class Template extends Base
{
    /**
     * @var RequestClient
     */
    private $client;
    /**
     * @var \app\common\model\MiniTemplateLog
     */
    private $model;

    public function initialize()
    {
        parent::initialize(); // TODO: Change the autogenerated stub
        $this->client = new RequestClient();
        $this->model = model('miniTemplateLog');
    }

    /**
     * 加速审核
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     * @throws \Exception
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function speedupAuditPost(){
        if(request()->isPost()){
            $audit_id = input('post.auditid', 0, 'intval');
            if(empty($audit_id)){
                $this->error('参数错误');
            }
            $request = new WxaSpeedupAudit();
            $request->setAuditId($audit_id);
            $response = $this->client->execute($request, $this->getAccessToken());
            if($response['errcode'] == 0){
                $this->success('操作成功');
            }else{
                $this->error($response['errmsg']);
            }
        }
    }

    /**
     * 发布
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function releasePost(){
        if(request()->isPost()){
            $id = input('post.id');
            $request = new WxaRelease();
            $response = $this->client->setCheckRequest(false)->execute($request, $this->getAccessToken());
            if($response['errcode'] == 0){
                $this->model->updateOne([
                    'id' => $id,
                    'status' => MiniTemplateLog::PUBLISHED,
                    'publish_time' => time()
                ]);
                $this->success('恭喜您，发布成功');
            }else{
                $this->error($response['errmsg']);
            }
        }
    }

    /**
     * 撤销审核
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function cancelAuditPost(){
        // 单个帐号每天审核撤回次数最多不超过 1 次，一个月不超过 10 次。
        if(request()->isPost()){
            $id = input('post.id');
            $request = new WxaUndoCodeAudit();
            $response = $this->client->setCheckRequest(false)->execute($request, $this->getAccessToken());
            if($response['errcode'] == 0){
                $this->model->updateOne(['id' => $id, 'status' => MiniTemplateLog::CANCEL]);
                $this->success('操作成功');
            }else{
                $this->error($response['errmsg']);
            }
        }
    }

    /**
     * 获取审核最新信息
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function getAuditStatusPost(){
        if(request()->isPost()){
            $audit_id = input('post.auditid', 0, 'intval');
            if(empty($audit_id)){
                $this->error('参数错误');
            }
            $log = $this->model->getOneByMap(['audit_id' => $audit_id, 'status' => MiniTemplateLog::VERIFYING]);
            if(empty($log)){
                $this->success('success');
            }
            $request = new WxaGetAuditStatus();
            $request->setAuditId($audit_id);
            $response = $this->client->execute($request, $this->getAccessToken());
            if($response['errcode'] == 0){
                if($response['status'] != 2){ //如果不处于审核中，则修改数据库
                    $status_dict = [
                        0 => MiniTemplateLog::SUCCESS,
                        1 => MiniTemplateLog::FAIL,
                        3 => MiniTemplateLog::CANCEL,
                        4 => MiniTemplateLog::DELAY
                    ];
                    $this->model->updateOne([
                        'id' => $log['id'],
                        'status' => $status_dict[$response['status']],
                        'reason' => in_array($response['status'], [1, 4]) ? $response['reason'] : $log['reason']
                    ]);
                }
                $this->success('success');
            }else{
                $this->error($response['errmsg']);
            }
        }
    }

    /**
     * 提交审核
     * @return mixed
     * Author: fudaoji<fdj@kuryun.cn>
     * @throws \Exception
     */
    public function commitAudit(){
        $log_id = input('log_id', 0, 'intval');
        $log = $this->model->getOne($log_id, true);

        $token = $this->getAccessToken();
        if(request()->isPost()){
            $post_data = input('post.');
            $category_list = cache('mini_category_list');
            $item = [];
            $ids = explode('-',$post_data['category']);
            $class_list = explode('->', $category_list[$post_data['category']]);
            $step = ['first', 'second', 'third'];
            foreach ($ids as $k => $v){
                $item[$step[$k] . '_id'] = $v;
                $item[$step[$k] . '_class'] = $class_list[$k];
                $item['address'] = $post_data['page'];
                $post_data['tags'] && $item['tag'] = implode(' ', explode(',', $post_data['tags']));
            }
            $item_list = [$item];
            $request = new WxaSubmitAudit();
            $request->setItemList($item_list);
            !empty($post_data['version_desc']) && $request->setVersionDesc($post_data['version_desc']);
            $response = $this->client->execute($request, $token);
            if($response['errcode'] == 0) {
                $this->model->updateOne([
                    'id'            => $log_id,
                    'audit_id'      => $response['auditid'],
                    'extend_info'   => json_encode($item_list),
                    'status'        => MiniTemplateLog::VERIFYING,
                    'verify_time'   => time()
                ]);
                $this->success('提交成功，审核需要一定时间，请耐心等待');
            }else{
                $this->error($response['errmsg']);
            }
        }

        $this->assign['version_desc'] = $log['user_desc'];
        $this->assign['log_id'] = $log['id'];
        $request = new WxaGetPage();
        $this->client->checkRequest = false;

        $response = $this->client->setCheckRequest(false)->execute($request, $token);
        if($response['errcode'] == 0) {
            $this->assign['page'] = $response['page_list'][0];
        }else {
            echo $response['errmsg'];exit;
        }

        $request = new WxaGetCategory();
        $response = $this->client->setCheckRequest(false)->execute($request, $token);

        if($response['errcode'] == 0) {
            $category_list = [];
            foreach ($response['category_list'] as $value){
                $id = [];
                $class = [];
                !empty($value['first_id']) && $id[] = $value['first_id'];
                !empty($value['first_class']) && $class[] = $value['first_class'];
                !empty($value['second_id']) && $id[] = $value['second_id'];
                !empty($value['second_class']) && $class[] = $value['second_class'];
                !empty($value['third_id']) && $id[] = $value['third_id'];
                !empty($value['third_class']) && $class[] = $value['third_class'];
                $category_list[implode('-', $id)] = implode('->', $class);
            }
            $this->assign['category_list'] = $category_list;
            cache('mini_category_list', $category_list);
        }else{
            echo $response['errmsg'];exit;
        }

        return $this->show();
    }

    /**
     * 历史版本
     * @return mixed
     * @throws \think\exception\DbException
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function log(){
        $where = [
            'mini_id' => $this->miniId
        ];
        $data_list = $this->model->pageJoin([
            'alias' => 'mtl',
            'join' => [
                ['addons a', 'mtl.addon = a.addon']
            ],
            'where' => $where,
            'page_size' => $this->pageSize,
            'order' => ['id' => 'desc'],
            'field' => 'a.logo,a.version,a.name,mtl.*',
            'refresh' => 'true'
        ]);
        $this->assign['page'] = $data_list->appends([])->render();
        $this->assign['data_list'] = $data_list;
        return $this->show();
    }

    /**
     * 版本管理
     * @return mixed
     * @throws \think\exception\DbException
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function index(){
        $publish_list = $this->model->getListJoin([
            'alias' => 'mtl',
            'join' => [
                ['addons a', 'a.addon=mtl.addon']
            ],
            'limit' => [0, 1],
            'order' => ['id' => 'desc'],
            'where' => ['mini_id' => $this->miniId, 'mtl.status' => MiniTemplateLog::PUBLISHED],
            'field' => 'a.logo,a.name,mtl.*',
            'refresh' => true
        ]);
        $this->assign['publish'] = count($publish_list) ? $publish_list[0] : [];

        $verify_list = $this->model->getListJoin([
            'alias' => 'mtl',
            'join' => [
                ['addons a', 'a.addon=mtl.addon']
            ],
            'limit' => [0, 1],
            'order' => ['id' => 'desc'],
            'where' => [
                'mini_id' => $this->miniId,
                'mtl.status' => ['in', [MiniTemplateLog::VERIFYING, MiniTemplateLog::SUCCESS, MiniTemplateLog::FAIL, MiniTemplateLog::DELAY]]],
            'field' => 'a.logo,a.name,mtl.*',
            'refresh' => true
        ]);
        $this->assign['verify'] = count($verify_list) ? $verify_list[0] : [];

        $this->assign['current'] = $this->model->getOneJoin([
            'alias' => 'mtl',
            'join' => [
                ['addons a', 'a.addon=mtl.addon']
            ],
            'where' => ['mini_id' => $this->miniId, 'mtl.is_current' => 1],
            'field' => 'a.logo,a.name,mtl.*',
            'refresh' => true
        ]);
        return $this->show();
    }

    /**
     * 获取体验二维码
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function getTestQrCode(){
        if(request()->isPost()){
            $post_data = input('post.');
            $log = $this->model->getOne($post_data['id']);
            if(empty($log)){
                $this->error('参数错误');
            }
            if(empty($log['qr_code'])){
                $request = new WxaGetQrcode();
                $response = $this->client->setCheckRequest(false)->execute(
                    $request,
                    $this->miniApp->access_token->getToken()['authorizer_access_token'],
                    true
                );
                if(is_array($response)){
                    $this->error($response['errmsg']);
                }else{
                    $qiniu = controller('mini/mini', 'event')->getQiniu();
                    $res = $qiniu->putString([
                        'string' => $response,
                        'key' => 'mini_qrcode_test_'.$this->miniId.'_'.time().'.png'
                    ]);
                    if($res === false){
                        $this->error($qiniu->getError());
                    }
                    $log = $this->model->updateOne(['id' => $post_data['id'], 'qr_code' => $res]);
                }
            }
            $this->success('success', '', ['src' => $log['qr_code']]);
        }
    }

    /**
     * 新建版本
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function choose(){
        $builder = new FormBuilder();
        $builder->setPostUrl(url('choosePost'))
            ->setTemplate('common/form')
            ->setTip('此操作会耗时一段时间，请勿关闭窗口')
            //->addFormItem('user_version', 'text', '版本号', '支持数字和字母,长度不超过64个字符', [], 'required maxlength=64')
            ->addFormItem('user_desc', 'text', '版本描述', '版本描述', [], 'required maxlength=200')
            ->addFormItem('addon', 'choose_addon', '选择应用', '', [], 'required');
        return $builder->show();
    }

    /**
     * 为第三方小程序进行参数设置
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function choosePost(){
        //设置服务器域名-》设置业务域名（个人号跳过此步骤）-》上传代码-》下载体验二维码
        if(request()->isPost()){
            $post_data = input('post.');
            if(empty($post_data['user_desc']) ||
                empty($post_data['addon'])){
                $this->error('请完善必填项', '', ['token' => request()->token]);
            }
            $addon = model('addons')->getOneByMap(['addon' => $post_data['addon']]);
            $post_data['user_version'] = $addon['version']; //将应用的版本号作为小程序的版本号
            $access_token = $this->miniApp->access_token->getToken()['authorizer_access_token'];
            $total = model('miniTemplateLog')->total(['mini_id' => $this->miniId], true);
            $http_host = request()->server()['HTTP_HOST'];
            if(! $total){ //有版本记录的说明设置过域名了
                //1、设置服务器域名
                $request = new WxaModifyDomain();
                $request->setAction('set');
                $request->setRequestDomain(['https://' . $http_host]);
                $request->setWsRequestDomain(['wss://' . $http_host]);
                $request->setUploadDomain(['https://' . $http_host]);
                $request->setDownloadDomain(['https://' . $http_host]);
                $response = $this->client->execute($request, $access_token);

                if($response['errcode'] != 0) {
                    $this->error($response['errmsg'], '', ['token' => request()->token]);
                }
                //2、设置业务域名
                if($this->miniInfo['principal_name'] !== '个人'){
                    $web_view_domain = [];
                    if(! empty(config('system.mini.web_view_domain'))) { //todo 小程序配置上应该有此项的配置
                        foreach (config('system.mini.web_view_domain') as $value) {
                            array_push($web_view_domain, 'https://' . trim($value, 'http://,https://'));
                        }
                    }else {
                        array_push($web_view_domain, 'https://' . $http_host);
                    }
                    $request = new WxaSetWebViewDomain();
                    $request->setAction('set');
                    $request->setWebViewDomain($web_view_domain);
                    $response = $this->client->execute($request, $access_token);
                    if($response['errcode'] != 0) {
                        $this->error($response['errmsg'], '', ['token' => request()->token]);
                    }
                }
            }

            //3.上传代码
            $addon_template = model('addonsTemplate')->getOneByMap(['addon' => $post_data['addon']], true, true);
            $request = new WxaCommit();
            $request->setTemplateId($addon_template['template_id']);
            $ext_json = json_encode([
                'ext' => [
                    'appId' => $this->miniInfo['appid'],
                    'env' => [
                        //"restUrl" => "https://".$http_host."/app/".$post_data['addon']."/api/",
                        //"qiniuRegion" => "SCN",
                        "qiniuDomain" => config('system.upload.qiniu_domain'),
                        "appKey" => config('app_key'),
                        "mapKey" => config('system.common.map_qq_key'),
                        "version" => $post_data['user_version']
                    ],
                ]
            ]); //还要加其他的配置参数，例如地图key，七牛key等
            $request->setExtJson($ext_json);
            $request->setUserVersion($post_data['user_version']);
            $request->setUserDesc($post_data['user_desc']);
            $response = $this->client->execute($request, $access_token);
            if($response['errcode'] == 0) {
                //用户模板选购
                $data = [
                    'uid'           => $this->adminId,
                    'mini_id'       => $this->miniId,
                    'addon'         => $post_data['addon'],
                    'template_id'   => $addon_template['template_id'],
                    'ext_json'      => $ext_json,
                    'user_version'  => $post_data['user_version'],
                    'user_desc'     => $post_data['user_desc']
                ];
                Db::startTrans();
                try {
                    $this->model->updateByMap(['mini_id' => $this->miniId, 'is_current' => 1], ['is_current' => 0]);
                    $result = $this->model->addOne($data);
                    Db::commit();
                }catch (\Exception $e){
                    $result = false;
                    Db::rollback();
                }
                if($result === false){
                    $this->error('系统出错，请刷新重试', '', ['token' => request()->token]);
                }

            }else {
                $this->error($response['errmsg'], '', ['token' => request()->token]);
            }
            $this->success('代码提交成功，在正式提交审核之前建议您先扫码体验', url('index'));
        }
    }

    /**
     * 切换到历史版本
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function useLogPost(){
        if(request()->isPost()){
            $id = input('post.id', 0, 'intval');
            $log = $this->model->getOneByMap(['id' => $id, 'mini_id' => $this->miniId], true, true);
            if(empty($log)){
                $this->error('参数错误');
            }
            $request = new WxaCommit();
            $request->setTemplateId($log['template_id']);
            $ext_json = $log['ext_json'];
            $request->setExtJson($ext_json);
            $request->setUserVersion($log['user_version']);
            $request->setUserDesc($log['user_desc']);
            $response = $this->client->execute($request, $this->getAccessToken());
            if($response['errcode'] == 0) {
                Db::startTrans();
                try {
                    $this->model->updateByMap(['mini_id' => $this->miniId, 'is_current' => 1], ['is_current' => 0]);
                    $result = $this->model->updateOne(['id' => $id, 'is_current' => 1]);
                    Db::commit();
                }catch (\Exception $e){
                    $result = false;
                    Db::rollback();
                }
                if($result === false){
                    $this->error('系统出错，请刷新重试');
                }
            }else {
                $this->error($response['errmsg']);
            }
            $this->success('版本切换成功，在正式提交审核之前建议您先扫码体验', url('index'));
        }
    }
}