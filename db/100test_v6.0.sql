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

 Date: 26/04/2018 21:28:12
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
  `examid` int(10) NOT NULL AUTO_INCREMENT,
  `tid` int(10) NULL DEFAULT NULL,
  `examno` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tpid` int(10) NULL DEFAULT NULL,
  `examday` datetime NULL DEFAULT NULL,
  `examtime` int(10) NULL DEFAULT NULL,
  `examname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`examid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES (1, 21001, '10001', 1, '2018-04-24 10:30:00', 30, 'xx考试', 1);
INSERT INTO `exam` VALUES (2, 21001, '10002', 1, '2018-04-25 15:32:56', 30, '考试二', 1);
INSERT INTO `exam` VALUES (3, 21002, '10003', 2, '2018-04-26 15:33:25', 40, 'dhddjdj', 0);
INSERT INTO `exam` VALUES (4, 21002, '10004', 2, '2018-04-14 15:33:41', 45, 'dgshshrhr', 0);
INSERT INTO `exam` VALUES (5, 21001, '10005', 1, '2018-04-26 02:05:00', 20, '考试科目一', 0);
INSERT INTO `exam` VALUES (6, 21002, '10006', 2, '2018-04-27 00:00:00', 20, '考试科目二', 0);
INSERT INTO `exam` VALUES (10, 21001, 'e22bd820-f488-42e4-90d9-6f54db8d90a8', 3, '2018-04-26 17:00:00', 30, '国际雅思在线测试', 0);
INSERT INTO `exam` VALUES (11, 21001, 'd23e618c-2c36-46b9-b6bf-7f511de8c915', 3, '2018-04-26 18:50:00', 30, '这他妈是一个实测考试', 0);
INSERT INTO `exam` VALUES (12, 21001, '52738627-62e3-411d-b0b2-dae8689efbb6', 3, '2018-04-26 20:20:00', 30, '第一次考试', 1);

-- ----------------------------
-- Table structure for fillquestion
-- ----------------------------
DROP TABLE IF EXISTS `fillquestion`;
CREATE TABLE `fillquestion`  (
  `fqid` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `tid` int(11) NULL DEFAULT NULL,
  `fqno` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fquestion` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fanswer` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fexplanation` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `difficulty` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`fqid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fillquestion
-- ----------------------------
INSERT INTO `fillquestion` VALUES (0000000001, 21001, '10007', 'His favorite food is fried snacks and soft drinks.____ is no surprise that losing weight is just his dream.', 'it', 'xxxxxxx', '简单');
INSERT INTO `fillquestion` VALUES (0000000002, 21001, '10008', 'It is by no means clear ____ the president can do to end the strike.', 'what', 'xxxxxxx', '简单');
INSERT INTO `fillquestion` VALUES (0000000003, 21001, '10009', 'At school, some students are active ____ some are shy, yet they can be good friends with one another.', 'while', 'xxxxxxx', '简单');
INSERT INTO `fillquestion` VALUES (0000000004, 21001, '100010', 'You never know where happiness will turn ____next, so grasp every chance around you.', 'up', 'xxxxxxx', '一般');
INSERT INTO `fillquestion` VALUES (0000000005, 21001, '100011', 'As the road to the airport is under reconstruction, we\'d better set ____ early to avoid the traffic jam.', 'off', 'xxxxxxx', '一般');
INSERT INTO `fillquestion` VALUES (0000000006, 21001, '100012', 'Legend has it that the origin of the Dragon Boat Festival is____(recall) the soul of Qu Yuan.', 'to recall', 'xxxxxxx', '困难');
INSERT INTO `fillquestion` VALUES (0000000007, 21001, '10007', 'His favorite food is fried snacks and soft drinks.____ is no surprise that losing weight is just his dream.', 'it', 'xxxxxxx', '简单');
INSERT INTO `fillquestion` VALUES (0000000008, 21001, '10008', 'It is by no means clear ____ the president can do to end the strike.', 'what', 'xxxxxxx', '简单');
INSERT INTO `fillquestion` VALUES (0000000009, 21001, '10009', 'At school, some students are active ____ some are shy, yet they can be good friends with one another.', 'while', 'xxxxxxx', '简单');
INSERT INTO `fillquestion` VALUES (0000000010, 21001, '100010', 'You never know where happiness will turn ____next, so grasp every chance around you.', 'up', 'xxxxxxx', '一般');
INSERT INTO `fillquestion` VALUES (0000000011, 21001, '100011', 'As the road to the airport is under reconstruction, we\'d better set ____ early to avoid the traffic jam.', 'off', 'xxxxxxx', '一般');
INSERT INTO `fillquestion` VALUES (0000000012, 21001, '100012', 'Legend has it that the origin of the Dragon Boat Festival is____(recall) the soul of Qu Yuan.', 'to recall', 'xxxxxxx', '绝望');

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
  PRIMARY KEY (`mqid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of multipquestion
-- ----------------------------
INSERT INTO `multipquestion` VALUES (0000000001, 21001, '10001', '哪两个数字11相加等于4？', '1和2', ' 2和2 ', '2和3', '1和3', 'BD', '因为2+2=4和1+3=4，所以选择BD', '简单');
INSERT INTO `multipquestion` VALUES (0000000002, 21001, '10007', 'The Science Museum, _____ we visited during a recent trip to Britain, is one of London’s tourists attractions.', 'which', 'what', 'that ', 'where', 'AB', '就是选AB！', '简单');
INSERT INTO `multipquestion` VALUES (0000000003, 21001, '10008', 'He speaks English well indeed, but of course not ____ a native speaker.', 'as fluent as', 'so fluently as', 'more fluent than', 'much fluently than', 'BC', '就是选BC！', '简单');
INSERT INTO `multipquestion` VALUES (0000000004, 21001, '10009', 'The English spoken in the United States is only slightly different from ____ spoken in England.', 'which', 'what', 'that', 'the one', 'CD', '就是选CD！', '简单');
INSERT INTO `multipquestion` VALUES (0000000005, 21001, '100010', 'Some people like wearing fashionable clothes; ______, some birds like bright feathers.', 'possibly', 'likely', 'luckily', 'similarly', 'AD', '就是选AD！', '一般');
INSERT INTO `multipquestion` VALUES (0000000006, 21001, '100011', 'We were in ________ when we left that we forgot the airline tickets.', 'a rush so anxious', 'a rush so anxious', 'so anxious rush', 'so anxious rush', 'AD', '就是选AD！', '一般');
INSERT INTO `multipquestion` VALUES (0000000007, 21001, '100012', '_______ in ancient times, the book still appeals to readers today.', 'Though written', ' It was written', 'Having written', 'Though writing', 'AB', '就是选AB！', '一般');
INSERT INTO `multipquestion` VALUES (0000000008, 21001, '100013', 'The boy ______ the window and ______ a man ______his neighbor’s house.', 'looking out of; seeing; entered', ' looked out of; saw; entering in', ' looked out of; saw; entering in', ' looking out of; seeing; entered in', 'CD', '就是选CD！', '一般');
INSERT INTO `multipquestion` VALUES (0000000009, 21001, '100014', 'You should try to write______ even when you are busy. As you know, practice makes perfect', 'now and then', 'more or less', 'sooner or later', 'here and there', 'BD', '就是选BD！', '困难');
INSERT INTO `multipquestion` VALUES (0000000010, 21001, '10007', 'The Science Museum, _____ we visited during a recent trip to Britain, is one of London’s tourists attractions.', 'which', 'what', 'that ', 'where', 'AB', '就是选AB！', '简单');
INSERT INTO `multipquestion` VALUES (0000000011, 21001, '10008', 'He speaks English well indeed, but of course not ____ a native speaker.', 'as fluent as', 'so fluently as', 'more fluent than', 'much fluently than', 'BC', '就是选BC！', '简单');
INSERT INTO `multipquestion` VALUES (0000000012, 21001, '10009', 'The English spoken in the United States is only slightly different from ____ spoken in England.', 'which', 'what', 'that', 'the one', 'CD', '就是选CD！', '简单');
INSERT INTO `multipquestion` VALUES (0000000013, 21001, '100010', 'Some people like wearing fashionable clothes; ______, some birds like bright feathers.', 'possibly', 'likely', 'luckily', 'similarly', 'AD', '就是选AD！', '一般');
INSERT INTO `multipquestion` VALUES (0000000014, 21001, '100011', 'We were in ________ when we left that we forgot the airline tickets.', 'a rush so anxious', 'a rush so anxious', 'so anxious rush', 'so anxious rush', 'AD', '就是选AD！', '一般');
INSERT INTO `multipquestion` VALUES (0000000020, 21001, '100012', '_______ in ancient times, the book still appeals to readers today.', 'Though written', ' It was written', 'Having written', 'Though writing', 'AB', '就是选AB！', '一般');
INSERT INTO `multipquestion` VALUES (0000000021, 21001, '100013', 'The boy ______ the window and ______ a man ______his neighbor’s house.', 'looking out of; seeing; entered', ' looked out of; saw; entering in', ' looked out of; saw; entering in', ' looking out of; seeing; entered in', 'CD', '就是选CD！', '一般');
INSERT INTO `multipquestion` VALUES (0000000022, 21001, '100014', 'You should try to write______ even when you are busy. As you know, practice makes perfect', 'now and then', 'more or less', 'sooner or later', 'here and there', 'BD', '就是选BD！', '绝望');

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `rid` int(10) NOT NULL AUTO_INCREMENT,
  `sid` int(10) NULL DEFAULT NULL,
  `score` double(10, 0) NULL DEFAULT NULL,
  `examid` int(10) NULL DEFAULT NULL,
  `myanswer` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`rid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES (14, 110004, 20, 12, 'A-B##B-C##dsgdsg-dfhdfjd');

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
  PRIMARY KEY (`sqid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of singlequestion
-- ----------------------------
INSERT INTO `singlequestion` VALUES (0000000001, 21001, '10007', 'The Science Museum, _____ we visited during a recent trip to Britain, is one of London’s tourists attractions.', 'which', 'what', 'that ', 'where', 'A', '就是选A！', '简单');
INSERT INTO `singlequestion` VALUES (0000000002, 21001, '10008', 'He speaks English well indeed, but of course not ____ a native speaker.', 'as fluent as', 'so fluently as', 'more fluent than', 'much fluently than', 'B', '就是选B！', '简单');
INSERT INTO `singlequestion` VALUES (0000000003, 21001, '10009', 'The English spoken in the United States is only slightly different from ____ spoken in England.', 'which', 'what', 'that', 'the one', 'C', '就是选C！', '简单');
INSERT INTO `singlequestion` VALUES (0000000004, 21001, '100010', 'Some people like wearing fashionable clothes; ______, some birds like bright feathers.', 'possibly', 'likely', 'luckily', 'similarly', 'D', '就是选D！', '一般');
INSERT INTO `singlequestion` VALUES (0000000005, 21001, '100011', 'We were in ________ when we left that we forgot the airline tickets.', 'a rush so anxious', 'a rush so anxious', 'so anxious rush', 'so anxious rush', 'D', '就是选D！', '一般');
INSERT INTO `singlequestion` VALUES (0000000006, 21001, '100012', '_______ in ancient times, the book still appeals to readers today.', 'Though written', ' It was written', 'Having written', 'Though writing', 'A', '就是选A！', '一般');
INSERT INTO `singlequestion` VALUES (0000000007, 21001, '100013', 'The boy ______ the window and ______ a man ______his neighbor’s house.', 'looking out of; seeing; entered', ' looked out of; saw; entering in', ' looked out of; saw; entering in', ' looking out of; seeing; entered in', 'C', '就是选C！', '一般');
INSERT INTO `singlequestion` VALUES (0000000008, 21001, '100014', 'You should try to write______ even when you are busy. As you know, practice makes perfect', 'now and then', 'more or less', 'sooner or later', 'here and there', 'B', '就是选B！', '困难');
INSERT INTO `singlequestion` VALUES (0000000009, 21001, '10007', 'The Science Museum, _____ we visited during a recent trip to Britain, is one of London’s tourists attractions.', 'which', 'what', 'that ', 'where', 'A', '就是选A！', '简单');
INSERT INTO `singlequestion` VALUES (0000000010, 21001, '10008', 'He speaks English well indeed, but of course not ____ a native speaker.', 'as fluent as', 'so fluently as', 'more fluent than', 'much fluently than', 'B', '就是选B！', '简单');
INSERT INTO `singlequestion` VALUES (0000000011, 21001, '10009', 'The English spoken in the United States is only slightly different from ____ spoken in England.', 'which', 'what', 'that', 'the one', 'C', '就是选C！', '简单');
INSERT INTO `singlequestion` VALUES (0000000012, 21001, '100010', 'Some people like wearing fashionable clothes; ______, some birds like bright feathers.', 'possibly', 'likely', 'luckily', 'similarly', 'D', '就是选D！', '一般');
INSERT INTO `singlequestion` VALUES (0000000013, 21001, '100011', 'We were in ________ when we left that we forgot the airline tickets.', 'a rush so anxious', 'a rush so anxious', 'so anxious rush', 'so anxious rush', 'D', '就是选D！', '一般');
INSERT INTO `singlequestion` VALUES (0000000014, 21001, '100012', '_______ in ancient times, the book still appeals to readers today.', 'Though written', ' It was written', 'Having written', 'Though writing', 'A', '就是选A！', '一般');
INSERT INTO `singlequestion` VALUES (0000000015, 21001, '100013', 'The boy ______ the window and ______ a man ______his neighbor’s house.', 'looking out of; seeing; entered', ' looked out of; saw; entering in', ' looked out of; saw; entering in', ' looking out of; seeing; entered in', 'C', '就是选C！', '一般');
INSERT INTO `singlequestion` VALUES (0000000016, 21001, '100014', 'You should try to write______ even when you are busy. As you know, practice makes perfect', 'now and then', 'more or less', 'sooner or later', 'here and there', 'B', '就是选B！', '绝望');

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
INSERT INTO `student` VALUES (0000110001, '2015030101', '小明', '男', '445522401', '123456', '计算机学院', '15软件1班', '123');
INSERT INTO `student` VALUES (0000110002, '2015030102', '小红', '女', '445522402', '1234', '计算机学院', '15软件1班', '234');
INSERT INTO `student` VALUES (0000110003, '2015030103', '小鑫', '男', '445522403', '123', '计算机学院', '15软件1班', '345');
INSERT INTO `student` VALUES (0000110004, '123456', 'Kalite', '男', '456547987454', '123', '英语学院', '14英本2班', '3725');

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
INSERT INTO `teacher` VALUES (0000021001, '201524101', '杨老师', '男', '3322110001', '123', '12345');
INSERT INTO `teacher` VALUES (0000021002, '201524102', '老李', '女', '3322110002', '123', '12345');

-- ----------------------------
-- Table structure for testpaper
-- ----------------------------
DROP TABLE IF EXISTS `testpaper`;
CREATE TABLE `testpaper`  (
  `tpid` int(10) NOT NULL AUTO_INCREMENT,
  `tpno` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tpname` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `squestion` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mquestion` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fquestion` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `squestionscore` int(10) NULL DEFAULT NULL,
  `mquestionscore` int(10) NULL DEFAULT NULL,
  `fquestionscore` int(10) NULL DEFAULT NULL,
  `tid` int(10) NULL DEFAULT NULL,
  `totalscore` int(10) NULL DEFAULT NULL,
  `state` int(2) NULL DEFAULT NULL,
  PRIMARY KEY (`tpid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of testpaper
-- ----------------------------
INSERT INTO `testpaper` VALUES (4, 'b4c4c22a-5cdd-456a-8686-4e47273a827a', 'AAA', '1,2,3', '1,2,3', '1,2,3', 10, 10, 10, 21001, 0, 1);
INSERT INTO `testpaper` VALUES (5, 'b0e92d1e-050f-4c01-9c16-60cf0c3b0479', 'BBB', '1,6', '3,10', '3,9', 10, 10, 10, 21001, 0, 1);
INSERT INTO `testpaper` VALUES (6, '484f032a-c0bc-40c3-a4ea-1fbf82d341ee', 'CCC', '9,10,11', '3,5,10', '3,6,11', 10, 10, 10, 21001, 0, 0);

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
