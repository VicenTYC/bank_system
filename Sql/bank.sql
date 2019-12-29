/*
 Navicat Premium Data Transfer

 Source Server         : tyc
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : bank

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 29/12/2019 16:12:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_sums
-- ----------------------------
DROP TABLE IF EXISTS `account_sums`;
CREATE TABLE `account_sums`  (
  `account_id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `account_balance` decimal(19, 2) NULL DEFAULT NULL,
  `account_psw` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `site_id` int(11) NULL DEFAULT NULL,
  `u_id` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`account_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_sums
-- ----------------------------
INSERT INTO `account_sums` VALUES ('2019575625716196516', 222.00, 'E10ADC3949BA59ABBE56E057F20F883E', 1, '412702199710125618');
INSERT INTO `account_sums` VALUES ('2019775335748962250', 0.00, 'E10ADC3949BA59ABBE56E057F20F883E', 0, '412703199503155681');

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts`  (
  `acconut_id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `account_balance` decimal(19, 2) NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `site_id` int(11) NULL DEFAULT NULL,
  `user_id` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`acconut_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accounts
-- ----------------------------
INSERT INTO `accounts` VALUES ('2019575625716196516', 222.00, 'E10ADC3949BA59ABBE56E057F20F883E', 1, '412702199710125618');
INSERT INTO `accounts` VALUES ('2019775335748962250', 0.00, 'E10ADC3949BA59ABBE56E057F20F883E', 0, '412703199503155681');

-- ----------------------------
-- Table structure for deposits
-- ----------------------------
DROP TABLE IF EXISTS `deposits`;
CREATE TABLE `deposits`  (
  `deposits_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `account_balance` decimal(19, 2) NULL DEFAULT NULL,
  `account_id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deposits_date_time` datetime(0) NULL DEFAULT NULL,
  `deposits_value` decimal(19, 2) NULL DEFAULT NULL,
  `site_id` int(11) NULL DEFAULT NULL,
  `staff_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`deposits_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of deposits
-- ----------------------------
INSERT INTO `deposits` VALUES ('2019576763177216230', 190.00, '2019575625716196516', '2019-12-19 21:46:17', 100.00, NULL, NULL);
INSERT INTO `deposits` VALUES ('2019576763257095190', 210.00, '2019575625716196516', '2019-12-19 21:47:37', 20.00, NULL, NULL);
INSERT INTO `deposits` VALUES ('2019576763333699961', 222.00, '2019575625716196516', '2019-12-19 21:48:54', 12.00, NULL, NULL);

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence`  (
  `next_val` bigint(20) NULL DEFAULT NULL
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for sites
-- ----------------------------
DROP TABLE IF EXISTS `sites`;
CREATE TABLE `sites`  (
  `site_id` int(11) NOT NULL,
  `site_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `site_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`site_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for staffs
-- ----------------------------
DROP TABLE IF EXISTS `staffs`;
CREATE TABLE `staffs`  (
  `staff_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `staff_name` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staff_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staff_site` int(11) NULL DEFAULT NULL,
  `staff_pwd` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`staff_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of staffs
-- ----------------------------
INSERT INTO `staffs` VALUES ('201915767674795854610', 'Tyc', '18548562841', 0, 'E10ADC3949BA59ABBE56E057F20F883E');
INSERT INTO `staffs` VALUES ('201915767519228933240', 'Maja', '18852635987', 1, 'E10ADC3949BA59ABBE56E057F20F883E');
INSERT INTO `staffs` VALUES ('201915767675120064500', 'Tom', '15545268543', 0, 'E10ADC3949BA59ABBE56E057F20F883E');
INSERT INTO `staffs` VALUES ('201915767679213022970', 'Lucy', '15668415485', 2, 'E10ADC3949BA59ABBE56E057F20F883E');
INSERT INTO `staffs` VALUES ('2019157760444470365410', 'staff1', '18865495235', 10, 'E10ADC3949BA59ABBE56E057F20F883E');
INSERT INTO `staffs` VALUES ('2019157760452624476310', 'staff2', '18548562841', 10, 'E10ADC3949BA59ABBE56E057F20F883E');

-- ----------------------------
-- Table structure for summarys
-- ----------------------------
DROP TABLE IF EXISTS `summarys`;
CREATE TABLE `summarys`  (
  `summary_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `account_id_from` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account_id_to` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  `site_id` int(11) NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `value` decimal(19, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`summary_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of summarys
-- ----------------------------
INSERT INTO `summarys` VALUES ('20191576761964159667', '2019575625716196516', '2019575625716196516', '2019-12-19 21:26:04', NULL, 1, 10.00);
INSERT INTO `summarys` VALUES ('20191576763177225800', '2019575625716196516', '2019575625716196516', '2019-12-19 21:46:17', NULL, 0, 100.00);
INSERT INTO `summarys` VALUES ('20191576763257100158', '2019575625716196516', '2019575625716196516', '2019-12-19 21:47:37', NULL, 0, 20.00);
INSERT INTO `summarys` VALUES ('20191576763333703368', '2019575625716196516', '2019575625716196516', '2019-12-19 21:48:54', NULL, 0, 12.00);

-- ----------------------------
-- Table structure for transfers
-- ----------------------------
DROP TABLE IF EXISTS `transfers`;
CREATE TABLE `transfers`  (
  `transfer_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_from_balance` decimal(19, 2) NULL DEFAULT NULL,
  `account_id_from` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account_id_to` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account_to_balance` decimal(19, 2) NULL DEFAULT NULL,
  `site_id` int(11) NULL DEFAULT NULL,
  `staff_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `transfer_date` datetime(0) NULL DEFAULT NULL,
  `transfer_value` decimal(19, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`transfer_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `u_id` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `u_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uphone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('412702199710125618', 'user1', '18821670341');
INSERT INTO `users` VALUES ('422702199605165892', 'user2', '15524985216');

-- ----------------------------
-- Table structure for withdrawals
-- ----------------------------
DROP TABLE IF EXISTS `withdrawals`;
CREATE TABLE `withdrawals`  (
  `withdrawals_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `accountid` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account_balance` decimal(19, 2) NULL DEFAULT NULL,
  `site_id` int(11) NULL DEFAULT NULL,
  `staff_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `with_date` datetime(0) NULL DEFAULT NULL,
  `withdrawalsvalue` decimal(19, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`withdrawals_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of withdrawals
-- ----------------------------
INSERT INTO `withdrawals` VALUES ('2019576761964089867', '2019575625716196516', 90.00, NULL, NULL, '2019-12-19 21:26:04', 10.00);

SET FOREIGN_KEY_CHECKS = 1;
