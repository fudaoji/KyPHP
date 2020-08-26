/*
Navicat MySQL Data Transfer

Source Server         : dev
Source Server Version : 50620
Source Host           : 10.105.19.27:3306
Source Database       : kyphp

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2020-08-26 14:59:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ky_addons
-- ----------------------------
DROP TABLE IF EXISTS `ky_addons`;
CREATE TABLE `ky_addons` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(50) NOT NULL COMMENT '插件名称',
  `addon` varchar(50) NOT NULL COMMENT '标识名',
  `desc` varchar(200) NOT NULL DEFAULT '' COMMENT '简介',
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
  `demo_qrcode` varchar(255) NOT NULL DEFAULT '' COMMENT 'demo链接二维码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `addon` (`addon`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='应用表';

-- ----------------------------
-- Records of ky_addons
-- ----------------------------
INSERT INTO `ky_addons` VALUES ('10', '应用demo', 'demo', '这是一款应用demo，基础的文章功能', '1.0', '苟哥', '/addons/demo/logo.png', '[{\"name\":\"title\",\"title\":\"\\u535a\\u5ba2\\u540d\\u79f0\",\"type\":\"text\",\"value\":\"\",\"placeholder\":\"\\u4e0d\\u8d85\\u8fc710\\u4e2a\\u5b57\",\"tip\":\"\",\"extra_attr\":\"required\"},{\"name\":\"wx_auth_open\",\"title\":\"\\u5f00\\u542f\\u7f51\\u9875\\u6388\\u6743\",\"type\":\"radio\",\"options\":[\"\\u5173\\u95ed\",\"\\u5f00\\u542f\"],\"placeholder\":\"\",\"tip\":\"\",\"extra_attr\":\"required\"}]', 'demo/wap/index/index', '', '1', '1', '1593686667', '1593686667', 'mp', '');
INSERT INTO `ky_addons` VALUES ('11', '小程序应用demo', 'mini_demo', '这是一款小程序应用demo', '2.0', '苟哥', '/addons/mini_demo/logo.png', '[{\"name\":\"title\",\"title\":\"\\u914d\\u7f6e\\u6d4b\\u8bd5\",\"type\":\"text\",\"value\":\"\",\"placeholder\":\"\\u4e0d\\u8d85\\u8fc710\\u4e2a\\u5b57\",\"tip\":\"\",\"extra_attr\":\"required\"}]', '/pages/index/index', '', '1', '1', '1595663351', '1595683418', 'mini', '');
INSERT INTO `ky_addons` VALUES ('12', '享约茶', 'gxtea', '共享查实小程序', '1.0', '苟哥', '/addons/gxtea/logo.png', '[{\"name\":\"app_key\",\"title\":\"\\u63a5\\u53e3\\u52a0\\u5bc6key\",\"type\":\"text\",\"value\":\"9eT8gFN2J1efa5e8fadfegas1DDewrqw\",\"placeholder\":\"\\u5efa\\u8bae20\\u523064\\u4f4d\\u957f\\u5ea6\",\"tip\":\"\",\"extra_attr\":\"required\"}]', '/pages/index/index', '', '1', '1', '1595988383', '1595988706', 'mini', '');

-- ----------------------------
-- Table structure for ky_addons_cate
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='应用分类表';

-- ----------------------------
-- Records of ky_addons_cate
-- ----------------------------
INSERT INTO `ky_addons_cate` VALUES ('1', '涨粉', '2', '1594997635', '1594998035', '1');
INSERT INTO `ky_addons_cate` VALUES ('2', '营销', '3', '1594997967', '1594998035', '1');
INSERT INTO `ky_addons_cate` VALUES ('3', '商城', '0', '1594997977', '1594998035', '1');
INSERT INTO `ky_addons_cate` VALUES ('4', '游戏', '10', '1594997996', '1594998035', '1');
INSERT INTO `ky_addons_cate` VALUES ('5', '节日', '5', '1594998006', '1594998035', '1');
INSERT INTO `ky_addons_cate` VALUES ('6', '共享', '0', '1597459141', '1597459141', '1');

-- ----------------------------
-- Table structure for ky_addons_info
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
-- Records of ky_addons_info
-- ----------------------------
INSERT INTO `ky_addons_info` VALUES ('10', '<p>应用介绍</p><p>adfadf</p><p>到发疯</p><p>阿道夫<img src=\"http://devhhb.images.huihuiba.net/1-5ed603542b0f4.jpg\" alt=\"1-5ed603542b0f4.jpg\"/></p>', '4', '112', '0.01', '0.00', '涨粉,营销,商城', 'http://devhhb.images.huihuiba.net/1-5f1582f10db72.jpg,http://devhhb.images.huihuiba.net/1-5f1582f0b24e6.jpg');
INSERT INTO `ky_addons_info` VALUES ('11', '<p>详细介绍小程序介绍</p>', '2', '103', '0.00', '398.00', '营销', 'http://devhhb.images.huihuiba.net/1-5f1582f10db72.jpg,http://devhhb.images.huihuiba.net/1-5f1582f0b24e6.jpg');
INSERT INTO `ky_addons_info` VALUES ('12', '<p>详细介绍</p>', '2', '22', '0.00', '0.00', '营销,共享', 'http://devhhb.images.huihuiba.net/1-5f1582f10db72.jpg,http://devhhb.images.huihuiba.net/1-5f1582f0b24e6.jpg');

-- ----------------------------
-- Table structure for ky_addons_template
-- ----------------------------
DROP TABLE IF EXISTS `ky_addons_template`;
CREATE TABLE `ky_addons_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `addon` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '应用标识',
  `template_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模板id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `addon` (`addon`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='小程序应用对应的模板id';

-- ----------------------------
-- Records of ky_addons_template
-- ----------------------------
INSERT INTO `ky_addons_template` VALUES ('1', 'mini_demo', '1');
INSERT INTO `ky_addons_template` VALUES ('2', 'gxtea', '1');

-- ----------------------------
-- Table structure for ky_admin
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
-- Records of ky_admin
-- ----------------------------
INSERT INTO `ky_admin` VALUES ('1', 'admin', '$2y$10$8e/WKStcGxWexB/kfmbQre6uCtMRjpXZB4RH4u70ZKfkScIx.kfCy', '461960962@qq.com', '15659827559', '0', '1598405327', '1', '1', '傅道集', '1598405327', '106.122.215.248', '0');
INSERT INTO `ky_admin` VALUES ('2', 'test1', '$2y$10$lSnmo7isc6Y7X1trZ/YeH.WirmUAC3TG8JpEkloRODCO1nHXYFnFm', '', '15659827559', '1590227330', '1596812118', '1', '2', '张三', '1596812118', '211.97.130.225', '1');
INSERT INTO `ky_admin` VALUES ('3', 'test2', '$2y$10$VI/NBVVik3YRAjnrZIgAQeKZ2rKJtY01mGnRwLQ1Saoy956vwOVXC', '', '', '1594977794', '1594977794', '1', '2', '', '1594977794', '106.122.215.27', '0');
INSERT INTO `ky_admin` VALUES ('4', 'test3', '$2y$10$//5v/B9XdvlS5pIgEjZ2Juw9I.RN82BLE652b50evmjxIwFzYv.U6', '', '', '1594978590', '1594978876', '1', '2', 'test3', '1594978876', '106.122.215.27', '0');

-- ----------------------------
-- Table structure for ky_admin_addon
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户-应用关联表';

-- ----------------------------
-- Records of ky_admin_addon
-- ----------------------------
INSERT INTO `ky_admin_addon` VALUES ('1', '2', 'demo', '1595692800', '1', '1594814243', '1594816271');
INSERT INTO `ky_admin_addon` VALUES ('3', '1', 'demo', '1689914356', '1', '1594817469', '1595312686');
INSERT INTO `ky_admin_addon` VALUES ('5', '1', 'mini_demo', '1627309992', '1', '1595773992', '1595773992');
INSERT INTO `ky_admin_addon` VALUES ('6', '1', 'gxtea', '1659060859', '1', '1595988859', '1596007212');

-- ----------------------------
-- Table structure for ky_admin_group
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
-- Records of ky_admin_group
-- ----------------------------
INSERT INTO `ky_admin_group` VALUES ('1', '管理员', '{\"mp_limit\":\"0\",\"mini_limit\":\"0\"}', '1,13,14,15,47,17,18,16,68,19,20,43,80,21,22,72,52,84,53,2,25,83,26,51,45,56,74,73,77,67,69,81,57', '1', '0', '1594302168', '1594302168');
INSERT INTO `ky_admin_group` VALUES ('2', '游客', '{\"mp_limit\":\"1\",\"mini_limit\":\"1\"}', '1,13,14,15,47,17,18,16,68,19,20,43,61,64,46,62,63,80,21,22,72,93,94,100,101,52,84', '1', '0', '1594303678', '1595341786');
INSERT INTO `ky_admin_group` VALUES ('3', ' 青铜会员', '{\"mp_limit\":\"0\",\"mini_limit\":\"0\"}', '1,13,14,15,47,17,18,16,68,19,20,43,96,61,64,46,62,63,80,21,22,72,93,94,52,84', '1', '0', '1595340975', '1595340975');

-- ----------------------------
-- Table structure for ky_admin_store
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='用户店铺';

-- ----------------------------
-- Records of ky_admin_store
-- ----------------------------
INSERT INTO `ky_admin_store` VALUES ('1', '1', 'mp', '1', '0', '0');
INSERT INTO `ky_admin_store` VALUES ('2', '2', 'mp', '0', '1590592849', '1590593695');
INSERT INTO `ky_admin_store` VALUES ('3', '1', 'mp', '1', '0', '0');
INSERT INTO `ky_admin_store` VALUES ('10', '1', 'mini', '1', '1595557998', '1595557998');
INSERT INTO `ky_admin_store` VALUES ('11', '1', 'mini', '1', '1596536174', '1596786901');
INSERT INTO `ky_admin_store` VALUES ('12', '0', 'mp', '1', '1597328829', '1597328829');

-- ----------------------------
-- Table structure for ky_demo_article
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
-- Records of ky_demo_article
-- ----------------------------
INSERT INTO `ky_demo_article` VALUES ('1', '文章1', '打发斯蒂芬', '是打发撒的发生的发打算', '3', '1', '1593686937', '1598258695');

-- ----------------------------
-- Table structure for ky_demo_order
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
-- Records of ky_demo_order
-- ----------------------------

-- ----------------------------
-- Table structure for ky_district
-- ----------------------------
DROP TABLE IF EXISTS `ky_district`;
CREATE TABLE `ky_district` (
  `id` int(10) unsigned NOT NULL,
  `title` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '名称',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ky_district
-- ----------------------------
INSERT INTO `ky_district` VALUES ('110000', '北京', '0');
INSERT INTO `ky_district` VALUES ('110100', '北京市', '110000');
INSERT INTO `ky_district` VALUES ('110101', '东城区', '110100');
INSERT INTO `ky_district` VALUES ('110102', '西城区', '110100');
INSERT INTO `ky_district` VALUES ('110105', '朝阳区', '110100');
INSERT INTO `ky_district` VALUES ('110106', '丰台区', '110100');
INSERT INTO `ky_district` VALUES ('110107', '石景山区', '110100');
INSERT INTO `ky_district` VALUES ('110108', '海淀区', '110100');
INSERT INTO `ky_district` VALUES ('110109', '门头沟区', '110100');
INSERT INTO `ky_district` VALUES ('110111', '房山区', '110100');
INSERT INTO `ky_district` VALUES ('110112', '通州区', '110100');
INSERT INTO `ky_district` VALUES ('110113', '顺义区', '110100');
INSERT INTO `ky_district` VALUES ('110114', '昌平区', '110100');
INSERT INTO `ky_district` VALUES ('110115', '大兴区', '110100');
INSERT INTO `ky_district` VALUES ('110116', '怀柔区', '110100');
INSERT INTO `ky_district` VALUES ('110117', '平谷区', '110100');
INSERT INTO `ky_district` VALUES ('110228', '密云县', '110100');
INSERT INTO `ky_district` VALUES ('110229', '延庆县', '110100');
INSERT INTO `ky_district` VALUES ('120000', '天津', '0');
INSERT INTO `ky_district` VALUES ('120100', '天津市', '120000');
INSERT INTO `ky_district` VALUES ('120101', '和平区', '120100');
INSERT INTO `ky_district` VALUES ('120102', '河东区', '120100');
INSERT INTO `ky_district` VALUES ('120103', '河西区', '120100');
INSERT INTO `ky_district` VALUES ('120104', '南开区', '120100');
INSERT INTO `ky_district` VALUES ('120105', '河北区', '120100');
INSERT INTO `ky_district` VALUES ('120106', '红桥区', '120100');
INSERT INTO `ky_district` VALUES ('120110', '东丽区', '120100');
INSERT INTO `ky_district` VALUES ('120111', '西青区', '120100');
INSERT INTO `ky_district` VALUES ('120112', '津南区', '120100');
INSERT INTO `ky_district` VALUES ('120113', '北辰区', '120100');
INSERT INTO `ky_district` VALUES ('120114', '武清区', '120100');
INSERT INTO `ky_district` VALUES ('120115', '宝坻区', '120100');
INSERT INTO `ky_district` VALUES ('120116', '滨海新区', '120100');
INSERT INTO `ky_district` VALUES ('120221', '宁河县', '120100');
INSERT INTO `ky_district` VALUES ('120223', '静海县', '120100');
INSERT INTO `ky_district` VALUES ('120225', '蓟县', '120100');
INSERT INTO `ky_district` VALUES ('130000', '河北省', '0');
INSERT INTO `ky_district` VALUES ('130100', '石家庄市', '130000');
INSERT INTO `ky_district` VALUES ('130101', '市辖区', '130100');
INSERT INTO `ky_district` VALUES ('130102', '长安区', '130100');
INSERT INTO `ky_district` VALUES ('130104', '桥西区', '130100');
INSERT INTO `ky_district` VALUES ('130105', '新华区', '130100');
INSERT INTO `ky_district` VALUES ('130107', '井陉矿区', '130100');
INSERT INTO `ky_district` VALUES ('130108', '裕华区', '130100');
INSERT INTO `ky_district` VALUES ('130109', '藁城区', '130100');
INSERT INTO `ky_district` VALUES ('130110', '鹿泉区', '130100');
INSERT INTO `ky_district` VALUES ('130111', '栾城区', '130100');
INSERT INTO `ky_district` VALUES ('130121', '井陉县', '130100');
INSERT INTO `ky_district` VALUES ('130123', '正定县', '130100');
INSERT INTO `ky_district` VALUES ('130125', '行唐县', '130100');
INSERT INTO `ky_district` VALUES ('130126', '灵寿县', '130100');
INSERT INTO `ky_district` VALUES ('130127', '高邑县', '130100');
INSERT INTO `ky_district` VALUES ('130128', '深泽县', '130100');
INSERT INTO `ky_district` VALUES ('130129', '赞皇县', '130100');
INSERT INTO `ky_district` VALUES ('130130', '无极县', '130100');
INSERT INTO `ky_district` VALUES ('130131', '平山县', '130100');
INSERT INTO `ky_district` VALUES ('130132', '元氏县', '130100');
INSERT INTO `ky_district` VALUES ('130133', '赵县', '130100');
INSERT INTO `ky_district` VALUES ('130181', '辛集市', '130100');
INSERT INTO `ky_district` VALUES ('130183', '晋州市', '130100');
INSERT INTO `ky_district` VALUES ('130184', '新乐市', '130100');
INSERT INTO `ky_district` VALUES ('130200', '唐山市', '130000');
INSERT INTO `ky_district` VALUES ('130201', '市辖区', '130200');
INSERT INTO `ky_district` VALUES ('130202', '路南区', '130200');
INSERT INTO `ky_district` VALUES ('130203', '路北区', '130200');
INSERT INTO `ky_district` VALUES ('130204', '古冶区', '130200');
INSERT INTO `ky_district` VALUES ('130205', '开平区', '130200');
INSERT INTO `ky_district` VALUES ('130207', '丰南区', '130200');
INSERT INTO `ky_district` VALUES ('130208', '丰润区', '130200');
INSERT INTO `ky_district` VALUES ('130209', '曹妃甸区', '130200');
INSERT INTO `ky_district` VALUES ('130223', '滦县', '130200');
INSERT INTO `ky_district` VALUES ('130224', '滦南县', '130200');
INSERT INTO `ky_district` VALUES ('130225', '乐亭县', '130200');
INSERT INTO `ky_district` VALUES ('130227', '迁西县', '130200');
INSERT INTO `ky_district` VALUES ('130229', '玉田县', '130200');
INSERT INTO `ky_district` VALUES ('130281', '遵化市', '130200');
INSERT INTO `ky_district` VALUES ('130283', '迁安市', '130200');
INSERT INTO `ky_district` VALUES ('130300', '秦皇岛市', '130000');
INSERT INTO `ky_district` VALUES ('130301', '市辖区', '130300');
INSERT INTO `ky_district` VALUES ('130302', '海港区', '130300');
INSERT INTO `ky_district` VALUES ('130303', '山海关区', '130300');
INSERT INTO `ky_district` VALUES ('130304', '北戴河区', '130300');
INSERT INTO `ky_district` VALUES ('130321', '青龙满族自治县', '130300');
INSERT INTO `ky_district` VALUES ('130322', '昌黎县', '130300');
INSERT INTO `ky_district` VALUES ('130323', '抚宁县', '130300');
INSERT INTO `ky_district` VALUES ('130324', '卢龙县', '130300');
INSERT INTO `ky_district` VALUES ('130400', '邯郸市', '130000');
INSERT INTO `ky_district` VALUES ('130401', '市辖区', '130400');
INSERT INTO `ky_district` VALUES ('130402', '邯山区', '130400');
INSERT INTO `ky_district` VALUES ('130403', '丛台区', '130400');
INSERT INTO `ky_district` VALUES ('130404', '复兴区', '130400');
INSERT INTO `ky_district` VALUES ('130406', '峰峰矿区', '130400');
INSERT INTO `ky_district` VALUES ('130421', '邯郸县', '130400');
INSERT INTO `ky_district` VALUES ('130423', '临漳县', '130400');
INSERT INTO `ky_district` VALUES ('130424', '成安县', '130400');
INSERT INTO `ky_district` VALUES ('130425', '大名县', '130400');
INSERT INTO `ky_district` VALUES ('130426', '涉县', '130400');
INSERT INTO `ky_district` VALUES ('130427', '磁县', '130400');
INSERT INTO `ky_district` VALUES ('130428', '肥乡县', '130400');
INSERT INTO `ky_district` VALUES ('130429', '永年县', '130400');
INSERT INTO `ky_district` VALUES ('130430', '邱县', '130400');
INSERT INTO `ky_district` VALUES ('130431', '鸡泽县', '130400');
INSERT INTO `ky_district` VALUES ('130432', '广平县', '130400');
INSERT INTO `ky_district` VALUES ('130433', '馆陶县', '130400');
INSERT INTO `ky_district` VALUES ('130434', '魏县', '130400');
INSERT INTO `ky_district` VALUES ('130435', '曲周县', '130400');
INSERT INTO `ky_district` VALUES ('130481', '武安市', '130400');
INSERT INTO `ky_district` VALUES ('130500', '邢台市', '130000');
INSERT INTO `ky_district` VALUES ('130501', '市辖区', '130500');
INSERT INTO `ky_district` VALUES ('130502', '桥东区', '130500');
INSERT INTO `ky_district` VALUES ('130503', '桥西区', '130500');
INSERT INTO `ky_district` VALUES ('130521', '邢台县', '130500');
INSERT INTO `ky_district` VALUES ('130522', '临城县', '130500');
INSERT INTO `ky_district` VALUES ('130523', '内丘县', '130500');
INSERT INTO `ky_district` VALUES ('130524', '柏乡县', '130500');
INSERT INTO `ky_district` VALUES ('130525', '隆尧县', '130500');
INSERT INTO `ky_district` VALUES ('130526', '任县', '130500');
INSERT INTO `ky_district` VALUES ('130527', '南和县', '130500');
INSERT INTO `ky_district` VALUES ('130528', '宁晋县', '130500');
INSERT INTO `ky_district` VALUES ('130529', '巨鹿县', '130500');
INSERT INTO `ky_district` VALUES ('130530', '新河县', '130500');
INSERT INTO `ky_district` VALUES ('130531', '广宗县', '130500');
INSERT INTO `ky_district` VALUES ('130532', '平乡县', '130500');
INSERT INTO `ky_district` VALUES ('130533', '威县', '130500');
INSERT INTO `ky_district` VALUES ('130534', '清河县', '130500');
INSERT INTO `ky_district` VALUES ('130535', '临西县', '130500');
INSERT INTO `ky_district` VALUES ('130581', '南宫市', '130500');
INSERT INTO `ky_district` VALUES ('130582', '沙河市', '130500');
INSERT INTO `ky_district` VALUES ('130600', '保定市', '130000');
INSERT INTO `ky_district` VALUES ('130601', '市辖区', '130600');
INSERT INTO `ky_district` VALUES ('130602', '新市区', '130600');
INSERT INTO `ky_district` VALUES ('130603', '北市区', '130600');
INSERT INTO `ky_district` VALUES ('130604', '南市区', '130600');
INSERT INTO `ky_district` VALUES ('130621', '满城县', '130600');
INSERT INTO `ky_district` VALUES ('130622', '清苑县', '130600');
INSERT INTO `ky_district` VALUES ('130623', '涞水县', '130600');
INSERT INTO `ky_district` VALUES ('130624', '阜平县', '130600');
INSERT INTO `ky_district` VALUES ('130625', '徐水县', '130600');
INSERT INTO `ky_district` VALUES ('130626', '定兴县', '130600');
INSERT INTO `ky_district` VALUES ('130627', '唐县', '130600');
INSERT INTO `ky_district` VALUES ('130628', '高阳县', '130600');
INSERT INTO `ky_district` VALUES ('130629', '容城县', '130600');
INSERT INTO `ky_district` VALUES ('130630', '涞源县', '130600');
INSERT INTO `ky_district` VALUES ('130631', '望都县', '130600');
INSERT INTO `ky_district` VALUES ('130632', '安新县', '130600');
INSERT INTO `ky_district` VALUES ('130633', '易县', '130600');
INSERT INTO `ky_district` VALUES ('130634', '曲阳县', '130600');
INSERT INTO `ky_district` VALUES ('130635', '蠡县', '130600');
INSERT INTO `ky_district` VALUES ('130636', '顺平县', '130600');
INSERT INTO `ky_district` VALUES ('130637', '博野县', '130600');
INSERT INTO `ky_district` VALUES ('130638', '雄县', '130600');
INSERT INTO `ky_district` VALUES ('130681', '涿州市', '130600');
INSERT INTO `ky_district` VALUES ('130682', '定州市', '130600');
INSERT INTO `ky_district` VALUES ('130683', '安国市', '130600');
INSERT INTO `ky_district` VALUES ('130684', '高碑店市', '130600');
INSERT INTO `ky_district` VALUES ('130700', '张家口市', '130000');
INSERT INTO `ky_district` VALUES ('130701', '市辖区', '130700');
INSERT INTO `ky_district` VALUES ('130702', '桥东区', '130700');
INSERT INTO `ky_district` VALUES ('130703', '桥西区', '130700');
INSERT INTO `ky_district` VALUES ('130705', '宣化区', '130700');
INSERT INTO `ky_district` VALUES ('130706', '下花园区', '130700');
INSERT INTO `ky_district` VALUES ('130721', '宣化县', '130700');
INSERT INTO `ky_district` VALUES ('130722', '张北县', '130700');
INSERT INTO `ky_district` VALUES ('130723', '康保县', '130700');
INSERT INTO `ky_district` VALUES ('130724', '沽源县', '130700');
INSERT INTO `ky_district` VALUES ('130725', '尚义县', '130700');
INSERT INTO `ky_district` VALUES ('130726', '蔚县', '130700');
INSERT INTO `ky_district` VALUES ('130727', '阳原县', '130700');
INSERT INTO `ky_district` VALUES ('130728', '怀安县', '130700');
INSERT INTO `ky_district` VALUES ('130729', '万全县', '130700');
INSERT INTO `ky_district` VALUES ('130730', '怀来县', '130700');
INSERT INTO `ky_district` VALUES ('130731', '涿鹿县', '130700');
INSERT INTO `ky_district` VALUES ('130732', '赤城县', '130700');
INSERT INTO `ky_district` VALUES ('130733', '崇礼县', '130700');
INSERT INTO `ky_district` VALUES ('130800', '承德市', '130000');
INSERT INTO `ky_district` VALUES ('130801', '市辖区', '130800');
INSERT INTO `ky_district` VALUES ('130802', '双桥区', '130800');
INSERT INTO `ky_district` VALUES ('130803', '双滦区', '130800');
INSERT INTO `ky_district` VALUES ('130804', '鹰手营子矿区', '130800');
INSERT INTO `ky_district` VALUES ('130821', '承德县', '130800');
INSERT INTO `ky_district` VALUES ('130822', '兴隆县', '130800');
INSERT INTO `ky_district` VALUES ('130823', '平泉县', '130800');
INSERT INTO `ky_district` VALUES ('130824', '滦平县', '130800');
INSERT INTO `ky_district` VALUES ('130825', '隆化县', '130800');
INSERT INTO `ky_district` VALUES ('130826', '丰宁满族自治县', '130800');
INSERT INTO `ky_district` VALUES ('130827', '宽城满族自治县', '130800');
INSERT INTO `ky_district` VALUES ('130828', '围场满族蒙古族自治县', '130800');
INSERT INTO `ky_district` VALUES ('130900', '沧州市', '130000');
INSERT INTO `ky_district` VALUES ('130901', '市辖区', '130900');
INSERT INTO `ky_district` VALUES ('130902', '新华区', '130900');
INSERT INTO `ky_district` VALUES ('130903', '运河区', '130900');
INSERT INTO `ky_district` VALUES ('130921', '沧县', '130900');
INSERT INTO `ky_district` VALUES ('130922', '青县', '130900');
INSERT INTO `ky_district` VALUES ('130923', '东光县', '130900');
INSERT INTO `ky_district` VALUES ('130924', '海兴县', '130900');
INSERT INTO `ky_district` VALUES ('130925', '盐山县', '130900');
INSERT INTO `ky_district` VALUES ('130926', '肃宁县', '130900');
INSERT INTO `ky_district` VALUES ('130927', '南皮县', '130900');
INSERT INTO `ky_district` VALUES ('130928', '吴桥县', '130900');
INSERT INTO `ky_district` VALUES ('130929', '献县', '130900');
INSERT INTO `ky_district` VALUES ('130930', '孟村回族自治县', '130900');
INSERT INTO `ky_district` VALUES ('130981', '泊头市', '130900');
INSERT INTO `ky_district` VALUES ('130982', '任丘市', '130900');
INSERT INTO `ky_district` VALUES ('130983', '黄骅市', '130900');
INSERT INTO `ky_district` VALUES ('130984', '河间市', '130900');
INSERT INTO `ky_district` VALUES ('131000', '廊坊市', '130000');
INSERT INTO `ky_district` VALUES ('131001', '市辖区', '131000');
INSERT INTO `ky_district` VALUES ('131002', '安次区', '131000');
INSERT INTO `ky_district` VALUES ('131003', '广阳区', '131000');
INSERT INTO `ky_district` VALUES ('131022', '固安县', '131000');
INSERT INTO `ky_district` VALUES ('131023', '永清县', '131000');
INSERT INTO `ky_district` VALUES ('131024', '香河县', '131000');
INSERT INTO `ky_district` VALUES ('131025', '大城县', '131000');
INSERT INTO `ky_district` VALUES ('131026', '文安县', '131000');
INSERT INTO `ky_district` VALUES ('131028', '大厂回族自治县', '131000');
INSERT INTO `ky_district` VALUES ('131081', '霸州市', '131000');
INSERT INTO `ky_district` VALUES ('131082', '三河市', '131000');
INSERT INTO `ky_district` VALUES ('131100', '衡水市', '130000');
INSERT INTO `ky_district` VALUES ('131101', '市辖区', '131100');
INSERT INTO `ky_district` VALUES ('131102', '桃城区', '131100');
INSERT INTO `ky_district` VALUES ('131121', '枣强县', '131100');
INSERT INTO `ky_district` VALUES ('131122', '武邑县', '131100');
INSERT INTO `ky_district` VALUES ('131123', '武强县', '131100');
INSERT INTO `ky_district` VALUES ('131124', '饶阳县', '131100');
INSERT INTO `ky_district` VALUES ('131125', '安平县', '131100');
INSERT INTO `ky_district` VALUES ('131126', '故城县', '131100');
INSERT INTO `ky_district` VALUES ('131127', '景县', '131100');
INSERT INTO `ky_district` VALUES ('131128', '阜城县', '131100');
INSERT INTO `ky_district` VALUES ('131181', '冀州市', '131100');
INSERT INTO `ky_district` VALUES ('131182', '深州市', '131100');
INSERT INTO `ky_district` VALUES ('140000', '山西省', '0');
INSERT INTO `ky_district` VALUES ('140100', '太原市', '140000');
INSERT INTO `ky_district` VALUES ('140101', '市辖区', '140100');
INSERT INTO `ky_district` VALUES ('140105', '小店区', '140100');
INSERT INTO `ky_district` VALUES ('140106', '迎泽区', '140100');
INSERT INTO `ky_district` VALUES ('140107', '杏花岭区', '140100');
INSERT INTO `ky_district` VALUES ('140108', '尖草坪区', '140100');
INSERT INTO `ky_district` VALUES ('140109', '万柏林区', '140100');
INSERT INTO `ky_district` VALUES ('140110', '晋源区', '140100');
INSERT INTO `ky_district` VALUES ('140121', '清徐县', '140100');
INSERT INTO `ky_district` VALUES ('140122', '阳曲县', '140100');
INSERT INTO `ky_district` VALUES ('140123', '娄烦县', '140100');
INSERT INTO `ky_district` VALUES ('140181', '古交市', '140100');
INSERT INTO `ky_district` VALUES ('140200', '大同市', '140000');
INSERT INTO `ky_district` VALUES ('140201', '市辖区', '140200');
INSERT INTO `ky_district` VALUES ('140202', '城区', '140200');
INSERT INTO `ky_district` VALUES ('140203', '矿区', '140200');
INSERT INTO `ky_district` VALUES ('140211', '南郊区', '140200');
INSERT INTO `ky_district` VALUES ('140212', '新荣区', '140200');
INSERT INTO `ky_district` VALUES ('140221', '阳高县', '140200');
INSERT INTO `ky_district` VALUES ('140222', '天镇县', '140200');
INSERT INTO `ky_district` VALUES ('140223', '广灵县', '140200');
INSERT INTO `ky_district` VALUES ('140224', '灵丘县', '140200');
INSERT INTO `ky_district` VALUES ('140225', '浑源县', '140200');
INSERT INTO `ky_district` VALUES ('140226', '左云县', '140200');
INSERT INTO `ky_district` VALUES ('140227', '大同县', '140200');
INSERT INTO `ky_district` VALUES ('140300', '阳泉市', '140000');
INSERT INTO `ky_district` VALUES ('140301', '市辖区', '140300');
INSERT INTO `ky_district` VALUES ('140302', '城区', '140300');
INSERT INTO `ky_district` VALUES ('140303', '矿区', '140300');
INSERT INTO `ky_district` VALUES ('140311', '郊区', '140300');
INSERT INTO `ky_district` VALUES ('140321', '平定县', '140300');
INSERT INTO `ky_district` VALUES ('140322', '盂县', '140300');
INSERT INTO `ky_district` VALUES ('140400', '长治市', '140000');
INSERT INTO `ky_district` VALUES ('140401', '市辖区', '140400');
INSERT INTO `ky_district` VALUES ('140402', '城区', '140400');
INSERT INTO `ky_district` VALUES ('140411', '郊区', '140400');
INSERT INTO `ky_district` VALUES ('140421', '长治县', '140400');
INSERT INTO `ky_district` VALUES ('140423', '襄垣县', '140400');
INSERT INTO `ky_district` VALUES ('140424', '屯留县', '140400');
INSERT INTO `ky_district` VALUES ('140425', '平顺县', '140400');
INSERT INTO `ky_district` VALUES ('140426', '黎城县', '140400');
INSERT INTO `ky_district` VALUES ('140427', '壶关县', '140400');
INSERT INTO `ky_district` VALUES ('140428', '长子县', '140400');
INSERT INTO `ky_district` VALUES ('140429', '武乡县', '140400');
INSERT INTO `ky_district` VALUES ('140430', '沁县', '140400');
INSERT INTO `ky_district` VALUES ('140431', '沁源县', '140400');
INSERT INTO `ky_district` VALUES ('140481', '潞城市', '140400');
INSERT INTO `ky_district` VALUES ('140500', '晋城市', '140000');
INSERT INTO `ky_district` VALUES ('140501', '市辖区', '140500');
INSERT INTO `ky_district` VALUES ('140502', '城区', '140500');
INSERT INTO `ky_district` VALUES ('140521', '沁水县', '140500');
INSERT INTO `ky_district` VALUES ('140522', '阳城县', '140500');
INSERT INTO `ky_district` VALUES ('140524', '陵川县', '140500');
INSERT INTO `ky_district` VALUES ('140525', '泽州县', '140500');
INSERT INTO `ky_district` VALUES ('140581', '高平市', '140500');
INSERT INTO `ky_district` VALUES ('140600', '朔州市', '140000');
INSERT INTO `ky_district` VALUES ('140601', '市辖区', '140600');
INSERT INTO `ky_district` VALUES ('140602', '朔城区', '140600');
INSERT INTO `ky_district` VALUES ('140603', '平鲁区', '140600');
INSERT INTO `ky_district` VALUES ('140621', '山阴县', '140600');
INSERT INTO `ky_district` VALUES ('140622', '应县', '140600');
INSERT INTO `ky_district` VALUES ('140623', '右玉县', '140600');
INSERT INTO `ky_district` VALUES ('140624', '怀仁县', '140600');
INSERT INTO `ky_district` VALUES ('140700', '晋中市', '140000');
INSERT INTO `ky_district` VALUES ('140701', '市辖区', '140700');
INSERT INTO `ky_district` VALUES ('140702', '榆次区', '140700');
INSERT INTO `ky_district` VALUES ('140721', '榆社县', '140700');
INSERT INTO `ky_district` VALUES ('140722', '左权县', '140700');
INSERT INTO `ky_district` VALUES ('140723', '和顺县', '140700');
INSERT INTO `ky_district` VALUES ('140724', '昔阳县', '140700');
INSERT INTO `ky_district` VALUES ('140725', '寿阳县', '140700');
INSERT INTO `ky_district` VALUES ('140726', '太谷县', '140700');
INSERT INTO `ky_district` VALUES ('140727', '祁县', '140700');
INSERT INTO `ky_district` VALUES ('140728', '平遥县', '140700');
INSERT INTO `ky_district` VALUES ('140729', '灵石县', '140700');
INSERT INTO `ky_district` VALUES ('140781', '介休市', '140700');
INSERT INTO `ky_district` VALUES ('140800', '运城市', '140000');
INSERT INTO `ky_district` VALUES ('140801', '市辖区', '140800');
INSERT INTO `ky_district` VALUES ('140802', '盐湖区', '140800');
INSERT INTO `ky_district` VALUES ('140821', '临猗县', '140800');
INSERT INTO `ky_district` VALUES ('140822', '万荣县', '140800');
INSERT INTO `ky_district` VALUES ('140823', '闻喜县', '140800');
INSERT INTO `ky_district` VALUES ('140824', '稷山县', '140800');
INSERT INTO `ky_district` VALUES ('140825', '新绛县', '140800');
INSERT INTO `ky_district` VALUES ('140826', '绛县', '140800');
INSERT INTO `ky_district` VALUES ('140827', '垣曲县', '140800');
INSERT INTO `ky_district` VALUES ('140828', '夏县', '140800');
INSERT INTO `ky_district` VALUES ('140829', '平陆县', '140800');
INSERT INTO `ky_district` VALUES ('140830', '芮城县', '140800');
INSERT INTO `ky_district` VALUES ('140881', '永济市', '140800');
INSERT INTO `ky_district` VALUES ('140882', '河津市', '140800');
INSERT INTO `ky_district` VALUES ('140900', '忻州市', '140000');
INSERT INTO `ky_district` VALUES ('140901', '市辖区', '140900');
INSERT INTO `ky_district` VALUES ('140902', '忻府区', '140900');
INSERT INTO `ky_district` VALUES ('140921', '定襄县', '140900');
INSERT INTO `ky_district` VALUES ('140922', '五台县', '140900');
INSERT INTO `ky_district` VALUES ('140923', '代县', '140900');
INSERT INTO `ky_district` VALUES ('140924', '繁峙县', '140900');
INSERT INTO `ky_district` VALUES ('140925', '宁武县', '140900');
INSERT INTO `ky_district` VALUES ('140926', '静乐县', '140900');
INSERT INTO `ky_district` VALUES ('140927', '神池县', '140900');
INSERT INTO `ky_district` VALUES ('140928', '五寨县', '140900');
INSERT INTO `ky_district` VALUES ('140929', '岢岚县', '140900');
INSERT INTO `ky_district` VALUES ('140930', '河曲县', '140900');
INSERT INTO `ky_district` VALUES ('140931', '保德县', '140900');
INSERT INTO `ky_district` VALUES ('140932', '偏关县', '140900');
INSERT INTO `ky_district` VALUES ('140981', '原平市', '140900');
INSERT INTO `ky_district` VALUES ('141000', '临汾市', '140000');
INSERT INTO `ky_district` VALUES ('141001', '市辖区', '141000');
INSERT INTO `ky_district` VALUES ('141002', '尧都区', '141000');
INSERT INTO `ky_district` VALUES ('141021', '曲沃县', '141000');
INSERT INTO `ky_district` VALUES ('141022', '翼城县', '141000');
INSERT INTO `ky_district` VALUES ('141023', '襄汾县', '141000');
INSERT INTO `ky_district` VALUES ('141024', '洪洞县', '141000');
INSERT INTO `ky_district` VALUES ('141025', '古县', '141000');
INSERT INTO `ky_district` VALUES ('141026', '安泽县', '141000');
INSERT INTO `ky_district` VALUES ('141027', '浮山县', '141000');
INSERT INTO `ky_district` VALUES ('141028', '吉县', '141000');
INSERT INTO `ky_district` VALUES ('141029', '乡宁县', '141000');
INSERT INTO `ky_district` VALUES ('141030', '大宁县', '141000');
INSERT INTO `ky_district` VALUES ('141031', '隰县', '141000');
INSERT INTO `ky_district` VALUES ('141032', '永和县', '141000');
INSERT INTO `ky_district` VALUES ('141033', '蒲县', '141000');
INSERT INTO `ky_district` VALUES ('141034', '汾西县', '141000');
INSERT INTO `ky_district` VALUES ('141081', '侯马市', '141000');
INSERT INTO `ky_district` VALUES ('141082', '霍州市', '141000');
INSERT INTO `ky_district` VALUES ('141100', '吕梁市', '140000');
INSERT INTO `ky_district` VALUES ('141101', '市辖区', '141100');
INSERT INTO `ky_district` VALUES ('141102', '离石区', '141100');
INSERT INTO `ky_district` VALUES ('141121', '文水县', '141100');
INSERT INTO `ky_district` VALUES ('141122', '交城县', '141100');
INSERT INTO `ky_district` VALUES ('141123', '兴县', '141100');
INSERT INTO `ky_district` VALUES ('141124', '临县', '141100');
INSERT INTO `ky_district` VALUES ('141125', '柳林县', '141100');
INSERT INTO `ky_district` VALUES ('141126', '石楼县', '141100');
INSERT INTO `ky_district` VALUES ('141127', '岚县', '141100');
INSERT INTO `ky_district` VALUES ('141128', '方山县', '141100');
INSERT INTO `ky_district` VALUES ('141129', '中阳县', '141100');
INSERT INTO `ky_district` VALUES ('141130', '交口县', '141100');
INSERT INTO `ky_district` VALUES ('141181', '孝义市', '141100');
INSERT INTO `ky_district` VALUES ('141182', '汾阳市', '141100');
INSERT INTO `ky_district` VALUES ('150000', '内蒙古自治区', '0');
INSERT INTO `ky_district` VALUES ('150100', '呼和浩特市', '150000');
INSERT INTO `ky_district` VALUES ('150101', '市辖区', '150100');
INSERT INTO `ky_district` VALUES ('150102', '新城区', '150100');
INSERT INTO `ky_district` VALUES ('150103', '回民区', '150100');
INSERT INTO `ky_district` VALUES ('150104', '玉泉区', '150100');
INSERT INTO `ky_district` VALUES ('150105', '赛罕区', '150100');
INSERT INTO `ky_district` VALUES ('150121', '土默特左旗', '150100');
INSERT INTO `ky_district` VALUES ('150122', '托克托县', '150100');
INSERT INTO `ky_district` VALUES ('150123', '和林格尔县', '150100');
INSERT INTO `ky_district` VALUES ('150124', '清水河县', '150100');
INSERT INTO `ky_district` VALUES ('150125', '武川县', '150100');
INSERT INTO `ky_district` VALUES ('150200', '包头市', '150000');
INSERT INTO `ky_district` VALUES ('150201', '市辖区', '150200');
INSERT INTO `ky_district` VALUES ('150202', '东河区', '150200');
INSERT INTO `ky_district` VALUES ('150203', '昆都仑区', '150200');
INSERT INTO `ky_district` VALUES ('150204', '青山区', '150200');
INSERT INTO `ky_district` VALUES ('150205', '石拐区', '150200');
INSERT INTO `ky_district` VALUES ('150206', '白云鄂博矿区', '150200');
INSERT INTO `ky_district` VALUES ('150207', '九原区', '150200');
INSERT INTO `ky_district` VALUES ('150221', '土默特右旗', '150200');
INSERT INTO `ky_district` VALUES ('150222', '固阳县', '150200');
INSERT INTO `ky_district` VALUES ('150223', '达尔罕茂明安联合旗', '150200');
INSERT INTO `ky_district` VALUES ('150300', '乌海市', '150000');
INSERT INTO `ky_district` VALUES ('150301', '市辖区', '150300');
INSERT INTO `ky_district` VALUES ('150302', '海勃湾区', '150300');
INSERT INTO `ky_district` VALUES ('150303', '海南区', '150300');
INSERT INTO `ky_district` VALUES ('150304', '乌达区', '150300');
INSERT INTO `ky_district` VALUES ('150400', '赤峰市', '150000');
INSERT INTO `ky_district` VALUES ('150401', '市辖区', '150400');
INSERT INTO `ky_district` VALUES ('150402', '红山区', '150400');
INSERT INTO `ky_district` VALUES ('150403', '元宝山区', '150400');
INSERT INTO `ky_district` VALUES ('150404', '松山区', '150400');
INSERT INTO `ky_district` VALUES ('150421', '阿鲁科尔沁旗', '150400');
INSERT INTO `ky_district` VALUES ('150422', '巴林左旗', '150400');
INSERT INTO `ky_district` VALUES ('150423', '巴林右旗', '150400');
INSERT INTO `ky_district` VALUES ('150424', '林西县', '150400');
INSERT INTO `ky_district` VALUES ('150425', '克什克腾旗', '150400');
INSERT INTO `ky_district` VALUES ('150426', '翁牛特旗', '150400');
INSERT INTO `ky_district` VALUES ('150428', '喀喇沁旗', '150400');
INSERT INTO `ky_district` VALUES ('150429', '宁城县', '150400');
INSERT INTO `ky_district` VALUES ('150430', '敖汉旗', '150400');
INSERT INTO `ky_district` VALUES ('150500', '通辽市', '150000');
INSERT INTO `ky_district` VALUES ('150501', '市辖区', '150500');
INSERT INTO `ky_district` VALUES ('150502', '科尔沁区', '150500');
INSERT INTO `ky_district` VALUES ('150521', '科尔沁左翼中旗', '150500');
INSERT INTO `ky_district` VALUES ('150522', '科尔沁左翼后旗', '150500');
INSERT INTO `ky_district` VALUES ('150523', '开鲁县', '150500');
INSERT INTO `ky_district` VALUES ('150524', '库伦旗', '150500');
INSERT INTO `ky_district` VALUES ('150525', '奈曼旗', '150500');
INSERT INTO `ky_district` VALUES ('150526', '扎鲁特旗', '150500');
INSERT INTO `ky_district` VALUES ('150581', '霍林郭勒市', '150500');
INSERT INTO `ky_district` VALUES ('150600', '鄂尔多斯市', '150000');
INSERT INTO `ky_district` VALUES ('150601', '市辖区', '150600');
INSERT INTO `ky_district` VALUES ('150602', '东胜区', '150600');
INSERT INTO `ky_district` VALUES ('150621', '达拉特旗', '150600');
INSERT INTO `ky_district` VALUES ('150622', '准格尔旗', '150600');
INSERT INTO `ky_district` VALUES ('150623', '鄂托克前旗', '150600');
INSERT INTO `ky_district` VALUES ('150624', '鄂托克旗', '150600');
INSERT INTO `ky_district` VALUES ('150625', '杭锦旗', '150600');
INSERT INTO `ky_district` VALUES ('150626', '乌审旗', '150600');
INSERT INTO `ky_district` VALUES ('150627', '伊金霍洛旗', '150600');
INSERT INTO `ky_district` VALUES ('150700', '呼伦贝尔市', '150000');
INSERT INTO `ky_district` VALUES ('150701', '市辖区', '150700');
INSERT INTO `ky_district` VALUES ('150702', '海拉尔区', '150700');
INSERT INTO `ky_district` VALUES ('150703', '扎赉诺尔区', '150700');
INSERT INTO `ky_district` VALUES ('150721', '阿荣旗', '150700');
INSERT INTO `ky_district` VALUES ('150722', '莫力达瓦达斡尔族自治旗', '150700');
INSERT INTO `ky_district` VALUES ('150723', '鄂伦春自治旗', '150700');
INSERT INTO `ky_district` VALUES ('150724', '鄂温克族自治旗', '150700');
INSERT INTO `ky_district` VALUES ('150725', '陈巴尔虎旗', '150700');
INSERT INTO `ky_district` VALUES ('150726', '新巴尔虎左旗', '150700');
INSERT INTO `ky_district` VALUES ('150727', '新巴尔虎右旗', '150700');
INSERT INTO `ky_district` VALUES ('150781', '满洲里市', '150700');
INSERT INTO `ky_district` VALUES ('150782', '牙克石市', '150700');
INSERT INTO `ky_district` VALUES ('150783', '扎兰屯市', '150700');
INSERT INTO `ky_district` VALUES ('150784', '额尔古纳市', '150700');
INSERT INTO `ky_district` VALUES ('150785', '根河市', '150700');
INSERT INTO `ky_district` VALUES ('150800', '巴彦淖尔市', '150000');
INSERT INTO `ky_district` VALUES ('150801', '市辖区', '150800');
INSERT INTO `ky_district` VALUES ('150802', '临河区', '150800');
INSERT INTO `ky_district` VALUES ('150821', '五原县', '150800');
INSERT INTO `ky_district` VALUES ('150822', '磴口县', '150800');
INSERT INTO `ky_district` VALUES ('150823', '乌拉特前旗', '150800');
INSERT INTO `ky_district` VALUES ('150824', '乌拉特中旗', '150800');
INSERT INTO `ky_district` VALUES ('150825', '乌拉特后旗', '150800');
INSERT INTO `ky_district` VALUES ('150826', '杭锦后旗', '150800');
INSERT INTO `ky_district` VALUES ('150900', '乌兰察布市', '150000');
INSERT INTO `ky_district` VALUES ('150901', '市辖区', '150900');
INSERT INTO `ky_district` VALUES ('150902', '集宁区', '150900');
INSERT INTO `ky_district` VALUES ('150921', '卓资县', '150900');
INSERT INTO `ky_district` VALUES ('150922', '化德县', '150900');
INSERT INTO `ky_district` VALUES ('150923', '商都县', '150900');
INSERT INTO `ky_district` VALUES ('150924', '兴和县', '150900');
INSERT INTO `ky_district` VALUES ('150925', '凉城县', '150900');
INSERT INTO `ky_district` VALUES ('150926', '察哈尔右翼前旗', '150900');
INSERT INTO `ky_district` VALUES ('150927', '察哈尔右翼中旗', '150900');
INSERT INTO `ky_district` VALUES ('150928', '察哈尔右翼后旗', '150900');
INSERT INTO `ky_district` VALUES ('150929', '四子王旗', '150900');
INSERT INTO `ky_district` VALUES ('150981', '丰镇市', '150900');
INSERT INTO `ky_district` VALUES ('152200', '兴安盟', '150000');
INSERT INTO `ky_district` VALUES ('152201', '乌兰浩特市', '152200');
INSERT INTO `ky_district` VALUES ('152202', '阿尔山市', '152200');
INSERT INTO `ky_district` VALUES ('152221', '科尔沁右翼前旗', '152200');
INSERT INTO `ky_district` VALUES ('152222', '科尔沁右翼中旗', '152200');
INSERT INTO `ky_district` VALUES ('152223', '扎赉特旗', '152200');
INSERT INTO `ky_district` VALUES ('152224', '突泉县', '152200');
INSERT INTO `ky_district` VALUES ('152500', '锡林郭勒盟', '150000');
INSERT INTO `ky_district` VALUES ('152501', '二连浩特市', '152500');
INSERT INTO `ky_district` VALUES ('152502', '锡林浩特市', '152500');
INSERT INTO `ky_district` VALUES ('152522', '阿巴嘎旗', '152500');
INSERT INTO `ky_district` VALUES ('152523', '苏尼特左旗', '152500');
INSERT INTO `ky_district` VALUES ('152524', '苏尼特右旗', '152500');
INSERT INTO `ky_district` VALUES ('152525', '东乌珠穆沁旗', '152500');
INSERT INTO `ky_district` VALUES ('152526', '西乌珠穆沁旗', '152500');
INSERT INTO `ky_district` VALUES ('152527', '太仆寺旗', '152500');
INSERT INTO `ky_district` VALUES ('152528', '镶黄旗', '152500');
INSERT INTO `ky_district` VALUES ('152529', '正镶白旗', '152500');
INSERT INTO `ky_district` VALUES ('152530', '正蓝旗', '152500');
INSERT INTO `ky_district` VALUES ('152531', '多伦县', '152500');
INSERT INTO `ky_district` VALUES ('152900', '阿拉善盟', '150000');
INSERT INTO `ky_district` VALUES ('152921', '阿拉善左旗', '152900');
INSERT INTO `ky_district` VALUES ('152922', '阿拉善右旗', '152900');
INSERT INTO `ky_district` VALUES ('152923', '额济纳旗', '152900');
INSERT INTO `ky_district` VALUES ('210000', '辽宁省', '0');
INSERT INTO `ky_district` VALUES ('210100', '沈阳市', '210000');
INSERT INTO `ky_district` VALUES ('210101', '市辖区', '210100');
INSERT INTO `ky_district` VALUES ('210102', '和平区', '210100');
INSERT INTO `ky_district` VALUES ('210103', '沈河区', '210100');
INSERT INTO `ky_district` VALUES ('210104', '大东区', '210100');
INSERT INTO `ky_district` VALUES ('210105', '皇姑区', '210100');
INSERT INTO `ky_district` VALUES ('210106', '铁西区', '210100');
INSERT INTO `ky_district` VALUES ('210111', '苏家屯区', '210100');
INSERT INTO `ky_district` VALUES ('210112', '浑南区', '210100');
INSERT INTO `ky_district` VALUES ('210113', '沈北新区', '210100');
INSERT INTO `ky_district` VALUES ('210114', '于洪区', '210100');
INSERT INTO `ky_district` VALUES ('210122', '辽中县', '210100');
INSERT INTO `ky_district` VALUES ('210123', '康平县', '210100');
INSERT INTO `ky_district` VALUES ('210124', '法库县', '210100');
INSERT INTO `ky_district` VALUES ('210181', '新民市', '210100');
INSERT INTO `ky_district` VALUES ('210200', '大连市', '210000');
INSERT INTO `ky_district` VALUES ('210201', '市辖区', '210200');
INSERT INTO `ky_district` VALUES ('210202', '中山区', '210200');
INSERT INTO `ky_district` VALUES ('210203', '西岗区', '210200');
INSERT INTO `ky_district` VALUES ('210204', '沙河口区', '210200');
INSERT INTO `ky_district` VALUES ('210211', '甘井子区', '210200');
INSERT INTO `ky_district` VALUES ('210212', '旅顺口区', '210200');
INSERT INTO `ky_district` VALUES ('210213', '金州区', '210200');
INSERT INTO `ky_district` VALUES ('210224', '长海县', '210200');
INSERT INTO `ky_district` VALUES ('210281', '瓦房店市', '210200');
INSERT INTO `ky_district` VALUES ('210282', '普兰店市', '210200');
INSERT INTO `ky_district` VALUES ('210283', '庄河市', '210200');
INSERT INTO `ky_district` VALUES ('210300', '鞍山市', '210000');
INSERT INTO `ky_district` VALUES ('210301', '市辖区', '210300');
INSERT INTO `ky_district` VALUES ('210302', '铁东区', '210300');
INSERT INTO `ky_district` VALUES ('210303', '铁西区', '210300');
INSERT INTO `ky_district` VALUES ('210304', '立山区', '210300');
INSERT INTO `ky_district` VALUES ('210311', '千山区', '210300');
INSERT INTO `ky_district` VALUES ('210321', '台安县', '210300');
INSERT INTO `ky_district` VALUES ('210323', '岫岩满族自治县', '210300');
INSERT INTO `ky_district` VALUES ('210381', '海城市', '210300');
INSERT INTO `ky_district` VALUES ('210400', '抚顺市', '210000');
INSERT INTO `ky_district` VALUES ('210401', '市辖区', '210400');
INSERT INTO `ky_district` VALUES ('210402', '新抚区', '210400');
INSERT INTO `ky_district` VALUES ('210403', '东洲区', '210400');
INSERT INTO `ky_district` VALUES ('210404', '望花区', '210400');
INSERT INTO `ky_district` VALUES ('210411', '顺城区', '210400');
INSERT INTO `ky_district` VALUES ('210421', '抚顺县', '210400');
INSERT INTO `ky_district` VALUES ('210422', '新宾满族自治县', '210400');
INSERT INTO `ky_district` VALUES ('210423', '清原满族自治县', '210400');
INSERT INTO `ky_district` VALUES ('210500', '本溪市', '210000');
INSERT INTO `ky_district` VALUES ('210501', '市辖区', '210500');
INSERT INTO `ky_district` VALUES ('210502', '平山区', '210500');
INSERT INTO `ky_district` VALUES ('210503', '溪湖区', '210500');
INSERT INTO `ky_district` VALUES ('210504', '明山区', '210500');
INSERT INTO `ky_district` VALUES ('210505', '南芬区', '210500');
INSERT INTO `ky_district` VALUES ('210521', '本溪满族自治县', '210500');
INSERT INTO `ky_district` VALUES ('210522', '桓仁满族自治县', '210500');
INSERT INTO `ky_district` VALUES ('210600', '丹东市', '210000');
INSERT INTO `ky_district` VALUES ('210601', '市辖区', '210600');
INSERT INTO `ky_district` VALUES ('210602', '元宝区', '210600');
INSERT INTO `ky_district` VALUES ('210603', '振兴区', '210600');
INSERT INTO `ky_district` VALUES ('210604', '振安区', '210600');
INSERT INTO `ky_district` VALUES ('210624', '宽甸满族自治县', '210600');
INSERT INTO `ky_district` VALUES ('210681', '东港市', '210600');
INSERT INTO `ky_district` VALUES ('210682', '凤城市', '210600');
INSERT INTO `ky_district` VALUES ('210700', '锦州市', '210000');
INSERT INTO `ky_district` VALUES ('210701', '市辖区', '210700');
INSERT INTO `ky_district` VALUES ('210702', '古塔区', '210700');
INSERT INTO `ky_district` VALUES ('210703', '凌河区', '210700');
INSERT INTO `ky_district` VALUES ('210711', '太和区', '210700');
INSERT INTO `ky_district` VALUES ('210726', '黑山县', '210700');
INSERT INTO `ky_district` VALUES ('210727', '义县', '210700');
INSERT INTO `ky_district` VALUES ('210781', '凌海市', '210700');
INSERT INTO `ky_district` VALUES ('210782', '北镇市', '210700');
INSERT INTO `ky_district` VALUES ('210800', '营口市', '210000');
INSERT INTO `ky_district` VALUES ('210801', '市辖区', '210800');
INSERT INTO `ky_district` VALUES ('210802', '站前区', '210800');
INSERT INTO `ky_district` VALUES ('210803', '西市区', '210800');
INSERT INTO `ky_district` VALUES ('210804', '鲅鱼圈区', '210800');
INSERT INTO `ky_district` VALUES ('210811', '老边区', '210800');
INSERT INTO `ky_district` VALUES ('210881', '盖州市', '210800');
INSERT INTO `ky_district` VALUES ('210882', '大石桥市', '210800');
INSERT INTO `ky_district` VALUES ('210900', '阜新市', '210000');
INSERT INTO `ky_district` VALUES ('210901', '市辖区', '210900');
INSERT INTO `ky_district` VALUES ('210902', '海州区', '210900');
INSERT INTO `ky_district` VALUES ('210903', '新邱区', '210900');
INSERT INTO `ky_district` VALUES ('210904', '太平区', '210900');
INSERT INTO `ky_district` VALUES ('210905', '清河门区', '210900');
INSERT INTO `ky_district` VALUES ('210911', '细河区', '210900');
INSERT INTO `ky_district` VALUES ('210921', '阜新蒙古族自治县', '210900');
INSERT INTO `ky_district` VALUES ('210922', '彰武县', '210900');
INSERT INTO `ky_district` VALUES ('211000', '辽阳市', '210000');
INSERT INTO `ky_district` VALUES ('211001', '市辖区', '211000');
INSERT INTO `ky_district` VALUES ('211002', '白塔区', '211000');
INSERT INTO `ky_district` VALUES ('211003', '文圣区', '211000');
INSERT INTO `ky_district` VALUES ('211004', '宏伟区', '211000');
INSERT INTO `ky_district` VALUES ('211005', '弓长岭区', '211000');
INSERT INTO `ky_district` VALUES ('211011', '太子河区', '211000');
INSERT INTO `ky_district` VALUES ('211021', '辽阳县', '211000');
INSERT INTO `ky_district` VALUES ('211081', '灯塔市', '211000');
INSERT INTO `ky_district` VALUES ('211100', '盘锦市', '210000');
INSERT INTO `ky_district` VALUES ('211101', '市辖区', '211100');
INSERT INTO `ky_district` VALUES ('211102', '双台子区', '211100');
INSERT INTO `ky_district` VALUES ('211103', '兴隆台区', '211100');
INSERT INTO `ky_district` VALUES ('211121', '大洼县', '211100');
INSERT INTO `ky_district` VALUES ('211122', '盘山县', '211100');
INSERT INTO `ky_district` VALUES ('211200', '铁岭市', '210000');
INSERT INTO `ky_district` VALUES ('211201', '市辖区', '211200');
INSERT INTO `ky_district` VALUES ('211202', '银州区', '211200');
INSERT INTO `ky_district` VALUES ('211204', '清河区', '211200');
INSERT INTO `ky_district` VALUES ('211221', '铁岭县', '211200');
INSERT INTO `ky_district` VALUES ('211223', '西丰县', '211200');
INSERT INTO `ky_district` VALUES ('211224', '昌图县', '211200');
INSERT INTO `ky_district` VALUES ('211281', '调兵山市', '211200');
INSERT INTO `ky_district` VALUES ('211282', '开原市', '211200');
INSERT INTO `ky_district` VALUES ('211300', '朝阳市', '210000');
INSERT INTO `ky_district` VALUES ('211301', '市辖区', '211300');
INSERT INTO `ky_district` VALUES ('211302', '双塔区', '211300');
INSERT INTO `ky_district` VALUES ('211303', '龙城区', '211300');
INSERT INTO `ky_district` VALUES ('211321', '朝阳县', '211300');
INSERT INTO `ky_district` VALUES ('211322', '建平县', '211300');
INSERT INTO `ky_district` VALUES ('211324', '喀喇沁左翼蒙古族自治县', '211300');
INSERT INTO `ky_district` VALUES ('211381', '北票市', '211300');
INSERT INTO `ky_district` VALUES ('211382', '凌源市', '211300');
INSERT INTO `ky_district` VALUES ('211400', '葫芦岛市', '210000');
INSERT INTO `ky_district` VALUES ('211401', '市辖区', '211400');
INSERT INTO `ky_district` VALUES ('211402', '连山区', '211400');
INSERT INTO `ky_district` VALUES ('211403', '龙港区', '211400');
INSERT INTO `ky_district` VALUES ('211404', '南票区', '211400');
INSERT INTO `ky_district` VALUES ('211421', '绥中县', '211400');
INSERT INTO `ky_district` VALUES ('211422', '建昌县', '211400');
INSERT INTO `ky_district` VALUES ('211481', '兴城市', '211400');
INSERT INTO `ky_district` VALUES ('220000', '吉林省', '0');
INSERT INTO `ky_district` VALUES ('220100', '长春市', '220000');
INSERT INTO `ky_district` VALUES ('220101', '市辖区', '220100');
INSERT INTO `ky_district` VALUES ('220102', '南关区', '220100');
INSERT INTO `ky_district` VALUES ('220103', '宽城区', '220100');
INSERT INTO `ky_district` VALUES ('220104', '朝阳区', '220100');
INSERT INTO `ky_district` VALUES ('220105', '二道区', '220100');
INSERT INTO `ky_district` VALUES ('220106', '绿园区', '220100');
INSERT INTO `ky_district` VALUES ('220112', '双阳区', '220100');
INSERT INTO `ky_district` VALUES ('220113', '九台区', '220100');
INSERT INTO `ky_district` VALUES ('220122', '农安县', '220100');
INSERT INTO `ky_district` VALUES ('220182', '榆树市', '220100');
INSERT INTO `ky_district` VALUES ('220183', '德惠市', '220100');
INSERT INTO `ky_district` VALUES ('220200', '吉林市', '220000');
INSERT INTO `ky_district` VALUES ('220201', '市辖区', '220200');
INSERT INTO `ky_district` VALUES ('220202', '昌邑区', '220200');
INSERT INTO `ky_district` VALUES ('220203', '龙潭区', '220200');
INSERT INTO `ky_district` VALUES ('220204', '船营区', '220200');
INSERT INTO `ky_district` VALUES ('220211', '丰满区', '220200');
INSERT INTO `ky_district` VALUES ('220221', '永吉县', '220200');
INSERT INTO `ky_district` VALUES ('220281', '蛟河市', '220200');
INSERT INTO `ky_district` VALUES ('220282', '桦甸市', '220200');
INSERT INTO `ky_district` VALUES ('220283', '舒兰市', '220200');
INSERT INTO `ky_district` VALUES ('220284', '磐石市', '220200');
INSERT INTO `ky_district` VALUES ('220300', '四平市', '220000');
INSERT INTO `ky_district` VALUES ('220301', '市辖区', '220300');
INSERT INTO `ky_district` VALUES ('220302', '铁西区', '220300');
INSERT INTO `ky_district` VALUES ('220303', '铁东区', '220300');
INSERT INTO `ky_district` VALUES ('220322', '梨树县', '220300');
INSERT INTO `ky_district` VALUES ('220323', '伊通满族自治县', '220300');
INSERT INTO `ky_district` VALUES ('220381', '公主岭市', '220300');
INSERT INTO `ky_district` VALUES ('220382', '双辽市', '220300');
INSERT INTO `ky_district` VALUES ('220400', '辽源市', '220000');
INSERT INTO `ky_district` VALUES ('220401', '市辖区', '220400');
INSERT INTO `ky_district` VALUES ('220402', '龙山区', '220400');
INSERT INTO `ky_district` VALUES ('220403', '西安区', '220400');
INSERT INTO `ky_district` VALUES ('220421', '东丰县', '220400');
INSERT INTO `ky_district` VALUES ('220422', '东辽县', '220400');
INSERT INTO `ky_district` VALUES ('220500', '通化市', '220000');
INSERT INTO `ky_district` VALUES ('220501', '市辖区', '220500');
INSERT INTO `ky_district` VALUES ('220502', '东昌区', '220500');
INSERT INTO `ky_district` VALUES ('220503', '二道江区', '220500');
INSERT INTO `ky_district` VALUES ('220521', '通化县', '220500');
INSERT INTO `ky_district` VALUES ('220523', '辉南县', '220500');
INSERT INTO `ky_district` VALUES ('220524', '柳河县', '220500');
INSERT INTO `ky_district` VALUES ('220581', '梅河口市', '220500');
INSERT INTO `ky_district` VALUES ('220582', '集安市', '220500');
INSERT INTO `ky_district` VALUES ('220600', '白山市', '220000');
INSERT INTO `ky_district` VALUES ('220601', '市辖区', '220600');
INSERT INTO `ky_district` VALUES ('220602', '浑江区', '220600');
INSERT INTO `ky_district` VALUES ('220605', '江源区', '220600');
INSERT INTO `ky_district` VALUES ('220621', '抚松县', '220600');
INSERT INTO `ky_district` VALUES ('220622', '靖宇县', '220600');
INSERT INTO `ky_district` VALUES ('220623', '长白朝鲜族自治县', '220600');
INSERT INTO `ky_district` VALUES ('220681', '临江市', '220600');
INSERT INTO `ky_district` VALUES ('220700', '松原市', '220000');
INSERT INTO `ky_district` VALUES ('220701', '市辖区', '220700');
INSERT INTO `ky_district` VALUES ('220702', '宁江区', '220700');
INSERT INTO `ky_district` VALUES ('220721', '前郭尔罗斯蒙古族自治县', '220700');
INSERT INTO `ky_district` VALUES ('220722', '长岭县', '220700');
INSERT INTO `ky_district` VALUES ('220723', '乾安县', '220700');
INSERT INTO `ky_district` VALUES ('220781', '扶余市', '220700');
INSERT INTO `ky_district` VALUES ('220800', '白城市', '220000');
INSERT INTO `ky_district` VALUES ('220801', '市辖区', '220800');
INSERT INTO `ky_district` VALUES ('220802', '洮北区', '220800');
INSERT INTO `ky_district` VALUES ('220821', '镇赉县', '220800');
INSERT INTO `ky_district` VALUES ('220822', '通榆县', '220800');
INSERT INTO `ky_district` VALUES ('220881', '洮南市', '220800');
INSERT INTO `ky_district` VALUES ('220882', '大安市', '220800');
INSERT INTO `ky_district` VALUES ('222400', '延边朝鲜族自治州', '220000');
INSERT INTO `ky_district` VALUES ('222401', '延吉市', '222400');
INSERT INTO `ky_district` VALUES ('222402', '图们市', '222400');
INSERT INTO `ky_district` VALUES ('222403', '敦化市', '222400');
INSERT INTO `ky_district` VALUES ('222404', '珲春市', '222400');
INSERT INTO `ky_district` VALUES ('222405', '龙井市', '222400');
INSERT INTO `ky_district` VALUES ('222406', '和龙市', '222400');
INSERT INTO `ky_district` VALUES ('222424', '汪清县', '222400');
INSERT INTO `ky_district` VALUES ('222426', '安图县', '222400');
INSERT INTO `ky_district` VALUES ('230000', '黑龙江省', '0');
INSERT INTO `ky_district` VALUES ('230100', '哈尔滨市', '230000');
INSERT INTO `ky_district` VALUES ('230101', '市辖区', '230100');
INSERT INTO `ky_district` VALUES ('230102', '道里区', '230100');
INSERT INTO `ky_district` VALUES ('230103', '南岗区', '230100');
INSERT INTO `ky_district` VALUES ('230104', '道外区', '230100');
INSERT INTO `ky_district` VALUES ('230108', '平房区', '230100');
INSERT INTO `ky_district` VALUES ('230109', '松北区', '230100');
INSERT INTO `ky_district` VALUES ('230110', '香坊区', '230100');
INSERT INTO `ky_district` VALUES ('230111', '呼兰区', '230100');
INSERT INTO `ky_district` VALUES ('230112', '阿城区', '230100');
INSERT INTO `ky_district` VALUES ('230113', '双城区', '230100');
INSERT INTO `ky_district` VALUES ('230123', '依兰县', '230100');
INSERT INTO `ky_district` VALUES ('230124', '方正县', '230100');
INSERT INTO `ky_district` VALUES ('230125', '宾县', '230100');
INSERT INTO `ky_district` VALUES ('230126', '巴彦县', '230100');
INSERT INTO `ky_district` VALUES ('230127', '木兰县', '230100');
INSERT INTO `ky_district` VALUES ('230128', '通河县', '230100');
INSERT INTO `ky_district` VALUES ('230129', '延寿县', '230100');
INSERT INTO `ky_district` VALUES ('230183', '尚志市', '230100');
INSERT INTO `ky_district` VALUES ('230184', '五常市', '230100');
INSERT INTO `ky_district` VALUES ('230200', '齐齐哈尔市', '230000');
INSERT INTO `ky_district` VALUES ('230201', '市辖区', '230200');
INSERT INTO `ky_district` VALUES ('230202', '龙沙区', '230200');
INSERT INTO `ky_district` VALUES ('230203', '建华区', '230200');
INSERT INTO `ky_district` VALUES ('230204', '铁锋区', '230200');
INSERT INTO `ky_district` VALUES ('230205', '昂昂溪区', '230200');
INSERT INTO `ky_district` VALUES ('230206', '富拉尔基区', '230200');
INSERT INTO `ky_district` VALUES ('230207', '碾子山区', '230200');
INSERT INTO `ky_district` VALUES ('230208', '梅里斯达斡尔族区', '230200');
INSERT INTO `ky_district` VALUES ('230221', '龙江县', '230200');
INSERT INTO `ky_district` VALUES ('230223', '依安县', '230200');
INSERT INTO `ky_district` VALUES ('230224', '泰来县', '230200');
INSERT INTO `ky_district` VALUES ('230225', '甘南县', '230200');
INSERT INTO `ky_district` VALUES ('230227', '富裕县', '230200');
INSERT INTO `ky_district` VALUES ('230229', '克山县', '230200');
INSERT INTO `ky_district` VALUES ('230230', '克东县', '230200');
INSERT INTO `ky_district` VALUES ('230231', '拜泉县', '230200');
INSERT INTO `ky_district` VALUES ('230281', '讷河市', '230200');
INSERT INTO `ky_district` VALUES ('230300', '鸡西市', '230000');
INSERT INTO `ky_district` VALUES ('230301', '市辖区', '230300');
INSERT INTO `ky_district` VALUES ('230302', '鸡冠区', '230300');
INSERT INTO `ky_district` VALUES ('230303', '恒山区', '230300');
INSERT INTO `ky_district` VALUES ('230304', '滴道区', '230300');
INSERT INTO `ky_district` VALUES ('230305', '梨树区', '230300');
INSERT INTO `ky_district` VALUES ('230306', '城子河区', '230300');
INSERT INTO `ky_district` VALUES ('230307', '麻山区', '230300');
INSERT INTO `ky_district` VALUES ('230321', '鸡东县', '230300');
INSERT INTO `ky_district` VALUES ('230381', '虎林市', '230300');
INSERT INTO `ky_district` VALUES ('230382', '密山市', '230300');
INSERT INTO `ky_district` VALUES ('230400', '鹤岗市', '230000');
INSERT INTO `ky_district` VALUES ('230401', '市辖区', '230400');
INSERT INTO `ky_district` VALUES ('230402', '向阳区', '230400');
INSERT INTO `ky_district` VALUES ('230403', '工农区', '230400');
INSERT INTO `ky_district` VALUES ('230404', '南山区', '230400');
INSERT INTO `ky_district` VALUES ('230405', '兴安区', '230400');
INSERT INTO `ky_district` VALUES ('230406', '东山区', '230400');
INSERT INTO `ky_district` VALUES ('230407', '兴山区', '230400');
INSERT INTO `ky_district` VALUES ('230421', '萝北县', '230400');
INSERT INTO `ky_district` VALUES ('230422', '绥滨县', '230400');
INSERT INTO `ky_district` VALUES ('230500', '双鸭山市', '230000');
INSERT INTO `ky_district` VALUES ('230501', '市辖区', '230500');
INSERT INTO `ky_district` VALUES ('230502', '尖山区', '230500');
INSERT INTO `ky_district` VALUES ('230503', '岭东区', '230500');
INSERT INTO `ky_district` VALUES ('230505', '四方台区', '230500');
INSERT INTO `ky_district` VALUES ('230506', '宝山区', '230500');
INSERT INTO `ky_district` VALUES ('230521', '集贤县', '230500');
INSERT INTO `ky_district` VALUES ('230522', '友谊县', '230500');
INSERT INTO `ky_district` VALUES ('230523', '宝清县', '230500');
INSERT INTO `ky_district` VALUES ('230524', '饶河县', '230500');
INSERT INTO `ky_district` VALUES ('230600', '大庆市', '230000');
INSERT INTO `ky_district` VALUES ('230601', '市辖区', '230600');
INSERT INTO `ky_district` VALUES ('230602', '萨尔图区', '230600');
INSERT INTO `ky_district` VALUES ('230603', '龙凤区', '230600');
INSERT INTO `ky_district` VALUES ('230604', '让胡路区', '230600');
INSERT INTO `ky_district` VALUES ('230605', '红岗区', '230600');
INSERT INTO `ky_district` VALUES ('230606', '大同区', '230600');
INSERT INTO `ky_district` VALUES ('230621', '肇州县', '230600');
INSERT INTO `ky_district` VALUES ('230622', '肇源县', '230600');
INSERT INTO `ky_district` VALUES ('230623', '林甸县', '230600');
INSERT INTO `ky_district` VALUES ('230624', '杜尔伯特蒙古族自治县', '230600');
INSERT INTO `ky_district` VALUES ('230700', '伊春市', '230000');
INSERT INTO `ky_district` VALUES ('230701', '市辖区', '230700');
INSERT INTO `ky_district` VALUES ('230702', '伊春区', '230700');
INSERT INTO `ky_district` VALUES ('230703', '南岔区', '230700');
INSERT INTO `ky_district` VALUES ('230704', '友好区', '230700');
INSERT INTO `ky_district` VALUES ('230705', '西林区', '230700');
INSERT INTO `ky_district` VALUES ('230706', '翠峦区', '230700');
INSERT INTO `ky_district` VALUES ('230707', '新青区', '230700');
INSERT INTO `ky_district` VALUES ('230708', '美溪区', '230700');
INSERT INTO `ky_district` VALUES ('230709', '金山屯区', '230700');
INSERT INTO `ky_district` VALUES ('230710', '五营区', '230700');
INSERT INTO `ky_district` VALUES ('230711', '乌马河区', '230700');
INSERT INTO `ky_district` VALUES ('230712', '汤旺河区', '230700');
INSERT INTO `ky_district` VALUES ('230713', '带岭区', '230700');
INSERT INTO `ky_district` VALUES ('230714', '乌伊岭区', '230700');
INSERT INTO `ky_district` VALUES ('230715', '红星区', '230700');
INSERT INTO `ky_district` VALUES ('230716', '上甘岭区', '230700');
INSERT INTO `ky_district` VALUES ('230722', '嘉荫县', '230700');
INSERT INTO `ky_district` VALUES ('230781', '铁力市', '230700');
INSERT INTO `ky_district` VALUES ('230800', '佳木斯市', '230000');
INSERT INTO `ky_district` VALUES ('230801', '市辖区', '230800');
INSERT INTO `ky_district` VALUES ('230803', '向阳区', '230800');
INSERT INTO `ky_district` VALUES ('230804', '前进区', '230800');
INSERT INTO `ky_district` VALUES ('230805', '东风区', '230800');
INSERT INTO `ky_district` VALUES ('230811', '郊区', '230800');
INSERT INTO `ky_district` VALUES ('230822', '桦南县', '230800');
INSERT INTO `ky_district` VALUES ('230826', '桦川县', '230800');
INSERT INTO `ky_district` VALUES ('230828', '汤原县', '230800');
INSERT INTO `ky_district` VALUES ('230833', '抚远县', '230800');
INSERT INTO `ky_district` VALUES ('230881', '同江市', '230800');
INSERT INTO `ky_district` VALUES ('230882', '富锦市', '230800');
INSERT INTO `ky_district` VALUES ('230900', '七台河市', '230000');
INSERT INTO `ky_district` VALUES ('230901', '市辖区', '230900');
INSERT INTO `ky_district` VALUES ('230902', '新兴区', '230900');
INSERT INTO `ky_district` VALUES ('230903', '桃山区', '230900');
INSERT INTO `ky_district` VALUES ('230904', '茄子河区', '230900');
INSERT INTO `ky_district` VALUES ('230921', '勃利县', '230900');
INSERT INTO `ky_district` VALUES ('231000', '牡丹江市', '230000');
INSERT INTO `ky_district` VALUES ('231001', '市辖区', '231000');
INSERT INTO `ky_district` VALUES ('231002', '东安区', '231000');
INSERT INTO `ky_district` VALUES ('231003', '阳明区', '231000');
INSERT INTO `ky_district` VALUES ('231004', '爱民区', '231000');
INSERT INTO `ky_district` VALUES ('231005', '西安区', '231000');
INSERT INTO `ky_district` VALUES ('231024', '东宁县', '231000');
INSERT INTO `ky_district` VALUES ('231025', '林口县', '231000');
INSERT INTO `ky_district` VALUES ('231081', '绥芬河市', '231000');
INSERT INTO `ky_district` VALUES ('231083', '海林市', '231000');
INSERT INTO `ky_district` VALUES ('231084', '宁安市', '231000');
INSERT INTO `ky_district` VALUES ('231085', '穆棱市', '231000');
INSERT INTO `ky_district` VALUES ('231100', '黑河市', '230000');
INSERT INTO `ky_district` VALUES ('231101', '市辖区', '231100');
INSERT INTO `ky_district` VALUES ('231102', '爱辉区', '231100');
INSERT INTO `ky_district` VALUES ('231121', '嫩江县', '231100');
INSERT INTO `ky_district` VALUES ('231123', '逊克县', '231100');
INSERT INTO `ky_district` VALUES ('231124', '孙吴县', '231100');
INSERT INTO `ky_district` VALUES ('231181', '北安市', '231100');
INSERT INTO `ky_district` VALUES ('231182', '五大连池市', '231100');
INSERT INTO `ky_district` VALUES ('231200', '绥化市', '230000');
INSERT INTO `ky_district` VALUES ('231201', '市辖区', '231200');
INSERT INTO `ky_district` VALUES ('231202', '北林区', '231200');
INSERT INTO `ky_district` VALUES ('231221', '望奎县', '231200');
INSERT INTO `ky_district` VALUES ('231222', '兰西县', '231200');
INSERT INTO `ky_district` VALUES ('231223', '青冈县', '231200');
INSERT INTO `ky_district` VALUES ('231224', '庆安县', '231200');
INSERT INTO `ky_district` VALUES ('231225', '明水县', '231200');
INSERT INTO `ky_district` VALUES ('231226', '绥棱县', '231200');
INSERT INTO `ky_district` VALUES ('231281', '安达市', '231200');
INSERT INTO `ky_district` VALUES ('231282', '肇东市', '231200');
INSERT INTO `ky_district` VALUES ('231283', '海伦市', '231200');
INSERT INTO `ky_district` VALUES ('232700', '大兴安岭地区', '230000');
INSERT INTO `ky_district` VALUES ('232721', '呼玛县', '232700');
INSERT INTO `ky_district` VALUES ('232722', '塔河县', '232700');
INSERT INTO `ky_district` VALUES ('232723', '漠河县', '232700');
INSERT INTO `ky_district` VALUES ('310000', '上海', '0');
INSERT INTO `ky_district` VALUES ('310100', '上海市', '310000');
INSERT INTO `ky_district` VALUES ('310101', '黄浦区', '310100');
INSERT INTO `ky_district` VALUES ('310104', '徐汇区', '310100');
INSERT INTO `ky_district` VALUES ('310105', '长宁区', '310100');
INSERT INTO `ky_district` VALUES ('310106', '静安区', '310100');
INSERT INTO `ky_district` VALUES ('310107', '普陀区', '310100');
INSERT INTO `ky_district` VALUES ('310108', '闸北区', '310100');
INSERT INTO `ky_district` VALUES ('310109', '虹口区', '310100');
INSERT INTO `ky_district` VALUES ('310110', '杨浦区', '310100');
INSERT INTO `ky_district` VALUES ('310112', '闵行区', '310100');
INSERT INTO `ky_district` VALUES ('310113', '宝山区', '310100');
INSERT INTO `ky_district` VALUES ('310114', '嘉定区', '310100');
INSERT INTO `ky_district` VALUES ('310115', '浦东新区', '310100');
INSERT INTO `ky_district` VALUES ('310116', '金山区', '310100');
INSERT INTO `ky_district` VALUES ('310117', '松江区', '310100');
INSERT INTO `ky_district` VALUES ('310118', '青浦区', '310100');
INSERT INTO `ky_district` VALUES ('310120', '奉贤区', '310100');
INSERT INTO `ky_district` VALUES ('310230', '崇明县', '310100');
INSERT INTO `ky_district` VALUES ('320000', '江苏省', '0');
INSERT INTO `ky_district` VALUES ('320100', '南京市', '320000');
INSERT INTO `ky_district` VALUES ('320101', '市辖区', '320100');
INSERT INTO `ky_district` VALUES ('320102', '玄武区', '320100');
INSERT INTO `ky_district` VALUES ('320104', '秦淮区', '320100');
INSERT INTO `ky_district` VALUES ('320105', '建邺区', '320100');
INSERT INTO `ky_district` VALUES ('320106', '鼓楼区', '320100');
INSERT INTO `ky_district` VALUES ('320111', '浦口区', '320100');
INSERT INTO `ky_district` VALUES ('320113', '栖霞区', '320100');
INSERT INTO `ky_district` VALUES ('320114', '雨花台区', '320100');
INSERT INTO `ky_district` VALUES ('320115', '江宁区', '320100');
INSERT INTO `ky_district` VALUES ('320116', '六合区', '320100');
INSERT INTO `ky_district` VALUES ('320117', '溧水区', '320100');
INSERT INTO `ky_district` VALUES ('320118', '高淳区', '320100');
INSERT INTO `ky_district` VALUES ('320200', '无锡市', '320000');
INSERT INTO `ky_district` VALUES ('320201', '市辖区', '320200');
INSERT INTO `ky_district` VALUES ('320202', '崇安区', '320200');
INSERT INTO `ky_district` VALUES ('320203', '南长区', '320200');
INSERT INTO `ky_district` VALUES ('320204', '北塘区', '320200');
INSERT INTO `ky_district` VALUES ('320205', '锡山区', '320200');
INSERT INTO `ky_district` VALUES ('320206', '惠山区', '320200');
INSERT INTO `ky_district` VALUES ('320211', '滨湖区', '320200');
INSERT INTO `ky_district` VALUES ('320281', '江阴市', '320200');
INSERT INTO `ky_district` VALUES ('320282', '宜兴市', '320200');
INSERT INTO `ky_district` VALUES ('320300', '徐州市', '320000');
INSERT INTO `ky_district` VALUES ('320301', '市辖区', '320300');
INSERT INTO `ky_district` VALUES ('320302', '鼓楼区', '320300');
INSERT INTO `ky_district` VALUES ('320303', '云龙区', '320300');
INSERT INTO `ky_district` VALUES ('320305', '贾汪区', '320300');
INSERT INTO `ky_district` VALUES ('320311', '泉山区', '320300');
INSERT INTO `ky_district` VALUES ('320312', '铜山区', '320300');
INSERT INTO `ky_district` VALUES ('320321', '丰县', '320300');
INSERT INTO `ky_district` VALUES ('320322', '沛县', '320300');
INSERT INTO `ky_district` VALUES ('320324', '睢宁县', '320300');
INSERT INTO `ky_district` VALUES ('320381', '新沂市', '320300');
INSERT INTO `ky_district` VALUES ('320382', '邳州市', '320300');
INSERT INTO `ky_district` VALUES ('320400', '常州市', '320000');
INSERT INTO `ky_district` VALUES ('320401', '市辖区', '320400');
INSERT INTO `ky_district` VALUES ('320402', '天宁区', '320400');
INSERT INTO `ky_district` VALUES ('320404', '钟楼区', '320400');
INSERT INTO `ky_district` VALUES ('320405', '戚墅堰区', '320400');
INSERT INTO `ky_district` VALUES ('320411', '新北区', '320400');
INSERT INTO `ky_district` VALUES ('320412', '武进区', '320400');
INSERT INTO `ky_district` VALUES ('320481', '溧阳市', '320400');
INSERT INTO `ky_district` VALUES ('320482', '金坛市', '320400');
INSERT INTO `ky_district` VALUES ('320500', '苏州市', '320000');
INSERT INTO `ky_district` VALUES ('320501', '市辖区', '320500');
INSERT INTO `ky_district` VALUES ('320505', '虎丘区', '320500');
INSERT INTO `ky_district` VALUES ('320506', '吴中区', '320500');
INSERT INTO `ky_district` VALUES ('320507', '相城区', '320500');
INSERT INTO `ky_district` VALUES ('320508', '姑苏区', '320500');
INSERT INTO `ky_district` VALUES ('320509', '吴江区', '320500');
INSERT INTO `ky_district` VALUES ('320581', '常熟市', '320500');
INSERT INTO `ky_district` VALUES ('320582', '张家港市', '320500');
INSERT INTO `ky_district` VALUES ('320583', '昆山市', '320500');
INSERT INTO `ky_district` VALUES ('320585', '太仓市', '320500');
INSERT INTO `ky_district` VALUES ('320600', '南通市', '320000');
INSERT INTO `ky_district` VALUES ('320601', '市辖区', '320600');
INSERT INTO `ky_district` VALUES ('320602', '崇川区', '320600');
INSERT INTO `ky_district` VALUES ('320611', '港闸区', '320600');
INSERT INTO `ky_district` VALUES ('320612', '通州区', '320600');
INSERT INTO `ky_district` VALUES ('320621', '海安县', '320600');
INSERT INTO `ky_district` VALUES ('320623', '如东县', '320600');
INSERT INTO `ky_district` VALUES ('320671', '经济技术开发区', '320600');
INSERT INTO `ky_district` VALUES ('320681', '启东市', '320600');
INSERT INTO `ky_district` VALUES ('320682', '如皋市', '320600');
INSERT INTO `ky_district` VALUES ('320684', '海门市', '320600');
INSERT INTO `ky_district` VALUES ('320700', '连云港市', '320000');
INSERT INTO `ky_district` VALUES ('320701', '市辖区', '320700');
INSERT INTO `ky_district` VALUES ('320703', '连云区', '320700');
INSERT INTO `ky_district` VALUES ('320706', '海州区', '320700');
INSERT INTO `ky_district` VALUES ('320707', '赣榆区', '320700');
INSERT INTO `ky_district` VALUES ('320722', '东海县', '320700');
INSERT INTO `ky_district` VALUES ('320723', '灌云县', '320700');
INSERT INTO `ky_district` VALUES ('320724', '灌南县', '320700');
INSERT INTO `ky_district` VALUES ('320800', '淮安市', '320000');
INSERT INTO `ky_district` VALUES ('320801', '市辖区', '320800');
INSERT INTO `ky_district` VALUES ('320802', '清河区', '320800');
INSERT INTO `ky_district` VALUES ('320803', '淮安区', '320800');
INSERT INTO `ky_district` VALUES ('320804', '淮阴区', '320800');
INSERT INTO `ky_district` VALUES ('320811', '清浦区', '320800');
INSERT INTO `ky_district` VALUES ('320812', '清江浦区', '320800');
INSERT INTO `ky_district` VALUES ('320826', '涟水县', '320800');
INSERT INTO `ky_district` VALUES ('320829', '洪泽县', '320800');
INSERT INTO `ky_district` VALUES ('320830', '盱眙县', '320800');
INSERT INTO `ky_district` VALUES ('320831', '金湖县', '320800');
INSERT INTO `ky_district` VALUES ('320900', '盐城市', '320000');
INSERT INTO `ky_district` VALUES ('320901', '市辖区', '320900');
INSERT INTO `ky_district` VALUES ('320902', '亭湖区', '320900');
INSERT INTO `ky_district` VALUES ('320903', '盐都区', '320900');
INSERT INTO `ky_district` VALUES ('320921', '响水县', '320900');
INSERT INTO `ky_district` VALUES ('320922', '滨海县', '320900');
INSERT INTO `ky_district` VALUES ('320923', '阜宁县', '320900');
INSERT INTO `ky_district` VALUES ('320924', '射阳县', '320900');
INSERT INTO `ky_district` VALUES ('320925', '建湖县', '320900');
INSERT INTO `ky_district` VALUES ('320981', '东台市', '320900');
INSERT INTO `ky_district` VALUES ('320982', '大丰市', '320900');
INSERT INTO `ky_district` VALUES ('321000', '扬州市', '320000');
INSERT INTO `ky_district` VALUES ('321001', '市辖区', '321000');
INSERT INTO `ky_district` VALUES ('321002', '广陵区', '321000');
INSERT INTO `ky_district` VALUES ('321003', '邗江区', '321000');
INSERT INTO `ky_district` VALUES ('321012', '江都区', '321000');
INSERT INTO `ky_district` VALUES ('321023', '宝应县', '321000');
INSERT INTO `ky_district` VALUES ('321081', '仪征市', '321000');
INSERT INTO `ky_district` VALUES ('321084', '高邮市', '321000');
INSERT INTO `ky_district` VALUES ('321100', '镇江市', '320000');
INSERT INTO `ky_district` VALUES ('321101', '市辖区', '321100');
INSERT INTO `ky_district` VALUES ('321102', '京口区', '321100');
INSERT INTO `ky_district` VALUES ('321111', '润州区', '321100');
INSERT INTO `ky_district` VALUES ('321112', '丹徒区', '321100');
INSERT INTO `ky_district` VALUES ('321181', '丹阳市', '321100');
INSERT INTO `ky_district` VALUES ('321182', '扬中市', '321100');
INSERT INTO `ky_district` VALUES ('321183', '句容市', '321100');
INSERT INTO `ky_district` VALUES ('321200', '泰州市', '320000');
INSERT INTO `ky_district` VALUES ('321201', '市辖区', '321200');
INSERT INTO `ky_district` VALUES ('321202', '海陵区', '321200');
INSERT INTO `ky_district` VALUES ('321203', '高港区', '321200');
INSERT INTO `ky_district` VALUES ('321204', '姜堰区', '321200');
INSERT INTO `ky_district` VALUES ('321281', '兴化市', '321200');
INSERT INTO `ky_district` VALUES ('321282', '靖江市', '321200');
INSERT INTO `ky_district` VALUES ('321283', '泰兴市', '321200');
INSERT INTO `ky_district` VALUES ('321300', '宿迁市', '320000');
INSERT INTO `ky_district` VALUES ('321301', '市辖区', '321300');
INSERT INTO `ky_district` VALUES ('321302', '宿城区', '321300');
INSERT INTO `ky_district` VALUES ('321311', '宿豫区', '321300');
INSERT INTO `ky_district` VALUES ('321322', '沭阳县', '321300');
INSERT INTO `ky_district` VALUES ('321323', '泗阳县', '321300');
INSERT INTO `ky_district` VALUES ('321324', '泗洪县', '321300');
INSERT INTO `ky_district` VALUES ('330000', '浙江省', '0');
INSERT INTO `ky_district` VALUES ('330100', '杭州市', '330000');
INSERT INTO `ky_district` VALUES ('330101', '市辖区', '330100');
INSERT INTO `ky_district` VALUES ('330102', '上城区', '330100');
INSERT INTO `ky_district` VALUES ('330103', '下城区', '330100');
INSERT INTO `ky_district` VALUES ('330104', '江干区', '330100');
INSERT INTO `ky_district` VALUES ('330105', '拱墅区', '330100');
INSERT INTO `ky_district` VALUES ('330106', '西湖区', '330100');
INSERT INTO `ky_district` VALUES ('330108', '滨江区', '330100');
INSERT INTO `ky_district` VALUES ('330109', '萧山区', '330100');
INSERT INTO `ky_district` VALUES ('330110', '余杭区', '330100');
INSERT INTO `ky_district` VALUES ('330111', '富阳区', '330100');
INSERT INTO `ky_district` VALUES ('330122', '桐庐县', '330100');
INSERT INTO `ky_district` VALUES ('330127', '淳安县', '330100');
INSERT INTO `ky_district` VALUES ('330182', '建德市', '330100');
INSERT INTO `ky_district` VALUES ('330185', '临安市', '330100');
INSERT INTO `ky_district` VALUES ('330200', '宁波市', '330000');
INSERT INTO `ky_district` VALUES ('330201', '市辖区', '330200');
INSERT INTO `ky_district` VALUES ('330203', '海曙区', '330200');
INSERT INTO `ky_district` VALUES ('330204', '江东区', '330200');
INSERT INTO `ky_district` VALUES ('330205', '江北区', '330200');
INSERT INTO `ky_district` VALUES ('330206', '北仑区', '330200');
INSERT INTO `ky_district` VALUES ('330211', '镇海区', '330200');
INSERT INTO `ky_district` VALUES ('330212', '鄞州区', '330200');
INSERT INTO `ky_district` VALUES ('330225', '象山县', '330200');
INSERT INTO `ky_district` VALUES ('330226', '宁海县', '330200');
INSERT INTO `ky_district` VALUES ('330281', '余姚市', '330200');
INSERT INTO `ky_district` VALUES ('330282', '慈溪市', '330200');
INSERT INTO `ky_district` VALUES ('330283', '奉化市', '330200');
INSERT INTO `ky_district` VALUES ('330300', '温州市', '330000');
INSERT INTO `ky_district` VALUES ('330301', '市辖区', '330300');
INSERT INTO `ky_district` VALUES ('330302', '鹿城区', '330300');
INSERT INTO `ky_district` VALUES ('330303', '龙湾区', '330300');
INSERT INTO `ky_district` VALUES ('330304', '瓯海区', '330300');
INSERT INTO `ky_district` VALUES ('330322', '洞头县', '330300');
INSERT INTO `ky_district` VALUES ('330324', '永嘉县', '330300');
INSERT INTO `ky_district` VALUES ('330326', '平阳县', '330300');
INSERT INTO `ky_district` VALUES ('330327', '苍南县', '330300');
INSERT INTO `ky_district` VALUES ('330328', '文成县', '330300');
INSERT INTO `ky_district` VALUES ('330329', '泰顺县', '330300');
INSERT INTO `ky_district` VALUES ('330381', '瑞安市', '330300');
INSERT INTO `ky_district` VALUES ('330382', '乐清市', '330300');
INSERT INTO `ky_district` VALUES ('330400', '嘉兴市', '330000');
INSERT INTO `ky_district` VALUES ('330401', '市辖区', '330400');
INSERT INTO `ky_district` VALUES ('330402', '南湖区', '330400');
INSERT INTO `ky_district` VALUES ('330411', '秀洲区', '330400');
INSERT INTO `ky_district` VALUES ('330421', '嘉善县', '330400');
INSERT INTO `ky_district` VALUES ('330424', '海盐县', '330400');
INSERT INTO `ky_district` VALUES ('330481', '海宁市', '330400');
INSERT INTO `ky_district` VALUES ('330482', '平湖市', '330400');
INSERT INTO `ky_district` VALUES ('330483', '桐乡市', '330400');
INSERT INTO `ky_district` VALUES ('330500', '湖州市', '330000');
INSERT INTO `ky_district` VALUES ('330501', '市辖区', '330500');
INSERT INTO `ky_district` VALUES ('330502', '吴兴区', '330500');
INSERT INTO `ky_district` VALUES ('330503', '南浔区', '330500');
INSERT INTO `ky_district` VALUES ('330521', '德清县', '330500');
INSERT INTO `ky_district` VALUES ('330522', '长兴县', '330500');
INSERT INTO `ky_district` VALUES ('330523', '安吉县', '330500');
INSERT INTO `ky_district` VALUES ('330600', '绍兴市', '330000');
INSERT INTO `ky_district` VALUES ('330601', '市辖区', '330600');
INSERT INTO `ky_district` VALUES ('330602', '越城区', '330600');
INSERT INTO `ky_district` VALUES ('330603', '柯桥区', '330600');
INSERT INTO `ky_district` VALUES ('330604', '上虞区', '330600');
INSERT INTO `ky_district` VALUES ('330624', '新昌县', '330600');
INSERT INTO `ky_district` VALUES ('330681', '诸暨市', '330600');
INSERT INTO `ky_district` VALUES ('330683', '嵊州市', '330600');
INSERT INTO `ky_district` VALUES ('330700', '金华市', '330000');
INSERT INTO `ky_district` VALUES ('330701', '市辖区', '330700');
INSERT INTO `ky_district` VALUES ('330702', '婺城区', '330700');
INSERT INTO `ky_district` VALUES ('330703', '金东区', '330700');
INSERT INTO `ky_district` VALUES ('330723', '武义县', '330700');
INSERT INTO `ky_district` VALUES ('330726', '浦江县', '330700');
INSERT INTO `ky_district` VALUES ('330727', '磐安县', '330700');
INSERT INTO `ky_district` VALUES ('330781', '兰溪市', '330700');
INSERT INTO `ky_district` VALUES ('330782', '义乌市', '330700');
INSERT INTO `ky_district` VALUES ('330783', '东阳市', '330700');
INSERT INTO `ky_district` VALUES ('330784', '永康市', '330700');
INSERT INTO `ky_district` VALUES ('330800', '衢州市', '330000');
INSERT INTO `ky_district` VALUES ('330801', '市辖区', '330800');
INSERT INTO `ky_district` VALUES ('330802', '柯城区', '330800');
INSERT INTO `ky_district` VALUES ('330803', '衢江区', '330800');
INSERT INTO `ky_district` VALUES ('330822', '常山县', '330800');
INSERT INTO `ky_district` VALUES ('330824', '开化县', '330800');
INSERT INTO `ky_district` VALUES ('330825', '龙游县', '330800');
INSERT INTO `ky_district` VALUES ('330881', '江山市', '330800');
INSERT INTO `ky_district` VALUES ('330900', '舟山市', '330000');
INSERT INTO `ky_district` VALUES ('330901', '市辖区', '330900');
INSERT INTO `ky_district` VALUES ('330902', '定海区', '330900');
INSERT INTO `ky_district` VALUES ('330903', '普陀区', '330900');
INSERT INTO `ky_district` VALUES ('330921', '岱山县', '330900');
INSERT INTO `ky_district` VALUES ('330922', '嵊泗县', '330900');
INSERT INTO `ky_district` VALUES ('331000', '台州市', '330000');
INSERT INTO `ky_district` VALUES ('331001', '市辖区', '331000');
INSERT INTO `ky_district` VALUES ('331002', '椒江区', '331000');
INSERT INTO `ky_district` VALUES ('331003', '黄岩区', '331000');
INSERT INTO `ky_district` VALUES ('331004', '路桥区', '331000');
INSERT INTO `ky_district` VALUES ('331021', '玉环县', '331000');
INSERT INTO `ky_district` VALUES ('331022', '三门县', '331000');
INSERT INTO `ky_district` VALUES ('331023', '天台县', '331000');
INSERT INTO `ky_district` VALUES ('331024', '仙居县', '331000');
INSERT INTO `ky_district` VALUES ('331081', '温岭市', '331000');
INSERT INTO `ky_district` VALUES ('331082', '临海市', '331000');
INSERT INTO `ky_district` VALUES ('331100', '丽水市', '330000');
INSERT INTO `ky_district` VALUES ('331101', '市辖区', '331100');
INSERT INTO `ky_district` VALUES ('331102', '莲都区', '331100');
INSERT INTO `ky_district` VALUES ('331121', '青田县', '331100');
INSERT INTO `ky_district` VALUES ('331122', '缙云县', '331100');
INSERT INTO `ky_district` VALUES ('331123', '遂昌县', '331100');
INSERT INTO `ky_district` VALUES ('331124', '松阳县', '331100');
INSERT INTO `ky_district` VALUES ('331125', '云和县', '331100');
INSERT INTO `ky_district` VALUES ('331126', '庆元县', '331100');
INSERT INTO `ky_district` VALUES ('331127', '景宁畲族自治县', '331100');
INSERT INTO `ky_district` VALUES ('331181', '龙泉市', '331100');
INSERT INTO `ky_district` VALUES ('340000', '安徽省', '0');
INSERT INTO `ky_district` VALUES ('340100', '合肥市', '340000');
INSERT INTO `ky_district` VALUES ('340101', '市辖区', '340100');
INSERT INTO `ky_district` VALUES ('340102', '瑶海区', '340100');
INSERT INTO `ky_district` VALUES ('340103', '庐阳区', '340100');
INSERT INTO `ky_district` VALUES ('340104', '蜀山区', '340100');
INSERT INTO `ky_district` VALUES ('340111', '包河区', '340100');
INSERT INTO `ky_district` VALUES ('340121', '长丰县', '340100');
INSERT INTO `ky_district` VALUES ('340122', '肥东县', '340100');
INSERT INTO `ky_district` VALUES ('340123', '肥西县', '340100');
INSERT INTO `ky_district` VALUES ('340124', '庐江县', '340100');
INSERT INTO `ky_district` VALUES ('340181', '巢湖市', '340100');
INSERT INTO `ky_district` VALUES ('340200', '芜湖市', '340000');
INSERT INTO `ky_district` VALUES ('340201', '市辖区', '340200');
INSERT INTO `ky_district` VALUES ('340202', '镜湖区', '340200');
INSERT INTO `ky_district` VALUES ('340203', '弋江区', '340200');
INSERT INTO `ky_district` VALUES ('340207', '鸠江区', '340200');
INSERT INTO `ky_district` VALUES ('340208', '三山区', '340200');
INSERT INTO `ky_district` VALUES ('340221', '芜湖县', '340200');
INSERT INTO `ky_district` VALUES ('340222', '繁昌县', '340200');
INSERT INTO `ky_district` VALUES ('340223', '南陵县', '340200');
INSERT INTO `ky_district` VALUES ('340225', '无为县', '340200');
INSERT INTO `ky_district` VALUES ('340300', '蚌埠市', '340000');
INSERT INTO `ky_district` VALUES ('340301', '市辖区', '340300');
INSERT INTO `ky_district` VALUES ('340302', '龙子湖区', '340300');
INSERT INTO `ky_district` VALUES ('340303', '蚌山区', '340300');
INSERT INTO `ky_district` VALUES ('340304', '禹会区', '340300');
INSERT INTO `ky_district` VALUES ('340311', '淮上区', '340300');
INSERT INTO `ky_district` VALUES ('340321', '怀远县', '340300');
INSERT INTO `ky_district` VALUES ('340322', '五河县', '340300');
INSERT INTO `ky_district` VALUES ('340323', '固镇县', '340300');
INSERT INTO `ky_district` VALUES ('340400', '淮南市', '340000');
INSERT INTO `ky_district` VALUES ('340401', '市辖区', '340400');
INSERT INTO `ky_district` VALUES ('340402', '大通区', '340400');
INSERT INTO `ky_district` VALUES ('340403', '田家庵区', '340400');
INSERT INTO `ky_district` VALUES ('340404', '谢家集区', '340400');
INSERT INTO `ky_district` VALUES ('340405', '八公山区', '340400');
INSERT INTO `ky_district` VALUES ('340406', '潘集区', '340400');
INSERT INTO `ky_district` VALUES ('340421', '凤台县', '340400');
INSERT INTO `ky_district` VALUES ('340500', '马鞍山市', '340000');
INSERT INTO `ky_district` VALUES ('340501', '市辖区', '340500');
INSERT INTO `ky_district` VALUES ('340503', '花山区', '340500');
INSERT INTO `ky_district` VALUES ('340504', '雨山区', '340500');
INSERT INTO `ky_district` VALUES ('340506', '博望区', '340500');
INSERT INTO `ky_district` VALUES ('340521', '当涂县', '340500');
INSERT INTO `ky_district` VALUES ('340522', '含山县', '340500');
INSERT INTO `ky_district` VALUES ('340523', '和县', '340500');
INSERT INTO `ky_district` VALUES ('340600', '淮北市', '340000');
INSERT INTO `ky_district` VALUES ('340601', '市辖区', '340600');
INSERT INTO `ky_district` VALUES ('340602', '杜集区', '340600');
INSERT INTO `ky_district` VALUES ('340603', '相山区', '340600');
INSERT INTO `ky_district` VALUES ('340604', '烈山区', '340600');
INSERT INTO `ky_district` VALUES ('340621', '濉溪县', '340600');
INSERT INTO `ky_district` VALUES ('340700', '铜陵市', '340000');
INSERT INTO `ky_district` VALUES ('340701', '市辖区', '340700');
INSERT INTO `ky_district` VALUES ('340702', '铜官山区', '340700');
INSERT INTO `ky_district` VALUES ('340703', '狮子山区', '340700');
INSERT INTO `ky_district` VALUES ('340711', '郊区', '340700');
INSERT INTO `ky_district` VALUES ('340721', '铜陵县', '340700');
INSERT INTO `ky_district` VALUES ('340800', '安庆市', '340000');
INSERT INTO `ky_district` VALUES ('340801', '市辖区', '340800');
INSERT INTO `ky_district` VALUES ('340802', '迎江区', '340800');
INSERT INTO `ky_district` VALUES ('340803', '大观区', '340800');
INSERT INTO `ky_district` VALUES ('340811', '宜秀区', '340800');
INSERT INTO `ky_district` VALUES ('340822', '怀宁县', '340800');
INSERT INTO `ky_district` VALUES ('340823', '枞阳县', '340800');
INSERT INTO `ky_district` VALUES ('340824', '潜山县', '340800');
INSERT INTO `ky_district` VALUES ('340825', '太湖县', '340800');
INSERT INTO `ky_district` VALUES ('340826', '宿松县', '340800');
INSERT INTO `ky_district` VALUES ('340827', '望江县', '340800');
INSERT INTO `ky_district` VALUES ('340828', '岳西县', '340800');
INSERT INTO `ky_district` VALUES ('340881', '桐城市', '340800');
INSERT INTO `ky_district` VALUES ('341000', '黄山市', '340000');
INSERT INTO `ky_district` VALUES ('341001', '市辖区', '341000');
INSERT INTO `ky_district` VALUES ('341002', '屯溪区', '341000');
INSERT INTO `ky_district` VALUES ('341003', '黄山区', '341000');
INSERT INTO `ky_district` VALUES ('341004', '徽州区', '341000');
INSERT INTO `ky_district` VALUES ('341021', '歙县', '341000');
INSERT INTO `ky_district` VALUES ('341022', '休宁县', '341000');
INSERT INTO `ky_district` VALUES ('341023', '黟县', '341000');
INSERT INTO `ky_district` VALUES ('341024', '祁门县', '341000');
INSERT INTO `ky_district` VALUES ('341100', '滁州市', '340000');
INSERT INTO `ky_district` VALUES ('341101', '市辖区', '341100');
INSERT INTO `ky_district` VALUES ('341102', '琅琊区', '341100');
INSERT INTO `ky_district` VALUES ('341103', '南谯区', '341100');
INSERT INTO `ky_district` VALUES ('341122', '来安县', '341100');
INSERT INTO `ky_district` VALUES ('341124', '全椒县', '341100');
INSERT INTO `ky_district` VALUES ('341125', '定远县', '341100');
INSERT INTO `ky_district` VALUES ('341126', '凤阳县', '341100');
INSERT INTO `ky_district` VALUES ('341181', '天长市', '341100');
INSERT INTO `ky_district` VALUES ('341182', '明光市', '341100');
INSERT INTO `ky_district` VALUES ('341200', '阜阳市', '340000');
INSERT INTO `ky_district` VALUES ('341201', '市辖区', '341200');
INSERT INTO `ky_district` VALUES ('341202', '颍州区', '341200');
INSERT INTO `ky_district` VALUES ('341203', '颍东区', '341200');
INSERT INTO `ky_district` VALUES ('341204', '颍泉区', '341200');
INSERT INTO `ky_district` VALUES ('341221', '临泉县', '341200');
INSERT INTO `ky_district` VALUES ('341222', '太和县', '341200');
INSERT INTO `ky_district` VALUES ('341225', '阜南县', '341200');
INSERT INTO `ky_district` VALUES ('341226', '颍上县', '341200');
INSERT INTO `ky_district` VALUES ('341282', '界首市', '341200');
INSERT INTO `ky_district` VALUES ('341300', '宿州市', '340000');
INSERT INTO `ky_district` VALUES ('341301', '市辖区', '341300');
INSERT INTO `ky_district` VALUES ('341302', '埇桥区', '341300');
INSERT INTO `ky_district` VALUES ('341321', '砀山县', '341300');
INSERT INTO `ky_district` VALUES ('341322', '萧县', '341300');
INSERT INTO `ky_district` VALUES ('341323', '灵璧县', '341300');
INSERT INTO `ky_district` VALUES ('341324', '泗县', '341300');
INSERT INTO `ky_district` VALUES ('341500', '六安市', '340000');
INSERT INTO `ky_district` VALUES ('341501', '市辖区', '341500');
INSERT INTO `ky_district` VALUES ('341502', '金安区', '341500');
INSERT INTO `ky_district` VALUES ('341503', '裕安区', '341500');
INSERT INTO `ky_district` VALUES ('341521', '寿县', '341500');
INSERT INTO `ky_district` VALUES ('341522', '霍邱县', '341500');
INSERT INTO `ky_district` VALUES ('341523', '舒城县', '341500');
INSERT INTO `ky_district` VALUES ('341524', '金寨县', '341500');
INSERT INTO `ky_district` VALUES ('341525', '霍山县', '341500');
INSERT INTO `ky_district` VALUES ('341600', '亳州市', '340000');
INSERT INTO `ky_district` VALUES ('341601', '市辖区', '341600');
INSERT INTO `ky_district` VALUES ('341602', '谯城区', '341600');
INSERT INTO `ky_district` VALUES ('341621', '涡阳县', '341600');
INSERT INTO `ky_district` VALUES ('341622', '蒙城县', '341600');
INSERT INTO `ky_district` VALUES ('341623', '利辛县', '341600');
INSERT INTO `ky_district` VALUES ('341700', '池州市', '340000');
INSERT INTO `ky_district` VALUES ('341701', '市辖区', '341700');
INSERT INTO `ky_district` VALUES ('341702', '贵池区', '341700');
INSERT INTO `ky_district` VALUES ('341721', '东至县', '341700');
INSERT INTO `ky_district` VALUES ('341722', '石台县', '341700');
INSERT INTO `ky_district` VALUES ('341723', '青阳县', '341700');
INSERT INTO `ky_district` VALUES ('341800', '宣城市', '340000');
INSERT INTO `ky_district` VALUES ('341801', '市辖区', '341800');
INSERT INTO `ky_district` VALUES ('341802', '宣州区', '341800');
INSERT INTO `ky_district` VALUES ('341821', '郎溪县', '341800');
INSERT INTO `ky_district` VALUES ('341822', '广德县', '341800');
INSERT INTO `ky_district` VALUES ('341823', '泾县', '341800');
INSERT INTO `ky_district` VALUES ('341824', '绩溪县', '341800');
INSERT INTO `ky_district` VALUES ('341825', '旌德县', '341800');
INSERT INTO `ky_district` VALUES ('341881', '宁国市', '341800');
INSERT INTO `ky_district` VALUES ('350000', '福建省', '0');
INSERT INTO `ky_district` VALUES ('350100', '福州市', '350000');
INSERT INTO `ky_district` VALUES ('350101', '市辖区', '350100');
INSERT INTO `ky_district` VALUES ('350102', '鼓楼区', '350100');
INSERT INTO `ky_district` VALUES ('350103', '台江区', '350100');
INSERT INTO `ky_district` VALUES ('350104', '仓山区', '350100');
INSERT INTO `ky_district` VALUES ('350105', '马尾区', '350100');
INSERT INTO `ky_district` VALUES ('350111', '晋安区', '350100');
INSERT INTO `ky_district` VALUES ('350121', '闽侯县', '350100');
INSERT INTO `ky_district` VALUES ('350122', '连江县', '350100');
INSERT INTO `ky_district` VALUES ('350123', '罗源县', '350100');
INSERT INTO `ky_district` VALUES ('350124', '闽清县', '350100');
INSERT INTO `ky_district` VALUES ('350125', '永泰县', '350100');
INSERT INTO `ky_district` VALUES ('350128', '平潭县', '350100');
INSERT INTO `ky_district` VALUES ('350181', '福清市', '350100');
INSERT INTO `ky_district` VALUES ('350182', '长乐市', '350100');
INSERT INTO `ky_district` VALUES ('350200', '厦门市', '350000');
INSERT INTO `ky_district` VALUES ('350201', '市辖区', '350200');
INSERT INTO `ky_district` VALUES ('350203', '思明区', '350200');
INSERT INTO `ky_district` VALUES ('350205', '海沧区', '350200');
INSERT INTO `ky_district` VALUES ('350206', '湖里区', '350200');
INSERT INTO `ky_district` VALUES ('350211', '集美区', '350200');
INSERT INTO `ky_district` VALUES ('350212', '同安区', '350200');
INSERT INTO `ky_district` VALUES ('350213', '翔安区', '350200');
INSERT INTO `ky_district` VALUES ('350300', '莆田市', '350000');
INSERT INTO `ky_district` VALUES ('350301', '市辖区', '350300');
INSERT INTO `ky_district` VALUES ('350302', '城厢区', '350300');
INSERT INTO `ky_district` VALUES ('350303', '涵江区', '350300');
INSERT INTO `ky_district` VALUES ('350304', '荔城区', '350300');
INSERT INTO `ky_district` VALUES ('350305', '秀屿区', '350300');
INSERT INTO `ky_district` VALUES ('350322', '仙游县', '350300');
INSERT INTO `ky_district` VALUES ('350400', '三明市', '350000');
INSERT INTO `ky_district` VALUES ('350401', '市辖区', '350400');
INSERT INTO `ky_district` VALUES ('350402', '梅列区', '350400');
INSERT INTO `ky_district` VALUES ('350403', '三元区', '350400');
INSERT INTO `ky_district` VALUES ('350421', '明溪县', '350400');
INSERT INTO `ky_district` VALUES ('350423', '清流县', '350400');
INSERT INTO `ky_district` VALUES ('350424', '宁化县', '350400');
INSERT INTO `ky_district` VALUES ('350425', '大田县', '350400');
INSERT INTO `ky_district` VALUES ('350426', '尤溪县', '350400');
INSERT INTO `ky_district` VALUES ('350427', '沙县', '350400');
INSERT INTO `ky_district` VALUES ('350428', '将乐县', '350400');
INSERT INTO `ky_district` VALUES ('350429', '泰宁县', '350400');
INSERT INTO `ky_district` VALUES ('350430', '建宁县', '350400');
INSERT INTO `ky_district` VALUES ('350481', '永安市', '350400');
INSERT INTO `ky_district` VALUES ('350500', '泉州市', '350000');
INSERT INTO `ky_district` VALUES ('350501', '市辖区', '350500');
INSERT INTO `ky_district` VALUES ('350502', '鲤城区', '350500');
INSERT INTO `ky_district` VALUES ('350503', '丰泽区', '350500');
INSERT INTO `ky_district` VALUES ('350504', '洛江区', '350500');
INSERT INTO `ky_district` VALUES ('350505', '泉港区', '350500');
INSERT INTO `ky_district` VALUES ('350521', '惠安县', '350500');
INSERT INTO `ky_district` VALUES ('350524', '安溪县', '350500');
INSERT INTO `ky_district` VALUES ('350525', '永春县', '350500');
INSERT INTO `ky_district` VALUES ('350526', '德化县', '350500');
INSERT INTO `ky_district` VALUES ('350527', '金门县', '350500');
INSERT INTO `ky_district` VALUES ('350581', '石狮市', '350500');
INSERT INTO `ky_district` VALUES ('350582', '晋江市', '350500');
INSERT INTO `ky_district` VALUES ('350583', '南安市', '350500');
INSERT INTO `ky_district` VALUES ('350600', '漳州市', '350000');
INSERT INTO `ky_district` VALUES ('350601', '市辖区', '350600');
INSERT INTO `ky_district` VALUES ('350602', '芗城区', '350600');
INSERT INTO `ky_district` VALUES ('350603', '龙文区', '350600');
INSERT INTO `ky_district` VALUES ('350622', '云霄县', '350600');
INSERT INTO `ky_district` VALUES ('350623', '漳浦县', '350600');
INSERT INTO `ky_district` VALUES ('350624', '诏安县', '350600');
INSERT INTO `ky_district` VALUES ('350625', '长泰县', '350600');
INSERT INTO `ky_district` VALUES ('350626', '东山县', '350600');
INSERT INTO `ky_district` VALUES ('350627', '南靖县', '350600');
INSERT INTO `ky_district` VALUES ('350628', '平和县', '350600');
INSERT INTO `ky_district` VALUES ('350629', '华安县', '350600');
INSERT INTO `ky_district` VALUES ('350681', '龙海市', '350600');
INSERT INTO `ky_district` VALUES ('350700', '南平市', '350000');
INSERT INTO `ky_district` VALUES ('350701', '市辖区', '350700');
INSERT INTO `ky_district` VALUES ('350702', '延平区', '350700');
INSERT INTO `ky_district` VALUES ('350703', '建阳区', '350700');
INSERT INTO `ky_district` VALUES ('350721', '顺昌县', '350700');
INSERT INTO `ky_district` VALUES ('350722', '浦城县', '350700');
INSERT INTO `ky_district` VALUES ('350723', '光泽县', '350700');
INSERT INTO `ky_district` VALUES ('350724', '松溪县', '350700');
INSERT INTO `ky_district` VALUES ('350725', '政和县', '350700');
INSERT INTO `ky_district` VALUES ('350781', '邵武市', '350700');
INSERT INTO `ky_district` VALUES ('350782', '武夷山市', '350700');
INSERT INTO `ky_district` VALUES ('350783', '建瓯市', '350700');
INSERT INTO `ky_district` VALUES ('350800', '龙岩市', '350000');
INSERT INTO `ky_district` VALUES ('350801', '市辖区', '350800');
INSERT INTO `ky_district` VALUES ('350802', '新罗区', '350800');
INSERT INTO `ky_district` VALUES ('350803', '永定区', '350800');
INSERT INTO `ky_district` VALUES ('350821', '长汀县', '350800');
INSERT INTO `ky_district` VALUES ('350823', '上杭县', '350800');
INSERT INTO `ky_district` VALUES ('350824', '武平县', '350800');
INSERT INTO `ky_district` VALUES ('350825', '连城县', '350800');
INSERT INTO `ky_district` VALUES ('350881', '漳平市', '350800');
INSERT INTO `ky_district` VALUES ('350900', '宁德市', '350000');
INSERT INTO `ky_district` VALUES ('350901', '市辖区', '350900');
INSERT INTO `ky_district` VALUES ('350902', '蕉城区', '350900');
INSERT INTO `ky_district` VALUES ('350921', '霞浦县', '350900');
INSERT INTO `ky_district` VALUES ('350922', '古田县', '350900');
INSERT INTO `ky_district` VALUES ('350923', '屏南县', '350900');
INSERT INTO `ky_district` VALUES ('350924', '寿宁县', '350900');
INSERT INTO `ky_district` VALUES ('350925', '周宁县', '350900');
INSERT INTO `ky_district` VALUES ('350926', '柘荣县', '350900');
INSERT INTO `ky_district` VALUES ('350981', '福安市', '350900');
INSERT INTO `ky_district` VALUES ('350982', '福鼎市', '350900');
INSERT INTO `ky_district` VALUES ('360000', '江西省', '0');
INSERT INTO `ky_district` VALUES ('360100', '南昌市', '360000');
INSERT INTO `ky_district` VALUES ('360101', '市辖区', '360100');
INSERT INTO `ky_district` VALUES ('360102', '东湖区', '360100');
INSERT INTO `ky_district` VALUES ('360103', '西湖区', '360100');
INSERT INTO `ky_district` VALUES ('360104', '青云谱区', '360100');
INSERT INTO `ky_district` VALUES ('360105', '湾里区', '360100');
INSERT INTO `ky_district` VALUES ('360111', '青山湖区', '360100');
INSERT INTO `ky_district` VALUES ('360121', '南昌县', '360100');
INSERT INTO `ky_district` VALUES ('360122', '新建县', '360100');
INSERT INTO `ky_district` VALUES ('360123', '安义县', '360100');
INSERT INTO `ky_district` VALUES ('360124', '进贤县', '360100');
INSERT INTO `ky_district` VALUES ('360200', '景德镇市', '360000');
INSERT INTO `ky_district` VALUES ('360201', '市辖区', '360200');
INSERT INTO `ky_district` VALUES ('360202', '昌江区', '360200');
INSERT INTO `ky_district` VALUES ('360203', '珠山区', '360200');
INSERT INTO `ky_district` VALUES ('360222', '浮梁县', '360200');
INSERT INTO `ky_district` VALUES ('360281', '乐平市', '360200');
INSERT INTO `ky_district` VALUES ('360300', '萍乡市', '360000');
INSERT INTO `ky_district` VALUES ('360301', '市辖区', '360300');
INSERT INTO `ky_district` VALUES ('360302', '安源区', '360300');
INSERT INTO `ky_district` VALUES ('360313', '湘东区', '360300');
INSERT INTO `ky_district` VALUES ('360321', '莲花县', '360300');
INSERT INTO `ky_district` VALUES ('360322', '上栗县', '360300');
INSERT INTO `ky_district` VALUES ('360323', '芦溪县', '360300');
INSERT INTO `ky_district` VALUES ('360400', '九江市', '360000');
INSERT INTO `ky_district` VALUES ('360401', '市辖区', '360400');
INSERT INTO `ky_district` VALUES ('360402', '濂溪区', '360400');
INSERT INTO `ky_district` VALUES ('360403', '浔阳区', '360400');
INSERT INTO `ky_district` VALUES ('360404', '庐山区', '360400');
INSERT INTO `ky_district` VALUES ('360421', '九江县', '360400');
INSERT INTO `ky_district` VALUES ('360423', '武宁县', '360400');
INSERT INTO `ky_district` VALUES ('360424', '修水县', '360400');
INSERT INTO `ky_district` VALUES ('360425', '永修县', '360400');
INSERT INTO `ky_district` VALUES ('360426', '德安县', '360400');
INSERT INTO `ky_district` VALUES ('360427', '星子县', '360400');
INSERT INTO `ky_district` VALUES ('360428', '都昌县', '360400');
INSERT INTO `ky_district` VALUES ('360429', '湖口县', '360400');
INSERT INTO `ky_district` VALUES ('360430', '彭泽县', '360400');
INSERT INTO `ky_district` VALUES ('360481', '瑞昌市', '360400');
INSERT INTO `ky_district` VALUES ('360482', '共青城市', '360400');
INSERT INTO `ky_district` VALUES ('360500', '新余市', '360000');
INSERT INTO `ky_district` VALUES ('360501', '市辖区', '360500');
INSERT INTO `ky_district` VALUES ('360502', '渝水区', '360500');
INSERT INTO `ky_district` VALUES ('360503', '高新区', '360500');
INSERT INTO `ky_district` VALUES ('360521', '分宜县', '360500');
INSERT INTO `ky_district` VALUES ('360600', '鹰潭市', '360000');
INSERT INTO `ky_district` VALUES ('360601', '市辖区', '360600');
INSERT INTO `ky_district` VALUES ('360602', '月湖区', '360600');
INSERT INTO `ky_district` VALUES ('360622', '余江县', '360600');
INSERT INTO `ky_district` VALUES ('360681', '贵溪市', '360600');
INSERT INTO `ky_district` VALUES ('360700', '赣州市', '360000');
INSERT INTO `ky_district` VALUES ('360701', '市辖区', '360700');
INSERT INTO `ky_district` VALUES ('360702', '章贡区', '360700');
INSERT INTO `ky_district` VALUES ('360703', '南康区', '360700');
INSERT INTO `ky_district` VALUES ('360721', '赣县', '360700');
INSERT INTO `ky_district` VALUES ('360722', '信丰县', '360700');
INSERT INTO `ky_district` VALUES ('360723', '大余县', '360700');
INSERT INTO `ky_district` VALUES ('360724', '上犹县', '360700');
INSERT INTO `ky_district` VALUES ('360725', '崇义县', '360700');
INSERT INTO `ky_district` VALUES ('360726', '安远县', '360700');
INSERT INTO `ky_district` VALUES ('360727', '龙南县', '360700');
INSERT INTO `ky_district` VALUES ('360728', '定南县', '360700');
INSERT INTO `ky_district` VALUES ('360729', '全南县', '360700');
INSERT INTO `ky_district` VALUES ('360730', '宁都县', '360700');
INSERT INTO `ky_district` VALUES ('360731', '于都县', '360700');
INSERT INTO `ky_district` VALUES ('360732', '兴国县', '360700');
INSERT INTO `ky_district` VALUES ('360733', '会昌县', '360700');
INSERT INTO `ky_district` VALUES ('360734', '寻乌县', '360700');
INSERT INTO `ky_district` VALUES ('360735', '石城县', '360700');
INSERT INTO `ky_district` VALUES ('360781', '瑞金市', '360700');
INSERT INTO `ky_district` VALUES ('360783', '经济技术开发区', '360700');
INSERT INTO `ky_district` VALUES ('360800', '吉安市', '360000');
INSERT INTO `ky_district` VALUES ('360801', '市辖区', '360800');
INSERT INTO `ky_district` VALUES ('360802', '吉州区', '360800');
INSERT INTO `ky_district` VALUES ('360803', '青原区', '360800');
INSERT INTO `ky_district` VALUES ('360821', '吉安县', '360800');
INSERT INTO `ky_district` VALUES ('360822', '吉水县', '360800');
INSERT INTO `ky_district` VALUES ('360823', '峡江县', '360800');
INSERT INTO `ky_district` VALUES ('360824', '新干县', '360800');
INSERT INTO `ky_district` VALUES ('360825', '永丰县', '360800');
INSERT INTO `ky_district` VALUES ('360826', '泰和县', '360800');
INSERT INTO `ky_district` VALUES ('360827', '遂川县', '360800');
INSERT INTO `ky_district` VALUES ('360828', '万安县', '360800');
INSERT INTO `ky_district` VALUES ('360829', '安福县', '360800');
INSERT INTO `ky_district` VALUES ('360830', '永新县', '360800');
INSERT INTO `ky_district` VALUES ('360881', '井冈山市', '360800');
INSERT INTO `ky_district` VALUES ('360900', '宜春市', '360000');
INSERT INTO `ky_district` VALUES ('360901', '市辖区', '360900');
INSERT INTO `ky_district` VALUES ('360902', '袁州区', '360900');
INSERT INTO `ky_district` VALUES ('360921', '奉新县', '360900');
INSERT INTO `ky_district` VALUES ('360922', '万载县', '360900');
INSERT INTO `ky_district` VALUES ('360923', '上高县', '360900');
INSERT INTO `ky_district` VALUES ('360924', '宜丰县', '360900');
INSERT INTO `ky_district` VALUES ('360925', '靖安县', '360900');
INSERT INTO `ky_district` VALUES ('360926', '铜鼓县', '360900');
INSERT INTO `ky_district` VALUES ('360981', '丰城市', '360900');
INSERT INTO `ky_district` VALUES ('360982', '樟树市', '360900');
INSERT INTO `ky_district` VALUES ('360983', '高安市', '360900');
INSERT INTO `ky_district` VALUES ('361000', '抚州市', '360000');
INSERT INTO `ky_district` VALUES ('361001', '市辖区', '361000');
INSERT INTO `ky_district` VALUES ('361002', '临川区', '361000');
INSERT INTO `ky_district` VALUES ('361021', '南城县', '361000');
INSERT INTO `ky_district` VALUES ('361022', '黎川县', '361000');
INSERT INTO `ky_district` VALUES ('361023', '南丰县', '361000');
INSERT INTO `ky_district` VALUES ('361024', '崇仁县', '361000');
INSERT INTO `ky_district` VALUES ('361025', '乐安县', '361000');
INSERT INTO `ky_district` VALUES ('361026', '宜黄县', '361000');
INSERT INTO `ky_district` VALUES ('361027', '金溪县', '361000');
INSERT INTO `ky_district` VALUES ('361028', '资溪县', '361000');
INSERT INTO `ky_district` VALUES ('361029', '东乡县', '361000');
INSERT INTO `ky_district` VALUES ('361030', '广昌县', '361000');
INSERT INTO `ky_district` VALUES ('361100', '上饶市', '360000');
INSERT INTO `ky_district` VALUES ('361101', '市辖区', '361100');
INSERT INTO `ky_district` VALUES ('361102', '信州区', '361100');
INSERT INTO `ky_district` VALUES ('361121', '上饶县', '361100');
INSERT INTO `ky_district` VALUES ('361122', '广丰县', '361100');
INSERT INTO `ky_district` VALUES ('361123', '玉山县', '361100');
INSERT INTO `ky_district` VALUES ('361124', '铅山县', '361100');
INSERT INTO `ky_district` VALUES ('361125', '横峰县', '361100');
INSERT INTO `ky_district` VALUES ('361126', '弋阳县', '361100');
INSERT INTO `ky_district` VALUES ('361127', '余干县', '361100');
INSERT INTO `ky_district` VALUES ('361128', '鄱阳县', '361100');
INSERT INTO `ky_district` VALUES ('361129', '万年县', '361100');
INSERT INTO `ky_district` VALUES ('361130', '婺源县', '361100');
INSERT INTO `ky_district` VALUES ('361181', '德兴市', '361100');
INSERT INTO `ky_district` VALUES ('370000', '山东省', '0');
INSERT INTO `ky_district` VALUES ('370100', '济南市', '370000');
INSERT INTO `ky_district` VALUES ('370101', '市辖区', '370100');
INSERT INTO `ky_district` VALUES ('370102', '历下区', '370100');
INSERT INTO `ky_district` VALUES ('370103', '市中区', '370100');
INSERT INTO `ky_district` VALUES ('370104', '槐荫区', '370100');
INSERT INTO `ky_district` VALUES ('370105', '天桥区', '370100');
INSERT INTO `ky_district` VALUES ('370112', '历城区', '370100');
INSERT INTO `ky_district` VALUES ('370113', '长清区', '370100');
INSERT INTO `ky_district` VALUES ('370124', '平阴县', '370100');
INSERT INTO `ky_district` VALUES ('370125', '济阳县', '370100');
INSERT INTO `ky_district` VALUES ('370126', '商河县', '370100');
INSERT INTO `ky_district` VALUES ('370130', '莱芜区', '370100');
INSERT INTO `ky_district` VALUES ('370181', '章丘市', '370100');
INSERT INTO `ky_district` VALUES ('370200', '青岛市', '370000');
INSERT INTO `ky_district` VALUES ('370201', '市辖区', '370200');
INSERT INTO `ky_district` VALUES ('370202', '市南区', '370200');
INSERT INTO `ky_district` VALUES ('370203', '市北区', '370200');
INSERT INTO `ky_district` VALUES ('370211', '黄岛区', '370200');
INSERT INTO `ky_district` VALUES ('370212', '崂山区', '370200');
INSERT INTO `ky_district` VALUES ('370213', '李沧区', '370200');
INSERT INTO `ky_district` VALUES ('370214', '城阳区', '370200');
INSERT INTO `ky_district` VALUES ('370281', '胶州市', '370200');
INSERT INTO `ky_district` VALUES ('370282', '即墨市', '370200');
INSERT INTO `ky_district` VALUES ('370283', '平度市', '370200');
INSERT INTO `ky_district` VALUES ('370285', '莱西市', '370200');
INSERT INTO `ky_district` VALUES ('370300', '淄博市', '370000');
INSERT INTO `ky_district` VALUES ('370301', '市辖区', '370300');
INSERT INTO `ky_district` VALUES ('370302', '淄川区', '370300');
INSERT INTO `ky_district` VALUES ('370303', '张店区', '370300');
INSERT INTO `ky_district` VALUES ('370304', '博山区', '370300');
INSERT INTO `ky_district` VALUES ('370305', '临淄区', '370300');
INSERT INTO `ky_district` VALUES ('370306', '周村区', '370300');
INSERT INTO `ky_district` VALUES ('370321', '桓台县', '370300');
INSERT INTO `ky_district` VALUES ('370322', '高青县', '370300');
INSERT INTO `ky_district` VALUES ('370323', '沂源县', '370300');
INSERT INTO `ky_district` VALUES ('370400', '枣庄市', '370000');
INSERT INTO `ky_district` VALUES ('370401', '市辖区', '370400');
INSERT INTO `ky_district` VALUES ('370402', '市中区', '370400');
INSERT INTO `ky_district` VALUES ('370403', '薛城区', '370400');
INSERT INTO `ky_district` VALUES ('370404', '峄城区', '370400');
INSERT INTO `ky_district` VALUES ('370405', '台儿庄区', '370400');
INSERT INTO `ky_district` VALUES ('370406', '山亭区', '370400');
INSERT INTO `ky_district` VALUES ('370481', '滕州市', '370400');
INSERT INTO `ky_district` VALUES ('370500', '东营市', '370000');
INSERT INTO `ky_district` VALUES ('370501', '市辖区', '370500');
INSERT INTO `ky_district` VALUES ('370502', '东营区', '370500');
INSERT INTO `ky_district` VALUES ('370503', '河口区', '370500');
INSERT INTO `ky_district` VALUES ('370521', '垦利县', '370500');
INSERT INTO `ky_district` VALUES ('370522', '利津县', '370500');
INSERT INTO `ky_district` VALUES ('370523', '广饶县', '370500');
INSERT INTO `ky_district` VALUES ('370600', '烟台市', '370000');
INSERT INTO `ky_district` VALUES ('370601', '市辖区', '370600');
INSERT INTO `ky_district` VALUES ('370602', '芝罘区', '370600');
INSERT INTO `ky_district` VALUES ('370611', '福山区', '370600');
INSERT INTO `ky_district` VALUES ('370612', '牟平区', '370600');
INSERT INTO `ky_district` VALUES ('370613', '莱山区', '370600');
INSERT INTO `ky_district` VALUES ('370634', '长岛县', '370600');
INSERT INTO `ky_district` VALUES ('370681', '龙口市', '370600');
INSERT INTO `ky_district` VALUES ('370682', '莱阳市', '370600');
INSERT INTO `ky_district` VALUES ('370683', '莱州市', '370600');
INSERT INTO `ky_district` VALUES ('370684', '蓬莱市', '370600');
INSERT INTO `ky_district` VALUES ('370685', '招远市', '370600');
INSERT INTO `ky_district` VALUES ('370686', '栖霞市', '370600');
INSERT INTO `ky_district` VALUES ('370687', '海阳市', '370600');
INSERT INTO `ky_district` VALUES ('370700', '潍坊市', '370000');
INSERT INTO `ky_district` VALUES ('370701', '市辖区', '370700');
INSERT INTO `ky_district` VALUES ('370702', '潍城区', '370700');
INSERT INTO `ky_district` VALUES ('370703', '寒亭区', '370700');
INSERT INTO `ky_district` VALUES ('370704', '坊子区', '370700');
INSERT INTO `ky_district` VALUES ('370705', '奎文区', '370700');
INSERT INTO `ky_district` VALUES ('370724', '临朐县', '370700');
INSERT INTO `ky_district` VALUES ('370725', '昌乐县', '370700');
INSERT INTO `ky_district` VALUES ('370781', '青州市', '370700');
INSERT INTO `ky_district` VALUES ('370782', '诸城市', '370700');
INSERT INTO `ky_district` VALUES ('370783', '寿光市', '370700');
INSERT INTO `ky_district` VALUES ('370784', '安丘市', '370700');
INSERT INTO `ky_district` VALUES ('370785', '高密市', '370700');
INSERT INTO `ky_district` VALUES ('370786', '昌邑市', '370700');
INSERT INTO `ky_district` VALUES ('370800', '济宁市', '370000');
INSERT INTO `ky_district` VALUES ('370801', '市辖区', '370800');
INSERT INTO `ky_district` VALUES ('370811', '任城区', '370800');
INSERT INTO `ky_district` VALUES ('370812', '兖州区', '370800');
INSERT INTO `ky_district` VALUES ('370826', '微山县', '370800');
INSERT INTO `ky_district` VALUES ('370827', '鱼台县', '370800');
INSERT INTO `ky_district` VALUES ('370828', '金乡县', '370800');
INSERT INTO `ky_district` VALUES ('370829', '嘉祥县', '370800');
INSERT INTO `ky_district` VALUES ('370830', '汶上县', '370800');
INSERT INTO `ky_district` VALUES ('370831', '泗水县', '370800');
INSERT INTO `ky_district` VALUES ('370832', '梁山县', '370800');
INSERT INTO `ky_district` VALUES ('370881', '曲阜市', '370800');
INSERT INTO `ky_district` VALUES ('370883', '邹城市', '370800');
INSERT INTO `ky_district` VALUES ('370900', '泰安市', '370000');
INSERT INTO `ky_district` VALUES ('370901', '市辖区', '370900');
INSERT INTO `ky_district` VALUES ('370902', '泰山区', '370900');
INSERT INTO `ky_district` VALUES ('370911', '岱岳区', '370900');
INSERT INTO `ky_district` VALUES ('370921', '宁阳县', '370900');
INSERT INTO `ky_district` VALUES ('370923', '东平县', '370900');
INSERT INTO `ky_district` VALUES ('370982', '新泰市', '370900');
INSERT INTO `ky_district` VALUES ('370983', '肥城市', '370900');
INSERT INTO `ky_district` VALUES ('371000', '威海市', '370000');
INSERT INTO `ky_district` VALUES ('371001', '市辖区', '371000');
INSERT INTO `ky_district` VALUES ('371002', '环翠区', '371000');
INSERT INTO `ky_district` VALUES ('371081', '文登市', '371000');
INSERT INTO `ky_district` VALUES ('371082', '荣成市', '371000');
INSERT INTO `ky_district` VALUES ('371083', '乳山市', '371000');
INSERT INTO `ky_district` VALUES ('371100', '日照市', '370000');
INSERT INTO `ky_district` VALUES ('371101', '市辖区', '371100');
INSERT INTO `ky_district` VALUES ('371102', '东港区', '371100');
INSERT INTO `ky_district` VALUES ('371103', '岚山区', '371100');
INSERT INTO `ky_district` VALUES ('371121', '五莲县', '371100');
INSERT INTO `ky_district` VALUES ('371122', '莒县', '371100');
INSERT INTO `ky_district` VALUES ('371200', '莱芜市', '370000');
INSERT INTO `ky_district` VALUES ('371201', '市辖区', '371200');
INSERT INTO `ky_district` VALUES ('371202', '莱城区', '371200');
INSERT INTO `ky_district` VALUES ('371203', '钢城区', '371200');
INSERT INTO `ky_district` VALUES ('371300', '临沂市', '370000');
INSERT INTO `ky_district` VALUES ('371301', '市辖区', '371300');
INSERT INTO `ky_district` VALUES ('371302', '兰山区', '371300');
INSERT INTO `ky_district` VALUES ('371311', '罗庄区', '371300');
INSERT INTO `ky_district` VALUES ('371312', '河东区', '371300');
INSERT INTO `ky_district` VALUES ('371321', '沂南县', '371300');
INSERT INTO `ky_district` VALUES ('371322', '郯城县', '371300');
INSERT INTO `ky_district` VALUES ('371323', '沂水县', '371300');
INSERT INTO `ky_district` VALUES ('371324', '兰陵县', '371300');
INSERT INTO `ky_district` VALUES ('371325', '费县', '371300');
INSERT INTO `ky_district` VALUES ('371326', '平邑县', '371300');
INSERT INTO `ky_district` VALUES ('371327', '莒南县', '371300');
INSERT INTO `ky_district` VALUES ('371328', '蒙阴县', '371300');
INSERT INTO `ky_district` VALUES ('371329', '临沭县', '371300');
INSERT INTO `ky_district` VALUES ('371400', '德州市', '370000');
INSERT INTO `ky_district` VALUES ('371401', '市辖区', '371400');
INSERT INTO `ky_district` VALUES ('371402', '德城区', '371400');
INSERT INTO `ky_district` VALUES ('371403', '陵城区', '371400');
INSERT INTO `ky_district` VALUES ('371422', '宁津县', '371400');
INSERT INTO `ky_district` VALUES ('371423', '庆云县', '371400');
INSERT INTO `ky_district` VALUES ('371424', '临邑县', '371400');
INSERT INTO `ky_district` VALUES ('371425', '齐河县', '371400');
INSERT INTO `ky_district` VALUES ('371426', '平原县', '371400');
INSERT INTO `ky_district` VALUES ('371427', '夏津县', '371400');
INSERT INTO `ky_district` VALUES ('371428', '武城县', '371400');
INSERT INTO `ky_district` VALUES ('371481', '乐陵市', '371400');
INSERT INTO `ky_district` VALUES ('371482', '禹城市', '371400');
INSERT INTO `ky_district` VALUES ('371500', '聊城市', '370000');
INSERT INTO `ky_district` VALUES ('371501', '市辖区', '371500');
INSERT INTO `ky_district` VALUES ('371502', '东昌府区', '371500');
INSERT INTO `ky_district` VALUES ('371521', '阳谷县', '371500');
INSERT INTO `ky_district` VALUES ('371522', '莘县', '371500');
INSERT INTO `ky_district` VALUES ('371523', '茌平县', '371500');
INSERT INTO `ky_district` VALUES ('371524', '东阿县', '371500');
INSERT INTO `ky_district` VALUES ('371525', '冠县', '371500');
INSERT INTO `ky_district` VALUES ('371526', '高唐县', '371500');
INSERT INTO `ky_district` VALUES ('371581', '临清市', '371500');
INSERT INTO `ky_district` VALUES ('371600', '滨州市', '370000');
INSERT INTO `ky_district` VALUES ('371601', '市辖区', '371600');
INSERT INTO `ky_district` VALUES ('371602', '滨城区', '371600');
INSERT INTO `ky_district` VALUES ('371603', '沾化区', '371600');
INSERT INTO `ky_district` VALUES ('371621', '惠民县', '371600');
INSERT INTO `ky_district` VALUES ('371622', '阳信县', '371600');
INSERT INTO `ky_district` VALUES ('371623', '无棣县', '371600');
INSERT INTO `ky_district` VALUES ('371625', '博兴县', '371600');
INSERT INTO `ky_district` VALUES ('371626', '邹平县', '371600');
INSERT INTO `ky_district` VALUES ('371700', '菏泽市', '370000');
INSERT INTO `ky_district` VALUES ('371701', '市辖区', '371700');
INSERT INTO `ky_district` VALUES ('371702', '牡丹区', '371700');
INSERT INTO `ky_district` VALUES ('371721', '曹县', '371700');
INSERT INTO `ky_district` VALUES ('371722', '单县', '371700');
INSERT INTO `ky_district` VALUES ('371723', '成武县', '371700');
INSERT INTO `ky_district` VALUES ('371724', '巨野县', '371700');
INSERT INTO `ky_district` VALUES ('371725', '郓城县', '371700');
INSERT INTO `ky_district` VALUES ('371726', '鄄城县', '371700');
INSERT INTO `ky_district` VALUES ('371727', '定陶县', '371700');
INSERT INTO `ky_district` VALUES ('371728', '东明县', '371700');
INSERT INTO `ky_district` VALUES ('410000', '河南省', '0');
INSERT INTO `ky_district` VALUES ('410100', '郑州市', '410000');
INSERT INTO `ky_district` VALUES ('410101', '市辖区', '410100');
INSERT INTO `ky_district` VALUES ('410102', '中原区', '410100');
INSERT INTO `ky_district` VALUES ('410103', '二七区', '410100');
INSERT INTO `ky_district` VALUES ('410104', '管城回族区', '410100');
INSERT INTO `ky_district` VALUES ('410105', '金水区', '410100');
INSERT INTO `ky_district` VALUES ('410106', '上街区', '410100');
INSERT INTO `ky_district` VALUES ('410108', '惠济区', '410100');
INSERT INTO `ky_district` VALUES ('410122', '中牟县', '410100');
INSERT INTO `ky_district` VALUES ('410181', '巩义市', '410100');
INSERT INTO `ky_district` VALUES ('410182', '荥阳市', '410100');
INSERT INTO `ky_district` VALUES ('410183', '新密市', '410100');
INSERT INTO `ky_district` VALUES ('410184', '新郑市', '410100');
INSERT INTO `ky_district` VALUES ('410185', '登封市', '410100');
INSERT INTO `ky_district` VALUES ('410186', '郑东新区', '410100');
INSERT INTO `ky_district` VALUES ('410200', '开封市', '410000');
INSERT INTO `ky_district` VALUES ('410201', '市辖区', '410200');
INSERT INTO `ky_district` VALUES ('410202', '龙亭区', '410200');
INSERT INTO `ky_district` VALUES ('410203', '顺河回族区', '410200');
INSERT INTO `ky_district` VALUES ('410204', '鼓楼区', '410200');
INSERT INTO `ky_district` VALUES ('410205', '禹王台区', '410200');
INSERT INTO `ky_district` VALUES ('410211', '金明新区', '410200');
INSERT INTO `ky_district` VALUES ('410212', '祥符区', '410200');
INSERT INTO `ky_district` VALUES ('410221', '杞县', '410200');
INSERT INTO `ky_district` VALUES ('410222', '通许县', '410200');
INSERT INTO `ky_district` VALUES ('410223', '尉氏县', '410200');
INSERT INTO `ky_district` VALUES ('410225', '兰考县', '410200');
INSERT INTO `ky_district` VALUES ('410300', '洛阳市', '410000');
INSERT INTO `ky_district` VALUES ('410301', '市辖区', '410300');
INSERT INTO `ky_district` VALUES ('410302', '老城区', '410300');
INSERT INTO `ky_district` VALUES ('410303', '西工区', '410300');
INSERT INTO `ky_district` VALUES ('410304', '瀍河回族区', '410300');
INSERT INTO `ky_district` VALUES ('410305', '涧西区', '410300');
INSERT INTO `ky_district` VALUES ('410306', '吉利区', '410300');
INSERT INTO `ky_district` VALUES ('410311', '洛龙区', '410300');
INSERT INTO `ky_district` VALUES ('410322', '孟津县', '410300');
INSERT INTO `ky_district` VALUES ('410323', '新安县', '410300');
INSERT INTO `ky_district` VALUES ('410324', '栾川县', '410300');
INSERT INTO `ky_district` VALUES ('410325', '嵩县', '410300');
INSERT INTO `ky_district` VALUES ('410326', '汝阳县', '410300');
INSERT INTO `ky_district` VALUES ('410327', '宜阳县', '410300');
INSERT INTO `ky_district` VALUES ('410328', '洛宁县', '410300');
INSERT INTO `ky_district` VALUES ('410329', '伊川县', '410300');
INSERT INTO `ky_district` VALUES ('410381', '偃师市', '410300');
INSERT INTO `ky_district` VALUES ('410400', '平顶山市', '410000');
INSERT INTO `ky_district` VALUES ('410401', '市辖区', '410400');
INSERT INTO `ky_district` VALUES ('410402', '新华区', '410400');
INSERT INTO `ky_district` VALUES ('410403', '卫东区', '410400');
INSERT INTO `ky_district` VALUES ('410404', '石龙区', '410400');
INSERT INTO `ky_district` VALUES ('410411', '湛河区', '410400');
INSERT INTO `ky_district` VALUES ('410421', '宝丰县', '410400');
INSERT INTO `ky_district` VALUES ('410422', '叶县', '410400');
INSERT INTO `ky_district` VALUES ('410423', '鲁山县', '410400');
INSERT INTO `ky_district` VALUES ('410425', '郏县', '410400');
INSERT INTO `ky_district` VALUES ('410481', '舞钢市', '410400');
INSERT INTO `ky_district` VALUES ('410482', '汝州市', '410400');
INSERT INTO `ky_district` VALUES ('410500', '安阳市', '410000');
INSERT INTO `ky_district` VALUES ('410501', '市辖区', '410500');
INSERT INTO `ky_district` VALUES ('410502', '文峰区', '410500');
INSERT INTO `ky_district` VALUES ('410503', '北关区', '410500');
INSERT INTO `ky_district` VALUES ('410505', '殷都区', '410500');
INSERT INTO `ky_district` VALUES ('410506', '龙安区', '410500');
INSERT INTO `ky_district` VALUES ('410522', '安阳县', '410500');
INSERT INTO `ky_district` VALUES ('410523', '汤阴县', '410500');
INSERT INTO `ky_district` VALUES ('410526', '滑县', '410500');
INSERT INTO `ky_district` VALUES ('410527', '内黄县', '410500');
INSERT INTO `ky_district` VALUES ('410581', '林州市', '410500');
INSERT INTO `ky_district` VALUES ('410600', '鹤壁市', '410000');
INSERT INTO `ky_district` VALUES ('410601', '市辖区', '410600');
INSERT INTO `ky_district` VALUES ('410602', '鹤山区', '410600');
INSERT INTO `ky_district` VALUES ('410603', '山城区', '410600');
INSERT INTO `ky_district` VALUES ('410611', '淇滨区', '410600');
INSERT INTO `ky_district` VALUES ('410621', '浚县', '410600');
INSERT INTO `ky_district` VALUES ('410622', '淇县', '410600');
INSERT INTO `ky_district` VALUES ('410700', '新乡市', '410000');
INSERT INTO `ky_district` VALUES ('410701', '市辖区', '410700');
INSERT INTO `ky_district` VALUES ('410702', '红旗区', '410700');
INSERT INTO `ky_district` VALUES ('410703', '卫滨区', '410700');
INSERT INTO `ky_district` VALUES ('410704', '凤泉区', '410700');
INSERT INTO `ky_district` VALUES ('410711', '牧野区', '410700');
INSERT INTO `ky_district` VALUES ('410721', '新乡县', '410700');
INSERT INTO `ky_district` VALUES ('410724', '获嘉县', '410700');
INSERT INTO `ky_district` VALUES ('410725', '原阳县', '410700');
INSERT INTO `ky_district` VALUES ('410726', '延津县', '410700');
INSERT INTO `ky_district` VALUES ('410727', '封丘县', '410700');
INSERT INTO `ky_district` VALUES ('410728', '长垣县', '410700');
INSERT INTO `ky_district` VALUES ('410781', '卫辉市', '410700');
INSERT INTO `ky_district` VALUES ('410782', '辉县市', '410700');
INSERT INTO `ky_district` VALUES ('410800', '焦作市', '410000');
INSERT INTO `ky_district` VALUES ('410801', '市辖区', '410800');
INSERT INTO `ky_district` VALUES ('410802', '解放区', '410800');
INSERT INTO `ky_district` VALUES ('410803', '中站区', '410800');
INSERT INTO `ky_district` VALUES ('410804', '马村区', '410800');
INSERT INTO `ky_district` VALUES ('410811', '山阳区', '410800');
INSERT INTO `ky_district` VALUES ('410821', '修武县', '410800');
INSERT INTO `ky_district` VALUES ('410822', '博爱县', '410800');
INSERT INTO `ky_district` VALUES ('410823', '武陟县', '410800');
INSERT INTO `ky_district` VALUES ('410825', '温县', '410800');
INSERT INTO `ky_district` VALUES ('410882', '沁阳市', '410800');
INSERT INTO `ky_district` VALUES ('410883', '孟州市', '410800');
INSERT INTO `ky_district` VALUES ('410900', '濮阳市', '410000');
INSERT INTO `ky_district` VALUES ('410901', '市辖区', '410900');
INSERT INTO `ky_district` VALUES ('410902', '华龙区', '410900');
INSERT INTO `ky_district` VALUES ('410922', '清丰县', '410900');
INSERT INTO `ky_district` VALUES ('410923', '南乐县', '410900');
INSERT INTO `ky_district` VALUES ('410926', '范县', '410900');
INSERT INTO `ky_district` VALUES ('410927', '台前县', '410900');
INSERT INTO `ky_district` VALUES ('410928', '濮阳县', '410900');
INSERT INTO `ky_district` VALUES ('411000', '许昌市', '410000');
INSERT INTO `ky_district` VALUES ('411001', '市辖区', '411000');
INSERT INTO `ky_district` VALUES ('411002', '魏都区', '411000');
INSERT INTO `ky_district` VALUES ('411023', '许昌县', '411000');
INSERT INTO `ky_district` VALUES ('411024', '鄢陵县', '411000');
INSERT INTO `ky_district` VALUES ('411025', '襄城县', '411000');
INSERT INTO `ky_district` VALUES ('411081', '禹州市', '411000');
INSERT INTO `ky_district` VALUES ('411082', '长葛市', '411000');
INSERT INTO `ky_district` VALUES ('411100', '漯河市', '410000');
INSERT INTO `ky_district` VALUES ('411101', '市辖区', '411100');
INSERT INTO `ky_district` VALUES ('411102', '源汇区', '411100');
INSERT INTO `ky_district` VALUES ('411103', '郾城区', '411100');
INSERT INTO `ky_district` VALUES ('411104', '召陵区', '411100');
INSERT INTO `ky_district` VALUES ('411121', '舞阳县', '411100');
INSERT INTO `ky_district` VALUES ('411122', '临颍县', '411100');
INSERT INTO `ky_district` VALUES ('411200', '三门峡市', '410000');
INSERT INTO `ky_district` VALUES ('411201', '市辖区', '411200');
INSERT INTO `ky_district` VALUES ('411202', '湖滨区', '411200');
INSERT INTO `ky_district` VALUES ('411221', '渑池县', '411200');
INSERT INTO `ky_district` VALUES ('411222', '陕县', '411200');
INSERT INTO `ky_district` VALUES ('411224', '卢氏县', '411200');
INSERT INTO `ky_district` VALUES ('411281', '义马市', '411200');
INSERT INTO `ky_district` VALUES ('411282', '灵宝市', '411200');
INSERT INTO `ky_district` VALUES ('411300', '南阳市', '410000');
INSERT INTO `ky_district` VALUES ('411301', '市辖区', '411300');
INSERT INTO `ky_district` VALUES ('411302', '宛城区', '411300');
INSERT INTO `ky_district` VALUES ('411303', '卧龙区', '411300');
INSERT INTO `ky_district` VALUES ('411321', '南召县', '411300');
INSERT INTO `ky_district` VALUES ('411322', '方城县', '411300');
INSERT INTO `ky_district` VALUES ('411323', '西峡县', '411300');
INSERT INTO `ky_district` VALUES ('411324', '镇平县', '411300');
INSERT INTO `ky_district` VALUES ('411325', '内乡县', '411300');
INSERT INTO `ky_district` VALUES ('411326', '淅川县', '411300');
INSERT INTO `ky_district` VALUES ('411327', '社旗县', '411300');
INSERT INTO `ky_district` VALUES ('411328', '唐河县', '411300');
INSERT INTO `ky_district` VALUES ('411329', '新野县', '411300');
INSERT INTO `ky_district` VALUES ('411330', '桐柏县', '411300');
INSERT INTO `ky_district` VALUES ('411381', '邓州市', '411300');
INSERT INTO `ky_district` VALUES ('411400', '商丘市', '410000');
INSERT INTO `ky_district` VALUES ('411401', '市辖区', '411400');
INSERT INTO `ky_district` VALUES ('411402', '梁园区', '411400');
INSERT INTO `ky_district` VALUES ('411403', '睢阳区', '411400');
INSERT INTO `ky_district` VALUES ('411421', '民权县', '411400');
INSERT INTO `ky_district` VALUES ('411422', '睢县', '411400');
INSERT INTO `ky_district` VALUES ('411423', '宁陵县', '411400');
INSERT INTO `ky_district` VALUES ('411424', '柘城县', '411400');
INSERT INTO `ky_district` VALUES ('411425', '虞城县', '411400');
INSERT INTO `ky_district` VALUES ('411426', '夏邑县', '411400');
INSERT INTO `ky_district` VALUES ('411481', '永城市', '411400');
INSERT INTO `ky_district` VALUES ('411500', '信阳市', '410000');
INSERT INTO `ky_district` VALUES ('411501', '市辖区', '411500');
INSERT INTO `ky_district` VALUES ('411502', '浉河区', '411500');
INSERT INTO `ky_district` VALUES ('411503', '平桥区', '411500');
INSERT INTO `ky_district` VALUES ('411521', '罗山县', '411500');
INSERT INTO `ky_district` VALUES ('411522', '光山县', '411500');
INSERT INTO `ky_district` VALUES ('411523', '新县', '411500');
INSERT INTO `ky_district` VALUES ('411524', '商城县', '411500');
INSERT INTO `ky_district` VALUES ('411525', '固始县', '411500');
INSERT INTO `ky_district` VALUES ('411526', '潢川县', '411500');
INSERT INTO `ky_district` VALUES ('411527', '淮滨县', '411500');
INSERT INTO `ky_district` VALUES ('411528', '息县', '411500');
INSERT INTO `ky_district` VALUES ('411600', '周口市', '410000');
INSERT INTO `ky_district` VALUES ('411601', '市辖区', '411600');
INSERT INTO `ky_district` VALUES ('411602', '川汇区', '411600');
INSERT INTO `ky_district` VALUES ('411621', '扶沟县', '411600');
INSERT INTO `ky_district` VALUES ('411622', '西华县', '411600');
INSERT INTO `ky_district` VALUES ('411623', '商水县', '411600');
INSERT INTO `ky_district` VALUES ('411624', '沈丘县', '411600');
INSERT INTO `ky_district` VALUES ('411625', '郸城县', '411600');
INSERT INTO `ky_district` VALUES ('411626', '淮阳县', '411600');
INSERT INTO `ky_district` VALUES ('411627', '太康县', '411600');
INSERT INTO `ky_district` VALUES ('411628', '鹿邑县', '411600');
INSERT INTO `ky_district` VALUES ('411681', '项城市', '411600');
INSERT INTO `ky_district` VALUES ('411700', '驻马店市', '410000');
INSERT INTO `ky_district` VALUES ('411701', '市辖区', '411700');
INSERT INTO `ky_district` VALUES ('411702', '驿城区', '411700');
INSERT INTO `ky_district` VALUES ('411721', '西平县', '411700');
INSERT INTO `ky_district` VALUES ('411722', '上蔡县', '411700');
INSERT INTO `ky_district` VALUES ('411723', '平舆县', '411700');
INSERT INTO `ky_district` VALUES ('411724', '正阳县', '411700');
INSERT INTO `ky_district` VALUES ('411725', '确山县', '411700');
INSERT INTO `ky_district` VALUES ('411726', '泌阳县', '411700');
INSERT INTO `ky_district` VALUES ('411727', '汝南县', '411700');
INSERT INTO `ky_district` VALUES ('411728', '遂平县', '411700');
INSERT INTO `ky_district` VALUES ('411729', '新蔡县', '411700');
INSERT INTO `ky_district` VALUES ('419000', '济源市', '410000');
INSERT INTO `ky_district` VALUES ('419001', '济源市', '410000');
INSERT INTO `ky_district` VALUES ('420000', '湖北省', '0');
INSERT INTO `ky_district` VALUES ('420100', '武汉市', '420000');
INSERT INTO `ky_district` VALUES ('420101', '市辖区', '420100');
INSERT INTO `ky_district` VALUES ('420102', '江岸区', '420100');
INSERT INTO `ky_district` VALUES ('420103', '江汉区', '420100');
INSERT INTO `ky_district` VALUES ('420104', '硚口区', '420100');
INSERT INTO `ky_district` VALUES ('420105', '汉阳区', '420100');
INSERT INTO `ky_district` VALUES ('420106', '武昌区', '420100');
INSERT INTO `ky_district` VALUES ('420107', '青山区', '420100');
INSERT INTO `ky_district` VALUES ('420111', '洪山区', '420100');
INSERT INTO `ky_district` VALUES ('420112', '东西湖区', '420100');
INSERT INTO `ky_district` VALUES ('420113', '汉南区', '420100');
INSERT INTO `ky_district` VALUES ('420114', '蔡甸区', '420100');
INSERT INTO `ky_district` VALUES ('420115', '江夏区', '420100');
INSERT INTO `ky_district` VALUES ('420116', '黄陂区', '420100');
INSERT INTO `ky_district` VALUES ('420117', '新洲区', '420100');
INSERT INTO `ky_district` VALUES ('420200', '黄石市', '420000');
INSERT INTO `ky_district` VALUES ('420201', '市辖区', '420200');
INSERT INTO `ky_district` VALUES ('420202', '黄石港区', '420200');
INSERT INTO `ky_district` VALUES ('420203', '西塞山区', '420200');
INSERT INTO `ky_district` VALUES ('420204', '下陆区', '420200');
INSERT INTO `ky_district` VALUES ('420205', '铁山区', '420200');
INSERT INTO `ky_district` VALUES ('420222', '阳新县', '420200');
INSERT INTO `ky_district` VALUES ('420281', '大冶市', '420200');
INSERT INTO `ky_district` VALUES ('420300', '十堰市', '420000');
INSERT INTO `ky_district` VALUES ('420301', '市辖区', '420300');
INSERT INTO `ky_district` VALUES ('420302', '茅箭区', '420300');
INSERT INTO `ky_district` VALUES ('420303', '张湾区', '420300');
INSERT INTO `ky_district` VALUES ('420304', '郧阳区', '420300');
INSERT INTO `ky_district` VALUES ('420322', '郧西县', '420300');
INSERT INTO `ky_district` VALUES ('420323', '竹山县', '420300');
INSERT INTO `ky_district` VALUES ('420324', '竹溪县', '420300');
INSERT INTO `ky_district` VALUES ('420325', '房县', '420300');
INSERT INTO `ky_district` VALUES ('420381', '丹江口市', '420300');
INSERT INTO `ky_district` VALUES ('420500', '宜昌市', '420000');
INSERT INTO `ky_district` VALUES ('420501', '市辖区', '420500');
INSERT INTO `ky_district` VALUES ('420502', '西陵区', '420500');
INSERT INTO `ky_district` VALUES ('420503', '伍家岗区', '420500');
INSERT INTO `ky_district` VALUES ('420504', '点军区', '420500');
INSERT INTO `ky_district` VALUES ('420505', '猇亭区', '420500');
INSERT INTO `ky_district` VALUES ('420506', '夷陵区', '420500');
INSERT INTO `ky_district` VALUES ('420525', '远安县', '420500');
INSERT INTO `ky_district` VALUES ('420526', '兴山县', '420500');
INSERT INTO `ky_district` VALUES ('420527', '秭归县', '420500');
INSERT INTO `ky_district` VALUES ('420528', '长阳土家族自治县', '420500');
INSERT INTO `ky_district` VALUES ('420529', '五峰土家族自治县', '420500');
INSERT INTO `ky_district` VALUES ('420581', '宜都市', '420500');
INSERT INTO `ky_district` VALUES ('420582', '当阳市', '420500');
INSERT INTO `ky_district` VALUES ('420583', '枝江市', '420500');
INSERT INTO `ky_district` VALUES ('420600', '襄阳市', '420000');
INSERT INTO `ky_district` VALUES ('420601', '市辖区', '420600');
INSERT INTO `ky_district` VALUES ('420602', '襄城区', '420600');
INSERT INTO `ky_district` VALUES ('420606', '樊城区', '420600');
INSERT INTO `ky_district` VALUES ('420607', '襄州区', '420600');
INSERT INTO `ky_district` VALUES ('420624', '南漳县', '420600');
INSERT INTO `ky_district` VALUES ('420625', '谷城县', '420600');
INSERT INTO `ky_district` VALUES ('420626', '保康县', '420600');
INSERT INTO `ky_district` VALUES ('420682', '老河口市', '420600');
INSERT INTO `ky_district` VALUES ('420683', '枣阳市', '420600');
INSERT INTO `ky_district` VALUES ('420684', '宜城市', '420600');
INSERT INTO `ky_district` VALUES ('420700', '鄂州市', '420000');
INSERT INTO `ky_district` VALUES ('420701', '市辖区', '420700');
INSERT INTO `ky_district` VALUES ('420702', '梁子湖区', '420700');
INSERT INTO `ky_district` VALUES ('420703', '华容区', '420700');
INSERT INTO `ky_district` VALUES ('420704', '鄂城区', '420700');
INSERT INTO `ky_district` VALUES ('420800', '荆门市', '420000');
INSERT INTO `ky_district` VALUES ('420801', '市辖区', '420800');
INSERT INTO `ky_district` VALUES ('420802', '东宝区', '420800');
INSERT INTO `ky_district` VALUES ('420804', '掇刀区', '420800');
INSERT INTO `ky_district` VALUES ('420821', '京山县', '420800');
INSERT INTO `ky_district` VALUES ('420822', '沙洋县', '420800');
INSERT INTO `ky_district` VALUES ('420881', '钟祥市', '420800');
INSERT INTO `ky_district` VALUES ('420900', '孝感市', '420000');
INSERT INTO `ky_district` VALUES ('420901', '市辖区', '420900');
INSERT INTO `ky_district` VALUES ('420902', '孝南区', '420900');
INSERT INTO `ky_district` VALUES ('420921', '孝昌县', '420900');
INSERT INTO `ky_district` VALUES ('420922', '大悟县', '420900');
INSERT INTO `ky_district` VALUES ('420923', '云梦县', '420900');
INSERT INTO `ky_district` VALUES ('420981', '应城市', '420900');
INSERT INTO `ky_district` VALUES ('420982', '安陆市', '420900');
INSERT INTO `ky_district` VALUES ('420984', '汉川市', '420900');
INSERT INTO `ky_district` VALUES ('421000', '荆州市', '420000');
INSERT INTO `ky_district` VALUES ('421001', '市辖区', '421000');
INSERT INTO `ky_district` VALUES ('421002', '沙市区', '421000');
INSERT INTO `ky_district` VALUES ('421003', '荆州区', '421000');
INSERT INTO `ky_district` VALUES ('421022', '公安县', '421000');
INSERT INTO `ky_district` VALUES ('421023', '监利县', '421000');
INSERT INTO `ky_district` VALUES ('421024', '江陵县', '421000');
INSERT INTO `ky_district` VALUES ('421081', '石首市', '421000');
INSERT INTO `ky_district` VALUES ('421083', '洪湖市', '421000');
INSERT INTO `ky_district` VALUES ('421087', '松滋市', '421000');
INSERT INTO `ky_district` VALUES ('421100', '黄冈市', '420000');
INSERT INTO `ky_district` VALUES ('421101', '市辖区', '421100');
INSERT INTO `ky_district` VALUES ('421102', '黄州区', '421100');
INSERT INTO `ky_district` VALUES ('421121', '团风县', '421100');
INSERT INTO `ky_district` VALUES ('421122', '红安县', '421100');
INSERT INTO `ky_district` VALUES ('421123', '罗田县', '421100');
INSERT INTO `ky_district` VALUES ('421124', '英山县', '421100');
INSERT INTO `ky_district` VALUES ('421125', '浠水县', '421100');
INSERT INTO `ky_district` VALUES ('421126', '蕲春县', '421100');
INSERT INTO `ky_district` VALUES ('421127', '黄梅县', '421100');
INSERT INTO `ky_district` VALUES ('421181', '麻城市', '421100');
INSERT INTO `ky_district` VALUES ('421182', '武穴市', '421100');
INSERT INTO `ky_district` VALUES ('421200', '咸宁市', '420000');
INSERT INTO `ky_district` VALUES ('421201', '市辖区', '421200');
INSERT INTO `ky_district` VALUES ('421202', '咸安区', '421200');
INSERT INTO `ky_district` VALUES ('421221', '嘉鱼县', '421200');
INSERT INTO `ky_district` VALUES ('421222', '通城县', '421200');
INSERT INTO `ky_district` VALUES ('421223', '崇阳县', '421200');
INSERT INTO `ky_district` VALUES ('421224', '通山县', '421200');
INSERT INTO `ky_district` VALUES ('421281', '赤壁市', '421200');
INSERT INTO `ky_district` VALUES ('421300', '随州市', '420000');
INSERT INTO `ky_district` VALUES ('421301', '市辖区', '421300');
INSERT INTO `ky_district` VALUES ('421303', '曾都区', '421300');
INSERT INTO `ky_district` VALUES ('421321', '随县', '421300');
INSERT INTO `ky_district` VALUES ('421381', '广水市', '421300');
INSERT INTO `ky_district` VALUES ('422800', '恩施土家族苗族自治州', '420000');
INSERT INTO `ky_district` VALUES ('422801', '恩施市', '422800');
INSERT INTO `ky_district` VALUES ('422802', '利川市', '422800');
INSERT INTO `ky_district` VALUES ('422822', '建始县', '422800');
INSERT INTO `ky_district` VALUES ('422823', '巴东县', '422800');
INSERT INTO `ky_district` VALUES ('422825', '宣恩县', '422800');
INSERT INTO `ky_district` VALUES ('422826', '咸丰县', '422800');
INSERT INTO `ky_district` VALUES ('422827', '来凤县', '422800');
INSERT INTO `ky_district` VALUES ('422828', '鹤峰县', '422800');
INSERT INTO `ky_district` VALUES ('429004', '仙桃市', '420000');
INSERT INTO `ky_district` VALUES ('429005', '潜江市', '420000');
INSERT INTO `ky_district` VALUES ('429006', '天门市', '420000');
INSERT INTO `ky_district` VALUES ('429021', '神农架林区', '420000');
INSERT INTO `ky_district` VALUES ('430000', '湖南省', '0');
INSERT INTO `ky_district` VALUES ('430100', '长沙市', '430000');
INSERT INTO `ky_district` VALUES ('430101', '市辖区', '430100');
INSERT INTO `ky_district` VALUES ('430102', '芙蓉区', '430100');
INSERT INTO `ky_district` VALUES ('430103', '天心区', '430100');
INSERT INTO `ky_district` VALUES ('430104', '岳麓区', '430100');
INSERT INTO `ky_district` VALUES ('430105', '开福区', '430100');
INSERT INTO `ky_district` VALUES ('430111', '雨花区', '430100');
INSERT INTO `ky_district` VALUES ('430112', '望城区', '430100');
INSERT INTO `ky_district` VALUES ('430121', '长沙县', '430100');
INSERT INTO `ky_district` VALUES ('430124', '宁乡县', '430100');
INSERT INTO `ky_district` VALUES ('430181', '浏阳市', '430100');
INSERT INTO `ky_district` VALUES ('430200', '株洲市', '430000');
INSERT INTO `ky_district` VALUES ('430201', '市辖区', '430200');
INSERT INTO `ky_district` VALUES ('430202', '荷塘区', '430200');
INSERT INTO `ky_district` VALUES ('430203', '芦淞区', '430200');
INSERT INTO `ky_district` VALUES ('430204', '石峰区', '430200');
INSERT INTO `ky_district` VALUES ('430211', '天元区', '430200');
INSERT INTO `ky_district` VALUES ('430221', '株洲县', '430200');
INSERT INTO `ky_district` VALUES ('430223', '攸县', '430200');
INSERT INTO `ky_district` VALUES ('430224', '茶陵县', '430200');
INSERT INTO `ky_district` VALUES ('430225', '炎陵县', '430200');
INSERT INTO `ky_district` VALUES ('430281', '醴陵市', '430200');
INSERT INTO `ky_district` VALUES ('430300', '湘潭市', '430000');
INSERT INTO `ky_district` VALUES ('430301', '市辖区', '430300');
INSERT INTO `ky_district` VALUES ('430302', '雨湖区', '430300');
INSERT INTO `ky_district` VALUES ('430304', '岳塘区', '430300');
INSERT INTO `ky_district` VALUES ('430321', '湘潭县', '430300');
INSERT INTO `ky_district` VALUES ('430381', '湘乡市', '430300');
INSERT INTO `ky_district` VALUES ('430382', '韶山市', '430300');
INSERT INTO `ky_district` VALUES ('430400', '衡阳市', '430000');
INSERT INTO `ky_district` VALUES ('430401', '市辖区', '430400');
INSERT INTO `ky_district` VALUES ('430405', '珠晖区', '430400');
INSERT INTO `ky_district` VALUES ('430406', '雁峰区', '430400');
INSERT INTO `ky_district` VALUES ('430407', '石鼓区', '430400');
INSERT INTO `ky_district` VALUES ('430408', '蒸湘区', '430400');
INSERT INTO `ky_district` VALUES ('430412', '南岳区', '430400');
INSERT INTO `ky_district` VALUES ('430421', '衡阳县', '430400');
INSERT INTO `ky_district` VALUES ('430422', '衡南县', '430400');
INSERT INTO `ky_district` VALUES ('430423', '衡山县', '430400');
INSERT INTO `ky_district` VALUES ('430424', '衡东县', '430400');
INSERT INTO `ky_district` VALUES ('430426', '祁东县', '430400');
INSERT INTO `ky_district` VALUES ('430481', '耒阳市', '430400');
INSERT INTO `ky_district` VALUES ('430482', '常宁市', '430400');
INSERT INTO `ky_district` VALUES ('430500', '邵阳市', '430000');
INSERT INTO `ky_district` VALUES ('430501', '市辖区', '430500');
INSERT INTO `ky_district` VALUES ('430502', '双清区', '430500');
INSERT INTO `ky_district` VALUES ('430503', '大祥区', '430500');
INSERT INTO `ky_district` VALUES ('430511', '北塔区', '430500');
INSERT INTO `ky_district` VALUES ('430521', '邵东县', '430500');
INSERT INTO `ky_district` VALUES ('430522', '新邵县', '430500');
INSERT INTO `ky_district` VALUES ('430523', '邵阳县', '430500');
INSERT INTO `ky_district` VALUES ('430524', '隆回县', '430500');
INSERT INTO `ky_district` VALUES ('430525', '洞口县', '430500');
INSERT INTO `ky_district` VALUES ('430527', '绥宁县', '430500');
INSERT INTO `ky_district` VALUES ('430528', '新宁县', '430500');
INSERT INTO `ky_district` VALUES ('430529', '城步苗族自治县', '430500');
INSERT INTO `ky_district` VALUES ('430581', '武冈市', '430500');
INSERT INTO `ky_district` VALUES ('430600', '岳阳市', '430000');
INSERT INTO `ky_district` VALUES ('430601', '市辖区', '430600');
INSERT INTO `ky_district` VALUES ('430602', '岳阳楼区', '430600');
INSERT INTO `ky_district` VALUES ('430603', '云溪区', '430600');
INSERT INTO `ky_district` VALUES ('430611', '君山区', '430600');
INSERT INTO `ky_district` VALUES ('430621', '岳阳县', '430600');
INSERT INTO `ky_district` VALUES ('430623', '华容县', '430600');
INSERT INTO `ky_district` VALUES ('430624', '湘阴县', '430600');
INSERT INTO `ky_district` VALUES ('430626', '平江县', '430600');
INSERT INTO `ky_district` VALUES ('430681', '汨罗市', '430600');
INSERT INTO `ky_district` VALUES ('430682', '临湘市', '430600');
INSERT INTO `ky_district` VALUES ('430700', '常德市', '430000');
INSERT INTO `ky_district` VALUES ('430701', '市辖区', '430700');
INSERT INTO `ky_district` VALUES ('430702', '武陵区', '430700');
INSERT INTO `ky_district` VALUES ('430703', '鼎城区', '430700');
INSERT INTO `ky_district` VALUES ('430721', '安乡县', '430700');
INSERT INTO `ky_district` VALUES ('430722', '汉寿县', '430700');
INSERT INTO `ky_district` VALUES ('430723', '澧县', '430700');
INSERT INTO `ky_district` VALUES ('430724', '临澧县', '430700');
INSERT INTO `ky_district` VALUES ('430725', '桃源县', '430700');
INSERT INTO `ky_district` VALUES ('430726', '石门县', '430700');
INSERT INTO `ky_district` VALUES ('430781', '津市市', '430700');
INSERT INTO `ky_district` VALUES ('430800', '张家界市', '430000');
INSERT INTO `ky_district` VALUES ('430801', '市辖区', '430800');
INSERT INTO `ky_district` VALUES ('430802', '永定区', '430800');
INSERT INTO `ky_district` VALUES ('430811', '武陵源区', '430800');
INSERT INTO `ky_district` VALUES ('430821', '慈利县', '430800');
INSERT INTO `ky_district` VALUES ('430822', '桑植县', '430800');
INSERT INTO `ky_district` VALUES ('430900', '益阳市', '430000');
INSERT INTO `ky_district` VALUES ('430901', '市辖区', '430900');
INSERT INTO `ky_district` VALUES ('430902', '资阳区', '430900');
INSERT INTO `ky_district` VALUES ('430903', '赫山区', '430900');
INSERT INTO `ky_district` VALUES ('430921', '南县', '430900');
INSERT INTO `ky_district` VALUES ('430922', '桃江县', '430900');
INSERT INTO `ky_district` VALUES ('430923', '安化县', '430900');
INSERT INTO `ky_district` VALUES ('430981', '沅江市', '430900');
INSERT INTO `ky_district` VALUES ('431000', '郴州市', '430000');
INSERT INTO `ky_district` VALUES ('431001', '市辖区', '431000');
INSERT INTO `ky_district` VALUES ('431002', '北湖区', '431000');
INSERT INTO `ky_district` VALUES ('431003', '苏仙区', '431000');
INSERT INTO `ky_district` VALUES ('431021', '桂阳县', '431000');
INSERT INTO `ky_district` VALUES ('431022', '宜章县', '431000');
INSERT INTO `ky_district` VALUES ('431023', '永兴县', '431000');
INSERT INTO `ky_district` VALUES ('431024', '嘉禾县', '431000');
INSERT INTO `ky_district` VALUES ('431025', '临武县', '431000');
INSERT INTO `ky_district` VALUES ('431026', '汝城县', '431000');
INSERT INTO `ky_district` VALUES ('431027', '桂东县', '431000');
INSERT INTO `ky_district` VALUES ('431028', '安仁县', '431000');
INSERT INTO `ky_district` VALUES ('431081', '资兴市', '431000');
INSERT INTO `ky_district` VALUES ('431100', '永州市', '430000');
INSERT INTO `ky_district` VALUES ('431101', '市辖区', '431100');
INSERT INTO `ky_district` VALUES ('431102', '零陵区', '431100');
INSERT INTO `ky_district` VALUES ('431103', '冷水滩区', '431100');
INSERT INTO `ky_district` VALUES ('431121', '祁阳县', '431100');
INSERT INTO `ky_district` VALUES ('431122', '东安县', '431100');
INSERT INTO `ky_district` VALUES ('431123', '双牌县', '431100');
INSERT INTO `ky_district` VALUES ('431124', '道县', '431100');
INSERT INTO `ky_district` VALUES ('431125', '江永县', '431100');
INSERT INTO `ky_district` VALUES ('431126', '宁远县', '431100');
INSERT INTO `ky_district` VALUES ('431127', '蓝山县', '431100');
INSERT INTO `ky_district` VALUES ('431128', '新田县', '431100');
INSERT INTO `ky_district` VALUES ('431129', '江华瑶族自治县', '431100');
INSERT INTO `ky_district` VALUES ('431200', '怀化市', '430000');
INSERT INTO `ky_district` VALUES ('431201', '市辖区', '431200');
INSERT INTO `ky_district` VALUES ('431202', '鹤城区', '431200');
INSERT INTO `ky_district` VALUES ('431221', '中方县', '431200');
INSERT INTO `ky_district` VALUES ('431222', '沅陵县', '431200');
INSERT INTO `ky_district` VALUES ('431223', '辰溪县', '431200');
INSERT INTO `ky_district` VALUES ('431224', '溆浦县', '431200');
INSERT INTO `ky_district` VALUES ('431225', '会同县', '431200');
INSERT INTO `ky_district` VALUES ('431226', '麻阳苗族自治县', '431200');
INSERT INTO `ky_district` VALUES ('431227', '新晃侗族自治县', '431200');
INSERT INTO `ky_district` VALUES ('431228', '芷江侗族自治县', '431200');
INSERT INTO `ky_district` VALUES ('431229', '靖州苗族侗族自治县', '431200');
INSERT INTO `ky_district` VALUES ('431230', '通道侗族自治县', '431200');
INSERT INTO `ky_district` VALUES ('431281', '洪江市', '431200');
INSERT INTO `ky_district` VALUES ('431300', '娄底市', '430000');
INSERT INTO `ky_district` VALUES ('431301', '市辖区', '431300');
INSERT INTO `ky_district` VALUES ('431302', '娄星区', '431300');
INSERT INTO `ky_district` VALUES ('431321', '双峰县', '431300');
INSERT INTO `ky_district` VALUES ('431322', '新化县', '431300');
INSERT INTO `ky_district` VALUES ('431381', '冷水江市', '431300');
INSERT INTO `ky_district` VALUES ('431382', '涟源市', '431300');
INSERT INTO `ky_district` VALUES ('433100', '湘西土家族苗族自治州', '430000');
INSERT INTO `ky_district` VALUES ('433101', '吉首市', '433100');
INSERT INTO `ky_district` VALUES ('433122', '泸溪县', '433100');
INSERT INTO `ky_district` VALUES ('433123', '凤凰县', '433100');
INSERT INTO `ky_district` VALUES ('433124', '花垣县', '433100');
INSERT INTO `ky_district` VALUES ('433125', '保靖县', '433100');
INSERT INTO `ky_district` VALUES ('433126', '古丈县', '433100');
INSERT INTO `ky_district` VALUES ('433127', '永顺县', '433100');
INSERT INTO `ky_district` VALUES ('433130', '龙山县', '433100');
INSERT INTO `ky_district` VALUES ('440000', '广东省', '0');
INSERT INTO `ky_district` VALUES ('440100', '广州市', '440000');
INSERT INTO `ky_district` VALUES ('440101', '市辖区', '440100');
INSERT INTO `ky_district` VALUES ('440103', '荔湾区', '440100');
INSERT INTO `ky_district` VALUES ('440104', '越秀区', '440100');
INSERT INTO `ky_district` VALUES ('440105', '海珠区', '440100');
INSERT INTO `ky_district` VALUES ('440106', '天河区', '440100');
INSERT INTO `ky_district` VALUES ('440111', '白云区', '440100');
INSERT INTO `ky_district` VALUES ('440112', '黄埔区', '440100');
INSERT INTO `ky_district` VALUES ('440113', '番禺区', '440100');
INSERT INTO `ky_district` VALUES ('440114', '花都区', '440100');
INSERT INTO `ky_district` VALUES ('440115', '南沙区', '440100');
INSERT INTO `ky_district` VALUES ('440117', '从化区', '440100');
INSERT INTO `ky_district` VALUES ('440118', '增城区', '440100');
INSERT INTO `ky_district` VALUES ('440200', '韶关市', '440000');
INSERT INTO `ky_district` VALUES ('440201', '市辖区', '440200');
INSERT INTO `ky_district` VALUES ('440203', '武江区', '440200');
INSERT INTO `ky_district` VALUES ('440204', '浈江区', '440200');
INSERT INTO `ky_district` VALUES ('440205', '曲江区', '440200');
INSERT INTO `ky_district` VALUES ('440222', '始兴县', '440200');
INSERT INTO `ky_district` VALUES ('440224', '仁化县', '440200');
INSERT INTO `ky_district` VALUES ('440229', '翁源县', '440200');
INSERT INTO `ky_district` VALUES ('440232', '乳源瑶族自治县', '440200');
INSERT INTO `ky_district` VALUES ('440233', '新丰县', '440200');
INSERT INTO `ky_district` VALUES ('440281', '乐昌市', '440200');
INSERT INTO `ky_district` VALUES ('440282', '南雄市', '440200');
INSERT INTO `ky_district` VALUES ('440300', '深圳市', '440000');
INSERT INTO `ky_district` VALUES ('440301', '市辖区', '440300');
INSERT INTO `ky_district` VALUES ('440303', '罗湖区', '440300');
INSERT INTO `ky_district` VALUES ('440304', '福田区', '440300');
INSERT INTO `ky_district` VALUES ('440305', '南山区', '440300');
INSERT INTO `ky_district` VALUES ('440306', '宝安区', '440300');
INSERT INTO `ky_district` VALUES ('440307', '龙岗区', '440300');
INSERT INTO `ky_district` VALUES ('440308', '盐田区', '440300');
INSERT INTO `ky_district` VALUES ('440400', '珠海市', '440000');
INSERT INTO `ky_district` VALUES ('440401', '市辖区', '440400');
INSERT INTO `ky_district` VALUES ('440402', '香洲区', '440400');
INSERT INTO `ky_district` VALUES ('440403', '斗门区', '440400');
INSERT INTO `ky_district` VALUES ('440404', '金湾区', '440400');
INSERT INTO `ky_district` VALUES ('440500', '汕头市', '440000');
INSERT INTO `ky_district` VALUES ('440501', '市辖区', '440500');
INSERT INTO `ky_district` VALUES ('440507', '龙湖区', '440500');
INSERT INTO `ky_district` VALUES ('440511', '金平区', '440500');
INSERT INTO `ky_district` VALUES ('440512', '濠江区', '440500');
INSERT INTO `ky_district` VALUES ('440513', '潮阳区', '440500');
INSERT INTO `ky_district` VALUES ('440514', '潮南区', '440500');
INSERT INTO `ky_district` VALUES ('440515', '澄海区', '440500');
INSERT INTO `ky_district` VALUES ('440523', '南澳县', '440500');
INSERT INTO `ky_district` VALUES ('440600', '佛山市', '440000');
INSERT INTO `ky_district` VALUES ('440601', '市辖区', '440600');
INSERT INTO `ky_district` VALUES ('440604', '禅城区', '440600');
INSERT INTO `ky_district` VALUES ('440605', '南海区', '440600');
INSERT INTO `ky_district` VALUES ('440606', '顺德区', '440600');
INSERT INTO `ky_district` VALUES ('440607', '三水区', '440600');
INSERT INTO `ky_district` VALUES ('440608', '高明区', '440600');
INSERT INTO `ky_district` VALUES ('440700', '江门市', '440000');
INSERT INTO `ky_district` VALUES ('440701', '市辖区', '440700');
INSERT INTO `ky_district` VALUES ('440703', '蓬江区', '440700');
INSERT INTO `ky_district` VALUES ('440704', '江海区', '440700');
INSERT INTO `ky_district` VALUES ('440705', '新会区', '440700');
INSERT INTO `ky_district` VALUES ('440781', '台山市', '440700');
INSERT INTO `ky_district` VALUES ('440783', '开平市', '440700');
INSERT INTO `ky_district` VALUES ('440784', '鹤山市', '440700');
INSERT INTO `ky_district` VALUES ('440785', '恩平市', '440700');
INSERT INTO `ky_district` VALUES ('440800', '湛江市', '440000');
INSERT INTO `ky_district` VALUES ('440801', '市辖区', '440800');
INSERT INTO `ky_district` VALUES ('440802', '赤坎区', '440800');
INSERT INTO `ky_district` VALUES ('440803', '霞山区', '440800');
INSERT INTO `ky_district` VALUES ('440804', '坡头区', '440800');
INSERT INTO `ky_district` VALUES ('440811', '麻章区', '440800');
INSERT INTO `ky_district` VALUES ('440823', '遂溪县', '440800');
INSERT INTO `ky_district` VALUES ('440825', '徐闻县', '440800');
INSERT INTO `ky_district` VALUES ('440881', '廉江市', '440800');
INSERT INTO `ky_district` VALUES ('440882', '雷州市', '440800');
INSERT INTO `ky_district` VALUES ('440883', '吴川市', '440800');
INSERT INTO `ky_district` VALUES ('440900', '茂名市', '440000');
INSERT INTO `ky_district` VALUES ('440901', '市辖区', '440900');
INSERT INTO `ky_district` VALUES ('440902', '茂南区', '440900');
INSERT INTO `ky_district` VALUES ('440904', '电白区', '440900');
INSERT INTO `ky_district` VALUES ('440981', '高州市', '440900');
INSERT INTO `ky_district` VALUES ('440982', '化州市', '440900');
INSERT INTO `ky_district` VALUES ('440983', '信宜市', '440900');
INSERT INTO `ky_district` VALUES ('441200', '肇庆市', '440000');
INSERT INTO `ky_district` VALUES ('441201', '市辖区', '441200');
INSERT INTO `ky_district` VALUES ('441202', '端州区', '441200');
INSERT INTO `ky_district` VALUES ('441203', '鼎湖区', '441200');
INSERT INTO `ky_district` VALUES ('441223', '广宁县', '441200');
INSERT INTO `ky_district` VALUES ('441224', '怀集县', '441200');
INSERT INTO `ky_district` VALUES ('441225', '封开县', '441200');
INSERT INTO `ky_district` VALUES ('441226', '德庆县', '441200');
INSERT INTO `ky_district` VALUES ('441283', '高要市', '441200');
INSERT INTO `ky_district` VALUES ('441284', '四会市', '441200');
INSERT INTO `ky_district` VALUES ('441300', '惠州市', '440000');
INSERT INTO `ky_district` VALUES ('441301', '市辖区', '441300');
INSERT INTO `ky_district` VALUES ('441302', '惠城区', '441300');
INSERT INTO `ky_district` VALUES ('441303', '惠阳区', '441300');
INSERT INTO `ky_district` VALUES ('441322', '博罗县', '441300');
INSERT INTO `ky_district` VALUES ('441323', '惠东县', '441300');
INSERT INTO `ky_district` VALUES ('441324', '龙门县', '441300');
INSERT INTO `ky_district` VALUES ('441400', '梅州市', '440000');
INSERT INTO `ky_district` VALUES ('441401', '市辖区', '441400');
INSERT INTO `ky_district` VALUES ('441402', '梅江区', '441400');
INSERT INTO `ky_district` VALUES ('441403', '梅县区', '441400');
INSERT INTO `ky_district` VALUES ('441422', '大埔县', '441400');
INSERT INTO `ky_district` VALUES ('441423', '丰顺县', '441400');
INSERT INTO `ky_district` VALUES ('441424', '五华县', '441400');
INSERT INTO `ky_district` VALUES ('441426', '平远县', '441400');
INSERT INTO `ky_district` VALUES ('441427', '蕉岭县', '441400');
INSERT INTO `ky_district` VALUES ('441481', '兴宁市', '441400');
INSERT INTO `ky_district` VALUES ('441500', '汕尾市', '440000');
INSERT INTO `ky_district` VALUES ('441501', '市辖区', '441500');
INSERT INTO `ky_district` VALUES ('441502', '城区', '441500');
INSERT INTO `ky_district` VALUES ('441521', '海丰县', '441500');
INSERT INTO `ky_district` VALUES ('441523', '陆河县', '441500');
INSERT INTO `ky_district` VALUES ('441581', '陆丰市', '441500');
INSERT INTO `ky_district` VALUES ('441600', '河源市', '440000');
INSERT INTO `ky_district` VALUES ('441601', '市辖区', '441600');
INSERT INTO `ky_district` VALUES ('441602', '源城区', '441600');
INSERT INTO `ky_district` VALUES ('441621', '紫金县', '441600');
INSERT INTO `ky_district` VALUES ('441622', '龙川县', '441600');
INSERT INTO `ky_district` VALUES ('441623', '连平县', '441600');
INSERT INTO `ky_district` VALUES ('441624', '和平县', '441600');
INSERT INTO `ky_district` VALUES ('441625', '东源县', '441600');
INSERT INTO `ky_district` VALUES ('441700', '阳江市', '440000');
INSERT INTO `ky_district` VALUES ('441701', '市辖区', '441700');
INSERT INTO `ky_district` VALUES ('441702', '江城区', '441700');
INSERT INTO `ky_district` VALUES ('441704', '阳东区', '441700');
INSERT INTO `ky_district` VALUES ('441721', '阳西县', '441700');
INSERT INTO `ky_district` VALUES ('441781', '阳春市', '441700');
INSERT INTO `ky_district` VALUES ('441800', '清远市', '440000');
INSERT INTO `ky_district` VALUES ('441801', '市辖区', '441800');
INSERT INTO `ky_district` VALUES ('441802', '清城区', '441800');
INSERT INTO `ky_district` VALUES ('441803', '清新区', '441800');
INSERT INTO `ky_district` VALUES ('441821', '佛冈县', '441800');
INSERT INTO `ky_district` VALUES ('441823', '阳山县', '441800');
INSERT INTO `ky_district` VALUES ('441825', '连山壮族瑶族自治县', '441800');
INSERT INTO `ky_district` VALUES ('441826', '连南瑶族自治县', '441800');
INSERT INTO `ky_district` VALUES ('441881', '英德市', '441800');
INSERT INTO `ky_district` VALUES ('441882', '连州市', '441800');
INSERT INTO `ky_district` VALUES ('441900', '东莞市', '440000');
INSERT INTO `ky_district` VALUES ('442000', '中山市', '440000');
INSERT INTO `ky_district` VALUES ('445100', '潮州市', '440000');
INSERT INTO `ky_district` VALUES ('445101', '市辖区', '445100');
INSERT INTO `ky_district` VALUES ('445102', '湘桥区', '445100');
INSERT INTO `ky_district` VALUES ('445103', '潮安区', '445100');
INSERT INTO `ky_district` VALUES ('445122', '饶平县', '445100');
INSERT INTO `ky_district` VALUES ('445200', '揭阳市', '440000');
INSERT INTO `ky_district` VALUES ('445201', '市辖区', '445200');
INSERT INTO `ky_district` VALUES ('445202', '榕城区', '445200');
INSERT INTO `ky_district` VALUES ('445203', '揭东区', '445200');
INSERT INTO `ky_district` VALUES ('445222', '揭西县', '445200');
INSERT INTO `ky_district` VALUES ('445224', '惠来县', '445200');
INSERT INTO `ky_district` VALUES ('445281', '普宁市', '445200');
INSERT INTO `ky_district` VALUES ('445300', '云浮市', '440000');
INSERT INTO `ky_district` VALUES ('445301', '市辖区', '445300');
INSERT INTO `ky_district` VALUES ('445302', '云城区', '445300');
INSERT INTO `ky_district` VALUES ('445303', '云安区', '445300');
INSERT INTO `ky_district` VALUES ('445321', '新兴县', '445300');
INSERT INTO `ky_district` VALUES ('445322', '郁南县', '445300');
INSERT INTO `ky_district` VALUES ('445381', '罗定市', '445300');
INSERT INTO `ky_district` VALUES ('450000', '广西壮族自治区', '0');
INSERT INTO `ky_district` VALUES ('450100', '南宁市', '450000');
INSERT INTO `ky_district` VALUES ('450101', '市辖区', '450100');
INSERT INTO `ky_district` VALUES ('450102', '兴宁区', '450100');
INSERT INTO `ky_district` VALUES ('450103', '青秀区', '450100');
INSERT INTO `ky_district` VALUES ('450105', '江南区', '450100');
INSERT INTO `ky_district` VALUES ('450107', '西乡塘区', '450100');
INSERT INTO `ky_district` VALUES ('450108', '良庆区', '450100');
INSERT INTO `ky_district` VALUES ('450109', '邕宁区', '450100');
INSERT INTO `ky_district` VALUES ('450122', '武鸣县', '450100');
INSERT INTO `ky_district` VALUES ('450123', '隆安县', '450100');
INSERT INTO `ky_district` VALUES ('450124', '马山县', '450100');
INSERT INTO `ky_district` VALUES ('450125', '上林县', '450100');
INSERT INTO `ky_district` VALUES ('450126', '宾阳县', '450100');
INSERT INTO `ky_district` VALUES ('450127', '横县', '450100');
INSERT INTO `ky_district` VALUES ('450200', '柳州市', '450000');
INSERT INTO `ky_district` VALUES ('450201', '市辖区', '450200');
INSERT INTO `ky_district` VALUES ('450202', '城中区', '450200');
INSERT INTO `ky_district` VALUES ('450203', '鱼峰区', '450200');
INSERT INTO `ky_district` VALUES ('450204', '柳南区', '450200');
INSERT INTO `ky_district` VALUES ('450205', '柳北区', '450200');
INSERT INTO `ky_district` VALUES ('450221', '柳江县', '450200');
INSERT INTO `ky_district` VALUES ('450222', '柳城县', '450200');
INSERT INTO `ky_district` VALUES ('450223', '鹿寨县', '450200');
INSERT INTO `ky_district` VALUES ('450224', '融安县', '450200');
INSERT INTO `ky_district` VALUES ('450225', '融水苗族自治县', '450200');
INSERT INTO `ky_district` VALUES ('450226', '三江侗族自治县', '450200');
INSERT INTO `ky_district` VALUES ('450300', '桂林市', '450000');
INSERT INTO `ky_district` VALUES ('450301', '市辖区', '450300');
INSERT INTO `ky_district` VALUES ('450302', '秀峰区', '450300');
INSERT INTO `ky_district` VALUES ('450303', '叠彩区', '450300');
INSERT INTO `ky_district` VALUES ('450304', '象山区', '450300');
INSERT INTO `ky_district` VALUES ('450305', '七星区', '450300');
INSERT INTO `ky_district` VALUES ('450311', '雁山区', '450300');
INSERT INTO `ky_district` VALUES ('450312', '临桂区', '450300');
INSERT INTO `ky_district` VALUES ('450321', '阳朔县', '450300');
INSERT INTO `ky_district` VALUES ('450323', '灵川县', '450300');
INSERT INTO `ky_district` VALUES ('450324', '全州县', '450300');
INSERT INTO `ky_district` VALUES ('450325', '兴安县', '450300');
INSERT INTO `ky_district` VALUES ('450326', '永福县', '450300');
INSERT INTO `ky_district` VALUES ('450327', '灌阳县', '450300');
INSERT INTO `ky_district` VALUES ('450328', '龙胜各族自治县', '450300');
INSERT INTO `ky_district` VALUES ('450329', '资源县', '450300');
INSERT INTO `ky_district` VALUES ('450330', '平乐县', '450300');
INSERT INTO `ky_district` VALUES ('450331', '荔浦县', '450300');
INSERT INTO `ky_district` VALUES ('450332', '恭城瑶族自治县', '450300');
INSERT INTO `ky_district` VALUES ('450400', '梧州市', '450000');
INSERT INTO `ky_district` VALUES ('450401', '市辖区', '450400');
INSERT INTO `ky_district` VALUES ('450403', '万秀区', '450400');
INSERT INTO `ky_district` VALUES ('450405', '长洲区', '450400');
INSERT INTO `ky_district` VALUES ('450406', '龙圩区', '450400');
INSERT INTO `ky_district` VALUES ('450421', '苍梧县', '450400');
INSERT INTO `ky_district` VALUES ('450422', '藤县', '450400');
INSERT INTO `ky_district` VALUES ('450423', '蒙山县', '450400');
INSERT INTO `ky_district` VALUES ('450481', '岑溪市', '450400');
INSERT INTO `ky_district` VALUES ('450500', '北海市', '450000');
INSERT INTO `ky_district` VALUES ('450501', '市辖区', '450500');
INSERT INTO `ky_district` VALUES ('450502', '海城区', '450500');
INSERT INTO `ky_district` VALUES ('450503', '银海区', '450500');
INSERT INTO `ky_district` VALUES ('450512', '铁山港区', '450500');
INSERT INTO `ky_district` VALUES ('450521', '合浦县', '450500');
INSERT INTO `ky_district` VALUES ('450600', '防城港市', '450000');
INSERT INTO `ky_district` VALUES ('450601', '市辖区', '450600');
INSERT INTO `ky_district` VALUES ('450602', '港口区', '450600');
INSERT INTO `ky_district` VALUES ('450603', '防城区', '450600');
INSERT INTO `ky_district` VALUES ('450621', '上思县', '450600');
INSERT INTO `ky_district` VALUES ('450681', '东兴市', '450600');
INSERT INTO `ky_district` VALUES ('450700', '钦州市', '450000');
INSERT INTO `ky_district` VALUES ('450701', '市辖区', '450700');
INSERT INTO `ky_district` VALUES ('450702', '钦南区', '450700');
INSERT INTO `ky_district` VALUES ('450703', '钦北区', '450700');
INSERT INTO `ky_district` VALUES ('450721', '灵山县', '450700');
INSERT INTO `ky_district` VALUES ('450722', '浦北县', '450700');
INSERT INTO `ky_district` VALUES ('450800', '贵港市', '450000');
INSERT INTO `ky_district` VALUES ('450801', '市辖区', '450800');
INSERT INTO `ky_district` VALUES ('450802', '港北区', '450800');
INSERT INTO `ky_district` VALUES ('450803', '港南区', '450800');
INSERT INTO `ky_district` VALUES ('450804', '覃塘区', '450800');
INSERT INTO `ky_district` VALUES ('450821', '平南县', '450800');
INSERT INTO `ky_district` VALUES ('450881', '桂平市', '450800');
INSERT INTO `ky_district` VALUES ('450900', '玉林市', '450000');
INSERT INTO `ky_district` VALUES ('450901', '市辖区', '450900');
INSERT INTO `ky_district` VALUES ('450902', '玉州区', '450900');
INSERT INTO `ky_district` VALUES ('450903', '福绵区', '450900');
INSERT INTO `ky_district` VALUES ('450921', '容县', '450900');
INSERT INTO `ky_district` VALUES ('450922', '陆川县', '450900');
INSERT INTO `ky_district` VALUES ('450923', '博白县', '450900');
INSERT INTO `ky_district` VALUES ('450924', '兴业县', '450900');
INSERT INTO `ky_district` VALUES ('450981', '北流市', '450900');
INSERT INTO `ky_district` VALUES ('451000', '百色市', '450000');
INSERT INTO `ky_district` VALUES ('451001', '市辖区', '451000');
INSERT INTO `ky_district` VALUES ('451002', '右江区', '451000');
INSERT INTO `ky_district` VALUES ('451021', '田阳县', '451000');
INSERT INTO `ky_district` VALUES ('451022', '田东县', '451000');
INSERT INTO `ky_district` VALUES ('451023', '平果县', '451000');
INSERT INTO `ky_district` VALUES ('451024', '德保县', '451000');
INSERT INTO `ky_district` VALUES ('451025', '靖西县', '451000');
INSERT INTO `ky_district` VALUES ('451026', '那坡县', '451000');
INSERT INTO `ky_district` VALUES ('451027', '凌云县', '451000');
INSERT INTO `ky_district` VALUES ('451028', '乐业县', '451000');
INSERT INTO `ky_district` VALUES ('451029', '田林县', '451000');
INSERT INTO `ky_district` VALUES ('451030', '西林县', '451000');
INSERT INTO `ky_district` VALUES ('451031', '隆林各族自治县', '451000');
INSERT INTO `ky_district` VALUES ('451100', '贺州市', '450000');
INSERT INTO `ky_district` VALUES ('451101', '市辖区', '451100');
INSERT INTO `ky_district` VALUES ('451102', '八步区', '451100');
INSERT INTO `ky_district` VALUES ('451119', '平桂管理区', '451100');
INSERT INTO `ky_district` VALUES ('451121', '昭平县', '451100');
INSERT INTO `ky_district` VALUES ('451122', '钟山县', '451100');
INSERT INTO `ky_district` VALUES ('451123', '富川瑶族自治县', '451100');
INSERT INTO `ky_district` VALUES ('451200', '河池市', '450000');
INSERT INTO `ky_district` VALUES ('451201', '市辖区', '451200');
INSERT INTO `ky_district` VALUES ('451202', '金城江区', '451200');
INSERT INTO `ky_district` VALUES ('451221', '南丹县', '451200');
INSERT INTO `ky_district` VALUES ('451222', '天峨县', '451200');
INSERT INTO `ky_district` VALUES ('451223', '凤山县', '451200');
INSERT INTO `ky_district` VALUES ('451224', '东兰县', '451200');
INSERT INTO `ky_district` VALUES ('451225', '罗城仫佬族自治县', '451200');
INSERT INTO `ky_district` VALUES ('451226', '环江毛南族自治县', '451200');
INSERT INTO `ky_district` VALUES ('451227', '巴马瑶族自治县', '451200');
INSERT INTO `ky_district` VALUES ('451228', '都安瑶族自治县', '451200');
INSERT INTO `ky_district` VALUES ('451229', '大化瑶族自治县', '451200');
INSERT INTO `ky_district` VALUES ('451281', '宜州市', '451200');
INSERT INTO `ky_district` VALUES ('451300', '来宾市', '450000');
INSERT INTO `ky_district` VALUES ('451301', '市辖区', '451300');
INSERT INTO `ky_district` VALUES ('451302', '兴宾区', '451300');
INSERT INTO `ky_district` VALUES ('451321', '忻城县', '451300');
INSERT INTO `ky_district` VALUES ('451322', '象州县', '451300');
INSERT INTO `ky_district` VALUES ('451323', '武宣县', '451300');
INSERT INTO `ky_district` VALUES ('451324', '金秀瑶族自治县', '451300');
INSERT INTO `ky_district` VALUES ('451381', '合山市', '451300');
INSERT INTO `ky_district` VALUES ('451400', '崇左市', '450000');
INSERT INTO `ky_district` VALUES ('451401', '市辖区', '451400');
INSERT INTO `ky_district` VALUES ('451402', '江州区', '451400');
INSERT INTO `ky_district` VALUES ('451421', '扶绥县', '451400');
INSERT INTO `ky_district` VALUES ('451422', '宁明县', '451400');
INSERT INTO `ky_district` VALUES ('451423', '龙州县', '451400');
INSERT INTO `ky_district` VALUES ('451424', '大新县', '451400');
INSERT INTO `ky_district` VALUES ('451425', '天等县', '451400');
INSERT INTO `ky_district` VALUES ('451481', '凭祥市', '451400');
INSERT INTO `ky_district` VALUES ('460000', '海南省', '0');
INSERT INTO `ky_district` VALUES ('460100', '海口市', '460000');
INSERT INTO `ky_district` VALUES ('460101', '市辖区', '460100');
INSERT INTO `ky_district` VALUES ('460105', '秀英区', '460100');
INSERT INTO `ky_district` VALUES ('460106', '龙华区', '460100');
INSERT INTO `ky_district` VALUES ('460107', '琼山区', '460100');
INSERT INTO `ky_district` VALUES ('460108', '美兰区', '460100');
INSERT INTO `ky_district` VALUES ('460200', '三亚市', '460000');
INSERT INTO `ky_district` VALUES ('460201', '市辖区', '460200');
INSERT INTO `ky_district` VALUES ('460202', '海棠区', '460200');
INSERT INTO `ky_district` VALUES ('460203', '吉阳区', '460200');
INSERT INTO `ky_district` VALUES ('460204', '天涯区', '460200');
INSERT INTO `ky_district` VALUES ('460205', '崖州区', '460200');
INSERT INTO `ky_district` VALUES ('460300', '三沙市', '460000');
INSERT INTO `ky_district` VALUES ('460321', '西沙群岛', '460300');
INSERT INTO `ky_district` VALUES ('460322', '南沙群岛', '460300');
INSERT INTO `ky_district` VALUES ('460323', '中沙群岛的岛礁及其海域', '460300');
INSERT INTO `ky_district` VALUES ('469001', '五指山市', '460000');
INSERT INTO `ky_district` VALUES ('469002', '琼海市', '460000');
INSERT INTO `ky_district` VALUES ('469003', '儋州市', '460000');
INSERT INTO `ky_district` VALUES ('469005', '文昌市', '460000');
INSERT INTO `ky_district` VALUES ('469006', '万宁市', '460000');
INSERT INTO `ky_district` VALUES ('469007', '东方市', '460000');
INSERT INTO `ky_district` VALUES ('469021', '定安县', '460000');
INSERT INTO `ky_district` VALUES ('469022', '屯昌县', '460000');
INSERT INTO `ky_district` VALUES ('469023', '澄迈县', '460000');
INSERT INTO `ky_district` VALUES ('469024', '临高县', '460000');
INSERT INTO `ky_district` VALUES ('469025', '白沙黎族自治县', '460000');
INSERT INTO `ky_district` VALUES ('469026', '昌江黎族自治县', '460000');
INSERT INTO `ky_district` VALUES ('469027', '乐东黎族自治县', '460000');
INSERT INTO `ky_district` VALUES ('469028', '陵水黎族自治县', '460000');
INSERT INTO `ky_district` VALUES ('469029', '保亭黎族苗族自治县', '460000');
INSERT INTO `ky_district` VALUES ('469030', '琼中黎族苗族自治县', '460000');
INSERT INTO `ky_district` VALUES ('500000', '重庆', '0');
INSERT INTO `ky_district` VALUES ('500100', '重庆市', '500000');
INSERT INTO `ky_district` VALUES ('500101', '万州区', '500100');
INSERT INTO `ky_district` VALUES ('500102', '涪陵区', '500100');
INSERT INTO `ky_district` VALUES ('500103', '渝中区', '500100');
INSERT INTO `ky_district` VALUES ('500104', '大渡口区', '500100');
INSERT INTO `ky_district` VALUES ('500105', '江北区', '500100');
INSERT INTO `ky_district` VALUES ('500106', '沙坪坝区', '500100');
INSERT INTO `ky_district` VALUES ('500107', '九龙坡区', '500100');
INSERT INTO `ky_district` VALUES ('500108', '南岸区', '500100');
INSERT INTO `ky_district` VALUES ('500109', '北碚区', '500100');
INSERT INTO `ky_district` VALUES ('500110', '綦江区', '500100');
INSERT INTO `ky_district` VALUES ('500111', '大足区', '500100');
INSERT INTO `ky_district` VALUES ('500112', '渝北区', '500100');
INSERT INTO `ky_district` VALUES ('500113', '巴南区', '500100');
INSERT INTO `ky_district` VALUES ('500114', '黔江区', '500100');
INSERT INTO `ky_district` VALUES ('500115', '长寿区', '500100');
INSERT INTO `ky_district` VALUES ('500116', '江津区', '500100');
INSERT INTO `ky_district` VALUES ('500117', '合川区', '500100');
INSERT INTO `ky_district` VALUES ('500118', '永川区', '500100');
INSERT INTO `ky_district` VALUES ('500119', '南川区', '500100');
INSERT INTO `ky_district` VALUES ('500120', '璧山区', '500100');
INSERT INTO `ky_district` VALUES ('500151', '铜梁区', '500100');
INSERT INTO `ky_district` VALUES ('500223', '潼南县', '500100');
INSERT INTO `ky_district` VALUES ('500226', '荣昌县', '500100');
INSERT INTO `ky_district` VALUES ('500228', '梁平县', '500100');
INSERT INTO `ky_district` VALUES ('500229', '城口县', '500100');
INSERT INTO `ky_district` VALUES ('500230', '丰都县', '500100');
INSERT INTO `ky_district` VALUES ('500231', '垫江县', '500100');
INSERT INTO `ky_district` VALUES ('500232', '武隆县', '500100');
INSERT INTO `ky_district` VALUES ('500233', '忠县', '500100');
INSERT INTO `ky_district` VALUES ('500234', '开县', '500100');
INSERT INTO `ky_district` VALUES ('500235', '云阳县', '500100');
INSERT INTO `ky_district` VALUES ('500236', '奉节县', '500100');
INSERT INTO `ky_district` VALUES ('500237', '巫山县', '500100');
INSERT INTO `ky_district` VALUES ('500238', '巫溪县', '500100');
INSERT INTO `ky_district` VALUES ('500240', '石柱土家族自治县', '500100');
INSERT INTO `ky_district` VALUES ('500241', '秀山土家族苗族自治县', '500100');
INSERT INTO `ky_district` VALUES ('500242', '酉阳土家族苗族自治县', '500100');
INSERT INTO `ky_district` VALUES ('500243', '彭水苗族土家族自治县', '500100');
INSERT INTO `ky_district` VALUES ('500300', '两江新区', '500100');
INSERT INTO `ky_district` VALUES ('510000', '四川省', '0');
INSERT INTO `ky_district` VALUES ('510100', '成都市', '510000');
INSERT INTO `ky_district` VALUES ('510101', '市辖区', '510100');
INSERT INTO `ky_district` VALUES ('510104', '锦江区', '510100');
INSERT INTO `ky_district` VALUES ('510105', '青羊区', '510100');
INSERT INTO `ky_district` VALUES ('510106', '金牛区', '510100');
INSERT INTO `ky_district` VALUES ('510107', '武侯区', '510100');
INSERT INTO `ky_district` VALUES ('510108', '成华区', '510100');
INSERT INTO `ky_district` VALUES ('510112', '龙泉驿区', '510100');
INSERT INTO `ky_district` VALUES ('510113', '青白江区', '510100');
INSERT INTO `ky_district` VALUES ('510114', '新都区', '510100');
INSERT INTO `ky_district` VALUES ('510115', '温江区', '510100');
INSERT INTO `ky_district` VALUES ('510121', '金堂县', '510100');
INSERT INTO `ky_district` VALUES ('510122', '双流县', '510100');
INSERT INTO `ky_district` VALUES ('510124', '郫县', '510100');
INSERT INTO `ky_district` VALUES ('510129', '大邑县', '510100');
INSERT INTO `ky_district` VALUES ('510131', '蒲江县', '510100');
INSERT INTO `ky_district` VALUES ('510132', '新津县', '510100');
INSERT INTO `ky_district` VALUES ('510181', '都江堰市', '510100');
INSERT INTO `ky_district` VALUES ('510182', '彭州市', '510100');
INSERT INTO `ky_district` VALUES ('510183', '邛崃市', '510100');
INSERT INTO `ky_district` VALUES ('510184', '崇州市', '510100');
INSERT INTO `ky_district` VALUES ('510300', '自贡市', '510000');
INSERT INTO `ky_district` VALUES ('510301', '市辖区', '510300');
INSERT INTO `ky_district` VALUES ('510302', '自流井区', '510300');
INSERT INTO `ky_district` VALUES ('510303', '贡井区', '510300');
INSERT INTO `ky_district` VALUES ('510304', '大安区', '510300');
INSERT INTO `ky_district` VALUES ('510311', '沿滩区', '510300');
INSERT INTO `ky_district` VALUES ('510321', '荣县', '510300');
INSERT INTO `ky_district` VALUES ('510322', '富顺县', '510300');
INSERT INTO `ky_district` VALUES ('510400', '攀枝花市', '510000');
INSERT INTO `ky_district` VALUES ('510401', '市辖区', '510400');
INSERT INTO `ky_district` VALUES ('510402', '东区', '510400');
INSERT INTO `ky_district` VALUES ('510403', '西区', '510400');
INSERT INTO `ky_district` VALUES ('510411', '仁和区', '510400');
INSERT INTO `ky_district` VALUES ('510421', '米易县', '510400');
INSERT INTO `ky_district` VALUES ('510422', '盐边县', '510400');
INSERT INTO `ky_district` VALUES ('510500', '泸州市', '510000');
INSERT INTO `ky_district` VALUES ('510501', '市辖区', '510500');
INSERT INTO `ky_district` VALUES ('510502', '江阳区', '510500');
INSERT INTO `ky_district` VALUES ('510503', '纳溪区', '510500');
INSERT INTO `ky_district` VALUES ('510504', '龙马潭区', '510500');
INSERT INTO `ky_district` VALUES ('510521', '泸县', '510500');
INSERT INTO `ky_district` VALUES ('510522', '合江县', '510500');
INSERT INTO `ky_district` VALUES ('510524', '叙永县', '510500');
INSERT INTO `ky_district` VALUES ('510525', '古蔺县', '510500');
INSERT INTO `ky_district` VALUES ('510600', '德阳市', '510000');
INSERT INTO `ky_district` VALUES ('510601', '市辖区', '510600');
INSERT INTO `ky_district` VALUES ('510603', '旌阳区', '510600');
INSERT INTO `ky_district` VALUES ('510623', '中江县', '510600');
INSERT INTO `ky_district` VALUES ('510626', '罗江县', '510600');
INSERT INTO `ky_district` VALUES ('510681', '广汉市', '510600');
INSERT INTO `ky_district` VALUES ('510682', '什邡市', '510600');
INSERT INTO `ky_district` VALUES ('510683', '绵竹市', '510600');
INSERT INTO `ky_district` VALUES ('510700', '绵阳市', '510000');
INSERT INTO `ky_district` VALUES ('510701', '市辖区', '510700');
INSERT INTO `ky_district` VALUES ('510703', '涪城区', '510700');
INSERT INTO `ky_district` VALUES ('510704', '游仙区', '510700');
INSERT INTO `ky_district` VALUES ('510722', '三台县', '510700');
INSERT INTO `ky_district` VALUES ('510723', '盐亭县', '510700');
INSERT INTO `ky_district` VALUES ('510724', '安县', '510700');
INSERT INTO `ky_district` VALUES ('510725', '梓潼县', '510700');
INSERT INTO `ky_district` VALUES ('510726', '北川羌族自治县', '510700');
INSERT INTO `ky_district` VALUES ('510727', '平武县', '510700');
INSERT INTO `ky_district` VALUES ('510781', '江油市', '510700');
INSERT INTO `ky_district` VALUES ('510800', '广元市', '510000');
INSERT INTO `ky_district` VALUES ('510801', '市辖区', '510800');
INSERT INTO `ky_district` VALUES ('510802', '利州区', '510800');
INSERT INTO `ky_district` VALUES ('510811', '昭化区', '510800');
INSERT INTO `ky_district` VALUES ('510812', '朝天区', '510800');
INSERT INTO `ky_district` VALUES ('510821', '旺苍县', '510800');
INSERT INTO `ky_district` VALUES ('510822', '青川县', '510800');
INSERT INTO `ky_district` VALUES ('510823', '剑阁县', '510800');
INSERT INTO `ky_district` VALUES ('510824', '苍溪县', '510800');
INSERT INTO `ky_district` VALUES ('510900', '遂宁市', '510000');
INSERT INTO `ky_district` VALUES ('510901', '市辖区', '510900');
INSERT INTO `ky_district` VALUES ('510903', '船山区', '510900');
INSERT INTO `ky_district` VALUES ('510904', '安居区', '510900');
INSERT INTO `ky_district` VALUES ('510921', '蓬溪县', '510900');
INSERT INTO `ky_district` VALUES ('510922', '射洪县', '510900');
INSERT INTO `ky_district` VALUES ('510923', '大英县', '510900');
INSERT INTO `ky_district` VALUES ('511000', '内江市', '510000');
INSERT INTO `ky_district` VALUES ('511001', '市辖区', '511000');
INSERT INTO `ky_district` VALUES ('511002', '市中区', '511000');
INSERT INTO `ky_district` VALUES ('511011', '东兴区', '511000');
INSERT INTO `ky_district` VALUES ('511024', '威远县', '511000');
INSERT INTO `ky_district` VALUES ('511025', '资中县', '511000');
INSERT INTO `ky_district` VALUES ('511028', '隆昌县', '511000');
INSERT INTO `ky_district` VALUES ('511100', '乐山市', '510000');
INSERT INTO `ky_district` VALUES ('511101', '市辖区', '511100');
INSERT INTO `ky_district` VALUES ('511102', '市中区', '511100');
INSERT INTO `ky_district` VALUES ('511111', '沙湾区', '511100');
INSERT INTO `ky_district` VALUES ('511112', '五通桥区', '511100');
INSERT INTO `ky_district` VALUES ('511113', '金口河区', '511100');
INSERT INTO `ky_district` VALUES ('511123', '犍为县', '511100');
INSERT INTO `ky_district` VALUES ('511124', '井研县', '511100');
INSERT INTO `ky_district` VALUES ('511126', '夹江县', '511100');
INSERT INTO `ky_district` VALUES ('511129', '沐川县', '511100');
INSERT INTO `ky_district` VALUES ('511132', '峨边彝族自治县', '511100');
INSERT INTO `ky_district` VALUES ('511133', '马边彝族自治县', '511100');
INSERT INTO `ky_district` VALUES ('511181', '峨眉山市', '511100');
INSERT INTO `ky_district` VALUES ('511300', '南充市', '510000');
INSERT INTO `ky_district` VALUES ('511301', '市辖区', '511300');
INSERT INTO `ky_district` VALUES ('511302', '顺庆区', '511300');
INSERT INTO `ky_district` VALUES ('511303', '高坪区', '511300');
INSERT INTO `ky_district` VALUES ('511304', '嘉陵区', '511300');
INSERT INTO `ky_district` VALUES ('511321', '南部县', '511300');
INSERT INTO `ky_district` VALUES ('511322', '营山县', '511300');
INSERT INTO `ky_district` VALUES ('511323', '蓬安县', '511300');
INSERT INTO `ky_district` VALUES ('511324', '仪陇县', '511300');
INSERT INTO `ky_district` VALUES ('511325', '西充县', '511300');
INSERT INTO `ky_district` VALUES ('511381', '阆中市', '511300');
INSERT INTO `ky_district` VALUES ('511400', '眉山市', '510000');
INSERT INTO `ky_district` VALUES ('511401', '市辖区', '511400');
INSERT INTO `ky_district` VALUES ('511402', '东坡区', '511400');
INSERT INTO `ky_district` VALUES ('511403', '彭山区', '511400');
INSERT INTO `ky_district` VALUES ('511421', '仁寿县', '511400');
INSERT INTO `ky_district` VALUES ('511423', '洪雅县', '511400');
INSERT INTO `ky_district` VALUES ('511424', '丹棱县', '511400');
INSERT INTO `ky_district` VALUES ('511425', '青神县', '511400');
INSERT INTO `ky_district` VALUES ('511500', '宜宾市', '510000');
INSERT INTO `ky_district` VALUES ('511501', '市辖区', '511500');
INSERT INTO `ky_district` VALUES ('511502', '翠屏区', '511500');
INSERT INTO `ky_district` VALUES ('511503', '南溪区', '511500');
INSERT INTO `ky_district` VALUES ('511521', '宜宾县', '511500');
INSERT INTO `ky_district` VALUES ('511523', '江安县', '511500');
INSERT INTO `ky_district` VALUES ('511524', '长宁县', '511500');
INSERT INTO `ky_district` VALUES ('511525', '高县', '511500');
INSERT INTO `ky_district` VALUES ('511526', '珙县', '511500');
INSERT INTO `ky_district` VALUES ('511527', '筠连县', '511500');
INSERT INTO `ky_district` VALUES ('511528', '兴文县', '511500');
INSERT INTO `ky_district` VALUES ('511529', '屏山县', '511500');
INSERT INTO `ky_district` VALUES ('511600', '广安市', '510000');
INSERT INTO `ky_district` VALUES ('511601', '市辖区', '511600');
INSERT INTO `ky_district` VALUES ('511602', '广安区', '511600');
INSERT INTO `ky_district` VALUES ('511603', '前锋区', '511600');
INSERT INTO `ky_district` VALUES ('511621', '岳池县', '511600');
INSERT INTO `ky_district` VALUES ('511622', '武胜县', '511600');
INSERT INTO `ky_district` VALUES ('511623', '邻水县', '511600');
INSERT INTO `ky_district` VALUES ('511681', '华蓥市', '511600');
INSERT INTO `ky_district` VALUES ('511700', '达州市', '510000');
INSERT INTO `ky_district` VALUES ('511701', '市辖区', '511700');
INSERT INTO `ky_district` VALUES ('511702', '通川区', '511700');
INSERT INTO `ky_district` VALUES ('511703', '达川区', '511700');
INSERT INTO `ky_district` VALUES ('511722', '宣汉县', '511700');
INSERT INTO `ky_district` VALUES ('511723', '开江县', '511700');
INSERT INTO `ky_district` VALUES ('511724', '大竹县', '511700');
INSERT INTO `ky_district` VALUES ('511725', '渠县', '511700');
INSERT INTO `ky_district` VALUES ('511781', '万源市', '511700');
INSERT INTO `ky_district` VALUES ('511800', '雅安市', '510000');
INSERT INTO `ky_district` VALUES ('511801', '市辖区', '511800');
INSERT INTO `ky_district` VALUES ('511802', '雨城区', '511800');
INSERT INTO `ky_district` VALUES ('511803', '名山区', '511800');
INSERT INTO `ky_district` VALUES ('511822', '荥经县', '511800');
INSERT INTO `ky_district` VALUES ('511823', '汉源县', '511800');
INSERT INTO `ky_district` VALUES ('511824', '石棉县', '511800');
INSERT INTO `ky_district` VALUES ('511825', '天全县', '511800');
INSERT INTO `ky_district` VALUES ('511826', '芦山县', '511800');
INSERT INTO `ky_district` VALUES ('511827', '宝兴县', '511800');
INSERT INTO `ky_district` VALUES ('511900', '巴中市', '510000');
INSERT INTO `ky_district` VALUES ('511901', '市辖区', '511900');
INSERT INTO `ky_district` VALUES ('511902', '巴州区', '511900');
INSERT INTO `ky_district` VALUES ('511903', '恩阳区', '511900');
INSERT INTO `ky_district` VALUES ('511921', '通江县', '511900');
INSERT INTO `ky_district` VALUES ('511922', '南江县', '511900');
INSERT INTO `ky_district` VALUES ('511923', '平昌县', '511900');
INSERT INTO `ky_district` VALUES ('512000', '资阳市', '510000');
INSERT INTO `ky_district` VALUES ('512001', '市辖区', '512000');
INSERT INTO `ky_district` VALUES ('512002', '雁江区', '512000');
INSERT INTO `ky_district` VALUES ('512021', '安岳县', '512000');
INSERT INTO `ky_district` VALUES ('512022', '乐至县', '512000');
INSERT INTO `ky_district` VALUES ('512081', '简阳市', '512000');
INSERT INTO `ky_district` VALUES ('513200', '阿坝藏族羌族自治州', '510000');
INSERT INTO `ky_district` VALUES ('513221', '汶川县', '513200');
INSERT INTO `ky_district` VALUES ('513222', '理县', '513200');
INSERT INTO `ky_district` VALUES ('513223', '茂县', '513200');
INSERT INTO `ky_district` VALUES ('513224', '松潘县', '513200');
INSERT INTO `ky_district` VALUES ('513225', '九寨沟县', '513200');
INSERT INTO `ky_district` VALUES ('513226', '金川县', '513200');
INSERT INTO `ky_district` VALUES ('513227', '小金县', '513200');
INSERT INTO `ky_district` VALUES ('513228', '黑水县', '513200');
INSERT INTO `ky_district` VALUES ('513229', '马尔康县', '513200');
INSERT INTO `ky_district` VALUES ('513230', '壤塘县', '513200');
INSERT INTO `ky_district` VALUES ('513231', '阿坝县', '513200');
INSERT INTO `ky_district` VALUES ('513232', '若尔盖县', '513200');
INSERT INTO `ky_district` VALUES ('513233', '红原县', '513200');
INSERT INTO `ky_district` VALUES ('513300', '甘孜藏族自治州', '510000');
INSERT INTO `ky_district` VALUES ('513321', '康定县', '513300');
INSERT INTO `ky_district` VALUES ('513322', '泸定县', '513300');
INSERT INTO `ky_district` VALUES ('513323', '丹巴县', '513300');
INSERT INTO `ky_district` VALUES ('513324', '九龙县', '513300');
INSERT INTO `ky_district` VALUES ('513325', '雅江县', '513300');
INSERT INTO `ky_district` VALUES ('513326', '道孚县', '513300');
INSERT INTO `ky_district` VALUES ('513327', '炉霍县', '513300');
INSERT INTO `ky_district` VALUES ('513328', '甘孜县', '513300');
INSERT INTO `ky_district` VALUES ('513329', '新龙县', '513300');
INSERT INTO `ky_district` VALUES ('513330', '德格县', '513300');
INSERT INTO `ky_district` VALUES ('513331', '白玉县', '513300');
INSERT INTO `ky_district` VALUES ('513332', '石渠县', '513300');
INSERT INTO `ky_district` VALUES ('513333', '色达县', '513300');
INSERT INTO `ky_district` VALUES ('513334', '理塘县', '513300');
INSERT INTO `ky_district` VALUES ('513335', '巴塘县', '513300');
INSERT INTO `ky_district` VALUES ('513336', '乡城县', '513300');
INSERT INTO `ky_district` VALUES ('513337', '稻城县', '513300');
INSERT INTO `ky_district` VALUES ('513338', '得荣县', '513300');
INSERT INTO `ky_district` VALUES ('513400', '凉山彝族自治州', '510000');
INSERT INTO `ky_district` VALUES ('513401', '西昌市', '513400');
INSERT INTO `ky_district` VALUES ('513422', '木里藏族自治县', '513400');
INSERT INTO `ky_district` VALUES ('513423', '盐源县', '513400');
INSERT INTO `ky_district` VALUES ('513424', '德昌县', '513400');
INSERT INTO `ky_district` VALUES ('513425', '会理县', '513400');
INSERT INTO `ky_district` VALUES ('513426', '会东县', '513400');
INSERT INTO `ky_district` VALUES ('513427', '宁南县', '513400');
INSERT INTO `ky_district` VALUES ('513428', '普格县', '513400');
INSERT INTO `ky_district` VALUES ('513429', '布拖县', '513400');
INSERT INTO `ky_district` VALUES ('513430', '金阳县', '513400');
INSERT INTO `ky_district` VALUES ('513431', '昭觉县', '513400');
INSERT INTO `ky_district` VALUES ('513432', '喜德县', '513400');
INSERT INTO `ky_district` VALUES ('513433', '冕宁县', '513400');
INSERT INTO `ky_district` VALUES ('513434', '越西县', '513400');
INSERT INTO `ky_district` VALUES ('513435', '甘洛县', '513400');
INSERT INTO `ky_district` VALUES ('513436', '美姑县', '513400');
INSERT INTO `ky_district` VALUES ('513437', '雷波县', '513400');
INSERT INTO `ky_district` VALUES ('520000', '贵州省', '0');
INSERT INTO `ky_district` VALUES ('520100', '贵阳市', '520000');
INSERT INTO `ky_district` VALUES ('520101', '市辖区', '520100');
INSERT INTO `ky_district` VALUES ('520102', '南明区', '520100');
INSERT INTO `ky_district` VALUES ('520103', '云岩区', '520100');
INSERT INTO `ky_district` VALUES ('520111', '花溪区', '520100');
INSERT INTO `ky_district` VALUES ('520112', '乌当区', '520100');
INSERT INTO `ky_district` VALUES ('520113', '白云区', '520100');
INSERT INTO `ky_district` VALUES ('520115', '观山湖区', '520100');
INSERT INTO `ky_district` VALUES ('520121', '开阳县', '520100');
INSERT INTO `ky_district` VALUES ('520122', '息烽县', '520100');
INSERT INTO `ky_district` VALUES ('520123', '修文县', '520100');
INSERT INTO `ky_district` VALUES ('520181', '清镇市', '520100');
INSERT INTO `ky_district` VALUES ('520200', '六盘水市', '520000');
INSERT INTO `ky_district` VALUES ('520201', '钟山区', '520200');
INSERT INTO `ky_district` VALUES ('520203', '六枝特区', '520200');
INSERT INTO `ky_district` VALUES ('520221', '水城县', '520200');
INSERT INTO `ky_district` VALUES ('520222', '盘县', '520200');
INSERT INTO `ky_district` VALUES ('520300', '遵义市', '520000');
INSERT INTO `ky_district` VALUES ('520301', '市辖区', '520300');
INSERT INTO `ky_district` VALUES ('520302', '红花岗区', '520300');
INSERT INTO `ky_district` VALUES ('520303', '汇川区', '520300');
INSERT INTO `ky_district` VALUES ('520321', '播州区', '520300');
INSERT INTO `ky_district` VALUES ('520322', '桐梓县', '520300');
INSERT INTO `ky_district` VALUES ('520323', '绥阳县', '520300');
INSERT INTO `ky_district` VALUES ('520324', '正安县', '520300');
INSERT INTO `ky_district` VALUES ('520325', '道真仡佬族苗族自治县', '520300');
INSERT INTO `ky_district` VALUES ('520326', '务川仡佬族苗族自治县', '520300');
INSERT INTO `ky_district` VALUES ('520327', '凤冈县', '520300');
INSERT INTO `ky_district` VALUES ('520328', '湄潭县', '520300');
INSERT INTO `ky_district` VALUES ('520329', '余庆县', '520300');
INSERT INTO `ky_district` VALUES ('520330', '习水县', '520300');
INSERT INTO `ky_district` VALUES ('520381', '赤水市', '520300');
INSERT INTO `ky_district` VALUES ('520382', '仁怀市', '520300');
INSERT INTO `ky_district` VALUES ('520400', '安顺市', '520000');
INSERT INTO `ky_district` VALUES ('520401', '市辖区', '520400');
INSERT INTO `ky_district` VALUES ('520402', '西秀区', '520400');
INSERT INTO `ky_district` VALUES ('520403', '平坝区', '520400');
INSERT INTO `ky_district` VALUES ('520422', '普定县', '520400');
INSERT INTO `ky_district` VALUES ('520423', '镇宁布依族苗族自治县', '520400');
INSERT INTO `ky_district` VALUES ('520424', '关岭布依族苗族自治县', '520400');
INSERT INTO `ky_district` VALUES ('520425', '紫云苗族布依族自治县', '520400');
INSERT INTO `ky_district` VALUES ('520500', '毕节市', '520000');
INSERT INTO `ky_district` VALUES ('520501', '市辖区', '520500');
INSERT INTO `ky_district` VALUES ('520502', '七星关区', '520500');
INSERT INTO `ky_district` VALUES ('520521', '大方县', '520500');
INSERT INTO `ky_district` VALUES ('520522', '黔西县', '520500');
INSERT INTO `ky_district` VALUES ('520523', '金沙县', '520500');
INSERT INTO `ky_district` VALUES ('520524', '织金县', '520500');
INSERT INTO `ky_district` VALUES ('520525', '纳雍县', '520500');
INSERT INTO `ky_district` VALUES ('520526', '威宁彝族回族苗族自治县', '520500');
INSERT INTO `ky_district` VALUES ('520527', '赫章县', '520500');
INSERT INTO `ky_district` VALUES ('520600', '铜仁市', '520000');
INSERT INTO `ky_district` VALUES ('520601', '市辖区', '520600');
INSERT INTO `ky_district` VALUES ('520602', '碧江区', '520600');
INSERT INTO `ky_district` VALUES ('520603', '万山区', '520600');
INSERT INTO `ky_district` VALUES ('520621', '江口县', '520600');
INSERT INTO `ky_district` VALUES ('520622', '玉屏侗族自治县', '520600');
INSERT INTO `ky_district` VALUES ('520623', '石阡县', '520600');
INSERT INTO `ky_district` VALUES ('520624', '思南县', '520600');
INSERT INTO `ky_district` VALUES ('520625', '印江土家族苗族自治县', '520600');
INSERT INTO `ky_district` VALUES ('520626', '德江县', '520600');
INSERT INTO `ky_district` VALUES ('520627', '沿河土家族自治县', '520600');
INSERT INTO `ky_district` VALUES ('520628', '松桃苗族自治县', '520600');
INSERT INTO `ky_district` VALUES ('522300', '黔西南布依族苗族自治州', '520000');
INSERT INTO `ky_district` VALUES ('522301', '兴义市', '522300');
INSERT INTO `ky_district` VALUES ('522322', '兴仁县', '522300');
INSERT INTO `ky_district` VALUES ('522323', '普安县', '522300');
INSERT INTO `ky_district` VALUES ('522324', '晴隆县', '522300');
INSERT INTO `ky_district` VALUES ('522325', '贞丰县', '522300');
INSERT INTO `ky_district` VALUES ('522326', '望谟县', '522300');
INSERT INTO `ky_district` VALUES ('522327', '册亨县', '522300');
INSERT INTO `ky_district` VALUES ('522328', '安龙县', '522300');
INSERT INTO `ky_district` VALUES ('522600', '黔东南苗族侗族自治州', '520000');
INSERT INTO `ky_district` VALUES ('522601', '凯里市', '522600');
INSERT INTO `ky_district` VALUES ('522622', '黄平县', '522600');
INSERT INTO `ky_district` VALUES ('522623', '施秉县', '522600');
INSERT INTO `ky_district` VALUES ('522624', '三穗县', '522600');
INSERT INTO `ky_district` VALUES ('522625', '镇远县', '522600');
INSERT INTO `ky_district` VALUES ('522626', '岑巩县', '522600');
INSERT INTO `ky_district` VALUES ('522627', '天柱县', '522600');
INSERT INTO `ky_district` VALUES ('522628', '锦屏县', '522600');
INSERT INTO `ky_district` VALUES ('522629', '剑河县', '522600');
INSERT INTO `ky_district` VALUES ('522630', '台江县', '522600');
INSERT INTO `ky_district` VALUES ('522631', '黎平县', '522600');
INSERT INTO `ky_district` VALUES ('522632', '榕江县', '522600');
INSERT INTO `ky_district` VALUES ('522633', '从江县', '522600');
INSERT INTO `ky_district` VALUES ('522634', '雷山县', '522600');
INSERT INTO `ky_district` VALUES ('522635', '麻江县', '522600');
INSERT INTO `ky_district` VALUES ('522636', '丹寨县', '522600');
INSERT INTO `ky_district` VALUES ('522700', '黔南布依族苗族自治州', '520000');
INSERT INTO `ky_district` VALUES ('522701', '都匀市', '522700');
INSERT INTO `ky_district` VALUES ('522702', '福泉市', '522700');
INSERT INTO `ky_district` VALUES ('522722', '荔波县', '522700');
INSERT INTO `ky_district` VALUES ('522723', '贵定县', '522700');
INSERT INTO `ky_district` VALUES ('522725', '瓮安县', '522700');
INSERT INTO `ky_district` VALUES ('522726', '独山县', '522700');
INSERT INTO `ky_district` VALUES ('522727', '平塘县', '522700');
INSERT INTO `ky_district` VALUES ('522728', '罗甸县', '522700');
INSERT INTO `ky_district` VALUES ('522729', '长顺县', '522700');
INSERT INTO `ky_district` VALUES ('522730', '龙里县', '522700');
INSERT INTO `ky_district` VALUES ('522731', '惠水县', '522700');
INSERT INTO `ky_district` VALUES ('522732', '三都水族自治县', '522700');
INSERT INTO `ky_district` VALUES ('530000', '云南省', '0');
INSERT INTO `ky_district` VALUES ('530100', '昆明市', '530000');
INSERT INTO `ky_district` VALUES ('530101', '市辖区', '530100');
INSERT INTO `ky_district` VALUES ('530102', '五华区', '530100');
INSERT INTO `ky_district` VALUES ('530103', '盘龙区', '530100');
INSERT INTO `ky_district` VALUES ('530111', '官渡区', '530100');
INSERT INTO `ky_district` VALUES ('530112', '西山区', '530100');
INSERT INTO `ky_district` VALUES ('530113', '东川区', '530100');
INSERT INTO `ky_district` VALUES ('530114', '呈贡区', '530100');
INSERT INTO `ky_district` VALUES ('530122', '晋宁县', '530100');
INSERT INTO `ky_district` VALUES ('530124', '富民县', '530100');
INSERT INTO `ky_district` VALUES ('530125', '宜良县', '530100');
INSERT INTO `ky_district` VALUES ('530126', '石林彝族自治县', '530100');
INSERT INTO `ky_district` VALUES ('530127', '嵩明县', '530100');
INSERT INTO `ky_district` VALUES ('530128', '禄劝彝族苗族自治县', '530100');
INSERT INTO `ky_district` VALUES ('530129', '寻甸回族彝族自治县', '530100');
INSERT INTO `ky_district` VALUES ('530181', '安宁市', '530100');
INSERT INTO `ky_district` VALUES ('530300', '曲靖市', '530000');
INSERT INTO `ky_district` VALUES ('530301', '市辖区', '530300');
INSERT INTO `ky_district` VALUES ('530302', '麒麟区', '530300');
INSERT INTO `ky_district` VALUES ('530321', '马龙县', '530300');
INSERT INTO `ky_district` VALUES ('530322', '陆良县', '530300');
INSERT INTO `ky_district` VALUES ('530323', '师宗县', '530300');
INSERT INTO `ky_district` VALUES ('530324', '罗平县', '530300');
INSERT INTO `ky_district` VALUES ('530325', '富源县', '530300');
INSERT INTO `ky_district` VALUES ('530326', '会泽县', '530300');
INSERT INTO `ky_district` VALUES ('530328', '沾益县', '530300');
INSERT INTO `ky_district` VALUES ('530381', '宣威市', '530300');
INSERT INTO `ky_district` VALUES ('530400', '玉溪市', '530000');
INSERT INTO `ky_district` VALUES ('530401', '市辖区', '530400');
INSERT INTO `ky_district` VALUES ('530402', '红塔区', '530400');
INSERT INTO `ky_district` VALUES ('530421', '江川县', '530400');
INSERT INTO `ky_district` VALUES ('530422', '澄江县', '530400');
INSERT INTO `ky_district` VALUES ('530423', '通海县', '530400');
INSERT INTO `ky_district` VALUES ('530424', '华宁县', '530400');
INSERT INTO `ky_district` VALUES ('530425', '易门县', '530400');
INSERT INTO `ky_district` VALUES ('530426', '峨山彝族自治县', '530400');
INSERT INTO `ky_district` VALUES ('530427', '新平彝族傣族自治县', '530400');
INSERT INTO `ky_district` VALUES ('530428', '元江哈尼族彝族傣族自治县', '530400');
INSERT INTO `ky_district` VALUES ('530500', '保山市', '530000');
INSERT INTO `ky_district` VALUES ('530501', '市辖区', '530500');
INSERT INTO `ky_district` VALUES ('530502', '隆阳区', '530500');
INSERT INTO `ky_district` VALUES ('530521', '施甸县', '530500');
INSERT INTO `ky_district` VALUES ('530522', '腾冲县', '530500');
INSERT INTO `ky_district` VALUES ('530523', '龙陵县', '530500');
INSERT INTO `ky_district` VALUES ('530524', '昌宁县', '530500');
INSERT INTO `ky_district` VALUES ('530600', '昭通市', '530000');
INSERT INTO `ky_district` VALUES ('530601', '市辖区', '530600');
INSERT INTO `ky_district` VALUES ('530602', '昭阳区', '530600');
INSERT INTO `ky_district` VALUES ('530621', '鲁甸县', '530600');
INSERT INTO `ky_district` VALUES ('530622', '巧家县', '530600');
INSERT INTO `ky_district` VALUES ('530623', '盐津县', '530600');
INSERT INTO `ky_district` VALUES ('530624', '大关县', '530600');
INSERT INTO `ky_district` VALUES ('530625', '永善县', '530600');
INSERT INTO `ky_district` VALUES ('530626', '绥江县', '530600');
INSERT INTO `ky_district` VALUES ('530627', '镇雄县', '530600');
INSERT INTO `ky_district` VALUES ('530628', '彝良县', '530600');
INSERT INTO `ky_district` VALUES ('530629', '威信县', '530600');
INSERT INTO `ky_district` VALUES ('530630', '水富县', '530600');
INSERT INTO `ky_district` VALUES ('530700', '丽江市', '530000');
INSERT INTO `ky_district` VALUES ('530701', '市辖区', '530700');
INSERT INTO `ky_district` VALUES ('530702', '古城区', '530700');
INSERT INTO `ky_district` VALUES ('530721', '玉龙纳西族自治县', '530700');
INSERT INTO `ky_district` VALUES ('530722', '永胜县', '530700');
INSERT INTO `ky_district` VALUES ('530723', '华坪县', '530700');
INSERT INTO `ky_district` VALUES ('530724', '宁蒗彝族自治县', '530700');
INSERT INTO `ky_district` VALUES ('530800', '普洱市', '530000');
INSERT INTO `ky_district` VALUES ('530801', '市辖区', '530800');
INSERT INTO `ky_district` VALUES ('530802', '思茅区', '530800');
INSERT INTO `ky_district` VALUES ('530821', '宁洱哈尼族彝族自治县', '530800');
INSERT INTO `ky_district` VALUES ('530822', '墨江哈尼族自治县', '530800');
INSERT INTO `ky_district` VALUES ('530823', '景东彝族自治县', '530800');
INSERT INTO `ky_district` VALUES ('530824', '景谷傣族彝族自治县', '530800');
INSERT INTO `ky_district` VALUES ('530825', '镇沅彝族哈尼族拉祜族自治县', '530800');
INSERT INTO `ky_district` VALUES ('530826', '江城哈尼族彝族自治县', '530800');
INSERT INTO `ky_district` VALUES ('530827', '孟连傣族拉祜族佤族自治县', '530800');
INSERT INTO `ky_district` VALUES ('530828', '澜沧拉祜族自治县', '530800');
INSERT INTO `ky_district` VALUES ('530829', '西盟佤族自治县', '530800');
INSERT INTO `ky_district` VALUES ('530900', '临沧市', '530000');
INSERT INTO `ky_district` VALUES ('530901', '市辖区', '530900');
INSERT INTO `ky_district` VALUES ('530902', '临翔区', '530900');
INSERT INTO `ky_district` VALUES ('530921', '凤庆县', '530900');
INSERT INTO `ky_district` VALUES ('530922', '云县', '530900');
INSERT INTO `ky_district` VALUES ('530923', '永德县', '530900');
INSERT INTO `ky_district` VALUES ('530924', '镇康县', '530900');
INSERT INTO `ky_district` VALUES ('530925', '双江拉祜族佤族布朗族傣族自治县', '530900');
INSERT INTO `ky_district` VALUES ('530926', '耿马傣族佤族自治县', '530900');
INSERT INTO `ky_district` VALUES ('530927', '沧源佤族自治县', '530900');
INSERT INTO `ky_district` VALUES ('532300', '楚雄彝族自治州', '530000');
INSERT INTO `ky_district` VALUES ('532301', '楚雄市', '532300');
INSERT INTO `ky_district` VALUES ('532322', '双柏县', '532300');
INSERT INTO `ky_district` VALUES ('532323', '牟定县', '532300');
INSERT INTO `ky_district` VALUES ('532324', '南华县', '532300');
INSERT INTO `ky_district` VALUES ('532325', '姚安县', '532300');
INSERT INTO `ky_district` VALUES ('532326', '大姚县', '532300');
INSERT INTO `ky_district` VALUES ('532327', '永仁县', '532300');
INSERT INTO `ky_district` VALUES ('532328', '元谋县', '532300');
INSERT INTO `ky_district` VALUES ('532329', '武定县', '532300');
INSERT INTO `ky_district` VALUES ('532331', '禄丰县', '532300');
INSERT INTO `ky_district` VALUES ('532500', '红河哈尼族彝族自治州', '530000');
INSERT INTO `ky_district` VALUES ('532501', '个旧市', '532500');
INSERT INTO `ky_district` VALUES ('532502', '开远市', '532500');
INSERT INTO `ky_district` VALUES ('532503', '蒙自市', '532500');
INSERT INTO `ky_district` VALUES ('532504', '弥勒市', '532500');
INSERT INTO `ky_district` VALUES ('532523', '屏边苗族自治县', '532500');
INSERT INTO `ky_district` VALUES ('532524', '建水县', '532500');
INSERT INTO `ky_district` VALUES ('532525', '石屏县', '532500');
INSERT INTO `ky_district` VALUES ('532527', '泸西县', '532500');
INSERT INTO `ky_district` VALUES ('532528', '元阳县', '532500');
INSERT INTO `ky_district` VALUES ('532529', '红河县', '532500');
INSERT INTO `ky_district` VALUES ('532530', '金平苗族瑶族傣族自治县', '532500');
INSERT INTO `ky_district` VALUES ('532531', '绿春县', '532500');
INSERT INTO `ky_district` VALUES ('532532', '河口瑶族自治县', '532500');
INSERT INTO `ky_district` VALUES ('532600', '文山壮族苗族自治州', '530000');
INSERT INTO `ky_district` VALUES ('532601', '文山市', '532600');
INSERT INTO `ky_district` VALUES ('532622', '砚山县', '532600');
INSERT INTO `ky_district` VALUES ('532623', '西畴县', '532600');
INSERT INTO `ky_district` VALUES ('532624', '麻栗坡县', '532600');
INSERT INTO `ky_district` VALUES ('532625', '马关县', '532600');
INSERT INTO `ky_district` VALUES ('532626', '丘北县', '532600');
INSERT INTO `ky_district` VALUES ('532627', '广南县', '532600');
INSERT INTO `ky_district` VALUES ('532628', '富宁县', '532600');
INSERT INTO `ky_district` VALUES ('532800', '西双版纳傣族自治州', '530000');
INSERT INTO `ky_district` VALUES ('532801', '景洪市', '532800');
INSERT INTO `ky_district` VALUES ('532822', '勐海县', '532800');
INSERT INTO `ky_district` VALUES ('532823', '勐腊县', '532800');
INSERT INTO `ky_district` VALUES ('532900', '大理白族自治州', '530000');
INSERT INTO `ky_district` VALUES ('532901', '大理市', '532900');
INSERT INTO `ky_district` VALUES ('532922', '漾濞彝族自治县', '532900');
INSERT INTO `ky_district` VALUES ('532923', '祥云县', '532900');
INSERT INTO `ky_district` VALUES ('532924', '宾川县', '532900');
INSERT INTO `ky_district` VALUES ('532925', '弥渡县', '532900');
INSERT INTO `ky_district` VALUES ('532926', '南涧彝族自治县', '532900');
INSERT INTO `ky_district` VALUES ('532927', '巍山彝族回族自治县', '532900');
INSERT INTO `ky_district` VALUES ('532928', '永平县', '532900');
INSERT INTO `ky_district` VALUES ('532929', '云龙县', '532900');
INSERT INTO `ky_district` VALUES ('532930', '洱源县', '532900');
INSERT INTO `ky_district` VALUES ('532931', '剑川县', '532900');
INSERT INTO `ky_district` VALUES ('532932', '鹤庆县', '532900');
INSERT INTO `ky_district` VALUES ('533100', '德宏傣族景颇族自治州', '530000');
INSERT INTO `ky_district` VALUES ('533102', '瑞丽市', '533100');
INSERT INTO `ky_district` VALUES ('533103', '芒市', '533100');
INSERT INTO `ky_district` VALUES ('533122', '梁河县', '533100');
INSERT INTO `ky_district` VALUES ('533123', '盈江县', '533100');
INSERT INTO `ky_district` VALUES ('533124', '陇川县', '533100');
INSERT INTO `ky_district` VALUES ('533300', '怒江傈僳族自治州', '530000');
INSERT INTO `ky_district` VALUES ('533321', '泸水县', '533300');
INSERT INTO `ky_district` VALUES ('533323', '福贡县', '533300');
INSERT INTO `ky_district` VALUES ('533324', '贡山独龙族怒族自治县', '533300');
INSERT INTO `ky_district` VALUES ('533325', '兰坪白族普米族自治县', '533300');
INSERT INTO `ky_district` VALUES ('533400', '迪庆藏族自治州', '530000');
INSERT INTO `ky_district` VALUES ('533401', '香格里拉市', '533400');
INSERT INTO `ky_district` VALUES ('533422', '德钦县', '533400');
INSERT INTO `ky_district` VALUES ('533423', '维西傈僳族自治县', '533400');
INSERT INTO `ky_district` VALUES ('540000', '西藏自治区', '0');
INSERT INTO `ky_district` VALUES ('540100', '拉萨市', '540000');
INSERT INTO `ky_district` VALUES ('540101', '市辖区', '540100');
INSERT INTO `ky_district` VALUES ('540102', '城关区', '540100');
INSERT INTO `ky_district` VALUES ('540121', '林周县', '540100');
INSERT INTO `ky_district` VALUES ('540122', '当雄县', '540100');
INSERT INTO `ky_district` VALUES ('540123', '尼木县', '540100');
INSERT INTO `ky_district` VALUES ('540124', '曲水县', '540100');
INSERT INTO `ky_district` VALUES ('540125', '堆龙德庆县', '540100');
INSERT INTO `ky_district` VALUES ('540126', '达孜县', '540100');
INSERT INTO `ky_district` VALUES ('540127', '墨竹工卡县', '540100');
INSERT INTO `ky_district` VALUES ('540200', '日喀则市', '540000');
INSERT INTO `ky_district` VALUES ('540201', '市辖区', '540200');
INSERT INTO `ky_district` VALUES ('540202', '桑珠孜区', '540200');
INSERT INTO `ky_district` VALUES ('540221', '南木林县', '540200');
INSERT INTO `ky_district` VALUES ('540222', '江孜县', '540200');
INSERT INTO `ky_district` VALUES ('540223', '定日县', '540200');
INSERT INTO `ky_district` VALUES ('540224', '萨迦县', '540200');
INSERT INTO `ky_district` VALUES ('540225', '拉孜县', '540200');
INSERT INTO `ky_district` VALUES ('540226', '昂仁县', '540200');
INSERT INTO `ky_district` VALUES ('540227', '谢通门县', '540200');
INSERT INTO `ky_district` VALUES ('540228', '白朗县', '540200');
INSERT INTO `ky_district` VALUES ('540229', '仁布县', '540200');
INSERT INTO `ky_district` VALUES ('540230', '康马县', '540200');
INSERT INTO `ky_district` VALUES ('540231', '定结县', '540200');
INSERT INTO `ky_district` VALUES ('540232', '仲巴县', '540200');
INSERT INTO `ky_district` VALUES ('540233', '亚东县', '540200');
INSERT INTO `ky_district` VALUES ('540234', '吉隆县', '540200');
INSERT INTO `ky_district` VALUES ('540235', '聂拉木县', '540200');
INSERT INTO `ky_district` VALUES ('540236', '萨嘎县', '540200');
INSERT INTO `ky_district` VALUES ('540237', '岗巴县', '540200');
INSERT INTO `ky_district` VALUES ('540300', '昌都市', '540000');
INSERT INTO `ky_district` VALUES ('540301', '市辖区', '540300');
INSERT INTO `ky_district` VALUES ('540302', '卡若区', '540300');
INSERT INTO `ky_district` VALUES ('540321', '江达县', '540300');
INSERT INTO `ky_district` VALUES ('540322', '贡觉县', '540300');
INSERT INTO `ky_district` VALUES ('540323', '类乌齐县', '540300');
INSERT INTO `ky_district` VALUES ('540324', '丁青县', '540300');
INSERT INTO `ky_district` VALUES ('540325', '察雅县', '540300');
INSERT INTO `ky_district` VALUES ('540326', '八宿县', '540300');
INSERT INTO `ky_district` VALUES ('540327', '左贡县', '540300');
INSERT INTO `ky_district` VALUES ('540328', '芒康县', '540300');
INSERT INTO `ky_district` VALUES ('540329', '洛隆县', '540300');
INSERT INTO `ky_district` VALUES ('540330', '边坝县', '540300');
INSERT INTO `ky_district` VALUES ('542200', '山南地区', '540000');
INSERT INTO `ky_district` VALUES ('542221', '乃东县', '542200');
INSERT INTO `ky_district` VALUES ('542222', '扎囊县', '542200');
INSERT INTO `ky_district` VALUES ('542223', '贡嘎县', '542200');
INSERT INTO `ky_district` VALUES ('542224', '桑日县', '542200');
INSERT INTO `ky_district` VALUES ('542225', '琼结县', '542200');
INSERT INTO `ky_district` VALUES ('542226', '曲松县', '542200');
INSERT INTO `ky_district` VALUES ('542227', '措美县', '542200');
INSERT INTO `ky_district` VALUES ('542228', '洛扎县', '542200');
INSERT INTO `ky_district` VALUES ('542229', '加查县', '542200');
INSERT INTO `ky_district` VALUES ('542231', '隆子县', '542200');
INSERT INTO `ky_district` VALUES ('542232', '错那县', '542200');
INSERT INTO `ky_district` VALUES ('542233', '浪卡子县', '542200');
INSERT INTO `ky_district` VALUES ('542400', '那曲地区', '540000');
INSERT INTO `ky_district` VALUES ('542421', '那曲县', '542400');
INSERT INTO `ky_district` VALUES ('542422', '嘉黎县', '542400');
INSERT INTO `ky_district` VALUES ('542423', '比如县', '542400');
INSERT INTO `ky_district` VALUES ('542424', '聂荣县', '542400');
INSERT INTO `ky_district` VALUES ('542425', '安多县', '542400');
INSERT INTO `ky_district` VALUES ('542426', '申扎县', '542400');
INSERT INTO `ky_district` VALUES ('542427', '索县', '542400');
INSERT INTO `ky_district` VALUES ('542428', '班戈县', '542400');
INSERT INTO `ky_district` VALUES ('542429', '巴青县', '542400');
INSERT INTO `ky_district` VALUES ('542430', '尼玛县', '542400');
INSERT INTO `ky_district` VALUES ('542431', '双湖县', '542400');
INSERT INTO `ky_district` VALUES ('542500', '阿里地区', '540000');
INSERT INTO `ky_district` VALUES ('542521', '普兰县', '542500');
INSERT INTO `ky_district` VALUES ('542522', '札达县', '542500');
INSERT INTO `ky_district` VALUES ('542523', '噶尔县', '542500');
INSERT INTO `ky_district` VALUES ('542524', '日土县', '542500');
INSERT INTO `ky_district` VALUES ('542525', '革吉县', '542500');
INSERT INTO `ky_district` VALUES ('542526', '改则县', '542500');
INSERT INTO `ky_district` VALUES ('542527', '措勤县', '542500');
INSERT INTO `ky_district` VALUES ('542600', '林芝地区', '540000');
INSERT INTO `ky_district` VALUES ('542621', '林芝县', '542600');
INSERT INTO `ky_district` VALUES ('542622', '工布江达县', '542600');
INSERT INTO `ky_district` VALUES ('542623', '米林县', '542600');
INSERT INTO `ky_district` VALUES ('542624', '墨脱县', '542600');
INSERT INTO `ky_district` VALUES ('542625', '波密县', '542600');
INSERT INTO `ky_district` VALUES ('542626', '察隅县', '542600');
INSERT INTO `ky_district` VALUES ('542627', '朗县', '542600');
INSERT INTO `ky_district` VALUES ('610000', '陕西省', '0');
INSERT INTO `ky_district` VALUES ('610100', '西安市', '610000');
INSERT INTO `ky_district` VALUES ('610101', '市辖区', '610100');
INSERT INTO `ky_district` VALUES ('610102', '新城区', '610100');
INSERT INTO `ky_district` VALUES ('610103', '碑林区', '610100');
INSERT INTO `ky_district` VALUES ('610104', '莲湖区', '610100');
INSERT INTO `ky_district` VALUES ('610111', '灞桥区', '610100');
INSERT INTO `ky_district` VALUES ('610112', '未央区', '610100');
INSERT INTO `ky_district` VALUES ('610113', '雁塔区', '610100');
INSERT INTO `ky_district` VALUES ('610114', '阎良区', '610100');
INSERT INTO `ky_district` VALUES ('610115', '临潼区', '610100');
INSERT INTO `ky_district` VALUES ('610116', '长安区', '610100');
INSERT INTO `ky_district` VALUES ('610117', '高陵区', '610100');
INSERT INTO `ky_district` VALUES ('610122', '蓝田县', '610100');
INSERT INTO `ky_district` VALUES ('610124', '周至县', '610100');
INSERT INTO `ky_district` VALUES ('610125', '户县', '610100');
INSERT INTO `ky_district` VALUES ('610200', '铜川市', '610000');
INSERT INTO `ky_district` VALUES ('610201', '市辖区', '610200');
INSERT INTO `ky_district` VALUES ('610202', '王益区', '610200');
INSERT INTO `ky_district` VALUES ('610203', '印台区', '610200');
INSERT INTO `ky_district` VALUES ('610204', '耀州区', '610200');
INSERT INTO `ky_district` VALUES ('610222', '宜君县', '610200');
INSERT INTO `ky_district` VALUES ('610300', '宝鸡市', '610000');
INSERT INTO `ky_district` VALUES ('610301', '市辖区', '610300');
INSERT INTO `ky_district` VALUES ('610302', '渭滨区', '610300');
INSERT INTO `ky_district` VALUES ('610303', '金台区', '610300');
INSERT INTO `ky_district` VALUES ('610304', '陈仓区', '610300');
INSERT INTO `ky_district` VALUES ('610322', '凤翔县', '610300');
INSERT INTO `ky_district` VALUES ('610323', '岐山县', '610300');
INSERT INTO `ky_district` VALUES ('610324', '扶风县', '610300');
INSERT INTO `ky_district` VALUES ('610326', '眉县', '610300');
INSERT INTO `ky_district` VALUES ('610327', '陇县', '610300');
INSERT INTO `ky_district` VALUES ('610328', '千阳县', '610300');
INSERT INTO `ky_district` VALUES ('610329', '麟游县', '610300');
INSERT INTO `ky_district` VALUES ('610330', '凤县', '610300');
INSERT INTO `ky_district` VALUES ('610331', '太白县', '610300');
INSERT INTO `ky_district` VALUES ('610400', '咸阳市', '610000');
INSERT INTO `ky_district` VALUES ('610401', '市辖区', '610400');
INSERT INTO `ky_district` VALUES ('610402', '秦都区', '610400');
INSERT INTO `ky_district` VALUES ('610403', '杨陵区', '610400');
INSERT INTO `ky_district` VALUES ('610404', '渭城区', '610400');
INSERT INTO `ky_district` VALUES ('610422', '三原县', '610400');
INSERT INTO `ky_district` VALUES ('610423', '泾阳县', '610400');
INSERT INTO `ky_district` VALUES ('610424', '乾县', '610400');
INSERT INTO `ky_district` VALUES ('610425', '礼泉县', '610400');
INSERT INTO `ky_district` VALUES ('610426', '永寿县', '610400');
INSERT INTO `ky_district` VALUES ('610427', '彬县', '610400');
INSERT INTO `ky_district` VALUES ('610428', '长武县', '610400');
INSERT INTO `ky_district` VALUES ('610429', '旬邑县', '610400');
INSERT INTO `ky_district` VALUES ('610430', '淳化县', '610400');
INSERT INTO `ky_district` VALUES ('610431', '武功县', '610400');
INSERT INTO `ky_district` VALUES ('610481', '兴平市', '610400');
INSERT INTO `ky_district` VALUES ('610500', '渭南市', '610000');
INSERT INTO `ky_district` VALUES ('610501', '市辖区', '610500');
INSERT INTO `ky_district` VALUES ('610502', '临渭区', '610500');
INSERT INTO `ky_district` VALUES ('610521', '华县', '610500');
INSERT INTO `ky_district` VALUES ('610522', '潼关县', '610500');
INSERT INTO `ky_district` VALUES ('610523', '大荔县', '610500');
INSERT INTO `ky_district` VALUES ('610524', '合阳县', '610500');
INSERT INTO `ky_district` VALUES ('610525', '澄城县', '610500');
INSERT INTO `ky_district` VALUES ('610526', '蒲城县', '610500');
INSERT INTO `ky_district` VALUES ('610527', '白水县', '610500');
INSERT INTO `ky_district` VALUES ('610528', '富平县', '610500');
INSERT INTO `ky_district` VALUES ('610581', '韩城市', '610500');
INSERT INTO `ky_district` VALUES ('610582', '华阴市', '610500');
INSERT INTO `ky_district` VALUES ('610600', '延安市', '610000');
INSERT INTO `ky_district` VALUES ('610601', '市辖区', '610600');
INSERT INTO `ky_district` VALUES ('610602', '宝塔区', '610600');
INSERT INTO `ky_district` VALUES ('610621', '延长县', '610600');
INSERT INTO `ky_district` VALUES ('610622', '延川县', '610600');
INSERT INTO `ky_district` VALUES ('610623', '子长县', '610600');
INSERT INTO `ky_district` VALUES ('610624', '安塞县', '610600');
INSERT INTO `ky_district` VALUES ('610625', '志丹县', '610600');
INSERT INTO `ky_district` VALUES ('610626', '吴起县', '610600');
INSERT INTO `ky_district` VALUES ('610627', '甘泉县', '610600');
INSERT INTO `ky_district` VALUES ('610628', '富县', '610600');
INSERT INTO `ky_district` VALUES ('610629', '洛川县', '610600');
INSERT INTO `ky_district` VALUES ('610630', '宜川县', '610600');
INSERT INTO `ky_district` VALUES ('610631', '黄龙县', '610600');
INSERT INTO `ky_district` VALUES ('610632', '黄陵县', '610600');
INSERT INTO `ky_district` VALUES ('610700', '汉中市', '610000');
INSERT INTO `ky_district` VALUES ('610701', '市辖区', '610700');
INSERT INTO `ky_district` VALUES ('610702', '汉台区', '610700');
INSERT INTO `ky_district` VALUES ('610721', '南郑县', '610700');
INSERT INTO `ky_district` VALUES ('610722', '城固县', '610700');
INSERT INTO `ky_district` VALUES ('610723', '洋县', '610700');
INSERT INTO `ky_district` VALUES ('610724', '西乡县', '610700');
INSERT INTO `ky_district` VALUES ('610725', '勉县', '610700');
INSERT INTO `ky_district` VALUES ('610726', '宁强县', '610700');
INSERT INTO `ky_district` VALUES ('610727', '略阳县', '610700');
INSERT INTO `ky_district` VALUES ('610728', '镇巴县', '610700');
INSERT INTO `ky_district` VALUES ('610729', '留坝县', '610700');
INSERT INTO `ky_district` VALUES ('610730', '佛坪县', '610700');
INSERT INTO `ky_district` VALUES ('610800', '榆林市', '610000');
INSERT INTO `ky_district` VALUES ('610801', '市辖区', '610800');
INSERT INTO `ky_district` VALUES ('610802', '榆阳区', '610800');
INSERT INTO `ky_district` VALUES ('610803', '高新区', '610800');
INSERT INTO `ky_district` VALUES ('610821', '神木县', '610800');
INSERT INTO `ky_district` VALUES ('610822', '府谷县', '610800');
INSERT INTO `ky_district` VALUES ('610823', '横山县', '610800');
INSERT INTO `ky_district` VALUES ('610824', '靖边县', '610800');
INSERT INTO `ky_district` VALUES ('610825', '定边县', '610800');
INSERT INTO `ky_district` VALUES ('610826', '绥德县', '610800');
INSERT INTO `ky_district` VALUES ('610827', '米脂县', '610800');
INSERT INTO `ky_district` VALUES ('610828', '佳县', '610800');
INSERT INTO `ky_district` VALUES ('610829', '吴堡县', '610800');
INSERT INTO `ky_district` VALUES ('610830', '清涧县', '610800');
INSERT INTO `ky_district` VALUES ('610831', '子洲县', '610800');
INSERT INTO `ky_district` VALUES ('610900', '安康市', '610000');
INSERT INTO `ky_district` VALUES ('610901', '市辖区', '610900');
INSERT INTO `ky_district` VALUES ('610921', '汉阴县', '610900');
INSERT INTO `ky_district` VALUES ('610922', '石泉县', '610900');
INSERT INTO `ky_district` VALUES ('610923', '宁陕县', '610900');
INSERT INTO `ky_district` VALUES ('610924', '紫阳县', '610900');
INSERT INTO `ky_district` VALUES ('610925', '岚皋县', '610900');
INSERT INTO `ky_district` VALUES ('610926', '平利县', '610900');
INSERT INTO `ky_district` VALUES ('610927', '镇坪县', '610900');
INSERT INTO `ky_district` VALUES ('610928', '旬阳县', '610900');
INSERT INTO `ky_district` VALUES ('610929', '白河县', '610900');
INSERT INTO `ky_district` VALUES ('611000', '商洛市', '610000');
INSERT INTO `ky_district` VALUES ('611001', '市辖区', '611000');
INSERT INTO `ky_district` VALUES ('611002', '商州区', '611000');
INSERT INTO `ky_district` VALUES ('611021', '洛南县', '611000');
INSERT INTO `ky_district` VALUES ('611022', '丹凤县', '611000');
INSERT INTO `ky_district` VALUES ('611023', '商南县', '611000');
INSERT INTO `ky_district` VALUES ('611024', '山阳县', '611000');
INSERT INTO `ky_district` VALUES ('611025', '镇安县', '611000');
INSERT INTO `ky_district` VALUES ('611026', '柞水县', '611000');
INSERT INTO `ky_district` VALUES ('620000', '甘肃省', '0');
INSERT INTO `ky_district` VALUES ('620100', '兰州市', '620000');
INSERT INTO `ky_district` VALUES ('620101', '市辖区', '620100');
INSERT INTO `ky_district` VALUES ('620102', '城关区', '620100');
INSERT INTO `ky_district` VALUES ('620103', '七里河区', '620100');
INSERT INTO `ky_district` VALUES ('620104', '西固区', '620100');
INSERT INTO `ky_district` VALUES ('620105', '安宁区', '620100');
INSERT INTO `ky_district` VALUES ('620111', '红古区', '620100');
INSERT INTO `ky_district` VALUES ('620121', '永登县', '620100');
INSERT INTO `ky_district` VALUES ('620122', '皋兰县', '620100');
INSERT INTO `ky_district` VALUES ('620123', '榆中县', '620100');
INSERT INTO `ky_district` VALUES ('620200', '嘉峪关市', '620000');
INSERT INTO `ky_district` VALUES ('620201', '市辖区', '620200');
INSERT INTO `ky_district` VALUES ('620300', '金昌市', '620000');
INSERT INTO `ky_district` VALUES ('620301', '市辖区', '620300');
INSERT INTO `ky_district` VALUES ('620302', '金川区', '620300');
INSERT INTO `ky_district` VALUES ('620321', '永昌县', '620300');
INSERT INTO `ky_district` VALUES ('620400', '白银市', '620000');
INSERT INTO `ky_district` VALUES ('620401', '市辖区', '620400');
INSERT INTO `ky_district` VALUES ('620402', '白银区', '620400');
INSERT INTO `ky_district` VALUES ('620403', '平川区', '620400');
INSERT INTO `ky_district` VALUES ('620421', '靖远县', '620400');
INSERT INTO `ky_district` VALUES ('620422', '会宁县', '620400');
INSERT INTO `ky_district` VALUES ('620423', '景泰县', '620400');
INSERT INTO `ky_district` VALUES ('620500', '天水市', '620000');
INSERT INTO `ky_district` VALUES ('620501', '市辖区', '620500');
INSERT INTO `ky_district` VALUES ('620502', '秦州区', '620500');
INSERT INTO `ky_district` VALUES ('620503', '麦积区', '620500');
INSERT INTO `ky_district` VALUES ('620521', '清水县', '620500');
INSERT INTO `ky_district` VALUES ('620522', '秦安县', '620500');
INSERT INTO `ky_district` VALUES ('620523', '甘谷县', '620500');
INSERT INTO `ky_district` VALUES ('620524', '武山县', '620500');
INSERT INTO `ky_district` VALUES ('620525', '张家川回族自治县', '620500');
INSERT INTO `ky_district` VALUES ('620600', '武威市', '620000');
INSERT INTO `ky_district` VALUES ('620601', '市辖区', '620600');
INSERT INTO `ky_district` VALUES ('620602', '凉州区', '620600');
INSERT INTO `ky_district` VALUES ('620621', '民勤县', '620600');
INSERT INTO `ky_district` VALUES ('620622', '古浪县', '620600');
INSERT INTO `ky_district` VALUES ('620623', '天祝藏族自治县', '620600');
INSERT INTO `ky_district` VALUES ('620700', '张掖市', '620000');
INSERT INTO `ky_district` VALUES ('620701', '市辖区', '620700');
INSERT INTO `ky_district` VALUES ('620702', '甘州区', '620700');
INSERT INTO `ky_district` VALUES ('620721', '肃南裕固族自治县', '620700');
INSERT INTO `ky_district` VALUES ('620722', '民乐县', '620700');
INSERT INTO `ky_district` VALUES ('620723', '临泽县', '620700');
INSERT INTO `ky_district` VALUES ('620724', '高台县', '620700');
INSERT INTO `ky_district` VALUES ('620725', '山丹县', '620700');
INSERT INTO `ky_district` VALUES ('620800', '平凉市', '620000');
INSERT INTO `ky_district` VALUES ('620801', '市辖区', '620800');
INSERT INTO `ky_district` VALUES ('620802', '崆峒区', '620800');
INSERT INTO `ky_district` VALUES ('620821', '泾川县', '620800');
INSERT INTO `ky_district` VALUES ('620822', '灵台县', '620800');
INSERT INTO `ky_district` VALUES ('620823', '崇信县', '620800');
INSERT INTO `ky_district` VALUES ('620824', '华亭县', '620800');
INSERT INTO `ky_district` VALUES ('620825', '庄浪县', '620800');
INSERT INTO `ky_district` VALUES ('620826', '静宁县', '620800');
INSERT INTO `ky_district` VALUES ('620900', '酒泉市', '620000');
INSERT INTO `ky_district` VALUES ('620901', '市辖区', '620900');
INSERT INTO `ky_district` VALUES ('620902', '肃州区', '620900');
INSERT INTO `ky_district` VALUES ('620921', '金塔县', '620900');
INSERT INTO `ky_district` VALUES ('620922', '瓜州县', '620900');
INSERT INTO `ky_district` VALUES ('620923', '肃北蒙古族自治县', '620900');
INSERT INTO `ky_district` VALUES ('620924', '阿克塞哈萨克族自治县', '620900');
INSERT INTO `ky_district` VALUES ('620981', '玉门市', '620900');
INSERT INTO `ky_district` VALUES ('620982', '敦煌市', '620900');
INSERT INTO `ky_district` VALUES ('621000', '庆阳市', '620000');
INSERT INTO `ky_district` VALUES ('621001', '市辖区', '621000');
INSERT INTO `ky_district` VALUES ('621002', '西峰区', '621000');
INSERT INTO `ky_district` VALUES ('621021', '庆城县', '621000');
INSERT INTO `ky_district` VALUES ('621022', '环县', '621000');
INSERT INTO `ky_district` VALUES ('621023', '华池县', '621000');
INSERT INTO `ky_district` VALUES ('621024', '合水县', '621000');
INSERT INTO `ky_district` VALUES ('621025', '正宁县', '621000');
INSERT INTO `ky_district` VALUES ('621026', '宁县', '621000');
INSERT INTO `ky_district` VALUES ('621027', '镇原县', '621000');
INSERT INTO `ky_district` VALUES ('621100', '定西市', '620000');
INSERT INTO `ky_district` VALUES ('621101', '市辖区', '621100');
INSERT INTO `ky_district` VALUES ('621102', '安定区', '621100');
INSERT INTO `ky_district` VALUES ('621121', '通渭县', '621100');
INSERT INTO `ky_district` VALUES ('621122', '陇西县', '621100');
INSERT INTO `ky_district` VALUES ('621123', '渭源县', '621100');
INSERT INTO `ky_district` VALUES ('621124', '临洮县', '621100');
INSERT INTO `ky_district` VALUES ('621125', '漳县', '621100');
INSERT INTO `ky_district` VALUES ('621126', '岷县', '621100');
INSERT INTO `ky_district` VALUES ('621200', '陇南市', '620000');
INSERT INTO `ky_district` VALUES ('621201', '市辖区', '621200');
INSERT INTO `ky_district` VALUES ('621202', '武都区', '621200');
INSERT INTO `ky_district` VALUES ('621221', '成县', '621200');
INSERT INTO `ky_district` VALUES ('621222', '文县', '621200');
INSERT INTO `ky_district` VALUES ('621223', '宕昌县', '621200');
INSERT INTO `ky_district` VALUES ('621224', '康县', '621200');
INSERT INTO `ky_district` VALUES ('621225', '西和县', '621200');
INSERT INTO `ky_district` VALUES ('621226', '礼县', '621200');
INSERT INTO `ky_district` VALUES ('621227', '徽县', '621200');
INSERT INTO `ky_district` VALUES ('621228', '两当县', '621200');
INSERT INTO `ky_district` VALUES ('622900', '临夏回族自治州', '620000');
INSERT INTO `ky_district` VALUES ('622901', '临夏市', '622900');
INSERT INTO `ky_district` VALUES ('622921', '临夏县', '622900');
INSERT INTO `ky_district` VALUES ('622922', '康乐县', '622900');
INSERT INTO `ky_district` VALUES ('622923', '永靖县', '622900');
INSERT INTO `ky_district` VALUES ('622924', '广河县', '622900');
INSERT INTO `ky_district` VALUES ('622925', '和政县', '622900');
INSERT INTO `ky_district` VALUES ('622926', '东乡族自治县', '622900');
INSERT INTO `ky_district` VALUES ('622927', '积石山保安族东乡族撒拉族自治县', '622900');
INSERT INTO `ky_district` VALUES ('623000', '甘南藏族自治州', '620000');
INSERT INTO `ky_district` VALUES ('623001', '合作市', '623000');
INSERT INTO `ky_district` VALUES ('623021', '临潭县', '623000');
INSERT INTO `ky_district` VALUES ('623022', '卓尼县', '623000');
INSERT INTO `ky_district` VALUES ('623023', '舟曲县', '623000');
INSERT INTO `ky_district` VALUES ('623024', '迭部县', '623000');
INSERT INTO `ky_district` VALUES ('623025', '玛曲县', '623000');
INSERT INTO `ky_district` VALUES ('623026', '碌曲县', '623000');
INSERT INTO `ky_district` VALUES ('623027', '夏河县', '623000');
INSERT INTO `ky_district` VALUES ('630000', '青海省', '0');
INSERT INTO `ky_district` VALUES ('630100', '西宁市', '630000');
INSERT INTO `ky_district` VALUES ('630101', '市辖区', '630100');
INSERT INTO `ky_district` VALUES ('630102', '城东区', '630100');
INSERT INTO `ky_district` VALUES ('630103', '城中区', '630100');
INSERT INTO `ky_district` VALUES ('630104', '城西区', '630100');
INSERT INTO `ky_district` VALUES ('630105', '城北区', '630100');
INSERT INTO `ky_district` VALUES ('630121', '大通回族土族自治县', '630100');
INSERT INTO `ky_district` VALUES ('630122', '湟中县', '630100');
INSERT INTO `ky_district` VALUES ('630123', '湟源县', '630100');
INSERT INTO `ky_district` VALUES ('630200', '海东市', '630000');
INSERT INTO `ky_district` VALUES ('630201', '市辖区', '630200');
INSERT INTO `ky_district` VALUES ('630202', '乐都区', '630200');
INSERT INTO `ky_district` VALUES ('630221', '平安县', '630200');
INSERT INTO `ky_district` VALUES ('630222', '民和回族土族自治县', '630200');
INSERT INTO `ky_district` VALUES ('630223', '互助土族自治县', '630200');
INSERT INTO `ky_district` VALUES ('630224', '化隆回族自治县', '630200');
INSERT INTO `ky_district` VALUES ('630225', '循化撒拉族自治县', '630200');
INSERT INTO `ky_district` VALUES ('632200', '海北藏族自治州', '630000');
INSERT INTO `ky_district` VALUES ('632221', '门源回族自治县', '632200');
INSERT INTO `ky_district` VALUES ('632222', '祁连县', '632200');
INSERT INTO `ky_district` VALUES ('632223', '海晏县', '632200');
INSERT INTO `ky_district` VALUES ('632224', '刚察县', '632200');
INSERT INTO `ky_district` VALUES ('632300', '黄南藏族自治州', '630000');
INSERT INTO `ky_district` VALUES ('632321', '同仁县', '632300');
INSERT INTO `ky_district` VALUES ('632322', '尖扎县', '632300');
INSERT INTO `ky_district` VALUES ('632323', '泽库县', '632300');
INSERT INTO `ky_district` VALUES ('632324', '河南蒙古族自治县', '632300');
INSERT INTO `ky_district` VALUES ('632500', '海南藏族自治州', '630000');
INSERT INTO `ky_district` VALUES ('632521', '共和县', '632500');
INSERT INTO `ky_district` VALUES ('632522', '同德县', '632500');
INSERT INTO `ky_district` VALUES ('632523', '贵德县', '632500');
INSERT INTO `ky_district` VALUES ('632524', '兴海县', '632500');
INSERT INTO `ky_district` VALUES ('632525', '贵南县', '632500');
INSERT INTO `ky_district` VALUES ('632600', '果洛藏族自治州', '630000');
INSERT INTO `ky_district` VALUES ('632621', '玛沁县', '632600');
INSERT INTO `ky_district` VALUES ('632622', '班玛县', '632600');
INSERT INTO `ky_district` VALUES ('632623', '甘德县', '632600');
INSERT INTO `ky_district` VALUES ('632624', '达日县', '632600');
INSERT INTO `ky_district` VALUES ('632625', '久治县', '632600');
INSERT INTO `ky_district` VALUES ('632626', '玛多县', '632600');
INSERT INTO `ky_district` VALUES ('632700', '玉树藏族自治州', '630000');
INSERT INTO `ky_district` VALUES ('632701', '玉树市', '632700');
INSERT INTO `ky_district` VALUES ('632722', '杂多县', '632700');
INSERT INTO `ky_district` VALUES ('632723', '称多县', '632700');
INSERT INTO `ky_district` VALUES ('632724', '治多县', '632700');
INSERT INTO `ky_district` VALUES ('632725', '囊谦县', '632700');
INSERT INTO `ky_district` VALUES ('632726', '曲麻莱县', '632700');
INSERT INTO `ky_district` VALUES ('632800', '海西蒙古族藏族自治州', '630000');
INSERT INTO `ky_district` VALUES ('632801', '格尔木市', '632800');
INSERT INTO `ky_district` VALUES ('632802', '德令哈市', '632800');
INSERT INTO `ky_district` VALUES ('632821', '乌兰县', '632800');
INSERT INTO `ky_district` VALUES ('632822', '都兰县', '632800');
INSERT INTO `ky_district` VALUES ('632823', '天峻县', '632800');
INSERT INTO `ky_district` VALUES ('640000', '宁夏回族自治区', '0');
INSERT INTO `ky_district` VALUES ('640100', '银川市', '640000');
INSERT INTO `ky_district` VALUES ('640101', '市辖区', '640100');
INSERT INTO `ky_district` VALUES ('640104', '兴庆区', '640100');
INSERT INTO `ky_district` VALUES ('640105', '西夏区', '640100');
INSERT INTO `ky_district` VALUES ('640106', '金凤区', '640100');
INSERT INTO `ky_district` VALUES ('640121', '永宁县', '640100');
INSERT INTO `ky_district` VALUES ('640122', '贺兰县', '640100');
INSERT INTO `ky_district` VALUES ('640181', '灵武市', '640100');
INSERT INTO `ky_district` VALUES ('640200', '石嘴山市', '640000');
INSERT INTO `ky_district` VALUES ('640201', '市辖区', '640200');
INSERT INTO `ky_district` VALUES ('640202', '大武口区', '640200');
INSERT INTO `ky_district` VALUES ('640205', '惠农区', '640200');
INSERT INTO `ky_district` VALUES ('640221', '平罗县', '640200');
INSERT INTO `ky_district` VALUES ('640300', '吴忠市', '640000');
INSERT INTO `ky_district` VALUES ('640301', '市辖区', '640300');
INSERT INTO `ky_district` VALUES ('640302', '利通区', '640300');
INSERT INTO `ky_district` VALUES ('640303', '红寺堡区', '640300');
INSERT INTO `ky_district` VALUES ('640323', '盐池县', '640300');
INSERT INTO `ky_district` VALUES ('640324', '同心县', '640300');
INSERT INTO `ky_district` VALUES ('640381', '青铜峡市', '640300');
INSERT INTO `ky_district` VALUES ('640400', '固原市', '640000');
INSERT INTO `ky_district` VALUES ('640401', '市辖区', '640400');
INSERT INTO `ky_district` VALUES ('640402', '原州区', '640400');
INSERT INTO `ky_district` VALUES ('640422', '西吉县', '640400');
INSERT INTO `ky_district` VALUES ('640423', '隆德县', '640400');
INSERT INTO `ky_district` VALUES ('640424', '泾源县', '640400');
INSERT INTO `ky_district` VALUES ('640425', '彭阳县', '640400');
INSERT INTO `ky_district` VALUES ('640500', '中卫市', '640000');
INSERT INTO `ky_district` VALUES ('640501', '市辖区', '640500');
INSERT INTO `ky_district` VALUES ('640502', '沙坡头区', '640500');
INSERT INTO `ky_district` VALUES ('640521', '中宁县', '640500');
INSERT INTO `ky_district` VALUES ('640522', '海原县', '640500');
INSERT INTO `ky_district` VALUES ('650000', '新疆维吾尔自治区', '0');
INSERT INTO `ky_district` VALUES ('650100', '乌鲁木齐市', '650000');
INSERT INTO `ky_district` VALUES ('650101', '市辖区', '650100');
INSERT INTO `ky_district` VALUES ('650102', '天山区', '650100');
INSERT INTO `ky_district` VALUES ('650103', '沙依巴克区', '650100');
INSERT INTO `ky_district` VALUES ('650104', '新市区', '650100');
INSERT INTO `ky_district` VALUES ('650105', '水磨沟区', '650100');
INSERT INTO `ky_district` VALUES ('650106', '头屯河区', '650100');
INSERT INTO `ky_district` VALUES ('650107', '达坂城区', '650100');
INSERT INTO `ky_district` VALUES ('650109', '米东区', '650100');
INSERT INTO `ky_district` VALUES ('650121', '乌鲁木齐县', '650100');
INSERT INTO `ky_district` VALUES ('650200', '克拉玛依市', '650000');
INSERT INTO `ky_district` VALUES ('650201', '市辖区', '650200');
INSERT INTO `ky_district` VALUES ('650202', '独山子区', '650200');
INSERT INTO `ky_district` VALUES ('650203', '克拉玛依区', '650200');
INSERT INTO `ky_district` VALUES ('650204', '白碱滩区', '650200');
INSERT INTO `ky_district` VALUES ('650205', '乌尔禾区', '650200');
INSERT INTO `ky_district` VALUES ('652100', '吐鲁番地区', '650000');
INSERT INTO `ky_district` VALUES ('652101', '吐鲁番市', '652100');
INSERT INTO `ky_district` VALUES ('652122', '鄯善县', '652100');
INSERT INTO `ky_district` VALUES ('652123', '托克逊县', '652100');
INSERT INTO `ky_district` VALUES ('652200', '哈密地区', '650000');
INSERT INTO `ky_district` VALUES ('652201', '哈密市', '652200');
INSERT INTO `ky_district` VALUES ('652222', '巴里坤哈萨克自治县', '652200');
INSERT INTO `ky_district` VALUES ('652223', '伊吾县', '652200');
INSERT INTO `ky_district` VALUES ('652300', '昌吉回族自治州', '650000');
INSERT INTO `ky_district` VALUES ('652301', '昌吉市', '652300');
INSERT INTO `ky_district` VALUES ('652302', '阜康市', '652300');
INSERT INTO `ky_district` VALUES ('652323', '呼图壁县', '652300');
INSERT INTO `ky_district` VALUES ('652324', '玛纳斯县', '652300');
INSERT INTO `ky_district` VALUES ('652325', '奇台县', '652300');
INSERT INTO `ky_district` VALUES ('652327', '吉木萨尔县', '652300');
INSERT INTO `ky_district` VALUES ('652328', '木垒哈萨克自治县', '652300');
INSERT INTO `ky_district` VALUES ('652700', '博尔塔拉蒙古自治州', '650000');
INSERT INTO `ky_district` VALUES ('652701', '博乐市', '652700');
INSERT INTO `ky_district` VALUES ('652702', '阿拉山口市', '652700');
INSERT INTO `ky_district` VALUES ('652722', '精河县', '652700');
INSERT INTO `ky_district` VALUES ('652723', '温泉县', '652700');
INSERT INTO `ky_district` VALUES ('652800', '巴音郭楞蒙古自治州', '650000');
INSERT INTO `ky_district` VALUES ('652801', '库尔勒市', '652800');
INSERT INTO `ky_district` VALUES ('652822', '轮台县', '652800');
INSERT INTO `ky_district` VALUES ('652823', '尉犁县', '652800');
INSERT INTO `ky_district` VALUES ('652824', '若羌县', '652800');
INSERT INTO `ky_district` VALUES ('652825', '且末县', '652800');
INSERT INTO `ky_district` VALUES ('652826', '焉耆回族自治县', '652800');
INSERT INTO `ky_district` VALUES ('652827', '和静县', '652800');
INSERT INTO `ky_district` VALUES ('652828', '和硕县', '652800');
INSERT INTO `ky_district` VALUES ('652829', '博湖县', '652800');
INSERT INTO `ky_district` VALUES ('652900', '阿克苏地区', '650000');
INSERT INTO `ky_district` VALUES ('652901', '阿克苏市', '652900');
INSERT INTO `ky_district` VALUES ('652922', '温宿县', '652900');
INSERT INTO `ky_district` VALUES ('652923', '库车县', '652900');
INSERT INTO `ky_district` VALUES ('652924', '沙雅县', '652900');
INSERT INTO `ky_district` VALUES ('652925', '新和县', '652900');
INSERT INTO `ky_district` VALUES ('652926', '拜城县', '652900');
INSERT INTO `ky_district` VALUES ('652927', '乌什县', '652900');
INSERT INTO `ky_district` VALUES ('652928', '阿瓦提县', '652900');
INSERT INTO `ky_district` VALUES ('652929', '柯坪县', '652900');
INSERT INTO `ky_district` VALUES ('653000', '克孜勒苏柯尔克孜自治州', '650000');
INSERT INTO `ky_district` VALUES ('653001', '阿图什市', '653000');
INSERT INTO `ky_district` VALUES ('653022', '阿克陶县', '653000');
INSERT INTO `ky_district` VALUES ('653023', '阿合奇县', '653000');
INSERT INTO `ky_district` VALUES ('653024', '乌恰县', '653000');
INSERT INTO `ky_district` VALUES ('653100', '喀什地区', '650000');
INSERT INTO `ky_district` VALUES ('653101', '喀什市', '653100');
INSERT INTO `ky_district` VALUES ('653121', '疏附县', '653100');
INSERT INTO `ky_district` VALUES ('653122', '疏勒县', '653100');
INSERT INTO `ky_district` VALUES ('653123', '英吉沙县', '653100');
INSERT INTO `ky_district` VALUES ('653124', '泽普县', '653100');
INSERT INTO `ky_district` VALUES ('653125', '莎车县', '653100');
INSERT INTO `ky_district` VALUES ('653126', '叶城县', '653100');
INSERT INTO `ky_district` VALUES ('653127', '麦盖提县', '653100');
INSERT INTO `ky_district` VALUES ('653128', '岳普湖县', '653100');
INSERT INTO `ky_district` VALUES ('653129', '伽师县', '653100');
INSERT INTO `ky_district` VALUES ('653130', '巴楚县', '653100');
INSERT INTO `ky_district` VALUES ('653131', '塔什库尔干塔吉克自治县', '653100');
INSERT INTO `ky_district` VALUES ('653200', '和田地区', '650000');
INSERT INTO `ky_district` VALUES ('653201', '和田市', '653200');
INSERT INTO `ky_district` VALUES ('653221', '和田县', '653200');
INSERT INTO `ky_district` VALUES ('653222', '墨玉县', '653200');
INSERT INTO `ky_district` VALUES ('653223', '皮山县', '653200');
INSERT INTO `ky_district` VALUES ('653224', '洛浦县', '653200');
INSERT INTO `ky_district` VALUES ('653225', '策勒县', '653200');
INSERT INTO `ky_district` VALUES ('653226', '于田县', '653200');
INSERT INTO `ky_district` VALUES ('653227', '民丰县', '653200');
INSERT INTO `ky_district` VALUES ('654000', '伊犁哈萨克自治州', '650000');
INSERT INTO `ky_district` VALUES ('654002', '伊宁市', '654000');
INSERT INTO `ky_district` VALUES ('654003', '奎屯市', '654000');
INSERT INTO `ky_district` VALUES ('654004', '霍尔果斯市', '654000');
INSERT INTO `ky_district` VALUES ('654021', '伊宁县', '654000');
INSERT INTO `ky_district` VALUES ('654022', '察布查尔锡伯自治县', '654000');
INSERT INTO `ky_district` VALUES ('654023', '霍城县', '654000');
INSERT INTO `ky_district` VALUES ('654024', '巩留县', '654000');
INSERT INTO `ky_district` VALUES ('654025', '新源县', '654000');
INSERT INTO `ky_district` VALUES ('654026', '昭苏县', '654000');
INSERT INTO `ky_district` VALUES ('654027', '特克斯县', '654000');
INSERT INTO `ky_district` VALUES ('654028', '尼勒克县', '654000');
INSERT INTO `ky_district` VALUES ('654200', '塔城地区', '650000');
INSERT INTO `ky_district` VALUES ('654201', '塔城市', '654200');
INSERT INTO `ky_district` VALUES ('654202', '乌苏市', '654200');
INSERT INTO `ky_district` VALUES ('654221', '额敏县', '654200');
INSERT INTO `ky_district` VALUES ('654223', '沙湾县', '654200');
INSERT INTO `ky_district` VALUES ('654224', '托里县', '654200');
INSERT INTO `ky_district` VALUES ('654225', '裕民县', '654200');
INSERT INTO `ky_district` VALUES ('654226', '和布克赛尔蒙古自治县', '654200');
INSERT INTO `ky_district` VALUES ('654300', '阿勒泰地区', '654000');
INSERT INTO `ky_district` VALUES ('654301', '阿勒泰市', '654000');
INSERT INTO `ky_district` VALUES ('654321', '布尔津县', '654000');
INSERT INTO `ky_district` VALUES ('654322', '富蕴县', '654000');
INSERT INTO `ky_district` VALUES ('654323', '福海县', '654000');
INSERT INTO `ky_district` VALUES ('654324', '哈巴河县', '654000');
INSERT INTO `ky_district` VALUES ('654325', '青河县', '654000');
INSERT INTO `ky_district` VALUES ('654326', '吉木乃县', '654000');
INSERT INTO `ky_district` VALUES ('659000', '自治区直辖县级行政区划', '650000');
INSERT INTO `ky_district` VALUES ('659001', '石河子市', '659000');
INSERT INTO `ky_district` VALUES ('659002', '阿拉尔市', '659000');
INSERT INTO `ky_district` VALUES ('659003', '图木舒克市', '659000');
INSERT INTO `ky_district` VALUES ('659004', '五家渠市', '659000');
INSERT INTO `ky_district` VALUES ('659005', '北屯市', '659000');
INSERT INTO `ky_district` VALUES ('659006', '铁门关市', '659000');
INSERT INTO `ky_district` VALUES ('659007', '双河市', '659000');
INSERT INTO `ky_district` VALUES ('710000', '台湾省', '0');
INSERT INTO `ky_district` VALUES ('710100', '台北市', '710000');
INSERT INTO `ky_district` VALUES ('710101', '松山区', '710100');
INSERT INTO `ky_district` VALUES ('710102', '信义区', '710100');
INSERT INTO `ky_district` VALUES ('710103', '大安区', '710100');
INSERT INTO `ky_district` VALUES ('710104', '中山区', '710100');
INSERT INTO `ky_district` VALUES ('710105', '中正区', '710100');
INSERT INTO `ky_district` VALUES ('710106', '大同区', '710100');
INSERT INTO `ky_district` VALUES ('710107', '万华区', '710100');
INSERT INTO `ky_district` VALUES ('710108', '文山区', '710100');
INSERT INTO `ky_district` VALUES ('710109', '南港区', '710100');
INSERT INTO `ky_district` VALUES ('710110', '内湖区', '710100');
INSERT INTO `ky_district` VALUES ('710111', '士林区', '710100');
INSERT INTO `ky_district` VALUES ('710112', '北投区', '710100');
INSERT INTO `ky_district` VALUES ('710200', '高雄市', '710000');
INSERT INTO `ky_district` VALUES ('710201', '盐埕区', '710200');
INSERT INTO `ky_district` VALUES ('710202', '鼓山区', '710200');
INSERT INTO `ky_district` VALUES ('710203', '左营区', '710200');
INSERT INTO `ky_district` VALUES ('710204', '楠梓区', '710200');
INSERT INTO `ky_district` VALUES ('710205', '三民区', '710200');
INSERT INTO `ky_district` VALUES ('710206', '新兴区', '710200');
INSERT INTO `ky_district` VALUES ('710207', '前金区', '710200');
INSERT INTO `ky_district` VALUES ('710208', '苓雅区', '710200');
INSERT INTO `ky_district` VALUES ('710209', '前镇区', '710200');
INSERT INTO `ky_district` VALUES ('710210', '旗津区', '710200');
INSERT INTO `ky_district` VALUES ('710211', '小港区', '710200');
INSERT INTO `ky_district` VALUES ('710212', '凤山区', '710200');
INSERT INTO `ky_district` VALUES ('710213', '林园区', '710200');
INSERT INTO `ky_district` VALUES ('710214', '大寮区', '710200');
INSERT INTO `ky_district` VALUES ('710215', '大树区', '710200');
INSERT INTO `ky_district` VALUES ('710216', '大社区', '710200');
INSERT INTO `ky_district` VALUES ('710217', '仁武区', '710200');
INSERT INTO `ky_district` VALUES ('710218', '鸟松区', '710200');
INSERT INTO `ky_district` VALUES ('710219', '冈山区', '710200');
INSERT INTO `ky_district` VALUES ('710220', '桥头区', '710200');
INSERT INTO `ky_district` VALUES ('710221', '燕巢区', '710200');
INSERT INTO `ky_district` VALUES ('710222', '田寮区', '710200');
INSERT INTO `ky_district` VALUES ('710223', '阿莲区', '710200');
INSERT INTO `ky_district` VALUES ('710224', '路竹区', '710200');
INSERT INTO `ky_district` VALUES ('710225', '湖内区', '710200');
INSERT INTO `ky_district` VALUES ('710226', '茄萣区', '710200');
INSERT INTO `ky_district` VALUES ('710227', '永安区', '710200');
INSERT INTO `ky_district` VALUES ('710228', '弥陀区', '710200');
INSERT INTO `ky_district` VALUES ('710229', '梓官区', '710200');
INSERT INTO `ky_district` VALUES ('710230', '旗山区', '710200');
INSERT INTO `ky_district` VALUES ('710231', '美浓区', '710200');
INSERT INTO `ky_district` VALUES ('710232', '六龟区', '710200');
INSERT INTO `ky_district` VALUES ('710233', '甲仙区', '710200');
INSERT INTO `ky_district` VALUES ('710234', '杉林区', '710200');
INSERT INTO `ky_district` VALUES ('710235', '内门区', '710200');
INSERT INTO `ky_district` VALUES ('710236', '茂林区', '710200');
INSERT INTO `ky_district` VALUES ('710237', '桃源区', '710200');
INSERT INTO `ky_district` VALUES ('710238', '那玛夏区', '710200');
INSERT INTO `ky_district` VALUES ('710300', '基隆市', '710000');
INSERT INTO `ky_district` VALUES ('710301', '中正区', '710300');
INSERT INTO `ky_district` VALUES ('710302', '七堵区', '710300');
INSERT INTO `ky_district` VALUES ('710303', '暖暖区', '710300');
INSERT INTO `ky_district` VALUES ('710304', '仁爱区', '710300');
INSERT INTO `ky_district` VALUES ('710305', '中山区', '710300');
INSERT INTO `ky_district` VALUES ('710306', '安乐区', '710300');
INSERT INTO `ky_district` VALUES ('710307', '信义区', '710300');
INSERT INTO `ky_district` VALUES ('710400', '台中市', '710000');
INSERT INTO `ky_district` VALUES ('710401', '中区', '710400');
INSERT INTO `ky_district` VALUES ('710402', '东区', '710400');
INSERT INTO `ky_district` VALUES ('710403', '南区', '710400');
INSERT INTO `ky_district` VALUES ('710404', '西区', '710400');
INSERT INTO `ky_district` VALUES ('710405', '北区', '710400');
INSERT INTO `ky_district` VALUES ('710406', '西屯区', '710400');
INSERT INTO `ky_district` VALUES ('710407', '南屯区', '710400');
INSERT INTO `ky_district` VALUES ('710408', '北屯区', '710400');
INSERT INTO `ky_district` VALUES ('710409', '丰原区', '710400');
INSERT INTO `ky_district` VALUES ('710410', '东势区', '710400');
INSERT INTO `ky_district` VALUES ('710411', '大甲区', '710400');
INSERT INTO `ky_district` VALUES ('710412', '清水区', '710400');
INSERT INTO `ky_district` VALUES ('710413', '沙鹿区', '710400');
INSERT INTO `ky_district` VALUES ('710414', '梧栖区', '710400');
INSERT INTO `ky_district` VALUES ('710415', '后里区', '710400');
INSERT INTO `ky_district` VALUES ('710416', '神冈区', '710400');
INSERT INTO `ky_district` VALUES ('710417', '潭子区', '710400');
INSERT INTO `ky_district` VALUES ('710418', '大雅区', '710400');
INSERT INTO `ky_district` VALUES ('710419', '新社区', '710400');
INSERT INTO `ky_district` VALUES ('710420', '石冈区', '710400');
INSERT INTO `ky_district` VALUES ('710421', '外埔区', '710400');
INSERT INTO `ky_district` VALUES ('710422', '大安区', '710400');
INSERT INTO `ky_district` VALUES ('710423', '乌日区', '710400');
INSERT INTO `ky_district` VALUES ('710424', '大肚区', '710400');
INSERT INTO `ky_district` VALUES ('710425', '龙井区', '710400');
INSERT INTO `ky_district` VALUES ('710426', '雾峰区', '710400');
INSERT INTO `ky_district` VALUES ('710427', '太平区', '710400');
INSERT INTO `ky_district` VALUES ('710428', '大里区', '710400');
INSERT INTO `ky_district` VALUES ('710429', '和平区', '710400');
INSERT INTO `ky_district` VALUES ('710500', '台南市', '710000');
INSERT INTO `ky_district` VALUES ('710501', '东区', '710500');
INSERT INTO `ky_district` VALUES ('710502', '南区', '710500');
INSERT INTO `ky_district` VALUES ('710504', '北区', '710500');
INSERT INTO `ky_district` VALUES ('710506', '安南区', '710500');
INSERT INTO `ky_district` VALUES ('710507', '安平区', '710500');
INSERT INTO `ky_district` VALUES ('710508', '中西区', '710500');
INSERT INTO `ky_district` VALUES ('710509', '新营区', '710500');
INSERT INTO `ky_district` VALUES ('710510', '盐水区', '710500');
INSERT INTO `ky_district` VALUES ('710511', '白河区', '710500');
INSERT INTO `ky_district` VALUES ('710512', '柳营区', '710500');
INSERT INTO `ky_district` VALUES ('710513', '后壁区', '710500');
INSERT INTO `ky_district` VALUES ('710514', '东山区', '710500');
INSERT INTO `ky_district` VALUES ('710515', '麻豆区', '710500');
INSERT INTO `ky_district` VALUES ('710516', '下营区', '710500');
INSERT INTO `ky_district` VALUES ('710517', '六甲区', '710500');
INSERT INTO `ky_district` VALUES ('710518', '官田区', '710500');
INSERT INTO `ky_district` VALUES ('710519', '大内区', '710500');
INSERT INTO `ky_district` VALUES ('710520', '佳里区', '710500');
INSERT INTO `ky_district` VALUES ('710521', '学甲区', '710500');
INSERT INTO `ky_district` VALUES ('710522', '西港区', '710500');
INSERT INTO `ky_district` VALUES ('710523', '七股区', '710500');
INSERT INTO `ky_district` VALUES ('710524', '将军区', '710500');
INSERT INTO `ky_district` VALUES ('710525', '北门区', '710500');
INSERT INTO `ky_district` VALUES ('710526', '新化区', '710500');
INSERT INTO `ky_district` VALUES ('710527', '善化区', '710500');
INSERT INTO `ky_district` VALUES ('710528', '新市区', '710500');
INSERT INTO `ky_district` VALUES ('710529', '安定区', '710500');
INSERT INTO `ky_district` VALUES ('710530', '山上区', '710500');
INSERT INTO `ky_district` VALUES ('710531', '玉井区', '710500');
INSERT INTO `ky_district` VALUES ('710532', '楠西区', '710500');
INSERT INTO `ky_district` VALUES ('710533', '南化区', '710500');
INSERT INTO `ky_district` VALUES ('710534', '左镇区', '710500');
INSERT INTO `ky_district` VALUES ('710535', '仁德区', '710500');
INSERT INTO `ky_district` VALUES ('710536', '归仁区', '710500');
INSERT INTO `ky_district` VALUES ('710537', '关庙区', '710500');
INSERT INTO `ky_district` VALUES ('710538', '龙崎区', '710500');
INSERT INTO `ky_district` VALUES ('710539', '永康区', '710500');
INSERT INTO `ky_district` VALUES ('710600', '新竹市', '710000');
INSERT INTO `ky_district` VALUES ('710601', '东区', '710600');
INSERT INTO `ky_district` VALUES ('710602', '北区', '710600');
INSERT INTO `ky_district` VALUES ('710603', '香山区', '710600');
INSERT INTO `ky_district` VALUES ('710700', '嘉义市', '710000');
INSERT INTO `ky_district` VALUES ('710701', '东区', '710700');
INSERT INTO `ky_district` VALUES ('710702', '西区', '710700');
INSERT INTO `ky_district` VALUES ('710800', '新北市', '710000');
INSERT INTO `ky_district` VALUES ('710801', '板桥区', '710800');
INSERT INTO `ky_district` VALUES ('710802', '三重区', '710800');
INSERT INTO `ky_district` VALUES ('710803', '中和区', '710800');
INSERT INTO `ky_district` VALUES ('710804', '永和区', '710800');
INSERT INTO `ky_district` VALUES ('710805', '新庄区', '710800');
INSERT INTO `ky_district` VALUES ('710806', '新店区', '710800');
INSERT INTO `ky_district` VALUES ('710807', '树林区', '710800');
INSERT INTO `ky_district` VALUES ('710808', '莺歌区', '710800');
INSERT INTO `ky_district` VALUES ('710809', '三峡区', '710800');
INSERT INTO `ky_district` VALUES ('710810', '淡水区', '710800');
INSERT INTO `ky_district` VALUES ('710811', '汐止区', '710800');
INSERT INTO `ky_district` VALUES ('710812', '瑞芳区', '710800');
INSERT INTO `ky_district` VALUES ('710813', '土城区', '710800');
INSERT INTO `ky_district` VALUES ('710814', '芦洲区', '710800');
INSERT INTO `ky_district` VALUES ('710815', '五股区', '710800');
INSERT INTO `ky_district` VALUES ('710816', '泰山区', '710800');
INSERT INTO `ky_district` VALUES ('710817', '林口区', '710800');
INSERT INTO `ky_district` VALUES ('710818', '深坑区', '710800');
INSERT INTO `ky_district` VALUES ('710819', '石碇区', '710800');
INSERT INTO `ky_district` VALUES ('710820', '坪林区', '710800');
INSERT INTO `ky_district` VALUES ('710821', '三芝区', '710800');
INSERT INTO `ky_district` VALUES ('710822', '石门区', '710800');
INSERT INTO `ky_district` VALUES ('710823', '八里区', '710800');
INSERT INTO `ky_district` VALUES ('710824', '平溪区', '710800');
INSERT INTO `ky_district` VALUES ('710825', '双溪区', '710800');
INSERT INTO `ky_district` VALUES ('710826', '贡寮区', '710800');
INSERT INTO `ky_district` VALUES ('710827', '金山区', '710800');
INSERT INTO `ky_district` VALUES ('710828', '万里区', '710800');
INSERT INTO `ky_district` VALUES ('710829', '乌来区', '710800');
INSERT INTO `ky_district` VALUES ('712200', '宜兰县', '710000');
INSERT INTO `ky_district` VALUES ('712201', '宜兰市', '712200');
INSERT INTO `ky_district` VALUES ('712221', '罗东镇', '712200');
INSERT INTO `ky_district` VALUES ('712222', '苏澳镇', '712200');
INSERT INTO `ky_district` VALUES ('712223', '头城镇', '712200');
INSERT INTO `ky_district` VALUES ('712224', '礁溪乡', '712200');
INSERT INTO `ky_district` VALUES ('712225', '壮围乡', '712200');
INSERT INTO `ky_district` VALUES ('712226', '员山乡', '712200');
INSERT INTO `ky_district` VALUES ('712227', '冬山乡', '712200');
INSERT INTO `ky_district` VALUES ('712228', '五结乡', '712200');
INSERT INTO `ky_district` VALUES ('712229', '三星乡', '712200');
INSERT INTO `ky_district` VALUES ('712230', '大同乡', '712200');
INSERT INTO `ky_district` VALUES ('712231', '南澳乡', '712200');
INSERT INTO `ky_district` VALUES ('712300', '桃园县', '710000');
INSERT INTO `ky_district` VALUES ('712301', '桃园市', '712300');
INSERT INTO `ky_district` VALUES ('712302', '中坜市', '712300');
INSERT INTO `ky_district` VALUES ('712303', '平镇市', '712300');
INSERT INTO `ky_district` VALUES ('712304', '八德市', '712300');
INSERT INTO `ky_district` VALUES ('712305', '杨梅市', '712300');
INSERT INTO `ky_district` VALUES ('712321', '大溪镇', '712300');
INSERT INTO `ky_district` VALUES ('712323', '芦竹乡', '712300');
INSERT INTO `ky_district` VALUES ('712324', '大园乡', '712300');
INSERT INTO `ky_district` VALUES ('712325', '龟山乡', '712300');
INSERT INTO `ky_district` VALUES ('712327', '龙潭乡', '712300');
INSERT INTO `ky_district` VALUES ('712329', '新屋乡', '712300');
INSERT INTO `ky_district` VALUES ('712330', '观音乡', '712300');
INSERT INTO `ky_district` VALUES ('712331', '复兴乡', '712300');
INSERT INTO `ky_district` VALUES ('712400', '新竹县', '710000');
INSERT INTO `ky_district` VALUES ('712401', '竹北市', '712400');
INSERT INTO `ky_district` VALUES ('712421', '竹东镇', '712400');
INSERT INTO `ky_district` VALUES ('712422', '新埔镇', '712400');
INSERT INTO `ky_district` VALUES ('712423', '关西镇', '712400');
INSERT INTO `ky_district` VALUES ('712424', '湖口乡', '712400');
INSERT INTO `ky_district` VALUES ('712425', '新丰乡', '712400');
INSERT INTO `ky_district` VALUES ('712426', '芎林乡', '712400');
INSERT INTO `ky_district` VALUES ('712427', '橫山乡', '712400');
INSERT INTO `ky_district` VALUES ('712428', '北埔乡', '712400');
INSERT INTO `ky_district` VALUES ('712429', '宝山乡', '712400');
INSERT INTO `ky_district` VALUES ('712430', '峨眉乡', '712400');
INSERT INTO `ky_district` VALUES ('712431', '尖石乡', '712400');
INSERT INTO `ky_district` VALUES ('712432', '五峰乡', '712400');
INSERT INTO `ky_district` VALUES ('712500', '苗栗县', '710000');
INSERT INTO `ky_district` VALUES ('712501', '苗栗市', '712500');
INSERT INTO `ky_district` VALUES ('712521', '苑里镇', '712500');
INSERT INTO `ky_district` VALUES ('712522', '通霄镇', '712500');
INSERT INTO `ky_district` VALUES ('712523', '竹南镇', '712500');
INSERT INTO `ky_district` VALUES ('712524', '头份镇', '712500');
INSERT INTO `ky_district` VALUES ('712525', '后龙镇', '712500');
INSERT INTO `ky_district` VALUES ('712526', '卓兰镇', '712500');
INSERT INTO `ky_district` VALUES ('712527', '大湖乡', '712500');
INSERT INTO `ky_district` VALUES ('712528', '公馆乡', '712500');
INSERT INTO `ky_district` VALUES ('712529', '铜锣乡', '712500');
INSERT INTO `ky_district` VALUES ('712530', '南庄乡', '712500');
INSERT INTO `ky_district` VALUES ('712531', '头屋乡', '712500');
INSERT INTO `ky_district` VALUES ('712532', '三义乡', '712500');
INSERT INTO `ky_district` VALUES ('712533', '西湖乡', '712500');
INSERT INTO `ky_district` VALUES ('712534', '造桥乡', '712500');
INSERT INTO `ky_district` VALUES ('712535', '三湾乡', '712500');
INSERT INTO `ky_district` VALUES ('712536', '狮潭乡', '712500');
INSERT INTO `ky_district` VALUES ('712537', '泰安乡', '712500');
INSERT INTO `ky_district` VALUES ('712700', '彰化县', '710000');
INSERT INTO `ky_district` VALUES ('712701', '彰化市', '712700');
INSERT INTO `ky_district` VALUES ('712721', '鹿港镇', '712700');
INSERT INTO `ky_district` VALUES ('712722', '和美镇', '712700');
INSERT INTO `ky_district` VALUES ('712723', '线西乡', '712700');
INSERT INTO `ky_district` VALUES ('712724', '伸港乡', '712700');
INSERT INTO `ky_district` VALUES ('712725', '福兴乡', '712700');
INSERT INTO `ky_district` VALUES ('712726', '秀水乡', '712700');
INSERT INTO `ky_district` VALUES ('712727', '花坛乡', '712700');
INSERT INTO `ky_district` VALUES ('712728', '芬园乡', '712700');
INSERT INTO `ky_district` VALUES ('712729', '员林镇', '712700');
INSERT INTO `ky_district` VALUES ('712730', '溪湖镇', '712700');
INSERT INTO `ky_district` VALUES ('712731', '田中镇', '712700');
INSERT INTO `ky_district` VALUES ('712732', '大村乡', '712700');
INSERT INTO `ky_district` VALUES ('712733', '埔盐乡', '712700');
INSERT INTO `ky_district` VALUES ('712734', '埔心乡', '712700');
INSERT INTO `ky_district` VALUES ('712735', '永靖乡', '712700');
INSERT INTO `ky_district` VALUES ('712736', '社头乡', '712700');
INSERT INTO `ky_district` VALUES ('712737', '二水乡', '712700');
INSERT INTO `ky_district` VALUES ('712738', '北斗镇', '712700');
INSERT INTO `ky_district` VALUES ('712739', '二林镇', '712700');
INSERT INTO `ky_district` VALUES ('712740', '田尾乡', '712700');
INSERT INTO `ky_district` VALUES ('712741', '埤头乡', '712700');
INSERT INTO `ky_district` VALUES ('712742', '芳苑乡', '712700');
INSERT INTO `ky_district` VALUES ('712743', '大城乡', '712700');
INSERT INTO `ky_district` VALUES ('712744', '竹塘乡', '712700');
INSERT INTO `ky_district` VALUES ('712745', '溪州乡', '712700');
INSERT INTO `ky_district` VALUES ('712800', '南投县', '710000');
INSERT INTO `ky_district` VALUES ('712801', '南投市', '712800');
INSERT INTO `ky_district` VALUES ('712821', '埔里镇', '712800');
INSERT INTO `ky_district` VALUES ('712822', '草屯镇', '712800');
INSERT INTO `ky_district` VALUES ('712823', '竹山镇', '712800');
INSERT INTO `ky_district` VALUES ('712824', '集集镇', '712800');
INSERT INTO `ky_district` VALUES ('712825', '名间乡', '712800');
INSERT INTO `ky_district` VALUES ('712826', '鹿谷乡', '712800');
INSERT INTO `ky_district` VALUES ('712827', '中寮乡', '712800');
INSERT INTO `ky_district` VALUES ('712828', '鱼池乡', '712800');
INSERT INTO `ky_district` VALUES ('712829', '国姓乡', '712800');
INSERT INTO `ky_district` VALUES ('712830', '水里乡', '712800');
INSERT INTO `ky_district` VALUES ('712831', '信义乡', '712800');
INSERT INTO `ky_district` VALUES ('712832', '仁爱乡', '712800');
INSERT INTO `ky_district` VALUES ('712900', '云林县', '710000');
INSERT INTO `ky_district` VALUES ('712901', '斗六市', '712900');
INSERT INTO `ky_district` VALUES ('712921', '斗南镇', '712900');
INSERT INTO `ky_district` VALUES ('712922', '虎尾镇', '712900');
INSERT INTO `ky_district` VALUES ('712923', '西螺镇', '712900');
INSERT INTO `ky_district` VALUES ('712924', '土库镇', '712900');
INSERT INTO `ky_district` VALUES ('712925', '北港镇', '712900');
INSERT INTO `ky_district` VALUES ('712926', '古坑乡', '712900');
INSERT INTO `ky_district` VALUES ('712927', '大埤乡', '712900');
INSERT INTO `ky_district` VALUES ('712928', '莿桐乡', '712900');
INSERT INTO `ky_district` VALUES ('712929', '林内乡', '712900');
INSERT INTO `ky_district` VALUES ('712930', '二仑乡', '712900');
INSERT INTO `ky_district` VALUES ('712931', '仑背乡', '712900');
INSERT INTO `ky_district` VALUES ('712932', '麦寮乡', '712900');
INSERT INTO `ky_district` VALUES ('712933', '东势乡', '712900');
INSERT INTO `ky_district` VALUES ('712934', '褒忠乡', '712900');
INSERT INTO `ky_district` VALUES ('712935', '台西乡', '712900');
INSERT INTO `ky_district` VALUES ('712936', '元长乡', '712900');
INSERT INTO `ky_district` VALUES ('712937', '四湖乡', '712900');
INSERT INTO `ky_district` VALUES ('712938', '口湖乡', '712900');
INSERT INTO `ky_district` VALUES ('712939', '水林乡', '712900');
INSERT INTO `ky_district` VALUES ('713000', '嘉义县', '710000');
INSERT INTO `ky_district` VALUES ('713001', '太保市', '713000');
INSERT INTO `ky_district` VALUES ('713002', '朴子市', '713000');
INSERT INTO `ky_district` VALUES ('713023', '布袋镇', '713000');
INSERT INTO `ky_district` VALUES ('713024', '大林镇', '713000');
INSERT INTO `ky_district` VALUES ('713025', '民雄乡', '713000');
INSERT INTO `ky_district` VALUES ('713026', '溪口乡', '713000');
INSERT INTO `ky_district` VALUES ('713027', '新港乡', '713000');
INSERT INTO `ky_district` VALUES ('713028', '六脚乡', '713000');
INSERT INTO `ky_district` VALUES ('713029', '东石乡', '713000');
INSERT INTO `ky_district` VALUES ('713030', '义竹乡', '713000');
INSERT INTO `ky_district` VALUES ('713031', '鹿草乡', '713000');
INSERT INTO `ky_district` VALUES ('713032', '水上乡', '713000');
INSERT INTO `ky_district` VALUES ('713033', '中埔乡', '713000');
INSERT INTO `ky_district` VALUES ('713034', '竹崎乡', '713000');
INSERT INTO `ky_district` VALUES ('713035', '梅山乡', '713000');
INSERT INTO `ky_district` VALUES ('713036', '番路乡', '713000');
INSERT INTO `ky_district` VALUES ('713037', '大埔乡', '713000');
INSERT INTO `ky_district` VALUES ('713038', '阿里山乡', '713000');
INSERT INTO `ky_district` VALUES ('713300', '屏东县', '710000');
INSERT INTO `ky_district` VALUES ('713301', '屏东市', '713300');
INSERT INTO `ky_district` VALUES ('713321', '潮州镇', '713300');
INSERT INTO `ky_district` VALUES ('713322', '东港镇', '713300');
INSERT INTO `ky_district` VALUES ('713323', '恒春镇', '713300');
INSERT INTO `ky_district` VALUES ('713324', '万丹乡', '713300');
INSERT INTO `ky_district` VALUES ('713325', '长治乡', '713300');
INSERT INTO `ky_district` VALUES ('713326', '麟洛乡', '713300');
INSERT INTO `ky_district` VALUES ('713327', '九如乡', '713300');
INSERT INTO `ky_district` VALUES ('713328', '里港乡', '713300');
INSERT INTO `ky_district` VALUES ('713329', '盐埔乡', '713300');
INSERT INTO `ky_district` VALUES ('713330', '高树乡', '713300');
INSERT INTO `ky_district` VALUES ('713331', '万峦乡', '713300');
INSERT INTO `ky_district` VALUES ('713332', '内埔乡', '713300');
INSERT INTO `ky_district` VALUES ('713333', '竹田乡', '713300');
INSERT INTO `ky_district` VALUES ('713334', '新埤乡', '713300');
INSERT INTO `ky_district` VALUES ('713335', '枋寮乡', '713300');
INSERT INTO `ky_district` VALUES ('713336', '新园乡', '713300');
INSERT INTO `ky_district` VALUES ('713337', '崁顶乡', '713300');
INSERT INTO `ky_district` VALUES ('713338', '林边乡', '713300');
INSERT INTO `ky_district` VALUES ('713339', '南州乡', '713300');
INSERT INTO `ky_district` VALUES ('713340', '佳冬乡', '713300');
INSERT INTO `ky_district` VALUES ('713341', '琉球乡', '713300');
INSERT INTO `ky_district` VALUES ('713342', '车城乡', '713300');
INSERT INTO `ky_district` VALUES ('713343', '满州乡', '713300');
INSERT INTO `ky_district` VALUES ('713344', '枋山乡', '713300');
INSERT INTO `ky_district` VALUES ('713345', '三地门乡', '713300');
INSERT INTO `ky_district` VALUES ('713346', '雾台乡', '713300');
INSERT INTO `ky_district` VALUES ('713347', '玛家乡', '713300');
INSERT INTO `ky_district` VALUES ('713348', '泰武乡', '713300');
INSERT INTO `ky_district` VALUES ('713349', '来义乡', '713300');
INSERT INTO `ky_district` VALUES ('713350', '春日乡', '713300');
INSERT INTO `ky_district` VALUES ('713351', '狮子乡', '713300');
INSERT INTO `ky_district` VALUES ('713352', '牡丹乡', '713300');
INSERT INTO `ky_district` VALUES ('713400', '台东县', '710000');
INSERT INTO `ky_district` VALUES ('713401', '台东市', '713400');
INSERT INTO `ky_district` VALUES ('713421', '成功镇', '713400');
INSERT INTO `ky_district` VALUES ('713422', '关山镇', '713400');
INSERT INTO `ky_district` VALUES ('713423', '卑南乡', '713400');
INSERT INTO `ky_district` VALUES ('713424', '鹿野乡', '713400');
INSERT INTO `ky_district` VALUES ('713425', '池上乡', '713400');
INSERT INTO `ky_district` VALUES ('713426', '东河乡', '713400');
INSERT INTO `ky_district` VALUES ('713427', '长滨乡', '713400');
INSERT INTO `ky_district` VALUES ('713428', '太麻里乡', '713400');
INSERT INTO `ky_district` VALUES ('713429', '大武乡', '713400');
INSERT INTO `ky_district` VALUES ('713430', '绿岛乡', '713400');
INSERT INTO `ky_district` VALUES ('713431', '海端乡', '713400');
INSERT INTO `ky_district` VALUES ('713432', '延平乡', '713400');
INSERT INTO `ky_district` VALUES ('713433', '金峰乡', '713400');
INSERT INTO `ky_district` VALUES ('713434', '达仁乡', '713400');
INSERT INTO `ky_district` VALUES ('713435', '兰屿乡', '713400');
INSERT INTO `ky_district` VALUES ('713500', '花莲县', '710000');
INSERT INTO `ky_district` VALUES ('713501', '花莲市', '713500');
INSERT INTO `ky_district` VALUES ('713521', '凤林镇', '713500');
INSERT INTO `ky_district` VALUES ('713522', '玉里镇', '713500');
INSERT INTO `ky_district` VALUES ('713523', '新城乡', '713500');
INSERT INTO `ky_district` VALUES ('713524', '吉安乡', '713500');
INSERT INTO `ky_district` VALUES ('713525', '寿丰乡', '713500');
INSERT INTO `ky_district` VALUES ('713526', '光复乡', '713500');
INSERT INTO `ky_district` VALUES ('713527', '丰滨乡', '713500');
INSERT INTO `ky_district` VALUES ('713528', '瑞穗乡', '713500');
INSERT INTO `ky_district` VALUES ('713529', '富里乡', '713500');
INSERT INTO `ky_district` VALUES ('713530', '秀林乡', '713500');
INSERT INTO `ky_district` VALUES ('713531', '万荣乡', '713500');
INSERT INTO `ky_district` VALUES ('713532', '卓溪乡', '713500');
INSERT INTO `ky_district` VALUES ('713600', '澎湖县', '710000');
INSERT INTO `ky_district` VALUES ('713601', '马公市', '713600');
INSERT INTO `ky_district` VALUES ('713621', '湖西乡', '713600');
INSERT INTO `ky_district` VALUES ('713622', '白沙乡', '713600');
INSERT INTO `ky_district` VALUES ('713623', '西屿乡', '713600');
INSERT INTO `ky_district` VALUES ('713624', '望安乡', '713600');
INSERT INTO `ky_district` VALUES ('713625', '七美乡', '713600');
INSERT INTO `ky_district` VALUES ('810000', '香港特别行政区', '0');
INSERT INTO `ky_district` VALUES ('810100', '香港岛', '810000');
INSERT INTO `ky_district` VALUES ('810101', '中西区', '810100');
INSERT INTO `ky_district` VALUES ('810102', '湾仔区', '810100');
INSERT INTO `ky_district` VALUES ('810103', '东区', '810100');
INSERT INTO `ky_district` VALUES ('810104', '南区', '810100');
INSERT INTO `ky_district` VALUES ('810200', '九龙', '810000');
INSERT INTO `ky_district` VALUES ('810201', '油尖旺区', '810200');
INSERT INTO `ky_district` VALUES ('810202', '深水埗区', '810200');
INSERT INTO `ky_district` VALUES ('810203', '九龙城区', '810200');
INSERT INTO `ky_district` VALUES ('810204', '黄大仙区', '810200');
INSERT INTO `ky_district` VALUES ('810205', '观塘区', '810200');
INSERT INTO `ky_district` VALUES ('810300', '新界', '810000');
INSERT INTO `ky_district` VALUES ('810301', '荃湾区', '810300');
INSERT INTO `ky_district` VALUES ('810302', '屯门区', '810300');
INSERT INTO `ky_district` VALUES ('810303', '元朗区', '810300');
INSERT INTO `ky_district` VALUES ('810304', '北区', '810300');
INSERT INTO `ky_district` VALUES ('810305', '大埔区', '810300');
INSERT INTO `ky_district` VALUES ('810306', '西贡区', '810300');
INSERT INTO `ky_district` VALUES ('810307', '沙田区', '810300');
INSERT INTO `ky_district` VALUES ('810308', '葵青区', '810300');
INSERT INTO `ky_district` VALUES ('810309', '离岛区', '810300');
INSERT INTO `ky_district` VALUES ('820000', '澳门特别行政区', '0');
INSERT INTO `ky_district` VALUES ('820100', '澳门半岛', '820000');
INSERT INTO `ky_district` VALUES ('820101', '花地玛堂区', '820100');
INSERT INTO `ky_district` VALUES ('820102', '圣安多尼堂区', '820100');
INSERT INTO `ky_district` VALUES ('820103', '大堂区', '820100');
INSERT INTO `ky_district` VALUES ('820104', '望德堂区', '820100');
INSERT INTO `ky_district` VALUES ('820105', '风顺堂区', '820100');
INSERT INTO `ky_district` VALUES ('820200', '氹仔岛', '820000');
INSERT INTO `ky_district` VALUES ('820201', '嘉模堂区', '820200');
INSERT INTO `ky_district` VALUES ('820300', '路环岛', '820000');
INSERT INTO `ky_district` VALUES ('820301', '圣方济各堂区', '820300');
INSERT INTO `ky_district` VALUES ('2102111', '高新园区', '210200');
INSERT INTO `ky_district` VALUES ('350902500', '东侨开发区', '350900');
INSERT INTO `ky_district` VALUES ('441900003', '东城街道', '441900');
INSERT INTO `ky_district` VALUES ('441900004', '南城街道', '441900');
INSERT INTO `ky_district` VALUES ('441900005', '万江街道', '441900');
INSERT INTO `ky_district` VALUES ('441900006', '莞城街道', '441900');
INSERT INTO `ky_district` VALUES ('441900101', '石碣镇', '441900');
INSERT INTO `ky_district` VALUES ('441900102', '石龙镇', '441900');
INSERT INTO `ky_district` VALUES ('441900103', '茶山镇', '441900');
INSERT INTO `ky_district` VALUES ('441900104', '石排镇', '441900');
INSERT INTO `ky_district` VALUES ('441900105', '企石镇', '441900');
INSERT INTO `ky_district` VALUES ('441900106', '横沥镇', '441900');
INSERT INTO `ky_district` VALUES ('441900107', '桥头镇', '441900');
INSERT INTO `ky_district` VALUES ('441900108', '谢岗镇', '441900');
INSERT INTO `ky_district` VALUES ('441900109', '东坑镇', '441900');
INSERT INTO `ky_district` VALUES ('441900110', '常平镇', '441900');
INSERT INTO `ky_district` VALUES ('441900111', '寮步镇', '441900');
INSERT INTO `ky_district` VALUES ('441900112', '樟木头镇', '441900');
INSERT INTO `ky_district` VALUES ('441900113', '大朗镇', '441900');
INSERT INTO `ky_district` VALUES ('441900114', '黄江镇', '441900');
INSERT INTO `ky_district` VALUES ('441900115', '清溪镇', '441900');
INSERT INTO `ky_district` VALUES ('441900116', '塘厦镇', '441900');
INSERT INTO `ky_district` VALUES ('441900117', '凤岗镇', '441900');
INSERT INTO `ky_district` VALUES ('441900118', '大岭山镇', '441900');
INSERT INTO `ky_district` VALUES ('441900119', '长安镇', '441900');
INSERT INTO `ky_district` VALUES ('441900121', '虎门镇', '441900');
INSERT INTO `ky_district` VALUES ('441900122', '厚街镇', '441900');
INSERT INTO `ky_district` VALUES ('441900123', '沙田镇', '441900');
INSERT INTO `ky_district` VALUES ('441900124', '道滘镇', '441900');
INSERT INTO `ky_district` VALUES ('441900125', '洪梅镇', '441900');
INSERT INTO `ky_district` VALUES ('441900126', '麻涌镇', '441900');
INSERT INTO `ky_district` VALUES ('441900127', '望牛墩镇', '441900');
INSERT INTO `ky_district` VALUES ('441900128', '中堂镇', '441900');
INSERT INTO `ky_district` VALUES ('441900129', '高埗镇', '441900');
INSERT INTO `ky_district` VALUES ('441900401', '松山湖管委会', '441900');
INSERT INTO `ky_district` VALUES ('441900402', '东莞港', '441900');
INSERT INTO `ky_district` VALUES ('441900403', '东莞生态园', '441900');
INSERT INTO `ky_district` VALUES ('442000001', '石岐区街道', '442000');
INSERT INTO `ky_district` VALUES ('442000002', '东区街道', '442000');
INSERT INTO `ky_district` VALUES ('442000003', '火炬开发区街道', '442000');
INSERT INTO `ky_district` VALUES ('442000004', '西区街道', '442000');
INSERT INTO `ky_district` VALUES ('442000005', '南区街道', '442000');
INSERT INTO `ky_district` VALUES ('442000006', '五桂山街道', '442000');
INSERT INTO `ky_district` VALUES ('442000100', '小榄镇', '442000');
INSERT INTO `ky_district` VALUES ('442000101', '黄圃镇', '442000');
INSERT INTO `ky_district` VALUES ('442000102', '民众镇', '442000');
INSERT INTO `ky_district` VALUES ('442000103', '东凤镇', '442000');
INSERT INTO `ky_district` VALUES ('442000104', '东升镇', '442000');
INSERT INTO `ky_district` VALUES ('442000105', '古镇镇', '442000');
INSERT INTO `ky_district` VALUES ('442000106', '沙溪镇', '442000');
INSERT INTO `ky_district` VALUES ('442000107', '坦洲镇', '442000');
INSERT INTO `ky_district` VALUES ('442000108', '港口镇', '442000');
INSERT INTO `ky_district` VALUES ('442000109', '三角镇', '442000');
INSERT INTO `ky_district` VALUES ('442000110', '横栏镇', '442000');
INSERT INTO `ky_district` VALUES ('442000111', '南头镇', '442000');
INSERT INTO `ky_district` VALUES ('442000112', '阜沙镇', '442000');
INSERT INTO `ky_district` VALUES ('442000113', '南朗镇', '442000');
INSERT INTO `ky_district` VALUES ('442000114', '三乡镇', '442000');
INSERT INTO `ky_district` VALUES ('442000115', '板芙镇', '442000');
INSERT INTO `ky_district` VALUES ('442000116', '大涌镇', '442000');
INSERT INTO `ky_district` VALUES ('442000117', '神湾镇', '442000');

-- ----------------------------
-- Table structure for ky_friend_link
-- ----------------------------
DROP TABLE IF EXISTS `ky_friend_link`;
CREATE TABLE `ky_friend_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '链接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '数字越小越靠前',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='友链';

-- ----------------------------
-- Records of ky_friend_link
-- ----------------------------
INSERT INTO `ky_friend_link` VALUES ('1', '酷云科技', 'http://www.kuryun.com/', '0', '1596273399', '1596273399', '1');
INSERT INTO `ky_friend_link` VALUES ('2', 'ThinkPHP', 'https://www.thinkphp.cn/', '1', '1596273469', '1596273548', '1');

-- ----------------------------
-- Table structure for ky_gxtea_activity
-- ----------------------------
DROP TABLE IF EXISTS `ky_gxtea_activity`;
CREATE TABLE `ky_gxtea_activity` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `mini_id` int(10) NOT NULL DEFAULT '0' COMMENT '小程序ID',
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT ' 活动标识',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '活动主题',
  `begin_time` int(10) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(10) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `join_num` int(10) NOT NULL DEFAULT '0' COMMENT '报名人数',
  `view_num` int(20) NOT NULL DEFAULT '0' COMMENT '查看人数',
  `share_num` int(20) unsigned NOT NULL DEFAULT '0' COMMENT '分享人数',
  `create_time` int(10) NOT NULL,
  `update_time` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态1上架  2下架  0禁用',
  `extend_info` longtext CHARACTER SET utf8mb4 COMMENT '扩展信息',
  `qrcode` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '活动二维码',
  `cover` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '活动封面图',
  `coupon_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联的优惠券',
  `rule` text COLLATE utf8mb4_unicode_ci COMMENT '活动规则',
  PRIMARY KEY (`id`),
  KEY `mini_id` (`mini_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT COMMENT='活动表';

-- ----------------------------
-- Records of ky_gxtea_activity
-- ----------------------------
INSERT INTO `ky_gxtea_activity` VALUES ('1', '11', 'invite', '邀请好友免费喝茶', '1597075200', '1598716800', '2', '268', '0', '1597114876', '1597201790', '1', null, '', 'http://devhhb.images.huihuiba.net/1-5f2232d6c5fac.png', '1', '<p>活动规则啊</p><p><br/></p>');

-- ----------------------------
-- Table structure for ky_gxtea_activity_signer
-- ----------------------------
DROP TABLE IF EXISTS `ky_gxtea_activity_signer`;
CREATE TABLE `ky_gxtea_activity_signer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mini_id` int(10) unsigned NOT NULL DEFAULT '0',
  `activity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `openid` varchar(64) NOT NULL DEFAULT '' COMMENT 'openid',
  `nickname` varchar(60) NOT NULL DEFAULT '' COMMENT '昵称',
  `headimgurl` varchar(200) NOT NULL DEFAULT '',
  `mobile` varchar(15) NOT NULL DEFAULT '',
  `gain` varchar(20) NOT NULL DEFAULT '0' COMMENT '助力数、战绩等，不同活动可能有不同含义',
  `complete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' 完成时间',
  `mark` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否核销',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '报名时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mini_id_2` (`mini_id`,`activity_id`,`openid`),
  KEY `mini_id` (`mini_id`,`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='报名表';

-- ----------------------------
-- Records of ky_gxtea_activity_signer
-- ----------------------------
INSERT INTO `ky_gxtea_activity_signer` VALUES ('5', '11', '1', '6', 'oUcHy5F7WcJp14Ivfd3wJrOKH6m4', '丁昌乾-Jason', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJJOlibibPFEWO9qcXhCJltwPHsOgzAzS0ibtjpmbefwdibupgy4ibF2tOeKOCu18vLrzOUvYibXujosiaeg/132', '13275008183', '1', '0', '0', '1', '1597316811');

-- ----------------------------
-- Table structure for ky_gxtea_activity_support_1
-- ----------------------------
DROP TABLE IF EXISTS `ky_gxtea_activity_support_1`;
CREATE TABLE `ky_gxtea_activity_support_1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mini_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序ID，分表键',
  `activity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `signer_id` int(10) NOT NULL,
  `nickname` varchar(60) NOT NULL DEFAULT '' COMMENT '昵称',
  `openid` varchar(64) NOT NULL DEFAULT '' COMMENT 'openid',
  `headimgurl` varchar(200) NOT NULL DEFAULT '',
  `mobile` varchar(15) NOT NULL DEFAULT '',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '报名时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mini_id_2` (`mini_id`,`activity_id`,`openid`,`signer_id`) USING BTREE,
  KEY `mini_id` (`mini_id`,`activity_id`,`signer_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='报名表';

-- ----------------------------
-- Records of ky_gxtea_activity_support_1
-- ----------------------------

-- ----------------------------
-- Table structure for ky_gxtea_activity_support_2
-- ----------------------------
DROP TABLE IF EXISTS `ky_gxtea_activity_support_2`;
CREATE TABLE `ky_gxtea_activity_support_2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mini_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序ID，分表键',
  `activity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `signer_id` int(10) NOT NULL,
  `nickname` varchar(60) NOT NULL DEFAULT '' COMMENT '昵称',
  `openid` varchar(64) NOT NULL DEFAULT '' COMMENT 'openid',
  `headimgurl` varchar(200) NOT NULL DEFAULT '',
  `mobile` varchar(15) NOT NULL DEFAULT '',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '报名时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mini_id_2` (`mini_id`,`activity_id`,`openid`,`signer_id`) USING BTREE,
  KEY `mini_id` (`mini_id`,`activity_id`,`signer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='报名表';

-- ----------------------------
-- Records of ky_gxtea_activity_support_2
-- ----------------------------

-- ----------------------------
-- Table structure for ky_gxtea_activity_support_3
-- ----------------------------
DROP TABLE IF EXISTS `ky_gxtea_activity_support_3`;
CREATE TABLE `ky_gxtea_activity_support_3` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mini_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序ID，分表键',
  `activity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `signer_id` int(10) NOT NULL,
  `nickname` varchar(60) NOT NULL DEFAULT '' COMMENT '昵称',
  `openid` varchar(64) NOT NULL DEFAULT '' COMMENT 'openid',
  `headimgurl` varchar(200) NOT NULL DEFAULT '',
  `mobile` varchar(15) NOT NULL DEFAULT '',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '报名时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mini_id_2` (`mini_id`,`activity_id`,`openid`,`signer_id`) USING BTREE,
  KEY `mini_id` (`mini_id`,`activity_id`,`signer_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='报名表';

-- ----------------------------
-- Records of ky_gxtea_activity_support_3
-- ----------------------------

-- ----------------------------
-- Table structure for ky_gxtea_activity_support_4
-- ----------------------------
DROP TABLE IF EXISTS `ky_gxtea_activity_support_4`;
CREATE TABLE `ky_gxtea_activity_support_4` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mini_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序ID，分表键',
  `activity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `signer_id` int(10) NOT NULL,
  `nickname` varchar(60) NOT NULL DEFAULT '' COMMENT '昵称',
  `openid` varchar(64) NOT NULL DEFAULT '' COMMENT 'openid',
  `headimgurl` varchar(200) NOT NULL DEFAULT '',
  `mobile` varchar(15) NOT NULL DEFAULT '',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '报名时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mini_id_2` (`mini_id`,`activity_id`,`openid`,`signer_id`) USING BTREE,
  KEY `mini_id` (`mini_id`,`activity_id`,`signer_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='报名表';

-- ----------------------------
-- Records of ky_gxtea_activity_support_4
-- ----------------------------

-- ----------------------------
-- Table structure for ky_gxtea_activity_support_5
-- ----------------------------
DROP TABLE IF EXISTS `ky_gxtea_activity_support_5`;
CREATE TABLE `ky_gxtea_activity_support_5` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mini_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序ID，分表键',
  `activity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `signer_id` int(10) NOT NULL,
  `nickname` varchar(60) NOT NULL DEFAULT '' COMMENT '昵称',
  `openid` varchar(64) NOT NULL DEFAULT '' COMMENT 'openid',
  `headimgurl` varchar(200) NOT NULL DEFAULT '',
  `mobile` varchar(15) NOT NULL DEFAULT '',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '报名时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mini_id_2` (`mini_id`,`activity_id`,`openid`,`signer_id`) USING BTREE,
  KEY `mini_id` (`mini_id`,`activity_id`,`signer_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='报名表';

-- ----------------------------
-- Records of ky_gxtea_activity_support_5
-- ----------------------------

-- ----------------------------
-- Table structure for ky_gxtea_city
-- ----------------------------
DROP TABLE IF EXISTS `ky_gxtea_city`;
CREATE TABLE `ky_gxtea_city` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `city` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '城市id',
  `mini_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `title` varchar(30) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '城市名称',
  `province` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '省',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `city` (`city`,`mini_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='站点';

-- ----------------------------
-- Records of ky_gxtea_city
-- ----------------------------
INSERT INTO `ky_gxtea_city` VALUES ('1', '350200', '11', '厦门市', '350000', '1', '1', '1596181893', '1597297133');
INSERT INTO `ky_gxtea_city` VALUES ('2', '350100', '11', '福州市', '350000', '2', '0', '1597297153', '1597297153');

-- ----------------------------
-- Table structure for ky_gxtea_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ky_gxtea_coupon`;
CREATE TABLE `ky_gxtea_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mini_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序ID',
  `title` varchar(40) NOT NULL DEFAULT '' COMMENT '名称',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截止日期',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '类型： 1金额抵扣  2时间抵扣 ',
  `worth` varchar(4) NOT NULL DEFAULT '0' COMMENT '抵扣额度，小时或金额（元）',
  `limit` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '每个人限领次数0为不限',
  `num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总张数',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='优惠券';

-- ----------------------------
-- Records of ky_gxtea_coupon
-- ----------------------------
INSERT INTO `ky_gxtea_coupon` VALUES ('1', '11', '1小时免单券', '0', '2', '1', '1', '10', '1', '1596467940', '1597195678');
INSERT INTO `ky_gxtea_coupon` VALUES ('2', '11', '20元券', '1598803200', '1', '20', '1', '10', '1', '1596677224', '1597195911');

-- ----------------------------
-- Table structure for ky_gxtea_coupon_user
-- ----------------------------
DROP TABLE IF EXISTS `ky_gxtea_coupon_user`;
CREATE TABLE `ky_gxtea_coupon_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mini_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `openid` varchar(64) NOT NULL DEFAULT '' COMMENT '用户',
  `coupon_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态0 待使用 1已使用',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `activity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联的活动',
  PRIMARY KEY (`id`),
  KEY `mini_id` (`mini_id`,`openid`,`coupon_id`,`activity_id`) USING BTREE,
  KEY `mini_id_2` (`mini_id`,`openid`,`coupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='优惠券';

-- ----------------------------
-- Records of ky_gxtea_coupon_user
-- ----------------------------
INSERT INTO `ky_gxtea_coupon_user` VALUES ('1', '11', '6', 'oUcHy5F7WcJp14Ivfd3wJrOKH6m4', '1', '0', '0', '1597398293', '0');
INSERT INTO `ky_gxtea_coupon_user` VALUES ('2', '11', '6', 'oUcHy5F7WcJp14Ivfd3wJrOKH6m4', '2', '1', '0', '0', '0');
INSERT INTO `ky_gxtea_coupon_user` VALUES ('3', '11', '6', 'oUcHy5F7WcJp14Ivfd3wJrOKH6m4', '1', '1', '1597226047', '1597226047', '1');

-- ----------------------------
-- Table structure for ky_gxtea_help
-- ----------------------------
DROP TABLE IF EXISTS `ky_gxtea_help`;
CREATE TABLE `ky_gxtea_help` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mini_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序，数字越小越靠前',
  `view_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '查看量',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='帮助文章';

-- ----------------------------
-- Records of ky_gxtea_help
-- ----------------------------
INSERT INTO `ky_gxtea_help` VALUES ('1', '11', '可以延时吗？', '<p>三大发送发送法萨芬的</p>', '1', '4', '1');
INSERT INTO `ky_gxtea_help` VALUES ('2', '11', '账户余额全国通用吗', '<p>账户余额全国通用吗</p>', '0', '3', '1');

-- ----------------------------
-- Table structure for ky_gxtea_order_recharge
-- ----------------------------
DROP TABLE IF EXISTS `ky_gxtea_order_recharge`;
CREATE TABLE `ky_gxtea_order_recharge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mini_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `city_id` int(7) unsigned NOT NULL DEFAULT '350200' COMMENT '站点id',
  `order_no` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '交易单号',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `openid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '会员openid',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `subject` varchar(250) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '购买主题',
  `body` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '购买详情',
  `total` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单总额（单位：分）',
  `amount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单实付金额',
  `award` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '赠送额度',
  `currency` varchar(10) CHARACTER SET utf8 NOT NULL DEFAULT 'cny' COMMENT '汇率类型',
  `channel` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT 'WX_JSAPI' COMMENT '支付类型,默认微信支付',
  `client_ip` char(15) CHARACTER SET utf8 NOT NULL DEFAULT '127.0.0.1' COMMENT '客户端ip',
  `paid` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1:支付成功 0：待支付 ； 3已过期   ',
  `transaction_id` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '支付平台订单号',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_no` (`order_no`) USING BTREE,
  KEY `user_id` (`openid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='钱包充值';

-- ----------------------------
-- Records of ky_gxtea_order_recharge
-- ----------------------------

-- ----------------------------
-- Table structure for ky_gxtea_order_room
-- ----------------------------
DROP TABLE IF EXISTS `ky_gxtea_order_room`;
CREATE TABLE `ky_gxtea_order_room` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(7) unsigned NOT NULL DEFAULT '350200' COMMENT '站点id',
  `mini_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `order_no` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '交易单号',
  `room_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '茶室id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `openid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '会员openid',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `subject` varchar(250) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '购买主题',
  `body` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '购买详情',
  `total` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单总额（单位：分）',
  `amount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单实付金额',
  `coupon_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券id',
  `level_discount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '会员等级折扣',
  `wallet` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '钱包抵扣',
  `currency` varchar(10) CHARACTER SET utf8 NOT NULL DEFAULT 'cny' COMMENT '汇率类型',
  `channel` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT 'WX_JSAPI' COMMENT '支付类型,默认微信支付',
  `client_ip` char(15) CHARACTER SET utf8 NOT NULL DEFAULT '127.0.0.1' COMMENT '客户端ip',
  `begin_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `paid` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0：待支付 ；1:支付成功 2：已使用; 3已过期;   4订单超时',
  `transaction_id` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '支付平台订单号',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `qrcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '验证二维码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_no` (`order_no`) USING BTREE,
  KEY `user_id` (`openid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='应用采购订单';

-- ----------------------------
-- Records of ky_gxtea_order_room
-- ----------------------------
INSERT INTO `ky_gxtea_order_room` VALUES ('26', '350200', '11', 'gxtea159731759497101571', '1', '6', 'oUcHy5F7WcJp14Ivfd3wJrOKH6m4', '丁昌乾-Jason', '13275008183', '预约订单', '预约茶室，服务时间2020-08-13 19:30:00 ~ 2020-08-13 20:30:00', '2', '2', '0', '0.00', '0.00', 'cny', 'WX_JSAPI', '106.122.212.110', '1597318200', '1597321800', '2', '4200000723202008134267532440', '1', '1597317594', '1597317739', '1597317608', 'http://devhhb.images.huihuiba.net/qrcode_ordergxtea1597317594971015711597317598');
INSERT INTO `ky_gxtea_order_room` VALUES ('29', '350200', '11', 'gxtea159739829353100519', '1', '6', 'oUcHy5F7WcJp14Ivfd3wJrOKH6m4', '丁昌乾-Jason', '13275008183', '预约订单', '预约茶室，服务时间2020-08-14 18:00:00 ~ 2020-08-14 19:00:00', '2', '0', '1', '0.00', '0.00', 'cny', 'WX_JSAPI', '106.122.212.110', '1597399200', '1597402800', '1', '', '1', '1597398293', '1597398300', '0', 'http://devhhb.images.huihuiba.net/qrcode_ordergxtea1597398293531005191597398295');

-- ----------------------------
-- Table structure for ky_gxtea_room
-- ----------------------------
DROP TABLE IF EXISTS `ky_gxtea_room`;
CREATE TABLE `ky_gxtea_room` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mini_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `shop_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `title` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '店铺名称',
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '店铺封面图',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否前台显示',
  `tip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '推荐合适人数提示语',
  `star` decimal(2,1) unsigned NOT NULL DEFAULT '5.0' COMMENT '评星数',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格/小时',
  `sale_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '实际已售数量',
  `sale_num_show` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '前台显示的销量',
  `pictures` text COLLATE utf8mb4_unicode_ci COMMENT '室内拍摄图',
  `desc` text COLLATE utf8mb4_unicode_ci COMMENT '使用说明',
  `hour_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '共享总时长',
  `min_hour` decimal(2,1) unsigned NOT NULL DEFAULT '1.0' COMMENT '最小时间起订量',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='茶室表';

-- ----------------------------
-- Records of ky_gxtea_room
-- ----------------------------
INSERT INTO `ky_gxtea_room` VALUES ('1', '11', '1', '茗香阁', 'http://devhhb.images.huihuiba.net/1-5ed9ef3be7526.jpg', '1596076278', '1597317608', '1', '推荐4-6人', '5.0', '0.01', '3', '3', 'http://devhhb.images.huihuiba.net/1-5f2232d6c5fac.png,http://devhhb.images.huihuiba.net/1-5f2232d6244a0.png', '<p><img src=\"http://devhhb.images.huihuiba.net/1-5f2230f0bcf86.png\" title=\"1-5f2230f0bcf86.png\" alt=\"image.png\"/></p>', '0', '1.0');

-- ----------------------------
-- Table structure for ky_gxtea_setting
-- ----------------------------
DROP TABLE IF EXISTS `ky_gxtea_setting`;
CREATE TABLE `ky_gxtea_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mini_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID，大于0表示附属公众号的配置',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '标识',
  `title` varchar(30) NOT NULL DEFAULT '' COMMENT '名称',
  `value` text COMMENT '配置值',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='配置';

-- ----------------------------
-- Records of ky_gxtea_setting
-- ----------------------------
INSERT INTO `ky_gxtea_setting` VALUES ('2', '11', 'vip', '会员等级', '{\"desc\":\"\\u4f1a\\u5458\\u7b49\\u7ea7\\u662f\\u57fa\\u4e8e\\u7528\\u6237\\u4f7f\\u7528\\u201c\\u7ea6\\u5c0f\\u8317\\u201d\\u5171\\u4eab\\u8336\\u5ba4\\u4e1a\\u52a1\\u7d2f\\u79ef\\u6d88\\u8d39\\u91d1\\u989d\\u6240\\u51b3\\u5b9a\\uff0c\\u7528\\u6237\\u8fbe\\u5230\\u76f8\\u5e94\\u7684\\u7b49\\u7ea7\\u95e8\\u69db\\u5373\\u53ef\\u81ea\\u52a8\\u5347\\u7ea7\\u3002\\u4e0d\\u540c\\u7b49\\u7ea7\\u4f1a\\u5458\\u4eab\\u53d7\\u4e0d\\u540c\\u7b49\\u7ea7\\u6298\\u6263\\u3002\",\"rule\":\"V1(\\u666e\\u901a\\u4f1a\\u5458)|0|10\\r\\nV2(\\u9ec4\\u91d1\\u4f1a\\u5458)|1000|9.0\\r\\nV3(\\u94c2\\u91d1\\u4f1a\\u5458)|2000|8.5\\r\\nV4(\\u94bb\\u77f3\\u4f1a\\u5458)|3000|8.0\"}', '1596547704', '1597385385');
INSERT INTO `ky_gxtea_setting` VALUES ('3', '11', 'order', '订单', '{\"expire\":\"1.5\",\"options\":\"1000|1100\\r\\n2000|2200\\r\\n3000|3300\"}', '1596616989', '1596679844');

-- ----------------------------
-- Table structure for ky_gxtea_shop
-- ----------------------------
DROP TABLE IF EXISTS `ky_gxtea_shop`;
CREATE TABLE `ky_gxtea_shop` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mini_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `city_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '站点id',
  `title` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '店铺名称',
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '店铺封面图',
  `longitude` decimal(10,6) unsigned NOT NULL DEFAULT '0.000000' COMMENT '经度',
  `latitude` decimal(10,6) unsigned NOT NULL DEFAULT '0.000000' COMMENT '维度',
  `on_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '营业开始时间',
  `off_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下班时间',
  `tel` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '联系电话',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '详细地址',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否前台显示',
  PRIMARY KEY (`id`),
  KEY `mini_id` (`mini_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='店铺表';

-- ----------------------------
-- Records of ky_gxtea_shop
-- ----------------------------
INSERT INTO `ky_gxtea_shop` VALUES ('1', '11', '350200', '集美泉水湾2期店', 'http://devhhb.images.huihuiba.net/1-5f2223dd6539f.jpg', '118.110703', '24.586458', '1596124800', '1596211198', '15611111112', '集美泉水湾2期店', '1596037424', '1596190981', '1');
INSERT INTO `ky_gxtea_shop` VALUES ('2', '11', '350200', '集美万达店', 'http://devhhb.images.huihuiba.net/1-5f2232d6c5fac.png', '118.092590', '24.573357', '1596124800', '1596207600', '13411111111', '集美区万达广场', '1596080935', '1596191085', '1');

-- ----------------------------
-- Table structure for ky_gxtea_staff
-- ----------------------------
DROP TABLE IF EXISTS `ky_gxtea_staff`;
CREATE TABLE `ky_gxtea_staff` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mini_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机账号',
  `password` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码',
  `shop_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='店铺核销员';

-- ----------------------------
-- Records of ky_gxtea_staff
-- ----------------------------
INSERT INTO `ky_gxtea_staff` VALUES ('1', '11', '张三', '15659827559', '$2y$10$1VT7rNRQBz6rh5O8I0LRLOM22H8JZtUcrdhFTmoT7fVad7pWFXnpi', '1', '1', '1597211038', '1597211263');

-- ----------------------------
-- Table structure for ky_gxtea_user
-- ----------------------------
DROP TABLE IF EXISTS `ky_gxtea_user`;
CREATE TABLE `ky_gxtea_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mini_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `openid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'openid ',
  `realname` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '真实姓名',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会员等级 0',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `mini_id` (`mini_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

-- ----------------------------
-- Records of ky_gxtea_user
-- ----------------------------
INSERT INTO `ky_gxtea_user` VALUES ('6', '11', 'oUcHy5F7WcJp14Ivfd3wJrOKH6m4', '', '0', '1597312895', '1597312895', '1');

-- ----------------------------
-- Table structure for ky_gxtea_user_wallet
-- ----------------------------
DROP TABLE IF EXISTS `ky_gxtea_user_wallet`;
CREATE TABLE `ky_gxtea_user_wallet` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `mini_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '可用余额',
  `total_recharge` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '历史总充值额度',
  `total_order_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单支付总金额',
  `used_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '已使用额度',
  PRIMARY KEY (`id`),
  KEY `mini_id` (`mini_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户钱包';

-- ----------------------------
-- Records of ky_gxtea_user_wallet
-- ----------------------------
INSERT INTO `ky_gxtea_user_wallet` VALUES ('5', '11', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `ky_gxtea_user_wallet` VALUES ('6', '11', '0.00', '0.00', '200.00', '0.00');

-- ----------------------------
-- Table structure for ky_gxtea_wallet_log
-- ----------------------------
DROP TABLE IF EXISTS `ky_gxtea_wallet_log`;
CREATE TABLE `ky_gxtea_wallet_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mini_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0支出  1收入',
  `money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '金额',
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发生时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='钱包明细';

-- ----------------------------
-- Records of ky_gxtea_wallet_log
-- ----------------------------
INSERT INTO `ky_gxtea_wallet_log` VALUES ('1', '11', '2', '1', '10.00', '充值10元', '0');
INSERT INTO `ky_gxtea_wallet_log` VALUES ('2', '11', '2', '1', '1100.00', '充值1000元，实到1100', '1596685442');
INSERT INTO `ky_gxtea_wallet_log` VALUES ('3', '11', '2', '1', '1100.00', '充值1000元，实到1100', '1596685565');

-- ----------------------------
-- Table structure for ky_media_image_1
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
-- Records of ky_media_image_1
-- ----------------------------

-- ----------------------------
-- Table structure for ky_media_image_2
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ky_media_image_2
-- ----------------------------
INSERT INTO `ky_media_image_2` VALUES ('1', '1', '3', 'fdj-sm.jpg', 'http://devhhb.images.huihuiba.net/1-5ed5f6b7e9d06.jpg', '1591080632', '1591080632', '1', '', '107027', 'jpg', '');
INSERT INTO `ky_media_image_2` VALUES ('5', '1', '3', 'tomcat.png', 'http://devhhb.images.huihuiba.net/1-5ed601c39157b.png', '1591083460', '1591083460', '1', 'ZOzBoX0K4goJhq2CjCXt8u29sqn4ytxq4Rb3YEA6MOg', '5103', 'png', '');
INSERT INTO `ky_media_image_2` VALUES ('6', '1', '3', '1212.jpg', 'http://devhhb.images.huihuiba.net/1-5ed603542b0f4.jpg', '1591083861', '1591083861', '1', 'ZOzBoX0K4goJhq2CjCXt8rnE0z02H4jcA9Kw618DmoE', '33185', 'jpg', '');
INSERT INTO `ky_media_image_2` VALUES ('8', '1', '1', '11.jpg', 'http://devhhb.images.huihuiba.net/1-5ed91d9b11916.jpg', '1591287196', '1591287196', '1', 'JW8XS34h_ISSqHFm_g1WsSkOYPPrDPD6w8LZtha8VF4', '15687', 'jpg', 'Qiniu');
INSERT INTO `ky_media_image_2` VALUES ('11', '1', '3', '3.jpg', 'http://devhhb.images.huihuiba.net/1-5ed9ef3be7526.jpg', '1591340860', '1591340860', '1', '', '11583', 'jpg', 'Qiniu');
INSERT INTO `ky_media_image_2` VALUES ('12', '1', '3', '18.jpg', 'http://devhhb.images.huihuiba.net/1-5ed9ef72329c0.jpg', '1591340914', '1591340915', '1', 'ZOzBoX0K4goJhq2CjCXt8jInOO11NuqcWYOg4A4Gv5Q', '21920', 'jpg', 'Qiniu');
INSERT INTO `ky_media_image_2` VALUES ('13', '1', '3', 'p1.png', 'http://devhhb.images.huihuiba.net/1-5eda5e430bdff.png', '1591369287', '1591369287', '1', '', '629161', 'png', 'Qiniu');
INSERT INTO `ky_media_image_2` VALUES ('14', '1', '3', 'p2.png', 'http://devhhb.images.huihuiba.net/1-5eda5e4754030.png', '1591369293', '1591369293', '1', '', '755358', 'png', 'Qiniu');
INSERT INTO `ky_media_image_2` VALUES ('15', '1', '3', 'IMG_0718.JPG', 'http://devhhb.images.huihuiba.net/1-5eda64b151478.JPG', '1591370931', '1591370984', '1', 'ZOzBoX0K4goJhq2CjCXt8sGRiIUyzt2fMcw0YXvL564', '367667', 'jpg', 'Qiniu');
INSERT INTO `ky_media_image_2` VALUES ('16', '1', '1', 'logo.png', 'http://devhhb.images.huihuiba.net/1-5f1011aad2d7e.png', '1594888619', '1594888619', '1', '', '7591', 'png', 'Qiniu');
INSERT INTO `ky_media_image_2` VALUES ('17', '1', '1', 'IMG_1471.JPG', 'http://devhhb.images.huihuiba.net/1-5f13120e0b7c1.JPG', '1595085338', '1595085338', '1', '', '1735226', 'jpg', 'Qiniu');
INSERT INTO `ky_media_image_2` VALUES ('18', '1', '1', 'mp_test.jpg', 'http://devhhb.images.huihuiba.net/1-5f156f510f649.jpg', '1595240273', '1595240273', '1', '', '24614', 'jpg', 'Qiniu');
INSERT INTO `ky_media_image_2` VALUES ('19', '1', '1', '分享小程序.jpg', 'http://devhhb.images.huihuiba.net/1-5f1582f0b24e6.jpg', '1595245297', '1595245297', '1', '', '69368', 'jpg', 'Qiniu');
INSERT INTO `ky_media_image_2` VALUES ('20', '1', '1', '地图找机构.jpg', 'http://devhhb.images.huihuiba.net/1-5f1582f10db72.jpg', '1595245297', '1595245297', '1', '', '157559', 'jpg', 'Qiniu');
INSERT INTO `ky_media_image_2` VALUES ('21', '1', '1', 'fdj.jpg', 'http://devhhb.images.huihuiba.net/1-5f18f12eab894.jpg', '1595470127', '1595470127', '1', '', '30783', 'jpg', 'Qiniu');
INSERT INTO `ky_media_image_2` VALUES ('22', '1', '1', 'LOGO.png', 'http://devhhb.images.huihuiba.net/1-5f192376a1017.png', '1595482999', '1595482999', '1', '', '214899', 'png', 'Qiniu');
INSERT INTO `ky_media_image_2` VALUES ('23', '1', '1', '10元红包.jpg', '/public/uploads/image/2020-07-29/1-5f21844f8b937.jpg', '1596032079', '1596032079', '1', '', '52835', 'jpg', 'Local');
INSERT INTO `ky_media_image_2` VALUES ('24', '1', '1', '家电小.jpg', 'http://devhhb.images.huihuiba.net/1-5f2223dd6539f.jpg', '1596072925', '1596072925', '1', '', '111848', 'jpg', 'Qiniu');
INSERT INTO `ky_media_image_2` VALUES ('25', '1', '1', '2.png', 'http://devhhb.images.huihuiba.net/1-5f2232d6244a0.png', '1596076758', '1596076758', '1', '', '169743', 'png', 'Qiniu');
INSERT INTO `ky_media_image_2` VALUES ('26', '1', '1', '1.png', 'http://devhhb.images.huihuiba.net/1-5f2232d6c5fac.png', '1596076760', '1596076760', '1', '', '214342', 'png', 'Qiniu');
INSERT INTO `ky_media_image_2` VALUES ('28', '1', '1', 'logo.png', 'http://devhhb.images.huihuiba.net/1-5f25196521913.png', '1596266853', '1596266853', '1', '', '9576', 'png', 'Qiniu');
INSERT INTO `ky_media_image_2` VALUES ('29', '1', '1', 'logo.png', 'http://devhhb.images.huihuiba.net/1-5f27af582cf0d.png', '1596436312', '1596436312', '1', '', '9902', 'png', 'Qiniu');
INSERT INTO `ky_media_image_2` VALUES ('30', '1', '1', 'logo.png', 'http://devhhb.images.huihuiba.net/1-5f27aff29f820.png', '1596436466', '1596708994', '1', 'JW8XS34h_ISSqHFm_g1Wsb42ymhiNocn6sD4gQFbloQ', '4950', 'png', 'Qiniu');
INSERT INTO `ky_media_image_2` VALUES ('31', '1', '1', '微信图片_20200812120423.jpg', 'http://devhhb.images.huihuiba.net/1-5f336a7d80daf.jpg', '1597205117', '1597205117', '1', '', '40519', 'jpg', 'Qiniu');

-- ----------------------------
-- Table structure for ky_media_image_3
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
-- Records of ky_media_image_3
-- ----------------------------

-- ----------------------------
-- Table structure for ky_media_image_4
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
-- Records of ky_media_image_4
-- ----------------------------

-- ----------------------------
-- Table structure for ky_media_image_5
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
-- Records of ky_media_image_5
-- ----------------------------

-- ----------------------------
-- Table structure for ky_media_music_1
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
-- Records of ky_media_music_1
-- ----------------------------

-- ----------------------------
-- Table structure for ky_media_music_2
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
-- Records of ky_media_music_2
-- ----------------------------
INSERT INTO `ky_media_music_2` VALUES ('2', '1', '3', '音乐1', '音乐描述', 'http://devhhb.images.huihuiba.net/1-5eda125e86564.mp3', 'http://devhhb.images.huihuiba.net/1-5eda125e86564.mp3', '', '1591438777', '1591438777', '1');
INSERT INTO `ky_media_music_2` VALUES ('3', '1', '3', '测试', '描述啊', 'http://devhhb.images.huihuiba.net/1-5eda049e9f1fc.mp3', '', '', '1591452563', '1591452563', '1');
INSERT INTO `ky_media_music_2` VALUES ('4', '1', '3', '音乐2', '活动总动员', 'http://devhhb.images.huihuiba.net/1-5eda6c0655458.mp3', '', '', '1591453031', '1591453031', '1');
INSERT INTO `ky_media_music_2` VALUES ('5', '1', '3', '音乐3', '2323', 'http://devhhb.images.huihuiba.net/1-5edba6680e992.mp3', '', '', '1591453333', '1591453333', '1');
INSERT INTO `ky_media_music_2` VALUES ('6', '1', '1', '音乐1', '描述', 'http://devhhb.images.huihuiba.net/1-5edefa098fed9.mp3', '', '', '1591671475', '1591671475', '1');

-- ----------------------------
-- Table structure for ky_media_music_3
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
-- Records of ky_media_music_3
-- ----------------------------

-- ----------------------------
-- Table structure for ky_media_music_4
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
-- Records of ky_media_music_4
-- ----------------------------

-- ----------------------------
-- Table structure for ky_media_music_5
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
-- Records of ky_media_music_5
-- ----------------------------

-- ----------------------------
-- Table structure for ky_media_text_1
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
-- Records of ky_media_text_1
-- ----------------------------

-- ----------------------------
-- Table structure for ky_media_text_2
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
-- Records of ky_media_text_2
-- ----------------------------
INSERT INTO `ky_media_text_2` VALUES ('5', '1', '我是一段普通文本', '1591062430', '1591062430', '1');
INSERT INTO `ky_media_text_2` VALUES ('7', '1', '测试', '1591062567', '1591062567', '1');
INSERT INTO `ky_media_text_2` VALUES ('8', '1', '啊啊啊', '1591062606', '1591062606', '1');
INSERT INTO `ky_media_text_2` VALUES ('10', '1', '测试文本', '1591063189', '1591063189', '1');
INSERT INTO `ky_media_text_2` VALUES ('13', '1', '<a href=\"http://www.huihuiba.net/weixin\">加入汇汇吧</a>', '1591063451', '1591063451', '1');
INSERT INTO `ky_media_text_2` VALUES ('14', '1', '这是一段对语音的回复', '1591624178', '1591624178', '1');
INSERT INTO `ky_media_text_2` VALUES ('15', '1', '暂时无法回答你哦', '1591628258', '1591628258', '1');

-- ----------------------------
-- Table structure for ky_media_text_3
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
-- Records of ky_media_text_3
-- ----------------------------

-- ----------------------------
-- Table structure for ky_media_text_4
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
-- Records of ky_media_text_4
-- ----------------------------

-- ----------------------------
-- Table structure for ky_media_text_5
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
-- Records of ky_media_text_5
-- ----------------------------

-- ----------------------------
-- Table structure for ky_media_video_1
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
-- Records of ky_media_video_1
-- ----------------------------

-- ----------------------------
-- Table structure for ky_media_video_2
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
-- Records of ky_media_video_2
-- ----------------------------
INSERT INTO `ky_media_video_2` VALUES ('1', '1', '3', 'test.mp4', 'http://devhhb.images.huihuiba.net/1-5eda5594cb117.mp4', '1591367062', '1591457874', '1', 'ZOzBoX0K4goJhq2CjCXt8tNogKn49PcWU81kOnAXVTs', '318465', 'mp4', 'Qiniu', '', '');
INSERT INTO `ky_media_video_2` VALUES ('2', '1', '3', 'CNAS4517.mp4', 'http://devhhb.images.huihuiba.net/1-5eda5f98a0f9e.mp4', '1591369636', '1591369636', '1', '', '1579529', 'mp4', 'Qiniu', '', '');
INSERT INTO `ky_media_video_2` VALUES ('3', '1', '3', 'CQKW7923.mp4', 'http://devhhb.images.huihuiba.net/1-5eda5fe9ebd35.mp4', '1591369718', '1591370085', '1', 'ZOzBoX0K4goJhq2CjCXt8jV4XLHZXfBYccO8oAsStv8', '1617795', 'mp4', 'Qiniu', '', '');
INSERT INTO `ky_media_video_2` VALUES ('4', '1', '1', 'shoes.mp4', 'http://devhhb.images.huihuiba.net/1-5ede13cc96f94.mp4', '1591612373', '1591612634', '1', 'JW8XS34h_ISSqHFm_g1WsSLp9WAdOkH-Kpe9m-UCR2g', '1259428', 'mp4', 'Qiniu', '', '');

-- ----------------------------
-- Table structure for ky_media_video_3
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
-- Records of ky_media_video_3
-- ----------------------------

-- ----------------------------
-- Table structure for ky_media_video_4
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
-- Records of ky_media_video_4
-- ----------------------------

-- ----------------------------
-- Table structure for ky_media_video_5
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
-- Records of ky_media_video_5
-- ----------------------------

-- ----------------------------
-- Table structure for ky_media_voice_1
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
-- Records of ky_media_voice_1
-- ----------------------------

-- ----------------------------
-- Table structure for ky_media_voice_2
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
-- Records of ky_media_voice_2
-- ----------------------------
INSERT INTO `ky_media_voice_2` VALUES ('1', '1', '3', '纯音乐-抽奖音乐.mp3', 'http://devhhb.images.huihuiba.net/1-5eda049e9f1fc.mp3', '1591346346', '1591349222', '1', 'ZOzBoX0K4goJhq2CjCXt8vWpJY93HrxfTEST_cvTEfI', '1571235', 'mp3', 'Qiniu');
INSERT INTO `ky_media_voice_2` VALUES ('2', '1', '3', 'lft.mp3', 'http://devhhb.images.huihuiba.net/1-5eda125e86564.mp3', '1591349862', '1591349921', '1', 'ZOzBoX0K4goJhq2CjCXt8kU2KW1IlNA1ZkYkuDFXN5E', '1092216', 'mp3', 'Qiniu');
INSERT INTO `ky_media_voice_2` VALUES ('3', '1', '3', '1.mp3', 'http://devhhb.images.huihuiba.net/1-5eda6c0655458.mp3', '1591372809', '1591372809', '1', '', '535872', 'mp3', 'Qiniu');
INSERT INTO `ky_media_voice_2` VALUES ('4', '1', '3', '万宝路进行曲.mp3', 'http://devhhb.images.huihuiba.net/1-5edba6680e992.mp3', '1591453292', '1591453292', '1', '', '587467', 'mp3', 'Qiniu');
INSERT INTO `ky_media_voice_2` VALUES ('5', '1', '1', 'lft.mp3', 'http://devhhb.images.huihuiba.net/1-5edefa098fed9.mp3', '1591671313', '1591671313', '1', '', '1092216', 'mp3', 'Qiniu');

-- ----------------------------
-- Table structure for ky_media_voice_3
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
-- Records of ky_media_voice_3
-- ----------------------------

-- ----------------------------
-- Table structure for ky_media_voice_4
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
-- Records of ky_media_voice_4
-- ----------------------------

-- ----------------------------
-- Table structure for ky_media_voice_5
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
-- Records of ky_media_voice_5
-- ----------------------------

-- ----------------------------
-- Table structure for ky_menu
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
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ky_menu
-- ----------------------------
INSERT INTO `ky_menu` VALUES ('1', '0', '公众号', 'mp/index/index', '1', '&#xe63a;', '', '1', '0', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('2', '0', '站点', 'system/admin/index', '10', '&#xe620;', '', '1', '0', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('13', '1', '增强功能', 'null', '0', 'fa fa-briefcase', '', '1', '0', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('14', '13', '自动回复', 'mp/reply/index', '0', '', '', '1', '0', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('15', '13', '自定义菜单', 'mp/menu/index', '1', '', '', '1', '0', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('16', '13', '功能配置', 'mp/setting/index', '10', '', '', '1', '0', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('17', '13', '二维码/转化链接 ', 'mp/qrcode/index', '4', '', '', '1', '0', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('18', '13', '素材管理', 'mp/material/index', '5', '', '', '1', '0', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('19', '1', '粉丝', 'null', '2', 'fa fa-users', '', '1', '0', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('20', '19', '粉丝管理', 'mp/follow/index', '0', '', '', '1', '0', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('21', '80', '微信平台', '', '0', 'fa fa-wechat', '', '1', '0', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('22', '21', '微信公众号', 'system/mp/index', '1', '', '', '1', '0', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('23', '22', '手动接入', 'system/mp/add', '3', '', '', '1', '0', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('25', '2', '设置', '', '20', 'fa fa-cogs', '', '1', '0', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('26', '25', '菜单设置', 'admin/menu/index', '1', '', '', '1', '0', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('27', '26', '增加菜单', 'admin/menu/add', '2', '', '', '1', '0', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('28', '22', '编辑公众号', 'system/mp/edit', '5', '', '', '1', '0', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('29', '22', '管理设置', 'system/mp/info', '3', '', '', '1', '0', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('30', '17', '增加二维码', 'mp/qrcode/add', '0', '', '', '1', '0', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('32', '14', '增加关键词', 'mp/reply/add', '0', '', '', '1', '0', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('41', '14', '特殊消息', 'mp/reply/special', '0', '', '', '1', '0', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('43', '0', '应用', 'system/store/myapps', '4', '&#xe635;', '', '1', '0', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('45', '2', '应用管理', 'null', '1', 'fa fa-cubes', '', '1', '0', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('46', '61', '已过期', 'system/store/overtime', '3', '', null, '1', '0', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('47', '13', '消息管理', 'mp/msg/index', '1', '', null, '1', '0', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('48', '47', '回复消息', 'mp/msg/detail', '0', '', null, '1', '0', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('50', '26', '修改菜单', 'admin/menu/edit', '0', '', null, '1', '0', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('51', '25', '微信开放平台', 'system/mp/platform', '3', '', null, '1', '0', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('52', '80', '用户/权限', '', '5', 'fa fa-users', null, '1', '0', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('53', '67', '注册会员', 'system/admin/index', '0', '', null, '1', '0', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('54', '53', '更改密码', 'system/admin/updatepwd', '0', '', null, '1', '0', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('55', '53', '增加成员', 'system/admin/add', '0', '', null, '1', '0', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('56', '45', '应用管理', 'admin/app/index', '0', '', null, '1', '0', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('57', '81', '系统公告', 'admin/notice/index', '1', '', null, '1', '0', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('58', '60', '编辑应用分类', 'admin/addoncate/edit', '3', '', null, '1', '0', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('59', '60', '新增应用分类', 'admin/addoncate/add', '0', '', null, '1', '0', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('60', '45', '应用分类', 'admin/addoncate/index', '5', '', null, '1', '0', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('61', '43', '我的应用', '', '1', 'fa fa-cubes', null, '1', '0', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('62', '43', '应用市场', '', '4', 'fa fa-cubes', null, '1', '0', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('63', '62', '应用采购', 'system/store/apps', '0', '', null, '1', '0', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('64', '61', '正常应用', 'system/store/myapps', '0', '', null, '1', '0', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('65', '22', '选择接入方式', 'system/mp/choose', '0', '', null, '1', '0', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('66', '69', '编辑用户组', 'admin/admingroup/edit', '2', '', null, '1', '0', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('67', '2', '用户管理', 'NULL', '5', 'fa fa-bars', null, '1', '0', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('68', '1', '数据统计', 'mp/index/index', '0', '', null, '1', '0', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('69', '67', '用户组', 'admin/admingroup/index', '3', '&#xe68b;', null, '1', '0', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('70', '69', '新增用户组', 'admin/admingroup/add', '1', '', null, '1', '0', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('71', '17', '二维码统计', 'mp/qrcode/log', '2', '', null, '1', '0', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('72', '80', '欢迎回来', 'system/index/index', '0', '', null, '1', '0', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('73', '74', '应用商店', 'admin/appstore/index', '2', '', null, '1', '0', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('74', '2', '官方市场', 'NULL', '2', 'fa fa-cart-plus', null, '1', '0', '1597831820', '1');
INSERT INTO `ky_menu` VALUES ('75', '73', '官方市场注册', 'admin/appstore/register', '0', '', null, '1', '0', '1598262621', '2');
INSERT INTO `ky_menu` VALUES ('76', '73', '官方市场登录', 'admin/appstore/login', '0', '', null, '1', '0', '1598262646', '2');
INSERT INTO `ky_menu` VALUES ('77', '56', '编辑应用信息', 'admin/app/edit', '3', '', null, '1', '0', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('80', '0', '系统', 'system/index/index', '5', '', '', '1', '0', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('81', '2', '消息管理', '', '15', 'fa fa-bullhorn', '', '1', '0', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('82', '53', '编辑信息', 'system/admin/edit', '3', '', '', '1', '0', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('83', '25', '站点设置', 'admin/setting/index', '0', '', '', '1', '1590246581', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('84', '52', '我的账号', 'system/admin/myinfo', '0', '', '', '1', '1590410830', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('85', '84', '重置密码', 'system/admin/updatemypwd', '1', '', '', '1', '1590411654', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('86', '57', '发布公告', 'admin/notice/add', '1', 'fa fa-plus', '', '1', '1590593322', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('87', '22', '授权接入', 'mp/auth/index', '5', '', '', '1', '1590654308', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('88', '14', ' 编辑关键词', 'mp/reply/edit', '1', '', '', '1', '1591021404', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('89', '67', '用户应用', 'admin/adminaddon/index', '5', '', '', '1', '1594806392', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('90', '89', '开通应用', 'admin/adminaddon/add', '0', '', '', '1', '1594812008', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('91', '89', '编辑用户应用', 'admin/adminaddon/edit', '2', '', '', '1', '1594812032', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('92', '57', '编辑公告', 'admin/notice/edit', '5', '', '', '1', '1594896676', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('93', '80', '系统通知', 'system/notice/index', '0', '', '', '1', '1594900050', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('94', '80', '切换平台', 'system/store/index', '0', '', '', '1', '1594970326', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('95', '63', '应用下单', 'system/store/appdetail', '0', '', '', '1', '1595247406', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('96', '43', '订单支付', 'system/payment/orderaddon', '0', '', '', '1', '1595307609', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('97', '2', '财务管理', '', '0', 'fa fa-money', '', '1', '1595314612', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('98', '97', '应用订单', 'admin/orderaddon/index', '0', '', '', '1', '1595314675', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('99', '98', '修改订单', 'admin/orderaddon/edit', '0', '', '', '1', '1595324991', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('100', '80', '财务管理', '', '0', 'fa fa-money', '', '1', '1595327151', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('101', '100', '应用订单', 'system/orderaddon/index', '0', '', '', '1', '1595327214', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('102', '21', '微信小程序', 'system/mini/index', '3', 'fa fa-weixin', '', '1', '1595416032', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('103', '102', '添加小程序', 'system/mini/choose', '0', '', '', '1', '1595471638', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('104', '102', '手动添加小程序', 'system/mini/add', '0', '', '', '1', '1595471732', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('105', '102', '管理设置', 'system/mini/info', '0', '', '', '1', '1595485512', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('106', '102', '编辑小程序', 'system/mini/edit', '0', '', '', '1', '1595485527', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('107', '102', '授权失败', 'mini/auth/fail', '0', '', '', '1', '1595494584', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('108', '111', '管理', '', '0', 'fa fa-th-list', '', '1', '1595561919', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('109', '115', '用户管理', 'mini/follow/index', '3', '', '', '1', '1595562103', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('110', '115', '数据统计与分析', 'mini/index/index', '0', '', '', '1', '1595562456', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('111', '0', '小程序', 'mini/index/index', '0', '', '', '1', '1595563196', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('112', '115', '配置', 'mini/setting/index', '10', '', '', '1', '1595571661', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('113', '45', '小程序模板', 'admin/minitemplate/index', '10', '', '', '1', '1595578963', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('114', '108', '版本管理', 'mini/template/index', '0', '', '', '1', '1595660483', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('115', '111', '功能', '', '3', 'fa fa-list', '', '1', '1595660750', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('116', '56', '设置模版', 'admin/app/settemplate', '0', '', '', '1', '1595681557', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('117', '114', '新建版本', 'mini/template/choose', '0', '', '', '1', '1595772252', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('118', '114', '历史版本', 'mini/template/log', '0', '', '', '1', '1595843089', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('119', '108', '体验者管理', 'mini/tester/index', '3', '', '', '1', '1595900462', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('120', '119', '新增体验者', 'mini/tester/add', '0', '', '', '1', '1595902322', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('121', '115', '小程序码', 'mini/qrcode/index', '7', '', '', '0', '1595935890', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('122', '2', '运营管理', '', '0', 'fa fa-bar-chart', '', '1', '1596271318', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('123', '122', '友情链接', 'admin/friendlink/index', '0', '', '', '1', '1596271404', '1596273651', '1');
INSERT INTO `ky_menu` VALUES ('124', '123', '新增友链', 'admin/friendlink/add', '0', '', '', '1', '1596273508', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('125', '123', '编辑友链', 'admin/friendlink/edit', '0', '', '', '1', '1596273522', '1596273651', '2');
INSERT INTO `ky_menu` VALUES ('126', '73', '登录应用市场', 'admin/appstore/detail', '0', '', '', '1', '1598262355', '1598262493', '2');

-- ----------------------------
-- Table structure for ky_mini
-- ----------------------------
DROP TABLE IF EXISTS `ky_mini`;
CREATE TABLE `ky_mini` (
  `id` int(10) unsigned NOT NULL COMMENT 'store id',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `appid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '小程序appid',
  `appsecret` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手动接入的需要',
  `refresh_token` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nick_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '授权方昵称',
  `head_img` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '授权方头像',
  `service_type_info` tinyint(1) NOT NULL DEFAULT '0' COMMENT '授权方公众号类型，0代表订阅号，1代表由历史老帐号升级后的订阅号，2代表服务号',
  `verify_type_info` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '授权方认证类型，-1代表未认证，0代表微信认证',
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '授权方小程序的原始ID',
  `principal_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '小程序的主体名称',
  `alias` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '授权方公众号所设置的微信号，可能为空',
  `business_info` text COLLATE utf8mb4_unicode_ci COMMENT '用以了解以下功能的开通状况（0代表未开通，1代表已开通）：',
  `qrcode_url` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '二维码图片url',
  `idc` tinyint(1) NOT NULL DEFAULT '1',
  `signature` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '公众号功能简介',
  `func_info` text COLLATE utf8mb4_unicode_ci COMMENT '授权功能集',
  `mini_program_info` text CHARACTER SET utf8 COMMENT '可根据这个字段判断是否为小程序类型授权',
  `is_auth` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已授权',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `verify_file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '校验文件',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `appid` (`appid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ky_mini
-- ----------------------------
INSERT INTO `ky_mini` VALUES ('10', '1', 'wx85a60c8853fa7d49', '', 'refreshtoken@@@jAaSgPRUJT28mYinBSa2PR6teSV0yegrQbZ1VKDCiPA', '占卜手', 'http://wx.qlogo.cn/mmopen/icU3wjyUPLMsTMc8ApkQS8pTns0QBtSPQFSx4cz9JMXNAPLGCDvgXwwA32VLGXZw9fEPYQwdzia8JFm6JS2ZSVZUge25p7KIZ4/0', '0', '-1', 'gh_811a6be57067', '厦门酷云网络科技有限公司', '', '{\"open_pay\":0,\"open_shake\":0,\"open_scan\":0,\"open_card\":0,\"open_store\":0}', 'http://devhhb.images.huihuiba.net/c59227b6ffd3648a062c4f98750e2099', '1', '研究易经，免费算命的应用,提供八字算命婚姻,化煞解灾改运,八卦六爻择日预测,企业风水,周公解梦十二生肖运势等命理类服务。', '[{\"funcscope_category\":{\"id\":17}},{\"funcscope_category\":{\"id\":18},\"confirm_info\":{\"need_confirm\":0,\"already_confirm\":0,\"can_confirm\":0}},{\"funcscope_category\":{\"id\":19}},{\"funcscope_category\":{\"id\":25},\"confirm_info\":{\"need_confirm\":0,\"already_confirm\":0,\"can_confirm\":0}},{\"funcscope_category\":{\"id\":30},\"confirm_info\":{\"need_confirm\":0,\"already_confirm\":0,\"can_confirm\":0}},{\"funcscope_category\":{\"id\":31},\"confirm_info\":{\"need_confirm\":0,\"already_confirm\":0,\"can_confirm\":0}},{\"funcscope_category\":{\"id\":36}},{\"funcscope_category\":{\"id\":37}},{\"funcscope_category\":{\"id\":40}},{\"funcscope_category\":{\"id\":41},\"confirm_info\":{\"need_confirm\":0,\"already_confirm\":0,\"can_confirm\":0}},{\"funcscope_category\":{\"id\":45}},{\"funcscope_category\":{\"id\":48}},{\"funcscope_category\":{\"id\":49},\"confirm_info\":{\"need_confirm\":0,\"already_confirm\":0,\"can_confirm\":0}},{\"funcscope_category\":{\"id\":51}},{\"funcscope_category\":{\"id\":57}},{\"funcscope_category\":{\"id\":65}},{\"funcscope_category\":{\"id\":67}}]', '{\"network\":{\"RequestDomain\":[\"https:\\/\\/kyphp.fdj.kuryun.cn\"],\"WsRequestDomain\":[\"wss:\\/\\/kyphp.fdj.kuryun.cn\"],\"UploadDomain\":[\"https:\\/\\/kyphp.fdj.kuryun.cn\"],\"DownloadDomain\":[\"https:\\/\\/kyphp.fdj.kuryun.cn\"],\"BizDomain\":[\"https:\\/\\/kyphp.fdj.kuryun.cn\"],\"UDPDomain\":[]},\"categories\":[{\"first\":\"\\u5de5\\u5177\",\"second\":\"\\u4fe1\\u606f\\u67e5\\u8be2\"},{\"first\":\"\\u751f\\u6d3b\\u670d\\u52a1\",\"second\":\"\\u4f11\\u95f2\\u5a31\\u4e50\"}],\"visit_status\":0}', '1', '1', '1595557998', '1596513074', '');
INSERT INTO `ky_mini` VALUES ('11', '1', 'wx7f61eafb0a0f3c77', '', 'refreshtoken@@@vZFzZNff61bi8bxrIpi5l7f-X1nZUf921o9o6_I67Dc', '爱儿本', 'http://wx.qlogo.cn/mmopen/icU3wjyUPLMsTMc8ApkQS8iaVnSsD0V7zVDfkicOL96aMSwibnmnNpIFZHh5gK8ibN7mJdlia7z9AapN1eiajawNeJAkw2QsXTdibBH9/0', '0', '0', 'gh_b778980b9522', '厦门酷云网络科技有限公司', '', '{\"open_pay\":0,\"open_shake\":0,\"open_scan\":0,\"open_card\":0,\"open_store\":0}', 'http://devhhb.images.huihuiba.net/06190c9e80184308a077292c19ec0bfc', '1', '儿童相册、成长日记、育儿知识分享', '[{\"funcscope_category\":{\"id\":17}},{\"funcscope_category\":{\"id\":18},\"confirm_info\":{\"need_confirm\":0,\"already_confirm\":0,\"can_confirm\":0}},{\"funcscope_category\":{\"id\":19}},{\"funcscope_category\":{\"id\":25},\"confirm_info\":{\"need_confirm\":0,\"already_confirm\":0,\"can_confirm\":0}},{\"funcscope_category\":{\"id\":30},\"confirm_info\":{\"need_confirm\":0,\"already_confirm\":0,\"can_confirm\":0}},{\"funcscope_category\":{\"id\":31},\"confirm_info\":{\"need_confirm\":0,\"already_confirm\":0,\"can_confirm\":0}},{\"funcscope_category\":{\"id\":36}},{\"funcscope_category\":{\"id\":37}},{\"funcscope_category\":{\"id\":40}},{\"funcscope_category\":{\"id\":41},\"confirm_info\":{\"need_confirm\":0,\"already_confirm\":0,\"can_confirm\":0}},{\"funcscope_category\":{\"id\":45}},{\"funcscope_category\":{\"id\":48}},{\"funcscope_category\":{\"id\":49},\"confirm_info\":{\"need_confirm\":0,\"already_confirm\":0,\"can_confirm\":0}},{\"funcscope_category\":{\"id\":51}},{\"funcscope_category\":{\"id\":57}},{\"funcscope_category\":{\"id\":65}},{\"funcscope_category\":{\"id\":67}}]', '{\"network\":{\"RequestDomain\":[\"https:\\/\\/weixin.open.huihuiba.net\"],\"WsRequestDomain\":[\"wss:\\/\\/weixin.open.huihuiba.net\"],\"UploadDomain\":[\"https:\\/\\/weixin.open.huihuiba.net\"],\"DownloadDomain\":[\"https:\\/\\/weixin.open.huihuiba.net\"],\"BizDomain\":[\"https:\\/\\/www.huihuiba.net\"],\"UDPDomain\":[]},\"categories\":[{\"first\":\"\\u5de5\\u5177\",\"second\":\"\\u5907\\u5fd8\\u5f55\"},{\"first\":\"\\u5de5\\u5177\",\"second\":\"\\u56fe\\u7247\"},{\"first\":\"\\u5de5\\u5177\",\"second\":\"\\u9884\\u7ea6\\/\\u62a5\\u540d\"},{\"first\":\"\\u751f\\u6d3b\\u670d\\u52a1\",\"second\":\"\\u4f11\\u95f2\\u5a31\\u4e50\"}],\"visit_status\":0}', '1', '1', '1596536174', '1596786901', '');

-- ----------------------------
-- Table structure for ky_mini_addon
-- ----------------------------
DROP TABLE IF EXISTS `ky_mini_addon`;
CREATE TABLE `ky_mini_addon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `mini_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `addon` varchar(50) NOT NULL DEFAULT '' COMMENT '插件标识',
  `infos` text COMMENT '配置信息',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mpid_addon` (`mini_id`,`addon`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='小程序-插件关联表';

-- ----------------------------
-- Records of ky_mini_addon
-- ----------------------------
INSERT INTO `ky_mini_addon` VALUES ('1', '10', 'mini_demo', '{\"title\":\"\\u6d4b\\u8bd5\\u503c\",\"app_key\":\"9eT8gFN2J1efa5e8fadfegas1DDewrqw\"}', '1595932225', '1595947318', '1');
INSERT INTO `ky_mini_addon` VALUES ('8', '10', 'gxtea', '{\"app_key\":\"123456\"}', '1595988929', '1596186644', '1');
INSERT INTO `ky_mini_addon` VALUES ('9', '11', 'gxtea', '{\"kefu_tel\":\"15659827559\"}', '1596536891', '1596695344', '1');

-- ----------------------------
-- Table structure for ky_mini_follow_1
-- ----------------------------
DROP TABLE IF EXISTS `ky_mini_follow_1`;
CREATE TABLE `ky_mini_follow_1` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `mini_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `openid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'openid',
  `nickname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `headimgurl` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `country` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '中国' COMMENT '国家',
  `province` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '城市',
  `language` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'zh_CN' COMMENT '语言',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '性别（1：男；2：女，0：未知）',
  `remark` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `unionid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'unionid',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `openid` (`mini_id`,`openid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='小程序微信用户表';

-- ----------------------------
-- Records of ky_mini_follow_1
-- ----------------------------
INSERT INTO `ky_mini_follow_1` VALUES ('1', '10', '', '888888', '', '', '中国', '', '', 'zh_CN', '1', '', '0', '0', '');
INSERT INTO `ky_mini_follow_1` VALUES ('2', '10', '', 'oq-q-4ptVVjB5AtO2Lt5zzUcmt2I', '丁昌乾-Jason', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKSOvNVhIS4YJ3TZ25uN9s95cGXRQA8j49gfUf9hMDFmDk68fUeth7ppbCaficBWtibLxvrpBrvvialg/132', 'China', 'Fujian', 'Xiamen', 'zh_CN', '1', '', '1596160012', '1596354513', '');

-- ----------------------------
-- Table structure for ky_mini_follow_2
-- ----------------------------
DROP TABLE IF EXISTS `ky_mini_follow_2`;
CREATE TABLE `ky_mini_follow_2` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `mini_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `openid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'openid',
  `nickname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `headimgurl` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `country` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '中国' COMMENT '国家',
  `province` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '城市',
  `language` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'zh_CN' COMMENT '语言',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '性别（1：男；2：女，0：未知）',
  `remark` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `unionid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'unionid',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `openid` (`mini_id`,`openid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='小程序微信用户表';

-- ----------------------------
-- Records of ky_mini_follow_2
-- ----------------------------
INSERT INTO `ky_mini_follow_2` VALUES ('6', '11', '13275008183', 'oUcHy5F7WcJp14Ivfd3wJrOKH6m4', '丁昌乾-Jason', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJJOlibibPFEWO9qcXhCJltwPHsOgzAzS0ibtjpmbefwdibupgy4ibF2tOeKOCu18vLrzOUvYibXujosiaeg/132', 'China', 'Fujian', 'Xiamen', 'zh_CN', '1', '', '1597312814', '1597312898', '');

-- ----------------------------
-- Table structure for ky_mini_follow_3
-- ----------------------------
DROP TABLE IF EXISTS `ky_mini_follow_3`;
CREATE TABLE `ky_mini_follow_3` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `mini_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `openid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'openid',
  `nickname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `headimgurl` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `country` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '中国' COMMENT '国家',
  `province` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '城市',
  `language` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'zh_CN' COMMENT '语言',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '性别（1：男；2：女，0：未知）',
  `remark` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `unionid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'unionid',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `openid` (`mini_id`,`openid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='小程序微信用户表';

-- ----------------------------
-- Records of ky_mini_follow_3
-- ----------------------------

-- ----------------------------
-- Table structure for ky_mini_follow_4
-- ----------------------------
DROP TABLE IF EXISTS `ky_mini_follow_4`;
CREATE TABLE `ky_mini_follow_4` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `mini_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `openid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'openid',
  `nickname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `headimgurl` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `country` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '中国' COMMENT '国家',
  `province` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '城市',
  `language` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'zh_CN' COMMENT '语言',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '性别（1：男；2：女，0：未知）',
  `remark` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `unionid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'unionid',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `openid` (`mini_id`,`openid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='小程序微信用户表';

-- ----------------------------
-- Records of ky_mini_follow_4
-- ----------------------------

-- ----------------------------
-- Table structure for ky_mini_follow_5
-- ----------------------------
DROP TABLE IF EXISTS `ky_mini_follow_5`;
CREATE TABLE `ky_mini_follow_5` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `mini_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `openid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'openid',
  `nickname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `headimgurl` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `country` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '中国' COMMENT '国家',
  `province` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '城市',
  `language` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'zh_CN' COMMENT '语言',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '性别（1：男；2：女，0：未知）',
  `remark` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `unionid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'unionid',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `openid` (`mini_id`,`openid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='小程序微信用户表';

-- ----------------------------
-- Records of ky_mini_follow_5
-- ----------------------------

-- ----------------------------
-- Table structure for ky_mini_setting
-- ----------------------------
DROP TABLE IF EXISTS `ky_mini_setting`;
CREATE TABLE `ky_mini_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mini_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号ID，大于0表示附属公众号的配置',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '标识',
  `title` varchar(30) NOT NULL DEFAULT '' COMMENT '名称',
  `value` text COMMENT '配置值',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='小程序配置';

-- ----------------------------
-- Records of ky_mini_setting
-- ----------------------------
INSERT INTO `ky_mini_setting` VALUES ('1', '10', 'wxpay', '微信支付', '{\"appid\":\"wxe1b7737e3a0c7153\",\"secret\":\"887bb389abbe27e69982576a96a515b3\",\"merchant_id\":\"1449332102\",\"key\":\"Tm44FMGt484Y44TjV34V3VG2ZEG4pf4f\",\"cert_path\":\"\",\"key_path\":\"\",\"rsa_path\":\"\"}', '1591886422', '1596031924');
INSERT INTO `ky_mini_setting` VALUES ('2', '11', 'wxpay', '微信支付', '{\"appid\":\"wx7f61eafb0a0f3c77\",\"secret\":\"2c7fb3e2183d0ba784501ce7c834d594\",\"merchant_id\":\"1449332102\",\"key\":\"Tm44FMGt484Y44TjV34V3VG2ZEG4pf4f\",\"cert_path\":\"\",\"key_path\":\"\",\"rsa_path\":\"\"}', '1591886422', '1596693708');

-- ----------------------------
-- Table structure for ky_mini_template
-- ----------------------------
DROP TABLE IF EXISTS `ky_mini_template`;
CREATE TABLE `ky_mini_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `template_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序模板id',
  `user_desc` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '模版描述 开发者自定义字段',
  `user_version` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '版本号',
  `upload_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型（1：模板；2：草稿）',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `source_miniprogram_appid` varchar(64) NOT NULL DEFAULT '' COMMENT '来自小程序appid',
  `source_miniprogram` varchar(64) NOT NULL DEFAULT '' COMMENT '来自小程序名称',
  `developer` varchar(50) NOT NULL DEFAULT '' COMMENT '开发者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='小程序模板库';

-- ----------------------------
-- Records of ky_mini_template
-- ----------------------------
INSERT INTO `ky_mini_template` VALUES ('69', '1', '占卜手1.0', 'zbs1.0', '1595589040', '1', '1', '1595589584', '1595589584', 'wx85a60c8853fa7d49', '占卜手', '傅道集');
INSERT INTO `ky_mini_template` VALUES ('70', '0', '占卜手1.0', 'zbs1.0', '1595576319', '2', '1', '1595590347', '1595590347', 'wx85a60c8853fa7d49', '占卜手', '傅道集');
INSERT INTO `ky_mini_template` VALUES ('71', '1', '丁昌乾-Jason 在 2020年8月10日上午9点32分 提交上传', '1.0.0', '1597023161', '2', '1', '1597326484', '1597326484', 'wx7f61eafb0a0f3c77', '爱儿本', '丁昌乾-Jason');

-- ----------------------------
-- Table structure for ky_mini_template_log
-- ----------------------------
DROP TABLE IF EXISTS `ky_mini_template_log`;
CREATE TABLE `ky_mini_template_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `mini_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `template_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模板id',
  `addon` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '应用标识',
  `ext_json` text COMMENT '第三方自定义配置',
  `user_version` varchar(64) NOT NULL DEFAULT '' COMMENT '代码版本号',
  `user_desc` varchar(200) NOT NULL DEFAULT '' COMMENT '代码描述',
  `qr_code` varchar(200) NOT NULL DEFAULT '' COMMENT '体验二维码',
  `extend_info` text COMMENT '扩展信息',
  `audit_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '审核编号',
  `reason` varchar(125) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT 'status为1时的拒绝原因',
  `verify_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传审核时间',
  `publish_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，其中0待提交审核 1为审核中， 2为审核成功，3为审核失败，4为已发布, 5:为已撤回，6审核延后',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `is_current` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否当前提交版本',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `mini_id_status` (`mini_id`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='小程序模版记录';

-- ----------------------------
-- Records of ky_mini_template_log
-- ----------------------------
INSERT INTO `ky_mini_template_log` VALUES ('1', '1', '10', '1', 'mini_demo', '{\"ext\":{\"appId\":\"wx85a60c8853fa7d49\"}}', '1.0', '第一版', '', null, '0', '', '0', '0', '0', '1595777043', '1595850926', '0');
INSERT INTO `ky_mini_template_log` VALUES ('3', '1', '10', '1', 'mini_demo', '{\"ext\":{\"appId\":\"wx85a60c8853fa7d49\"}}', '2.0', '更新个人中心', 'http://devhhb.images.huihuiba.net/mini_qrcode_test_10_1595863113.png', '[{\"first_id\":\"287\",\"first_class\":\"\\u5de5\\u5177\",\"address\":\"pages\\/index\\/index\",\"tag\":\"\\u5de5\\u5177 \\u5a31\\u4e50\",\"second_id\":\"612\",\"second_class\":\"\\u4fe1\\u606f\\u67e5\\u8be2\"}]', '520692775', '1:小程序内容不符合规则:<br>(1):你好，小程序所实际提供的服务和内容，必须是正式的，不能以Demo形式提交。<br>', '1595918042', '0', '3', '1595850926', '1595995083', '0');
INSERT INTO `ky_mini_template_log` VALUES ('4', '1', '10', '1', 'gxtea', '{\"ext\":{\"appId\":\"wx85a60c8853fa7d49\"}}', '1.0', '2.1', '', null, '0', '', '0', '0', '0', '1595988892', '1595995083', '1');
INSERT INTO `ky_mini_template_log` VALUES ('5', '1', '11', '1', 'gxtea', '{\"ext\":{\"appId\":\"wx7f61eafb0a0f3c77\",\"env\":{\"restUrl\":\"https:\\/\\/kyphp.fdj.kuryun.cn\\/app\\/gxtea\\/api\\/\",\"qiniuDomain\":\"http:\\/\\/devhhb.images.huihuiba.net\",\"appKey\":\"123456\",\"mapKey\":\"3EOBZ-JDO3O-N4UWO-SSK7I-OSQHJ-NHF4J\",\"version\":\"1.0\"}}}', '1.0', '1.0', '', null, '0', '', '0', '0', '0', '1596536868', '1596536868', '1');

-- ----------------------------
-- Table structure for ky_mini_tester
-- ----------------------------
DROP TABLE IF EXISTS `ky_mini_tester`;
CREATE TABLE `ky_mini_tester` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `mini_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '授权小程序id',
  `wechat_id` varchar(60) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '微信号',
  `remark` varchar(30) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `mini_id` (`mini_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of ky_mini_tester
-- ----------------------------
INSERT INTO `ky_mini_tester` VALUES ('1', '10', 'zgdian2', '至高点测试2', '1', '1595902513', '1595903725');
INSERT INTO `ky_mini_tester` VALUES ('2', '11', 'djf951212', '111', '0', '1597994819', '1597994902');

-- ----------------------------
-- Table structure for ky_mp
-- ----------------------------
DROP TABLE IF EXISTS `ky_mp`;
CREATE TABLE `ky_mp` (
  `id` int(10) unsigned NOT NULL COMMENT 'id,也是用户id',
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
  `verify_file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '校验文件',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `appid` (`appid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ky_mp
-- ----------------------------
INSERT INTO `ky_mp` VALUES ('1', '1', 'wx10ddcef6537dd78c', '26a4eb806b640ef07b08777c08fde731', 'MIL4umO8pWIkfNhvNx01uBDupfUqS7J4', '测试号', 'http://devhhb.images.huihuiba.net/1-5f18f12eab894.jpg', '2', '0', 'gh_96bd876da264', '', 'test1', null, 'http://devhhb.images.huihuiba.net/1-5ece7c72a8f5f.png', '1', '', null, '1', '1590324684', '1595470144', '1', null, '', '/1198741614.txt');
INSERT INTO `ky_mp` VALUES ('2', '2', 'dsaas', 'asdfasdf', 'hwrPcgezvPSAuFRCMnlAVocARzOIbbWE', 'sssss', '', '0', '-1', 'asdafasdf', '', '', null, '', '1', '', null, '1', '1590592849', '1590593695', '1', null, '', '');
INSERT INTO `ky_mp` VALUES ('3', '1', 'wx43df34a2cc394eb8', '', 'refreshtoken@@@8x14HncR97pzmXXRg1h_vaZjyY6AdsHmIJCRGCMIlyA', '苟哥', 'http://wx.qlogo.cn/mmopen/icU3wjyUPLMsTMc8ApkQS8ogWbMzUa6gKW3eVCPw5OWvhbSe3TpZ55F4DTA8T9F5D5lq0pcxDiaUxFtUic2Ob78yPAGRdfEiaTGf/0', '1', '-1', 'gh_d17efaa86a49', '个人', 'fdaoji', '{\"open_pay\":0,\"open_shake\":0,\"open_scan\":0,\"open_card\":0,\"open_store\":0}', 'http://mmbiz.qpic.cn/mmbiz_jpg/1cpRfYg4VdqSjtX9QpFL7z2qIF2ibib2GuEWeFh5SLY04Vf7YicNoAzQoTghBPFw9y3fx4na2h8VtIL1VF6kZgN5Q/0', '1', '记录学习笔记，探讨科技前沿，崇尚开放、分享、创新。', '[{\"funcscope_category\":{\"id\":1}},{\"funcscope_category\":{\"id\":15}},{\"funcscope_category\":{\"id\":4}},{\"funcscope_category\":{\"id\":7}},{\"funcscope_category\":{\"id\":2}},{\"funcscope_category\":{\"id\":3}},{\"funcscope_category\":{\"id\":11}},{\"funcscope_category\":{\"id\":6}},{\"funcscope_category\":{\"id\":5}},{\"funcscope_category\":{\"id\":8}},{\"funcscope_category\":{\"id\":13}},{\"funcscope_category\":{\"id\":9}},{\"funcscope_category\":{\"id\":10}},{\"funcscope_category\":{\"id\":12}},{\"funcscope_category\":{\"id\":22}},{\"funcscope_category\":{\"id\":23}},{\"funcscope_category\":{\"id\":26}},{\"funcscope_category\":{\"id\":27},\"confirm_info\":{\"need_confirm\":0,\"already_confirm\":0,\"can_confirm\":0}},{\"funcscope_category\":{\"id\":33},\"confirm_info\":{\"need_confirm\":0,\"already_confirm\":0,\"can_confirm\":0}},{\"funcscope_category\":{\"id\":34}},{\"funcscope_category\":{\"id\":35}},{\"funcscope_category\":{\"id\":44},\"confirm_info\":{\"need_confirm\":0,\"already_confirm\":0,\"can_confirm\":0}},{\"funcscope_category\":{\"id\":46}},{\"funcscope_category\":{\"id\":47}},{\"funcscope_category\":{\"id\":54}},{\"funcscope_category\":{\"id\":66}}]', '1', '1590660532', '1590664040', '1', null, '', '');
INSERT INTO `ky_mp` VALUES ('12', '0', 'wx570bc396a51b8ff8', '', 'refreshtoken@@@55456ocGjGsS-WpbpdbK7AkX3vI5W_wmDAjP69Wbmik', 'mpqinyetest001', 'http://wx.qlogo.cn/mmopen/jiavAo66h5f3iaTWhwbn2cElUQwg1kpUxHsNPeuib4gZXdCSWXia00S2fP7WoX0lBM60ypW34kmXeAM5tibkKwWYe6FyoKFMscXxO/0', '2', '-1', 'gh_3c884a361561', '3072995023', 'mpqinyetest001', '{\"open_pay\":0,\"open_shake\":0,\"open_scan\":0,\"open_card\":0,\"open_store\":0}', 'http://devhhb.images.huihuiba.net/48f65b0fd2f002d7d32b7eb4e2833c82', '3', '此账号用于授权组件入场检测用途', '[{\"funcscope_category\":{\"id\":1}},{\"funcscope_category\":{\"id\":15}},{\"funcscope_category\":{\"id\":4}},{\"funcscope_category\":{\"id\":7}},{\"funcscope_category\":{\"id\":2}},{\"funcscope_category\":{\"id\":3}},{\"funcscope_category\":{\"id\":11}},{\"funcscope_category\":{\"id\":6}},{\"funcscope_category\":{\"id\":5}},{\"funcscope_category\":{\"id\":8}},{\"funcscope_category\":{\"id\":13}},{\"funcscope_category\":{\"id\":9}},{\"funcscope_category\":{\"id\":10}},{\"funcscope_category\":{\"id\":12}},{\"funcscope_category\":{\"id\":17}},{\"funcscope_category\":{\"id\":18},\"confirm_info\":{\"need_confirm\":0,\"already_confirm\":0,\"can_confirm\":0}},{\"funcscope_category\":{\"id\":19}},{\"funcscope_category\":{\"id\":22}},{\"funcscope_category\":{\"id\":23}},{\"funcscope_category\":{\"id\":24},\"confirm_info\":{\"need_confirm\":0,\"already_confirm\":0,\"can_confirm\":0}},{\"funcscope_category\":{\"id\":25},\"confirm_info\":{\"need_confirm\":0,\"already_confirm\":0,\"can_confirm\":0}},{\"funcscope_category\":{\"id\":26}},{\"funcscope_category\":{\"id\":27},\"confirm_info\":{\"need_confirm\":0,\"already_confirm\":0,\"can_confirm\":0}},{\"funcscope_category\":{\"id\":30},\"confirm_info\":{\"need_confirm\":0,\"already_confirm\":0,\"can_confirm\":0}},{\"funcscope_category\":{\"id\":31},\"confirm_info\":{\"need_confirm\":0,\"already_confirm\":0,\"can_confirm\":0}},{\"funcscope_category\":{\"id\":33},\"confirm_info\":{\"need_confirm\":0,\"already_confirm\":0,\"can_confirm\":0}},{\"funcscope_category\":{\"id\":34}},{\"funcscope_category\":{\"id\":35}},{\"funcscope_category\":{\"id\":36}},{\"funcscope_category\":{\"id\":37}},{\"funcscope_category\":{\"id\":40}},{\"funcscope_category\":{\"id\":41},\"confirm_info\":{\"need_confirm\":0,\"already_confirm\":0,\"can_confirm\":0}},{\"funcscope_category\":{\"id\":44},\"confirm_info\":{\"need_confirm\":0,\"already_confirm\":0,\"can_confirm\":0}},{\"funcscope_category\":{\"id\":45}},{\"funcscope_category\":{\"id\":46}},{\"funcscope_category\":{\"id\":47}},{\"funcscope_category\":{\"id\":48}},{\"funcscope_category\":{\"id\":49},\"confirm_info\":{\"need_confirm\":0,\"already_confirm\":0,\"can_confirm\":0}},{\"funcscope_category\":{\"id\":51}},{\"funcscope_category\":{\"id\":54}},{\"funcscope_category\":{\"id\":57}},{\"funcscope_category\":{\"id\":65}},{\"funcscope_category\":{\"id\":66}},{\"funcscope_category\":{\"id\":67}}]', '0', '1597328829', '1597331689', '1', null, '', '');

-- ----------------------------
-- Table structure for ky_mp_addon
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
-- Records of ky_mp_addon
-- ----------------------------
INSERT INTO `ky_mp_addon` VALUES ('6', '1', 'demo', '{\"title\":\"\\u8bb0\\u4e8b\\u672c\",\"wx_auth_open\":\"1\"}', '1594817610', '1594817649', '1');

-- ----------------------------
-- Table structure for ky_mp_follow_1
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
-- Records of ky_mp_follow_1
-- ----------------------------

-- ----------------------------
-- Table structure for ky_mp_follow_2
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
-- Records of ky_mp_follow_2
-- ----------------------------
INSERT INTO `ky_mp_follow_2` VALUES ('1', '1', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', '傅道集', '1', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', '中国', '福建', '厦门', '1590849022', '1595919922', '1', '', '0', '1595919921', '1595919848', '', '[]', 'zh_CN', 'ADD_SCENE_QR_CODE', '1', '1');

-- ----------------------------
-- Table structure for ky_mp_follow_3
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
-- Records of ky_mp_follow_3
-- ----------------------------

-- ----------------------------
-- Table structure for ky_mp_follow_4
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
-- Records of ky_mp_follow_4
-- ----------------------------
INSERT INTO `ky_mp_follow_4` VALUES ('1', '3', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', '', '1', '', '中国', '', '', '1590850559', '1590850780', '1', '', '0', '1590850780', '1590850771', '', '', 'zh_CN', '', '', '');
INSERT INTO `ky_mp_follow_4` VALUES ('2', '3', 'oVTwBwQGvRd15VxgfIWfMTMjAOAE', '', '0', '', '中国', '', '', '1594891657', '1596293314', '1', '', '0', '1594891657', '1596293314', '', '', 'zh_CN', '', '', '');
INSERT INTO `ky_mp_follow_4` VALUES ('3', '3', 'oVTwBwaByhDLgVaR1BBWfuHLUlHo', '', '1', '', '中国', '', '', '1594965138', '1594965138', '1', '', '0', '1594965138', '0', '', '', 'zh_CN', '', '', '');

-- ----------------------------
-- Table structure for ky_mp_follow_5
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
-- Records of ky_mp_follow_5
-- ----------------------------

-- ----------------------------
-- Table structure for ky_mp_menu
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
-- Records of ky_mp_menu
-- ----------------------------
INSERT INTO `ky_mp_menu` VALUES ('1', '1', '0', 'view', '汇汇吧', '', 'http://hhb.fdj.oudewa.cn/weixin', '', '', '1', '1591521378', '1591610977', '0');
INSERT INTO `ky_mp_menu` VALUES ('2', '1', '0', 'view', '货好多', '', 'http://hmall.huihuiba.net', '', '', '1', '1591521378', '1591610977', '1');
INSERT INTO `ky_mp_menu` VALUES ('3', '1', '1', 'click', '图片', '图片', '', '', '', '1', '1591521378', '1591610977', '0');
INSERT INTO `ky_mp_menu` VALUES ('5', '1', '0', 'view', '百度', '', 'http://www.baidu.com', 'wx6e61e505e151c3b6', 'pages/index/index', '1', '1591610398', '1591610977', '2');

-- ----------------------------
-- Table structure for ky_mp_msg_1
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
-- Records of ky_mp_msg_1
-- ----------------------------

-- ----------------------------
-- Table structure for ky_mp_msg_2
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
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of ky_mp_msg_2
-- ----------------------------
INSERT INTO `ky_mp_msg_2` VALUES ('28', '1', '0', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1591672630\",\"MsgType\":\"text\",\"Content\":\"视频\",\"MsgId\":\"22787272947141282\"}', '0', '0', '1591672630');
INSERT INTO `ky_mp_msg_2` VALUES ('29', '1', '28', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'video', '{\"MediaId\":\"JW8XS34h_ISSqHFm_g1WsSLp9WAdOkH-Kpe9m-UCR2g\",\"Title\":\"shoes.mp4\",\"Description\":\"\"}', '0', '1', '1591672630');
INSERT INTO `ky_mp_msg_2` VALUES ('30', '1', '0', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1591673166\",\"MsgType\":\"text\",\"Content\":\"好\",\"MsgId\":\"22787283152509117\"}', '0', '0', '1591673166');
INSERT INTO `ky_mp_msg_2` VALUES ('31', '1', '30', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"Content\":\"暂时无法回答你哦\"}', '0', '1', '1591673166');
INSERT INTO `ky_mp_msg_2` VALUES ('34', '1', '33', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"Content\":\"这是一段对语音的回复\"}', '0', '1', '1591673507');
INSERT INTO `ky_mp_msg_2` VALUES ('35', '1', '0', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'image', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1591673687\",\"MsgType\":\"image\",\"PicUrl\":\"http:\\/\\/mmbiz.qpic.cn\\/mmbiz_jpg\\/KVW98mspEY3bCOcNDSnJFZib5RATl0Ac7ibc8qhp1Xkf2L2PxIQCaseOf1OfseJLOS8XW0cYLflAtGic6DdjBDeGQ\\/0\",\"MsgId\":\"22787287571393185\",\"MediaId\":\"kSLBrDoUSEl1sBfwUKj7gu341eOK13V7R700nuV9OrwSkPmbIAMc_FLc0txtmF5E\"}', '0', '0', '1591673687');
INSERT INTO `ky_mp_msg_2` VALUES ('36', '1', '0', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'image', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1591674513\",\"MsgType\":\"image\",\"PicUrl\":\"http://mmbiz.qpic.cn/mmbiz_jpg/KVW98mspEY3bCOcNDSnJFZib5RATl0Ac7V0Bx0CPM0SOAtLuyIsXCZibSWFuCr0CWuw7PeyuSUzliagn7uibSA1T5A/0\",\"MsgId\":\"22787300781808213\",\"MediaId\":\"1UA02fj9f-8_bBniro_rftM-fma5CrMafp4MEdQlK65AFZRhFmHuZZLdr7_bNCih\",\"url\":\"http://devhhb.images.huihuiba.net/87bf103a7e3df0b0a58b192389591f97\"}', '0', '0', '1591674513');
INSERT INTO `ky_mp_msg_2` VALUES ('37', '1', '36', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'image', '{\"MediaId\":\"JW8XS34h_ISSqHFm_g1WsSkOYPPrDPD6w8LZtha8VF4\"}', '0', '1', '1591674513');
INSERT INTO `ky_mp_msg_2` VALUES ('38', '1', '0', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1591674976\",\"MsgType\":\"text\",\"Content\":\"测试\",\"MsgId\":\"22787305683134211\"}', '0', '0', '1591674977');
INSERT INTO `ky_mp_msg_2` VALUES ('39', '1', '0', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1591675001\",\"MsgType\":\"text\",\"Content\":\"测试\",\"MsgId\":\"22787306999742339\"}', '0', '0', '1591675001');
INSERT INTO `ky_mp_msg_2` VALUES ('40', '1', '39', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"Content\":\"暂时无法回答你哦\"}', '0', '1', '1591675001');
INSERT INTO `ky_mp_msg_2` VALUES ('41', '1', '0', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1591675007\",\"MsgType\":\"text\",\"Content\":\"文本\",\"MsgId\":\"22787307809091099\"}', '0', '0', '1591675007');
INSERT INTO `ky_mp_msg_2` VALUES ('42', '1', '41', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"Content\":\"暂时无法回答你哦\"}', '0', '1', '1591675007');
INSERT INTO `ky_mp_msg_2` VALUES ('43', '1', '0', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1591675030\",\"MsgType\":\"text\",\"Content\":\"文本\",\"MsgId\":\"22787309589990687\"}', '0', '0', '1591675030');
INSERT INTO `ky_mp_msg_2` VALUES ('44', '1', '43', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"Content\":\"我是一段普通文本\"}', '0', '1', '1591675030');
INSERT INTO `ky_mp_msg_2` VALUES ('45', '1', '0', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'image', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1591675152\",\"MsgType\":\"image\",\"PicUrl\":\"http://mmbiz.qpic.cn/mmbiz_jpg/KVW98mspEY3bCOcNDSnJFZib5RATl0Ac7x1fGmZE9Vl1xYXAtVbGOXu62Hc8rV2icXxW749jKIRaE1z9tRjicqrxg/0\",\"MsgId\":\"22787305790293866\",\"MediaId\":\"MeeyR0RJYT5408e_JcYWrfUU91ecjmE6rTG6Da98k7Da7njNIZIQgXrHToSY7PQP\",\"url\":\"http://devhhb.images.huihuiba.net/331eb777a9e080054c119a7847f79a5a\"}', '0', '0', '1591675153');
INSERT INTO `ky_mp_msg_2` VALUES ('46', '1', '0', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'image', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1591675184\",\"MsgType\":\"image\",\"PicUrl\":\"http://mmbiz.qpic.cn/mmbiz_jpg/KVW98mspEY3bCOcNDSnJFZib5RATl0Ac7x1fGmZE9Vl1xYXAtVbGOXu62Hc8rV2icXxW749jKIRaE1z9tRjicqrxg/0\",\"MsgId\":\"22787308211611839\",\"MediaId\":\"BObmk8Kx4v0HOo_QSMBUBvLsjFjj5S3-5wKHxVLvrirb1rZndFZdMlCiAvQPNM6d\",\"url\":\"http://devhhb.images.huihuiba.net/caa16ead5520ca1a00e5cad2afa1e0c0\"}', '0', '0', '1591675184');
INSERT INTO `ky_mp_msg_2` VALUES ('47', '1', '46', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'image', '{\"MediaId\":\"JW8XS34h_ISSqHFm_g1WsSkOYPPrDPD6w8LZtha8VF4\"}', '0', '1', '1591675184');
INSERT INTO `ky_mp_msg_2` VALUES ('48', '1', '0', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1591698010\",\"MsgType\":\"text\",\"Content\":\"1\",\"MsgId\":\"22787639407063122\"}', '0', '0', '1591698010');
INSERT INTO `ky_mp_msg_2` VALUES ('49', '1', '48', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"Content\":\"暂时无法回答你哦\"}', '0', '1', '1591698010');
INSERT INTO `ky_mp_msg_2` VALUES ('50', '1', '0', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1591715061\",\"MsgType\":\"text\",\"Content\":\"我\",\"MsgId\":\"22787879855298707\"}', '0', '0', '1591715061');
INSERT INTO `ky_mp_msg_2` VALUES ('51', '1', '0', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1591715079\",\"MsgType\":\"text\",\"Content\":\"乾\",\"MsgId\":\"22787877843727722\"}', '0', '0', '1591715079');
INSERT INTO `ky_mp_msg_2` VALUES ('52', '1', '0', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1591715082\",\"MsgType\":\"text\",\"Content\":\"文本\",\"MsgId\":\"22787879160232801\"}', '1', '0', '1591715082');
INSERT INTO `ky_mp_msg_2` VALUES ('53', '1', '52', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"Content\":\"我是一段普通文本\"}', '0', '1', '1591715082');
INSERT INTO `ky_mp_msg_2` VALUES ('54', '1', '0', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1591715139\",\"MsgType\":\"text\",\"Content\":\"啊\",\"MsgId\":\"22787882122084167\"}', '0', '0', '1591715139');
INSERT INTO `ky_mp_msg_2` VALUES ('55', '1', '0', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'voice', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1591715374\",\"MsgType\":\"voice\",\"MediaId\":\"e77lzf4ynL60IzUjBIySjAC_1e46NTfE0eB5PC7MWn-9uNriEKrMdKjkAG_byOMx\",\"Format\":\"amr\",\"MsgId\":\"6836365475870408704\",\"Recognition\":\"\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u3002\",\"url\":\"http://devhhb.images.huihuiba.net/448677370109cded6e8842dfd52961d3\"}', '1', '0', '1591715374');
INSERT INTO `ky_mp_msg_2` VALUES ('56', '1', '55', '', '', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"Content\":\"这是一段对语音的回复\"}', '0', '1', '1591715374');
INSERT INTO `ky_mp_msg_2` VALUES ('57', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1591783870\",\"MsgType\":\"text\",\"Content\":\"文本\",\"MsgId\":\"22788865409188681\"}', '1', '0', '1591783870');
INSERT INTO `ky_mp_msg_2` VALUES ('58', '1', '57', '测试号', 'http://we7.fdj.oudewa.cn/attachment/headimg_1.jpg', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"Content\":\"我是一段普通文本\"}', '0', '1', '1591783870');
INSERT INTO `ky_mp_msg_2` VALUES ('59', '1', '57', '测试号', 'http://we7.fdj.oudewa.cn/attachment/headimg_1.jpg', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"Content\":\"这是一段对语音的回复\"}', '0', '1', '1591845366');
INSERT INTO `ky_mp_msg_2` VALUES ('60', '1', '57', '测试号', 'http://we7.fdj.oudewa.cn/attachment/headimg_1.jpg', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'image', '{\"MediaId\":\"JW8XS34h_ISSqHFm_g1WsSkOYPPrDPD6w8LZtha8VF4\",\"url\":\"http:\\/\\/devhhb.images.huihuiba.net\\/1-5ed91d9b11916.jpg\"}', '0', '1', '1591845821');
INSERT INTO `ky_mp_msg_2` VALUES ('61', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'location', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1592468598\",\"MsgType\":\"location\",\"Location_X\":\"24.531233\",\"Location_Y\":\"118.186280\",\"Scale\":\"15\",\"Label\":\"福建省厦门市湖里区泗水道669号厦门国贸商务中心\",\"MsgId\":\"22798666509597003\"}', '1', '0', '1592468599');
INSERT INTO `ky_mp_msg_2` VALUES ('62', '1', '61', '测试号', 'http://we7.fdj.oudewa.cn/attachment/headimg_1.jpg', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"Content\":\"我是一段普通文本\"}', '0', '1', '1592468599');
INSERT INTO `ky_mp_msg_2` VALUES ('63', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'location', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1592895890\",\"MsgType\":\"location\",\"Location_X\":\"24.531142\",\"Location_Y\":\"118.186346\",\"Scale\":\"15\",\"Label\":\"福建省厦门市湖里区泗水道669号厦门国贸商务中心\",\"MsgId\":\"22804783775556604\"}', '1', '0', '1592895890');
INSERT INTO `ky_mp_msg_2` VALUES ('64', '1', '63', '测试号', 'http://we7.fdj.oudewa.cn/attachment/headimg_1.jpg', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"Content\":\"我是一段普通文本\"}', '0', '1', '1592895890');
INSERT INTO `ky_mp_msg_2` VALUES ('65', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1592896108\",\"MsgType\":\"text\",\"Content\":\"http:\\/\\/kyphp.fdj.kuryun.cn\\/mp\\/reply\\/special.html\",\"MsgId\":\"22804790110140758\"}', '0', '0', '1592896108');
INSERT INTO `ky_mp_msg_2` VALUES ('66', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1592896129\",\"MsgType\":\"text\",\"Content\":\"http:\\/\\/kyphp.fdj.kuryun.cn\\/mp\\/reply\\/special.html\",\"MsgId\":\"22804789634516761\"}', '0', '0', '1592896129');
INSERT INTO `ky_mp_msg_2` VALUES ('67', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1592896334\",\"MsgType\":\"text\",\"Content\":\"http:\\/\\/kyphp.fdj.kuryun.cn\\/mp\\/reply\\/special.html\",\"MsgId\":\"22804791194747199\"}', '0', '0', '1592896334');
INSERT INTO `ky_mp_msg_2` VALUES ('68', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1592896372\",\"MsgType\":\"text\",\"Content\":\"http:\\/\\/kyphp.fdj.kuryun.cn\\/mp\\/reply\\/special.html\",\"MsgId\":\"22804792036977892\"}', '0', '0', '1592896372');
INSERT INTO `ky_mp_msg_2` VALUES ('69', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1592896389\",\"MsgType\":\"text\",\"Content\":\"文本\",\"MsgId\":\"22804792098652331\"}', '1', '0', '1592896390');
INSERT INTO `ky_mp_msg_2` VALUES ('70', '1', '69', '测试号', 'http://we7.fdj.oudewa.cn/attachment/headimg_1.jpg', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"Content\":\"我是一段普通文本\"}', '0', '1', '1592896390');
INSERT INTO `ky_mp_msg_2` VALUES ('71', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1593417052\",\"MsgType\":\"text\",\"Content\":\"文本\",\"MsgId\":\"22812250521754089\"}', '1', '0', '1593417052');
INSERT INTO `ky_mp_msg_2` VALUES ('72', '1', '71', '测试号', 'http://we7.fdj.oudewa.cn/attachment/headimg_1.jpg', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"Content\":\"我是一段普通文本\"}', '0', '1', '1593417052');
INSERT INTO `ky_mp_msg_2` VALUES ('73', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594104123\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822086067560726\"}', '0', '0', '1594104123');
INSERT INTO `ky_mp_msg_2` VALUES ('74', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594104329\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822086620961426\"}', '0', '0', '1594104329');
INSERT INTO `ky_mp_msg_2` VALUES ('75', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594104666\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822093088621078\"}', '0', '0', '1594104667');
INSERT INTO `ky_mp_msg_2` VALUES ('76', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594104669\",\"MsgType\":\"text\",\"Content\":\"1\",\"MsgId\":\"22822091763879004\"}', '0', '0', '1594104669');
INSERT INTO `ky_mp_msg_2` VALUES ('77', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594104735\",\"MsgType\":\"text\",\"Content\":\"1\",\"MsgId\":\"22822090562249432\"}', '0', '0', '1594104735');
INSERT INTO `ky_mp_msg_2` VALUES ('78', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594104752\",\"MsgType\":\"text\",\"Content\":\"2\",\"MsgId\":\"22822091084661516\"}', '0', '0', '1594104752');
INSERT INTO `ky_mp_msg_2` VALUES ('79', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594104766\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822091702679452\"}', '0', '0', '1594104766');
INSERT INTO `ky_mp_msg_2` VALUES ('80', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594104786\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822093741042382\"}', '0', '0', '1594104786');
INSERT INTO `ky_mp_msg_2` VALUES ('81', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594105821\",\"MsgType\":\"text\",\"Content\":\"1\",\"MsgId\":\"22822109345123521\"}', '0', '0', '1594105821');
INSERT INTO `ky_mp_msg_2` VALUES ('82', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594105829\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822109465144712\"}', '0', '0', '1594105829');
INSERT INTO `ky_mp_msg_2` VALUES ('83', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594105862\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822111239130568\"}', '0', '0', '1594105862');
INSERT INTO `ky_mp_msg_2` VALUES ('84', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594105891\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822107833727545\"}', '0', '0', '1594105891');
INSERT INTO `ky_mp_msg_2` VALUES ('85', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594105925\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822110228153695\"}', '0', '0', '1594105925');
INSERT INTO `ky_mp_msg_2` VALUES ('86', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594106016\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822109304447292\"}', '0', '0', '1594106017');
INSERT INTO `ky_mp_msg_2` VALUES ('87', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594106057\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822109469026017\"}', '0', '0', '1594106058');
INSERT INTO `ky_mp_msg_2` VALUES ('88', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594106167\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822115572477619\"}', '0', '0', '1594106168');
INSERT INTO `ky_mp_msg_2` VALUES ('89', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594106201\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822115766443138\"}', '0', '0', '1594106201');
INSERT INTO `ky_mp_msg_2` VALUES ('90', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594106230\",\"MsgType\":\"text\",\"Content\":\"文本\",\"MsgId\":\"22822114774034176\"}', '0', '0', '1594106230');
INSERT INTO `ky_mp_msg_2` VALUES ('91', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594106376\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822112494155963\"}', '0', '0', '1594106376');
INSERT INTO `ky_mp_msg_2` VALUES ('92', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594106562\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822118229671998\"}', '0', '0', '1594106563');
INSERT INTO `ky_mp_msg_2` VALUES ('93', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594106592\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822119604813518\"}', '0', '0', '1594106592');
INSERT INTO `ky_mp_msg_2` VALUES ('94', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594106694\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822117453655939\"}', '0', '0', '1594106695');
INSERT INTO `ky_mp_msg_2` VALUES ('95', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594107927\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822139660674143\"}', '0', '0', '1594107927');
INSERT INTO `ky_mp_msg_2` VALUES ('96', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594107993\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822140164950643\"}', '0', '0', '1594107993');
INSERT INTO `ky_mp_msg_2` VALUES ('97', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594108024\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822141799884321\"}', '0', '0', '1594108025');
INSERT INTO `ky_mp_msg_2` VALUES ('98', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594108058\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822139999443418\"}', '0', '0', '1594108058');
INSERT INTO `ky_mp_msg_2` VALUES ('99', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594108087\",\"MsgType\":\"text\",\"Content\":\"demi\",\"MsgId\":\"22822140303552005\"}', '0', '0', '1594108087');
INSERT INTO `ky_mp_msg_2` VALUES ('100', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594108089\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822141923914645\"}', '0', '0', '1594108089');
INSERT INTO `ky_mp_msg_2` VALUES ('101', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594108140\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822140639464906\"}', '0', '0', '1594108140');
INSERT INTO `ky_mp_msg_2` VALUES ('102', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594108901\",\"MsgType\":\"text\",\"Content\":\"demo\",\"MsgId\":\"22822152108643829\"}', '0', '0', '1594108901');
INSERT INTO `ky_mp_msg_2` VALUES ('103', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1594108908\",\"MsgType\":\"text\",\"Content\":\"文本\",\"MsgId\":\"22822151220841328\"}', '1', '0', '1594108908');
INSERT INTO `ky_mp_msg_2` VALUES ('104', '1', '103', '测试号', 'http://we7.fdj.oudewa.cn/attachment/headimg_1.jpg', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"Content\":\"我是一段普通文本\"}', '0', '1', '1594108908');
INSERT INTO `ky_mp_msg_2` VALUES ('105', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1595556045\",\"MsgType\":\"text\",\"Content\":\"文本\",\"MsgId\":\"22842873031241924\"}', '1', '0', '1595556046');
INSERT INTO `ky_mp_msg_2` VALUES ('106', '1', '105', '测试号', 'http://devhhb.images.huihuiba.net/1-5f18f12eab894.jpg', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"Content\":\"我是一段普通文本\"}', '0', '1', '1595556046');
INSERT INTO `ky_mp_msg_2` VALUES ('107', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1595919945\",\"MsgType\":\"text\",\"Content\":\"文本\",\"MsgId\":\"22848083533982898\"}', '1', '0', '1595919945');
INSERT INTO `ky_mp_msg_2` VALUES ('108', '1', '107', '测试号', 'http://devhhb.images.huihuiba.net/1-5f18f12eab894.jpg', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"Content\":\"我是一段普通文本\"}', '0', '1', '1595919945');
INSERT INTO `ky_mp_msg_2` VALUES ('109', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1595991286\",\"MsgType\":\"text\",\"Content\":\"demo1\",\"MsgId\":\"22849098015897750\"}', '0', '0', '1595991286');
INSERT INTO `ky_mp_msg_2` VALUES ('110', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1597329834\",\"MsgType\":\"text\",\"Content\":\"齐\",\"MsgId\":\"22868262545563354\"}', '0', '0', '1597329835');
INSERT INTO `ky_mp_msg_2` VALUES ('111', '1', '0', '傅道集', 'http://thirdwx.qlogo.cn/mmopen/XuuoWKYP66n7RHE98H4mgVW90ibAVJEVreTtyX5dIuSjiaKSzBMjC9hO9bBGOGUg700icQyFsibFjv8K1tHcRIicqBw/132', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', 'text', '{\"ToUserName\":\"gh_96bd876da264\",\"FromUserName\":\"ogoRYuCp4BBGko7A-_s2weCjTJYQ\",\"CreateTime\":\"1597329846\",\"MsgType\":\"text\",\"Content\":\"demo1\",\"MsgId\":\"22868261655728541\"}', '0', '0', '1597329846');

-- ----------------------------
-- Table structure for ky_mp_msg_3
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
-- Records of ky_mp_msg_3
-- ----------------------------

-- ----------------------------
-- Table structure for ky_mp_msg_4
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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of ky_mp_msg_4
-- ----------------------------
INSERT INTO `ky_mp_msg_4` VALUES ('28', '3', '0', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'text', '{\"ToUserName\":\"gh_d17efaa86a49\",\"FromUserName\":\"oVTwBwQ4mQBMzON1pXo_WhJSmlyI\",\"CreateTime\":\"1591710511\",\"MsgType\":\"text\",\"Content\":\"音乐\",\"MsgId\":\"22787814973843601\"}', '1', '0', '1591710511');
INSERT INTO `ky_mp_msg_4` VALUES ('29', '3', '28', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'music', '{\"Title\":\"音乐1\",\"Description\":\"音乐描述\",\"MusicUrl\":\"http:\\/\\/devhhb.images.huihuiba.net\\/1-5eda125e86564.mp3\",\"HQMusicUrl\":\"http:\\/\\/devhhb.images.huihuiba.net\\/1-5eda125e86564.mp3\"}', '0', '1', '1591710511');
INSERT INTO `ky_mp_msg_4` VALUES ('30', '3', '0', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'text', '{\"ToUserName\":\"gh_d17efaa86a49\",\"FromUserName\":\"oVTwBwQ4mQBMzON1pXo_WhJSmlyI\",\"CreateTime\":\"1591710591\",\"MsgType\":\"text\",\"Content\":\"视频\",\"MsgId\":\"22787816321783031\"}', '1', '0', '1591710591');
INSERT INTO `ky_mp_msg_4` VALUES ('31', '3', '30', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'video', '{\"MediaId\":\"ZOzBoX0K4goJhq2CjCXt8tNogKn49PcWU81kOnAXVTs\",\"Title\":\"test.mp4\",\"Description\":\"\"}', '0', '1', '1591710591');
INSERT INTO `ky_mp_msg_4` VALUES ('32', '3', '0', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'text', '{\"ToUserName\":\"gh_d17efaa86a49\",\"FromUserName\":\"oVTwBwQ4mQBMzON1pXo_WhJSmlyI\",\"CreateTime\":\"1591714267\",\"MsgType\":\"text\",\"Content\":\"文本\",\"MsgId\":\"22787868775969527\"}', '1', '0', '1591714268');
INSERT INTO `ky_mp_msg_4` VALUES ('33', '3', '32', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'text', '{\"Content\":\"测试\"}', '0', '1', '1591714268');
INSERT INTO `ky_mp_msg_4` VALUES ('34', '3', '0', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'text', '{\"ToUserName\":\"gh_d17efaa86a49\",\"FromUserName\":\"oVTwBwQ4mQBMzON1pXo_WhJSmlyI\",\"CreateTime\":\"1591714642\",\"MsgType\":\"text\",\"Content\":\"音频\",\"MsgId\":\"22787875569329279\"}', '1', '0', '1591714642');
INSERT INTO `ky_mp_msg_4` VALUES ('35', '3', '34', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'voice', '{\"MediaId\":\"ZOzBoX0K4goJhq2CjCXt8kU2KW1IlNA1ZkYkuDFXN5E\"}', '0', '1', '1591714643');
INSERT INTO `ky_mp_msg_4` VALUES ('36', '3', '0', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'text', '{\"ToUserName\":\"gh_d17efaa86a49\",\"FromUserName\":\"oVTwBwQ4mQBMzON1pXo_WhJSmlyI\",\"CreateTime\":\"1591714652\",\"MsgType\":\"text\",\"Content\":\"音乐\",\"MsgId\":\"22787874448141377\"}', '1', '0', '1591714652');
INSERT INTO `ky_mp_msg_4` VALUES ('37', '3', '36', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'music', '{\"Title\":\"音乐1\",\"Description\":\"音乐描述\",\"MusicUrl\":\"http:\\/\\/devhhb.images.huihuiba.net\\/1-5eda125e86564.mp3\",\"HQMusicUrl\":\"http:\\/\\/devhhb.images.huihuiba.net\\/1-5eda125e86564.mp3\"}', '0', '1', '1591714652');
INSERT INTO `ky_mp_msg_4` VALUES ('38', '3', '0', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'text', '{\"ToUserName\":\"gh_d17efaa86a49\",\"FromUserName\":\"oVTwBwQ4mQBMzON1pXo_WhJSmlyI\",\"CreateTime\":\"1591714659\",\"MsgType\":\"text\",\"Content\":\"视频\",\"MsgId\":\"22787873027776143\"}', '1', '0', '1591714659');
INSERT INTO `ky_mp_msg_4` VALUES ('39', '3', '38', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'video', '{\"MediaId\":\"ZOzBoX0K4goJhq2CjCXt8tNogKn49PcWU81kOnAXVTs\",\"Title\":\"test.mp4\",\"Description\":\"\"}', '0', '1', '1591714659');
INSERT INTO `ky_mp_msg_4` VALUES ('40', '3', '0', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'text', '{\"ToUserName\":\"gh_d17efaa86a49\",\"FromUserName\":\"oVTwBwQ4mQBMzON1pXo_WhJSmlyI\",\"CreateTime\":\"1591783829\",\"MsgType\":\"text\",\"Content\":\"文本\",\"MsgId\":\"22788865958477352\"}', '1', '0', '1591783830');
INSERT INTO `ky_mp_msg_4` VALUES ('41', '3', '40', '苟哥', 'http://wx.qlogo.cn/mmopen/icU3wjyUPLMsTMc8ApkQS8ogWbMzUa6gKW3eVCPw5OWvhbSe3TpZ55F4DTA8T9F5D5lq0pcxDiaUxFtUic2Ob78yPAGRdfEiaTGf/0', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'text', '{\"Content\":\"测试\"}', '0', '1', '1591783830');
INSERT INTO `ky_mp_msg_4` VALUES ('42', '3', '0', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'text', '{\"ToUserName\":\"gh_d17efaa86a49\",\"FromUserName\":\"oVTwBwQ4mQBMzON1pXo_WhJSmlyI\",\"CreateTime\":\"1591784693\",\"MsgType\":\"text\",\"Content\":\"1\",\"MsgId\":\"22788875857619069\"}', '0', '0', '1591784693');
INSERT INTO `ky_mp_msg_4` VALUES ('43', '3', '0', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'text', '{\"ToUserName\":\"gh_d17efaa86a49\",\"FromUserName\":\"oVTwBwQ4mQBMzON1pXo_WhJSmlyI\",\"CreateTime\":\"1591784707\",\"MsgType\":\"text\",\"Content\":\"文本\",\"MsgId\":\"22788877664982235\"}', '1', '0', '1591784707');
INSERT INTO `ky_mp_msg_4` VALUES ('44', '3', '43', '苟哥', 'http://wx.qlogo.cn/mmopen/icU3wjyUPLMsTMc8ApkQS8ogWbMzUa6gKW3eVCPw5OWvhbSe3TpZ55F4DTA8T9F5D5lq0pcxDiaUxFtUic2Ob78yPAGRdfEiaTGf/0', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'text', '{\"Content\":\"测试\"}', '0', '1', '1591784707');
INSERT INTO `ky_mp_msg_4` VALUES ('45', '3', '0', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'image', '{\"ToUserName\":\"gh_d17efaa86a49\",\"FromUserName\":\"oVTwBwQ4mQBMzON1pXo_WhJSmlyI\",\"CreateTime\":\"1591785140\",\"MsgType\":\"image\",\"PicUrl\":\"http://mmbiz.qpic.cn/mmbiz_jpg/BicGVQs3yBibzv4KhYfxic8to4y3TNzAporwxCCxh1jzE4zswMicU7n4GMc56ZDZdzsmWqh53rmTzEWpCZT94GLKiaA/0\",\"MsgId\":\"22788885039786085\",\"MediaId\":\"tBKCt3C8zi2jidLDU1xVmUlC53gE0EWUTvU6SPxpFez3Zg-rwz-G25K-cRz0TYeo\",\"url\":\"http://devhhb.images.huihuiba.net/d6e42e7e39944c197add540e4ee575c3\"}', '0', '0', '1591785141');
INSERT INTO `ky_mp_msg_4` VALUES ('46', '3', '0', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'video', '{\"ToUserName\":\"gh_d17efaa86a49\",\"FromUserName\":\"oVTwBwQ4mQBMzON1pXo_WhJSmlyI\",\"CreateTime\":\"1591785203\",\"MsgType\":\"video\",\"MediaId\":\"kAC0bhOi3jodTY99ivRynjBreN3yrlqZ9qTHw6LM-Ik0C0u74ytTpZKSqDxM2HzG\",\"ThumbMediaId\":\"bixRWoTwDcSN0zSM0Wm6eSiZOFdSbK6n8EPITsMQPNaQOsOM9yY_hm6hwAAEOGhw\",\"MsgId\":\"22788885601799578\",\"url\":\"http://devhhb.images.huihuiba.net/c31793b37b5cd748ed9ed0000b3ac2d6\"}', '0', '0', '1591785204');
INSERT INTO `ky_mp_msg_4` VALUES ('47', '3', '0', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'text', '{\"ToUserName\":\"gh_d17efaa86a49\",\"FromUserName\":\"oVTwBwQ4mQBMzON1pXo_WhJSmlyI\",\"CreateTime\":\"1591794307\",\"MsgType\":\"text\",\"Content\":\"1\",\"MsgId\":\"22789015058077985\"}', '0', '0', '1591794308');
INSERT INTO `ky_mp_msg_4` VALUES ('48', '3', '0', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'text', '{\"ToUserName\":\"gh_d17efaa86a49\",\"FromUserName\":\"oVTwBwQ4mQBMzON1pXo_WhJSmlyI\",\"CreateTime\":\"1591794313\",\"MsgType\":\"text\",\"Content\":\"文本\",\"MsgId\":\"22789016976492309\"}', '1', '0', '1591794313');
INSERT INTO `ky_mp_msg_4` VALUES ('49', '3', '48', '苟哥', 'http://wx.qlogo.cn/mmopen/icU3wjyUPLMsTMc8ApkQS8ogWbMzUa6gKW3eVCPw5OWvhbSe3TpZ55F4DTA8T9F5D5lq0pcxDiaUxFtUic2Ob78yPAGRdfEiaTGf/0', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'text', '{\"Content\":\"测试\"}', '0', '1', '1591794313');
INSERT INTO `ky_mp_msg_4` VALUES ('50', '3', '0', '', '', 'oVTwBwQGvRd15VxgfIWfMTMjAOAE', 'text', '{\"ToUserName\":\"gh_d17efaa86a49\",\"FromUserName\":\"oVTwBwQGvRd15VxgfIWfMTMjAOAE\",\"CreateTime\":\"1594891667\",\"MsgType\":\"text\",\"Content\":\"张剑\",\"MsgId\":\"22833356281407188\"}', '0', '0', '1594891667');
INSERT INTO `ky_mp_msg_4` VALUES ('51', '3', '0', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'text', '{\"ToUserName\":\"gh_d17efaa86a49\",\"FromUserName\":\"oVTwBwQ4mQBMzON1pXo_WhJSmlyI\",\"CreateTime\":\"1595919769\",\"MsgType\":\"text\",\"Content\":\"文本\",\"MsgId\":\"22848075589395877\"}', '1', '0', '1595919770');
INSERT INTO `ky_mp_msg_4` VALUES ('52', '3', '51', '苟哥', 'http://wx.qlogo.cn/mmopen/icU3wjyUPLMsTMc8ApkQS8ogWbMzUa6gKW3eVCPw5OWvhbSe3TpZ55F4DTA8T9F5D5lq0pcxDiaUxFtUic2Ob78yPAGRdfEiaTGf/0', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'text', '{\"Content\":\"测试\"}', '0', '1', '1595919770');
INSERT INTO `ky_mp_msg_4` VALUES ('53', '3', '0', '', '', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'text', '{\"ToUserName\":\"gh_d17efaa86a49\",\"FromUserName\":\"oVTwBwQ4mQBMzON1pXo_WhJSmlyI\",\"CreateTime\":\"1596277794\",\"MsgType\":\"text\",\"Content\":\"测试\",\"MsgId\":\"22853200922407092\"}', '1', '0', '1596277794');
INSERT INTO `ky_mp_msg_4` VALUES ('54', '3', '53', '苟哥', 'http://wx.qlogo.cn/mmopen/icU3wjyUPLMsTMc8ApkQS8ogWbMzUa6gKW3eVCPw5OWvhbSe3TpZ55F4DTA8T9F5D5lq0pcxDiaUxFtUic2Ob78yPAGRdfEiaTGf/0', 'oVTwBwQ4mQBMzON1pXo_WhJSmlyI', 'text', '{\"Content\":\"测试\"}', '0', '1', '1596277794');

-- ----------------------------
-- Table structure for ky_mp_msg_5
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
-- Records of ky_mp_msg_5
-- ----------------------------

-- ----------------------------
-- Table structure for ky_mp_order
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
-- Records of ky_mp_order
-- ----------------------------
INSERT INTO `ky_mp_order` VALUES ('1', 'demo159359860610110099', '1', 'ow0_twM63wenpWy2IOiGEKS1w4GA', '打赏', '文章【测试文章】', '1', '1', '1593598606', '1593662452', null, '1', 'http://kyphp.fdj.kuryun.cn/app/demo/index/payCallback/mid/1', 'http://kyphp.fdj.kuryun.cn/app/demo/index/detail/id/3/mid/1');
INSERT INTO `ky_mp_order` VALUES ('2', 'demo159365231357575451', '1', 'ow0_twM63wenpWy2IOiGEKS1w4GA', '打赏', '文章【测试文章】', '1', '1', '1593652313', '1593661228', null, '1', 'http://kyphp.fdj.kuryun.cn/app/demo/index/payCallback/mid/1', 'http://kyphp.fdj.kuryun.cn/app/demo/index/detail/id/3/mid/1');
INSERT INTO `ky_mp_order` VALUES ('3', 'demo159366068056521005', '1', 'ow0_twM63wenpWy2IOiGEKS1w4GA', '打赏', '文章【文章1】', '1', '1', '1593660680', '1593660680', null, '0', 'http://kyphp.fdj.kuryun.cn/app/demo/index/payCallback/mid/1', 'http://kyphp.fdj.kuryun.cn/app/demo/index/detail/id/2/mid/1');
INSERT INTO `ky_mp_order` VALUES ('4', 'demo159366081648545650', '1', 'ow0_twM63wenpWy2IOiGEKS1w4GA', '打赏', '文章【文章1】', '1', '1', '1593660816', '1593661089', null, '1', 'http://kyphp.fdj.kuryun.cn/app/demo/index/payCallback/mid/1', 'http://kyphp.fdj.kuryun.cn/app/demo/index/detail/id/2/mid/1');
INSERT INTO `ky_mp_order` VALUES ('5', 'demo159366104856495656', '1', 'ow0_twM63wenpWy2IOiGEKS1w4GA', '打赏', '文章【文章1】', '1', '1', '1593661048', '1593661075', null, '1', 'http://kyphp.fdj.kuryun.cn/app/demo/index/payCallback/mid/1', 'http://kyphp.fdj.kuryun.cn/app/demo/index/detail/id/2/mid/1');
INSERT INTO `ky_mp_order` VALUES ('6', 'demo159366155450484851', '1', 'ow0_twM63wenpWy2IOiGEKS1w4GA', '打赏', '文章【文章1】', '1', '1', '1593661554', '1593661807', null, '1', 'http://kyphp.fdj.kuryun.cn/app/demo/index/payCallback/mid/1', 'http://kyphp.fdj.kuryun.cn/app/demo/index/detail/id/2/mid/1');
INSERT INTO `ky_mp_order` VALUES ('7', 'demo159367232250975710', '1', 'ow0_twM63wenpWy2IOiGEKS1w4GA', '打赏', '文章【文章1】', '1', '1', '1593672322', '1593672365', null, '1', 'http://kyphp.fdj.kuryun.cn/app/demo/index/payCallback/mid/1', 'http://kyphp.fdj.kuryun.cn/app/demo/index/detail/id/2/mid/1');

-- ----------------------------
-- Table structure for ky_mp_qrcode
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
-- Records of ky_mp_qrcode
-- ----------------------------
INSERT INTO `ky_mp_qrcode` VALUES ('2', '1', '永久场景1', '场景2', '图片', '0', '0', 'gQF28TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZmN0TUZjMjQ5b1UxMDAwMDAwN3EAAgTLEOteAwQAAAAA', 'https://w.url.cn/s/A59go3o', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQF28TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZmN0TUZjMjQ5b1UxMDAwMDAwN3EAAgTLEOteAwQAAAAA', 'http://weixin.qq.com/q/02fctMFc249oU10000007q', '1592463563', '1', '0');
INSERT INTO `ky_mp_qrcode` VALUES ('3', '1', '临时场景1', 'sdas', '文本', '1', '3600', 'gQH27zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRl9XbkU2MjQ5b1UxTmlESGh1Y3UAAgRCGeteAwQQDgAA', 'https://w.url.cn/s/AXkrakp', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQH27zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRl9XbkU2MjQ5b1UxTmlESGh1Y3UAAgRCGeteAwQQDgAA', 'http://weixin.qq.com/q/02F_WnE6249oU1NiDHhucu', '1592465730', '3', '1');

-- ----------------------------
-- Table structure for ky_mp_qrcode_log_1
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
-- Records of ky_mp_qrcode_log_1
-- ----------------------------

-- ----------------------------
-- Table structure for ky_mp_qrcode_log_2
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
-- Records of ky_mp_qrcode_log_2
-- ----------------------------
INSERT INTO `ky_mp_qrcode_log_2` VALUES ('1', '3', '1', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', '0', 'gQH27zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRl9XbkU2MjQ5b1UxTmlESGh1Y3UAAgRCGeteAwQQDgAA', '2', '1592467860', '1592468103');
INSERT INTO `ky_mp_qrcode_log_2` VALUES ('2', '2', '1', 'ogoRYuCp4BBGko7A-_s2weCjTJYQ', '0', 'gQF28TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZmN0TUZjMjQ5b1UxMDAwMDAwN3EAAgTLEOteAwQAAAAA', '1', '1592469140', '1592469140');

-- ----------------------------
-- Table structure for ky_mp_qrcode_log_3
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
-- Records of ky_mp_qrcode_log_3
-- ----------------------------

-- ----------------------------
-- Table structure for ky_mp_qrcode_log_4
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
-- Records of ky_mp_qrcode_log_4
-- ----------------------------

-- ----------------------------
-- Table structure for ky_mp_qrcode_log_5
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
-- Records of ky_mp_qrcode_log_5
-- ----------------------------

-- ----------------------------
-- Table structure for ky_mp_rule_1
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
-- Records of ky_mp_rule_1
-- ----------------------------

-- ----------------------------
-- Table structure for ky_mp_rule_2
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
-- Records of ky_mp_rule_2
-- ----------------------------
INSERT INTO `ky_mp_rule_2` VALUES ('1', '1', '图片', 'image', '8', '0');
INSERT INTO `ky_mp_rule_2` VALUES ('2', '1', '语音', 'text', '14', '1');
INSERT INTO `ky_mp_rule_2` VALUES ('3', '1', '无应答', 'text', '15', '1');
INSERT INTO `ky_mp_rule_2` VALUES ('4', '1', '视频', 'video', '4', '1');
INSERT INTO `ky_mp_rule_2` VALUES ('5', '1', '音乐', 'music', '6', '1');
INSERT INTO `ky_mp_rule_2` VALUES ('6', '1', '文本', 'text', '5', '1');
INSERT INTO `ky_mp_rule_2` VALUES ('7', '1', 'demo1', 'addon', '10', '1');

-- ----------------------------
-- Table structure for ky_mp_rule_3
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
-- Records of ky_mp_rule_3
-- ----------------------------

-- ----------------------------
-- Table structure for ky_mp_rule_4
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
-- Records of ky_mp_rule_4
-- ----------------------------
INSERT INTO `ky_mp_rule_4` VALUES ('1', '3', '测试', 'text', '7', '1');
INSERT INTO `ky_mp_rule_4` VALUES ('2', '3', '图片', 'image', '5', '1');
INSERT INTO `ky_mp_rule_4` VALUES ('3', '3', '文本', 'text', '7', '1');
INSERT INTO `ky_mp_rule_4` VALUES ('4', '3', '我和奶奶', 'image', '15', '1');
INSERT INTO `ky_mp_rule_4` VALUES ('5', '3', '音频', 'voice', '2', '1');
INSERT INTO `ky_mp_rule_4` VALUES ('6', '3', '视频', 'video', '1', '1');
INSERT INTO `ky_mp_rule_4` VALUES ('7', '3', '音乐', 'music', '2', '1');

-- ----------------------------
-- Table structure for ky_mp_rule_5
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
-- Records of ky_mp_rule_5
-- ----------------------------

-- ----------------------------
-- Table structure for ky_mp_setting
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
-- Records of ky_mp_setting
-- ----------------------------
INSERT INTO `ky_mp_setting` VALUES ('4', '1', 'wxpay', '微信支付', '{\"appid\":\"wxe1b7737e3a0c7153\",\"secret\":\"887bb389abbe27e69982576a96a515b3\",\"merchant_id\":\"1449332102\",\"key\":\"Tm44FMGt484Y44TjV34V3VG2ZEG4pf4f\",\"cert_path\":\"3241432332342432432432\",\"key_path\":\"3344334343434\",\"rsa_path\":\"\"}', '1591886422', '1596709233');

-- ----------------------------
-- Table structure for ky_mp_special
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
-- Records of ky_mp_special
-- ----------------------------
INSERT INTO `ky_mp_special` VALUES ('1', '1', 'image', '', '', '1', '1');
INSERT INTO `ky_mp_special` VALUES ('2', '1', 'voice', '', '', '1', '1');
INSERT INTO `ky_mp_special` VALUES ('3', '1', 'video', '', '', '1', '1');
INSERT INTO `ky_mp_special` VALUES ('4', '1', 'shortvideo', '', '', '1', '1');
INSERT INTO `ky_mp_special` VALUES ('5', '1', 'location', '', 'demo', '0', '1');
INSERT INTO `ky_mp_special` VALUES ('6', '1', 'link', '', '', '1', '1');
INSERT INTO `ky_mp_special` VALUES ('7', '1', 'event_location', '', '', '1', '1');
INSERT INTO `ky_mp_special` VALUES ('9', '1', 'subscribe', '', '', '0', '1');
INSERT INTO `ky_mp_special` VALUES ('10', '1', 'unsubscribe', '', '', '1', '1');
INSERT INTO `ky_mp_special` VALUES ('11', '1', 'card', '', '', '1', '1');
INSERT INTO `ky_mp_special` VALUES ('12', '1', 'default', '', '', '1', '1');
INSERT INTO `ky_mp_special` VALUES ('13', '3', 'subscribe', '', '', '1', '1');
INSERT INTO `ky_mp_special` VALUES ('14', '3', 'unsubscribe', '', '', '1', '1');
INSERT INTO `ky_mp_special` VALUES ('15', '3', 'image', '', '', '1', '1');
INSERT INTO `ky_mp_special` VALUES ('16', '3', 'voice', '', '', '1', '1');
INSERT INTO `ky_mp_special` VALUES ('17', '3', 'video', '', '', '1', '1');
INSERT INTO `ky_mp_special` VALUES ('18', '3', 'shortvideo', '', '', '1', '1');
INSERT INTO `ky_mp_special` VALUES ('19', '3', 'location', '', '', '1', '1');
INSERT INTO `ky_mp_special` VALUES ('20', '3', 'link', '', '', '1', '1');
INSERT INTO `ky_mp_special` VALUES ('21', '3', 'event_location', '', '', '1', '1');
INSERT INTO `ky_mp_special` VALUES ('23', '3', 'card', '', '', '1', '1');
INSERT INTO `ky_mp_special` VALUES ('24', '3', 'default', '', '', '1', '1');

-- ----------------------------
-- Table structure for ky_notice
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
-- Records of ky_notice
-- ----------------------------
INSERT INTO `ky_notice` VALUES ('1', '公告1', '<p><img src=\"http://devhhb.images.huihuiba.net/1-5ed603542b0f4.jpg\" alt=\"1-5ed603542b0f4.jpg\"/></p><p>测试公告内容，修改了</p>', '1594896021', '1', '1594896100', '1594896426');
INSERT INTO `ky_notice` VALUES ('2', '公告2', '<p>内容随时说</p>', '1594900011', '1', '1594900088', '1596709482');

-- ----------------------------
-- Table structure for ky_notice_read
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
-- Records of ky_notice_read
-- ----------------------------
INSERT INTO `ky_notice_read` VALUES ('1', '1', 'id2,id1');
INSERT INTO `ky_notice_read` VALUES ('2', '4', 'id2,id1');
INSERT INTO `ky_notice_read` VALUES ('3', '2', 'id1,id2');

-- ----------------------------
-- Table structure for ky_order_addon
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
-- Records of ky_order_addon
-- ----------------------------
INSERT INTO `ky_order_addon` VALUES ('9', 'addon159530730153555556', 'demo', '1', 'admin', '15659827559', '开通应用demo应用', '开通应用demo应用', '1', '2', 'cny', 'WX_NATIVE', '106.122.210.148', '1', '4200000721202007218491029526', '1', '1595307301', '1595325003', '1595311033');
INSERT INTO `ky_order_addon` VALUES ('10', 'addon159531014953989753', 'demo', '1', 'admin', '15659827559', '开通应用demo应用', '开通应用demo应用', '1', '1', 'cny', 'WX_NATIVE', '106.122.210.148', '0', '', '1', '1595310149', '1595310149', '0');
INSERT INTO `ky_order_addon` VALUES ('11', 'addon159531115349541015', 'demo', '1', 'admin', '15659827559', '开通应用demo应用', '开通应用demo应用', '1', '2', 'cny', 'WX_NATIVE', '106.122.210.148', '1', '4200000721202007214490148012', '1', '1595311153', '1595324935', '1595311177');
INSERT INTO `ky_order_addon` VALUES ('12', 'addon159531167497501015', 'demo', '1', 'admin', '15659827559', '开通应用demo应用', '开通应用demo应用', '1', '1', 'cny', 'WX_NATIVE', '106.122.210.148', '1', '4200000723202007217734528377', '1', '1595311674', '1595311697', '1595311697');
INSERT INTO `ky_order_addon` VALUES ('13', 'addon159531215357511009', 'demo', '1', 'admin', '15659827559', '开通应用demo应用', '开通应用demo应用', '1', '1', 'cny', 'WX_NATIVE', '106.122.210.148', '1', '4200000720202007211164900634', '1', '1595312153', '1595312171', '1595312171');
INSERT INTO `ky_order_addon` VALUES ('14', 'addon159531266557979852', 'demo', '1', 'admin', '15659827559', '开通应用demo应用', '开通应用demo应用', '1', '1', 'cny', 'WX_NATIVE', '106.122.210.148', '1', '4200000723202007212484015953', '1', '1595312665', '1595312686', '1595312686');
INSERT INTO `ky_order_addon` VALUES ('15', 'addon159531303910250565', 'demo', '1', 'admin', '15659827559', '开通应用demo应用', '开通应用demo应用', '1', '1', 'cny', 'WX_NATIVE', '106.122.210.148', '0', '', '1', '1595313039', '1595313039', '0');
INSERT INTO `ky_order_addon` VALUES ('16', 'addon159531314355495449', 'demo', '1', 'admin', '15659827559', '开通应用demo应用', '开通应用demo应用', '1', '1', 'cny', 'WX_NATIVE', '106.122.210.148', '0', '', '1', '1595313143', '1595313143', '0');

-- ----------------------------
-- Table structure for ky_setting
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='站点配置';

-- ----------------------------
-- Records of ky_setting
-- ----------------------------
INSERT INTO `ky_setting` VALUES ('1', 'site', '站点信息', '{\"close\":\"0\",\"close_reason\":\"\\u7cfb\\u7edf\\u5347\\u7ea7\",\"icp\":\"\\u95fdICP\\u590717014461\\u53f7-1\",\"logo\":\"http:\\/\\/devhhb.images.huihuiba.net\\/1-5f27aff29f820.png\",\"kefu\":\"http:\\/\\/devhhb.images.huihuiba.net\\/1-5f336a7d80daf.jpg\",\"default_group_id\":\"2\",\"keywords\":\"\\u5fae\\u4fe1\\u5173\\u7cfb\\u7ba1\\u7406\\u3001\\u5fae\\u4fe1\\u516c\\u4f17\\u53f7\\u3001\\u793e\\u4ea4\\u6570\\u636e\\u7ba1\\u7406\\u3001\\u5c0f\\u7a0b\\u5e8f\\u3001\\u5fae\\u4fe1\\u516c\\u4f17\\u5e73\\u53f0\\u3001\\u516c\\u4f17\\u53f7\\u5e94\\u7528\\u5546\\u5e97\\uff0c\\u516c\\u4f17\\u53f7\\u63d2\\u4ef6\\u5546\\u5e97\\u3001\\u516c\\u4f17\\u53f7\\u5f00\\u53d1\\u3001\\u5fae\\u4fe1CRM\\u3001\\u9910\\u996e\\u3001\\u65b0\\u96f6\\u552e\\u3001\\u5728\\u7ebf\\u6559\\u80b2\\u3001\\u667a\\u80fd\\u786c\\u4ef6\",\"description\":\"\\u9177\\u5728\\u4e91\\u7aef\\u662f\\u9886\\u5148\\u7684\\u5fae\\u4fe1\\u5168\\u884c\\u4e1a\\u8425\\u9500\\u5e73\\u53f0\\u3002\\u4e0d\\u4ec5\\u5e2e\\u52a9\\u54c1\\u724c\\u89e3\\u51b3\\u5fae\\u4fe1\\u516c\\u4f17\\u53f7\\u3001\\u5c0f\\u7a0b\\u5e8f\\u7684\\u5f00\\u53d1\\u95ee\\u9898\\uff0c\\u7ba1\\u7406\\u7c89\\u4e1dCRM\\u53ca\\u6570\\u636e\\uff0c\\u6839\\u636e\\u884c\\u4e3a\\u53ca\\u5c5e\\u6027\\u5c06\\u7c89\\u4e1d\\u81ea\\u52a8\\u6253\\u4e0a\\u6807\\u7b7e\\uff0c\\u501f\\u52a9\\u5fae\\u4fe1CRM\\u5b9e\\u73b0\\u7cbe\\u7ec6\\u5316\\u8425\\u9500\\u3002\\u4e5f\\u4e3a\\u4e2d\\u5c0f\\u4f01\\u4e1a\\u63d0\\u4f9b\\u5fae\\u5546\\u57ce\\u3001\\u667a\\u6167\\u96f6\\u552e\\u3001\\u9910\\u996eo2o\\u3001\\u5c0f\\u7a0b\\u5e8f\\u7b49\\u4e00\\u4f53\\u5316\\u89e3\\u51b3\\u65b9\\u6848\\uff0c\\u4ee5\\u66f4\\u5f00\\u653e\\u7684\\u670d\\u52a1\\u751f\\u6001\\u4e3a\\u7528\\u6237\\u63d0\\u4f9b\\u4ea7\\u54c1\\u548c\\u670d\\u52a1\\uff0c\\u6784\\u5efa\\u7ebf\\u4e0a\\u7ebf\\u4e0b\\u878d\\u5408\\u3001 \\u591a\\u6e20\\u9053\\u8425\\u9500\\u3001\\u5f00\\u653e\\u4e92\\u901a\\u7684\\u667a\\u80fd\\u5546\\u4e1a\\u670d\\u52a1\\u751f\\u6001\\u4f53\\u7cfb\\uff0c\\u5e2e\\u52a9\\u66f4\\u591a\\u4e2d\\u5c0f\\u4f01\\u4e1a\\u5411\\u667a\\u80fd\\u5546\\u4e1a\\u8f6c\\u578b\\u5347\\u7ea7\\u3002\"}', '1590290640', '1597205129');
INSERT INTO `ky_setting` VALUES ('2', 'upload', '附件设置', '{\"driver\":\"local\",\"qiniu_ak\":\"\",\"qiniu_sk\":\"\",\"qiniu_bucket\":\"\",\"qiniu_domain\":\"\",\"image_size\":\"2048000\",\"image_ext\":\"jpg,gif,png,jpeg\",\"file_size\":\"53000000\",\"file_ext\":\"jpg,gif,png,jpeg,zip,rar,tar,gz,7z,doc,docx,txt,xml,mp3,mp4,xls,xlsx,pdf\",\"voice_size\":\"2048000\",\"voice_ext\":\"mp3,wma,wav,amr\",\"video_size\":\"50240000\",\"video_ext\":\"mp4,flv,mov\"}', '1590292316', '1598424996');
INSERT INTO `ky_setting` VALUES ('3', 'weixin', '微信', '{\"platform\":{\"appid\":\"wxe801199e1be0e667\",\"appsecret\":\"b888af3de74a6b55de3d257ae7439a51\",\"token\":\"Ss6jcMRzWJr4eBIy43qAQMhbDQIgrIvy\",\"aes_key\":\"d7EDKAAJJowAsYnudcASzLjwBlJXXp3DOd4pvmRBR2L\",\"verify_file\":\"\\/9885899112.txt\"}}', '1590647777', '1590721768');
INSERT INTO `ky_setting` VALUES ('5', 'pay', '支付设置', '{\"wx_appid\":\"wxe1b7737e3a0c7153\",\"wx_secret\":\"887bb389abbe27e69982576a96a515b3\",\"wx_merchant_id\":\"1449332102\",\"wx_key\":\"Tm44FMGt484Y44TjV34V3VG2ZEG4pf4f\",\"wx_cert_path\":\"\",\"wx_key_path\":\"\",\"wx_rsa_path\":\"\"}', '1595296451', '1596032218');
INSERT INTO `ky_setting` VALUES ('6', 'common', '其他设置', '{\"map_qq_key\":\"3EOBZ-JDO3O-N4UWO-SSK7I-OSQHJ-NHF4J\"}', '1596186578', '1596186578');

-- ----------------------------
-- Table structure for ky_upload_1
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
-- Records of ky_upload_1
-- ----------------------------
INSERT INTO `ky_upload_1` VALUES ('1', '1', '1-5ecd56c6e5929.jpg', '11.jpg', 'http://devhhb.images.huihuiba.net/1-5ecd56c6e5929.jpg', 'http://devhhb.images.huihuiba.net/1-5ecd56c6e5929.jpg', 'jpg', '15687', 'Qiniu', '1590515399', '1590515399', '1', 'cbe016efeadffe8a4b819f95f6d7b3ad', 'ee852572695da71d1e0215d064ae29762b20acb9');
INSERT INTO `ky_upload_1` VALUES ('2', '1', '1-5ecd5720d7058.png', '背景.png', 'http://devhhb.images.huihuiba.net/1-5ecd5720d7058.png', 'http://devhhb.images.huihuiba.net/1-5ecd5720d7058.png', 'png', '137491', 'Qiniu', '1590515489', '1590515489', '1', '19ebfbc55ce371f1a3d68785505e31e5', '2ca997c0edca501fb591a6be82b2f2a0b7142f63');

-- ----------------------------
-- Table structure for ky_upload_2
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
-- Records of ky_upload_2
-- ----------------------------
INSERT INTO `ky_upload_2` VALUES ('6', '1', '1-5ece208768287.jpg', 'Vue.jpg', './public/uploads/image/2020-05-27/1-5ece208768287.jpg', '/public/uploads/image/2020-05-27/1-5ece208768287.jpg', 'jpg', '5539', 'Local', '1590567047', '1590567047', '1', '035a63d22c22dc86b1f35fbd34b57155', 'd94c2c1a48b48527ec748c64c606a57a729b1581');
INSERT INTO `ky_upload_2` VALUES ('7', '1', '1-5ece2087777dd.jpg', 'wechat.jpg', './public/uploads/image/2020-05-27/1-5ece2087777dd.jpg', '/public/uploads/image/2020-05-27/1-5ece2087777dd.jpg', 'jpg', '8440', 'Local', '1590567047', '1590567047', '1', '4d86742fdd3e01d9881c61b4ba659134', '1f272f28a7102481c9b0f613864d8478812c6722');
INSERT INTO `ky_upload_2` VALUES ('8', '1', '1-5ece7c72a8f5f.png', 'wechat.png', 'http://devhhb.images.huihuiba.net/1-5ece7c72a8f5f.png', 'http://devhhb.images.huihuiba.net/1-5ece7c72a8f5f.png', 'png', '222143', 'Qiniu', '1590590579', '1590590579', '1', '85f24c89bcf394dfca8a9cce426c53b2', '818dc8098b309a240cd03795271aa96efb55147b');
INSERT INTO `ky_upload_2` VALUES ('9', '1', '1-5ed5f65807802.jpg', 'logo.jpg', 'http://devhhb.images.huihuiba.net/1-5ed5f65807802.jpg', 'http://devhhb.images.huihuiba.net/1-5ed5f65807802.jpg', 'jpg', '261242', 'Qiniu', '1591080537', '1591080537', '1', 'a1c517618f054d66b082f0b343f9410d', '06df1752c0515161f9f991b7ef2c507d8385130b');
INSERT INTO `ky_upload_2` VALUES ('10', '1', '1-5ed5f6b7e9d06.jpg', 'fdj-sm.jpg', 'http://devhhb.images.huihuiba.net/1-5ed5f6b7e9d06.jpg', 'http://devhhb.images.huihuiba.net/1-5ed5f6b7e9d06.jpg', 'jpg', '107027', 'Qiniu', '1591080632', '1591080632', '1', '77bb5769aba4bb70af1b57eb45c7c93e', '8682aea9a038a12539b5075a99bc87c5f350d956');

-- ----------------------------
-- Table structure for ky_upload_3
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
-- Records of ky_upload_3
-- ----------------------------

-- ----------------------------
-- Table structure for ky_upload_4
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
-- Records of ky_upload_4
-- ----------------------------

-- ----------------------------
-- Table structure for ky_upload_5
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

-- ----------------------------
-- Records of ky_upload_5
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
