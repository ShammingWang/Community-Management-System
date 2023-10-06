/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : court2

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 03/05/2022 21:06:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for carport
-- ----------------------------
DROP TABLE IF EXISTS `carport`;
CREATE TABLE `carport`  (
  `zone_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '车位区号',
  `carport_id` int(0) UNSIGNED NOT NULL COMMENT '车位编号',
  `buyTime` datetime(0) NULL DEFAULT NULL COMMENT '购买时间',
  `room_zone` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '栋号',
  `room_id` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '套房号',
  `state` tinyint(0) NULL DEFAULT NULL COMMENT '是否可用',
  `price` int(0) NULL DEFAULT NULL COMMENT '售价',
  PRIMARY KEY (`zone_id`, `carport_id`) USING BTREE,
  INDEX `fk_carport_room`(`room_zone`, `room_id`) USING BTREE,
  CONSTRAINT `fk_carport_room` FOREIGN KEY (`room_zone`, `room_id`) REFERENCES `room` (`zone`, `id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carport
-- ----------------------------
INSERT INTO `carport` VALUES ('A', 1, '2022-04-26 20:56:13', 1, '710', 1, 1);
INSERT INTO `carport` VALUES ('A', 2, NULL, NULL, NULL, 0, 1);
INSERT INTO `carport` VALUES ('A', 3, '2022-04-21 22:52:49', 1, '810', 1, 1);
INSERT INTO `carport` VALUES ('A', 4, NULL, NULL, NULL, 0, 1);
INSERT INTO `carport` VALUES ('A', 5, NULL, NULL, NULL, 0, 1);
INSERT INTO `carport` VALUES ('A', 6, '2022-04-21 22:53:03', 1, '810', 1, 1);
INSERT INTO `carport` VALUES ('A', 7, '2022-04-28 00:07:49', 1, '810', 1, 1);
INSERT INTO `carport` VALUES ('A', 8, '2022-04-27 17:20:51', 1, '1005', 1, 1);

-- ----------------------------
-- Table structure for complain
-- ----------------------------
DROP TABLE IF EXISTS `complain`;
CREATE TABLE `complain`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '投诉号',
  `content` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '投诉内容',
  `submit_time` datetime(0) NOT NULL COMMENT '提交时间',
  `zone` int(0) UNSIGNED NOT NULL COMMENT '区号',
  `room_id` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '房间号',
  `handle_time` datetime(0) NULL DEFAULT NULL COMMENT '处理时间',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '投诉类型',
  `staff_username` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '处理人职工号',
  `state` tinyint(0) NULL DEFAULT NULL COMMENT '处理状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_complain_room`(`zone`, `room_id`) USING BTREE,
  INDEX `fk_complain_staff`(`staff_username`) USING BTREE,
  CONSTRAINT `fk_complain_room` FOREIGN KEY (`zone`, `room_id`) REFERENCES `room` (`zone`, `id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_complain_staff` FOREIGN KEY (`staff_username`) REFERENCES `staff` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of complain
-- ----------------------------
INSERT INTO `complain` VALUES (1, 'sss', '2022-04-20 23:48:51', 1, '1005', '2022-04-20 23:48:57', NULL, 'admin', 1);
INSERT INTO `complain` VALUES (2, 'ddd', '2022-04-21 22:02:56', 1, '810', '2022-04-26 17:53:07', '房屋质量问题', 'admin', 1);
INSERT INTO `complain` VALUES (3, '123', '2022-04-26 11:35:26', 1, '710', '2022-04-26 18:02:15', '房屋质量问题', 'admin', 1);
INSERT INTO `complain` VALUES (4, '123456789', '2022-04-26 18:19:12', 1, '710', '2022-04-26 18:19:48', '公共空间、公共场地', 'admin', 1);
INSERT INTO `complain` VALUES (5, '物业服务不到位', '2022-04-28 00:08:33', 1, '810', '2022-04-28 00:09:20', '物业服务不到位', 'admin', 1);
INSERT INTO `complain` VALUES (6, '噪音太大', '2022-04-29 17:27:21', 1, '1005', '2022-04-29 17:34:23', '小区四周的噪音污染', 'admin', 1);
INSERT INTO `complain` VALUES (7, '1233', '2022-05-02 23:31:02', 1, '1005', NULL, '房屋质量问题', NULL, 0);
INSERT INTO `complain` VALUES (8, '123', '2022-05-03 00:49:07', 1, '1005', NULL, '房屋质量问题', NULL, 0);
INSERT INTO `complain` VALUES (9, '123', '2022-05-03 11:35:16', 8, '512', NULL, '房屋质量问题', NULL, 0);

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `dno` int(0) NOT NULL COMMENT '部门号',
  `dept_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '部门名称',
  `manager` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '经理职工号',
  PRIMARY KEY (`dno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '业务部', NULL);
INSERT INTO `department` VALUES (2, '管理部', NULL);
INSERT INTO `department` VALUES (3, '修理部', NULL);

-- ----------------------------
-- Table structure for fee
-- ----------------------------
DROP TABLE IF EXISTS `fee`;
CREATE TABLE `fee`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '费用号',
  `fee_item_id` int(0) NULL DEFAULT NULL COMMENT '费用项目ID',
  `staff_username` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发布职工用户名',
  `time` datetime(0) NULL DEFAULT NULL COMMENT '缴费时间',
  `zone` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '缴费栋号',
  `room_id` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '缴费套房号',
  `state` tinyint(0) NULL DEFAULT NULL COMMENT '缴费状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_fee_staff`(`staff_username`) USING BTREE,
  INDEX `fk_fee_room`(`zone`, `room_id`) USING BTREE,
  INDEX `fk_fee_item`(`fee_item_id`) USING BTREE,
  CONSTRAINT `fk_fee_item` FOREIGN KEY (`fee_item_id`) REFERENCES `fee_item` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_fee_room` FOREIGN KEY (`zone`, `room_id`) REFERENCES `room` (`zone`, `id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_fee_staff` FOREIGN KEY (`staff_username`) REFERENCES `staff` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fee
-- ----------------------------
INSERT INTO `fee` VALUES (1, 1, 'admin', '2022-04-21 23:04:34', 1, '810', 1);
INSERT INTO `fee` VALUES (5, 4, 'admin', NULL, 1, '1005', 1);
INSERT INTO `fee` VALUES (6, 4, 'admin', NULL, 1, '710', 1);
INSERT INTO `fee` VALUES (7, 4, 'admin', NULL, 1, '810', 1);
INSERT INTO `fee` VALUES (8, 5, 'admin', NULL, 1, '1005', 1);
INSERT INTO `fee` VALUES (9, 5, 'admin', NULL, 1, '710', 1);
INSERT INTO `fee` VALUES (10, 5, 'admin', NULL, 1, '810', 1);
INSERT INTO `fee` VALUES (11, 6, 'zhangsan', NULL, 1, '1005', 1);
INSERT INTO `fee` VALUES (12, 6, 'zhangsan', NULL, 1, '710', 1);
INSERT INTO `fee` VALUES (13, 6, 'zhangsan', NULL, 1, '810', 1);
INSERT INTO `fee` VALUES (14, 7, 'zhangsan', '2022-04-27 14:23:21', 1, '1005', 1);
INSERT INTO `fee` VALUES (15, 7, 'zhangsan', '2022-04-27 14:23:21', 1, '710', 1);
INSERT INTO `fee` VALUES (16, 7, 'zhangsan', '2022-04-27 14:23:21', 1, '810', 1);
INSERT INTO `fee` VALUES (18, 9, 'zhangsan', '2022-04-27 17:28:49', 1, '1005', 1);
INSERT INTO `fee` VALUES (19, 9, 'zhangsan', '2022-04-27 17:28:49', 1, '710', 1);
INSERT INTO `fee` VALUES (20, 9, 'zhangsan', '2022-04-27 17:28:49', 1, '810', 1);
INSERT INTO `fee` VALUES (21, 10, 'admin', '2022-04-28 00:09:41', 1, '1005', 1);
INSERT INTO `fee` VALUES (22, 10, 'admin', '2022-04-28 00:09:41', 1, '710', 1);
INSERT INTO `fee` VALUES (23, 10, 'admin', '2022-04-28 00:09:41', 1, '810', 1);
INSERT INTO `fee` VALUES (24, 11, 'admin', '2022-04-29 17:24:24', 1, '1005', 1);
INSERT INTO `fee` VALUES (25, 11, 'admin', '2022-04-29 17:24:24', 1, '710', 1);
INSERT INTO `fee` VALUES (26, 11, 'admin', '2022-04-29 17:24:24', 1, '810', 0);
INSERT INTO `fee` VALUES (27, 12, 'ddddd', '2022-05-03 00:25:29', 1, '1005', 1);
INSERT INTO `fee` VALUES (28, 12, 'ddddd', '2022-05-03 00:25:29', 1, '710', 0);
INSERT INTO `fee` VALUES (29, 12, 'ddddd', '2022-05-03 00:25:29', 1, '810', 0);
INSERT INTO `fee` VALUES (30, 13, 'ddddd', '2022-05-03 00:52:53', 1, '1005', 0);
INSERT INTO `fee` VALUES (31, 13, 'ddddd', '2022-05-03 00:52:53', 1, '710', 0);
INSERT INTO `fee` VALUES (32, 13, 'ddddd', '2022-05-03 00:52:53', 1, '810', 0);
INSERT INTO `fee` VALUES (33, 14, 'ddddd', '2022-05-03 00:54:49', 1, '1005', 0);
INSERT INTO `fee` VALUES (34, 14, 'ddddd', '2022-05-03 00:54:49', 1, '710', 0);
INSERT INTO `fee` VALUES (35, 14, 'ddddd', '2022-05-03 00:54:49', 1, '810', 0);

-- ----------------------------
-- Table structure for fee_item
-- ----------------------------
DROP TABLE IF EXISTS `fee_item`;
CREATE TABLE `fee_item`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '费用项目ID',
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '费用名称',
  `money` int(0) NULL DEFAULT NULL COMMENT '费用金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fee_item
-- ----------------------------
INSERT INTO `fee_item` VALUES (1, '物业费', 100);
INSERT INTO `fee_item` VALUES (4, 'ddd', 11);
INSERT INTO `fee_item` VALUES (5, 'cc', 22);
INSERT INTO `fee_item` VALUES (6, '电费', 50);
INSERT INTO `fee_item` VALUES (7, 'fee1', 1);
INSERT INTO `fee_item` VALUES (9, 'fee2', 2);
INSERT INTO `fee_item` VALUES (10, 'fee3', 3);
INSERT INTO `fee_item` VALUES (11, 'fee4', 4);
INSERT INTO `fee_item` VALUES (12, 'fee5', 7);
INSERT INTO `fee_item` VALUES (13, 'fee6', 45);
INSERT INTO `fee_item` VALUES (14, 'fee7', 232);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '通知号',
  `content` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '通知内容',
  `time` datetime(0) NOT NULL COMMENT '通知时间',
  `staff_username` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发布职工用户名',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '状态',
  `zone` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '通知栋号',
  `room_id` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '通知套房号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_notice_staff`(`staff_username`) USING BTREE,
  INDEX `fk_notice_room`(`zone`, `room_id`) USING BTREE,
  CONSTRAINT `fk_notice_room` FOREIGN KEY (`zone`, `room_id`) REFERENCES `room` (`zone`, `id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_notice_staff` FOREIGN KEY (`staff_username`) REFERENCES `staff` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '请您及时缴纳相关费用，详情请到我的账单查看', '2022-04-23 15:47:12', 'admin', '已读', 1, '810');
INSERT INTO `notice` VALUES (2, '请您及时缴纳相关费用，详情请到我的账单查看', '2022-04-23 15:47:24', 'admin', '已读', 1, '810');
INSERT INTO `notice` VALUES (3, '请您及时缴纳相关费用，详情请到我的账单查看', '2022-04-23 15:49:18', 'admin', '已读', 1, '810');
INSERT INTO `notice` VALUES (4, '请您及时缴纳相关费用，详情请到我的账单查看', '2022-04-23 15:49:44', 'admin', '未阅读', 1, '810');
INSERT INTO `notice` VALUES (5, '请您及时缴纳相关费用，详情请到我的账单查看', '2022-04-23 15:50:40', 'admin', '未阅读', 1, '810');
INSERT INTO `notice` VALUES (6, '请您及时缴纳相关费用，详情请到我的账单查看', '2022-04-23 15:50:41', 'admin', '已读', 1, '710');
INSERT INTO `notice` VALUES (7, '请您及时缴纳相关费用，详情请到我的账单查看', '2022-04-23 15:50:42', 'admin', '已读', 1, '1005');
INSERT INTO `notice` VALUES (8, '请您及时缴纳相关费用，详情请到我的账单查看', '2022-04-26 18:15:44', 'admin', '未阅读', 1, '810');
INSERT INTO `notice` VALUES (9, '请您及时缴纳相关费用，详情请到我的账单查看', '2022-04-27 16:40:18', 'zhangsan', '已读', 1, '1005');
INSERT INTO `notice` VALUES (10, '请您及时缴纳相关费用，详情请到我的账单查看', '2022-04-27 16:41:01', 'zhangsan', '未阅读', 1, '810');
INSERT INTO `notice` VALUES (11, '请您及时缴纳相关费用，详情请到我的账单查看', '2022-04-27 17:15:42', 'zhangsan', '未阅读', 1, '810');
INSERT INTO `notice` VALUES (12, '请您及时缴纳相关费用，详情请到我的账单查看', '2022-04-27 17:16:08', 'zhangsan', '已读', 1, '1005');
INSERT INTO `notice` VALUES (13, '请您及时缴纳相关费用，详情请到我的账单查看', '2022-04-28 00:06:45', 'admin', '已读', 1, '810');
INSERT INTO `notice` VALUES (14, '请您及时缴纳相关费用，详情请到我的账单查看', '2022-04-28 00:10:59', 'admin', '已读', 1, '1005');
INSERT INTO `notice` VALUES (17, '请您及时缴纳相关费用，详情请到我的账单查看', '2022-04-29 17:34:40', 'admin', '已读', 1, '710');
INSERT INTO `notice` VALUES (18, '请您及时缴纳相关费用，详情请到我的账单查看', '2022-05-02 23:43:31', 'ddddd', '未阅读', 1, '810');
INSERT INTO `notice` VALUES (19, '请您及时缴纳相关费用，详情请到我的账单查看', '2022-05-03 00:26:48', 'ddddd', '未阅读', 1, '810');

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room`  (
  `zone` int(0) UNSIGNED NOT NULL COMMENT '栋号',
  `id` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '套房号',
  `username` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '业主用户名',
  `area` int(0) NULL DEFAULT NULL COMMENT '房间面积',
  `floor` int(0) NULL DEFAULT NULL COMMENT '楼层',
  `time` date NULL DEFAULT NULL COMMENT '入住时间',
  PRIMARY KEY (`zone`, `id`) USING BTREE,
  INDEX `fk_room_user`(`username`) USING BTREE,
  CONSTRAINT `fk_room_user` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES (1, '1001', NULL, 42, 10, NULL);
INSERT INTO `room` VALUES (1, '1002', NULL, 37, 10, NULL);
INSERT INTO `room` VALUES (1, '1003', NULL, 33, 10, NULL);
INSERT INTO `room` VALUES (1, '1004', NULL, 34, 10, NULL);
INSERT INTO `room` VALUES (1, '1005', 'hy', 25, 10, '2022-01-01');
INSERT INTO `room` VALUES (1, '1006', NULL, 38, 10, NULL);
INSERT INTO `room` VALUES (1, '1007', NULL, 32, 10, NULL);
INSERT INTO `room` VALUES (1, '1008', NULL, 33, 10, NULL);
INSERT INTO `room` VALUES (1, '1009', NULL, 33, 10, NULL);
INSERT INTO `room` VALUES (1, '101', NULL, 28, 1, NULL);
INSERT INTO `room` VALUES (1, '1010', NULL, 44, 10, NULL);
INSERT INTO `room` VALUES (1, '102', NULL, 43, 1, NULL);
INSERT INTO `room` VALUES (1, '103', NULL, 36, 1, NULL);
INSERT INTO `room` VALUES (1, '104', NULL, 40, 1, NULL);
INSERT INTO `room` VALUES (1, '105', NULL, 39, 1, NULL);
INSERT INTO `room` VALUES (1, '106', NULL, 38, 1, NULL);
INSERT INTO `room` VALUES (1, '107', NULL, 37, 1, NULL);
INSERT INTO `room` VALUES (1, '108', NULL, 31, 1, NULL);
INSERT INTO `room` VALUES (1, '109', NULL, 35, 1, NULL);
INSERT INTO `room` VALUES (1, '110', NULL, 28, 1, NULL);
INSERT INTO `room` VALUES (1, '201', NULL, 29, 2, NULL);
INSERT INTO `room` VALUES (1, '202', NULL, 38, 2, NULL);
INSERT INTO `room` VALUES (1, '203', NULL, 29, 2, NULL);
INSERT INTO `room` VALUES (1, '204', NULL, 43, 2, NULL);
INSERT INTO `room` VALUES (1, '205', NULL, 42, 2, NULL);
INSERT INTO `room` VALUES (1, '206', NULL, 38, 2, NULL);
INSERT INTO `room` VALUES (1, '207', NULL, 40, 2, NULL);
INSERT INTO `room` VALUES (1, '208', NULL, 37, 2, NULL);
INSERT INTO `room` VALUES (1, '209', NULL, 43, 2, NULL);
INSERT INTO `room` VALUES (1, '210', NULL, 34, 2, NULL);
INSERT INTO `room` VALUES (1, '301', NULL, 42, 3, NULL);
INSERT INTO `room` VALUES (1, '302', NULL, 41, 3, NULL);
INSERT INTO `room` VALUES (1, '303', NULL, 37, 3, NULL);
INSERT INTO `room` VALUES (1, '304', NULL, 40, 3, NULL);
INSERT INTO `room` VALUES (1, '305', NULL, 37, 3, NULL);
INSERT INTO `room` VALUES (1, '306', NULL, 34, 3, NULL);
INSERT INTO `room` VALUES (1, '307', NULL, 42, 3, NULL);
INSERT INTO `room` VALUES (1, '308', NULL, 34, 3, NULL);
INSERT INTO `room` VALUES (1, '309', NULL, 35, 3, NULL);
INSERT INTO `room` VALUES (1, '310', NULL, 43, 3, NULL);
INSERT INTO `room` VALUES (1, '401', NULL, 30, 4, NULL);
INSERT INTO `room` VALUES (1, '402', NULL, 30, 4, NULL);
INSERT INTO `room` VALUES (1, '403', NULL, 36, 4, NULL);
INSERT INTO `room` VALUES (1, '404', NULL, 37, 4, NULL);
INSERT INTO `room` VALUES (1, '405', NULL, 29, 4, NULL);
INSERT INTO `room` VALUES (1, '406', NULL, 28, 4, NULL);
INSERT INTO `room` VALUES (1, '407', NULL, 34, 4, NULL);
INSERT INTO `room` VALUES (1, '408', NULL, 30, 4, NULL);
INSERT INTO `room` VALUES (1, '409', NULL, 41, 4, NULL);
INSERT INTO `room` VALUES (1, '410', NULL, 33, 4, NULL);
INSERT INTO `room` VALUES (1, '501', NULL, 30, 5, NULL);
INSERT INTO `room` VALUES (1, '502', NULL, 29, 5, NULL);
INSERT INTO `room` VALUES (1, '503', NULL, 35, 5, NULL);
INSERT INTO `room` VALUES (1, '504', NULL, 37, 5, NULL);
INSERT INTO `room` VALUES (1, '505', NULL, 33, 5, NULL);
INSERT INTO `room` VALUES (1, '506', NULL, 32, 5, NULL);
INSERT INTO `room` VALUES (1, '507', NULL, 38, 5, NULL);
INSERT INTO `room` VALUES (1, '508', NULL, 40, 5, NULL);
INSERT INTO `room` VALUES (1, '509', NULL, 38, 5, NULL);
INSERT INTO `room` VALUES (1, '510', NULL, 43, 5, NULL);
INSERT INTO `room` VALUES (1, '601', NULL, 31, 6, NULL);
INSERT INTO `room` VALUES (1, '602', NULL, 43, 6, NULL);
INSERT INTO `room` VALUES (1, '603', NULL, 32, 6, NULL);
INSERT INTO `room` VALUES (1, '604', NULL, 33, 6, NULL);
INSERT INTO `room` VALUES (1, '605', NULL, 42, 6, NULL);
INSERT INTO `room` VALUES (1, '606', NULL, 32, 6, NULL);
INSERT INTO `room` VALUES (1, '607', NULL, 36, 6, NULL);
INSERT INTO `room` VALUES (1, '608', NULL, 44, 6, NULL);
INSERT INTO `room` VALUES (1, '609', NULL, 38, 6, NULL);
INSERT INTO `room` VALUES (1, '610', NULL, 36, 6, NULL);
INSERT INTO `room` VALUES (1, '701', NULL, 44, 7, NULL);
INSERT INTO `room` VALUES (1, '702', NULL, 33, 7, NULL);
INSERT INTO `room` VALUES (1, '703', NULL, 37, 7, NULL);
INSERT INTO `room` VALUES (1, '704', NULL, 38, 7, NULL);
INSERT INTO `room` VALUES (1, '705', NULL, 28, 7, NULL);
INSERT INTO `room` VALUES (1, '706', NULL, 37, 7, NULL);
INSERT INTO `room` VALUES (1, '707', NULL, 32, 7, NULL);
INSERT INTO `room` VALUES (1, '708', NULL, 39, 7, NULL);
INSERT INTO `room` VALUES (1, '709', NULL, 35, 7, NULL);
INSERT INTO `room` VALUES (1, '710', 'gsl', 32, 7, '2022-01-01');
INSERT INTO `room` VALUES (1, '801', NULL, 38, 8, NULL);
INSERT INTO `room` VALUES (1, '802', NULL, 44, 8, NULL);
INSERT INTO `room` VALUES (1, '803', NULL, 38, 8, NULL);
INSERT INTO `room` VALUES (1, '804', NULL, 37, 8, NULL);
INSERT INTO `room` VALUES (1, '805', NULL, 40, 8, NULL);
INSERT INTO `room` VALUES (1, '806', NULL, 34, 8, NULL);
INSERT INTO `room` VALUES (1, '807', NULL, 31, 8, NULL);
INSERT INTO `room` VALUES (1, '808', NULL, 42, 8, NULL);
INSERT INTO `room` VALUES (1, '809', NULL, 33, 8, NULL);
INSERT INTO `room` VALUES (1, '810', 'drj', 32, 8, '2022-01-01');
INSERT INTO `room` VALUES (1, '901', NULL, 42, 9, NULL);
INSERT INTO `room` VALUES (1, '902', NULL, 33, 9, NULL);
INSERT INTO `room` VALUES (1, '903', NULL, 40, 9, NULL);
INSERT INTO `room` VALUES (1, '904', NULL, 28, 9, NULL);
INSERT INTO `room` VALUES (1, '905', NULL, 36, 9, NULL);
INSERT INTO `room` VALUES (1, '906', NULL, 36, 9, NULL);
INSERT INTO `room` VALUES (1, '907', NULL, 43, 9, NULL);
INSERT INTO `room` VALUES (1, '908', NULL, 30, 9, NULL);
INSERT INTO `room` VALUES (1, '909', NULL, 35, 9, NULL);
INSERT INTO `room` VALUES (1, '910', NULL, 32, 9, NULL);
INSERT INTO `room` VALUES (2, '1001', NULL, 38, 10, NULL);
INSERT INTO `room` VALUES (2, '1002', NULL, 40, 10, NULL);
INSERT INTO `room` VALUES (2, '1003', NULL, 40, 10, NULL);
INSERT INTO `room` VALUES (2, '1004', NULL, 30, 10, NULL);
INSERT INTO `room` VALUES (2, '1005', NULL, 39, 10, NULL);
INSERT INTO `room` VALUES (2, '1006', NULL, 37, 10, NULL);
INSERT INTO `room` VALUES (2, '1007', NULL, 35, 10, NULL);
INSERT INTO `room` VALUES (2, '1008', NULL, 39, 10, NULL);
INSERT INTO `room` VALUES (2, '1009', NULL, 30, 10, NULL);
INSERT INTO `room` VALUES (2, '101', NULL, 44, 1, NULL);
INSERT INTO `room` VALUES (2, '1010', NULL, 30, 10, NULL);
INSERT INTO `room` VALUES (2, '102', NULL, 28, 1, NULL);
INSERT INTO `room` VALUES (2, '103', NULL, 37, 1, NULL);
INSERT INTO `room` VALUES (2, '104', NULL, 44, 1, NULL);
INSERT INTO `room` VALUES (2, '105', NULL, 35, 1, NULL);
INSERT INTO `room` VALUES (2, '106', NULL, 36, 1, NULL);
INSERT INTO `room` VALUES (2, '107', NULL, 31, 1, NULL);
INSERT INTO `room` VALUES (2, '108', NULL, 40, 1, NULL);
INSERT INTO `room` VALUES (2, '109', NULL, 44, 1, NULL);
INSERT INTO `room` VALUES (2, '110', NULL, 29, 1, NULL);
INSERT INTO `room` VALUES (2, '201', NULL, 39, 2, NULL);
INSERT INTO `room` VALUES (2, '202', NULL, 34, 2, NULL);
INSERT INTO `room` VALUES (2, '203', NULL, 42, 2, NULL);
INSERT INTO `room` VALUES (2, '204', NULL, 29, 2, NULL);
INSERT INTO `room` VALUES (2, '205', NULL, 30, 2, NULL);
INSERT INTO `room` VALUES (2, '206', NULL, 31, 2, NULL);
INSERT INTO `room` VALUES (2, '207', NULL, 43, 2, NULL);
INSERT INTO `room` VALUES (2, '208', NULL, 34, 2, NULL);
INSERT INTO `room` VALUES (2, '209', NULL, 32, 2, NULL);
INSERT INTO `room` VALUES (2, '210', NULL, 35, 2, NULL);
INSERT INTO `room` VALUES (2, '301', NULL, 28, 3, NULL);
INSERT INTO `room` VALUES (2, '302', NULL, 37, 3, NULL);
INSERT INTO `room` VALUES (2, '303', NULL, 36, 3, NULL);
INSERT INTO `room` VALUES (2, '304', NULL, 41, 3, NULL);
INSERT INTO `room` VALUES (2, '305', NULL, 42, 3, NULL);
INSERT INTO `room` VALUES (2, '306', NULL, 34, 3, NULL);
INSERT INTO `room` VALUES (2, '307', NULL, 42, 3, NULL);
INSERT INTO `room` VALUES (2, '308', NULL, 40, 3, NULL);
INSERT INTO `room` VALUES (2, '309', NULL, 42, 3, NULL);
INSERT INTO `room` VALUES (2, '310', NULL, 39, 3, NULL);
INSERT INTO `room` VALUES (2, '401', NULL, 44, 4, NULL);
INSERT INTO `room` VALUES (2, '402', NULL, 36, 4, NULL);
INSERT INTO `room` VALUES (2, '403', NULL, 43, 4, NULL);
INSERT INTO `room` VALUES (2, '404', NULL, 28, 4, NULL);
INSERT INTO `room` VALUES (2, '405', NULL, 38, 4, NULL);
INSERT INTO `room` VALUES (2, '406', NULL, 40, 4, NULL);
INSERT INTO `room` VALUES (2, '407', NULL, 39, 4, NULL);
INSERT INTO `room` VALUES (2, '408', NULL, 29, 4, NULL);
INSERT INTO `room` VALUES (2, '409', NULL, 32, 4, NULL);
INSERT INTO `room` VALUES (2, '410', NULL, 32, 4, NULL);
INSERT INTO `room` VALUES (2, '501', NULL, 30, 5, NULL);
INSERT INTO `room` VALUES (2, '502', NULL, 32, 5, NULL);
INSERT INTO `room` VALUES (2, '503', NULL, 38, 5, NULL);
INSERT INTO `room` VALUES (2, '504', NULL, 36, 5, NULL);
INSERT INTO `room` VALUES (2, '505', NULL, 33, 5, NULL);
INSERT INTO `room` VALUES (2, '506', NULL, 42, 5, NULL);
INSERT INTO `room` VALUES (2, '507', NULL, 35, 5, NULL);
INSERT INTO `room` VALUES (2, '508', NULL, 31, 5, NULL);
INSERT INTO `room` VALUES (2, '509', NULL, 40, 5, NULL);
INSERT INTO `room` VALUES (2, '510', NULL, 31, 5, NULL);
INSERT INTO `room` VALUES (2, '601', NULL, 42, 6, NULL);
INSERT INTO `room` VALUES (2, '602', NULL, 31, 6, NULL);
INSERT INTO `room` VALUES (2, '603', NULL, 43, 6, NULL);
INSERT INTO `room` VALUES (2, '604', NULL, 41, 6, NULL);
INSERT INTO `room` VALUES (2, '605', NULL, 35, 6, NULL);
INSERT INTO `room` VALUES (2, '606', NULL, 38, 6, NULL);
INSERT INTO `room` VALUES (2, '607', NULL, 41, 6, NULL);
INSERT INTO `room` VALUES (2, '608', NULL, 35, 6, NULL);
INSERT INTO `room` VALUES (2, '609', NULL, 30, 6, NULL);
INSERT INTO `room` VALUES (2, '610', NULL, 42, 6, NULL);
INSERT INTO `room` VALUES (2, '701', NULL, 34, 7, NULL);
INSERT INTO `room` VALUES (2, '702', NULL, 32, 7, NULL);
INSERT INTO `room` VALUES (2, '703', NULL, 38, 7, NULL);
INSERT INTO `room` VALUES (2, '704', NULL, 28, 7, NULL);
INSERT INTO `room` VALUES (2, '705', NULL, 38, 7, NULL);
INSERT INTO `room` VALUES (2, '706', NULL, 30, 7, NULL);
INSERT INTO `room` VALUES (2, '707', NULL, 42, 7, NULL);
INSERT INTO `room` VALUES (2, '708', NULL, 37, 7, NULL);
INSERT INTO `room` VALUES (2, '709', NULL, 39, 7, NULL);
INSERT INTO `room` VALUES (2, '710', NULL, 29, 7, NULL);
INSERT INTO `room` VALUES (2, '801', NULL, 30, 8, NULL);
INSERT INTO `room` VALUES (2, '802', NULL, 32, 8, NULL);
INSERT INTO `room` VALUES (2, '803', NULL, 34, 8, NULL);
INSERT INTO `room` VALUES (2, '804', NULL, 28, 8, NULL);
INSERT INTO `room` VALUES (2, '805', NULL, 41, 8, NULL);
INSERT INTO `room` VALUES (2, '806', NULL, 28, 8, NULL);
INSERT INTO `room` VALUES (2, '807', NULL, 32, 8, NULL);
INSERT INTO `room` VALUES (2, '808', NULL, 34, 8, NULL);
INSERT INTO `room` VALUES (2, '809', NULL, 38, 8, NULL);
INSERT INTO `room` VALUES (2, '810', NULL, 34, 8, NULL);
INSERT INTO `room` VALUES (2, '901', NULL, 43, 9, NULL);
INSERT INTO `room` VALUES (2, '902', NULL, 32, 9, NULL);
INSERT INTO `room` VALUES (2, '903', NULL, 43, 9, NULL);
INSERT INTO `room` VALUES (2, '904', NULL, 30, 9, NULL);
INSERT INTO `room` VALUES (2, '905', NULL, 44, 9, NULL);
INSERT INTO `room` VALUES (2, '906', NULL, 36, 9, NULL);
INSERT INTO `room` VALUES (2, '907', NULL, 35, 9, NULL);
INSERT INTO `room` VALUES (2, '908', NULL, 33, 9, NULL);
INSERT INTO `room` VALUES (2, '909', NULL, 36, 9, NULL);
INSERT INTO `room` VALUES (2, '910', NULL, 37, 9, NULL);
INSERT INTO `room` VALUES (3, '1001', NULL, 33, 10, NULL);
INSERT INTO `room` VALUES (3, '1002', NULL, 30, 10, NULL);
INSERT INTO `room` VALUES (3, '1003', NULL, 42, 10, NULL);
INSERT INTO `room` VALUES (3, '1004', NULL, 36, 10, NULL);
INSERT INTO `room` VALUES (3, '1005', NULL, 42, 10, NULL);
INSERT INTO `room` VALUES (3, '1006', NULL, 40, 10, NULL);
INSERT INTO `room` VALUES (3, '1007', NULL, 39, 10, NULL);
INSERT INTO `room` VALUES (3, '1008', NULL, 36, 10, NULL);
INSERT INTO `room` VALUES (3, '1009', NULL, 43, 10, NULL);
INSERT INTO `room` VALUES (3, '101', NULL, 28, 1, NULL);
INSERT INTO `room` VALUES (3, '1010', NULL, 28, 10, NULL);
INSERT INTO `room` VALUES (3, '102', NULL, 33, 1, NULL);
INSERT INTO `room` VALUES (3, '103', NULL, 34, 1, NULL);
INSERT INTO `room` VALUES (3, '104', NULL, 42, 1, NULL);
INSERT INTO `room` VALUES (3, '105', NULL, 41, 1, NULL);
INSERT INTO `room` VALUES (3, '106', NULL, 42, 1, NULL);
INSERT INTO `room` VALUES (3, '107', NULL, 41, 1, NULL);
INSERT INTO `room` VALUES (3, '108', NULL, 41, 1, NULL);
INSERT INTO `room` VALUES (3, '109', NULL, 38, 1, NULL);
INSERT INTO `room` VALUES (3, '110', NULL, 36, 1, NULL);
INSERT INTO `room` VALUES (3, '1111', 'wsm', 12, 1, '2022-05-03');
INSERT INTO `room` VALUES (3, '201', NULL, 40, 2, NULL);
INSERT INTO `room` VALUES (3, '202', NULL, 35, 2, NULL);
INSERT INTO `room` VALUES (3, '203', NULL, 32, 2, NULL);
INSERT INTO `room` VALUES (3, '204', NULL, 31, 2, NULL);
INSERT INTO `room` VALUES (3, '205', NULL, 40, 2, NULL);
INSERT INTO `room` VALUES (3, '206', NULL, 37, 2, NULL);
INSERT INTO `room` VALUES (3, '207', NULL, 33, 2, NULL);
INSERT INTO `room` VALUES (3, '208', NULL, 28, 2, NULL);
INSERT INTO `room` VALUES (3, '209', NULL, 43, 2, NULL);
INSERT INTO `room` VALUES (3, '210', NULL, 42, 2, NULL);
INSERT INTO `room` VALUES (3, '301', NULL, 29, 3, NULL);
INSERT INTO `room` VALUES (3, '302', NULL, 33, 3, NULL);
INSERT INTO `room` VALUES (3, '303', NULL, 36, 3, NULL);
INSERT INTO `room` VALUES (3, '304', NULL, 41, 3, NULL);
INSERT INTO `room` VALUES (3, '305', NULL, 37, 3, NULL);
INSERT INTO `room` VALUES (3, '306', NULL, 37, 3, NULL);
INSERT INTO `room` VALUES (3, '307', NULL, 39, 3, NULL);
INSERT INTO `room` VALUES (3, '308', NULL, 37, 3, NULL);
INSERT INTO `room` VALUES (3, '309', NULL, 37, 3, NULL);
INSERT INTO `room` VALUES (3, '310', NULL, 38, 3, NULL);
INSERT INTO `room` VALUES (3, '401', NULL, 35, 4, NULL);
INSERT INTO `room` VALUES (3, '402', NULL, 36, 4, NULL);
INSERT INTO `room` VALUES (3, '403', NULL, 28, 4, NULL);
INSERT INTO `room` VALUES (3, '404', NULL, 39, 4, NULL);
INSERT INTO `room` VALUES (3, '405', NULL, 32, 4, NULL);
INSERT INTO `room` VALUES (3, '406', NULL, 36, 4, NULL);
INSERT INTO `room` VALUES (3, '407', NULL, 34, 4, NULL);
INSERT INTO `room` VALUES (3, '408', NULL, 34, 4, NULL);
INSERT INTO `room` VALUES (3, '409', NULL, 31, 4, NULL);
INSERT INTO `room` VALUES (3, '410', NULL, 34, 4, NULL);
INSERT INTO `room` VALUES (3, '501', NULL, 42, 5, NULL);
INSERT INTO `room` VALUES (3, '502', NULL, 40, 5, NULL);
INSERT INTO `room` VALUES (3, '503', NULL, 28, 5, NULL);
INSERT INTO `room` VALUES (3, '504', NULL, 28, 5, NULL);
INSERT INTO `room` VALUES (3, '505', NULL, 40, 5, NULL);
INSERT INTO `room` VALUES (3, '506', NULL, 29, 5, NULL);
INSERT INTO `room` VALUES (3, '507', NULL, 38, 5, NULL);
INSERT INTO `room` VALUES (3, '508', NULL, 35, 5, NULL);
INSERT INTO `room` VALUES (3, '509', NULL, 39, 5, NULL);
INSERT INTO `room` VALUES (3, '510', NULL, 30, 5, NULL);
INSERT INTO `room` VALUES (3, '601', NULL, 42, 6, NULL);
INSERT INTO `room` VALUES (3, '602', NULL, 32, 6, NULL);
INSERT INTO `room` VALUES (3, '603', NULL, 29, 6, NULL);
INSERT INTO `room` VALUES (3, '604', NULL, 41, 6, NULL);
INSERT INTO `room` VALUES (3, '605', NULL, 40, 6, NULL);
INSERT INTO `room` VALUES (3, '606', NULL, 29, 6, NULL);
INSERT INTO `room` VALUES (3, '607', NULL, 34, 6, NULL);
INSERT INTO `room` VALUES (3, '608', NULL, 37, 6, NULL);
INSERT INTO `room` VALUES (3, '609', NULL, 28, 6, NULL);
INSERT INTO `room` VALUES (3, '610', NULL, 40, 6, NULL);
INSERT INTO `room` VALUES (3, '701', NULL, 35, 7, NULL);
INSERT INTO `room` VALUES (3, '702', NULL, 34, 7, NULL);
INSERT INTO `room` VALUES (3, '703', NULL, 40, 7, NULL);
INSERT INTO `room` VALUES (3, '704', NULL, 39, 7, NULL);
INSERT INTO `room` VALUES (3, '705', NULL, 43, 7, NULL);
INSERT INTO `room` VALUES (3, '706', NULL, 34, 7, NULL);
INSERT INTO `room` VALUES (3, '707', NULL, 38, 7, NULL);
INSERT INTO `room` VALUES (3, '708', NULL, 36, 7, NULL);
INSERT INTO `room` VALUES (3, '709', NULL, 32, 7, NULL);
INSERT INTO `room` VALUES (3, '710', NULL, 28, 7, NULL);
INSERT INTO `room` VALUES (3, '801', NULL, 43, 8, NULL);
INSERT INTO `room` VALUES (3, '802', NULL, 44, 8, NULL);
INSERT INTO `room` VALUES (3, '803', NULL, 33, 8, NULL);
INSERT INTO `room` VALUES (3, '804', NULL, 32, 8, NULL);
INSERT INTO `room` VALUES (3, '805', NULL, 43, 8, NULL);
INSERT INTO `room` VALUES (3, '806', NULL, 42, 8, NULL);
INSERT INTO `room` VALUES (3, '807', NULL, 37, 8, NULL);
INSERT INTO `room` VALUES (3, '808', NULL, 29, 8, NULL);
INSERT INTO `room` VALUES (3, '809', NULL, 41, 8, NULL);
INSERT INTO `room` VALUES (3, '810', NULL, 35, 8, NULL);
INSERT INTO `room` VALUES (3, '901', NULL, 35, 9, NULL);
INSERT INTO `room` VALUES (3, '902', NULL, 43, 9, NULL);
INSERT INTO `room` VALUES (3, '903', NULL, 38, 9, NULL);
INSERT INTO `room` VALUES (3, '904', NULL, 30, 9, NULL);
INSERT INTO `room` VALUES (3, '905', NULL, 29, 9, NULL);
INSERT INTO `room` VALUES (3, '906', NULL, 34, 9, NULL);
INSERT INTO `room` VALUES (3, '907', NULL, 32, 9, NULL);
INSERT INTO `room` VALUES (3, '908', NULL, 34, 9, NULL);
INSERT INTO `room` VALUES (3, '909', NULL, 38, 9, NULL);
INSERT INTO `room` VALUES (3, '910', NULL, 40, 9, NULL);
INSERT INTO `room` VALUES (4, '1001', NULL, 29, 10, NULL);
INSERT INTO `room` VALUES (4, '1002', NULL, 36, 10, NULL);
INSERT INTO `room` VALUES (4, '1003', NULL, 36, 10, NULL);
INSERT INTO `room` VALUES (4, '1004', NULL, 40, 10, NULL);
INSERT INTO `room` VALUES (4, '1005', NULL, 41, 10, NULL);
INSERT INTO `room` VALUES (4, '1006', NULL, 44, 10, NULL);
INSERT INTO `room` VALUES (4, '1007', NULL, 43, 10, NULL);
INSERT INTO `room` VALUES (4, '1008', NULL, 35, 10, NULL);
INSERT INTO `room` VALUES (4, '1009', NULL, 41, 10, NULL);
INSERT INTO `room` VALUES (4, '101', NULL, 37, 1, NULL);
INSERT INTO `room` VALUES (4, '1010', NULL, 36, 10, NULL);
INSERT INTO `room` VALUES (4, '102', NULL, 28, 1, NULL);
INSERT INTO `room` VALUES (4, '103', NULL, 33, 1, NULL);
INSERT INTO `room` VALUES (4, '104', NULL, 43, 1, NULL);
INSERT INTO `room` VALUES (4, '105', NULL, 32, 1, NULL);
INSERT INTO `room` VALUES (4, '106', NULL, 34, 1, NULL);
INSERT INTO `room` VALUES (4, '107', NULL, 39, 1, NULL);
INSERT INTO `room` VALUES (4, '108', NULL, 33, 1, NULL);
INSERT INTO `room` VALUES (4, '109', NULL, 30, 1, NULL);
INSERT INTO `room` VALUES (4, '110', NULL, 33, 1, NULL);
INSERT INTO `room` VALUES (4, '201', NULL, 36, 2, NULL);
INSERT INTO `room` VALUES (4, '202', NULL, 30, 2, NULL);
INSERT INTO `room` VALUES (4, '203', NULL, 42, 2, NULL);
INSERT INTO `room` VALUES (4, '204', NULL, 31, 2, NULL);
INSERT INTO `room` VALUES (4, '205', NULL, 34, 2, NULL);
INSERT INTO `room` VALUES (4, '206', NULL, 42, 2, NULL);
INSERT INTO `room` VALUES (4, '207', NULL, 41, 2, NULL);
INSERT INTO `room` VALUES (4, '208', NULL, 39, 2, NULL);
INSERT INTO `room` VALUES (4, '209', NULL, 33, 2, NULL);
INSERT INTO `room` VALUES (4, '210', NULL, 40, 2, NULL);
INSERT INTO `room` VALUES (4, '301', NULL, 32, 3, NULL);
INSERT INTO `room` VALUES (4, '302', NULL, 44, 3, NULL);
INSERT INTO `room` VALUES (4, '303', NULL, 28, 3, NULL);
INSERT INTO `room` VALUES (4, '304', NULL, 41, 3, NULL);
INSERT INTO `room` VALUES (4, '305', NULL, 33, 3, NULL);
INSERT INTO `room` VALUES (4, '306', NULL, 36, 3, NULL);
INSERT INTO `room` VALUES (4, '307', NULL, 36, 3, NULL);
INSERT INTO `room` VALUES (4, '308', NULL, 29, 3, NULL);
INSERT INTO `room` VALUES (4, '309', NULL, 41, 3, NULL);
INSERT INTO `room` VALUES (4, '310', NULL, 34, 3, NULL);
INSERT INTO `room` VALUES (4, '401', NULL, 44, 4, NULL);
INSERT INTO `room` VALUES (4, '402', NULL, 29, 4, NULL);
INSERT INTO `room` VALUES (4, '403', NULL, 34, 4, NULL);
INSERT INTO `room` VALUES (4, '404', NULL, 34, 4, NULL);
INSERT INTO `room` VALUES (4, '405', NULL, 38, 4, NULL);
INSERT INTO `room` VALUES (4, '406', NULL, 39, 4, NULL);
INSERT INTO `room` VALUES (4, '407', NULL, 31, 4, NULL);
INSERT INTO `room` VALUES (4, '408', NULL, 34, 4, NULL);
INSERT INTO `room` VALUES (4, '409', NULL, 29, 4, NULL);
INSERT INTO `room` VALUES (4, '410', NULL, 42, 4, NULL);
INSERT INTO `room` VALUES (4, '501', NULL, 39, 5, NULL);
INSERT INTO `room` VALUES (4, '502', NULL, 36, 5, NULL);
INSERT INTO `room` VALUES (4, '503', NULL, 33, 5, NULL);
INSERT INTO `room` VALUES (4, '504', NULL, 34, 5, NULL);
INSERT INTO `room` VALUES (4, '505', NULL, 43, 5, NULL);
INSERT INTO `room` VALUES (4, '506', NULL, 40, 5, NULL);
INSERT INTO `room` VALUES (4, '507', NULL, 31, 5, NULL);
INSERT INTO `room` VALUES (4, '508', NULL, 40, 5, NULL);
INSERT INTO `room` VALUES (4, '509', NULL, 34, 5, NULL);
INSERT INTO `room` VALUES (4, '510', NULL, 37, 5, NULL);
INSERT INTO `room` VALUES (4, '601', NULL, 39, 6, NULL);
INSERT INTO `room` VALUES (4, '602', NULL, 35, 6, NULL);
INSERT INTO `room` VALUES (4, '603', NULL, 36, 6, NULL);
INSERT INTO `room` VALUES (4, '604', NULL, 44, 6, NULL);
INSERT INTO `room` VALUES (4, '605', NULL, 35, 6, NULL);
INSERT INTO `room` VALUES (4, '606', NULL, 40, 6, NULL);
INSERT INTO `room` VALUES (4, '607', NULL, 41, 6, NULL);
INSERT INTO `room` VALUES (4, '608', NULL, 29, 6, NULL);
INSERT INTO `room` VALUES (4, '609', NULL, 38, 6, NULL);
INSERT INTO `room` VALUES (4, '610', NULL, 40, 6, NULL);
INSERT INTO `room` VALUES (4, '701', NULL, 28, 7, NULL);
INSERT INTO `room` VALUES (4, '702', NULL, 40, 7, NULL);
INSERT INTO `room` VALUES (4, '703', NULL, 38, 7, NULL);
INSERT INTO `room` VALUES (4, '704', NULL, 38, 7, NULL);
INSERT INTO `room` VALUES (4, '705', NULL, 43, 7, NULL);
INSERT INTO `room` VALUES (4, '706', NULL, 36, 7, NULL);
INSERT INTO `room` VALUES (4, '707', NULL, 43, 7, NULL);
INSERT INTO `room` VALUES (4, '708', NULL, 28, 7, NULL);
INSERT INTO `room` VALUES (4, '709', NULL, 33, 7, NULL);
INSERT INTO `room` VALUES (4, '710', NULL, 38, 7, NULL);
INSERT INTO `room` VALUES (4, '801', NULL, 33, 8, NULL);
INSERT INTO `room` VALUES (4, '802', NULL, 29, 8, NULL);
INSERT INTO `room` VALUES (4, '803', NULL, 43, 8, NULL);
INSERT INTO `room` VALUES (4, '804', NULL, 28, 8, NULL);
INSERT INTO `room` VALUES (4, '805', NULL, 30, 8, NULL);
INSERT INTO `room` VALUES (4, '806', NULL, 43, 8, NULL);
INSERT INTO `room` VALUES (4, '807', NULL, 42, 8, NULL);
INSERT INTO `room` VALUES (4, '808', NULL, 37, 8, NULL);
INSERT INTO `room` VALUES (4, '809', NULL, 32, 8, NULL);
INSERT INTO `room` VALUES (4, '810', NULL, 30, 8, NULL);
INSERT INTO `room` VALUES (4, '901', NULL, 42, 9, NULL);
INSERT INTO `room` VALUES (4, '902', NULL, 42, 9, NULL);
INSERT INTO `room` VALUES (4, '903', NULL, 32, 9, NULL);
INSERT INTO `room` VALUES (4, '904', NULL, 36, 9, NULL);
INSERT INTO `room` VALUES (4, '905', NULL, 32, 9, NULL);
INSERT INTO `room` VALUES (4, '906', NULL, 31, 9, NULL);
INSERT INTO `room` VALUES (4, '907', NULL, 38, 9, NULL);
INSERT INTO `room` VALUES (4, '908', NULL, 28, 9, NULL);
INSERT INTO `room` VALUES (4, '909', NULL, 36, 9, NULL);
INSERT INTO `room` VALUES (4, '910', NULL, 28, 9, NULL);
INSERT INTO `room` VALUES (5, '1001', NULL, 31, 10, NULL);
INSERT INTO `room` VALUES (5, '1002', NULL, 40, 10, NULL);
INSERT INTO `room` VALUES (5, '1003', NULL, 38, 10, NULL);
INSERT INTO `room` VALUES (5, '1004', NULL, 41, 10, NULL);
INSERT INTO `room` VALUES (5, '1005', NULL, 30, 10, NULL);
INSERT INTO `room` VALUES (5, '1006', NULL, 32, 10, NULL);
INSERT INTO `room` VALUES (5, '1007', NULL, 39, 10, NULL);
INSERT INTO `room` VALUES (5, '1008', NULL, 42, 10, NULL);
INSERT INTO `room` VALUES (5, '1009', NULL, 31, 10, NULL);
INSERT INTO `room` VALUES (5, '101', NULL, 44, 1, NULL);
INSERT INTO `room` VALUES (5, '1010', NULL, 35, 10, NULL);
INSERT INTO `room` VALUES (5, '102', NULL, 38, 1, NULL);
INSERT INTO `room` VALUES (5, '103', NULL, 30, 1, NULL);
INSERT INTO `room` VALUES (5, '104', NULL, 31, 1, NULL);
INSERT INTO `room` VALUES (5, '105', NULL, 31, 1, NULL);
INSERT INTO `room` VALUES (5, '106', NULL, 34, 1, NULL);
INSERT INTO `room` VALUES (5, '107', NULL, 36, 1, NULL);
INSERT INTO `room` VALUES (5, '108', NULL, 37, 1, NULL);
INSERT INTO `room` VALUES (5, '109', NULL, 39, 1, NULL);
INSERT INTO `room` VALUES (5, '110', NULL, 41, 1, NULL);
INSERT INTO `room` VALUES (5, '201', NULL, 40, 2, NULL);
INSERT INTO `room` VALUES (5, '202', NULL, 40, 2, NULL);
INSERT INTO `room` VALUES (5, '203', NULL, 41, 2, NULL);
INSERT INTO `room` VALUES (5, '204', NULL, 30, 2, NULL);
INSERT INTO `room` VALUES (5, '205', NULL, 43, 2, NULL);
INSERT INTO `room` VALUES (5, '206', NULL, 29, 2, NULL);
INSERT INTO `room` VALUES (5, '207', NULL, 38, 2, NULL);
INSERT INTO `room` VALUES (5, '208', NULL, 39, 2, NULL);
INSERT INTO `room` VALUES (5, '209', NULL, 38, 2, NULL);
INSERT INTO `room` VALUES (5, '210', NULL, 29, 2, NULL);
INSERT INTO `room` VALUES (5, '301', NULL, 30, 3, NULL);
INSERT INTO `room` VALUES (5, '302', NULL, 31, 3, NULL);
INSERT INTO `room` VALUES (5, '303', NULL, 39, 3, NULL);
INSERT INTO `room` VALUES (5, '304', NULL, 41, 3, NULL);
INSERT INTO `room` VALUES (5, '305', NULL, 42, 3, NULL);
INSERT INTO `room` VALUES (5, '306', NULL, 31, 3, NULL);
INSERT INTO `room` VALUES (5, '307', NULL, 28, 3, NULL);
INSERT INTO `room` VALUES (5, '308', NULL, 42, 3, NULL);
INSERT INTO `room` VALUES (5, '309', NULL, 32, 3, NULL);
INSERT INTO `room` VALUES (5, '310', NULL, 31, 3, NULL);
INSERT INTO `room` VALUES (5, '401', NULL, 41, 4, NULL);
INSERT INTO `room` VALUES (5, '402', NULL, 39, 4, NULL);
INSERT INTO `room` VALUES (5, '403', NULL, 28, 4, NULL);
INSERT INTO `room` VALUES (5, '404', NULL, 37, 4, NULL);
INSERT INTO `room` VALUES (5, '405', NULL, 41, 4, NULL);
INSERT INTO `room` VALUES (5, '406', NULL, 41, 4, NULL);
INSERT INTO `room` VALUES (5, '407', NULL, 41, 4, NULL);
INSERT INTO `room` VALUES (5, '408', NULL, 29, 4, NULL);
INSERT INTO `room` VALUES (5, '409', NULL, 30, 4, NULL);
INSERT INTO `room` VALUES (5, '410', NULL, 42, 4, NULL);
INSERT INTO `room` VALUES (5, '501', NULL, 30, 5, NULL);
INSERT INTO `room` VALUES (5, '502', NULL, 31, 5, NULL);
INSERT INTO `room` VALUES (5, '503', NULL, 39, 5, NULL);
INSERT INTO `room` VALUES (5, '504', NULL, 35, 5, NULL);
INSERT INTO `room` VALUES (5, '505', NULL, 41, 5, NULL);
INSERT INTO `room` VALUES (5, '506', NULL, 39, 5, NULL);
INSERT INTO `room` VALUES (5, '507', NULL, 44, 5, NULL);
INSERT INTO `room` VALUES (5, '508', NULL, 36, 5, NULL);
INSERT INTO `room` VALUES (5, '509', NULL, 32, 5, NULL);
INSERT INTO `room` VALUES (5, '510', NULL, 36, 5, NULL);
INSERT INTO `room` VALUES (5, '601', NULL, 32, 6, NULL);
INSERT INTO `room` VALUES (5, '602', NULL, 39, 6, NULL);
INSERT INTO `room` VALUES (5, '603', NULL, 39, 6, NULL);
INSERT INTO `room` VALUES (5, '604', NULL, 40, 6, NULL);
INSERT INTO `room` VALUES (5, '605', NULL, 30, 6, NULL);
INSERT INTO `room` VALUES (5, '606', NULL, 41, 6, NULL);
INSERT INTO `room` VALUES (5, '607', NULL, 33, 6, NULL);
INSERT INTO `room` VALUES (5, '608', NULL, 33, 6, NULL);
INSERT INTO `room` VALUES (5, '609', NULL, 29, 6, NULL);
INSERT INTO `room` VALUES (5, '610', NULL, 36, 6, NULL);
INSERT INTO `room` VALUES (5, '701', NULL, 38, 7, NULL);
INSERT INTO `room` VALUES (5, '702', NULL, 40, 7, NULL);
INSERT INTO `room` VALUES (5, '703', NULL, 41, 7, NULL);
INSERT INTO `room` VALUES (5, '704', NULL, 36, 7, NULL);
INSERT INTO `room` VALUES (5, '705', NULL, 37, 7, NULL);
INSERT INTO `room` VALUES (5, '706', NULL, 33, 7, NULL);
INSERT INTO `room` VALUES (5, '707', NULL, 28, 7, NULL);
INSERT INTO `room` VALUES (5, '708', NULL, 42, 7, NULL);
INSERT INTO `room` VALUES (5, '709', NULL, 36, 7, NULL);
INSERT INTO `room` VALUES (5, '710', NULL, 31, 7, NULL);
INSERT INTO `room` VALUES (5, '801', NULL, 41, 8, NULL);
INSERT INTO `room` VALUES (5, '802', NULL, 41, 8, NULL);
INSERT INTO `room` VALUES (5, '803', NULL, 38, 8, NULL);
INSERT INTO `room` VALUES (5, '804', NULL, 44, 8, NULL);
INSERT INTO `room` VALUES (5, '805', NULL, 32, 8, NULL);
INSERT INTO `room` VALUES (5, '806', NULL, 44, 8, NULL);
INSERT INTO `room` VALUES (5, '807', NULL, 35, 8, NULL);
INSERT INTO `room` VALUES (5, '808', NULL, 30, 8, NULL);
INSERT INTO `room` VALUES (5, '809', NULL, 32, 8, NULL);
INSERT INTO `room` VALUES (5, '810', NULL, 44, 8, NULL);
INSERT INTO `room` VALUES (5, '901', NULL, 38, 9, NULL);
INSERT INTO `room` VALUES (5, '902', NULL, 32, 9, NULL);
INSERT INTO `room` VALUES (5, '903', NULL, 28, 9, NULL);
INSERT INTO `room` VALUES (5, '904', NULL, 40, 9, NULL);
INSERT INTO `room` VALUES (5, '905', NULL, 34, 9, NULL);
INSERT INTO `room` VALUES (5, '906', NULL, 43, 9, NULL);
INSERT INTO `room` VALUES (5, '907', NULL, 29, 9, NULL);
INSERT INTO `room` VALUES (5, '908', NULL, 29, 9, NULL);
INSERT INTO `room` VALUES (5, '909', NULL, 28, 9, NULL);
INSERT INTO `room` VALUES (5, '910', NULL, 33, 9, NULL);
INSERT INTO `room` VALUES (6, '1001', NULL, 32, 10, NULL);
INSERT INTO `room` VALUES (6, '1002', NULL, 33, 10, NULL);
INSERT INTO `room` VALUES (6, '1003', NULL, 33, 10, NULL);
INSERT INTO `room` VALUES (6, '1004', NULL, 41, 10, NULL);
INSERT INTO `room` VALUES (6, '1005', NULL, 34, 10, NULL);
INSERT INTO `room` VALUES (6, '1006', NULL, 30, 10, NULL);
INSERT INTO `room` VALUES (6, '1007', NULL, 33, 10, NULL);
INSERT INTO `room` VALUES (6, '1008', NULL, 38, 10, NULL);
INSERT INTO `room` VALUES (6, '1009', NULL, 44, 10, NULL);
INSERT INTO `room` VALUES (6, '101', NULL, 35, 1, NULL);
INSERT INTO `room` VALUES (6, '1010', NULL, 38, 10, NULL);
INSERT INTO `room` VALUES (6, '102', NULL, 36, 1, NULL);
INSERT INTO `room` VALUES (6, '103', NULL, 39, 1, NULL);
INSERT INTO `room` VALUES (6, '104', NULL, 39, 1, NULL);
INSERT INTO `room` VALUES (6, '105', NULL, 42, 1, NULL);
INSERT INTO `room` VALUES (6, '106', NULL, 43, 1, NULL);
INSERT INTO `room` VALUES (6, '107', NULL, 32, 1, NULL);
INSERT INTO `room` VALUES (6, '108', NULL, 34, 1, NULL);
INSERT INTO `room` VALUES (6, '109', NULL, 29, 1, NULL);
INSERT INTO `room` VALUES (6, '110', NULL, 31, 1, NULL);
INSERT INTO `room` VALUES (6, '201', NULL, 31, 2, NULL);
INSERT INTO `room` VALUES (6, '202', NULL, 33, 2, NULL);
INSERT INTO `room` VALUES (6, '203', NULL, 34, 2, NULL);
INSERT INTO `room` VALUES (6, '204', NULL, 30, 2, NULL);
INSERT INTO `room` VALUES (6, '205', NULL, 29, 2, NULL);
INSERT INTO `room` VALUES (6, '206', NULL, 38, 2, NULL);
INSERT INTO `room` VALUES (6, '207', NULL, 39, 2, NULL);
INSERT INTO `room` VALUES (6, '208', NULL, 44, 2, NULL);
INSERT INTO `room` VALUES (6, '209', NULL, 38, 2, NULL);
INSERT INTO `room` VALUES (6, '210', NULL, 41, 2, NULL);
INSERT INTO `room` VALUES (6, '301', NULL, 39, 3, NULL);
INSERT INTO `room` VALUES (6, '302', NULL, 43, 3, NULL);
INSERT INTO `room` VALUES (6, '303', NULL, 32, 3, NULL);
INSERT INTO `room` VALUES (6, '304', NULL, 38, 3, NULL);
INSERT INTO `room` VALUES (6, '305', NULL, 32, 3, NULL);
INSERT INTO `room` VALUES (6, '306', NULL, 32, 3, NULL);
INSERT INTO `room` VALUES (6, '307', NULL, 28, 3, NULL);
INSERT INTO `room` VALUES (6, '308', NULL, 36, 3, NULL);
INSERT INTO `room` VALUES (6, '309', NULL, 42, 3, NULL);
INSERT INTO `room` VALUES (6, '310', NULL, 41, 3, NULL);
INSERT INTO `room` VALUES (6, '401', NULL, 31, 4, NULL);
INSERT INTO `room` VALUES (6, '402', NULL, 28, 4, NULL);
INSERT INTO `room` VALUES (6, '403', NULL, 38, 4, NULL);
INSERT INTO `room` VALUES (6, '404', NULL, 28, 4, NULL);
INSERT INTO `room` VALUES (6, '405', NULL, 35, 4, NULL);
INSERT INTO `room` VALUES (6, '406', NULL, 43, 4, NULL);
INSERT INTO `room` VALUES (6, '407', NULL, 32, 4, NULL);
INSERT INTO `room` VALUES (6, '408', NULL, 35, 4, NULL);
INSERT INTO `room` VALUES (6, '409', NULL, 39, 4, NULL);
INSERT INTO `room` VALUES (6, '410', NULL, 28, 4, NULL);
INSERT INTO `room` VALUES (6, '501', NULL, 35, 5, NULL);
INSERT INTO `room` VALUES (6, '502', NULL, 39, 5, NULL);
INSERT INTO `room` VALUES (6, '503', NULL, 39, 5, NULL);
INSERT INTO `room` VALUES (6, '504', NULL, 32, 5, NULL);
INSERT INTO `room` VALUES (6, '505', NULL, 31, 5, NULL);
INSERT INTO `room` VALUES (6, '506', NULL, 38, 5, NULL);
INSERT INTO `room` VALUES (6, '507', NULL, 28, 5, NULL);
INSERT INTO `room` VALUES (6, '508', NULL, 38, 5, NULL);
INSERT INTO `room` VALUES (6, '509', NULL, 28, 5, NULL);
INSERT INTO `room` VALUES (6, '510', NULL, 40, 5, NULL);
INSERT INTO `room` VALUES (6, '601', NULL, 37, 6, NULL);
INSERT INTO `room` VALUES (6, '602', NULL, 32, 6, NULL);
INSERT INTO `room` VALUES (6, '603', NULL, 34, 6, NULL);
INSERT INTO `room` VALUES (6, '604', NULL, 41, 6, NULL);
INSERT INTO `room` VALUES (6, '605', NULL, 39, 6, NULL);
INSERT INTO `room` VALUES (6, '606', NULL, 41, 6, NULL);
INSERT INTO `room` VALUES (6, '607', NULL, 32, 6, NULL);
INSERT INTO `room` VALUES (6, '608', NULL, 32, 6, NULL);
INSERT INTO `room` VALUES (6, '609', NULL, 42, 6, NULL);
INSERT INTO `room` VALUES (6, '610', NULL, 39, 6, NULL);
INSERT INTO `room` VALUES (6, '701', NULL, 41, 7, NULL);
INSERT INTO `room` VALUES (6, '702', NULL, 41, 7, NULL);
INSERT INTO `room` VALUES (6, '703', NULL, 31, 7, NULL);
INSERT INTO `room` VALUES (6, '704', NULL, 40, 7, NULL);
INSERT INTO `room` VALUES (6, '705', NULL, 28, 7, NULL);
INSERT INTO `room` VALUES (6, '706', NULL, 38, 7, NULL);
INSERT INTO `room` VALUES (6, '707', NULL, 44, 7, NULL);
INSERT INTO `room` VALUES (6, '708', NULL, 35, 7, NULL);
INSERT INTO `room` VALUES (6, '709', NULL, 34, 7, NULL);
INSERT INTO `room` VALUES (6, '710', NULL, 31, 7, NULL);
INSERT INTO `room` VALUES (6, '801', NULL, 32, 8, NULL);
INSERT INTO `room` VALUES (6, '802', NULL, 41, 8, NULL);
INSERT INTO `room` VALUES (6, '803', NULL, 36, 8, NULL);
INSERT INTO `room` VALUES (6, '804', NULL, 32, 8, NULL);
INSERT INTO `room` VALUES (6, '805', NULL, 30, 8, NULL);
INSERT INTO `room` VALUES (6, '806', NULL, 41, 8, NULL);
INSERT INTO `room` VALUES (6, '807', NULL, 30, 8, NULL);
INSERT INTO `room` VALUES (6, '808', NULL, 37, 8, NULL);
INSERT INTO `room` VALUES (6, '809', NULL, 36, 8, NULL);
INSERT INTO `room` VALUES (6, '810', NULL, 39, 8, NULL);
INSERT INTO `room` VALUES (6, '901', NULL, 29, 9, NULL);
INSERT INTO `room` VALUES (6, '902', NULL, 32, 9, NULL);
INSERT INTO `room` VALUES (6, '903', NULL, 37, 9, NULL);
INSERT INTO `room` VALUES (6, '904', NULL, 44, 9, NULL);
INSERT INTO `room` VALUES (6, '905', NULL, 33, 9, NULL);
INSERT INTO `room` VALUES (6, '906', NULL, 35, 9, NULL);
INSERT INTO `room` VALUES (6, '907', NULL, 38, 9, NULL);
INSERT INTO `room` VALUES (6, '908', NULL, 31, 9, NULL);
INSERT INTO `room` VALUES (6, '909', NULL, 33, 9, NULL);
INSERT INTO `room` VALUES (6, '910', NULL, 44, 9, NULL);
INSERT INTO `room` VALUES (7, '1001', NULL, 29, 10, NULL);
INSERT INTO `room` VALUES (7, '1002', NULL, 41, 10, NULL);
INSERT INTO `room` VALUES (7, '1003', NULL, 38, 10, NULL);
INSERT INTO `room` VALUES (7, '1004', NULL, 43, 10, NULL);
INSERT INTO `room` VALUES (7, '1005', NULL, 43, 10, NULL);
INSERT INTO `room` VALUES (7, '1006', NULL, 35, 10, NULL);
INSERT INTO `room` VALUES (7, '1007', NULL, 30, 10, NULL);
INSERT INTO `room` VALUES (7, '1008', NULL, 39, 10, NULL);
INSERT INTO `room` VALUES (7, '1009', NULL, 43, 10, NULL);
INSERT INTO `room` VALUES (7, '101', NULL, 43, 1, NULL);
INSERT INTO `room` VALUES (7, '1010', NULL, 32, 10, NULL);
INSERT INTO `room` VALUES (7, '102', NULL, 41, 1, NULL);
INSERT INTO `room` VALUES (7, '103', NULL, 39, 1, NULL);
INSERT INTO `room` VALUES (7, '104', NULL, 41, 1, NULL);
INSERT INTO `room` VALUES (7, '105', NULL, 40, 1, NULL);
INSERT INTO `room` VALUES (7, '106', NULL, 44, 1, NULL);
INSERT INTO `room` VALUES (7, '107', NULL, 36, 1, NULL);
INSERT INTO `room` VALUES (7, '108', NULL, 42, 1, NULL);
INSERT INTO `room` VALUES (7, '109', NULL, 32, 1, NULL);
INSERT INTO `room` VALUES (7, '110', NULL, 40, 1, NULL);
INSERT INTO `room` VALUES (7, '201', NULL, 43, 2, NULL);
INSERT INTO `room` VALUES (7, '202', NULL, 33, 2, NULL);
INSERT INTO `room` VALUES (7, '203', NULL, 44, 2, NULL);
INSERT INTO `room` VALUES (7, '204', NULL, 30, 2, NULL);
INSERT INTO `room` VALUES (7, '205', NULL, 39, 2, NULL);
INSERT INTO `room` VALUES (7, '206', NULL, 43, 2, NULL);
INSERT INTO `room` VALUES (7, '207', NULL, 43, 2, NULL);
INSERT INTO `room` VALUES (7, '208', NULL, 29, 2, NULL);
INSERT INTO `room` VALUES (7, '209', NULL, 42, 2, NULL);
INSERT INTO `room` VALUES (7, '210', NULL, 37, 2, NULL);
INSERT INTO `room` VALUES (7, '301', NULL, 42, 3, NULL);
INSERT INTO `room` VALUES (7, '302', NULL, 40, 3, NULL);
INSERT INTO `room` VALUES (7, '303', NULL, 43, 3, NULL);
INSERT INTO `room` VALUES (7, '304', NULL, 42, 3, NULL);
INSERT INTO `room` VALUES (7, '305', NULL, 43, 3, NULL);
INSERT INTO `room` VALUES (7, '306', NULL, 33, 3, NULL);
INSERT INTO `room` VALUES (7, '307', NULL, 38, 3, NULL);
INSERT INTO `room` VALUES (7, '308', NULL, 44, 3, NULL);
INSERT INTO `room` VALUES (7, '309', NULL, 30, 3, NULL);
INSERT INTO `room` VALUES (7, '310', NULL, 28, 3, NULL);
INSERT INTO `room` VALUES (7, '401', NULL, 37, 4, NULL);
INSERT INTO `room` VALUES (7, '402', NULL, 39, 4, NULL);
INSERT INTO `room` VALUES (7, '403', NULL, 43, 4, NULL);
INSERT INTO `room` VALUES (7, '404', NULL, 34, 4, NULL);
INSERT INTO `room` VALUES (7, '405', NULL, 31, 4, NULL);
INSERT INTO `room` VALUES (7, '406', NULL, 34, 4, NULL);
INSERT INTO `room` VALUES (7, '407', NULL, 31, 4, NULL);
INSERT INTO `room` VALUES (7, '408', NULL, 41, 4, NULL);
INSERT INTO `room` VALUES (7, '409', NULL, 34, 4, NULL);
INSERT INTO `room` VALUES (7, '410', NULL, 37, 4, NULL);
INSERT INTO `room` VALUES (7, '456', NULL, 300, 3, NULL);
INSERT INTO `room` VALUES (7, '501', NULL, 32, 5, NULL);
INSERT INTO `room` VALUES (7, '502', NULL, 44, 5, NULL);
INSERT INTO `room` VALUES (7, '503', NULL, 40, 5, NULL);
INSERT INTO `room` VALUES (7, '504', NULL, 31, 5, NULL);
INSERT INTO `room` VALUES (7, '505', NULL, 43, 5, NULL);
INSERT INTO `room` VALUES (7, '506', NULL, 37, 5, NULL);
INSERT INTO `room` VALUES (7, '507', NULL, 34, 5, NULL);
INSERT INTO `room` VALUES (7, '508', NULL, 35, 5, NULL);
INSERT INTO `room` VALUES (7, '509', NULL, 38, 5, NULL);
INSERT INTO `room` VALUES (7, '510', NULL, 43, 5, NULL);
INSERT INTO `room` VALUES (7, '601', NULL, 32, 6, NULL);
INSERT INTO `room` VALUES (7, '602', NULL, 33, 6, NULL);
INSERT INTO `room` VALUES (7, '603', NULL, 44, 6, NULL);
INSERT INTO `room` VALUES (7, '604', NULL, 43, 6, NULL);
INSERT INTO `room` VALUES (7, '605', NULL, 28, 6, NULL);
INSERT INTO `room` VALUES (7, '606', NULL, 35, 6, NULL);
INSERT INTO `room` VALUES (7, '607', NULL, 37, 6, NULL);
INSERT INTO `room` VALUES (7, '608', NULL, 37, 6, NULL);
INSERT INTO `room` VALUES (7, '609', NULL, 39, 6, NULL);
INSERT INTO `room` VALUES (7, '610', NULL, 36, 6, NULL);
INSERT INTO `room` VALUES (7, '701', NULL, 44, 7, NULL);
INSERT INTO `room` VALUES (7, '702', NULL, 33, 7, NULL);
INSERT INTO `room` VALUES (7, '703', NULL, 36, 7, NULL);
INSERT INTO `room` VALUES (7, '704', NULL, 30, 7, NULL);
INSERT INTO `room` VALUES (7, '705', NULL, 40, 7, NULL);
INSERT INTO `room` VALUES (7, '706', NULL, 29, 7, NULL);
INSERT INTO `room` VALUES (7, '707', NULL, 43, 7, NULL);
INSERT INTO `room` VALUES (7, '708', NULL, 37, 7, NULL);
INSERT INTO `room` VALUES (7, '709', NULL, 32, 7, NULL);
INSERT INTO `room` VALUES (7, '710', NULL, 33, 7, NULL);
INSERT INTO `room` VALUES (7, '801', NULL, 42, 8, NULL);
INSERT INTO `room` VALUES (7, '802', NULL, 43, 8, NULL);
INSERT INTO `room` VALUES (7, '803', NULL, 37, 8, NULL);
INSERT INTO `room` VALUES (7, '804', NULL, 36, 8, NULL);
INSERT INTO `room` VALUES (7, '805', NULL, 30, 8, NULL);
INSERT INTO `room` VALUES (7, '806', NULL, 37, 8, NULL);
INSERT INTO `room` VALUES (7, '807', NULL, 40, 8, NULL);
INSERT INTO `room` VALUES (7, '808', NULL, 41, 8, NULL);
INSERT INTO `room` VALUES (7, '809', NULL, 38, 8, NULL);
INSERT INTO `room` VALUES (7, '810', NULL, 28, 8, NULL);
INSERT INTO `room` VALUES (7, '901', NULL, 34, 9, NULL);
INSERT INTO `room` VALUES (7, '902', NULL, 33, 9, NULL);
INSERT INTO `room` VALUES (7, '903', NULL, 30, 9, NULL);
INSERT INTO `room` VALUES (7, '904', NULL, 35, 9, NULL);
INSERT INTO `room` VALUES (7, '905', NULL, 29, 9, NULL);
INSERT INTO `room` VALUES (7, '906', NULL, 33, 9, NULL);
INSERT INTO `room` VALUES (7, '907', NULL, 40, 9, NULL);
INSERT INTO `room` VALUES (7, '908', NULL, 28, 9, NULL);
INSERT INTO `room` VALUES (7, '909', NULL, 29, 9, NULL);
INSERT INTO `room` VALUES (7, '910', NULL, 37, 9, NULL);
INSERT INTO `room` VALUES (8, '1001', NULL, 40, 10, NULL);
INSERT INTO `room` VALUES (8, '1002', NULL, 28, 10, NULL);
INSERT INTO `room` VALUES (8, '1003', NULL, 35, 10, NULL);
INSERT INTO `room` VALUES (8, '1004', NULL, 28, 10, NULL);
INSERT INTO `room` VALUES (8, '1005', NULL, 38, 10, NULL);
INSERT INTO `room` VALUES (8, '1006', NULL, 39, 10, NULL);
INSERT INTO `room` VALUES (8, '1007', NULL, 42, 10, NULL);
INSERT INTO `room` VALUES (8, '1008', NULL, 40, 10, NULL);
INSERT INTO `room` VALUES (8, '1009', NULL, 28, 10, NULL);
INSERT INTO `room` VALUES (8, '101', NULL, 39, 1, NULL);
INSERT INTO `room` VALUES (8, '1010', NULL, 42, 10, NULL);
INSERT INTO `room` VALUES (8, '102', NULL, 40, 1, NULL);
INSERT INTO `room` VALUES (8, '103', NULL, 30, 1, NULL);
INSERT INTO `room` VALUES (8, '104', NULL, 29, 1, NULL);
INSERT INTO `room` VALUES (8, '105', NULL, 29, 1, NULL);
INSERT INTO `room` VALUES (8, '106', NULL, 35, 1, NULL);
INSERT INTO `room` VALUES (8, '107', NULL, 39, 1, NULL);
INSERT INTO `room` VALUES (8, '108', NULL, 32, 1, NULL);
INSERT INTO `room` VALUES (8, '109', NULL, 44, 1, NULL);
INSERT INTO `room` VALUES (8, '110', NULL, 34, 1, NULL);
INSERT INTO `room` VALUES (8, '201', NULL, 41, 2, NULL);
INSERT INTO `room` VALUES (8, '202', NULL, 31, 2, NULL);
INSERT INTO `room` VALUES (8, '203', NULL, 40, 2, NULL);
INSERT INTO `room` VALUES (8, '204', NULL, 28, 2, NULL);
INSERT INTO `room` VALUES (8, '205', NULL, 28, 2, NULL);
INSERT INTO `room` VALUES (8, '206', NULL, 30, 2, NULL);
INSERT INTO `room` VALUES (8, '207', NULL, 40, 2, NULL);
INSERT INTO `room` VALUES (8, '208', NULL, 32, 2, NULL);
INSERT INTO `room` VALUES (8, '209', NULL, 31, 2, NULL);
INSERT INTO `room` VALUES (8, '210', NULL, 42, 2, NULL);
INSERT INTO `room` VALUES (8, '301', NULL, 33, 3, NULL);
INSERT INTO `room` VALUES (8, '302', NULL, 37, 3, NULL);
INSERT INTO `room` VALUES (8, '303', NULL, 29, 3, NULL);
INSERT INTO `room` VALUES (8, '304', NULL, 33, 3, NULL);
INSERT INTO `room` VALUES (8, '305', NULL, 30, 3, NULL);
INSERT INTO `room` VALUES (8, '306', NULL, 38, 3, NULL);
INSERT INTO `room` VALUES (8, '307', NULL, 44, 3, NULL);
INSERT INTO `room` VALUES (8, '308', NULL, 34, 3, NULL);
INSERT INTO `room` VALUES (8, '309', NULL, 32, 3, NULL);
INSERT INTO `room` VALUES (8, '310', NULL, 29, 3, NULL);
INSERT INTO `room` VALUES (8, '401', NULL, 41, 4, NULL);
INSERT INTO `room` VALUES (8, '402', NULL, 37, 4, NULL);
INSERT INTO `room` VALUES (8, '403', NULL, 37, 4, NULL);
INSERT INTO `room` VALUES (8, '404', NULL, 30, 4, NULL);
INSERT INTO `room` VALUES (8, '405', NULL, 35, 4, NULL);
INSERT INTO `room` VALUES (8, '406', NULL, 41, 4, NULL);
INSERT INTO `room` VALUES (8, '407', NULL, 41, 4, NULL);
INSERT INTO `room` VALUES (8, '408', NULL, 38, 4, NULL);
INSERT INTO `room` VALUES (8, '409', NULL, 31, 4, NULL);
INSERT INTO `room` VALUES (8, '410', NULL, 43, 4, NULL);
INSERT INTO `room` VALUES (8, '501', NULL, 41, 5, NULL);
INSERT INTO `room` VALUES (8, '502', NULL, 29, 5, NULL);
INSERT INTO `room` VALUES (8, '503', NULL, 34, 5, NULL);
INSERT INTO `room` VALUES (8, '504', NULL, 32, 5, NULL);
INSERT INTO `room` VALUES (8, '505', NULL, 32, 5, NULL);
INSERT INTO `room` VALUES (8, '506', NULL, 31, 5, NULL);
INSERT INTO `room` VALUES (8, '507', NULL, 28, 5, NULL);
INSERT INTO `room` VALUES (8, '508', NULL, 39, 5, NULL);
INSERT INTO `room` VALUES (8, '509', NULL, 39, 5, NULL);
INSERT INTO `room` VALUES (8, '510', NULL, 41, 5, NULL);
INSERT INTO `room` VALUES (8, '512', 'csl', 200, 5, '2022-05-03');
INSERT INTO `room` VALUES (8, '601', NULL, 33, 6, NULL);
INSERT INTO `room` VALUES (8, '602', NULL, 30, 6, NULL);
INSERT INTO `room` VALUES (8, '603', NULL, 37, 6, NULL);
INSERT INTO `room` VALUES (8, '604', NULL, 38, 6, NULL);
INSERT INTO `room` VALUES (8, '605', NULL, 44, 6, NULL);
INSERT INTO `room` VALUES (8, '606', NULL, 36, 6, NULL);
INSERT INTO `room` VALUES (8, '607', NULL, 42, 6, NULL);
INSERT INTO `room` VALUES (8, '608', NULL, 30, 6, NULL);
INSERT INTO `room` VALUES (8, '609', NULL, 39, 6, NULL);
INSERT INTO `room` VALUES (8, '610', NULL, 30, 6, NULL);
INSERT INTO `room` VALUES (8, '701', NULL, 35, 7, NULL);
INSERT INTO `room` VALUES (8, '702', NULL, 33, 7, NULL);
INSERT INTO `room` VALUES (8, '703', NULL, 35, 7, NULL);
INSERT INTO `room` VALUES (8, '704', NULL, 37, 7, NULL);
INSERT INTO `room` VALUES (8, '705', NULL, 40, 7, NULL);
INSERT INTO `room` VALUES (8, '706', NULL, 34, 7, NULL);
INSERT INTO `room` VALUES (8, '707', NULL, 32, 7, NULL);
INSERT INTO `room` VALUES (8, '708', NULL, 29, 7, NULL);
INSERT INTO `room` VALUES (8, '709', NULL, 35, 7, NULL);
INSERT INTO `room` VALUES (8, '710', NULL, 44, 7, NULL);
INSERT INTO `room` VALUES (8, '801', NULL, 44, 8, NULL);
INSERT INTO `room` VALUES (8, '802', NULL, 34, 8, NULL);
INSERT INTO `room` VALUES (8, '803', NULL, 43, 8, NULL);
INSERT INTO `room` VALUES (8, '804', NULL, 31, 8, NULL);
INSERT INTO `room` VALUES (8, '805', NULL, 28, 8, NULL);
INSERT INTO `room` VALUES (8, '806', NULL, 38, 8, NULL);
INSERT INTO `room` VALUES (8, '807', NULL, 44, 8, NULL);
INSERT INTO `room` VALUES (8, '808', NULL, 44, 8, NULL);
INSERT INTO `room` VALUES (8, '809', NULL, 44, 8, NULL);
INSERT INTO `room` VALUES (8, '810', NULL, 40, 8, NULL);
INSERT INTO `room` VALUES (8, '901', NULL, 37, 9, NULL);
INSERT INTO `room` VALUES (8, '902', NULL, 28, 9, NULL);
INSERT INTO `room` VALUES (8, '903', NULL, 35, 9, NULL);
INSERT INTO `room` VALUES (8, '904', NULL, 42, 9, NULL);
INSERT INTO `room` VALUES (8, '905', NULL, 29, 9, NULL);
INSERT INTO `room` VALUES (8, '906', NULL, 41, 9, NULL);
INSERT INTO `room` VALUES (8, '907', NULL, 34, 9, NULL);
INSERT INTO `room` VALUES (8, '908', NULL, 34, 9, NULL);
INSERT INTO `room` VALUES (8, '909', NULL, 30, 9, NULL);
INSERT INTO `room` VALUES (8, '910', NULL, 36, 9, NULL);
INSERT INTO `room` VALUES (9, '1001', NULL, 32, 10, NULL);
INSERT INTO `room` VALUES (9, '1002', NULL, 33, 10, NULL);
INSERT INTO `room` VALUES (9, '1003', NULL, 41, 10, NULL);
INSERT INTO `room` VALUES (9, '1004', NULL, 31, 10, NULL);
INSERT INTO `room` VALUES (9, '1005', NULL, 33, 10, NULL);
INSERT INTO `room` VALUES (9, '1006', NULL, 39, 10, NULL);
INSERT INTO `room` VALUES (9, '1007', NULL, 42, 10, NULL);
INSERT INTO `room` VALUES (9, '1008', NULL, 43, 10, NULL);
INSERT INTO `room` VALUES (9, '1009', NULL, 30, 10, NULL);
INSERT INTO `room` VALUES (9, '101', NULL, 32, 1, NULL);
INSERT INTO `room` VALUES (9, '1010', NULL, 31, 10, NULL);
INSERT INTO `room` VALUES (9, '102', NULL, 41, 1, NULL);
INSERT INTO `room` VALUES (9, '103', NULL, 43, 1, NULL);
INSERT INTO `room` VALUES (9, '104', NULL, 32, 1, NULL);
INSERT INTO `room` VALUES (9, '105', NULL, 31, 1, NULL);
INSERT INTO `room` VALUES (9, '106', NULL, 34, 1, NULL);
INSERT INTO `room` VALUES (9, '107', NULL, 44, 1, NULL);
INSERT INTO `room` VALUES (9, '108', NULL, 30, 1, NULL);
INSERT INTO `room` VALUES (9, '109', NULL, 44, 1, NULL);
INSERT INTO `room` VALUES (9, '110', NULL, 32, 1, NULL);
INSERT INTO `room` VALUES (9, '201', NULL, 37, 2, NULL);
INSERT INTO `room` VALUES (9, '202', NULL, 35, 2, NULL);
INSERT INTO `room` VALUES (9, '203', NULL, 39, 2, NULL);
INSERT INTO `room` VALUES (9, '204', NULL, 41, 2, NULL);
INSERT INTO `room` VALUES (9, '205', NULL, 30, 2, NULL);
INSERT INTO `room` VALUES (9, '206', NULL, 30, 2, NULL);
INSERT INTO `room` VALUES (9, '207', NULL, 34, 2, NULL);
INSERT INTO `room` VALUES (9, '208', NULL, 44, 2, NULL);
INSERT INTO `room` VALUES (9, '209', NULL, 28, 2, NULL);
INSERT INTO `room` VALUES (9, '210', NULL, 35, 2, NULL);
INSERT INTO `room` VALUES (9, '301', NULL, 32, 3, NULL);
INSERT INTO `room` VALUES (9, '302', NULL, 36, 3, NULL);
INSERT INTO `room` VALUES (9, '303', NULL, 34, 3, NULL);
INSERT INTO `room` VALUES (9, '304', NULL, 28, 3, NULL);
INSERT INTO `room` VALUES (9, '305', NULL, 38, 3, NULL);
INSERT INTO `room` VALUES (9, '306', NULL, 34, 3, NULL);
INSERT INTO `room` VALUES (9, '307', NULL, 44, 3, NULL);
INSERT INTO `room` VALUES (9, '308', NULL, 41, 3, NULL);
INSERT INTO `room` VALUES (9, '309', NULL, 30, 3, NULL);
INSERT INTO `room` VALUES (9, '310', NULL, 43, 3, NULL);
INSERT INTO `room` VALUES (9, '401', NULL, 28, 4, NULL);
INSERT INTO `room` VALUES (9, '402', NULL, 42, 4, NULL);
INSERT INTO `room` VALUES (9, '403', NULL, 32, 4, NULL);
INSERT INTO `room` VALUES (9, '404', NULL, 39, 4, NULL);
INSERT INTO `room` VALUES (9, '405', NULL, 37, 4, NULL);
INSERT INTO `room` VALUES (9, '406', NULL, 41, 4, NULL);
INSERT INTO `room` VALUES (9, '407', NULL, 35, 4, NULL);
INSERT INTO `room` VALUES (9, '408', NULL, 39, 4, NULL);
INSERT INTO `room` VALUES (9, '409', NULL, 32, 4, NULL);
INSERT INTO `room` VALUES (9, '410', NULL, 32, 4, NULL);
INSERT INTO `room` VALUES (9, '501', NULL, 35, 5, NULL);
INSERT INTO `room` VALUES (9, '502', NULL, 34, 5, NULL);
INSERT INTO `room` VALUES (9, '503', NULL, 39, 5, NULL);
INSERT INTO `room` VALUES (9, '504', NULL, 34, 5, NULL);
INSERT INTO `room` VALUES (9, '505', NULL, 42, 5, NULL);
INSERT INTO `room` VALUES (9, '506', NULL, 33, 5, NULL);
INSERT INTO `room` VALUES (9, '507', NULL, 39, 5, NULL);
INSERT INTO `room` VALUES (9, '508', NULL, 28, 5, NULL);
INSERT INTO `room` VALUES (9, '509', NULL, 31, 5, NULL);
INSERT INTO `room` VALUES (9, '510', NULL, 30, 5, NULL);
INSERT INTO `room` VALUES (9, '601', NULL, 31, 6, NULL);
INSERT INTO `room` VALUES (9, '602', NULL, 34, 6, NULL);
INSERT INTO `room` VALUES (9, '603', NULL, 40, 6, NULL);
INSERT INTO `room` VALUES (9, '604', NULL, 33, 6, NULL);
INSERT INTO `room` VALUES (9, '605', NULL, 33, 6, NULL);
INSERT INTO `room` VALUES (9, '606', NULL, 35, 6, NULL);
INSERT INTO `room` VALUES (9, '607', NULL, 28, 6, NULL);
INSERT INTO `room` VALUES (9, '608', NULL, 36, 6, NULL);
INSERT INTO `room` VALUES (9, '609', NULL, 33, 6, NULL);
INSERT INTO `room` VALUES (9, '610', NULL, 30, 6, NULL);
INSERT INTO `room` VALUES (9, '701', NULL, 40, 7, NULL);
INSERT INTO `room` VALUES (9, '702', NULL, 37, 7, NULL);
INSERT INTO `room` VALUES (9, '703', NULL, 34, 7, NULL);
INSERT INTO `room` VALUES (9, '704', NULL, 40, 7, NULL);
INSERT INTO `room` VALUES (9, '705', NULL, 31, 7, NULL);
INSERT INTO `room` VALUES (9, '706', NULL, 38, 7, NULL);
INSERT INTO `room` VALUES (9, '707', NULL, 30, 7, NULL);
INSERT INTO `room` VALUES (9, '708', NULL, 32, 7, NULL);
INSERT INTO `room` VALUES (9, '709', NULL, 40, 7, NULL);
INSERT INTO `room` VALUES (9, '710', NULL, 35, 7, NULL);
INSERT INTO `room` VALUES (9, '801', NULL, 36, 8, NULL);
INSERT INTO `room` VALUES (9, '802', NULL, 30, 8, NULL);
INSERT INTO `room` VALUES (9, '803', NULL, 32, 8, NULL);
INSERT INTO `room` VALUES (9, '804', NULL, 41, 8, NULL);
INSERT INTO `room` VALUES (9, '805', NULL, 29, 8, NULL);
INSERT INTO `room` VALUES (9, '806', NULL, 32, 8, NULL);
INSERT INTO `room` VALUES (9, '807', NULL, 31, 8, NULL);
INSERT INTO `room` VALUES (9, '808', NULL, 43, 8, NULL);
INSERT INTO `room` VALUES (9, '809', NULL, 38, 8, NULL);
INSERT INTO `room` VALUES (9, '810', NULL, 34, 8, NULL);
INSERT INTO `room` VALUES (9, '901', NULL, 32, 9, NULL);
INSERT INTO `room` VALUES (9, '902', NULL, 31, 9, NULL);
INSERT INTO `room` VALUES (9, '903', NULL, 34, 9, NULL);
INSERT INTO `room` VALUES (9, '904', NULL, 37, 9, NULL);
INSERT INTO `room` VALUES (9, '905', NULL, 33, 9, NULL);
INSERT INTO `room` VALUES (9, '906', NULL, 41, 9, NULL);
INSERT INTO `room` VALUES (9, '907', NULL, 42, 9, NULL);
INSERT INTO `room` VALUES (9, '908', NULL, 28, 9, NULL);
INSERT INTO `room` VALUES (9, '909', NULL, 29, 9, NULL);
INSERT INTO `room` VALUES (9, '910', NULL, 41, 9, NULL);
INSERT INTO `room` VALUES (10, '1001', NULL, 44, 10, NULL);
INSERT INTO `room` VALUES (10, '1002', NULL, 35, 10, NULL);
INSERT INTO `room` VALUES (10, '1003', NULL, 28, 10, NULL);
INSERT INTO `room` VALUES (10, '1004', NULL, 31, 10, NULL);
INSERT INTO `room` VALUES (10, '1005', NULL, 30, 10, NULL);
INSERT INTO `room` VALUES (10, '1006', NULL, 40, 10, NULL);
INSERT INTO `room` VALUES (10, '1007', NULL, 35, 10, NULL);
INSERT INTO `room` VALUES (10, '1008', NULL, 43, 10, NULL);
INSERT INTO `room` VALUES (10, '1009', NULL, 28, 10, NULL);
INSERT INTO `room` VALUES (10, '101', NULL, 38, 1, NULL);
INSERT INTO `room` VALUES (10, '1010', NULL, 32, 10, NULL);
INSERT INTO `room` VALUES (10, '102', NULL, 44, 1, NULL);
INSERT INTO `room` VALUES (10, '103', NULL, 30, 1, NULL);
INSERT INTO `room` VALUES (10, '104', NULL, 33, 1, NULL);
INSERT INTO `room` VALUES (10, '105', NULL, 35, 1, NULL);
INSERT INTO `room` VALUES (10, '106', NULL, 38, 1, NULL);
INSERT INTO `room` VALUES (10, '107', NULL, 43, 1, NULL);
INSERT INTO `room` VALUES (10, '108', NULL, 39, 1, NULL);
INSERT INTO `room` VALUES (10, '109', NULL, 41, 1, NULL);
INSERT INTO `room` VALUES (10, '110', NULL, 36, 1, NULL);
INSERT INTO `room` VALUES (10, '201', NULL, 30, 2, NULL);
INSERT INTO `room` VALUES (10, '202', NULL, 37, 2, NULL);
INSERT INTO `room` VALUES (10, '203', NULL, 28, 2, NULL);
INSERT INTO `room` VALUES (10, '204', NULL, 39, 2, NULL);
INSERT INTO `room` VALUES (10, '205', NULL, 30, 2, NULL);
INSERT INTO `room` VALUES (10, '206', NULL, 35, 2, NULL);
INSERT INTO `room` VALUES (10, '207', NULL, 28, 2, NULL);
INSERT INTO `room` VALUES (10, '208', NULL, 37, 2, NULL);
INSERT INTO `room` VALUES (10, '209', NULL, 35, 2, NULL);
INSERT INTO `room` VALUES (10, '210', NULL, 30, 2, NULL);
INSERT INTO `room` VALUES (10, '301', NULL, 40, 3, NULL);
INSERT INTO `room` VALUES (10, '302', NULL, 36, 3, NULL);
INSERT INTO `room` VALUES (10, '303', NULL, 35, 3, NULL);
INSERT INTO `room` VALUES (10, '304', NULL, 43, 3, NULL);
INSERT INTO `room` VALUES (10, '305', NULL, 36, 3, NULL);
INSERT INTO `room` VALUES (10, '306', NULL, 37, 3, NULL);
INSERT INTO `room` VALUES (10, '307', NULL, 29, 3, NULL);
INSERT INTO `room` VALUES (10, '308', NULL, 36, 3, NULL);
INSERT INTO `room` VALUES (10, '309', NULL, 31, 3, NULL);
INSERT INTO `room` VALUES (10, '310', NULL, 40, 3, NULL);
INSERT INTO `room` VALUES (10, '401', NULL, 39, 4, NULL);
INSERT INTO `room` VALUES (10, '402', NULL, 36, 4, NULL);
INSERT INTO `room` VALUES (10, '403', NULL, 42, 4, NULL);
INSERT INTO `room` VALUES (10, '404', NULL, 43, 4, NULL);
INSERT INTO `room` VALUES (10, '405', NULL, 41, 4, NULL);
INSERT INTO `room` VALUES (10, '406', NULL, 30, 4, NULL);
INSERT INTO `room` VALUES (10, '407', NULL, 31, 4, NULL);
INSERT INTO `room` VALUES (10, '408', NULL, 36, 4, NULL);
INSERT INTO `room` VALUES (10, '409', NULL, 30, 4, NULL);
INSERT INTO `room` VALUES (10, '410', NULL, 39, 4, NULL);
INSERT INTO `room` VALUES (10, '501', NULL, 40, 5, NULL);
INSERT INTO `room` VALUES (10, '502', NULL, 35, 5, NULL);
INSERT INTO `room` VALUES (10, '503', NULL, 41, 5, NULL);
INSERT INTO `room` VALUES (10, '504', NULL, 38, 5, NULL);
INSERT INTO `room` VALUES (10, '505', NULL, 36, 5, NULL);
INSERT INTO `room` VALUES (10, '506', NULL, 36, 5, NULL);
INSERT INTO `room` VALUES (10, '507', NULL, 34, 5, NULL);
INSERT INTO `room` VALUES (10, '508', NULL, 44, 5, NULL);
INSERT INTO `room` VALUES (10, '509', NULL, 29, 5, NULL);
INSERT INTO `room` VALUES (10, '510', NULL, 38, 5, NULL);
INSERT INTO `room` VALUES (10, '601', NULL, 44, 6, NULL);
INSERT INTO `room` VALUES (10, '602', NULL, 31, 6, NULL);
INSERT INTO `room` VALUES (10, '603', NULL, 35, 6, NULL);
INSERT INTO `room` VALUES (10, '604', NULL, 31, 6, NULL);
INSERT INTO `room` VALUES (10, '605', NULL, 30, 6, NULL);
INSERT INTO `room` VALUES (10, '606', NULL, 31, 6, NULL);
INSERT INTO `room` VALUES (10, '607', NULL, 40, 6, NULL);
INSERT INTO `room` VALUES (10, '608', NULL, 28, 6, NULL);
INSERT INTO `room` VALUES (10, '609', NULL, 38, 6, NULL);
INSERT INTO `room` VALUES (10, '610', NULL, 41, 6, NULL);
INSERT INTO `room` VALUES (10, '666', 'yjy', 600, 6, '2022-05-03');
INSERT INTO `room` VALUES (10, '701', NULL, 32, 7, NULL);
INSERT INTO `room` VALUES (10, '702', NULL, 37, 7, NULL);
INSERT INTO `room` VALUES (10, '703', NULL, 40, 7, NULL);
INSERT INTO `room` VALUES (10, '704', NULL, 44, 7, NULL);
INSERT INTO `room` VALUES (10, '705', NULL, 31, 7, NULL);
INSERT INTO `room` VALUES (10, '706', NULL, 31, 7, NULL);
INSERT INTO `room` VALUES (10, '707', NULL, 39, 7, NULL);
INSERT INTO `room` VALUES (10, '708', NULL, 44, 7, NULL);
INSERT INTO `room` VALUES (10, '709', NULL, 41, 7, NULL);
INSERT INTO `room` VALUES (10, '710', NULL, 35, 7, NULL);
INSERT INTO `room` VALUES (10, '801', NULL, 33, 8, NULL);
INSERT INTO `room` VALUES (10, '802', NULL, 36, 8, NULL);
INSERT INTO `room` VALUES (10, '803', NULL, 35, 8, NULL);
INSERT INTO `room` VALUES (10, '804', NULL, 41, 8, NULL);
INSERT INTO `room` VALUES (10, '805', NULL, 37, 8, NULL);
INSERT INTO `room` VALUES (10, '806', NULL, 40, 8, NULL);
INSERT INTO `room` VALUES (10, '807', NULL, 44, 8, NULL);
INSERT INTO `room` VALUES (10, '808', NULL, 37, 8, NULL);
INSERT INTO `room` VALUES (10, '809', NULL, 43, 8, NULL);
INSERT INTO `room` VALUES (10, '810', NULL, 44, 8, NULL);
INSERT INTO `room` VALUES (10, '901', NULL, 28, 9, NULL);
INSERT INTO `room` VALUES (10, '902', NULL, 44, 9, NULL);
INSERT INTO `room` VALUES (10, '903', NULL, 41, 9, NULL);
INSERT INTO `room` VALUES (10, '904', NULL, 34, 9, NULL);
INSERT INTO `room` VALUES (10, '905', NULL, 31, 9, NULL);
INSERT INTO `room` VALUES (10, '906', NULL, 31, 9, NULL);
INSERT INTO `room` VALUES (10, '907', NULL, 33, 9, NULL);
INSERT INTO `room` VALUES (10, '908', NULL, 38, 9, NULL);
INSERT INTO `room` VALUES (10, '909', NULL, 30, 9, NULL);
INSERT INTO `room` VALUES (10, '910', NULL, 38, 9, NULL);

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff`  (
  `username` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '职工用户名',
  `dno` int(0) NULL DEFAULT NULL COMMENT '职工所属部门号',
  `officeTime` time(0) NOT NULL COMMENT '上班时间',
  `quitTime` time(0) NOT NULL COMMENT '下班时间',
  `salary` int(0) NULL DEFAULT NULL COMMENT '工资',
  `bonus` int(0) NULL DEFAULT NULL COMMENT '奖金',
  PRIMARY KEY (`username`) USING BTREE,
  INDEX `fk_staff_dep`(`dno`) USING BTREE,
  CONSTRAINT `fk_staff_dep` FOREIGN KEY (`dno`) REFERENCES `department` (`dno`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_staff_user` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES ('admin', 1, '09:00:00', '17:00:00', 5000, 12000);
INSERT INTO `staff` VALUES ('ddddd', 1, '09:00:00', '18:00:00', 22, 21);
INSERT INTO `staff` VALUES ('zhangsan', 3, '09:00:00', '18:00:00', 3000, 10000);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `username` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `age` tinyint(0) UNSIGNED NULL DEFAULT NULL COMMENT '年龄',
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `idcard` char(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '身份证号',
  `regist_time` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`username`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE,
  UNIQUE INDEX `idcard`(`idcard`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('admin', 'admin', 'admin', '男', 20, 'admin', 'admin', '2022-04-21 23:53:39');
INSERT INTO `user` VALUES ('csl', '123', '蔡诗', '女', 6, '12323456786', '123456789987654321', '2022-05-03 10:21:53');
INSERT INTO `user` VALUES ('ddddd', 'ddd', '22d', '男', NULL, '1212', NULL, '2022-04-23 16:44:38');
INSERT INTO `user` VALUES ('drj', '123', '狄仁杰dddd', '男', 20, '18899990002', '421003202212210002', '2022-04-21 23:53:39');
INSERT INTO `user` VALUES ('gsl', '123', '公孙璃', '女', 18, '18899990001', '421003202212210001', '2022-04-21 23:53:39');
INSERT INTO `user` VALUES ('hy', '123', '后羿d', '男', 21, '18899990003', '421003202212210003', '2022-04-21 23:53:39');
INSERT INTO `user` VALUES ('wsm', '123', '王尚民', '男', 12, '13201671827', '123456789098765434', '2022-05-03 10:01:27');
INSERT INTO `user` VALUES ('yjy', '123', '鄢家', '男', 1, '12132345432', '123456789098765432', '2022-05-03 10:57:15');
INSERT INTO `user` VALUES ('zhangsan', '123', '张三', '男', NULL, '18674028185', NULL, '2022-04-26 23:19:47');

-- ----------------------------
-- View structure for sdu
-- ----------------------------
DROP VIEW IF EXISTS `sdu`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `sdu` AS select `u`.`username` AS `username`,`u`.`name` AS `name`,`u`.`sex` AS `sex`,`d`.`dept_name` AS `department`,`s`.`officeTime` AS `officeTime`,`s`.`quitTime` AS `quitTime`,`s`.`salary` AS `salary`,`s`.`bonus` AS `bonus`,`u`.`phone` AS `phone`,`u`.`password` AS `password` from ((`staff` `s` join `department` `d`) join `user` `u`) where ((`u`.`username` = `s`.`username`) and (`s`.`dno` = `d`.`dno`));

SET FOREIGN_KEY_CHECKS = 1;
