/*
 Navicat MySQL Data Transfer

 Source Server         : dev
 Source Server Type    : MySQL
 Source Server Version : 50620
 Source Host           : 10.105.19.27
 Source Database       : kyphp

 Target Server Type    : MySQL
 Target Server Version : 50620
 File Encoding         : utf-8

 Date: 07/21/2020 22:33:48 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `ky_addons`
-- ----------------------------
DROP TABLE IF EXISTS `ky_addons`;
CREATE TABLE `ky_addons` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(50) NOT NULL COMMENT '插件名称',
  `addon` varchar(50) NOT NULL COMMENT '标识名',
  `desc` text COMMENT '描述',
  `version` varchar(10) NOT NULL COMMENT '版本号',
  `author` varchar(50) NOT NULL COMMENT '作者姓名',
  `logo` varchar(255) NOT NULL DEFAULT '' COMMENT 'LOGO',
  `config` text COMMENT '插件配置',
  `entry_url` varchar(160) NOT NULL COMMENT '前端入口',
  `admin_url` varchar(160) NOT NULL DEFAULT '' COMMENT '后台入口',
  `menu_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否在菜单显示1：显示 0：隐藏',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `type` enum('mp','mini') NOT NULL DEFAULT 'mp' COMMENT '应用类型',
  PRIMARY KEY (`id`),
  UNIQUE KEY `addon` (`addon`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='应用表';

-- ----------------------------
--  Records of `ky_addons`
-- ----------------------------
BEGIN;
INSERT INTO `ky_addons` VALUES ('10', '应用demo', 'demo', '这是一款应用demo，基础的文章功能', '1.0', '苟哥', '/addons/demo/logo.png', '[{\"name\":\"title\",\"title\":\"\\u535a\\u5ba2\\u540d\\u79f0\",\"type\":\"text\",\"value\":\"\",\"placeholder\":\"\\u4e0d\\u8d85\\u8fc710\\u4e2a\\u5b57\",\"tip\":\"\",\"extra_attr\":\"required\"},{\"name\":\"wx_auth_open\",\"title\":\"\\u5f00\\u542f\\u7f51\\u9875\\u6388\\u6743\",\"type\":\"radio\",\"options\":[\"\\u5173\\u95ed\",\"\\u5f00\\u542f\"],\"placeholder\":\"\",\"tip\":\"\",\"extra_attr\":\"required\"}]', 'demo/index/index', '', '1', '1', '1593686667', '1593686667', 'mp');
COMMIT;

-- ----------------------------
--  Table structure for `ky_addons_cate`
-- ----------------------------
DROP TABLE IF EXISTS `ky_addons_cate`;
CREATE TABLE `ky_addons_cate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序，数字越小越靠前',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='应用分类表';

-- ----------------------------
--  Records of `ky_addons_cate`
-- ----------------------------
BEGIN;
INSERT INTO `ky_addons_cate` VALUES ('1', '涨粉', '2', '1594997635', '1594998035', '1'), ('2', '营销', '3', '1594997967', '1594998035', '1'), ('3', '商城', '0', '1594997977', '1594998035', '1'), ('4', '游戏', '10', '1594997996', '1594998035', '1'), ('5', '节日', '5', '1594998006', '1594998035', '1');
COMMIT;

-- ----------------------------
--  Table structure for `ky_addons_info`
-- ----------------------------
DROP TABLE IF EXISTS `ky_addons_info`;
CREATE TABLE `ky_addons_info` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '应用ID',
  `detail` mediumtext COMMENT '应用介绍',
  `sale_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '实际销量',
  `sale_num_show` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '虚拟销量',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '售价',
  `old_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '原价',
  `cates` text COMMENT '标签',
  `snapshot` text COMMENT ' 快照',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='应用详细信息';

-- ----------------------------
--  Records of `ky_addons_info`
-- ----------------------------
BEGIN;
INSERT INTO `ky_addons_info` VALUES ('10', '<p>应用介绍</p><p>adfadf</p><p>到发疯</p><p>阿道夫<img src=\"http://devhhb.images.huihuiba.net/1-5ed603542b0f4.jpg\" alt=\"1-5ed603542b0f4.jpg\"/></p>', '4', '112', '0.01', '0.00', '涨粉,营销,商城', 'http://devhhb.images.huihuiba.net/1-5f1582f10db72.jpg,http://devhhb.images.huihuiba.net/1-5f1582f0b24e6.jpg');
COMMIT;

-- ----------------------------
--  Table structure for `ky_admin`
-- ----------------------------
DROP TABLE IF EXISTS `ky_admin`;
CREATE TABLE `ky_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '账号',
  `password` char(60) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '密码',
  `email` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '邮箱',
  `mobile` varchar(15) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '手机号',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '新增时间',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `group_id` tinyint(2) NOT NULL DEFAULT '1' COMMENT '所属角色',
  `realname` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '真实姓名',
  `last_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `ip` varchar(16) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '登录IP',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `ky_admin`
-- ----------------------------
BEGIN;
INSERT INTO `ky_admin` VALUES ('1', 'admin', '$2y$10$fjDgmWJXFml9Flb3fuygA.EUjVl1hqoMoU8Dwn8J.tn8p1x/X8tXu', '461960962@qq.com', '15659827559', '0', '1595340550', '1', '1', '傅道集', '1595340550', '211.97.128.54', '0'), ('2', 'test1', '$2y$10$lSnmo7isc6Y7X1trZ/YeH.WirmUAC3TG8JpEkloRODCO1nHXYFnFm', '', '15659827559', '1590227330', '1595341851', '1', '2', '张三', '1595341851', '211.97.128.54', '1'), ('3', 'test2', '$2y$10$VI/NBVVik3YRAjnrZIgAQeKZ2rKJtY01mGnRwLQ1Saoy956vwOVXC', '', '', '1594977794', '1594977794', '1', '2', '', '1594977794', '106.122.215.27', '0'), ('4', 'test3', '$2y$10$//5v/B9XdvlS5pIgEjZ2Juw9I.RN82BLE652b50evmjxIwFzYv.U6', '', '', '1594978590', '1594978876', '1', '2', 'test3', '1594978876', '106.122.215.27', '0');
COMMIT;

-- ----------------------------
--  Table structure for `ky_admin_addon`
-- ----------------------------
DROP TABLE IF EXISTS `ky_admin_addon`;
CREATE TABLE `ky_admin_addon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `addon` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '应用标识',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '到期时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`,`addon`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户-应用关联表';

-- ----------------------------
--  Records of `ky_admin_addon`
-- ----------------------------
BEGIN;
INSERT INTO `ky_admin_addon` VALUES ('1', '2', 'demo', '1595692800', '1', '1594814243', '1594816271'), ('3', '1', 'demo', '1689914356', '1', '1594817469', '1595312686');
COMMIT;

-- ----------------------------
--  Table structure for `ky_admin_group`
-- ----------------------------
DROP TABLE IF EXISTS `ky_admin_group`;
CREATE TABLE `ky_admin_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户组名称',
  `store_config` text COLLATE utf8mb4_unicode_ci COMMENT '店铺个数设置',
  `menu_config` text COLLATE utf8mb4_unicode_ci COMMENT '菜单权限',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '数字越小越靠前',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户权限组';

-- ----------------------------
--  Records of `ky_admin_group`
-- ----------------------------
BEGIN;
INSERT INTO `ky_admin_group` VALUES ('1', '管理员', '{\"mp_limit\":\"0\",\"mini_limit\":\"0\"}', '1,13,14,15,47,17,18,16,68,19,20,43,80,21,22,72,52,84,53,2,25,83,26,51,45,56,74,73,77,67,69,81,57', '1', '0', '1594302168', '1594302168'), ('2', '游客', '{\"mp_limit\":\"1\",\"mini_limit\":\"1\"}', '1,13,14,15,47,17,18,16,68,19,20,43,61,64,46,62,63,80,21,22,72,93,94,100,101,52,84', '1', '0', '1594303678', '1595341786'), ('3', ' 青铜会员', '{\"mp_limit\":\"0\",\"mini_limit\":\"0\"}', '1,13,14,15,47,17,18,16,68,19,20,43,96,61,64,46,62,63,80,21,22,72,93,94,52,84', '1', '0', '1595340975', '1595340975');
COMMIT;

-- ----------------------------
--  Table structure for `ky_admin_store`
-- ----------------------------
DROP TABLE IF EXISTS `ky_admin_store`;
CREATE TABLE `ky_admin_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '也是其他平台的id',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `type` enum('mp','mini','pc','app') NOT NULL DEFAULT 'mp' COMMENT '平台类型',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='用户店铺';

-- ----------------------------
--  Records of `ky_admin_store`
-- ----------------------------
BEGIN;
INSERT INTO `ky_admin_store` VALUES ('1', '1', 'mp', '1', '0', '0'), ('2', '2', 'mp', '0', '1590592849', '1590593695'), ('3', '1', 'mp', '0', '0', '0');
COMMIT;

-- ----------------------------
--  Table structure for `ky_demo_article`
-- ----------------------------
DROP TABLE IF EXISTS `ky_demo_article`;
CREATE TABLE `ky_demo_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `content` text COMMENT '内容',
  `view_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '查看量',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='应用demo';

-- ----------------------------
--  Records of `ky_demo_article`
-- ----------------------------
BEGIN;
INSERT INTO `ky_demo_article` VALUES ('1', '文章1', '打发斯蒂芬', '是打发撒的发生的发打算', '1', '1', '1593686937', '1593686969');
COMMIT;

-- ----------------------------
--  Table structure for `ky_demo_order`
-- ----------------------------
DROP TABLE IF EXISTS `ky_demo_order`;
CREATE TABLE `ky_demo_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `order_no` varchar(32) NOT NULL DEFAULT '' COMMENT '平台交易单号',
  `mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商家公众号id',
  `openid` varchar(64) NOT NULL DEFAULT '' COMMENT '公众号粉丝openid',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户姓名',
  `mobile` varchar(15) NOT NULL DEFAULT '',
  `headimgurl` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `subject` varchar(250) NOT NULL DEFAULT '' COMMENT '购买主题',
  `body` text NOT NULL COMMENT '购买详情',
  `total` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单总额（单位：分）',
  `amount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '实际支付总金额',
  `client_ip` char(15) NOT NULL DEFAULT '127.0.0.1' COMMENT '客户端ip',
  `paid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1:支付成功 0：待支付  -1：支付失败；2：已退款',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态1有效 0废弃',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `transaction_id` varchar(64) NOT NULL DEFAULT '' COMMENT '微信平台订单号',
  `extend_info` text COMMENT '其他信息',
  `remark` varchar(120) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_order_no` (`order_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `ky_media_image_1`
-- ----------------------------
DROP TABLE IF EXISTS `ky_media_image_1`;
CREATE TABLE `ky_media_image_1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文本内容',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '图片url',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `media_id` varchar(100) NOT NULL DEFAULT '' COMMENT '微信素材库中的id',
  `size` int(10) NOT NULL DEFAULT '0' COMMENT '文件大小（用于判断上传的图片是否小于微信素材库的限制2M）',
  `ext` enum('bmp','jpg','jpeg','png','gif') NOT NULL DEFAULT 'jpg' COMMENT '图片格式',
  `location` varchar(50) NOT NULL DEFAULT '' COMMENT '位置Local，Qiniu',
  PRIMARY KEY (`id`),
  KEY `media_id` (`media_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `ky_media_image_2`
-- ----------------------------
DROP TABLE IF EXISTS `ky_media_image_2`;
CREATE TABLE `ky_media_image_2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文本内容',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '图片url',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `media_id` varchar(100) NOT NULL DEFAULT '' COMMENT '微信素材库中的id',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小（用于判断上传的图片是否小于微信素材库的限制2M）',
  `ext` enum('bmp','jpg','jpeg','png','gif') NOT NULL DEFAULT 'jpg' COMMENT '图片格式',
  `location` varchar(50) NOT NULL DEFAULT '' COMMENT '位置Local，Qiniu',
  PRIMARY KEY (`id`),
  KEY `media_id` (`media_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `ky_media_image_2`
-- ----------------------------
BEGIN;
INSERT INTO `ky_media_image_2` VALUES ('1', '1', '3', 'fdj-sm.jpg', 'http://devhhb.images.huihuiba.net/1-5ed5f6b7e9d06.jpg', '1591080632', '1591080632', '1', '', '107027', 'jpg', ''), ('5', '1', '3', 'tomcat.png', 'http://devhhb.images.huihuiba.net/1-5ed601c39157b.png', '1591083460', '1591083460', '1', 'ZOzBoX0K4goJhq2CjCXt8u29sqn4ytxq4Rb3YEA6MOg', '5103', 'png', ''), ('6', '1', '3', '1212.jpg', 'http://devhhb.images.huihuiba.net/1-5ed603542b0f4.jpg', '1591083861', '1591083861', '1', 'ZOzBoX0K4goJhq2CjCXt8rnE0z02H4jcA9Kw618DmoE', '33185', 'jpg', ''), ('8', '1', '1', '11.jpg', 'http://devhhb.images.huihuiba.net/1-5ed91d9b11916.jpg', '1591287196', '1591287196', '1', 'JW8XS34h_ISSqHFm_g1WsSkOYPPrDPD6w8LZtha8VF4', '15687', 'jpg', 'Qiniu'), ('11', '1', '3', '3.jpg', 'http://devhhb.images.huihuiba.net/1-5ed9ef3be7526.jpg', '1591340860', '1591340860', '1', '', '11583', 'jpg', 'Qiniu'), ('12', '1', '3', '18.jpg', 'http://devhhb.images.huihuiba.net/1-5ed9ef72329c0.jpg', '1591340914', '1591340915', '1', 'ZOzBoX0K4goJhq2CjCXt8jInOO11NuqcWYOg4A4Gv5Q', '21920', 'jpg', 'Qiniu'), ('13', '1', '3', 'p1.png', 'http://devhhb.images.huihuiba.net/1-5eda5e430bdff.png', '1591369287', '1591369287', '1', '', '629161', 'png', 'Qiniu'), ('14', '1', '3', 'p2.png', 'http://devhhb.images.huihuiba.net/1-5eda5e4754030.png', '1591369293', '1591369293', '1', '', '755358', 'png', 'Qiniu'), ('15', '1', '3', 'IMG_0718.JPG', 'http://devhhb.images.huihuiba.net/1-5eda64b151478.JPG', '1591370931', '1591370984', '1', 'ZOzBoX0K4goJhq2CjCXt8sGRiIUyzt2fMcw0YXvL564', '367667', 'jpg', 'Qiniu'), ('16', '1', '1', 'logo.png', 'http://devhhb.images.huihuiba.net/1-5f1011aad2d7e.png', '1594888619', '1594888619', '1', '', '7591', 'png', 'Qiniu'), ('17', '1', '1', 'IMG_1471.JPG', 'http://devhhb.images.huihuiba.net/1-5f13120e0b7c1.JPG', '1595085338', '1595085338', '1', '', '1735226', 'jpg', 'Qiniu'), ('18', '1', '1', 'mp_test.jpg', 'http://devhhb.images.huihuiba.net/1-5f156f510f649.jpg', '1595240273', '1595240273', '1', '', '24614', 'jpg', 'Qiniu'), ('19', '1', '1', '分享小程序.jpg', 'http://devhhb.images.huihuiba.net/1-5f1582f0b24e6.jpg', '1595245297', '1595245297', '1', '', '69368', 'jpg', 'Qiniu'), ('20', '1', '1', '地图找机构.jpg', 'http://devhhb.images.huihuiba.net/1-5f1582f10db72.jpg', '1595245297', '1595245297', '1', '', '157559', 'jpg', 'Qiniu');
COMMIT;

-- ----------------------------
--  Table structure for `ky_media_image_3`
-- ----------------------------
DROP TABLE IF EXISTS `ky_media_image_3`;
CREATE TABLE `ky_media_image_3` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文本内容',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '图片url',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `media_id` varchar(100) NOT NULL DEFAULT '' COMMENT '微信素材库中的id',
  `size` int(10) NOT NULL DEFAULT '0' COMMENT '文件大小（用于判断上传的图片是否小于微信素材库的限制2M）',
  `ext` enum('bmp','jpg','jpeg','png','gif') NOT NULL DEFAULT 'jpg' COMMENT '图片格式',
  `location` varchar(50) NOT NULL DEFAULT '' COMMENT '位置Local，Qiniu',
  PRIMARY KEY (`id`),
  KEY `media_id` (`media_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `ky_media_image_4`
-- ----------------------------
DROP TABLE IF EXISTS `ky_media_image_4`;
CREATE TABLE `ky_media_image_4` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文本内容',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '图片url',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `media_id` varchar(100) NOT NULL DEFAULT '' COMMENT '微信素材库中的id',
  `size` int(10) NOT NULL DEFAULT '0' COMMENT '文件大小（用于判断上传的图片是否小于微信素材库的限制2M）',
  `ext` enum('bmp','jpg','jpeg','png','gif') NOT NULL DEFAULT 'jpg' COMMENT '图片格式',
  `location` varchar(50) NOT NULL DEFAULT '' COMMENT '位置Local，Qiniu',
  PRIMARY KEY (`id`),
  KEY `media_id` (`media_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `ky_media_image_5`
-- ----------------------------
DROP TABLE IF EXISTS `ky_media_image_5`;
CREATE TABLE `ky_media_image_5` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文本内容',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '图片url',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `media_id` varchar(100) NOT NULL DEFAULT '' COMMENT '微信素材库中的id',
  `size` int(10) NOT NULL DEFAULT '0' COMMENT '文件大小（用于判断上传的图片是否小于微信素材库的限制2M）',
  `ext` enum('bmp','jpg','jpeg','png','gif') NOT NULL DEFAULT 'jpg' COMMENT '图片格式',
  `location` varchar(50) NOT NULL DEFAULT '' COMMENT '位置Local，Qiniu',
  PRIMARY KEY (`id`),
  KEY `media_id` (`media_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `ky_media_music_1`
-- ----------------------------
DROP TABLE IF EXISTS `ky_media_music_1`;
CREATE TABLE `ky_media_music_1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名称',
  `desc` varchar(200) NOT NULL DEFAULT '' COMMENT '简介',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '文件url',
  `hq_url` varchar(200) NOT NULL DEFAULT '' COMMENT '高品质链接',
  `thumb_media_id` varchar(100) NOT NULL DEFAULT '' COMMENT '微信素材库中的id',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `id_uid` (`id`,`uid`) USING BTREE,
  KEY `id_uid_mpid` (`id`,`uid`,`mpid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='语音素材';

-- ----------------------------
--  Table structure for `ky_media_music_2`
-- ----------------------------
DROP TABLE IF EXISTS `ky_media_music_2`;
CREATE TABLE `ky_media_music_2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名称',
  `desc` varchar(200) NOT NULL DEFAULT '' COMMENT '简介',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '文件url',
  `hq_url` varchar(200) NOT NULL DEFAULT '' COMMENT '高品质链接',
  `thumb_media_id` varchar(100) NOT NULL DEFAULT '' COMMENT '微信素材库中的id',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `id_uid` (`id`,`uid`) USING BTREE,
  KEY `id_uid_mpid` (`id`,`uid`,`mpid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='语音素材';

-- ----------------------------
--  Records of `ky_media_music_2`
-- ----------------------------
BEGIN;
INSERT INTO `ky_media_music_2` VALUES ('2', '1', '3', '音乐1', '音乐描述', 'http://devhhb.images.huihuiba.net/1-5eda125e86564.mp3', 'http://devhhb.images.huihuiba.net/1-5eda125e86564.mp3', '', '1591438777', '1591438777', '1'), ('3', '1', '3', '测试', '描述啊', 'http://devhhb.images.huihuiba.net/1-5eda049e9f1fc.mp3', '', '', '1591452563', '1591452563', '1'), ('4', '1', '3', '音乐2', '活动总动员', 'http://devhhb.images.huihuiba.net/1-5eda6c0655458.mp3', '', '', '1591453031', '1591453031', '1'), ('5', '1', '3', '音乐3', '2323', 'http://devhhb.images.huihuiba.net/1-5edba6680e992.mp3', '', '', '1591453333', '1591453333', '1'), ('6', '1', '1', '音乐1', '描述', 'http://devhhb.images.huihuiba.net/1-5edefa098fed9.mp3', '', '', '1591671475', '1591671475', '1');
COMMIT;

-- ----------------------------
--  Table structure for `ky_media_music_3`
-- ----------------------------
DROP TABLE IF EXISTS `ky_media_music_3`;
CREATE TABLE `ky_media_music_3` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名称',
  `desc` varchar(200) NOT NULL DEFAULT '' COMMENT '简介',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '文件url',
  `hq_url` varchar(200) NOT NULL DEFAULT '' COMMENT '高品质链接',
  `thumb_media_id` varchar(100) NOT NULL DEFAULT '' COMMENT '微信素材库中的id',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `id_uid` (`id`,`uid`) USING BTREE,
  KEY `id_uid_mpid` (`id`,`uid`,`mpid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='语音素材';

-- ----------------------------
--  Table structure for `ky_media_music_4`
-- ----------------------------
DROP TABLE IF EXISTS `ky_media_music_4`;
CREATE TABLE `ky_media_music_4` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名称',
  `desc` varchar(200) NOT NULL DEFAULT '' COMMENT '简介',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '文件url',
  `hq_url` varchar(200) NOT NULL DEFAULT '' COMMENT '高品质链接',
  `thumb_media_id` varchar(100) NOT NULL DEFAULT '' COMMENT '微信素材库中的id',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `id_uid` (`id`,`uid`) USING BTREE,
  KEY `id_uid_mpid` (`id`,`uid`,`mpid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='语音素材';

-- ----------------------------
--  Table structure for `ky_media_music_5`
-- ----------------------------
DROP TABLE IF EXISTS `ky_media_music_5`;
CREATE TABLE `ky_media_music_5` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名称',
  `desc` varchar(200) NOT NULL DEFAULT '' COMMENT '简介',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '文件url',
  `hq_url` varchar(200) NOT NULL DEFAULT '' COMMENT '高品质链接',
  `thumb_media_id` varchar(100) NOT NULL DEFAULT '' COMMENT '微信素材库中的id',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `id_uid` (`id`,`uid`) USING BTREE,
  KEY `id_uid_mpid` (`id`,`uid`,`mpid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='语音素材';

-- ----------------------------
--  Table structure for `ky_media_text_1`
-- ----------------------------
DROP TABLE IF EXISTS `ky_media_text_1`;
CREATE TABLE `ky_media_text_1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文本内容',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='文本素材';

-- ----------------------------
--  Table structure for `ky_media_text_2`
-- ----------------------------
DROP TABLE IF EXISTS `ky_media_text_2`;
CREATE TABLE `ky_media_text_2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文本内容',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='文本素材';

-- ----------------------------
--  Records of `ky_media_text_2`
-- ----------------------------
BEGIN;
INSERT INTO `ky_media_text_2` VALUES ('5', '1', '我是一段普通文本', '1591062430', '1591062430', '1'), ('7', '1', '测试', '1591062567', '1591062567', '1'), ('8', '1', '啊啊啊', '1591062606', '1591062606', '1'), ('10', '1', '测试文本', '1591063189', '1591063189', '1'), ('13', '1', '<a href=\"http://www.huihuiba.net/weixin\">加入汇汇吧</a>', '1591063451', '1591063451', '1'), ('14', '1', '这是一段对语音的回复', '1591624178', '1591624178', '1'), ('15', '1', '暂时无法回答你哦', '1591628258', '1591628258', '1');
COMMIT;

-- ----------------------------
--  Table structure for `ky_media_text_3`
-- ----------------------------
DROP TABLE IF EXISTS `ky_media_text_3`;
CREATE TABLE `ky_media_text_3` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文本内容',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='文本素材';

-- ----------------------------
--  Table structure for `ky_media_text_4`
-- ----------------------------
DROP TABLE IF EXISTS `ky_media_text_4`;
CREATE TABLE `ky_media_text_4` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文本内容',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='文本素材';

-- ----------------------------
--  Table structure for `ky_media_text_5`
-- ----------------------------
DROP TABLE IF EXISTS `ky_media_text_5`;
CREATE TABLE `ky_media_text_5` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文本内容',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='文本素材';

-- ----------------------------
--  Table structure for `ky_media_video_1`
-- ----------------------------
DROP TABLE IF EXISTS `ky_media_video_1`;
CREATE TABLE `ky_media_video_1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名称',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '文件url',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `media_id` varchar(100) NOT NULL DEFAULT '' COMMENT '微信素材库中的id',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小（单位B）',
  `ext` enum('mp4') NOT NULL DEFAULT 'mp4' COMMENT '文件格式',
  `location` varchar(50) NOT NULL DEFAULT '' COMMENT '位置Local，Qiniu',
  `desc` varchar(200) NOT NULL DEFAULT '' COMMENT '简介',
  `cover` varchar(200) NOT NULL DEFAULT '' COMMENT '封面',
  PRIMARY KEY (`id`),
  KEY `media_id` (`media_id`) USING BTREE,
  KEY `id_uid` (`id`,`uid`) USING BTREE,
  KEY `id_uid_mpid` (`id`,`uid`,`mpid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='语音素材';

-- ----------------------------
--  Table structure for `ky_media_video_2`
-- ----------------------------
DROP TABLE IF EXISTS `ky_media_video_2`;
CREATE TABLE `ky_media_video_2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名称',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '文件url',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `media_id` varchar(100) NOT NULL DEFAULT '' COMMENT '微信素材库中的id',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小（单位B）',
  `ext` enum('mp4') NOT NULL DEFAULT 'mp4' COMMENT '文件格式',
  `location` varchar(50) NOT NULL DEFAULT '' COMMENT '位置Local，Qiniu',
  `desc` varchar(200) NOT NULL DEFAULT '' COMMENT '简介',
  `cover` varchar(200) NOT NULL DEFAULT '' COMMENT '封面',
  PRIMARY KEY (`id`),
  KEY `media_id` (`media_id`) USING BTREE,
  KEY `id_uid` (`id`,`uid`) USING BTREE,
  KEY `id_uid_mpid` (`id`,`uid`,`mpid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='语音素材';

-- ----------------------------
--  Records of `ky_media_video_2`
-- ----------------------------
BEGIN;
INSERT INTO `ky_media_video_2` VALUES ('1', '1', '3', 'test.mp4', 'http://devhhb.images.huihuiba.net/1-5eda5594cb117.mp4', '1591367062', '1591457874', '1', 'ZOzBoX0K4goJhq2CjCXt8tNogKn49PcWU81kOnAXVTs', '318465', 'mp4', 'Qiniu', '', ''), ('2', '1', '3', 'CNAS4517.mp4', 'http://devhhb.images.huihuiba.net/1-5eda5f98a0f9e.mp4', '1591369636', '1591369636', '1', '', '1579529', 'mp4', 'Qiniu', '', ''), ('3', '1', '3', 'CQKW7923.mp4', 'http://devhhb.images.huihuiba.net/1-5eda5fe9ebd35.mp4', '1591369718', '1591370085', '1', 'ZOzBoX0K4goJhq2CjCXt8jV4XLHZXfBYccO8oAsStv8', '1617795', 'mp4', 'Qiniu', '', ''), ('4', '1', '1', 'shoes.mp4', 'http://devhhb.images.huihuiba.net/1-5ede13cc96f94.mp4', '1591612373', '1591612634', '1', 'JW8XS34h_ISSqHFm_g1WsSLp9WAdOkH-Kpe9m-UCR2g', '1259428', 'mp4', 'Qiniu', '', '');
COMMIT;

-- ----------------------------
--  Table structure for `ky_media_video_3`
-- ----------------------------
DROP TABLE IF EXISTS `ky_media_video_3`;
CREATE TABLE `ky_media_video_3` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名称',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '文件url',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `media_id` varchar(100) NOT NULL DEFAULT '' COMMENT '微信素材库中的id',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小（单位B）',
  `ext` enum('mp4') NOT NULL DEFAULT 'mp4' COMMENT '文件格式',
  `location` varchar(50) NOT NULL DEFAULT '' COMMENT '位置Local，Qiniu',
  `desc` varchar(200) NOT NULL DEFAULT '' COMMENT '简介',
  `cover` varchar(200) NOT NULL DEFAULT '' COMMENT '封面',
  PRIMARY KEY (`id`),
  KEY `media_id` (`media_id`) USING BTREE,
  KEY `id_uid` (`id`,`uid`) USING BTREE,
  KEY `id_uid_mpid` (`id`,`uid`,`mpid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='语音素材';

-- ----------------------------
--  Table structure for `ky_media_video_4`
-- ----------------------------
DROP TABLE IF EXISTS `ky_media_video_4`;
CREATE TABLE `ky_media_video_4` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名称',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '文件url',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `media_id` varchar(100) NOT NULL DEFAULT '' COMMENT '微信素材库中的id',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小（单位B）',
  `ext` enum('mp4') NOT NULL DEFAULT 'mp4' COMMENT '文件格式',
  `location` varchar(50) NOT NULL DEFAULT '' COMMENT '位置Local，Qiniu',
  `desc` varchar(200) NOT NULL DEFAULT '' COMMENT '简介',
  `cover` varchar(200) NOT NULL DEFAULT '' COMMENT '封面',
  PRIMARY KEY (`id`),
  KEY `media_id` (`media_id`) USING BTREE,
  KEY `id_uid` (`id`,`uid`) USING BTREE,
  KEY `id_uid_mpid` (`id`,`uid`,`mpid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='语音素材';

-- ----------------------------
--  Table structure for `ky_media_video_5`
-- ----------------------------
DROP TABLE IF EXISTS `ky_media_video_5`;
CREATE TABLE `ky_media_video_5` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名称',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '文件url',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `media_id` varchar(100) NOT NULL DEFAULT '' COMMENT '微信素材库中的id',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小（单位B）',
  `ext` enum('mp4') NOT NULL DEFAULT 'mp4' COMMENT '文件格式',
  `location` varchar(50) NOT NULL DEFAULT '' COMMENT '位置Local，Qiniu',
  `desc` varchar(200) NOT NULL DEFAULT '' COMMENT '简介',
  `cover` varchar(200) NOT NULL DEFAULT '' COMMENT '封面',
  PRIMARY KEY (`id`),
  KEY `media_id` (`media_id`) USING BTREE,
  KEY `id_uid` (`id`,`uid`) USING BTREE,
  KEY `id_uid_mpid` (`id`,`uid`,`mpid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='语音素材';

-- ----------------------------
--  Table structure for `ky_media_voice_1`
-- ----------------------------
DROP TABLE IF EXISTS `ky_media_voice_1`;
CREATE TABLE `ky_media_voice_1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名称',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '文件url',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `media_id` varchar(100) NOT NULL DEFAULT '' COMMENT '微信素材库中的id',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小（单位B）',
  `ext` enum('mp3','wma','wav','amr') NOT NULL DEFAULT 'mp3' COMMENT '文件格式',
  `location` varchar(50) NOT NULL DEFAULT '' COMMENT '位置Local，Qiniu',
  PRIMARY KEY (`id`),
  KEY `media_id` (`media_id`) USING BTREE,
  KEY `id_uid` (`id`,`uid`) USING BTREE,
  KEY `id_uid_mpid` (`id`,`uid`,`mpid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='语音素材';

-- ----------------------------
--  Table structure for `ky_media_voice_2`
-- ----------------------------
DROP TABLE IF EXISTS `ky_media_voice_2`;
CREATE TABLE `ky_media_voice_2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名称',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '文件url',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `media_id` varchar(100) NOT NULL DEFAULT '' COMMENT '微信素材库中的id',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小（单位B）',
  `ext` enum('mp3','wma','wav','amr') NOT NULL DEFAULT 'mp3' COMMENT '文件格式',
  `location` varchar(50) NOT NULL DEFAULT '' COMMENT '位置Local，Qiniu',
  PRIMARY KEY (`id`),
  KEY `media_id` (`media_id`) USING BTREE,
  KEY `id_uid` (`id`,`uid`) USING BTREE,
  KEY `id_uid_mpid` (`id`,`uid`,`mpid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='语音素材';

-- ----------------------------
--  Records of `ky_media_voice_2`
-- ----------------------------
BEGIN;
INSERT INTO `ky_media_voice_2` VALUES ('1', '1', '3', '纯音乐-抽奖音乐.mp3', 'http://devhhb.images.huihuiba.net/1-5eda049e9f1fc.mp3', '1591346346', '1591349222', '1', 'ZOzBoX0K4goJhq2CjCXt8vWpJY93HrxfTEST_cvTEfI', '1571235', 'mp3', 'Qiniu'), ('2', '1', '3', 'lft.mp3', 'http://devhhb.images.huihuiba.net/1-5eda125e86564.mp3', '1591349862', '1591349921', '1', 'ZOzBoX0K4goJhq2CjCXt8kU2KW1IlNA1ZkYkuDFXN5E', '1092216', 'mp3', 'Qiniu'), ('3', '1', '3', '1.mp3', 'http://devhhb.images.huihuiba.net/1-5eda6c0655458.mp3', '1591372809', '1591372809', '1', '', '535872', 'mp3', 'Qiniu'), ('4', '1', '3', '万宝路进行曲.mp3', 'http://devhhb.images.huihuiba.net/1-5edba6680e992.mp3', '1591453292', '1591453292', '1', '', '587467', 'mp3', 'Qiniu'), ('5', '1', '1', 'lft.mp3', 'http://devhhb.images.huihuiba.net/1-5edefa098fed9.mp3', '1591671313', '1591671313', '1', '', '1092216', 'mp3', 'Qiniu');
COMMIT;

-- ----------------------------
--  Table structure for `ky_media_voice_3`
-- ----------------------------
DROP TABLE IF EXISTS `ky_media_voice_3`;
CREATE TABLE `ky_media_voice_3` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名称',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '文件url',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `media_id` varchar(100) NOT NULL DEFAULT '' COMMENT '微信素材库中的id',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小（单位B）',
  `ext` enum('mp3','wma','wav','amr') NOT NULL DEFAULT 'mp3' COMMENT '文件格式',
  `location` varchar(50) NOT NULL DEFAULT '' COMMENT '位置Local，Qiniu',
  PRIMARY KEY (`id`),
  KEY `media_id` (`media_id`) USING BTREE,
  KEY `id_uid` (`id`,`uid`) USING BTREE,
  KEY `id_uid_mpid` (`id`,`uid`,`mpid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='语音素材';

-- ----------------------------
--  Table structure for `ky_media_voice_4`
-- ----------------------------
DROP TABLE IF EXISTS `ky_media_voice_4`;
CREATE TABLE `ky_media_voice_4` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名称',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '文件url',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `media_id` varchar(100) NOT NULL DEFAULT '' COMMENT '微信素材库中的id',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小（单位B）',
  `ext` enum('mp3','wma','wav','amr') NOT NULL DEFAULT 'mp3' COMMENT '文件格式',
  `location` varchar(50) NOT NULL DEFAULT '' COMMENT '位置Local，Qiniu',
  PRIMARY KEY (`id`),
  KEY `media_id` (`media_id`) USING BTREE,
  KEY `id_uid` (`id`,`uid`) USING BTREE,
  KEY `id_uid_mpid` (`id`,`uid`,`mpid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='语音素材';

-- ----------------------------
--  Table structure for `ky_media_voice_5`
-- ----------------------------
DROP TABLE IF EXISTS `ky_media_voice_5`;
CREATE TABLE `ky_media_voice_5` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名称',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '文件url',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `media_id` varchar(100) NOT NULL DEFAULT '' COMMENT '微信素材库中的id',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小（单位B）',
  `ext` enum('mp3','wma','wav','amr') NOT NULL DEFAULT 'mp3' COMMENT '文件格式',
  `location` varchar(50) NOT NULL DEFAULT '' COMMENT '位置Local，Qiniu',
  PRIMARY KEY (`id`),
  KEY `media_id` (`media_id`) USING BTREE,
  KEY `id_uid` (`id`,`uid`) USING BTREE,
  KEY `id_uid_mpid` (`id`,`uid`,`mpid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='语音素材';

-- ----------------------------
--  Table structure for `ky_menu`
-- ----------------------------
DROP TABLE IF EXISTS `ky_menu`;
CREATE TABLE `ky_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `pid` int(5) NOT NULL COMMENT '上级ID',
  `title` varchar(50) NOT NULL COMMENT '菜单名称',
  `url` varchar(180) NOT NULL COMMENT 'Url函数地址',
  `sort` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `icon` varchar(180) DEFAULT '' COMMENT '图标',
  `shows` varchar(5) DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1菜单 2权限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `ky_menu`
-- ----------------------------
BEGIN;
INSERT INTO `ky_menu` VALUES ('1', '0', '平台', 'system/store/manage', '0', '&#xe63a;', '', '1', '0', '1594304136', '1'), ('2', '0', '站点', 'system/admin/index', '10', '&#xe620;', '', '1', '0', '1595313356', '1'), ('13', '1', '增强功能', 'null', '0', 'fa fa-briefcase', '', '1', '0', '1594304136', '1'), ('14', '13', '自动回复', 'mp/reply/index', '0', '', '', '1', '0', '1594304136', '1'), ('15', '13', '自定义菜单', 'mp/menu/index', '1', '', '', '1', '0', '1594304136', '1'), ('16', '13', '功能配置', 'mp/setting/index', '10', '', '', '1', '0', '1594304136', '1'), ('17', '13', '二维码/转化链接 ', 'mp/qrcode/index', '4', '', '', '1', '0', '1594304136', '1'), ('18', '13', '素材管理', 'mp/material/index', '5', '', '', '1', '0', '1594304136', '1'), ('19', '1', '粉丝', 'null', '2', 'fa fa-users', '', '1', '0', '1594304136', '1'), ('20', '19', '粉丝管理', 'mp/follow/index', '0', '', '', '1', '0', '1594304136', '1'), ('21', '80', '公众号', '', '0', 'fa fa-wechat', '', '1', '0', '1594304136', '1'), ('22', '21', '微信公众号', 'system/mp/index', '1', '', '', '1', '0', '1594304136', '1'), ('23', '22', '手动接入', 'system/mp/add', '3', '', '', '1', '0', '1594304136', '2'), ('25', '2', '设置', '', '10', 'fa fa-cogs', '', '1', '0', '1594304136', '1'), ('26', '25', '菜单设置', 'admin/menu/index', '1', '', '', '1', '0', '1594304136', '1'), ('27', '26', '增加菜单', 'admin/menu/add', '2', '', '', '1', '0', '1594304136', '2'), ('28', '22', '编辑公众号', 'system/mp/edit', '5', '', '', '1', '0', '1594304136', '2'), ('29', '22', '管理设置', 'system/mp/info', '3', '', '', '1', '0', '1594304136', '2'), ('30', '17', '增加二维码', 'mp/qrcode/add', '0', '', '', '1', '0', '1594304136', '2'), ('32', '14', '增加关键词', 'mp/reply/add', '0', '', '', '1', '0', '1594304136', '2'), ('41', '14', '特殊消息', 'mp/reply/special', '0', '', '', '1', '0', '1594304136', '2'), ('43', '0', '应用', 'system/store/myapps', '4', '&#xe635;', '', '1', '0', '1594880109', '1'), ('45', '2', '应用管理', 'null', '1', 'fa fa-cubes', '', '1', '0', '1594304136', '1'), ('46', '61', '已过期', 'system/store/overtime', '3', '', null, '1', '0', '1594879970', '1'), ('47', '13', '消息管理', 'mp/msg/index', '1', '', null, '1', '0', '1594304136', '1'), ('48', '47', '回复消息', 'mp/msg/detail', '0', '', null, '1', '0', '1594304136', '2'), ('50', '26', '修改菜单', 'admin/menu/edit', '0', '', null, '1', '0', '1594304136', '2'), ('51', '25', '微信开放平台', 'system/mp/platform', '3', '', null, '1', '0', '1594304136', '1'), ('52', '80', '用户/权限', '', '5', 'fa fa-users', null, '1', '0', '1594304136', '1'), ('53', '67', '注册会员', 'system/admin/index', '0', '', null, '1', '0', '1594978103', '1'), ('54', '53', '更改密码', 'system/admin/updatepwd', '0', '', null, '1', '0', '1594304136', '2'), ('55', '53', '增加成员', 'system/admin/add', '0', '', null, '1', '0', '1594304136', '2'), ('56', '45', '应用管理', 'admin/app/index', '0', '', null, '1', '0', '1595064742', '1'), ('57', '81', '系统公告', 'admin/notice/index', '1', '', null, '1', '0', '1594891025', '1'), ('58', '60', '编辑应用分类', 'admin/addoncate/edit', '3', '', null, '1', '0', '1594997946', '2'), ('59', '60', '新增应用分类', 'admin/addoncate/add', '0', '', null, '1', '0', '1594997911', '2'), ('60', '45', '应用分类', 'admin/addoncate/index', '5', '', null, '1', '0', '1594996961', '1'), ('61', '43', '我的应用', '', '1', 'fa fa-cubes', null, '1', '0', '1594879537', '1'), ('62', '43', '应用市场', '', '4', 'fa fa-cubes', null, '1', '0', '1594879702', '1'), ('63', '62', '应用采购', 'system/store/apps', '0', '', null, '1', '0', '1594879752', '1'), ('64', '61', '正常应用', 'system/store/myapps', '0', '', null, '1', '0', '1594879913', '1'), ('65', '22', '选择接入方式', 'system/mp/choose', '0', '', null, '1', '0', '1594304136', '2'), ('66', '69', '编辑用户组', 'admin/admingroup/edit', '2', '', null, '1', '0', '1594304136', '2'), ('67', '2', '用户管理', 'NULL', '5', 'fa fa-bars', null, '1', '0', '1594304136', '1'), ('68', '1', '数据统计', 'mp/index/index', '0', '', null, '1', '0', '1594304136', '2'), ('69', '67', '用户组', 'admin/admingroup/index', '3', '&#xe68b;', null, '1', '0', '1594304136', '1'), ('70', '69', '新增用户组', 'admin/admingroup/add', '1', '', null, '1', '0', '1594304136', '2'), ('71', '17', '二维码统计', 'mp/qrcode/log', '2', '', null, '1', '0', '1594304136', '2'), ('72', '80', '欢迎回来', 'system/index/index', '0', '', null, '1', '0', '1594304136', '2'), ('73', '74', '应用商店', 'admin/appstore/index', '2', '', null, '1', '0', '1594304136', '1'), ('74', '2', '官方市场', 'NULL', '2', 'fa fa-cart-plus', null, '1', '0', '1594304136', '1'), ('75', '73', '应用中心-注册', 'admin/appstore/register', '0', '', null, '1', '0', '1594304136', '1'), ('76', '73', '用户登录', 'admin/appstore/login', '0', '', null, '1', '0', '1594304136', '1'), ('77', '56', '编辑应用信息', 'admin/app/edit', '3', '', null, '1', '0', '1595084800', '2'), ('80', '0', '系统', 'system/index/index', '5', '', '', '1', '0', '1594304136', '1'), ('81', '2', '消息管理', '', '15', 'fa fa-bullhorn', '', '1', '0', '1594890993', '1'), ('82', '53', '编辑信息', 'system/admin/edit', '3', '', '', '1', '0', '1594304136', '2'), ('83', '25', '站点设置', 'admin/setting/index', '0', '', '', '1', '1590246581', '1594304136', '1'), ('84', '52', '我的账号', 'system/admin/myinfo', '0', '', '', '1', '1590410830', '1594304136', '1'), ('85', '84', '重置密码', 'system/admin/updatemypwd', '1', '', '', '1', '1590411654', '1594304136', '2'), ('86', '57', '发布公告', 'admin/notice/add', '1', 'fa fa-plus', '', '1', '1590593322', '1594893183', '2'), ('87', '22', '授权接入', 'mp/auth/index', '5', '', '', '1', '1590654308', '1594304136', '2'), ('88', '14', ' 编辑关键词', 'mp/reply/edit', '1', '', '', '1', '1591021404', '1594304136', '2'), ('89', '67', '用户应用', 'admin/adminaddon/index', '5', '', '', '1', '1594806392', '1594806392', '1'), ('90', '89', '开通应用', 'admin/adminaddon/add', '0', '', '', '1', '1594812008', '1594812008', '2'), ('91', '89', '编辑用户应用', 'admin/adminaddon/edit', '2', '', '', '1', '1594812032', '1594812032', '2'), ('92', '57', '编辑公告', 'admin/notice/edit', '5', '', '', '1', '1594896676', '1594896676', '2'), ('93', '80', '系统通知', 'system/notice/index', '0', '', '', '1', '1594900050', '1594900050', '2'), ('94', '80', '切换平台', 'system/store/index', '0', '', '', '1', '1594970326', '1594970895', '2'), ('95', '63', '应用下单', 'system/store/appdetail', '0', '', '', '1', '1595247406', '1595247406', '2'), ('96', '43', '订单支付', 'system/payment/orderaddon', '0', '', '', '1', '1595307609', '1595307609', '2'), ('97', '2', '财务管理', '', '0', 'fa fa-money', '', '1', '1595314612', '1595314612', '1'), ('98', '97', '应用订单', 'admin/orderaddon/index', '0', '', '', '1', '1595314675', '1595314675', '1'), ('99', '98', '修改订单', 'admin/orderaddon/edit', '0', '', '', '1', '1595324991', '1595324991', '2'), ('100', '80', '财务管理', '', '0', 'fa fa-money', '', '1', '1595327151', '1595327151', '1'), ('101', '100', '应用订单', 'system/orderaddon/index', '0', '', '', '1', '1595327214', '1595327214', '1');
COMMIT;

-- ----------------------------
--  Table structure for `ky_mp`
-- ----------------------------
DROP TABLE IF EXISTS `ky_mp`;
CREATE TABLE `ky_mp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id,也是用户id',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `appid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '公众号appid',
  `appsecret` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'appsecret,手动接入需要',
  `refresh_token` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '包含手动接入的token和授权的refresh_token',
  `nick_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '授权方昵称',
  `head_img` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '授权方头像',
  `service_type_info` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '授权方公众号类型，0代表订阅号，1代表由历史老帐号升级后的订阅号，2代表服务号',
  `verify_type_info` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '授权方认证类型，-1代表未认证，0代表微信认证，1代表新浪微博认证，2代表腾讯微博认证，3代表已资质认证通过但还未通过名称认证，4代表已资质认证通过、还未通过名称认证，但通过了新浪微博认证，5代表已资质认证通过、还未通过名称认证，但通过了腾讯微博认证',
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '授权方公众号的原始ID',
  `principal_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '公众号的主体名称',
  `alias` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '授权方公众号所设置的微信号，可能为空',
  `business_info` text COLLATE utf8mb4_unicode_ci COMMENT '用以了解以下功能的开通状况（0代表未开通，1代表已开通）：',
  `qrcode_url` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '二维码图片url',
  `idc` tinyint(1) NOT NULL DEFAULT '1',
  `signature` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '公众号功能简介',
  `func_info` text COLLATE utf8mb4_unicode_ci COMMENT '授权功能集',
  `is_auth` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否已授权',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `remark` text COLLATE utf8mb4_unicode_ci,
  `encodingaeskey` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '接口加密key，手动接入的公众号需要',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `appid` (`appid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `ky_mp`
-- ----------------------------
BEGIN;
INSERT INTO `ky_mp` VALUES ('1', '1', 'wx10ddcef6537dd78c', '26a4eb806b640ef07b08777c08fde731', 'MIL4umO8pWIkfNhvNx01uBDupfUqS7J4', '测试号', 'http://we7.fdj.oudewa.cn/attachment/headimg_1.jpg', '2', '0', 'gh_96bd876da264', '', 'test1', null, 'http://devhhb.images.huihuiba.net/1-5ece7c72a8f5f.png', '1', '', null, '1', '1590324684', '1590591251', '1', null, ''), ('2', '2', 'dsaas', 'asdfasdf', 'hwrPcgezvPSAuFRCMnlAVocARzOIbbWE', 'sssss', '', '0', '-1', 'asdafasdf', '', '', null, '', '1', '', null, '1', '1590592849', '1590593695', '1', null, ''), ('3', '0', 'wx43df34a2cc394eb8', '', 'refreshtoken@@@8x14HncR97pzmXXRg1h_vaZjyY6AdsHmIJCRGCMIlyA', '苟哥', 'http://wx.qlogo.cn/mmopen/icU3wjyUPLMsTMc8ApkQS8ogWbMzUa6gKW3eVCPw5OWvhbSe3TpZ55F4DTA8T9F5D5lq0pcxDiaUxFtUic2Ob78yPAGRdfEiaTGf/0', '1', '-1', 'gh_d17efaa86a49', '个人', 'fdaoji', '{\"open_pay\":0,\"open_shake\":0,\"open_scan\":0,\"open_card\":0,\"open_store\":0}', 'http://mmbiz.qpic.cn/mmbiz_jpg/1cpRfYg4VdqSjtX9QpFL7z2qIF2ibib2GuEWeFh5SLY04Vf7YicNoAzQoTghBPFw9y3fx4na2h8VtIL1VF6kZgN5Q/0', '1', '记录学习笔记，探讨科技前沿，崇尚开放、分享、创新。', '[{\"funcscope_category\":{\"id\":1}},{\"funcscope_category\":{\"id\":15}},{\"funcscope_category\":{\"id\":4}},{\"funcscope_category\":{\"id\":7}},{\"funcscope_category\":{\"id\":2}},{\"funcscope_category\":{\"id\":3}},{\"funcscope_category\":{\"id\":11}},{\"funcscope_category\":{\"id\":6}},{\"funcscope_category\":{\"id\":5}},{\"funcscope_category\":{\"id\":8}},{\"funcscope_category\":{\"id\":13}},{\"funcscope_category\":{\"id\":9}},{\"funcscope_category\":{\"id\":10}},{\"funcscope_category\":{\"id\":12}},{\"funcscope_category\":{\"id\":22}},{\"funcscope_category\":{\"id\":23}},{\"funcscope_category\":{\"id\":26}},{\"funcscope_category\":{\"id\":27},\"confirm_info\":{\"need_confirm\":0,\"already_confirm\":0,\"can_confirm\":0}},{\"funcscope_category\":{\"id\":33},\"confirm_info\":{\"need_confirm\":0,\"already_confirm\":0,\"can_confirm\":0}},{\"funcscope_category\":{\"id\":34}},{\"funcscope_category\":{\"id\":35}},{\"funcscope_category\":{\"id\":44},\"confirm_info\":{\"need_confirm\":0,\"already_confirm\":0,\"can_confirm\":0}},{\"funcscope_category\":{\"id\":46}},{\"funcscope_category\":{\"id\":47}},{\"funcscope_category\":{\"id\":54}},{\"funcscope_category\":{\"id\":66}}]', '1', '1590660532', '1590664040', '0', null, '');
COMMIT;

-- ----------------------------
--  Table structure for `ky_mp_addon`
-- ----------------------------
DROP TABLE IF EXISTS `ky_mp_addon`;
CREATE TABLE `ky_mp_addon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号id',
  `addon` varchar(50) NOT NULL DEFAULT '' COMMENT '插件标识',
  `infos` text COMMENT '配置信息',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mpid_addon` (`mpid`,`addon`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='公众号-插件关联表';

-- ----------------------------
--  Records of `ky_mp_addon`
-- ----------------------------
BEGIN;
INSERT INTO `ky_mp_addon` VALUES ('6', '1', 'demo', '{\"title\":\"\\u8bb0\\u4e8b\\u672c\",\"wx_auth_open\":\"1\"}', '1594817610', '1594817649', '1');
COMMIT;

-- ----------------------------
--  Table structure for `ky_mp_follow_1`
-- ----------------------------
DROP TABLE IF EXISTS `ky_mp_follow_1`;
CREATE TABLE `ky_mp_follow_1` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `mpid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '公众号id',
  `openid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '微信号',
  `nickname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `subscribe` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否关注',
  `headimgurl` varchar(300) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '头像',
  `country` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '中国' COMMENT '国家',
  `province` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '城市',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关注时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `remark` varchar(100) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '备注',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '粉丝分组id',
  `subscribe_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '微信官方传来的关注时间',
  `unsubscribe_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '微信官方传来的取消关注时间',
  `unionid` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '开放平台唯一ID，用于不同应用间的打通',
  `tagid_list` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '用户被打上的标签ID列表',
  `language` varchar(20) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'zh_CN' COMMENT '语言',
  `subscribe_scene` varchar(20) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `qr_scene` varchar(30) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '二维码扫码场景（开发者自定义）',
  `qr_scene_str` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '二维码扫码场景描述（开发者自定义）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`,`mpid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT COMMENT='微信用户表';

-- ----------------------------
--  Table structure for `ky_mp_follow_2`
-- ----------------------------
DROP TABLE IF EXISTS `ky_mp_follow_2`;
CREATE TABLE `ky_mp_follow_2` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `mpid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '公众号id',
  `openid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '微信号',
  `nickname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `subscribe` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否关注',
  `headimgurl` varchar(300) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '头像',
  `country` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '中国' COMMENT '国家',
  `province` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '城市',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关注时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `remark` varchar(100) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '备注',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '粉丝分组id',
  `subscribe_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '微信官方传来的关注时间',
  `unsubscribe_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '微信官方传来的取消关注时间',
  `unionid` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '开放平台唯一ID，用于不同应用间的打通',
  `tagid_list` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '用户被打上的标签ID列表',
  `language` varchar(20) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'zh_CN' COMMENT '语言',
  `subscribe_scene` varchar(20) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `qr_scene` varchar(30) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '二维码扫码场景（开发者自定义）',
  `qr_scene_str` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '二维码扫码场景描述（开发者自定义）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`,`mpid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT COMMENT='微信用户表';

-- ----------------------------
--  Records of `ky_mp_follow_2`
-- ----------------------------
BEGIN;
INSERT INTO `ky_mp_follow_2` VALUES ('1', '1', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', '傅道集', '1', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', '中国', '福建', '厦门', '1590849022', '1591673507', '1', '', '0', '1591673507', '1591673443', '', '[]', 'zh_CN', 'ADD_SCENE_QR_CODE', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `ky_mp_follow_3`
-- ----------------------------
DROP TABLE IF EXISTS `ky_mp_follow_3`;
CREATE TABLE `ky_mp_follow_3` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `mpid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '公众号id',
  `openid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '微信号',
  `nickname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `subscribe` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否关注',
  `headimgurl` varchar(300) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '头像',
  `country` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '中国' COMMENT '国家',
  `province` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '城市',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关注时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `remark` varchar(100) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '备注',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '粉丝分组id',
  `subscribe_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '微信官方传来的关注时间',
  `unsubscribe_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '微信官方传来的取消关注时间',
  `unionid` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '开放平台唯一ID，用于不同应用间的打通',
  `tagid_list` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '用户被打上的标签ID列表',
  `language` varchar(20) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'zh_CN' COMMENT '语言',
  `subscribe_scene` varchar(20) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `qr_scene` varchar(30) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '二维码扫码场景（开发者自定义）',
  `qr_scene_str` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '二维码扫码场景描述（开发者自定义）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`,`mpid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT COMMENT='微信用户表';

-- ----------------------------
--  Table structure for `ky_mp_follow_4`
-- ----------------------------
DROP TABLE IF EXISTS `ky_mp_follow_4`;
CREATE TABLE `ky_mp_follow_4` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `mpid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '公众号id',
  `openid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '微信号',
  `nickname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `subscribe` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否关注',
  `headimgurl` varchar(300) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '头像',
  `country` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '中国' COMMENT '国家',
  `province` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '城市',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关注时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `remark` varchar(100) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '备注',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '粉丝分组id',
  `subscribe_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '微信官方传来的关注时间',
  `unsubscribe_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '微信官方传来的取消关注时间',
  `unionid` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '开放平台唯一ID，用于不同应用间的打通',
  `tagid_list` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '用户被打上的标签ID列表',
  `language` varchar(20) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'zh_CN' COMMENT '语言',
  `subscribe_scene` varchar(20) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `qr_scene` varchar(30) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '二维码扫码场景（开发者自定义）',
  `qr_scene_str` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '二维码扫码场景描述（开发者自定义）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`,`mpid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT COMMENT='微信用户表';

-- ----------------------------
--  Records of `ky_mp_follow_4`
-- ----------------------------
BEGIN;
INSERT INTO `ky_mp_follow_4` VALUES ('1', '3', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', '', '1', '', '中国', '', '', '1590850559', '1590850780', '1', '', '0', '1590850780', '1590850771', '', '', 'zh_CN', '', '', ''), ('2', '3', 'oVTwBwQGvRd15VxgfIWfMTMjAOAE', '', '1', '', '中国', '', '', '1594891657', '1594891657', '1', '', '0', '1594891657', '0', '', '', 'zh_CN', '', '', ''), ('3', '3', 'oVTwBwaByhDLgVaR1BBWfuHLUlHo', '', '1', '', '中国', '', '', '1594965138', '1594965138', '1', '', '0', '1594965138', '0', '', '', 'zh_CN', '', '', '');
COMMIT;

-- ----------------------------
--  Table structure for `ky_mp_follow_5`
-- ----------------------------
DROP TABLE IF EXISTS `ky_mp_follow_5`;
CREATE TABLE `ky_mp_follow_5` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `mpid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '公众号id',
  `openid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '微信号',
  `nickname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `subscribe` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否关注',
  `headimgurl` varchar(300) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '头像',
  `country` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '中国' COMMENT '国家',
  `province` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '城市',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关注时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `remark` varchar(100) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '备注',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '粉丝分组id',
  `subscribe_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '微信官方传来的关注时间',
  `unsubscribe_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '微信官方传来的取消关注时间',
  `unionid` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '开放平台唯一ID，用于不同应用间的打通',
  `tagid_list` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '用户被打上的标签ID列表',
  `language` varchar(20) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'zh_CN' COMMENT '语言',
  `subscribe_scene` varchar(20) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `qr_scene` varchar(30) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '二维码扫码场景（开发者自定义）',
  `qr_scene_str` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '二维码扫码场景描述（开发者自定义）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`,`mpid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT COMMENT='微信用户表';

-- ----------------------------
--  Table structure for `ky_mp_menu`
-- ----------------------------
DROP TABLE IF EXISTS `ky_mp_menu`;
CREATE TABLE `ky_mp_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mpid` int(10) NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父级菜单ID',
  `type` enum('click','view','miniprogram','scancode_push','scancode_waitmsg','pic_sysphoto','pic_photo_or_album','pic_weixin','location_select','media_id','view_limited') CHARACTER SET utf8mb4 NOT NULL DEFAULT 'click' COMMENT '类型',
  `name` varchar(10) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '菜单名称',
  `key` varchar(20) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '事件类型对应的key值',
  `url` varchar(200) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '跳转链接和小程序时必填',
  `appid` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '小程序必填',
  `pagepath` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '小程序必填',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否启用',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '排序，数字越小越靠前',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='自定义菜单';

-- ----------------------------
--  Records of `ky_mp_menu`
-- ----------------------------
BEGIN;
INSERT INTO `ky_mp_menu` VALUES ('1', '1', '0', 'view', '汇汇吧', '', 'http://hhb.fdj.oudewa.cn/weixin', '', '', '1', '1591521378', '1591610977', '0'), ('2', '1', '0', 'view', '货好多', '', 'http://hmall.huihuiba.net', '', '', '1', '1591521378', '1591610977', '1'), ('3', '1', '1', 'click', '图片', '图片', '', '', '', '1', '1591521378', '1591610977', '0'), ('5', '1', '0', 'view', '百度', '', 'http://www.baidu.com', 'wx6e61e505e151c3b6', 'pages/index/index', '1', '1591610398', '1591610977', '2');
COMMIT;

-- ----------------------------
--  Table structure for `ky_mp_msg_1`
-- ----------------------------
DROP TABLE IF EXISTS `ky_mp_msg_1`;
CREATE TABLE `ky_mp_msg_1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增 ID',
  `mpid` int(11) NOT NULL DEFAULT '0' COMMENT '公众号标识',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上一条消息 ID',
  `nickname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `headimgurl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `openid` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT 'openid',
  `type` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '消息类型',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '消息内容',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未回复，1已回复',
  `is_reply` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1表示公众号回复',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `openid_mpid` (`openid`,`mpid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `ky_mp_msg_2`
-- ----------------------------
DROP TABLE IF EXISTS `ky_mp_msg_2`;
CREATE TABLE `ky_mp_msg_2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增 ID',
  `mpid` int(11) NOT NULL DEFAULT '0' COMMENT '公众号标识',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上一条消息 ID',
  `nickname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `headimgurl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `openid` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT 'openid',
  `type` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '消息类型',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '消息内容',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未回复，1已回复',
  `is_reply` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1表示公众号回复',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `openid_mpid` (`openid`,`mpid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `ky_mp_msg_2`
-- ----------------------------
BEGIN;
INSERT INTO `ky_mp_msg_2` VALUES ('28', '1', '0', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1591672630\",\"MsgType\":\"text\",\"Content\":\"视频\",\"MsgId\":\"22787272947141282\"}', '0', '0', '1591672630'), ('29', '1', '28', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'video', '{\"MediaId\":\"JW8XS34h_ISSqHFm_g1WsSLp9WAdOkH-Kpe9m-UCR2g\",\"Title\":\"shoes.mp4\",\"Description\":\"\"}', '0', '1', '1591672630'), ('30', '1', '0', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1591673166\",\"MsgType\":\"text\",\"Content\":\"好\",\"MsgId\":\"22787283152509117\"}', '0', '0', '1591673166'), ('31', '1', '30', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"Content\":\"暂时无法回答你哦\"}', '0', '1', '1591673166'), ('34', '1', '33', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"Content\":\"这是一段对语音的回复\"}', '0', '1', '1591673507'), ('35', '1', '0', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'image', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1591673687\",\"MsgType\":\"image\",\"PicUrl\":\"http:\\/\\/mmbiz.qpic.cn\\/mmbiz_jpg\\/KVW98mspEY3bCOcNDSnJFZib5RATl0Ac7ibc8qhp1Xkf2L2PxIQCaseOf1OfseJLOS8XW0cYLflAtGic6DdjBDeGQ\\/0\",\"MsgId\":\"22787287571393185\",\"MediaId\":\"kSLBrDoUSEl1sBfwUKj7gu341eOK13V7R700nuV9OrwSkPmbIAMc_FLc0txtmF5E\"}', '0', '0', '1591673687'), ('36', '1', '0', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'image', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1591674513\",\"MsgType\":\"image\",\"PicUrl\":\"http://mmbiz.qpic.cn/mmbiz_jpg/KVW98mspEY3bCOcNDSnJFZib5RATl0Ac7V0Bx0CPM0SOAtLuyIsXCZibSWFuCr0CWuw7PeyuSUzliagn7uibSA1T5A/0\",\"MsgId\":\"22787300781808213\",\"MediaId\":\"1UA02fj9f-8_bBniro_rftM-fma5CrMafp4MEdQlK65AFZRhFmHuZZLdr7_bNCih\",\"url\":\"http://devhhb.images.huihuiba.net/87bf103a7e3df0b0a58b192389591f97\"}', '0', '0', '1591674513'), ('37', '1', '36', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'image', '{\"MediaId\":\"JW8XS34h_ISSqHFm_g1WsSkOYPPrDPD6w8LZtha8VF4\"}', '0', '1', '1591674513'), ('38', '1', '0', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1591674976\",\"MsgType\":\"text\",\"Content\":\"测试\",\"MsgId\":\"22787305683134211\"}', '0', '0', '1591674977'), ('39', '1', '0', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1591675001\",\"MsgType\":\"text\",\"Content\":\"测试\",\"MsgId\":\"22787306999742339\"}', '0', '0', '1591675001'), ('40', '1', '39', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"Content\":\"暂时无法回答你哦\"}', '0', '1', '1591675001'), ('41', '1', '0', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1591675007\",\"MsgType\":\"text\",\"Content\":\"文本\",\"MsgId\":\"22787307809091099\"}', '0', '0', '1591675007'), ('42', '1', '41', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"Content\":\"暂时无法回答你哦\"}', '0', '1', '1591675007'), ('43', '1', '0', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1591675030\",\"MsgType\":\"text\",\"Content\":\"文本\",\"MsgId\":\"22787309589990687\"}', '0', '0', '1591675030'), ('44', '1', '43', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"Content\":\"我是一段普通文本\"}', '0', '1', '1591675030'), ('45', '1', '0', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'image', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1591675152\",\"MsgType\":\"image\",\"PicUrl\":\"http://mmbiz.qpic.cn/mmbiz_jpg/KVW98mspEY3bCOcNDSnJFZib5RATl0Ac7x1fGmZE9Vl1xYXAtVbGOXu62Hc8rV2icXxW749jKIRaE1z9tRjicqrxg/0\",\"MsgId\":\"22787305790293866\",\"MediaId\":\"MeeyR0RJYT5408e_JcYWrfUU91ecjmE6rTG6Da98k7Da7njNIZIQgXrHToSY7PQP\",\"url\":\"http://devhhb.images.huihuiba.net/331eb777a9e080054c119a7847f79a5a\"}', '0', '0', '1591675153'), ('46', '1', '0', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'image', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1591675184\",\"MsgType\":\"image\",\"PicUrl\":\"http://mmbiz.qpic.cn/mmbiz_jpg/KVW98mspEY3bCOcNDSnJFZib5RATl0Ac7x1fGmZE9Vl1xYXAtVbGOXu62Hc8rV2icXxW749jKIRaE1z9tRjicqrxg/0\",\"MsgId\":\"22787308211611839\",\"MediaId\":\"BObmk8Kx4v0HOo_QSMBUBvLsjFjj5S3-5wKHxVLvrirb1rZndFZdMlCiAvQPNM6d\",\"url\":\"http://devhhb.images.huihuiba.net/caa16ead5520ca1a00e5cad2afa1e0c0\"}', '0', '0', '1591675184'), ('47', '1', '46', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'image', '{\"MediaId\":\"JW8XS34h_ISSqHFm_g1WsSkOYPPrDPD6w8LZtha8VF4\"}', '0', '1', '1591675184'), ('48', '1', '0', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1591698010\",\"MsgType\":\"text\",\"Content\":\"1\",\"MsgId\":\"22787639407063122\"}', '0', '0', '1591698010'), ('49', '1', '48', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"Content\":\"暂时无法回答你哦\"}', '0', '1', '1591698010'), ('50', '1', '0', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1591715061\",\"MsgType\":\"text\",\"Content\":\"我\",\"MsgId\":\"22787879855298707\"}', '0', '0', '1591715061'), ('51', '1', '0', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1591715079\",\"MsgType\":\"text\",\"Content\":\"乾\",\"MsgId\":\"22787877843727722\"}', '0', '0', '1591715079'), ('52', '1', '0', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1591715082\",\"MsgType\":\"text\",\"Content\":\"文本\",\"MsgId\":\"22787879160232801\"}', '1', '0', '1591715082'), ('53', '1', '52', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"Content\":\"我是一段普通文本\"}', '0', '1', '1591715082'), ('54', '1', '0', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1591715139\",\"MsgType\":\"text\",\"Content\":\"啊\",\"MsgId\":\"22787882122084167\"}', '0', '0', '1591715139'), ('55', '1', '0', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'voice', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1591715374\",\"MsgType\":\"voice\",\"MediaId\":\"e77lzf4ynL60IzUjBIySjAC_1e46NTfE0eB5PC7MWn-9uNriEKrMdKjkAG_byOMx\",\"Format\":\"amr\",\"MsgId\":\"6836365475870408704\",\"Recognition\":\"\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u3002\",\"url\":\"http://devhhb.images.huihuiba.net/448677370109cded6e8842dfd52961d3\"}', '1', '0', '1591715374'), ('56', '1', '55', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"Content\":\"这是一段对语音的回复\"}', '0', '1', '1591715374'), ('57', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1591783870\",\"MsgType\":\"text\",\"Content\":\"文本\",\"MsgId\":\"22788865409188681\"}', '1', '0', '1591783870'), ('58', '1', '57', '测试号', 'http://we7.fdj.oudewa.cn/attachment/headimg_1.jpg', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"Content\":\"我是一段普通文本\"}', '0', '1', '1591783870'), ('59', '1', '57', '测试号', 'http://we7.fdj.oudewa.cn/attachment/headimg_1.jpg', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"Content\":\"这是一段对语音的回复\"}', '0', '1', '1591845366'), ('60', '1', '57', '测试号', 'http://we7.fdj.oudewa.cn/attachment/headimg_1.jpg', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'image', '{\"MediaId\":\"JW8XS34h_ISSqHFm_g1WsSkOYPPrDPD6w8LZtha8VF4\",\"url\":\"http:\\/\\/devhhb.images.huihuiba.net\\/1-5ed91d9b11916.jpg\"}', '0', '1', '1591845821'), ('61', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'location', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1592468598\",\"MsgType\":\"location\",\"Location_X\":\"24.531233\",\"Location_Y\":\"118.186280\",\"Scale\":\"15\",\"Label\":\"福建省厦门市湖里区泗水道669号厦门国贸商务中心\",\"MsgId\":\"22798666509597003\"}', '1', '0', '1592468599'), ('62', '1', '61', '测试号', 'http://we7.fdj.oudewa.cn/attachment/headimg_1.jpg', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"Content\":\"我是一段普通文本\"}', '0', '1', '1592468599'), ('63', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'location', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1592895890\",\"MsgType\":\"location\",\"Location_X\":\"24.531142\",\"Location_Y\":\"118.186346\",\"Scale\":\"15\",\"Label\":\"福建省厦门市湖里区泗水道669号厦门国贸商务中心\",\"MsgId\":\"22804783775556604\"}', '1', '0', '1592895890'), ('64', '1', '63', '测试号', 'http://we7.fdj.oudewa.cn/attachment/headimg_1.jpg', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"Content\":\"我是一段普通文本\"}', '0', '1', '1592895890'), ('65', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1592896108\",\"MsgType\":\"text\",\"Content\":\"http:\\/\\/kyphp.fdj.kuryun.cn\\/mp\\/reply\\/special.html\",\"MsgId\":\"22804790110140758\"}', '0', '0', '1592896108'), ('66', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1592896129\",\"MsgType\":\"text\",\"Content\":\"http:\\/\\/kyphp.fdj.kuryun.cn\\/mp\\/reply\\/special.html\",\"MsgId\":\"22804789634516761\"}', '0', '0', '1592896129'), ('67', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1592896334\",\"MsgType\":\"text\",\"Content\":\"http:\\/\\/kyphp.fdj.kuryun.cn\\/mp\\/reply\\/special.html\",\"MsgId\":\"22804791194747199\"}', '0', '0', '1592896334'), ('68', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1592896372\",\"MsgType\":\"text\",\"Content\":\"http:\\/\\/kyphp.fdj.kuryun.cn\\/mp\\/reply\\/special.html\",\"MsgId\":\"22804792036977892\"}', '0', '0', '1592896372'), ('69', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1592896389\",\"MsgType\":\"text\",\"Content\":\"文本\",\"MsgId\":\"22804792098652331\"}', '1', '0', '1592896390'), ('70', '1', '69', '测试号', 'http://we7.fdj.oudewa.cn/attachment/headimg_1.jpg', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"Content\":\"我是一段普通文本\"}', '0', '1', '1592896390'), ('71', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1593417052\",\"MsgType\":\"text\",\"Content\":\"文本\",\"MsgId\":\"22812250521754089\"}', '1', '0', '1593417052'), ('72', '1', '71', '测试号', 'http://we7.fdj.oudewa.cn/attachment/headimg_1.jpg', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"Content\":\"我是一段普通文本\"}', '0', '1', '1593417052'), ('73', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594104123\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822086067560726\"}', '0', '0', '1594104123'), ('74', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594104329\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822086620961426\"}', '0', '0', '1594104329'), ('75', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594104666\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822093088621078\"}', '0', '0', '1594104667'), ('76', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594104669\",\"MsgType\":\"text\",\"Content\":\"1\",\"MsgId\":\"22822091763879004\"}', '0', '0', '1594104669'), ('77', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594104735\",\"MsgType\":\"text\",\"Content\":\"1\",\"MsgId\":\"22822090562249432\"}', '0', '0', '1594104735'), ('78', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594104752\",\"MsgType\":\"text\",\"Content\":\"2\",\"MsgId\":\"22822091084661516\"}', '0', '0', '1594104752'), ('79', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594104766\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822091702679452\"}', '0', '0', '1594104766'), ('80', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594104786\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822093741042382\"}', '0', '0', '1594104786'), ('81', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594105821\",\"MsgType\":\"text\",\"Content\":\"1\",\"MsgId\":\"22822109345123521\"}', '0', '0', '1594105821'), ('82', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594105829\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822109465144712\"}', '0', '0', '1594105829'), ('83', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594105862\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822111239130568\"}', '0', '0', '1594105862'), ('84', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594105891\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822107833727545\"}', '0', '0', '1594105891'), ('85', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594105925\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822110228153695\"}', '0', '0', '1594105925'), ('86', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594106016\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822109304447292\"}', '0', '0', '1594106017'), ('87', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594106057\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822109469026017\"}', '0', '0', '1594106058'), ('88', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594106167\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822115572477619\"}', '0', '0', '1594106168'), ('89', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594106201\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822115766443138\"}', '0', '0', '1594106201'), ('90', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594106230\",\"MsgType\":\"text\",\"Content\":\"文本\",\"MsgId\":\"22822114774034176\"}', '0', '0', '1594106230'), ('91', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594106376\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822112494155963\"}', '0', '0', '1594106376'), ('92', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594106562\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822118229671998\"}', '0', '0', '1594106563'), ('93', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594106592\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822119604813518\"}', '0', '0', '1594106592'), ('94', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594106694\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822117453655939\"}', '0', '0', '1594106695'), ('95', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594107927\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822139660674143\"}', '0', '0', '1594107927'), ('96', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594107993\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822140164950643\"}', '0', '0', '1594107993'), ('97', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594108024\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822141799884321\"}', '0', '0', '1594108025'), ('98', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594108058\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822139999443418\"}', '0', '0', '1594108058'), ('99', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594108087\",\"MsgType\":\"text\",\"Content\":\"demi\",\"MsgId\":\"22822140303552005\"}', '0', '0', '1594108087'), ('100', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594108089\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822141923914645\"}', '0', '0', '1594108089'), ('101', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594108140\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822140639464906\"}', '0', '0', '1594108140'), ('102', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594108901\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822152108643829\"}', '0', '0', '1594108901'), ('103', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594108908\",\"MsgType\":\"text\",\"Content\":\"文本\",\"MsgId\":\"22822151220841328\"}', '1', '0', '1594108908'), ('104', '1', '103', '测试号', 'http://we7.fdj.oudewa.cn/attachment/headimg_1.jpg', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"Content\":\"我是一段普通文本\"}', '0', '1', '1594108908');
COMMIT;

-- ----------------------------
--  Table structure for `ky_mp_msg_3`
-- ----------------------------
DROP TABLE IF EXISTS `ky_mp_msg_3`;
CREATE TABLE `ky_mp_msg_3` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增 ID',
  `log_mpid` int(11) NOT NULL DEFAULT '0' COMMENT '公众号标识',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上一条消息 ID',
  `nickname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `headimgurl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `openid` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT 'openid',
  `type` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '消息类型',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '消息内容',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未回复，1已回复',
  `is_reply` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1表示公众号回复',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `openid_mpid` (`openid`,`log_mpid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `ky_mp_msg_4`
-- ----------------------------
DROP TABLE IF EXISTS `ky_mp_msg_4`;
CREATE TABLE `ky_mp_msg_4` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增 ID',
  `mpid` int(11) NOT NULL DEFAULT '0' COMMENT '公众号标识',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上一条消息 ID',
  `nickname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `headimgurl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `openid` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT 'openid',
  `type` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '消息类型',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '消息内容',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未回复，1已回复',
  `is_reply` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1表示公众号回复',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `openid_mpid` (`openid`,`mpid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `ky_mp_msg_4`
-- ----------------------------
BEGIN;
INSERT INTO `ky_mp_msg_4` VALUES ('28', '3', '0', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'text', '{\"ToUserName\":\"gh_d17efaa86a49\",\"FromUserName\":\"oVTwBwQ4mQBMzON1pXo_WhJSmlyI\",\"CreateTime\":\"1591710511\",\"MsgType\":\"text\",\"Content\":\"音乐\",\"MsgId\":\"22787814973843601\"}', '1', '0', '1591710511'), ('29', '3', '28', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'music', '{\"Title\":\"音乐1\",\"Description\":\"音乐描述\",\"MusicUrl\":\"http:\\/\\/devhhb.images.huihuiba.net\\/1-5eda125e86564.mp3\",\"HQMusicUrl\":\"http:\\/\\/devhhb.images.huihuiba.net\\/1-5eda125e86564.mp3\"}', '0', '1', '1591710511'), ('30', '3', '0', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'text', '{\"ToUserName\":\"gh_d17efaa86a49\",\"FromUserName\":\"oVTwBwQ4mQBMzON1pXo_WhJSmlyI\",\"CreateTime\":\"1591710591\",\"MsgType\":\"text\",\"Content\":\"视频\",\"MsgId\":\"22787816321783031\"}', '1', '0', '1591710591'), ('31', '3', '30', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'video', '{\"MediaId\":\"ZOzBoX0K4goJhq2CjCXt8tNogKn49PcWU81kOnAXVTs\",\"Title\":\"test.mp4\",\"Description\":\"\"}', '0', '1', '1591710591'), ('32', '3', '0', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'text', '{\"ToUserName\":\"gh_d17efaa86a49\",\"FromUserName\":\"oVTwBwQ4mQBMzON1pXo_WhJSmlyI\",\"CreateTime\":\"1591714267\",\"MsgType\":\"text\",\"Content\":\"文本\",\"MsgId\":\"22787868775969527\"}', '1', '0', '1591714268'), ('33', '3', '32', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'text', '{\"Content\":\"测试\"}', '0', '1', '1591714268'), ('34', '3', '0', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'text', '{\"ToUserName\":\"gh_d17efaa86a49\",\"FromUserName\":\"oVTwBwQ4mQBMzON1pXo_WhJSmlyI\",\"CreateTime\":\"1591714642\",\"MsgType\":\"text\",\"Content\":\"音频\",\"MsgId\":\"22787875569329279\"}', '1', '0', '1591714642'), ('35', '3', '34', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'voice', '{\"MediaId\":\"ZOzBoX0K4goJhq2CjCXt8kU2KW1IlNA1ZkYkuDFXN5E\"}', '0', '1', '1591714643'), ('36', '3', '0', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'text', '{\"ToUserName\":\"gh_d17efaa86a49\",\"FromUserName\":\"oVTwBwQ4mQBMzON1pXo_WhJSmlyI\",\"CreateTime\":\"1591714652\",\"MsgType\":\"text\",\"Content\":\"音乐\",\"MsgId\":\"22787874448141377\"}', '1', '0', '1591714652'), ('37', '3', '36', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'music', '{\"Title\":\"音乐1\",\"Description\":\"音乐描述\",\"MusicUrl\":\"http:\\/\\/devhhb.images.huihuiba.net\\/1-5eda125e86564.mp3\",\"HQMusicUrl\":\"http:\\/\\/devhhb.images.huihuiba.net\\/1-5eda125e86564.mp3\"}', '0', '1', '1591714652'), ('38', '3', '0', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'text', '{\"ToUserName\":\"gh_d17efaa86a49\",\"FromUserName\":\"oVTwBwQ4mQBMzON1pXo_WhJSmlyI\",\"CreateTime\":\"1591714659\",\"MsgType\":\"text\",\"Content\":\"视频\",\"MsgId\":\"22787873027776143\"}', '1', '0', '1591714659'), ('39', '3', '38', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'video', '{\"MediaId\":\"ZOzBoX0K4goJhq2CjCXt8tNogKn49PcWU81kOnAXVTs\",\"Title\":\"test.mp4\",\"Description\":\"\"}', '0', '1', '1591714659'), ('40', '3', '0', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'text', '{\"ToUserName\":\"gh_d17efaa86a49\",\"FromUserName\":\"oVTwBwQ4mQBMzON1pXo_WhJSmlyI\",\"CreateTime\":\"1591783829\",\"MsgType\":\"text\",\"Content\":\"文本\",\"MsgId\":\"22788865958477352\"}', '1', '0', '1591783830'), ('41', '3', '40', '苟哥', 'http://wx.qlogo.cn/mmopen/icU3wjyUPLMsTMc8ApkQS8ogWbMzUa6gKW3eVCPw5OWvhbSe3TpZ55F4DTA8T9F5D5lq0pcxDiaUxFtUic2Ob78yPAGRdfEiaTGf/0', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'text', '{\"Content\":\"测试\"}', '0', '1', '1591783830'), ('42', '3', '0', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'text', '{\"ToUserName\":\"gh_d17efaa86a49\",\"FromUserName\":\"oVTwBwQ4mQBMzON1pXo_WhJSmlyI\",\"CreateTime\":\"1591784693\",\"MsgType\":\"text\",\"Content\":\"1\",\"MsgId\":\"22788875857619069\"}', '0', '0', '1591784693'), ('43', '3', '0', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'text', '{\"ToUserName\":\"gh_d17efaa86a49\",\"FromUserName\":\"oVTwBwQ4mQBMzON1pXo_WhJSmlyI\",\"CreateTime\":\"1591784707\",\"MsgType\":\"text\",\"Content\":\"文本\",\"MsgId\":\"22788877664982235\"}', '1', '0', '1591784707'), ('44', '3', '43', '苟哥', 'http://wx.qlogo.cn/mmopen/icU3wjyUPLMsTMc8ApkQS8ogWbMzUa6gKW3eVCPw5OWvhbSe3TpZ55F4DTA8T9F5D5lq0pcxDiaUxFtUic2Ob78yPAGRdfEiaTGf/0', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'text', '{\"Content\":\"测试\"}', '0', '1', '1591784707'), ('45', '3', '0', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'image', '{\"ToUserName\":\"gh_d17efaa86a49\",\"FromUserName\":\"oVTwBwQ4mQBMzON1pXo_WhJSmlyI\",\"CreateTime\":\"1591785140\",\"MsgType\":\"image\",\"PicUrl\":\"http://mmbiz.qpic.cn/mmbiz_jpg/BicGVQs3yBibzv4KhYfxic8to4y3TNzAporwxCCxh1jzE4zswMicU7n4GMc56ZDZdzsmWqh53rmTzEWpCZT94GLKiaA/0\",\"MsgId\":\"22788885039786085\",\"MediaId\":\"tBKCt3C8zi2jidLDU1xVmUlC53gE0EWUTvU6SPxpFez3Zg-rwz-G25K-cRz0TYeo\",\"url\":\"http://devhhb.images.huihuiba.net/d6e42e7e39944c197add540e4ee575c3\"}', '0', '0', '1591785141'), ('46', '3', '0', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'video', '{\"ToUserName\":\"gh_d17efaa86a49\",\"FromUserName\":\"oVTwBwQ4mQBMzON1pXo_WhJSmlyI\",\"CreateTime\":\"1591785203\",\"MsgType\":\"video\",\"MediaId\":\"kAC0bhOi3jodTY99ivRynjBreN3yrlqZ9qTHw6LM-Ik0C0u74ytTpZKSqDxM2HzG\",\"ThumbMediaId\":\"bixRWoTwDcSN0zSM0Wm6eSiZOFdSbK6n8EPITsMQPNaQOsOM9yY_hm6hwAAEOGhw\",\"MsgId\":\"22788885601799578\",\"url\":\"http://devhhb.images.huihuiba.net/c31793b37b5cd748ed9ed0000b3ac2d6\"}', '0', '0', '1591785204'), ('47', '3', '0', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'text', '{\"ToUserName\":\"gh_d17efaa86a49\",\"FromUserName\":\"oVTwBwQ4mQBMzON1pXo_WhJSmlyI\",\"CreateTime\":\"1591794307\",\"MsgType\":\"text\",\"Content\":\"1\",\"MsgId\":\"22789015058077985\"}', '0', '0', '1591794308'), ('48', '3', '0', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'text', '{\"ToUserName\":\"gh_d17efaa86a49\",\"FromUserName\":\"oVTwBwQ4mQBMzON1pXo_WhJSmlyI\",\"CreateTime\":\"1591794313\",\"MsgType\":\"text\",\"Content\":\"文本\",\"MsgId\":\"22789016976492309\"}', '1', '0', '1591794313'), ('49', '3', '48', '苟哥', 'http://wx.qlogo.cn/mmopen/icU3wjyUPLMsTMc8ApkQS8ogWbMzUa6gKW3eVCPw5OWvhbSe3TpZ55F4DTA8T9F5D5lq0pcxDiaUxFtUic2Ob78yPAGRdfEiaTGf/0', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'text', '{\"Content\":\"测试\"}', '0', '1', '1591794313'), ('50', '3', '0', '', '', 'oVTwBwQGvRd15VxgfIWfMTMjAOAE', 'text', '{\"ToUserName\":\"gh_d17efaa86a49\",\"FromUserName\":\"oVTwBwQGvRd15VxgfIWfMTMjAOAE\",\"CreateTime\":\"1594891667\",\"MsgType\":\"text\",\"Content\":\"张剑\",\"MsgId\":\"22833356281407188\"}', '0', '0', '1594891667');
COMMIT;

-- ----------------------------
--  Table structure for `ky_mp_msg_5`
-- ----------------------------
DROP TABLE IF EXISTS `ky_mp_msg_5`;
CREATE TABLE `ky_mp_msg_5` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增 ID',
  `mpid` int(11) NOT NULL DEFAULT '0' COMMENT '公众号标识',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上一条消息 ID',
  `nickname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `headimgurl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `openid` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT 'openid',
  `type` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '消息类型',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '消息内容',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未回复，1已回复',
  `is_reply` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1表示公众号回复',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `openid_mpid` (`openid`,`mpid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `ky_mp_order`
-- ----------------------------
DROP TABLE IF EXISTS `ky_mp_order`;
CREATE TABLE `ky_mp_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `order_no` varchar(32) NOT NULL DEFAULT '' COMMENT '平台交易单号',
  `mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商家公众号id',
  `openid` varchar(64) NOT NULL DEFAULT '' COMMENT '公众号粉丝openid',
  `subject` varchar(250) NOT NULL DEFAULT '' COMMENT '购买主题',
  `body` text NOT NULL COMMENT '购买详情',
  `amount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '实际支付总金额',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态1有效 0废弃',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `extend_info` text COMMENT '其他信息',
  `paid` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否支付 1已支付  0未支付',
  `notify_url` varchar(255) NOT NULL DEFAULT '' COMMENT '回调地址',
  `return_url` varchar(255) NOT NULL DEFAULT '' COMMENT '返回链接',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_order_no` (`order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `ky_mp_order`
-- ----------------------------
BEGIN;
INSERT INTO `ky_mp_order` VALUES ('1', 'demo159359860610110099', '1', 'ow0_twM63wenpWy2IOiGEKS1w4GA', '打赏', '文章【测试文章】', '1', '1', '1593598606', '1593662452', null, '1', 'http://kyphp.fdj.kuryun.cn/app/demo/index/payCallback/mid/1', 'http://kyphp.fdj.kuryun.cn/app/demo/index/detail/id/3/mid/1'), ('2', 'demo159365231357575451', '1', 'ow0_twM63wenpWy2IOiGEKS1w4GA', '打赏', '文章【测试文章】', '1', '1', '1593652313', '1593661228', null, '1', 'http://kyphp.fdj.kuryun.cn/app/demo/index/payCallback/mid/1', 'http://kyphp.fdj.kuryun.cn/app/demo/index/detail/id/3/mid/1'), ('3', 'demo159366068056521005', '1', 'ow0_twM63wenpWy2IOiGEKS1w4GA', '打赏', '文章【文章1】', '1', '1', '1593660680', '1593660680', null, '0', 'http://kyphp.fdj.kuryun.cn/app/demo/index/payCallback/mid/1', 'http://kyphp.fdj.kuryun.cn/app/demo/index/detail/id/2/mid/1'), ('4', 'demo159366081648545650', '1', 'ow0_twM63wenpWy2IOiGEKS1w4GA', '打赏', '文章【文章1】', '1', '1', '1593660816', '1593661089', null, '1', 'http://kyphp.fdj.kuryun.cn/app/demo/index/payCallback/mid/1', 'http://kyphp.fdj.kuryun.cn/app/demo/index/detail/id/2/mid/1'), ('5', 'demo159366104856495656', '1', 'ow0_twM63wenpWy2IOiGEKS1w4GA', '打赏', '文章【文章1】', '1', '1', '1593661048', '1593661075', null, '1', 'http://kyphp.fdj.kuryun.cn/app/demo/index/payCallback/mid/1', 'http://kyphp.fdj.kuryun.cn/app/demo/index/detail/id/2/mid/1'), ('6', 'demo159366155450484851', '1', 'ow0_twM63wenpWy2IOiGEKS1w4GA', '打赏', '文章【文章1】', '1', '1', '1593661554', '1593661807', null, '1', 'http://kyphp.fdj.kuryun.cn/app/demo/index/payCallback/mid/1', 'http://kyphp.fdj.kuryun.cn/app/demo/index/detail/id/2/mid/1'), ('7', 'demo159367232250975710', '1', 'ow0_twM63wenpWy2IOiGEKS1w4GA', '打赏', '文章【文章1】', '1', '1', '1593672322', '1593672365', null, '1', 'http://kyphp.fdj.kuryun.cn/app/demo/index/payCallback/mid/1', 'http://kyphp.fdj.kuryun.cn/app/demo/index/detail/id/2/mid/1');
COMMIT;

-- ----------------------------
--  Table structure for `ky_mp_qrcode`
-- ----------------------------
DROP TABLE IF EXISTS `ky_mp_qrcode`;
CREATE TABLE `ky_mp_qrcode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号id',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '场景名称',
  `scene_str` varchar(64) NOT NULL DEFAULT '' COMMENT '场景值字符串',
  `keyword` varchar(100) NOT NULL DEFAULT '' COMMENT '关联关键词',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0:永久  1临时',
  `expire` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '有效时间',
  `ticket` varchar(150) NOT NULL DEFAULT '' COMMENT '二维码Ticket',
  `short_url` varchar(255) NOT NULL DEFAULT '' COMMENT '二维码短地址',
  `qrcode_url` varchar(200) NOT NULL COMMENT '二维码原始地址',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '二维码图片解析后的地址',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '二维码创建时间',
  `scan_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '扫码次数',
  `gz_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关注数量',
  PRIMARY KEY (`id`),
  KEY `mpid` (`mpid`),
  KEY `keyword` (`keyword`),
  KEY `ticket` (`ticket`,`mpid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ky_mp_qrcode`
-- ----------------------------
BEGIN;
INSERT INTO `ky_mp_qrcode` VALUES ('2', '1', '永久场景1', '场景2', '图片', '0', '0', 'gQF28TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZmN0TUZjMjQ5b1UxMDAwMDAwN3EAAgTLEOteAwQAAAAA', 'https://w.url.cn/s/A59go3o', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQF28TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZmN0TUZjMjQ5b1UxMDAwMDAwN3EAAgTLEOteAwQAAAAA', 'http://weixin.qq.com/q/02fctMFc249oU10000007q', '1592463563', '1', '0'), ('3', '1', '临时场景1', 'sdas', '文本', '1', '3600', 'gQH27zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRl9XbkU2MjQ5b1UxTmlESGh1Y3UAAgRCGeteAwQQDgAA', 'https://w.url.cn/s/AXkrakp', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQH27zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRl9XbkU2MjQ5b1UxTmlESGh1Y3UAAgRCGeteAwQQDgAA', 'http://weixin.qq.com/q/02F_WnE6249oU1NiDHhucu', '1592465730', '3', '1');
COMMIT;

-- ----------------------------
--  Table structure for `ky_mp_qrcode_log_1`
-- ----------------------------
DROP TABLE IF EXISTS `ky_mp_qrcode_log_1`;
CREATE TABLE `ky_mp_qrcode_log_1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qrcode_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '二维码id',
  `log_mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号id',
  `openid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'openid',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0默认  1扫码关注',
  `ticket` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `scan_num` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '扫码次数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '首次扫码时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `qrcode_id` (`qrcode_id`,`log_mpid`,`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `ky_mp_qrcode_log_2`
-- ----------------------------
DROP TABLE IF EXISTS `ky_mp_qrcode_log_2`;
CREATE TABLE `ky_mp_qrcode_log_2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qrcode_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '二维码id',
  `log_mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号id',
  `openid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'openid',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0默认  1扫码关注',
  `ticket` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `scan_num` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '扫码次数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '首次扫码时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `qrcode_id` (`qrcode_id`,`log_mpid`,`openid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `ky_mp_qrcode_log_2`
-- ----------------------------
BEGIN;
INSERT INTO `ky_mp_qrcode_log_2` VALUES ('1', '3', '1', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', '0', 'gQH27zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRl9XbkU2MjQ5b1UxTmlESGh1Y3UAAgRCGeteAwQQDgAA', '2', '1592467860', '1592468103'), ('2', '2', '1', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', '0', 'gQF28TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZmN0TUZjMjQ5b1UxMDAwMDAwN3EAAgTLEOteAwQAAAAA', '1', '1592469140', '1592469140');
COMMIT;

-- ----------------------------
--  Table structure for `ky_mp_qrcode_log_3`
-- ----------------------------
DROP TABLE IF EXISTS `ky_mp_qrcode_log_3`;
CREATE TABLE `ky_mp_qrcode_log_3` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qrcode_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '二维码id',
  `mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号id',
  `openid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'openid',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0默认  1扫码关注',
  `ticket` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `scan_num` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '扫码次数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '首次扫码时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `qrcode_id` (`qrcode_id`,`mpid`,`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `ky_mp_qrcode_log_4`
-- ----------------------------
DROP TABLE IF EXISTS `ky_mp_qrcode_log_4`;
CREATE TABLE `ky_mp_qrcode_log_4` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qrcode_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '二维码id',
  `log_mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号id',
  `openid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'openid',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0默认  1扫码关注',
  `ticket` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `scan_num` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '扫码次数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '首次扫码时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `qrcode_id` (`qrcode_id`,`log_mpid`,`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `ky_mp_qrcode_log_5`
-- ----------------------------
DROP TABLE IF EXISTS `ky_mp_qrcode_log_5`;
CREATE TABLE `ky_mp_qrcode_log_5` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qrcode_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '二维码id',
  `log_mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号id',
  `openid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'openid',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0默认  1扫码关注',
  `ticket` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `scan_num` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '扫码次数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '首次扫码时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `qrcode_id` (`qrcode_id`,`log_mpid`,`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `ky_mp_rule_1`
-- ----------------------------
DROP TABLE IF EXISTS `ky_mp_rule_1`;
CREATE TABLE `ky_mp_rule_1` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `rule_mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `keyword` varchar(80) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '关键词内容',
  `media_type` varchar(50) NOT NULL DEFAULT '' COMMENT '触发类型：text,addon,images,news,voice,music,video',
  `media_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复素材ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(1开启:0关闭)',
  PRIMARY KEY (`id`),
  KEY `mpid` (`rule_mpid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公众号响应规则';

-- ----------------------------
--  Table structure for `ky_mp_rule_2`
-- ----------------------------
DROP TABLE IF EXISTS `ky_mp_rule_2`;
CREATE TABLE `ky_mp_rule_2` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `rule_mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `keyword` varchar(80) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '关键词内容',
  `media_type` varchar(50) NOT NULL DEFAULT '' COMMENT '触发类型：text,addon,images,news,voice,music,video',
  `media_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复素材ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(1开启:0关闭)',
  PRIMARY KEY (`id`),
  KEY `mpid` (`rule_mpid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='公众号响应规则';

-- ----------------------------
--  Records of `ky_mp_rule_2`
-- ----------------------------
BEGIN;
INSERT INTO `ky_mp_rule_2` VALUES ('1', '1', '图片', 'image', '8', '1'), ('2', '1', '语音', 'text', '14', '1'), ('3', '1', '无应答', 'text', '15', '1'), ('4', '1', '视频', 'video', '4', '1'), ('5', '1', '音乐', 'music', '6', '1'), ('6', '1', '文本', 'text', '5', '1'), ('7', '1', 'demo1', 'addon', '10', '1');
COMMIT;

-- ----------------------------
--  Table structure for `ky_mp_rule_3`
-- ----------------------------
DROP TABLE IF EXISTS `ky_mp_rule_3`;
CREATE TABLE `ky_mp_rule_3` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `rule_mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `keyword` varchar(80) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '关键词内容',
  `media_type` varchar(50) NOT NULL DEFAULT '' COMMENT '触发类型：text,addon,images,news,voice,music,video',
  `media_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复素材ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(1开启:0关闭)',
  PRIMARY KEY (`id`),
  KEY `mpid` (`rule_mpid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公众号响应规则';

-- ----------------------------
--  Table structure for `ky_mp_rule_4`
-- ----------------------------
DROP TABLE IF EXISTS `ky_mp_rule_4`;
CREATE TABLE `ky_mp_rule_4` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `rule_mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `keyword` varchar(80) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '关键词内容',
  `media_type` varchar(50) NOT NULL DEFAULT '' COMMENT '触发类型：text,addon,images,news,voice,music,video',
  `media_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复素材ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(1开启:0关闭)',
  PRIMARY KEY (`id`),
  KEY `mpid` (`rule_mpid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='公众号响应规则';

-- ----------------------------
--  Records of `ky_mp_rule_4`
-- ----------------------------
BEGIN;
INSERT INTO `ky_mp_rule_4` VALUES ('1', '3', '测试', 'text', '7', '1'), ('2', '3', '图片', 'image', '5', '1'), ('3', '3', '文本', 'text', '7', '1'), ('4', '3', '我和奶奶', 'image', '15', '1'), ('5', '3', '音频', 'voice', '2', '1'), ('6', '3', '视频', 'video', '1', '1'), ('7', '3', '音乐', 'music', '2', '1');
COMMIT;

-- ----------------------------
--  Table structure for `ky_mp_rule_5`
-- ----------------------------
DROP TABLE IF EXISTS `ky_mp_rule_5`;
CREATE TABLE `ky_mp_rule_5` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `rule_mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `keyword` varchar(80) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '关键词内容',
  `media_type` varchar(50) NOT NULL DEFAULT '' COMMENT '触发类型：text,addon,images,news,voice,music,video',
  `media_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复素材ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(1开启:0关闭)',
  PRIMARY KEY (`id`),
  KEY `mpid` (`rule_mpid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公众号响应规则';

-- ----------------------------
--  Table structure for `ky_mp_setting`
-- ----------------------------
DROP TABLE IF EXISTS `ky_mp_setting`;
CREATE TABLE `ky_mp_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID，大于0表示附属公众号的配置',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '标识',
  `title` varchar(30) NOT NULL DEFAULT '' COMMENT '名称',
  `value` text COMMENT '配置值',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='公众号配置';

-- ----------------------------
--  Records of `ky_mp_setting`
-- ----------------------------
BEGIN;
INSERT INTO `ky_mp_setting` VALUES ('4', '1', 'wxpay', '微信支付', '{\"appid\":\"wxe1b7737e3a0c7153\",\"secret\":\"887bb389abbe27e69982576a96a515b3\",\"merchant_id\":\"1449332102\",\"key\":\"Tm44FMGt484Y44TjV34V3VG2ZEG4pf4f\",\"cert_path\":\"-----BEGIN CERTIFICATE-----\\r\\nMIIEbDCCA9WgAwIBAgIEAObuWTANBgkqhkiG9w0BAQUFADCBijELMAkGA1UEBhMC\\r\\nQ04xEjAQBgNVBAgTCUd1YW5nZG9uZzERMA8GA1UEBxMIU2hlbnpoZW4xEDAOBgNV\\r\\nBAoTB1RlbmNlbnQxDDAKBgNVBAsTA1dYRzETMBEGA1UEAxMKTW1wYXltY2hDQTEf\\r\\nMB0GCSqGSIb3DQEJARYQbW1wYXltY2hAdGVuY2VudDAeFw0xNzA0MjUxMTAwNTRa\\r\\nFw0yNzA0MjMxMTAwNTRaMIGbMQswCQYDVQQGEwJDTjESMBAGA1UECBMJR3Vhbmdk\\r\\nb25nMREwDwYDVQQHEwhTaGVuemhlbjEQMA4GA1UEChMHVGVuY2VudDEOMAwGA1UE\\r\\nCxMFTU1QYXkxMDAuBgNVBAMUJ+WOpumXqOiHs+mrmOeCueaVmeiCsueuoeeQhuac\\r\\niemZkOWFrOWPuDERMA8GA1UEBBMIMjUxNzQzODQwggEiMA0GCSqGSIb3DQEBAQUA\\r\\nA4IBDwAwggEKAoIBAQDYiZMqCfEw4lgafP1voxdtkzT24QLFGNAr13hLz8DAPIWA\\r\\nrP5UY7\\/qceMWzhQWQ+tsmkt+cOnGmUsKN7iHXZJiJ4S2Fn+nkcADqB1wtZYAYCP9\\r\\nyrU\\/9eBF3bQ\\/p6zqJt5oXmf7\\/xHIBJfd\\/2BZuGkLraoIoPA8Mw3We42Fhq7nwZ3L\\r\\nY7Z3+S+TM3jIZmE7+VfLFT0qHE0Nbx5ctDqGkw\\/JQnlzG40G6x8s\\/96Ool652ZiN\\r\\n6h+JaY3L\\/VQfQBm9ddAqb2hcC1HTQTj7OFtDUj2yxu+9RAslpXHqeNDEqF6xaPQ\\/\\r\\nQccid5JN+2aS8NAEy0ql762KvKkF09MMQuaeVruvAgMBAAGjggFGMIIBQjAJBgNV\\r\\nHRMEAjAAMCwGCWCGSAGG+EIBDQQfFh0iQ0VTLUNBIEdlbmVyYXRlIENlcnRpZmlj\\r\\nYXRlIjAdBgNVHQ4EFgQUcGJYaavPtQngK2TUsKLnuUIAj2kwgb8GA1UdIwSBtzCB\\r\\ntIAUPgUm9iJitBVbiM1kfrDUYqflhnShgZCkgY0wgYoxCzAJBgNVBAYTAkNOMRIw\\r\\nEAYDVQQIEwlHdWFuZ2RvbmcxETAPBgNVBAcTCFNoZW56aGVuMRAwDgYDVQQKEwdU\\r\\nZW5jZW50MQwwCgYDVQQLEwNXWEcxEzARBgNVBAMTCk1tcGF5bWNoQ0ExHzAdBgkq\\r\\nhkiG9w0BCQEWEG1tcGF5bWNoQHRlbmNlbnSCCQC7VJcrvADoVzAOBgNVHQ8BAf8E\\r\\nBAMCBsAwFgYDVR0lAQH\\/BAwwCgYIKwYBBQUHAwIwDQYJKoZIhvcNAQEFBQADgYEA\\r\\nnp2lTfb2iGXYOFmXWqKxQgEE\\/93Tg+rUGnVjfkV9igB1JWn2mRktLLsDTy4hLeLe\\r\\nLWoAqIRCHFRUnXe3C2UwZiJofNKpl80JQeRbnZIZ6u6XNF47XwdbXYI5O6JYSPT1\\r\\n8HjcG0HjvCayw9HjKvDC6iTK50C3p2SOk8PXr7ERmdg=\\r\\n-----END CERTIFICATE-----\",\"key_path\":\"-----BEGIN PRIVATE KEY-----\\r\\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDYiZMqCfEw4lga\\r\\nfP1voxdtkzT24QLFGNAr13hLz8DAPIWArP5UY7\\/qceMWzhQWQ+tsmkt+cOnGmUsK\\r\\nN7iHXZJiJ4S2Fn+nkcADqB1wtZYAYCP9yrU\\/9eBF3bQ\\/p6zqJt5oXmf7\\/xHIBJfd\\r\\n\\/2BZuGkLraoIoPA8Mw3We42Fhq7nwZ3LY7Z3+S+TM3jIZmE7+VfLFT0qHE0Nbx5c\\r\\ntDqGkw\\/JQnlzG40G6x8s\\/96Ool652ZiN6h+JaY3L\\/VQfQBm9ddAqb2hcC1HTQTj7\\r\\nOFtDUj2yxu+9RAslpXHqeNDEqF6xaPQ\\/Qccid5JN+2aS8NAEy0ql762KvKkF09MM\\r\\nQuaeVruvAgMBAAECggEAJ3\\/5I3sKz2MKtVJFnP7AQFHRIJPtQG0FVGoK3LF6NNcV\\r\\nd2KXRmen06mQxlEzYthi8r22tcr9Kig+gw+lDrRoBpW05M533OZ+g2xAapYFVe4z\\r\\nwpEevRsqHTSTM+VvaotKmPlXuKVP5g\\/IcEuslNFKAEJeuRI6oJCjnpONPmVSNJ5L\\r\\n\\/zGFZ9eEU6ZCs5fOwhxqW5C9E+U2MQJ2nK6FWMV4wFHzZQAlbgOYV\\/K3QoJnbBs7\\r\\njkkki+jRC2f9hESnd3+aGWTd4qoO+ShDF3TynZ4PeO90mm\\/OOIJ+env1ZpbT+UMR\\r\\nqc7OEImRZ\\/0O\\/IrkIsnOYPfsYqFrP7NwgDnrrR2qwQKBgQD86Y1YdONVD5tx9kgP\\r\\nJhY+LjUvXnIOXyTSCljXPqTFS\\/aBHxftb6UdFluuXSg8xKAqtaKHpH7Y0TcVqax7\\r\\n9OCyFhK1rMNJKfAAZ15iTLpmu815xn28iVamIoSRyud+CggcsmtqMD6pPcMVOkj+\\r\\ndAhTRNkVGYx9A4ZsNpiTT+IR4QKBgQDbLlZSgVIFs6emrTu2y6nqZWluFEBEVEvO\\r\\nIMgVM1swhOest7nSozjEUeRA3qKKqN7mQ5b\\/qd8lAs3DBosT9kyTo\\/ZxIE3CUB\\/b\\r\\ndKakeW\\/3MT4UeFGAxqYOjJuIIl7FBz8IDf6PJ2D5\\/Vg5gAQ0NBsk41dHS0TRNm4I\\r\\nIRi2\\/HSfjwKBgQDAe6fdiKhz1nsB0uSo0t3e2SAVOxYnJfZJ\\/SH8P2r71YJ4Zwe4\\r\\n512Ms7V3EONMzIDxwGdAQMthjGkWDZp+hLJ2FyKKLkA6cLZ+OC23NpovEgOiCJUt\\r\\nZoER0\\/d9ViW04UGnRYtGuA0YlS7h+wgO0JR9e0qUKmunwYUO2sZoZ0WxQQKBgGKK\\r\\n1cKoY9EucazNa\\/CGZrF8wMb+Edrmr2JQeMSXX2NUDbkorUIXolkZnG7R6fA\\/dl++\\r\\nebAelrXUKeCKG5NxBALJD+7SoENBtOD89EM0WfOgTxHy+mnUZipaaz7sfQFGfb9I\\r\\nU2\\/XO5GJptXLSZiS6LVQBRiHrbwGJbg\\/8RWsMV7fAoGBAKPiqzPbAs3T1YjQmZK7\\r\\nbBPy5vO\\/1CVoU59iVp3mnX\\/mUeHItnZAIvASEXG80uhIHTN8WJHVlKNQymjpHBNZ\\r\\nKwyKSQYiqcimmBeB5MTBvekzDwrJ2JJvh14OMYOj3QlmELJly83NqAp\\/Yda1Sznf\\r\\nwW5s2g+zjcxN95YjykC++Oxv\\r\\n-----END PRIVATE KEY-----\",\"rsa_path\":\"\"}', '1591886422', '1593599973');
COMMIT;

-- ----------------------------
--  Table structure for `ky_mp_special`
-- ----------------------------
DROP TABLE IF EXISTS `ky_mp_special`;
CREATE TABLE `ky_mp_special` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `spe_mpid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号id',
  `event` enum('image','voice','video','shortvideo','location','event_location','link','view','subscribe','unsubscribe','card','default') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '事件/消息类型',
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '触发的关键词',
  `addon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '触发应用',
  `ignore` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否忽略',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1正常 0禁用',
  PRIMARY KEY (`id`),
  KEY `mpid` (`spe_mpid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='公众号特殊消息/事件回复';

-- ----------------------------
--  Records of `ky_mp_special`
-- ----------------------------
BEGIN;
INSERT INTO `ky_mp_special` VALUES ('1', '1', 'image', '', '', '1', '1'), ('2', '1', 'voice', '', '', '1', '1'), ('3', '1', 'video', '', '', '1', '1'), ('4', '1', 'shortvideo', '', '', '1', '1'), ('5', '1', 'location', '', 'demo', '0', '1'), ('6', '1', 'link', '', '', '1', '1'), ('7', '1', 'event_location', '', '', '1', '1'), ('9', '1', 'subscribe', '', '', '0', '1'), ('10', '1', 'unsubscribe', '', '', '1', '1'), ('11', '1', 'card', '', '', '1', '1'), ('12', '1', 'default', '', '', '1', '1'), ('13', '3', 'subscribe', '', '', '1', '1'), ('14', '3', 'unsubscribe', '', '', '1', '1'), ('15', '3', 'image', '', '', '1', '1'), ('16', '3', 'voice', '', '', '1', '1'), ('17', '3', 'video', '', '', '1', '1'), ('18', '3', 'shortvideo', '', '', '1', '1'), ('19', '3', 'location', '', '', '1', '1'), ('20', '3', 'link', '', '', '1', '1'), ('21', '3', 'event_location', '', '', '1', '1'), ('23', '3', 'card', '', '', '1', '1'), ('24', '3', 'default', '', '', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `ky_notice`
-- ----------------------------
DROP TABLE IF EXISTS `ky_notice`;
CREATE TABLE `ky_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '公告标题',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告内容',
  `publish_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统公告';

-- ----------------------------
--  Records of `ky_notice`
-- ----------------------------
BEGIN;
INSERT INTO `ky_notice` VALUES ('1', '公告1', '<p><img src=\"http://devhhb.images.huihuiba.net/1-5ed603542b0f4.jpg\" alt=\"1-5ed603542b0f4.jpg\"/></p><p>测试公告内容，修改了</p>', '1594896021', '1', '1594896100', '1594896426'), ('2', '公告2', '<p>内容随时说</p>', '1594900011', '1', '1594900088', '1594900088');
COMMIT;

-- ----------------------------
--  Table structure for `ky_notice_read`
-- ----------------------------
DROP TABLE IF EXISTS `ky_notice_read`;
CREATE TABLE `ky_notice_read` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `notice` longtext COLLATE utf8mb4_unicode_ci COMMENT '公告id串',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='已读公告';

-- ----------------------------
--  Records of `ky_notice_read`
-- ----------------------------
BEGIN;
INSERT INTO `ky_notice_read` VALUES ('1', '1', 'id2,id1'), ('2', '4', 'id2,id1'), ('3', '2', 'id1,id2');
COMMIT;

-- ----------------------------
--  Table structure for `ky_order_addon`
-- ----------------------------
DROP TABLE IF EXISTS `ky_order_addon`;
CREATE TABLE `ky_order_addon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_no` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '交易单号',
  `addon` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '应用标识',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `subject` varchar(250) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '购买主题',
  `body` text CHARACTER SET utf8 NOT NULL COMMENT '购买详情',
  `total` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单总额（单位：分）',
  `amount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单实付金额',
  `currency` varchar(10) CHARACTER SET utf8 NOT NULL DEFAULT 'cny' COMMENT '汇率类型',
  `channel` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT 'WX_WEB' COMMENT '支付类型,默认微信支付',
  `client_ip` char(15) CHARACTER SET utf8 NOT NULL DEFAULT '127.0.0.1' COMMENT '客户端ip',
  `paid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1:支付成功 0：待支付  -1：支付失败；2：已退款',
  `transaction_id` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '支付平台订单号',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_no` (`order_no`) USING BTREE,
  KEY `user_id` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='应用采购订单';

-- ----------------------------
--  Records of `ky_order_addon`
-- ----------------------------
BEGIN;
INSERT INTO `ky_order_addon` VALUES ('9', 'addon159530730153555556', 'demo', '1', 'admin', '15659827559', '开通应用demo应用', '开通应用demo应用', '1', '2', 'cny', 'WX_NATIVE', '106.122.210.148', '1', '4200000721202007218491029526', '1', '1595307301', '1595325003', '1595311033'), ('10', 'addon159531014953989753', 'demo', '1', 'admin', '15659827559', '开通应用demo应用', '开通应用demo应用', '1', '1', 'cny', 'WX_NATIVE', '106.122.210.148', '0', '', '1', '1595310149', '1595310149', '0'), ('11', 'addon159531115349541015', 'demo', '1', 'admin', '15659827559', '开通应用demo应用', '开通应用demo应用', '1', '2', 'cny', 'WX_NATIVE', '106.122.210.148', '1', '4200000721202007214490148012', '1', '1595311153', '1595324935', '1595311177'), ('12', 'addon159531167497501015', 'demo', '1', 'admin', '15659827559', '开通应用demo应用', '开通应用demo应用', '1', '1', 'cny', 'WX_NATIVE', '106.122.210.148', '1', '4200000723202007217734528377', '1', '1595311674', '1595311697', '1595311697'), ('13', 'addon159531215357511009', 'demo', '1', 'admin', '15659827559', '开通应用demo应用', '开通应用demo应用', '1', '1', 'cny', 'WX_NATIVE', '106.122.210.148', '1', '4200000720202007211164900634', '1', '1595312153', '1595312171', '1595312171'), ('14', 'addon159531266557979852', 'demo', '1', 'admin', '15659827559', '开通应用demo应用', '开通应用demo应用', '1', '1', 'cny', 'WX_NATIVE', '106.122.210.148', '1', '4200000723202007212484015953', '1', '1595312665', '1595312686', '1595312686'), ('15', 'addon159531303910250565', 'demo', '1', 'admin', '15659827559', '开通应用demo应用', '开通应用demo应用', '1', '1', 'cny', 'WX_NATIVE', '106.122.210.148', '0', '', '1', '1595313039', '1595313039', '0'), ('16', 'addon159531314355495449', 'demo', '1', 'admin', '15659827559', '开通应用demo应用', '开通应用demo应用', '1', '1', 'cny', 'WX_NATIVE', '106.122.210.148', '0', '', '1', '1595313143', '1595313143', '0');
COMMIT;

-- ----------------------------
--  Table structure for `ky_setting`
-- ----------------------------
DROP TABLE IF EXISTS `ky_setting`;
CREATE TABLE `ky_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '标识',
  `title` varchar(30) NOT NULL DEFAULT '' COMMENT '名称',
  `value` text COMMENT '配置值',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='站点配置';

-- ----------------------------
--  Records of `ky_setting`
-- ----------------------------
BEGIN;
INSERT INTO `ky_setting` VALUES ('1', 'site', '站点信息', '{\"close\":\"0\",\"close_reason\":\"\\u7cfb\\u7edf\\u5347\\u7ea7\",\"icp\":\"\\u95fdICP\\u590717014461\\u53f7-1\",\"logo\":\"http:\\/\\/devhhb.images.huihuiba.net\\/1-5f1011aad2d7e.png\",\"kefu\":\"http:\\/\\/devhhb.images.huihuiba.net\\/1-5f156f510f649.jpg\",\"default_group_id\":\"2\",\"keywords\":\"\\u5fae\\u4fe1\\u8425\\u9500\\u7cfb\\u7edf\\uff0c\\u5168\\u884c\\u4e1a\",\"description\":\"\\u5fae\\u4fe1\\u8425\\u9500\\u7cfb\\u7edf\\uff0c\\u8986\\u76d6\\u5168\\u884c\\u4e1a\\u3002\"}', '1590290640', '1595240286'), ('2', 'upload', '附件设置', '{\"driver\":\"qiniu\",\"qiniu_ak\":\"zn9rSy52CirW07siksxMsLBo8d_NJDTSb9vljGwT\",\"qiniu_sk\":\"GW-pwZlsL01Hvleiv9TmFIhaFNKKEIzYeNYGt_1P\",\"qiniu_bucket\":\"dev-hhb\",\"qiniu_domain\":\"http:\\/\\/devhhb.images.huihuiba.net\",\"image_size\":\"2048000\",\"image_ext\":\"jpg,gif,png,jpeg\",\"file_size\":\"53000000\",\"file_ext\":\"jpg,gif,png,jpeg,zip,rar,tar,gz,7z,doc,docx,txt,xml,mp3,mp4,xls,xlsx,pdf\",\"voice_size\":\"2048000\",\"voice_ext\":\"mp3,wma,wav,amr\",\"video_size\":\"50240000\",\"video_ext\":\"mp4,flv,mov\"}', '1590292316', '1591368006'), ('3', 'weixin', '微信', '{\"platform\":{\"appid\":\"wxe801199e1be0e667\",\"appsecret\":\"b888af3de74a6b55de3d257ae7439a51\",\"token\":\"Ss6jcMRzWJr4eBIy43qAQMhbDQIgrIvy\",\"aes_key\":\"d7EDKAAJJowAsYnudcASzLjwBlJXXp3DOd4pvmRBR2L\",\"verify_file\":\"\\/9885899112.txt\"}}', '1590647777', '1590721768'), ('5', 'pay', '支付设置', '{\"wx_appid\":\"wxe1b7737e3a0c7153\",\"wx_secret\":\"887bb389abbe27e69982576a96a515b3\",\"wx_merchant_id\":\"1449332102\",\"wx_key\":\"Tm44FMGt484Y44TjV34V3VG2ZEG4pf4f\",\"wx_cert_path\":\"-----BEGIN CERTIFICATE-----\\r\\nMIIEbDCCA9WgAwIBAgIEAObuWTANBgkqhkiG9w0BAQUFADCBijELMAkGA1UEBhMC\\r\\nQ04xEjAQBgNVBAgTCUd1YW5nZG9uZzERMA8GA1UEBxMIU2hlbnpoZW4xEDAOBgNV\\r\\nBAoTB1RlbmNlbnQxDDAKBgNVBAsTA1dYRzETMBEGA1UEAxMKTW1wYXltY2hDQTEf\\r\\nMB0GCSqGSIb3DQEJARYQbW1wYXltY2hAdGVuY2VudDAeFw0xNzA0MjUxMTAwNTRa\\r\\nFw0yNzA0MjMxMTAwNTRaMIGbMQswCQYDVQQGEwJDTjESMBAGA1UECBMJR3Vhbmdk\\r\\nb25nMREwDwYDVQQHEwhTaGVuemhlbjEQMA4GA1UEChMHVGVuY2VudDEOMAwGA1UE\\r\\nCxMFTU1QYXkxMDAuBgNVBAMUJ+WOpumXqOiHs+mrmOeCueaVmeiCsueuoeeQhuac\\r\\niemZkOWFrOWPuDERMA8GA1UEBBMIMjUxNzQzODQwggEiMA0GCSqGSIb3DQEBAQUA\\r\\nA4IBDwAwggEKAoIBAQDYiZMqCfEw4lgafP1voxdtkzT24QLFGNAr13hLz8DAPIWA\\r\\nrP5UY7\\/qceMWzhQWQ+tsmkt+cOnGmUsKN7iHXZJiJ4S2Fn+nkcADqB1wtZYAYCP9\\r\\nyrU\\/9eBF3bQ\\/p6zqJt5oXmf7\\/xHIBJfd\\/2BZuGkLraoIoPA8Mw3We42Fhq7nwZ3L\\r\\nY7Z3+S+TM3jIZmE7+VfLFT0qHE0Nbx5ctDqGkw\\/JQnlzG40G6x8s\\/96Ool652ZiN\\r\\n6h+JaY3L\\/VQfQBm9ddAqb2hcC1HTQTj7OFtDUj2yxu+9RAslpXHqeNDEqF6xaPQ\\/\\r\\nQccid5JN+2aS8NAEy0ql762KvKkF09MMQuaeVruvAgMBAAGjggFGMIIBQjAJBgNV\\r\\nHRMEAjAAMCwGCWCGSAGG+EIBDQQfFh0iQ0VTLUNBIEdlbmVyYXRlIENlcnRpZmlj\\r\\nYXRlIjAdBgNVHQ4EFgQUcGJYaavPtQngK2TUsKLnuUIAj2kwgb8GA1UdIwSBtzCB\\r\\ntIAUPgUm9iJitBVbiM1kfrDUYqflhnShgZCkgY0wgYoxCzAJBgNVBAYTAkNOMRIw\\r\\nEAYDVQQIEwlHdWFuZ2RvbmcxETAPBgNVBAcTCFNoZW56aGVuMRAwDgYDVQQKEwdU\\r\\nZW5jZW50MQwwCgYDVQQLEwNXWEcxEzARBgNVBAMTCk1tcGF5bWNoQ0ExHzAdBgkq\\r\\nhkiG9w0BCQEWEG1tcGF5bWNoQHRlbmNlbnSCCQC7VJcrvADoVzAOBgNVHQ8BAf8E\\r\\nBAMCBsAwFgYDVR0lAQH\\/BAwwCgYIKwYBBQUHAwIwDQYJKoZIhvcNAQEFBQADgYEA\\r\\nnp2lTfb2iGXYOFmXWqKxQgEE\\/93Tg+rUGnVjfkV9igB1JWn2mRktLLsDTy4hLeLe\\r\\nLWoAqIRCHFRUnXe3C2UwZiJofNKpl80JQeRbnZIZ6u6XNF47XwdbXYI5O6JYSPT1\\r\\n8HjcG0HjvCayw9HjKvDC6iTK50C3p2SOk8PXr7ERmdg=\\r\\n-----END CERTIFICATE-----\",\"wx_key_path\":\"-----BEGIN PRIVATE KEY-----\\r\\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDYiZMqCfEw4lga\\r\\nfP1voxdtkzT24QLFGNAr13hLz8DAPIWArP5UY7\\/qceMWzhQWQ+tsmkt+cOnGmUsK\\r\\nN7iHXZJiJ4S2Fn+nkcADqB1wtZYAYCP9yrU\\/9eBF3bQ\\/p6zqJt5oXmf7\\/xHIBJfd\\r\\n\\/2BZuGkLraoIoPA8Mw3We42Fhq7nwZ3LY7Z3+S+TM3jIZmE7+VfLFT0qHE0Nbx5c\\r\\ntDqGkw\\/JQnlzG40G6x8s\\/96Ool652ZiN6h+JaY3L\\/VQfQBm9ddAqb2hcC1HTQTj7\\r\\nOFtDUj2yxu+9RAslpXHqeNDEqF6xaPQ\\/Qccid5JN+2aS8NAEy0ql762KvKkF09MM\\r\\nQuaeVruvAgMBAAECggEAJ3\\/5I3sKz2MKtVJFnP7AQFHRIJPtQG0FVGoK3LF6NNcV\\r\\nd2KXRmen06mQxlEzYthi8r22tcr9Kig+gw+lDrRoBpW05M533OZ+g2xAapYFVe4z\\r\\nwpEevRsqHTSTM+VvaotKmPlXuKVP5g\\/IcEuslNFKAEJeuRI6oJCjnpONPmVSNJ5L\\r\\n\\/zGFZ9eEU6ZCs5fOwhxqW5C9E+U2MQJ2nK6FWMV4wFHzZQAlbgOYV\\/K3QoJnbBs7\\r\\njkkki+jRC2f9hESnd3+aGWTd4qoO+ShDF3TynZ4PeO90mm\\/OOIJ+env1ZpbT+UMR\\r\\nqc7OEImRZ\\/0O\\/IrkIsnOYPfsYqFrP7NwgDnrrR2qwQKBgQD86Y1YdONVD5tx9kgP\\r\\nJhY+LjUvXnIOXyTSCljXPqTFS\\/aBHxftb6UdFluuXSg8xKAqtaKHpH7Y0TcVqax7\\r\\n9OCyFhK1rMNJKfAAZ15iTLpmu815xn28iVamIoSRyud+CggcsmtqMD6pPcMVOkj+\\r\\ndAhTRNkVGYx9A4ZsNpiTT+IR4QKBgQDbLlZSgVIFs6emrTu2y6nqZWluFEBEVEvO\\r\\nIMgVM1swhOest7nSozjEUeRA3qKKqN7mQ5b\\/qd8lAs3DBosT9kyTo\\/ZxIE3CUB\\/b\\r\\ndKakeW\\/3MT4UeFGAxqYOjJuIIl7FBz8IDf6PJ2D5\\/Vg5gAQ0NBsk41dHS0TRNm4I\\r\\nIRi2\\/HSfjwKBgQDAe6fdiKhz1nsB0uSo0t3e2SAVOxYnJfZJ\\/SH8P2r71YJ4Zwe4\\r\\n512Ms7V3EONMzIDxwGdAQMthjGkWDZp+hLJ2FyKKLkA6cLZ+OC23NpovEgOiCJUt\\r\\nZoER0\\/d9ViW04UGnRYtGuA0YlS7h+wgO0JR9e0qUKmunwYUO2sZoZ0WxQQKBgGKK\\r\\n1cKoY9EucazNa\\/CGZrF8wMb+Edrmr2JQeMSXX2NUDbkorUIXolkZnG7R6fA\\/dl++\\r\\nebAelrXUKeCKG5NxBALJD+7SoENBtOD89EM0WfOgTxHy+mnUZipaaz7sfQFGfb9I\\r\\nU2\\/XO5GJptXLSZiS6LVQBRiHrbwGJbg\\/8RWsMV7fAoGBAKPiqzPbAs3T1YjQmZK7\\r\\nbBPy5vO\\/1CVoU59iVp3mnX\\/mUeHItnZAIvASEXG80uhIHTN8WJHVlKNQymjpHBNZ\\r\\nKwyKSQYiqcimmBeB5MTBvekzDwrJ2JJvh14OMYOj3QlmELJly83NqAp\\/Yda1Sznf\\r\\nwW5s2g+zjcxN95YjykC++Oxv\\r\\n-----END PRIVATE KEY-----\",\"wx_rsa_path\":\"\"}', '1595296451', '1595296451');
COMMIT;

-- ----------------------------
--  Table structure for `ky_upload_1`
-- ----------------------------
DROP TABLE IF EXISTS `ky_upload_1`;
CREATE TABLE `ky_upload_1` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '图片原名',
  `original_name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件原始名称',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '访问url',
  `ext` char(4) NOT NULL DEFAULT '',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '大小',
  `location` varchar(50) NOT NULL DEFAULT 'Local' COMMENT '驱动',
  `create_time` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5值',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件sha1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ky_upload_1`
-- ----------------------------
BEGIN;
INSERT INTO `ky_upload_1` VALUES ('1', '1', '1-5ecd56c6e5929.jpg', '11.jpg', 'http://devhhb.images.huihuiba.net/1-5ecd56c6e5929.jpg', 'http://devhhb.images.huihuiba.net/1-5ecd56c6e5929.jpg', 'jpg', '15687', 'Qiniu', '1590515399', '1590515399', '1', 'cbe016efeadffe8a4b819f95f6d7b3ad', 'ee852572695da71d1e0215d064ae29762b20acb9'), ('2', '1', '1-5ecd5720d7058.png', '背景.png', 'http://devhhb.images.huihuiba.net/1-5ecd5720d7058.png', 'http://devhhb.images.huihuiba.net/1-5ecd5720d7058.png', 'png', '137491', 'Qiniu', '1590515489', '1590515489', '1', '19ebfbc55ce371f1a3d68785505e31e5', '2ca997c0edca501fb591a6be82b2f2a0b7142f63');
COMMIT;

-- ----------------------------
--  Table structure for `ky_upload_2`
-- ----------------------------
DROP TABLE IF EXISTS `ky_upload_2`;
CREATE TABLE `ky_upload_2` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '图片原名',
  `original_name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件原始名称',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '访问url',
  `ext` char(4) NOT NULL DEFAULT '',
  `size` int(10) NOT NULL DEFAULT '0' COMMENT '大小',
  `location` varchar(50) NOT NULL DEFAULT 'Local' COMMENT '驱动',
  `create_time` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5值',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件sha1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ky_upload_2`
-- ----------------------------
BEGIN;
INSERT INTO `ky_upload_2` VALUES ('6', '1', '1-5ece208768287.jpg', 'Vue.jpg', './public/uploads/image/2020-05-27/1-5ece208768287.jpg', '/public/uploads/image/2020-05-27/1-5ece208768287.jpg', 'jpg', '5539', 'Local', '1590567047', '1590567047', '1', '035a63d22c22dc86b1f35fbd34b57155', 'd94c2c1a48b48527ec748c64c606a57a729b1581'), ('7', '1', '1-5ece2087777dd.jpg', 'wechat.jpg', './public/uploads/image/2020-05-27/1-5ece2087777dd.jpg', '/public/uploads/image/2020-05-27/1-5ece2087777dd.jpg', 'jpg', '8440', 'Local', '1590567047', '1590567047', '1', '4d86742fdd3e01d9881c61b4ba659134', '1f272f28a7102481c9b0f613864d8478812c6722'), ('8', '1', '1-5ece7c72a8f5f.png', 'wechat.png', 'http://devhhb.images.huihuiba.net/1-5ece7c72a8f5f.png', 'http://devhhb.images.huihuiba.net/1-5ece7c72a8f5f.png', 'png', '222143', 'Qiniu', '1590590579', '1590590579', '1', '85f24c89bcf394dfca8a9cce426c53b2', '818dc8098b309a240cd03795271aa96efb55147b'), ('9', '1', '1-5ed5f65807802.jpg', 'logo.jpg', 'http://devhhb.images.huihuiba.net/1-5ed5f65807802.jpg', 'http://devhhb.images.huihuiba.net/1-5ed5f65807802.jpg', 'jpg', '261242', 'Qiniu', '1591080537', '1591080537', '1', 'a1c517618f054d66b082f0b343f9410d', '06df1752c0515161f9f991b7ef2c507d8385130b'), ('10', '1', '1-5ed5f6b7e9d06.jpg', 'fdj-sm.jpg', 'http://devhhb.images.huihuiba.net/1-5ed5f6b7e9d06.jpg', 'http://devhhb.images.huihuiba.net/1-5ed5f6b7e9d06.jpg', 'jpg', '107027', 'Qiniu', '1591080632', '1591080632', '1', '77bb5769aba4bb70af1b57eb45c7c93e', '8682aea9a038a12539b5075a99bc87c5f350d956');
COMMIT;

-- ----------------------------
--  Table structure for `ky_upload_3`
-- ----------------------------
DROP TABLE IF EXISTS `ky_upload_3`;
CREATE TABLE `ky_upload_3` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '图片原名',
  `original_name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件原始名称',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '访问url',
  `ext` char(4) NOT NULL DEFAULT '',
  `size` int(10) NOT NULL DEFAULT '0' COMMENT '大小',
  `location` varchar(50) NOT NULL DEFAULT 'Local' COMMENT '驱动',
  `create_time` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5值',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件sha1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ky_upload_4`
-- ----------------------------
DROP TABLE IF EXISTS `ky_upload_4`;
CREATE TABLE `ky_upload_4` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '图片原名',
  `original_name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件原始名称',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '访问url',
  `ext` char(4) NOT NULL DEFAULT '',
  `size` int(10) NOT NULL DEFAULT '0' COMMENT '大小',
  `location` varchar(50) NOT NULL DEFAULT 'Local' COMMENT '驱动',
  `create_time` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5值',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件sha1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ky_upload_5`
-- ----------------------------
DROP TABLE IF EXISTS `ky_upload_5`;
CREATE TABLE `ky_upload_5` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '图片原名',
  `original_name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件原始名称',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '访问url',
  `ext` char(4) NOT NULL DEFAULT '',
  `size` int(10) NOT NULL DEFAULT '0' COMMENT '大小',
  `location` varchar(50) NOT NULL DEFAULT 'Local' COMMENT '驱动',
  `create_time` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5值',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件sha1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
