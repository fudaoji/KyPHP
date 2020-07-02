/**
 * Created by PhpStorm.
 * Script Name: common.js
 * Create: 2020/3/19 16:14
 * Description: 工具类文件
 * Author: fudaoji<fdj@kuryun.cn>
 */

let Utils = {
    //网络请求
    request : function (options) {
        // 1.创建axios的实例
        const instance = axios.create({
            baseURL: window.location.origin,
            timeout: 5000,
        });

        const opt = {
            url: '',
            method: 'post',
            data: {},
            headers: {
                'Content-Type': 'application/json; charset=utf-8'
            }
        };
        options = Object.assign(opt, options);

        //请求拦截器
        instance.interceptors.request.use(options => {
            if (!options.url) {
                alert('请填写url');
                return false;
            }
            return options
        }, err => {
            return Promise.reject(err)
        });

        //响应拦截器
        instance.interceptors.response.use(res => {
            return res.data;
        }, err => {
            return Promise.reject(err)
        });

        //发送网络请求
        return instance(options)
    },

    toast: function (options) {
        let duration = 1500;
        let instance = options.driver.success;
        if(options.type === 'fail'){
            duration = 2000;
            instance = options.driver.fail;
        }
        instance({message: options.msg, duration: duration});
        if(options.callback){
            setTimeout(options.callback, duration);
        }
    }
};

