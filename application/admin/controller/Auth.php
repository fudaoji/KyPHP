<?php
// +----------------------------------------------------------------------
// | [KyPHP System] Copyright (c) 2020 http://www.kuryun.com/
// +----------------------------------------------------------------------
// | [KyPHP] 并不是自由软件,你可免费使用,未经许可不能去掉KyPHP相关版权
// +----------------------------------------------------------------------
// | Author: fudaoji <461960962@qq.com>
// +----------------------------------------------------------------------


namespace app\admin\controller;

use think\captcha\Captcha;
use think\Controller;


class Auth extends Controller
{
    public function login()
    {
        if (request()->isAjax()) {
            $captcha = new Captcha();
            if(!$captcha ->check(input('verify'), 2)){
                return ['code' => -1, 'msg' => '验证码错误'];
            }

            $user_name = input('user_name');
            $password = input('password');
            $admin = model("admin")->getOneByMap(['admin_name' => $user_name,'status'=>1]);
            $pwd = md5($password . $admin['rand_str']);
            if (empty($admin)) {
                return ['code' => -1, 'msg' => '用户不存在'];
            }
            if ($admin['password'] == $pwd) {
                model("admin")->updateOne(['id' => $admin['id'], 'ip' => request()->ip(), 'last_time' => time()]);
                unset($admin['password'], $admin['rand_str']);
                session('adminId', $admin['id']);
                cookie('admin', ['admin_name' => $admin['admin_name'], 'admin_id' => $admin['id']]);
                $this->success('登录成功!', cookie('redirect_url') ? cookie('redirect_url') : url('mp/mp/index'));
            } else {
                $this->error('账号或密码错误');
            }
        }else{
            if(session('adminId')){
                $this->redirect('mp/mp/index');
            }
        }
        return view('');
    }

    public function logout()
    {
        session(null, config("app_prefix"));
        cookie(null, config("app_prefix"));
        $this->redirect('admin/auth/login');
    }

    public function verify()
    {
        $captcha = new Captcha(['fontSize' => 15]);
        return $captcha->entry(2);
    }
}