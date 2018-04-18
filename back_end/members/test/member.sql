/*
Navicat MySQL Data Transfer

Source Server         : jsp
Source Server Version : 50514
Source Host           : localhost:3306
Source Database       : member

Target Server Type    : MYSQL
Target Server Version : 50514
File Encoding         : 65001

Date: 2011-11-04 23:54:23
*/
DROP DATABASE IF EXISTS `member`;
CREATE DATABASE `member`;
USE `member`;
-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO member VALUES ('test', '1234');
