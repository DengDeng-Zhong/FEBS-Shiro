/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50527
 Source Host           : localhost:3306
 Source Schema         : febs_base

 Target Server Type    : MySQL
 Target Server Version : 50527
 File Encoding         : 65001

 Date: 25/12/2020 16:17:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ENTRY_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `JOB_GROUP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_GROUP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('FEBS_Scheduler', 'TASK_1', 'DEFAULT', NULL, 'cc.mrbird.febs.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372001D63632E6D72626972642E666562732E6A6F622E656E746974792E4A6F62058D52AC1093A3040200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C000673746174757371007E00097870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000161C6EB70707874000D302F31202A202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740004746573747400066D726269726474001AE69C89E58F82E4BBBBE58AA1E8B083E5BAA6E6B58BE8AF957E7E740001317800);
INSERT INTO `qrtz_job_details` VALUES ('FEBS_Scheduler', 'TASK_11', 'DEFAULT', NULL, 'cc.mrbird.febs.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372001D63632E6D72626972642E666562732E6A6F622E656E746974792E4A6F62058D52AC1093A3040200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C000673746174757371007E00097870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000161D01BAC507874000D302F35202A202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000B74000574657374327074000CE6B58BE8AF95E5BC82E5B8B8740001317800);
INSERT INTO `qrtz_job_details` VALUES ('FEBS_Scheduler', 'TASK_2', 'DEFAULT', NULL, 'cc.mrbird.febs.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372001D63632E6D72626972642E666562732E6A6F622E656E746974792E4A6F62058D52AC1093A3040200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C000673746174757371007E00097870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000161C71032987874000E302F3130202A202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740005746573743170740018E697A0E58F82E4BBBBE58AA1E8B083E5BAA6E6B58BE8AF95740001317800);
INSERT INTO `qrtz_job_details` VALUES ('FEBS_Scheduler', 'TASK_3', 'DEFAULT', NULL, 'cc.mrbird.febs.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372001D63632E6D72626972642E666562732E6A6F622E656E746974792E4A6F62058D52AC1093A3040200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C000673746174757371007E00097870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000161CFB9A6907874000D302F31202A202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000037400047465737474000B68656C6C6F20776F726C6474002BE69C89E58F82E4BBBBE58AA1E8B083E5BAA6E6B58BE8AF952CE6AF8FE99A94E4B880E7A792E8A7A6E58F91740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('FEBS_Scheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('FEBS_Scheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('FEBS_Scheduler', 'DESKTOP-TQ4I4GD1608529584331', 1608530237067, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `STR_PROP_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `STR_PROP_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `STR_PROP_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_GROUP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DESCRIPTION` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_data_permission_test
-- ----------------------------
DROP TABLE IF EXISTS `t_data_permission_test`;
CREATE TABLE `t_data_permission_test`  (
  `FIELD1` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FIELD2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FIELD3` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FIELD4` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DEPT_ID` int(11) NOT NULL,
  `CREATE_TIME` datetime NOT NULL,
  `ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_data_permission_test
-- ----------------------------
INSERT INTO `t_data_permission_test` VALUES ('小米', '小米10Pro', '4999', '珍珠白', 1, '2020-04-14 15:00:38', 1);
INSERT INTO `t_data_permission_test` VALUES ('腾讯', '黑鲨游戏手机3', '3799', '铠甲灰', 2, '2020-04-14 15:01:36', 2);
INSERT INTO `t_data_permission_test` VALUES ('华为', '华为P30', '3299', '天空之境', 1, '2020-04-14 15:03:11', 3);
INSERT INTO `t_data_permission_test` VALUES ('华为', '华为P40Pro', '6488', '亮黑色', 3, '2020-04-14 15:04:31', 4);
INSERT INTO `t_data_permission_test` VALUES ('vivo', 'Vivo iQOO 3', '3998', '拉力橙', 4, '2020-04-14 15:05:55', 5);
INSERT INTO `t_data_permission_test` VALUES ('一加', '一加7T', '3199', '冰际蓝', 5, '2020-04-14 15:06:53', 6);
INSERT INTO `t_data_permission_test` VALUES ('三星', '三星Galaxy S10', '4098', '浩玉白', 6, '2020-04-14 15:08:25', 7);
INSERT INTO `t_data_permission_test` VALUES ('苹果', 'iPhone 11 pro max', '9198', '暗夜绿', 4, '2020-04-14 15:09:20', 8);

-- ----------------------------
-- Table structure for t_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept`  (
  `DEPT_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `PARENT_ID` bigint(20) NOT NULL COMMENT '上级部门ID',
  `DEPT_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ORDER_NUM` bigint(20) DEFAULT NULL COMMENT '排序',
  `CREATE_TIME` datetime DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`DEPT_ID`) USING BTREE,
  INDEX `t_dept_parent_id`(`PARENT_ID`) USING BTREE,
  INDEX `t_dept_dept_name`(`DEPT_NAME`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept` VALUES (1, 0, '开发部', 1, '2019-06-14 20:56:41', NULL);
INSERT INTO `t_dept` VALUES (2, 1, '开发一部', 1, '2019-06-14 20:58:46', NULL);
INSERT INTO `t_dept` VALUES (3, 1, '开发二部', 2, '2019-06-14 20:58:56', NULL);
INSERT INTO `t_dept` VALUES (11, 0, '系统3部', 2, '2020-12-22 10:16:43', '2020-12-22 10:23:59');
INSERT INTO `t_dept` VALUES (12, 11, '运维组', 1, '2020-12-22 10:18:46', NULL);
INSERT INTO `t_dept` VALUES (13, 12, '管理组', 1, '2020-12-22 10:19:18', NULL);
INSERT INTO `t_dept` VALUES (14, 12, '销售组', 2, '2020-12-22 10:19:27', NULL);
INSERT INTO `t_dept` VALUES (15, 12, '生产组', 3, '2020-12-22 10:19:47', NULL);
INSERT INTO `t_dept` VALUES (16, 11, '资材项目组', 2, '2020-12-22 10:23:43', NULL);
INSERT INTO `t_dept` VALUES (17, 11, 'GTE项目组', 3, '2020-12-22 10:24:56', NULL);

-- ----------------------------
-- Table structure for t_eximport
-- ----------------------------
DROP TABLE IF EXISTS `t_eximport`;
CREATE TABLE `t_eximport`  (
  `FIELD1` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FIELD2` int(11) NOT NULL COMMENT '字段2',
  `FIELD3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_eximport
-- ----------------------------
INSERT INTO `t_eximport` VALUES ('字段1', 1, 'mrbird0@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 2, 'mrbird1@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 3, 'mrbird2@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 4, 'mrbird3@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 5, 'mrbird4@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 6, 'mrbird5@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 7, 'mrbird6@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 8, 'mrbird7@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 9, 'mrbird8@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 10, 'mrbird9@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 11, 'mrbird10@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 12, 'mrbird11@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 13, 'mrbird12@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 14, 'mrbird13@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 15, 'mrbird14@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 16, 'mrbird15@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 17, 'mrbird16@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 18, 'mrbird17@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 19, 'mrbird18@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 20, 'mrbird19@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('钟登博', 1310065797, '13100657972@163.com', '2020-12-22 11:24:09');

-- ----------------------------
-- Table structure for t_generator_config
-- ----------------------------
DROP TABLE IF EXISTS `t_generator_config`;
CREATE TABLE `t_generator_config`  (
  `id` int(11) NOT NULL COMMENT '主键',
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `base_package` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entity_package` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mapper_package` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mapper_xml_package` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `service_package` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `service_impl_package` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `controller_package` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_trim` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `trim_value` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_generator_config
-- ----------------------------
INSERT INTO `t_generator_config` VALUES (1, 'MrBird', 'cc.mrbird.febs.gen', 'entity', 'mapper', 'mapper', 'service', 'service.impl', 'controller', '1', 't_');

-- ----------------------------
-- Table structure for t_job
-- ----------------------------
DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job`  (
  `JOB_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `BEAN_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `METHOD_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARAMS` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CRON_EXPRESSION` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `STATUS` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REMARK` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`JOB_ID`) USING BTREE,
  INDEX `t_job_create_time`(`CREATE_TIME`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_job
-- ----------------------------
INSERT INTO `t_job` VALUES (12, 'testTask', 'test', 'test', '0/10 * * * * ?', '1', '测试job', '2020-12-21 15:44:59');

-- ----------------------------
-- Table structure for t_job_log
-- ----------------------------
DROP TABLE IF EXISTS `t_job_log`;
CREATE TABLE `t_job_log`  (
  `LOG_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `JOB_ID` bigint(20) NOT NULL COMMENT '任务id',
  `BEAN_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `METHOD_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARAMS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `STATUS` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ERROR` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `TIMES` decimal(11, 0) DEFAULT NULL COMMENT '耗时(单位：毫秒)',
  `CREATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`LOG_ID`) USING BTREE,
  INDEX `t_job_log_create_time`(`CREATE_TIME`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_job_log
-- ----------------------------
INSERT INTO `t_job_log` VALUES (10, 12, 'testTask', 'test', 'test', '0', NULL, 2, '2020-12-21 15:49:30');
INSERT INTO `t_job_log` VALUES (11, 12, 'testTask', 'test', 'test', '0', NULL, 1, '2020-12-21 15:49:40');
INSERT INTO `t_job_log` VALUES (12, 12, 'testTask', 'test', 'test', '0', NULL, 2, '2020-12-21 15:49:50');
INSERT INTO `t_job_log` VALUES (13, 12, 'testTask', 'test', 'test', '0', NULL, 4, '2020-12-21 15:50:00');
INSERT INTO `t_job_log` VALUES (14, 12, 'testTask', 'test', 'test', '0', NULL, 2, '2020-12-21 15:50:10');
INSERT INTO `t_job_log` VALUES (15, 12, 'testTask', 'test', 'test', '0', NULL, 0, '2020-12-21 15:50:20');
INSERT INTO `t_job_log` VALUES (16, 12, 'testTask', 'test', 'test', '0', NULL, 0, '2020-12-21 15:50:30');

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `USERNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `OPERATION` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `TIME` decimal(11, 0) DEFAULT NULL COMMENT '耗时',
  `METHOD` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `PARAMS` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `IP` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `location` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `t_log_create_time`(`CREATE_TIME`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES (1, 'MrBird', '修改定时任务', 26, 'cc.mrbird.febs.job.controller.JobController.updateJob()', ' job: \"Job(jobId=1, beanName=testTask, methodName=test, params=mrbird, cronExpression=2/1 * * * * ?, status=1, remark=有参任务调度测试~~, createTime=null, createTimeFrom=null, createTimeTo=null)\"', '2.0.4.14', '2020-12-21 14:46:01', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (2, 'MrBird', '修改定时任务', 13, 'cc.mrbird.febs.job.controller.JobController.updateJob()', ' job: \"Job(jobId=1, beanName=testTask, methodName=test, params=mrbird, cronExpression=0/10 * * * * ?, status=0, remark=有参任务调度测试~~, createTime=null, createTimeFrom=null, createTimeTo=null)\"', '2.0.4.14', '2020-12-21 14:55:53', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (3, 'MrBird', '删除定时任务', 62, 'cc.mrbird.febs.job.controller.JobController.deleteJob()', ' jobIds: \"11\"', '0:0:0:0:0:0:0:1', '2020-12-21 15:05:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (4, 'MrBird', '删除定时任务', 27, 'cc.mrbird.febs.job.controller.JobController.deleteJob()', ' jobIds: \"3\"', '0:0:0:0:0:0:0:1', '2020-12-21 15:05:17', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (5, 'MrBird', '删除定时任务', 25, 'cc.mrbird.febs.job.controller.JobController.deleteJob()', ' jobIds: \"2\"', '0:0:0:0:0:0:0:1', '2020-12-21 15:05:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (6, 'MrBird', '删除定时任务', 31, 'cc.mrbird.febs.job.controller.JobController.deleteJob()', ' jobIds: \"1\"', '0:0:0:0:0:0:0:1', '2020-12-21 15:05:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (7, 'MrBird', '新增定时任务', 67, 'cc.mrbird.febs.job.controller.JobController.addJob()', ' job: \"Job(jobId=12, beanName=test, methodName=test, params=hello world, cronExpression=0/10 * * * * ?, status=1, remark=测试job, createTime=Mon Dec 21 15:44:59 CST 2020, createTimeFrom=null, createTimeTo=null)\"', '2.0.4.14', '2020-12-21 15:44:59', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (8, 'MrBird', '恢复定时任务', 35, 'cc.mrbird.febs.job.controller.JobController.resumeJob()', ' jobIds: \"12\"', '2.0.4.14', '2020-12-21 15:45:13', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (9, 'MrBird', '暂停定时任务', 25, 'cc.mrbird.febs.job.controller.JobController.pauseJob()', ' jobIds: \"12\"', '2.0.4.14', '2020-12-21 15:46:06', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (10, 'MrBird', '修改定时任务', 32, 'cc.mrbird.febs.job.controller.JobController.updateJob()', ' job: \"Job(jobId=12, beanName=test, methodName=test, params=test, cronExpression=0/10 * * * * ?, status=1, remark=测试job, createTime=null, createTimeFrom=null, createTimeTo=null)\"', '2.0.4.14', '2020-12-21 15:48:37', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (11, 'MrBird', '恢复定时任务', 28, 'cc.mrbird.febs.job.controller.JobController.resumeJob()', ' jobIds: \"12\"', '2.0.4.14', '2020-12-21 15:48:46', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (12, 'MrBird', '修改定时任务', 26, 'cc.mrbird.febs.job.controller.JobController.updateJob()', ' job: \"Job(jobId=12, beanName=testTask, methodName=test, params=test, cronExpression=0/10 * * * * ?, status=0, remark=测试job, createTime=null, createTimeFrom=null, createTimeTo=null)\"', '2.0.4.14', '2020-12-21 15:49:23', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (13, 'MrBird', '暂停定时任务', 19, 'cc.mrbird.febs.job.controller.JobController.pauseJob()', ' jobIds: \"12\"', '2.0.4.14', '2020-12-21 15:50:31', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (14, 'MrBird', '删除用户', 150, 'cc.mrbird.febs.system.controller.UserController.deleteUsers()', ' userIds: \"6\"', '2.0.4.14', '2020-12-21 15:57:48', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (15, 'MrBird', '新增菜单/按钮', 18, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=179, parentId=0, menuName=文档管理, url=, perms=, icon=, type=0, orderNum=6, createTime=Mon Dec 21 16:02:32 CST 2020, modifyTime=null)\"', '2.0.4.14', '2020-12-21 16:02:32', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (16, 'MrBird', '修改角色', 81, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Mon Dec 21 16:21:15 CST 2020, menuIds=1,3,11,12,13,160,161,4,14,15,16,162,5,17,18,19,163,6,20,21,22,164,2,8,23,10,24,170,136,171,172,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178,179)\"', '2.0.4.166', '2020-12-21 16:21:16', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (17, 'MrBird', '修改菜单/按钮', 22, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=179, parentId=0, menuName=文档管理, url=, perms=, icon=layui-icon-file-fill, type=0, orderNum=6, createTime=null, modifyTime=Mon Dec 21 16:24:06 CST 2020)\"', '2.0.4.166', '2020-12-21 16:24:06', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (18, 'MrBird', '修改菜单/按钮', 12, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=179, parentId=0, menuName=文档管理, url=, perms=, icon=layui-icon-file, type=0, orderNum=6, createTime=null, modifyTime=Mon Dec 21 16:24:55 CST 2020)\"', '2.0.4.166', '2020-12-21 16:24:55', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (19, 'MrBird', '新增部门', 17, 'cc.mrbird.febs.system.controller.DeptController.addDept()', ' dept: \"Dept(deptId=11, parentId=0, deptName=系统3部, orderNum=9, createTime=Tue Dec 22 10:16:43 CST 2020, modifyTime=null)\"', '2.0.4.27', '2020-12-22 10:16:43', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (20, 'MrBird', '新增部门', 8, 'cc.mrbird.febs.system.controller.DeptController.addDept()', ' dept: \"Dept(deptId=12, parentId=11, deptName=运维组, orderNum=1, createTime=Tue Dec 22 10:18:46 CST 2020, modifyTime=null)\"', '2.0.4.27', '2020-12-22 10:18:46', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (21, 'MrBird', '新增部门', 8, 'cc.mrbird.febs.system.controller.DeptController.addDept()', ' dept: \"Dept(deptId=13, parentId=12, deptName=管理组, orderNum=1, createTime=Tue Dec 22 10:19:18 CST 2020, modifyTime=null)\"', '2.0.4.27', '2020-12-22 10:19:18', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (22, 'MrBird', '新增部门', 9, 'cc.mrbird.febs.system.controller.DeptController.addDept()', ' dept: \"Dept(deptId=14, parentId=12, deptName=销售组, orderNum=2, createTime=Tue Dec 22 10:19:27 CST 2020, modifyTime=null)\"', '2.0.4.27', '2020-12-22 10:19:27', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (23, 'MrBird', '新增部门', 8, 'cc.mrbird.febs.system.controller.DeptController.addDept()', ' dept: \"Dept(deptId=15, parentId=12, deptName=生产组, orderNum=3, createTime=Tue Dec 22 10:19:47 CST 2020, modifyTime=null)\"', '2.0.4.27', '2020-12-22 10:19:47', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (24, 'MrBird', '删除部门', 36, 'cc.mrbird.febs.system.controller.DeptController.deleteDept()', ' deptIds: \"9\"', '2.0.4.27', '2020-12-22 10:19:55', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (25, 'MrBird', '删除部门', 19, 'cc.mrbird.febs.system.controller.DeptController.deleteDept()', ' deptIds: \"4\"', '2.0.4.27', '2020-12-22 10:22:26', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (26, 'MrBird', '删除部门', 12, 'cc.mrbird.febs.system.controller.DeptController.deleteDept()', ' deptIds: \"6\"', '2.0.4.27', '2020-12-22 10:22:31', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (27, 'MrBird', '删除部门', 17, 'cc.mrbird.febs.system.controller.DeptController.deleteDept()', ' deptIds: \"5\"', '2.0.4.27', '2020-12-22 10:22:37', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (28, 'MrBird', '删除部门', 14, 'cc.mrbird.febs.system.controller.DeptController.deleteDept()', ' deptIds: \"8\"', '2.0.4.27', '2020-12-22 10:22:59', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (29, 'MrBird', '删除部门', 16, 'cc.mrbird.febs.system.controller.DeptController.deleteDept()', ' deptIds: \"7\"', '2.0.4.27', '2020-12-22 10:23:04', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (30, 'MrBird', '删除部门', 17, 'cc.mrbird.febs.system.controller.DeptController.deleteDept()', ' deptIds: \"10\"', '2.0.4.27', '2020-12-22 10:23:09', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (31, 'MrBird', '新增部门', 7, 'cc.mrbird.febs.system.controller.DeptController.addDept()', ' dept: \"Dept(deptId=16, parentId=11, deptName=资材项目组, orderNum=2, createTime=Tue Dec 22 10:23:43 CST 2020, modifyTime=null)\"', '2.0.4.27', '2020-12-22 10:23:43', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (32, 'MrBird', '修改部门', 8, 'cc.mrbird.febs.system.controller.DeptController.updateDept()', ' dept: \"Dept(deptId=11, parentId=null, deptName=系统3部, orderNum=2, createTime=null, modifyTime=Tue Dec 22 10:23:59 CST 2020)\"', '2.0.4.27', '2020-12-22 10:23:59', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (33, 'MrBird', '新增部门', 8, 'cc.mrbird.febs.system.controller.DeptController.addDept()', ' dept: \"Dept(deptId=17, parentId=11, deptName=GTE项目组, orderNum=3, createTime=Tue Dec 22 10:24:56 CST 2020, modifyTime=null)\"', '2.0.4.27', '2020-12-22 10:24:56', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (34, 'MrBird', '新增菜单/按钮', 12, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=文档一览, url=, perms=, icon=, type=0, orderNum=null, createTime=Tue Dec 22 10:46:19 CST 2020, modifyTime=null)\"', '2.0.4.27', '2020-12-22 10:46:19', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (35, 'MrBird', '修改菜单/按钮', 47, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=文档一览, url=, perms=, icon=, type=0, orderNum=1, createTime=null, modifyTime=Tue Dec 22 11:43:07 CST 2020)\"', '0:0:0:0:0:0:0:1', '2020-12-22 11:43:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (36, 'MrBird', '修改角色', 91, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=2, roleName=注册账户, remark=注册账户，拥有查看，新增权限（新增用户除外）和导出Excel权限, createTime=null, modifyTime=Tue Dec 22 13:38:28 CST 2020, menuIds=161,14,162,17,163,20,164,2,8,10,170,136,172,127,128,129,131,175,101,102,173,109,174,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178,179,180)\"', '2.0.4.27', '2020-12-22 13:38:28', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (37, 'MrBird', '修改角色', 55, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Tue Dec 22 13:38:39 CST 2020, menuIds=1,3,11,12,13,160,161,4,14,15,16,162,5,17,18,19,163,6,20,21,22,164,2,8,23,10,24,170,136,171,172,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178,179,180)\"', '2.0.4.27', '2020-12-22 13:38:39', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (38, 'MrBird', '修改角色', 49, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Tue Dec 22 13:39:07 CST 2020, menuIds=1,3,11,12,13,160,161,4,14,15,16,162,5,17,18,19,163,6,20,21,22,164,2,8,23,10,24,170,136,171,172,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178,179,180)\"', '2.0.4.27', '2020-12-22 13:39:07', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (39, 'MrBird', '修改菜单/按钮', 19, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=文档一览, url=, perms=, icon=layui-icon-fileprotect, type=0, orderNum=1, createTime=null, modifyTime=Tue Dec 22 13:39:37 CST 2020)\"', '2.0.4.27', '2020-12-22 13:39:37', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (40, 'MrBird', '修改菜单/按钮', 39, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=文档一览, url=/others/eximport, perms=, icon=layui-icon-fileprotect, type=0, orderNum=1, createTime=null, modifyTime=Tue Dec 22 13:40:39 CST 2020)\"', '2.0.4.27', '2020-12-22 13:40:39', '法国|0|0|0|0');
INSERT INTO `t_log` VALUES (41, 'MrBird', '修改用户', 85, 'cc.mrbird.febs.system.controller.UserController.updateUser()', ' user: \"User(userId=4, username=null, password=null, deptId=null, email=Micaela@163.com, mobile=17733333333, status=0, createTime=null, modifyTime=Wed Dec 23 17:09:35 CST 2020, lastLoginTime=null, sex=2, avatar=null, theme=null, isTab=null, description=我叫米克拉, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=78, roleName=null, deptIds=, stringPermissions=null, roles=null)\"', '0:0:0:0:0:0:0:1', '2020-12-23 17:09:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (42, 'MrBird', '删除用户', 39, 'cc.mrbird.febs.system.controller.UserController.deleteUsers()', ' userIds: \"9\"', '0:0:0:0:0:0:0:1', '2020-12-23 17:09:44', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (43, 'MrBird', '删除用户', 33, 'cc.mrbird.febs.system.controller.UserController.deleteUsers()', ' userIds: \"4\"', '0:0:0:0:0:0:0:1', '2020-12-23 17:11:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (44, 'MrBird', '修改角色', 75, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=2, roleName=注册账户, remark=注册账户，拥有查看，新增权限（新增用户除外）和导出Excel权限, createTime=null, modifyTime=Fri Dec 25 08:47:10 CST 2020, menuIds=161,14,162,17,163,20,164,2,8,10,170,136,172,127,128,129,131,175,101,102,173,109,174,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,178,179,180)\"', '192.168.56.1', '2020-12-25 08:47:10', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (45, 'MrBird', '修改用户', 35, 'cc.mrbird.febs.system.controller.UserController.updateUser()', ' user: \"User(userId=2, username=null, password=null, deptId=2, email=scott@gmail.com, mobile=17722222222, status=1, createTime=null, modifyTime=Fri Dec 25 08:47:40 CST 2020, lastLoginTime=null, sex=0, avatar=null, theme=null, isTab=null, description=我是scott。, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=2, roleName=null, deptIds=1,2, stringPermissions=null, roles=null)\"', '192.168.56.1', '2020-12-25 08:47:40', '内网IP|0|0|内网IP|内网IP');

-- ----------------------------
-- Table structure for t_login_log
-- ----------------------------
DROP TABLE IF EXISTS `t_login_log`;
CREATE TABLE `t_login_log`  (
  `ID` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `USERNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LOGIN_TIME` datetime DEFAULT NULL,
  `LOCATION` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IP` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SYSTEM` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BROWSER` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `t_login_log_login_time`(`LOGIN_TIME`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_login_log
-- ----------------------------
INSERT INTO `t_login_log` VALUES (5, 'MrBird', '2020-12-21 15:04:45', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (6, 'zhangsan', '2020-12-21 15:22:14', '法国|0|0|0|0', '2.0.4.14', 'Windows 10', '搜狗Chrome 72');
INSERT INTO `t_login_log` VALUES (7, 'MrBird', '2020-12-21 15:42:09', '法国|0|0|0|0', '2.0.4.14', 'Windows 10', '搜狗Chrome 72');
INSERT INTO `t_login_log` VALUES (8, 'MrBird', '2020-12-21 16:15:56', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (9, 'MrBird', '2020-12-21 16:19:14', '法国|0|0|0|0', '2.0.4.166', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (10, 'MrBird', '2020-12-21 16:59:26', '法国|0|0|0|0', '2.0.4.166', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (11, 'MrBird', '2020-12-21 22:00:49', '内网IP|0|0|内网IP|内网IP', '192.168.56.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (12, 'MrBird', '2020-12-22 10:14:38', '法国|0|0|0|0', '2.0.4.27', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (13, 'MrBird', '2020-12-22 10:52:46', '法国|0|0|0|0', '2.0.4.27', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (14, 'MrBird', '2020-12-22 11:19:58', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (15, 'MrBird', '2020-12-22 13:36:27', '法国|0|0|0|0', '2.0.4.27', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (16, 'MrBird', '2020-12-22 13:59:46', '法国|0|0|0|0', '2.0.4.27', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (17, 'admin', '2020-12-23 17:01:32', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (18, 'MrBird', '2020-12-23 17:09:18', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (19, 'MrBird', '2020-12-25 08:45:28', '内网IP|0|0|内网IP|内网IP', '192.168.56.1', 'Windows 10', 'Chrome 87');

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`  (
  `MENU_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单/按钮ID',
  `PARENT_ID` bigint(20) NOT NULL COMMENT '上级菜单ID',
  `MENU_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单/按钮名称',
  `URL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单URL',
  `PERMS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '权限标识',
  `ICON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图标',
  `TYPE` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型 0菜单 1按钮',
  `ORDER_NUM` bigint(20) DEFAULT NULL COMMENT '排序',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`MENU_ID`) USING BTREE,
  INDEX `t_menu_parent_id`(`PARENT_ID`) USING BTREE,
  INDEX `t_menu_menu_id`(`MENU_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 181 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES (1, 0, '系统管理', NULL, NULL, 'layui-icon-setting', '0', 1, '2017-12-27 16:39:07', NULL);
INSERT INTO `t_menu` VALUES (2, 0, '系统监控', '', '', 'layui-icon-alert', '0', 2, '2017-12-27 16:45:51', '2019-06-13 11:20:40');
INSERT INTO `t_menu` VALUES (3, 1, '用户管理', '/system/user', 'user:view', '', '0', 1, '2017-12-27 16:47:13', '2019-12-04 16:46:50');
INSERT INTO `t_menu` VALUES (4, 1, '角色管理', '/system/role', 'role:view', '', '0', 2, '2017-12-27 16:48:09', '2019-06-13 08:57:19');
INSERT INTO `t_menu` VALUES (5, 1, '菜单管理', '/system/menu', 'menu:view', '', '0', 3, '2017-12-27 16:48:57', '2019-06-13 08:57:34');
INSERT INTO `t_menu` VALUES (6, 1, '部门管理', '/system/dept', 'dept:view', '', '0', 4, '2017-12-27 16:57:33', '2019-06-14 19:56:00');
INSERT INTO `t_menu` VALUES (8, 2, '在线用户', '/monitor/online', 'online:view', '', '0', 1, '2017-12-27 16:59:33', '2019-06-13 14:30:31');
INSERT INTO `t_menu` VALUES (10, 2, '系统日志', '/monitor/log', 'log:view', '', '0', 2, '2017-12-27 17:00:50', '2019-06-13 14:30:37');
INSERT INTO `t_menu` VALUES (11, 3, '新增用户', NULL, 'user:add', NULL, '1', NULL, '2017-12-27 17:02:58', NULL);
INSERT INTO `t_menu` VALUES (12, 3, '修改用户', NULL, 'user:update', NULL, '1', NULL, '2017-12-27 17:04:07', NULL);
INSERT INTO `t_menu` VALUES (13, 3, '删除用户', NULL, 'user:delete', NULL, '1', NULL, '2017-12-27 17:04:58', NULL);
INSERT INTO `t_menu` VALUES (14, 4, '新增角色', NULL, 'role:add', NULL, '1', NULL, '2017-12-27 17:06:38', NULL);
INSERT INTO `t_menu` VALUES (15, 4, '修改角色', NULL, 'role:update', NULL, '1', NULL, '2017-12-27 17:06:38', NULL);
INSERT INTO `t_menu` VALUES (16, 4, '删除角色', NULL, 'role:delete', NULL, '1', NULL, '2017-12-27 17:06:38', NULL);
INSERT INTO `t_menu` VALUES (17, 5, '新增菜单', NULL, 'menu:add', NULL, '1', NULL, '2017-12-27 17:08:02', NULL);
INSERT INTO `t_menu` VALUES (18, 5, '修改菜单', NULL, 'menu:update', NULL, '1', NULL, '2017-12-27 17:08:02', NULL);
INSERT INTO `t_menu` VALUES (19, 5, '删除菜单', NULL, 'menu:delete', NULL, '1', NULL, '2017-12-27 17:08:02', NULL);
INSERT INTO `t_menu` VALUES (20, 6, '新增部门', NULL, 'dept:add', NULL, '1', NULL, '2017-12-27 17:09:24', NULL);
INSERT INTO `t_menu` VALUES (21, 6, '修改部门', NULL, 'dept:update', NULL, '1', NULL, '2017-12-27 17:09:24', NULL);
INSERT INTO `t_menu` VALUES (22, 6, '删除部门', NULL, 'dept:delete', NULL, '1', NULL, '2017-12-27 17:09:24', NULL);
INSERT INTO `t_menu` VALUES (23, 8, '踢出用户', NULL, 'user:kickout', NULL, '1', NULL, '2017-12-27 17:11:13', NULL);
INSERT INTO `t_menu` VALUES (24, 10, '删除日志', NULL, 'log:delete', NULL, '1', NULL, '2017-12-27 17:11:45', '2019-06-06 05:56:40');
INSERT INTO `t_menu` VALUES (101, 0, '任务调度', NULL, NULL, 'layui-icon-time-circle', '0', 3, '2018-02-24 15:52:57', NULL);
INSERT INTO `t_menu` VALUES (102, 101, '定时任务', '/job/job', 'job:view', '', '0', 1, '2018-02-24 15:53:53', '2018-04-25 09:05:12');
INSERT INTO `t_menu` VALUES (103, 102, '新增任务', NULL, 'job:add', NULL, '1', NULL, '2018-02-24 15:55:10', NULL);
INSERT INTO `t_menu` VALUES (104, 102, '修改任务', NULL, 'job:update', NULL, '1', NULL, '2018-02-24 15:55:53', NULL);
INSERT INTO `t_menu` VALUES (105, 102, '删除任务', NULL, 'job:delete', NULL, '1', NULL, '2018-02-24 15:56:18', NULL);
INSERT INTO `t_menu` VALUES (106, 102, '暂停任务', NULL, 'job:pause', NULL, '1', NULL, '2018-02-24 15:57:08', NULL);
INSERT INTO `t_menu` VALUES (107, 102, '恢复任务', NULL, 'job:resume', NULL, '1', NULL, '2018-02-24 15:58:21', NULL);
INSERT INTO `t_menu` VALUES (108, 102, '立即执行任务', NULL, 'job:run', NULL, '1', NULL, '2018-02-24 15:59:45', NULL);
INSERT INTO `t_menu` VALUES (109, 101, '调度日志', '/job/log', 'job:log:view', '', '0', 2, '2018-02-24 16:00:45', '2019-06-09 02:48:19');
INSERT INTO `t_menu` VALUES (110, 109, '删除日志', NULL, 'job:log:delete', NULL, '1', NULL, '2018-02-24 16:01:21', NULL);
INSERT INTO `t_menu` VALUES (115, 0, '其他模块', NULL, NULL, 'layui-icon-gift', '0', 5, '2019-05-27 10:18:07', NULL);
INSERT INTO `t_menu` VALUES (116, 115, 'Apex图表', '', '', NULL, '0', 2, '2019-05-27 10:21:35', NULL);
INSERT INTO `t_menu` VALUES (117, 116, '线性图表', '/others/apex/line', 'apex:line:view', NULL, '0', 1, '2019-05-27 10:24:49', NULL);
INSERT INTO `t_menu` VALUES (118, 115, '高德地图', '/others/map', 'map:view', '', '0', 3, '2019-05-27 17:13:12', '2019-06-12 15:33:00');
INSERT INTO `t_menu` VALUES (119, 116, '面积图表', '/others/apex/area', 'apex:area:view', NULL, '0', 2, '2019-05-27 18:49:22', NULL);
INSERT INTO `t_menu` VALUES (120, 116, '柱形图表', '/others/apex/column', 'apex:column:view', NULL, '0', 3, '2019-05-27 18:51:33', NULL);
INSERT INTO `t_menu` VALUES (121, 116, '雷达图表', '/others/apex/radar', 'apex:radar:view', NULL, '0', 4, '2019-05-27 18:56:05', NULL);
INSERT INTO `t_menu` VALUES (122, 116, '条形图表', '/others/apex/bar', 'apex:bar:view', NULL, '0', 5, '2019-05-27 18:57:02', NULL);
INSERT INTO `t_menu` VALUES (123, 116, '混合图表', '/others/apex/mix', 'apex:mix:view', '', '0', 6, '2019-05-27 18:58:04', '2019-06-06 02:55:23');
INSERT INTO `t_menu` VALUES (125, 115, '导入导出', '/others/eximport', 'others:eximport:view', '', '0', 4, '2019-05-27 19:01:57', '2019-06-13 01:20:14');
INSERT INTO `t_menu` VALUES (126, 132, '系统图标', '/others/febs/icon', 'febs:icons:view', '', '0', 4, '2019-05-27 19:03:18', '2019-06-06 03:05:26');
INSERT INTO `t_menu` VALUES (127, 2, '请求追踪', '/monitor/httptrace', 'httptrace:view', '', '0', 6, '2019-05-27 19:06:38', '2019-06-13 14:36:43');
INSERT INTO `t_menu` VALUES (128, 2, '系统信息', NULL, NULL, NULL, '0', 7, '2019-05-27 19:08:23', NULL);
INSERT INTO `t_menu` VALUES (129, 128, 'JVM信息', '/monitor/jvm', 'jvm:view', '', '0', 1, '2019-05-27 19:08:50', '2019-06-13 14:36:51');
INSERT INTO `t_menu` VALUES (131, 128, '服务器信息', '/monitor/server', 'server:view', '', '0', 3, '2019-05-27 19:10:07', '2019-06-13 14:37:04');
INSERT INTO `t_menu` VALUES (132, 115, 'FEBS组件', '', '', NULL, '0', 1, '2019-05-27 19:13:54', NULL);
INSERT INTO `t_menu` VALUES (133, 132, '表单组件', '/others/febs/form', 'febs:form:view', NULL, '0', 1, '2019-05-27 19:14:45', NULL);
INSERT INTO `t_menu` VALUES (134, 132, 'FEBS工具', '/others/febs/tools', 'febs:tools:view', '', '0', 3, '2019-05-29 10:11:22', '2019-06-12 13:21:27');
INSERT INTO `t_menu` VALUES (135, 132, '表单组合', '/others/febs/form/group', 'febs:formgroup:view', NULL, '0', 2, '2019-05-29 10:16:19', NULL);
INSERT INTO `t_menu` VALUES (136, 2, '登录日志', '/monitor/loginlog', 'loginlog:view', '', '0', 3, '2019-05-29 15:56:15', '2019-06-13 14:35:56');
INSERT INTO `t_menu` VALUES (137, 0, '代码生成', '', NULL, 'layui-icon-verticalright', '0', 4, '2019-06-03 15:35:58', NULL);
INSERT INTO `t_menu` VALUES (138, 137, '生成配置', '/generator/configure', 'generator:configure:view', NULL, '0', 1, '2019-06-03 15:38:36', NULL);
INSERT INTO `t_menu` VALUES (139, 137, '代码生成', '/generator/generator', 'generator:view', '', '0', 2, '2019-06-03 15:39:15', '2019-06-13 14:31:38');
INSERT INTO `t_menu` VALUES (159, 132, '其他组件', '/others/febs/others', 'others:febs:others', '', '0', 5, '2019-06-12 07:51:08', '2019-06-12 07:51:40');
INSERT INTO `t_menu` VALUES (160, 3, '密码重置', NULL, 'user:password:reset', NULL, '1', NULL, '2019-06-13 08:40:13', NULL);
INSERT INTO `t_menu` VALUES (161, 3, '导出Excel', NULL, 'user:export', NULL, '1', NULL, '2019-06-13 08:40:34', NULL);
INSERT INTO `t_menu` VALUES (162, 4, '导出Excel', NULL, 'role:export', NULL, '1', NULL, '2019-06-13 14:29:00', '2019-06-13 14:29:11');
INSERT INTO `t_menu` VALUES (163, 5, '导出Excel', NULL, 'menu:export', NULL, '1', NULL, '2019-06-13 14:29:32', NULL);
INSERT INTO `t_menu` VALUES (164, 6, '导出Excel', NULL, 'dept:export', NULL, '1', NULL, '2019-06-13 14:29:59', NULL);
INSERT INTO `t_menu` VALUES (165, 138, '修改配置', NULL, 'generator:configure:update', NULL, '1', NULL, '2019-06-13 14:32:09', '2019-06-13 14:32:20');
INSERT INTO `t_menu` VALUES (166, 139, '生成代码', NULL, 'generator:generate', NULL, '1', NULL, '2019-06-13 14:32:51', NULL);
INSERT INTO `t_menu` VALUES (167, 125, '模板下载', NULL, 'eximport:template', NULL, '1', NULL, '2019-06-13 14:33:37', NULL);
INSERT INTO `t_menu` VALUES (168, 125, '导出Excel', NULL, 'eximport:export', NULL, '1', NULL, '2019-06-13 14:33:57', NULL);
INSERT INTO `t_menu` VALUES (169, 125, '导入Excel', NULL, 'eximport:import', NULL, '1', NULL, '2019-06-13 14:34:19', NULL);
INSERT INTO `t_menu` VALUES (170, 10, '导出Excel', NULL, 'log:export', NULL, '1', NULL, '2019-06-13 14:34:55', NULL);
INSERT INTO `t_menu` VALUES (171, 136, '删除日志', NULL, 'loginlog:delete', NULL, '1', NULL, '2019-06-13 14:35:27', '2019-06-13 14:36:08');
INSERT INTO `t_menu` VALUES (172, 136, '导出Excel', NULL, 'loginlog:export', NULL, '1', NULL, '2019-06-13 14:36:26', NULL);
INSERT INTO `t_menu` VALUES (173, 102, '导出Excel', NULL, 'job:export', NULL, '1', NULL, '2019-06-13 14:37:25', NULL);
INSERT INTO `t_menu` VALUES (174, 109, '导出Excel', NULL, 'job:log:export', NULL, '1', NULL, '2019-06-13 14:37:46', '2019-06-13 14:38:02');
INSERT INTO `t_menu` VALUES (175, 2, 'Swagger文档', '/monitor/swagger', 'swagger:view', '', '0', 8, '2019-08-18 17:25:36', '2019-08-18 17:25:59');
INSERT INTO `t_menu` VALUES (178, 115, '数据权限', '/others/datapermission', 'others:datapermission', '', '0', 5, '2020-04-29 09:34:25', NULL);
INSERT INTO `t_menu` VALUES (179, 0, '文档管理', '', '', 'layui-icon-file', '0', 6, '2020-12-21 16:02:32', '2020-12-21 16:24:55');
INSERT INTO `t_menu` VALUES (180, 179, '文档一览', '/others/eximport', '', 'layui-icon-fileprotect', '0', 1, '2020-12-22 10:46:19', '2020-12-22 13:40:39');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `ROLE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `ROLE_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REMARK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '系统管理员', '系统管理员，拥有所有操作权限 ^_^', '2019-06-14 16:23:11', '2020-12-22 13:39:07');
INSERT INTO `t_role` VALUES (2, '注册账户', '注册账户，拥有查看，新增权限（新增用户除外）和导出Excel权限', '2019-06-14 16:00:15', '2020-12-25 08:47:10');
INSERT INTO `t_role` VALUES (77, 'Redis监控员', '负责Redis模块', '2019-06-14 20:49:22', NULL);
INSERT INTO `t_role` VALUES (78, '系统监控员', '负责整个系统监控模块', '2019-06-14 20:50:07', NULL);
INSERT INTO `t_role` VALUES (79, '跑批人员', '负责任务调度跑批模块', '2019-06-14 20:51:02', NULL);
INSERT INTO `t_role` VALUES (80, '开发人员', '拥有代码生成模块的权限', '2019-06-14 20:51:26', NULL);

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu`  (
  `ROLE_ID` bigint(20) NOT NULL COMMENT '角色ID',
  `MENU_ID` bigint(20) NOT NULL COMMENT '菜单/按钮ID',
  INDEX `t_role_menu_menu_id`(`MENU_ID`) USING BTREE,
  INDEX `t_role_menu_role_id`(`ROLE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES (77, 2);
INSERT INTO `t_role_menu` VALUES (78, 2);
INSERT INTO `t_role_menu` VALUES (78, 8);
INSERT INTO `t_role_menu` VALUES (78, 23);
INSERT INTO `t_role_menu` VALUES (78, 10);
INSERT INTO `t_role_menu` VALUES (78, 24);
INSERT INTO `t_role_menu` VALUES (78, 170);
INSERT INTO `t_role_menu` VALUES (78, 136);
INSERT INTO `t_role_menu` VALUES (78, 171);
INSERT INTO `t_role_menu` VALUES (78, 172);
INSERT INTO `t_role_menu` VALUES (78, 127);
INSERT INTO `t_role_menu` VALUES (78, 128);
INSERT INTO `t_role_menu` VALUES (78, 129);
INSERT INTO `t_role_menu` VALUES (78, 131);
INSERT INTO `t_role_menu` VALUES (79, 101);
INSERT INTO `t_role_menu` VALUES (79, 102);
INSERT INTO `t_role_menu` VALUES (79, 103);
INSERT INTO `t_role_menu` VALUES (79, 104);
INSERT INTO `t_role_menu` VALUES (79, 105);
INSERT INTO `t_role_menu` VALUES (79, 106);
INSERT INTO `t_role_menu` VALUES (79, 107);
INSERT INTO `t_role_menu` VALUES (79, 108);
INSERT INTO `t_role_menu` VALUES (79, 173);
INSERT INTO `t_role_menu` VALUES (79, 109);
INSERT INTO `t_role_menu` VALUES (79, 110);
INSERT INTO `t_role_menu` VALUES (79, 174);
INSERT INTO `t_role_menu` VALUES (80, 137);
INSERT INTO `t_role_menu` VALUES (80, 138);
INSERT INTO `t_role_menu` VALUES (80, 165);
INSERT INTO `t_role_menu` VALUES (80, 139);
INSERT INTO `t_role_menu` VALUES (80, 166);
INSERT INTO `t_role_menu` VALUES (1, 1);
INSERT INTO `t_role_menu` VALUES (1, 3);
INSERT INTO `t_role_menu` VALUES (1, 11);
INSERT INTO `t_role_menu` VALUES (1, 12);
INSERT INTO `t_role_menu` VALUES (1, 13);
INSERT INTO `t_role_menu` VALUES (1, 160);
INSERT INTO `t_role_menu` VALUES (1, 161);
INSERT INTO `t_role_menu` VALUES (1, 4);
INSERT INTO `t_role_menu` VALUES (1, 14);
INSERT INTO `t_role_menu` VALUES (1, 15);
INSERT INTO `t_role_menu` VALUES (1, 16);
INSERT INTO `t_role_menu` VALUES (1, 162);
INSERT INTO `t_role_menu` VALUES (1, 5);
INSERT INTO `t_role_menu` VALUES (1, 17);
INSERT INTO `t_role_menu` VALUES (1, 18);
INSERT INTO `t_role_menu` VALUES (1, 19);
INSERT INTO `t_role_menu` VALUES (1, 163);
INSERT INTO `t_role_menu` VALUES (1, 6);
INSERT INTO `t_role_menu` VALUES (1, 20);
INSERT INTO `t_role_menu` VALUES (1, 21);
INSERT INTO `t_role_menu` VALUES (1, 22);
INSERT INTO `t_role_menu` VALUES (1, 164);
INSERT INTO `t_role_menu` VALUES (1, 2);
INSERT INTO `t_role_menu` VALUES (1, 8);
INSERT INTO `t_role_menu` VALUES (1, 23);
INSERT INTO `t_role_menu` VALUES (1, 10);
INSERT INTO `t_role_menu` VALUES (1, 24);
INSERT INTO `t_role_menu` VALUES (1, 170);
INSERT INTO `t_role_menu` VALUES (1, 136);
INSERT INTO `t_role_menu` VALUES (1, 171);
INSERT INTO `t_role_menu` VALUES (1, 172);
INSERT INTO `t_role_menu` VALUES (1, 127);
INSERT INTO `t_role_menu` VALUES (1, 128);
INSERT INTO `t_role_menu` VALUES (1, 129);
INSERT INTO `t_role_menu` VALUES (1, 131);
INSERT INTO `t_role_menu` VALUES (1, 175);
INSERT INTO `t_role_menu` VALUES (1, 101);
INSERT INTO `t_role_menu` VALUES (1, 102);
INSERT INTO `t_role_menu` VALUES (1, 103);
INSERT INTO `t_role_menu` VALUES (1, 104);
INSERT INTO `t_role_menu` VALUES (1, 105);
INSERT INTO `t_role_menu` VALUES (1, 106);
INSERT INTO `t_role_menu` VALUES (1, 107);
INSERT INTO `t_role_menu` VALUES (1, 108);
INSERT INTO `t_role_menu` VALUES (1, 173);
INSERT INTO `t_role_menu` VALUES (1, 109);
INSERT INTO `t_role_menu` VALUES (1, 110);
INSERT INTO `t_role_menu` VALUES (1, 174);
INSERT INTO `t_role_menu` VALUES (1, 137);
INSERT INTO `t_role_menu` VALUES (1, 138);
INSERT INTO `t_role_menu` VALUES (1, 165);
INSERT INTO `t_role_menu` VALUES (1, 139);
INSERT INTO `t_role_menu` VALUES (1, 166);
INSERT INTO `t_role_menu` VALUES (1, 115);
INSERT INTO `t_role_menu` VALUES (1, 132);
INSERT INTO `t_role_menu` VALUES (1, 133);
INSERT INTO `t_role_menu` VALUES (1, 135);
INSERT INTO `t_role_menu` VALUES (1, 134);
INSERT INTO `t_role_menu` VALUES (1, 126);
INSERT INTO `t_role_menu` VALUES (1, 159);
INSERT INTO `t_role_menu` VALUES (1, 116);
INSERT INTO `t_role_menu` VALUES (1, 117);
INSERT INTO `t_role_menu` VALUES (1, 119);
INSERT INTO `t_role_menu` VALUES (1, 120);
INSERT INTO `t_role_menu` VALUES (1, 121);
INSERT INTO `t_role_menu` VALUES (1, 122);
INSERT INTO `t_role_menu` VALUES (1, 123);
INSERT INTO `t_role_menu` VALUES (1, 118);
INSERT INTO `t_role_menu` VALUES (1, 125);
INSERT INTO `t_role_menu` VALUES (1, 167);
INSERT INTO `t_role_menu` VALUES (1, 168);
INSERT INTO `t_role_menu` VALUES (1, 169);
INSERT INTO `t_role_menu` VALUES (1, 178);
INSERT INTO `t_role_menu` VALUES (1, 179);
INSERT INTO `t_role_menu` VALUES (1, 180);
INSERT INTO `t_role_menu` VALUES (2, 161);
INSERT INTO `t_role_menu` VALUES (2, 14);
INSERT INTO `t_role_menu` VALUES (2, 162);
INSERT INTO `t_role_menu` VALUES (2, 17);
INSERT INTO `t_role_menu` VALUES (2, 163);
INSERT INTO `t_role_menu` VALUES (2, 20);
INSERT INTO `t_role_menu` VALUES (2, 164);
INSERT INTO `t_role_menu` VALUES (2, 2);
INSERT INTO `t_role_menu` VALUES (2, 8);
INSERT INTO `t_role_menu` VALUES (2, 10);
INSERT INTO `t_role_menu` VALUES (2, 170);
INSERT INTO `t_role_menu` VALUES (2, 136);
INSERT INTO `t_role_menu` VALUES (2, 172);
INSERT INTO `t_role_menu` VALUES (2, 127);
INSERT INTO `t_role_menu` VALUES (2, 128);
INSERT INTO `t_role_menu` VALUES (2, 129);
INSERT INTO `t_role_menu` VALUES (2, 131);
INSERT INTO `t_role_menu` VALUES (2, 175);
INSERT INTO `t_role_menu` VALUES (2, 101);
INSERT INTO `t_role_menu` VALUES (2, 102);
INSERT INTO `t_role_menu` VALUES (2, 173);
INSERT INTO `t_role_menu` VALUES (2, 109);
INSERT INTO `t_role_menu` VALUES (2, 174);
INSERT INTO `t_role_menu` VALUES (2, 137);
INSERT INTO `t_role_menu` VALUES (2, 138);
INSERT INTO `t_role_menu` VALUES (2, 139);
INSERT INTO `t_role_menu` VALUES (2, 115);
INSERT INTO `t_role_menu` VALUES (2, 132);
INSERT INTO `t_role_menu` VALUES (2, 133);
INSERT INTO `t_role_menu` VALUES (2, 135);
INSERT INTO `t_role_menu` VALUES (2, 134);
INSERT INTO `t_role_menu` VALUES (2, 126);
INSERT INTO `t_role_menu` VALUES (2, 159);
INSERT INTO `t_role_menu` VALUES (2, 116);
INSERT INTO `t_role_menu` VALUES (2, 117);
INSERT INTO `t_role_menu` VALUES (2, 119);
INSERT INTO `t_role_menu` VALUES (2, 120);
INSERT INTO `t_role_menu` VALUES (2, 121);
INSERT INTO `t_role_menu` VALUES (2, 122);
INSERT INTO `t_role_menu` VALUES (2, 123);
INSERT INTO `t_role_menu` VALUES (2, 118);
INSERT INTO `t_role_menu` VALUES (2, 125);
INSERT INTO `t_role_menu` VALUES (2, 167);
INSERT INTO `t_role_menu` VALUES (2, 178);
INSERT INTO `t_role_menu` VALUES (2, 179);
INSERT INTO `t_role_menu` VALUES (2, 180);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `USER_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `USERNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PASSWORD` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DEPT_ID` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `EMAIL` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MOBILE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `STATUS` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `LAST_LOGIN_TIME` datetime DEFAULT NULL,
  `SSEX` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_TAB` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `THEME` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AVATAR` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DESCRIPTION` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`USER_ID`) USING BTREE,
  INDEX `t_user_username`(`USERNAME`) USING BTREE,
  INDEX `t_user_mobile`(`MOBILE`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'MrBird', 'b9a81e45893e814679a13d79e4617dfd', 1, 'mrbird@qq.com', '17788888888', '1', '2019-06-14 20:39:22', '2020-12-22 11:27:46', '2020-12-25 08:45:29', '0', '0', 'black', 'cnrhVkzwxjPwAaCfPbdc.png', '我是帅比作者。');
INSERT INTO `t_user` VALUES (2, 'Scott', '1d685729d113cfd03872f154939bee1c', 2, 'scott@gmail.com', '17722222222', '1', '2019-06-14 20:55:53', '2020-12-25 08:47:40', '2020-12-21 14:38:43', '0', '1', 'black', 'gaOngJwsRYRaVAuXXcmB.png', '我是scott。');
INSERT INTO `t_user` VALUES (3, 'Reina', '1461afff857c02afbfb768aa3771503d', 4, 'Reina@hotmail.com', '17711111111', '0', '2019-06-14 21:07:38', '2019-06-14 21:09:06', '2019-06-14 21:08:26', '1', '1', 'black', '5997fedcc7bd4cffbd350b40d1b5b987.jpg', '由于公款私用，已被封禁。');
INSERT INTO `t_user` VALUES (5, 'Jana', '176679b77b3c3e352bd3b30ddc81083e', 8, 'Jana@126.com', '17744444444', '1', '2019-06-14 21:12:16', '2019-06-14 21:12:52', '2019-06-14 21:12:32', '1', '1', 'white', '20180414165821.jpg', '大家好，我叫简娜');
INSERT INTO `t_user` VALUES (7, 'Margot', '31379841b9f4bfde22b8b40471e9a6ce', 9, 'Margot@qq.com', '13444444444', '1', '2019-06-14 21:17:53', '2019-06-14 21:18:59', '2019-06-14 21:18:07', '1', '1', 'white', '20180414165834.jpg', '大家好我叫玛戈');
INSERT INTO `t_user` VALUES (8, 'zhangsan', '92dac726ea92d5bdd01eab9aef544c95', NULL, NULL, NULL, '1', '2020-12-21 13:21:51', NULL, '2020-12-21 15:22:16', '2', '1', 'black', 'default.jpg', '注册用户');
INSERT INTO `t_user` VALUES (9, 'test', 'c8ca90a2ea885784ed3517fd502329e8', NULL, NULL, NULL, '0', '2020-12-25 13:40:36', NULL, NULL, '2', '1', 'black', 'default.jpg', '注册用户');
INSERT INTO `t_user` VALUES (10, 'test1', '4185ceee1cc9a58238752bcfc9f48f27', NULL, NULL, NULL, '0', '2020-12-25 13:59:05', NULL, NULL, '2', '1', 'black', 'default.jpg', '注册用户');
INSERT INTO `t_user` VALUES (11, 'test2', '3134be371e3e0cec5c4adc5a6cd8531e', NULL, NULL, NULL, '0', '2020-12-25 13:59:25', NULL, NULL, '2', '1', 'black', 'default.jpg', '注册用户');

-- ----------------------------
-- Table structure for t_user_data_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_user_data_permission`;
CREATE TABLE `t_user_data_permission`  (
  `USER_ID` bigint(20) NOT NULL,
  `DEPT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`USER_ID`, `DEPT_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user_data_permission
-- ----------------------------
INSERT INTO `t_user_data_permission` VALUES (1, 1);
INSERT INTO `t_user_data_permission` VALUES (1, 2);
INSERT INTO `t_user_data_permission` VALUES (1, 3);
INSERT INTO `t_user_data_permission` VALUES (2, 1);
INSERT INTO `t_user_data_permission` VALUES (2, 2);

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `USER_ID` bigint(20) NOT NULL COMMENT '用户ID',
  `ROLE_ID` bigint(20) NOT NULL COMMENT '角色ID',
  INDEX `t_user_role_user_id`(`USER_ID`) USING BTREE,
  INDEX `t_user_role_role_id`(`ROLE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (1, 1);
INSERT INTO `t_user_role` VALUES (3, 77);
INSERT INTO `t_user_role` VALUES (5, 79);
INSERT INTO `t_user_role` VALUES (7, 78);
INSERT INTO `t_user_role` VALUES (7, 79);
INSERT INTO `t_user_role` VALUES (7, 80);
INSERT INTO `t_user_role` VALUES (8, 2);
INSERT INTO `t_user_role` VALUES (2, 2);
INSERT INTO `t_user_role` VALUES (9, 2);
INSERT INTO `t_user_role` VALUES (10, 2);
INSERT INTO `t_user_role` VALUES (11, 2);

SET FOREIGN_KEY_CHECKS = 1;
