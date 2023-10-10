/*
 Navicat Premium Data Transfer

 Source Server         : 本地mysql8
 Source Server Type    : MySQL
 Source Server Version : 80012 (8.0.12)
 Source Host           : localhost:3306
 Source Schema         : form_manage

 Target Server Type    : MySQL
 Target Server Version : 80012 (8.0.12)
 File Encoding         : 65001

 Date: 09/10/2023 19:26:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_p_page
-- ----------------------------
DROP TABLE IF EXISTS `sys_p_page`;
CREATE TABLE `sys_p_page`  (
  `page_id` int(11) NULL DEFAULT NULL,
  `previlege_id` int(11) NULL DEFAULT NULL
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of sys_p_page
-- ----------------------------
INSERT INTO `sys_p_page` VALUES (1, 1);
INSERT INTO `sys_p_page` VALUES (1, 2);
INSERT INTO `sys_p_page` VALUES (2, 1);
INSERT INTO `sys_p_page` VALUES (5, 1);
INSERT INTO `sys_p_page` VALUES (2, 2);
INSERT INTO `sys_p_page` VALUES (3, 2);
INSERT INTO `sys_p_page` VALUES (5, 2);
INSERT INTO `sys_p_page` VALUES (1, 3);
INSERT INTO `sys_p_page` VALUES (2, 3);
INSERT INTO `sys_p_page` VALUES (3, 3);
INSERT INTO `sys_p_page` VALUES (5, 3);
INSERT INTO `sys_p_page` VALUES (1, 4);
INSERT INTO `sys_p_page` VALUES (2, 4);
INSERT INTO `sys_p_page` VALUES (4, 4);
INSERT INTO `sys_p_page` VALUES (5, 4);

-- ----------------------------
-- Table structure for sys_page
-- ----------------------------
DROP TABLE IF EXISTS `sys_page`;
CREATE TABLE `sys_page`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `order` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_page
-- ----------------------------
INSERT INTO `sys_page` VALUES (1, '创建表单', '/createForm', '创建表单界面', 3);
INSERT INTO `sys_page` VALUES (2, '我的表单', '/finishForm', '查看自己的表单界面', 2);
INSERT INTO `sys_page` VALUES (3, '审批', '/auditForm', '审批表单界面', 4);
INSERT INTO `sys_page` VALUES (4, '执行', '/processForm', '执行表单', 5);
INSERT INTO `sys_page` VALUES (5, '门户界面', '/index', '门户界面', 1);

-- ----------------------------
-- Table structure for sys_previlege
-- ----------------------------
DROP TABLE IF EXISTS `sys_previlege`;
CREATE TABLE `sys_previlege`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `previlege` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '权限',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_previlege
-- ----------------------------
INSERT INTO `sys_previlege` VALUES (1, 'self', '操作自己的form');
INSERT INTO `sys_previlege` VALUES (2, 'approve', '审批表单');
INSERT INTO `sys_previlege` VALUES (3, 'assign', '指派staff完成表单');
INSERT INTO `sys_previlege` VALUES (4, 'performed', '执行表单');

-- ----------------------------
-- Table structure for sys_r_p
-- ----------------------------
DROP TABLE IF EXISTS `sys_r_p`;
CREATE TABLE `sys_r_p`  (
  `role_id` int(11) NOT NULL,
  `previlege_id` int(11) NOT NULL COMMENT '角色权限表，用来标记角色具有的权限'
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of sys_r_p
-- ----------------------------
INSERT INTO `sys_r_p` VALUES (1, 1);
INSERT INTO `sys_r_p` VALUES (2, 4);
INSERT INTO `sys_r_p` VALUES (2, 1);
INSERT INTO `sys_r_p` VALUES (3, 2);
INSERT INTO `sys_r_p` VALUES (3, 3);
INSERT INTO `sys_r_p` VALUES (3, 1);
INSERT INTO `sys_r_p` VALUES (4, 1);
INSERT INTO `sys_r_p` VALUES (4, 2);
INSERT INTO `sys_r_p` VALUES (4, 3);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'requester', '请求人');
INSERT INTO `sys_role` VALUES (2, 'staff', '员工');
INSERT INTO `sys_role` VALUES (3, 'approver', '审核员');
INSERT INTO `sys_role` VALUES (4, 'manager', '经理');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `enable` tinyint(1) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '这个是作为识别用户的主要的手段',
  `role` int(11) NULL DEFAULT 1 COMMENT '用户的角色',
  PRIMARY KEY (`id`, `email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1711107484072214531 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, NULL, NULL, NULL, NULL, '2023-10-09 00:01:16', NULL, '86153883@qq.com', 4);
INSERT INTO `sys_user` VALUES (1711095288684531714, NULL, NULL, NULL, NULL, '2023-10-09 03:04:42', NULL, '17640294266@163.com', 4);
INSERT INTO `sys_user` VALUES (1711107484072214530, NULL, NULL, NULL, NULL, '2023-10-09 03:53:09', NULL, '861538803@qq.com', 2);

-- ----------------------------
-- Table structure for tb_form
-- ----------------------------
DROP TABLE IF EXISTS `tb_form`;
CREATE TABLE `tb_form`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `approve` int(11) NULL DEFAULT 0 COMMENT '0 表示未操作\r\n1 表示批准\r\n-1 表示拒绝',
  `performed` int(11) NULL DEFAULT 0 COMMENT '0 表示未操作  1表示已经结束',
  `route` int(11) NULL DEFAULT NULL COMMENT '路由',
  `completed` int(11) NULL DEFAULT NULL COMMENT '0表示未完成 1 表示已经完成',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` bigint(11) NULL DEFAULT NULL,
  `target_time` datetime NULL DEFAULT NULL,
  `finish_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_form
-- ----------------------------
INSERT INTO `tb_form` VALUES (2, '是什么', 'asdasd', 1, 1, NULL, 1, '2023-10-06 23:10:04', NULL, '2023-10-09 17:48:14', '2023-10-08 17:51:47');
INSERT INTO `tb_form` VALUES (3, '是什么', 'asdasd', 1, 1, NULL, 1, '2023-10-07 23:10:06', NULL, '2023-10-09 17:48:17', '2023-10-13 17:51:50');
INSERT INTO `tb_form` VALUES (4, '大大所多', '啊实打实大', 1, 1, NULL, 1, '2023-10-06 23:30:39', NULL, '2023-10-09 17:48:20', '2023-10-27 17:51:53');
INSERT INTO `tb_form` VALUES (5, 'dasd', 'asdasd', 1, 1, NULL, 1, '2023-10-06 23:31:21', NULL, '2023-10-09 17:48:23', '2023-10-06 17:51:56');
INSERT INTO `tb_form` VALUES (6, '啊实打实大', '啊实打实大所大多', 1, 1, NULL, 1, '2023-10-07 00:03:30', NULL, '2023-10-09 17:48:26', '2023-09-30 17:52:00');
INSERT INTO `tb_form` VALUES (7, '阿打算从是阿女', '啊大大 ', 1, 1, NULL, 0, '2023-10-09 04:03:40', NULL, '2023-10-09 17:48:28', NULL);
INSERT INTO `tb_form` VALUES (8, '撒点撒多', '撒大声地', 1, 1, NULL, 0, '2023-10-09 04:05:22', NULL, '2023-10-09 17:48:31', NULL);
INSERT INTO `tb_form` VALUES (9, '阿的说法', '大大士大夫', 1, 1, NULL, 0, '2023-10-09 04:06:05', NULL, '2023-10-09 17:48:34', NULL);
INSERT INTO `tb_form` VALUES (10, '啊实打实多', '啊十大女', 1, 1, NULL, 0, '2023-10-09 04:07:32', NULL, NULL, NULL);
INSERT INTO `tb_form` VALUES (11, '啊实打实大所', '阿萨斯大所大所', 1, 1, NULL, 0, '2023-10-09 04:12:08', NULL, NULL, NULL);
INSERT INTO `tb_form` VALUES (12, '啊实打实', '啊实打实', 1, 1, NULL, 0, '2023-10-09 04:13:14', NULL, NULL, NULL);
INSERT INTO `tb_form` VALUES (13, '啊实打实大撒大', '大大', 1, 1, NULL, 0, '2023-10-09 04:15:16', NULL, NULL, '2023-10-09 00:00:00');
INSERT INTO `tb_form` VALUES (14, '啊实打实', '啊实打实', 1, 1, NULL, 0, '2023-10-09 04:15:16', NULL, NULL, '2023-10-09 00:00:00');
INSERT INTO `tb_form` VALUES (15, '啊实打实大', '啊实打实大', 1, 1, NULL, 1, '2023-10-09 04:22:27', 1711107484072214530, NULL, '2023-10-09 00:00:00');
INSERT INTO `tb_form` VALUES (16, 'asdasd', 'asdascascascsdcacasca', 1, 1, NULL, 1, '2023-10-09 04:23:36', 1711107484072214530, NULL, '2023-10-09 00:00:00');
INSERT INTO `tb_form` VALUES (17, 'asdadsd', 'asdasdasdasd', 1, 1, NULL, 1, '2023-10-09 04:25:02', 1711095288684531714, NULL, NULL);
INSERT INTO `tb_form` VALUES (18, '强无敌群翁去', '请问恶趣味群翁群翁群翁', 1, 1, NULL, 1, '2023-10-09 18:46:07', 1711107484072214530, '2023-10-11 00:00:00', '2023-10-09 00:00:00');
INSERT INTO `tb_form` VALUES (19, '吊袜带', '大声道撒大', 1, 1, NULL, 1, '2023-10-09 18:50:08', 1711107484072214530, '2023-10-05 00:00:00', '2023-10-09 00:00:00');
INSERT INTO `tb_form` VALUES (20, '迁安市多撒大所', '大青蛙多群无多群无多群无多群无', -1, 0, NULL, 0, '2023-10-09 18:53:22', 1711107484072214530, '2023-10-05 00:00:00', NULL);
INSERT INTO `tb_form` VALUES (21, '大叔大婶大', '鞍山市大傻傻的把我', 1, 1, NULL, 1, '2023-10-09 18:55:54', 1711107484072214530, '2023-10-05 00:00:00', '2023-10-09 00:00:00');
INSERT INTO `tb_form` VALUES (22, '大大啊阿打算', '啊实打实大撒大', 1, 1, NULL, 1, '2023-10-09 18:58:39', 1711107484072214530, '2023-10-27 00:00:00', '2023-10-09 00:00:00');

SET FOREIGN_KEY_CHECKS = 1;
