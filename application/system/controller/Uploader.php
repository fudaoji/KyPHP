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
 * Script Name: Upload.php
 * Create: 2020/5/27 上午12:47
 * Description: 上传控制器
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\system\controller;

use app\common\model\Upload;

class Uploader extends Base
{
    /**
     * @var \think\model
     */
    private $model;
    public function initialize(){
        parent::initialize();
        $this->model = new Upload();
        config('log', []);
    }

    /**
     * 图片上传
     * Author: Doogie <461960962@qq.com>
     */
    public function picturePost()
    {
        $upload_config_pic = Upload::config();
        return self::upload($upload_config_pic);
    }

    /**
     * 文件上传
     * Author: Doogie <461960962@qq.com>
     */
    public function filePost(){
        $upload_config_file = Upload::config('file');
        return self::upload($upload_config_file);
    }

    /**
     * 最终的上传操作
     * @param array $config
     * @return mixed
     * @Author  Doogie<461960962@qq.com>
     */
    private function upload($config = []){
        /* 调用文件上传组件上传文件 */
        $return = $this->model->upload($_FILES, $config, ['from' => 2, 'uid' => $this->adminId]);

        return response()->create($return, 'json')->send();
    }

    /**
     * ueditor的服务端接口
     * @Author: Doogie <461960962@qq.com>
     */
    public function editorPost(){
        $action = input('get.action');
        $ue_config = Upload::ueConfig();
        switch ($action) {
            case 'config':
                $return = $ue_config;
                break;
            /* 上传图片 */
            case 'uploadimage':
                /* 上传涂鸦 */
            case 'uploadscrawl':
                /* 上传视频 */
            case 'uploadvideo':
                /* 上传文件 */
            case 'uploadfile':
                $return = $this->model->ueUpload($action, ['from' => 2, 'uid' => session('aid')]);
                break;

            /* 列出图片 */
            case 'listimage':
                /* 列出文件 */
            case 'listfile':
                $return = $this->model->ueList($action, ['uid' => session('aid')]);
                break;

            /* 抓取远程文件 */
            case 'catchimage':
                $return['state'] = '请求地址出错';
                break;

            default:
                $return['state'] = '请求地址出错';
                break;
        }

        return response()->create($return, 'json')->send();
    }
}