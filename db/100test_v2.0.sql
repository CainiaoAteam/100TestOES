/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50521
 Source Host           : localhost:3306
 Source Schema         : 100test

 Target Server Type    : MySQL
 Target Server Version : 50521
 File Encoding         : 65001

 Date: 23/04/2018 19:43:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `adminid` int(11) NOT NULL AUTO_INCREMENT,
  `adminname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `adminpwd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `adminno` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`adminid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (101, '老李', '123', '101');
INSERT INTO `admin` VALUES (102, '老张', '123', '102');
INSERT INTO `admin` VALUES (103, '老郭', '123', '103');

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam`  (
  `examid` int(10) NOT NULL,
  `tid` int(10) NULL DEFAULT NULL,
  `examno` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tpid` int(10) NULL DEFAULT NULL,
  `examday` datetime NULL DEFAULT NULL,
  `examtime` int(10) NULL DEFAULT NULL,
  `examname` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`examid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES (1, NULL, '10001', 1, '2018-04-24 10:30:00', 120, 'xx考试');
INSERT INTO `exam` VALUES (2, NULL, '10002', 1, '2018-04-25 15:32:56', 120, 'fsgkahios');
INSERT INTO `exam` VALUES (3, NULL, '10003', 2, '2018-04-26 15:33:25', 120, 'dhddjdj');
INSERT INTO `exam` VALUES (4, NULL, '10004', 2, '2018-04-14 15:33:41', 150, 'dgshshrhr');

-- ----------------------------
-- Table structure for fillquestion
-- ----------------------------
DROP TABLE IF EXISTS `fillquestion`;
CREATE TABLE `fillquestion`  (
  `fqid` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `tid` int(11) NULL DEFAULT NULL,
  `fqno` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fquestion` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fanswer` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fexplanation` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `difficulty` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tpid` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`fqid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fillquestion
-- ----------------------------
INSERT INTO `fillquestion` VALUES (0000000001, NULL, '10001', '《静夜思》是谁写的诗？', '李白', '就是李白！', '简单', NULL);
INSERT INTO `fillquestion` VALUES (0000000002, NULL, '10002', '《静夜思》是谁写的诗？', '李白', '就是李白！', '简单', NULL);
INSERT INTO `fillquestion` VALUES (0000000004, NULL, '10004', '《静夜思》是谁写的诗？', '李白', '就是李白！', '简单', NULL);
INSERT INTO `fillquestion` VALUES (0000000005, NULL, '10005', '《静夜思》是谁写的诗？', '李白', '就是李白！', '简单', NULL);
INSERT INTO `fillquestion` VALUES (0000000006, NULL, '10006', '《静夜思》是谁写的诗？', '李白', '就是李白！', '简单', NULL);

-- ----------------------------
-- Table structure for multipquestion
-- ----------------------------
DROP TABLE IF EXISTS `multipquestion`;
CREATE TABLE `multipquestion`  (
  `mqid` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `tid` int(10) NULL DEFAULT NULL,
  `mqno` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mquestion` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mchoiceA` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mchoiceB` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mchoiceC` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mchoiceD` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `manswer` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mexplanation` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `difficulty` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tpid` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`mqid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of multipquestion
-- ----------------------------
INSERT INTO `multipquestion` VALUES (0000000001, NULL, '10001', '哪两个数字相加等于4？', '1和2', ' 2和2 ', '2和3', '1和3', 'BD', '因为2+2=4和1+3=4，所以选择BD', '简单', NULL);
INSERT INTO `multipquestion` VALUES (0000000002, NULL, '10002', '哪两个数字相加等于4？', '1和2', '2和2 ', '2和3', '1和3', 'BD', '因为2+2=4和1+3=4，所以选择BD', '简单', NULL);
INSERT INTO `multipquestion` VALUES (0000000003, NULL, '10003', '哪两个数字相加等于4？', '1和2', '2和2 ', '2和3', '1和3', 'BD', '因为2+2=4和1+3=4，所以选择BD', '简单', NULL);
INSERT INTO `multipquestion` VALUES (0000000004, NULL, '10004', '哪两个数字相加等于4？', '1和2', '2和2 ', '2和3', '1和3', 'BD', '因为2+2=4和1+3=4，所以选择BD', '简单', NULL);
INSERT INTO `multipquestion` VALUES (0000000005, NULL, '10005', '哪两个数字相加等于4？', '1和2', '2和2 ', '2和3', '1和3', 'BD', '因为2+2=4和1+3=4，所以选择BD', '简单', NULL);
INSERT INTO `multipquestion` VALUES (0000000006, NULL, '10006', '哪两个数字相加等于4？', '1和2', '2和2 ', '2和3', '1和3', 'BD', '因为2+2=4和1+3=4，所以选择BD', '简单', NULL);

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `rid` int(10) NOT NULL AUTO_INCREMENT,
  `sid` int(10) NULL DEFAULT NULL,
  `tpid` int(10) NULL DEFAULT NULL,
  `score` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`rid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for singlequestion
-- ----------------------------
DROP TABLE IF EXISTS `singlequestion`;
CREATE TABLE `singlequestion`  (
  `sqid` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `tid` int(10) NULL DEFAULT NULL,
  `sqno` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `squestion` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `schoiceA` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `schoiceB` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `schoiceC` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `schoiceD` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sanswer` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sexplanation` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `difficulty` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tpid` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sqid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of singlequestion
-- ----------------------------
INSERT INTO `singlequestion` VALUES (0000000001, NULL, '10001', '《蜀道难》是谁写的？', '李白', '杜甫', '李商隐', '杜牧', 'A', '就是李白！', '简单', NULL);
INSERT INTO `singlequestion` VALUES (0000000002, NULL, '10002', '《蜀道难》是谁写的？', '李白', '杜甫', '李商隐', '杜牧', 'A', '就是李白！', '简单', NULL);
INSERT INTO `singlequestion` VALUES (0000000003, NULL, '10003', '《蜀道难》是谁写的？', '李白', '杜甫', '李商隐', '杜牧', 'A', '就是李白！', '简单', NULL);
INSERT INTO `singlequestion` VALUES (0000000004, NULL, '10004', '《蜀道难》是谁写的？', '李白', '杜甫', '李商隐', '杜牧', 'A', '就是李白！', '简单', NULL);
INSERT INTO `singlequestion` VALUES (0000000005, NULL, '10005', '《蜀道难》是谁写的？', '李白', '杜甫', '李商隐', '杜牧', 'A', '就是李白！', '简单', NULL);
INSERT INTO `singlequestion` VALUES (0000000006, NULL, '10006', '《蜀道难》是谁写的？', '李白', '杜甫', '李商隐', '杜牧', 'A', '就是李白！', '简单', NULL);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `sid` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `sno` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sname` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `idcardnum` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `department` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `grade` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110005 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (0000110001, '2015030101', '小明', '男', '445522401', '123', '计算机学院', '15软件1班', '123');
INSERT INTO `student` VALUES (0000110002, '2015030102', '小红', '女', '445522402', '1234', '计算机学院', '15软件1班', '234');
INSERT INTO `student` VALUES (0000110003, '2015030103', '小鑫', '男', '445522403', '123', '计算机学院', '15软件1班', '345');
INSERT INTO `student` VALUES (0000110004, '123456', 'fsf', 'va', 'cafff', '12345', 'acac', 'cC', '3725');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `tid` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `tno` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tname` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `idcardnum` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21003 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (0000021001, '201524101', '老杨', '男', '3322110001', '123', '12345');
INSERT INTO `teacher` VALUES (0000021002, '201524102', '老李', '女', '3322110002', '123', '12345');

-- ----------------------------
-- Table structure for testpaper
-- ----------------------------
DROP TABLE IF EXISTS `testpaper`;
CREATE TABLE `testpaper`  (
  `tpid` int(10) NOT NULL AUTO_INCREMENT,
  `tpno` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tpname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `squestion` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mquestion` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fquestion` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `squestionscore` int(10) NULL DEFAULT NULL,
  `mquestionscore` int(10) NULL DEFAULT NULL,
  `fquestionscore` int(10) NULL DEFAULT NULL,
  `totalscore` int(10) NULL DEFAULT NULL,
  `state` int(2) NULL DEFAULT NULL,
  PRIMARY KEY (`tpid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of testpaper
-- ----------------------------
INSERT INTO `testpaper` VALUES (1, '10001', '2018-2019语文期末考', '1,2,3,4,5', '1,2,3,4,5', '1,2,4,5,6', 5, 10, 5, 100, 0);

-- ----------------------------
-- Table structure for tp_fq
-- ----------------------------
DROP TABLE IF EXISTS `tp_fq`;
CREATE TABLE `tp_fq`  (
  `tpid` int(11) NULL DEFAULT NULL,
  `fqid` int(11) NULL DEFAULT NULL,
  `tf_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`tf_id`) USING BTREE,
  INDEX `外键1`(`tpid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tp_fq
-- ----------------------------
INSERT INTO `tp_fq` VALUES (1, 1, 1);
INSERT INTO `tp_fq` VALUES (1, 2, 2);
INSERT INTO `tp_fq` VALUES (1, 3, 3);
INSERT INTO `tp_fq` VALUES (1, 4, 4);
INSERT INTO `tp_fq` VALUES (1, 5, 5);

-- ----------------------------
-- Table structure for tp_mq
-- ----------------------------
DROP TABLE IF EXISTS `tp_mq`;
CREATE TABLE `tp_mq`  (
  `tpid` int(11) NULL DEFAULT NULL,
  `mqid` int(11) NULL DEFAULT NULL,
  `tm_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`tm_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tp_mq
-- ----------------------------
INSERT INTO `tp_mq` VALUES (1, 1, 1);
INSERT INTO `tp_mq` VALUES (1, 2, 2);
INSERT INTO `tp_mq` VALUES (1, 3, 3);
INSERT INTO `tp_mq` VALUES (1, 4, 4);
INSERT INTO `tp_mq` VALUES (1, 5, 5);

-- ----------------------------
-- Table structure for tp_sq
-- ----------------------------
DROP TABLE IF EXISTS `tp_sq`;
CREATE TABLE `tp_sq`  (
  `tpid` int(11) NULL DEFAULT NULL,
  `sqid` int(11) NULL DEFAULT NULL,
  `ts_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ts_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tp_sq
-- ----------------------------
INSERT INTO `tp_sq` VALUES (1, 1, 1);
INSERT INTO `tp_sq` VALUES (1, 2, 2);
INSERT INTO `tp_sq` VALUES (1, 3, 3);
INSERT INTO `tp_sq` VALUES (1, 4, 4);
INSERT INTO `tp_sq` VALUES (1, 5, 5);

SET FOREIGN_KEY_CHECKS = 1;
