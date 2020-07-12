/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : oa

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 12/07/2020 22:46:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for claim_voucher
-- ----------------------------
DROP TABLE IF EXISTS `claim_voucher`;
CREATE TABLE `claim_voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cause` varchar(100) DEFAULT NULL,
  `create_sn` char(5) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `next_deal_sn` char(5) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_2` (`next_deal_sn`),
  KEY `FK_Reference_3` (`create_sn`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`next_deal_sn`) REFERENCES `employee` (`sn`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`create_sn`) REFERENCES `employee` (`sn`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of claim_voucher
-- ----------------------------
BEGIN;
INSERT INTO `claim_voucher` VALUES (1, '租房', '0829', '2020-07-12 13:40:51', '0829', 10000, '新创建');
INSERT INTO `claim_voucher` VALUES (2, '出差吃饭', '0829', '2020-07-12 13:41:51', '0829', 500, '新创建');
INSERT INTO `claim_voucher` VALUES (3, '喝茶', '0829', '2020-07-12 14:03:04', '0829', 599, '新创建');
INSERT INTO `claim_voucher` VALUES (4, '租房', '0829', '2020-07-12 14:20:28', '0829', 50000, '新创建');
INSERT INTO `claim_voucher` VALUES (5, '租房', '10003', '2020-07-12 14:29:22', NULL, 10000, '已打款');
INSERT INTO `claim_voucher` VALUES (6, '出差吃饭', '10004', '2020-07-12 14:32:32', '10003', 500, '已提交');
COMMIT;

-- ----------------------------
-- Table structure for claim_voucher_item
-- ----------------------------
DROP TABLE IF EXISTS `claim_voucher_item`;
CREATE TABLE `claim_voucher_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `claim_voucher_id` int(11) DEFAULT NULL,
  `item` varchar(20) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_4` (`claim_voucher_id`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`claim_voucher_id`) REFERENCES `claim_voucher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of claim_voucher_item
-- ----------------------------
BEGIN;
INSERT INTO `claim_voucher_item` VALUES (1, 1, '住宿', 10000, '租房子');
INSERT INTO `claim_voucher_item` VALUES (2, 2, '餐饮', 500, '吃饭');
INSERT INTO `claim_voucher_item` VALUES (3, 3, '办公', 599, '快乐的喝茶');
INSERT INTO `claim_voucher_item` VALUES (4, 4, '办公', 10000, '租房子');
INSERT INTO `claim_voucher_item` VALUES (5, 4, '交通', 10000, '租房子');
INSERT INTO `claim_voucher_item` VALUES (6, 4, '交通', 10000, '租房子');
INSERT INTO `claim_voucher_item` VALUES (7, 4, '交通', 10000, '租房子');
INSERT INTO `claim_voucher_item` VALUES (8, 4, '交通', 10000, '租房子');
INSERT INTO `claim_voucher_item` VALUES (9, 5, '办公', 10000, '吃饭');
INSERT INTO `claim_voucher_item` VALUES (10, 6, '住宿', 500, '快乐的喝茶');
COMMIT;

-- ----------------------------
-- Table structure for deal_record
-- ----------------------------
DROP TABLE IF EXISTS `deal_record`;
CREATE TABLE `deal_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `claim_voucher_id` int(11) DEFAULT NULL,
  `deal_sn` char(5) DEFAULT NULL,
  `deal_time` datetime DEFAULT NULL,
  `deal_way` varchar(20) DEFAULT NULL,
  `deal_result` varchar(20) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_5` (`claim_voucher_id`),
  KEY `FK_Reference_6` (`deal_sn`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`claim_voucher_id`) REFERENCES `claim_voucher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`deal_sn`) REFERENCES `employee` (`sn`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of deal_record
-- ----------------------------
BEGIN;
INSERT INTO `deal_record` VALUES (1, 5, '10003', '2020-07-12 14:29:25', '提交', '已提交', '无');
INSERT INTO `deal_record` VALUES (2, 5, '10003', '2020-07-12 14:29:37', '通过', '待复审', '');
INSERT INTO `deal_record` VALUES (3, 5, 'admin', '2020-07-12 14:30:46', '通过', '已审核', '');
INSERT INTO `deal_record` VALUES (4, 5, '10002', '2020-07-12 14:31:15', '打款', '已打款', '');
INSERT INTO `deal_record` VALUES (5, 6, '10004', '2020-07-12 14:32:35', '提交', '已提交', '无');
COMMIT;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `sn` char(5) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of department
-- ----------------------------
BEGIN;
INSERT INTO `department` VALUES ('10001', '总经理办公室', '星星大厦E座1201');
INSERT INTO `department` VALUES ('10002', '财务部', '星星大厦E座1202');
INSERT INTO `department` VALUES ('10003', '事业部', '星星大厦E座1101');
INSERT INTO `department` VALUES ('12200', '研发部', '杭州-余杭');
INSERT INTO `department` VALUES ('22227', '计算机科学与技术', 'cn');
COMMIT;

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `sn` char(5) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `department_sn` char(5) DEFAULT NULL,
  `post` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sn`),
  KEY `FK_Reference_1` (`department_sn`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`department_sn`) REFERENCES `department` (`sn`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of employee
-- ----------------------------
BEGIN;
INSERT INTO `employee` VALUES ('0829', 'shuandong', '舒安东', '22227', '员工');
INSERT INTO `employee` VALUES ('10001', '000000', '刘备', '10001', '总经理');
INSERT INTO `employee` VALUES ('10002', '000000', '孙尚香', '10002', '财务');
INSERT INTO `employee` VALUES ('10003', '000000', '关羽', '10003', '部门经理');
INSERT INTO `employee` VALUES ('10004', '000000', '周仓', '10003', '员工');
INSERT INTO `employee` VALUES ('admin', 'shuandong', 'admin', '10001', '总经理');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
