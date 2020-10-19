# [KyPHP](http://kyphp.kuryun.com/)

#### 介绍
基于微信开放平台打造的微信营销SaaS平台，应用载体主要是微信公众号和微信小程序。

体验链接（请在PC端打开）：
[http://kyphp.fdj.kuryun.cn/](http://kyphp.fdj.kuryun.cn/)（账号：admin， 密码：123456）


主要功能：
- 用户角色控制
    - 设置不同权限的角色会员，权限维度有菜单权限以及公众号（小程序）创建个数；
    - 运营者可以借助此功能设置丰富多样的会员套餐；

- 微信公众号：
    - 接入：支持手动接入和授权接入
    - 自定义菜单
    - 回复设置
    - 微信支付
    - 素材管理
    - 粉丝管理
    - 数据分析
    - 消息管理

- 微信小程序接入：
    - 接入：授权接入
    - 消息管理
    - 功能设置
    - 用户管理
    - 版本管理（代码上传、审核、发布、回滚）

- 应用市场
    - 分类：从两个纬度区分，分别是行业分类和操作载体（小程序和公众号）
    - 开发者可以通过开发者官方市场采购应用
    - 从官方市场采购而来的应用可以在自己的平台搭建应用市场，服务B端客户
    - 开发者也可以将自己的应用上架到官方应用市场进行售卖，从而实现技术变现

- 灵活的应用套餐以及会员套餐设置，借此可以搭建各行业的SaaS平台

- 界面截图：
![输入图片说明](https://images.gitee.com/uploads/images/2020/0707/231336_93a195b5_15303.png "屏幕截图.png")
![输入图片说明](https://images.gitee.com/uploads/images/2020/0707/231356_b5a2dfba_15303.png "屏幕截图.png")
![输入图片说明](https://images.gitee.com/uploads/images/2020/0707/231423_e421b332_15303.png "屏幕截图.png")
![输入图片说明](https://images.gitee.com/uploads/images/2020/0707/231446_603dbf0b_15303.png "屏幕截图.png")
![输入图片说明](https://images.gitee.com/uploads/images/2020/0707/231504_9cfdce11_15303.png "屏幕截图.png")
![输入图片说明](https://images.gitee.com/uploads/images/2020/0707/231524_c897b425_15303.png "屏幕截图.png")
#### 软件架构
- [ThinkPHP5.1](https://www.kancloud.cn/manual/thinkphp5_1/)
- [EasyWeChat](https://www.easywechat.com/)
- Mysql
- Memcached & Redis
- [Layui](https://www.layui.com/)
- [Vue.js](https://cn.vuejs.org/)

#### 安装教程

1.  拉取项目
2.  在项目根目录下`cp env .env`, 修改.env对应的配置信息
3.  将项目目录下的install.sql导入数据库
4.  修改项目目录、runtime、public/uploads、addons、data 的读写权限
5.  根目录下执行 `composer update`
6.  默认超管账号：admin 密码：123456

#### 使用文档

时间不够，慢慢会推出使用文档

#### 参与贡献

1.  Fork 本仓库
2.  新建 dev 分支
3.  提交代码
4.  新建 Pull Request

#### 交流
QQ交流群：

![输入图片说明](https://zyx.images.huihuiba.net/1-5f8afb8796b2f.png "KyPHP微信开发框架QQ群聊二维码.png")

