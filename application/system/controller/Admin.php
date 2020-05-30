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
 * Script Name: admin.php
 * Create: 2020/3/3 下午10:09
 * Description: 会员管理
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace app\system\controller;

use app\admin\controller\FormBuilder;

class Admin extends Base
{
    public function initialize(){
        parent::initialize();
    }

    /**
     * 修改自己密码
     * @return \think\response\View
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function updateMyPwd()
    {
        if (request()->isPost()) {
            $post_data = input('post.');
            $res = $this->validate($post_data, "Admin.resetPwd");
            if($res !== true){
                $this->error($res, '', ['token' => request()->token()]);
            }

            if (model('admin')->updateOne([
                'id' => $this->adminId,
                'password' => ky_generate_password($post_data['password']),
            ])) {
                session(null, config("app_prefix"));
                $this->success('操作成功,请重新登录', url('admin/auth/login'));
            } else {
                $this->error('操作失败', '', ['token' => request()->token()]);
            }
        }
        $builder = new FormBuilder();
        $builder->setTabNav([
            'basic' => ['title' => '基础信息', 'href' => url('myinfo')],
            'password' => ['title' => '重置密码', 'href' => url('updateMyPwd')]
        ], 'password')
            ->addFormItem('password', 'password', '新密码', '6-20位,建议使用复杂一些的密码', [], 'required minlength=6 maxlength=20 ')
            ->addFormItem('repassword', 'password', '重复密码', '请再次输入密码', [], 'required equalTo=#password  title=两次输入的密码不一致');
        return $builder->show();
    }

    /**
     * 我的账号信息
     * @return mixed
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function myInfo(){
        if (request()->isPost()) {
            $post_data = input('post.');
            $post_data['id'] = $this->adminId;
            $res = $this->validate($post_data,'Admin.edit');
            if($res !== true){
                $this->error($res, '', ['token' => request()->token()]);
            }

            $data = [
                'id'  => $this->adminId,
                'username' => $post_data['username'],
                'email' => $post_data['email'],
                'mobile' => $post_data['mobile'],
                'realname' => $post_data['realname']
            ];
            if (model('admin')->updateOne($data)) {
                $this->success('操作成功');
            } else {
                $this->error('操作失败', '', ['token' => request()->token()]);
            }
        }
        $builder = new FormBuilder();
        $builder->setTabNav([
                'basic' => ['title' => '基础信息', 'href' => url('myinfo')],
                'password' => ['title' => '重置密码', 'href' => url('updateMyPwd')]
            ], 'basic')
            ->addFormItem('username', 'text', '账号', '3-20位', [], 'required minlength=3 maxlength=20 ')
            ->addFormItem('email', 'email', '邮箱', '邮箱')
            ->addFormItem('mobile', 'tel', '手机', '手机', [], 'data-rule-phone=true')
            ->addFormItem('realname', 'text', '姓名', '姓名', [], 'minlength="2" maxlength="10"')
            ->setFormData($this->adminInfo);
        return $builder->show();
    }

    /**
     * 修改成员密码
     * @param $id
     * @return \think\response\View
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function updatePwd($id)
    {
        if (request()->isPost()) {
            $post_data = input('post.');
            $res = $this->validate($post_data, "Admin.resetPwd");
            if($res !== true){
                $this->error($res, '', ['token' => request()->token()]);
            }

            $admin = model('admin')->getOne($post_data['id']);
            if ($admin) {
                if ($admin['admin_id'] != $this->adminId) {
                    $this->error('你无权操作', '', ['token' => request()->token()]);//禁用成员不属于当前管理员
                }

                if (model('admin')->updateOne([
                    'id' => $post_data['id'],
                    'password' => ky_generate_password($post_data['password']),
                ])) {
                    $this->success('操作成功', url('index'));
                } else {
                    $this->error('操作失败', '', ['token' => request()->token()]);
                }
            } else {
                $this->error('数据不存在导致操作失败', '', ['token' => request()->token()]);
            }
        }
        $builder = new FormBuilder();
        $builder->addFormItem('id', 'hidden', 'id', 'id')
            ->addFormItem('password', 'password', '新密码', '6-20位,建议使用复杂一些的密码', [], 'required minlength=6 maxlength=20 ')
            ->addFormItem('repassword', 'password', '重复密码', '请再次输入密码', [], 'required equalTo=#password  title=两次输入的密码不一致')
            ->setFormData(['id' => $id]);
        return $builder->show();
    }

    /**
     * 编辑用户
     * @return mixed
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function edit(){
        $admin = model('admin')->getOne(input('id', 0));
        if(empty($admin)){
            $this->error('数据不存在');
        }
        if (request()->isPost()) {
            $post_data = input('post.');
            if ($post_data['admin_id'] != $this->adminId) {
                $this->error('你无权操作', '', ['token' => request()->token()]);//禁用成员不属于当前管理员
            }
            $res = $this->validate($post_data,'Admin.edit');
            if($res !== true){
                $this->error($res, '', ['token' => request()->token()]);
            }

            $data = [
                'id'  => $post_data['id'],
                'username' => $post_data['username'],
                'email' => $post_data['email'],
                'mobile' => $post_data['mobile'],
                'realname' => $post_data['realname']
            ];
            if (model('admin')->updateOne($data)) {
                $this->success('操作成功', url('index'));
            } else {
                $this->error('操作失败', '', ['token' => request()->token()]);
            }
        }
        $builder = new FormBuilder();
        $builder->addFormItem('id', 'hidden', 'id', 'id')
            ->addFormItem('admin_id', 'hidden', 'admin_id', 'admin_id')
            ->addFormItem('username', 'text', '账号', '3-20位', [], 'required minlength=3 maxlength=20 ')
            ->addFormItem('email', 'email', '邮箱', '邮箱')
            ->addFormItem('mobile', 'tel', '手机', '手机', [], 'data-rule-phone=true')
            ->addFormItem('realname', 'text', '姓名', '姓名', [], 'minlength="2" maxlength="10"')
            ->setFormData($admin);
        return $builder->show();
    }

    /**
     * 新增成员
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function add(){
        if (request()->isPost()) {
            $post_data = input('post.');

            $res = $this->validate($post_data,'Admin.add');
            if($res !== true){
                $this->error($res, '', ['token' => request()->token()]);
            }

            $data = [
                'username' => $post_data['username'],
                'password' => ky_generate_password($post_data['password']),
                'email' => $post_data['email'],
                'mobile' => $post_data['mobile'],
                'realname' => $post_data['realname'],
                'admin_id' => $this->adminId
            ];
            if (model('admin')->addOne($data)) {
                $this->success('操作成功', url('index'));
            } else {
                $this->error('操作失败', '', ['token' => request()->token()]);
            }
        }
        $builder = new FormBuilder();
        $builder->addFormItem('username', 'text', '账号', '3-20位', [], 'required minlength=3 maxlength=20 ')
            ->addFormItem('password', 'password', '密码', '6-20位', [], 'required minlength=6 maxlength=20 ')
            ->addFormItem('email', 'email', '邮箱', '邮箱')
            ->addFormItem('mobile', 'tel', '手机', '手机', [], 'data-rule-phone=true')
            ->addFormItem('realname', 'text', '姓名', '姓名', [], 'minlength="2" maxlength="10"');
        return $builder->show();
    }

    /**
     * 管理成员
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public function index()
    {
        $list = model('admin')->getAll(['where' => ['admin_id' => $this->adminId]]);
        return $this->show(['admin_list' => $list]);
    }
}