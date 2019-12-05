/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50158
Source Host           : localhost:3306
Source Database       : sherpa

Target Server Type    : MYSQL
Target Server Version : 50158
File Encoding         : 65001

Date: 2019-12-05 21:15:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `activitycomment`
-- ----------------------------
DROP TABLE IF EXISTS `activitycomment`;
CREATE TABLE `activitycomment` (
                                   `ActCoActId` int(11) NOT NULL DEFAULT '0',
                                   `ActCoUserId` int(11) DEFAULT NULL,
                                   `ActCoContent` varchar(50) DEFAULT NULL,
                                   `ActCoTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
                                   PRIMARY KEY (`ActCoActId`),
                                   KEY `ActCoUserId` (`ActCoUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of activitycomment
-- ----------------------------

-- ----------------------------
-- Table structure for `activityinfo`
-- ----------------------------
DROP TABLE IF EXISTS `activityinfo`;
CREATE TABLE `activityinfo` (
                                `ActId` int(11) NOT NULL DEFAULT '0',
                                `ActName` varchar(50) DEFAULT NULL,
                                `ActProvince` varchar(10) DEFAULT NULL,
                                `ActCity` varchar(10) DEFAULT NULL,
                                `ActContact` varchar(20) DEFAULT NULL,
                                `ActLeaderName` varchar(10) DEFAULT NULL,
                                `ActEmail` varchar(50) DEFAULT NULL,
                                `ActLeaderId` int(11) DEFAULT '0',
                                `ActCondition` varchar(10) DEFAULT NULL,
                                `ActParterNeedNumber` int(11) DEFAULT NULL,
                                `ActStartTime` datetime DEFAULT NULL,
                                `ActBeginTime` datetime DEFAULT NULL,
                                `ActOverTime` datetime DEFAULT NULL,
                                `ActTag` varchar(20) DEFAULT NULL,
                                `ActContent` text,
                                `ActExpense` int(11) DEFAULT NULL,
                                `ActTransport` varchar(20) DEFAULT NULL,
                                PRIMARY KEY (`ActId`),
                                KEY `ActLeaderId` (`ActLeaderId`),
                                CONSTRAINT `ActIdPart` FOREIGN KEY (`ActId`) REFERENCES `partinfo` (`ActId`) ON DELETE CASCADE ON UPDATE CASCADE,
                                CONSTRAINT `ActIdCo` FOREIGN KEY (`ActId`) REFERENCES `activitycomment` (`ActCoActId`) ON DELETE CASCADE ON UPDATE CASCADE,
                                CONSTRAINT `ActIdTh` FOREIGN KEY (`ActId`) REFERENCES `activitythumb` (`ActThActId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activityinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `activitythumb`
-- ----------------------------
DROP TABLE IF EXISTS `activitythumb`;
CREATE TABLE `activitythumb` (
                                 `ActThActId` int(11) NOT NULL DEFAULT '0',
                                 `ActThUserId` int(11) NOT NULL DEFAULT '0',
                                 `ActThTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
                                 PRIMARY KEY (`ActThActId`,`ActThUserId`),
                                 KEY `ActThActId` (`ActThActId`),
                                 KEY `ActThUserId` (`ActThUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activitythumb
-- ----------------------------

-- ----------------------------
-- Table structure for `administratorinfo`
-- ----------------------------
DROP TABLE IF EXISTS `administratorinfo`;
CREATE TABLE `administratorinfo` (
                                     `AdminId` int(11) NOT NULL,
                                     `AdminNickname` varchar(50) DEFAULT NULL,
                                     `AdminRegisterTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
                                     `AdminBirth` datetime DEFAULT NULL,
                                     `AdminEmail` varchar(50) DEFAULT NULL,
                                     `AdminTel` varchar(30) DEFAULT NULL,
                                     PRIMARY KEY (`AdminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of administratorinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `administratorlogin`
-- ----------------------------
DROP TABLE IF EXISTS `administratorlogin`;
CREATE TABLE `administratorlogin` (
                                      `AdminId` int(11) NOT NULL DEFAULT '0',
                                      `AdminPwd` varchar(20) DEFAULT NULL,
                                      `AdminQuestion` varchar(50) DEFAULT NULL,
                                      `AdminAnswer` varchar(50) DEFAULT NULL,
                                      PRIMARY KEY (`AdminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of administratorlogin
-- ----------------------------

-- ----------------------------
-- Table structure for `logcomment`
-- ----------------------------
DROP TABLE IF EXISTS `logcomment`;
CREATE TABLE `logcomment` (
                              `LogCoLogId` int(11) NOT NULL DEFAULT '0',
                              `LogCoUserId` int(11) NOT NULL DEFAULT '0',
                              `LogCoContent` varchar(100) DEFAULT NULL,
                              `LogCoTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
                              PRIMARY KEY (`LogCoLogId`,`LogCoUserId`),
                              KEY `LogCoLogId` (`LogCoLogId`),
                              KEY `LogCoUserId` (`LogCoUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logcomment
-- ----------------------------

-- ----------------------------
-- Table structure for `loginfo`
-- ----------------------------
DROP TABLE IF EXISTS `loginfo`;
CREATE TABLE `loginfo` (
                           `LogId` int(11) NOT NULL DEFAULT '0',
                           `LogUserId` int(11) NOT NULL DEFAULT '0',
                           `LogProvince` varchar(20) DEFAULT NULL,
                           `LogCity` varchar(20) DEFAULT NULL,
                           `LogStartTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
                           `LogEndTime` datetime DEFAULT NULL,
                           `LogCondition` varchar(10) DEFAULT NULL,
                           `LogText` text,
                           `LogTheme` varchar(100) DEFAULT NULL,
                           `LogTag` varchar(50) DEFAULT NULL,
                           `LogActId` int(11) DEFAULT NULL,
                           PRIMARY KEY (`LogId`),
                           KEY `LogAdminId` (`LogUserId`),
                           CONSTRAINT `LogIdCo` FOREIGN KEY (`LogId`) REFERENCES `logcomment` (`LogCoLogId`) ON DELETE CASCADE ON UPDATE CASCADE,
                           CONSTRAINT `LogIdTh` FOREIGN KEY (`LogId`) REFERENCES `logthumb` (`LogThLogId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loginfo
-- ----------------------------

-- ----------------------------
-- Table structure for `logthumb`
-- ----------------------------
DROP TABLE IF EXISTS `logthumb`;
CREATE TABLE `logthumb` (
                            `LogThLogId` int(11) NOT NULL DEFAULT '0',
                            `LogThUserId` int(11) NOT NULL DEFAULT '0',
                            `LogThTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
                            PRIMARY KEY (`LogThLogId`,`LogThUserId`),
                            KEY `LogThLogId` (`LogThLogId`),
                            KEY `LogThUserId` (`LogThUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logthumb
-- ----------------------------

-- ----------------------------
-- Table structure for `partinfo`
-- ----------------------------
DROP TABLE IF EXISTS `partinfo`;
CREATE TABLE `partinfo` (
                            `ActId` int(11) NOT NULL DEFAULT '0',
                            `ActPartId` int(11) NOT NULL DEFAULT '0',
                            `PartTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
                            PRIMARY KEY (`ActId`,`ActPartId`),
                            KEY `ActPartId` (`ActPartId`),
                            KEY `ActId` (`ActId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of partinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `reguserinfo`
-- ----------------------------
DROP TABLE IF EXISTS `reguserinfo`;
CREATE TABLE `reguserinfo` (
                               `RegUserId` int(11) NOT NULL DEFAULT '0',
                               `RegUserName` varchar(255) DEFAULT NULL,
                               `RegUserPwd` varchar(20) DEFAULT NULL,
                               `RegUserQuestion` varchar(100) DEFAULT NULL,
                               `RegUserAnswer` varchar(100) DEFAULT NULL,
                               `RegUserRegisterTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
                               `RegUserNikename` varchar(20) DEFAULT NULL,
                               `RegUserGender` varchar(10) DEFAULT NULL,
                               `RegUserBirth` datetime DEFAULT NULL,
                               `RegUserCardNmber` varchar(30) DEFAULT NULL,
                               `RegUserEmail` varchar(50) DEFAULT NULL,
                               `RegUserTel` int(20) DEFAULT NULL,
                               `RegUserCity` varchar(20) DEFAULT NULL,
                               PRIMARY KEY (`RegUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reguserinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `uselogin`
-- ----------------------------
DROP TABLE IF EXISTS `uselogin`;
CREATE TABLE `uselogin` (
                            `UserId` int(11) NOT NULL DEFAULT '0',
                            `UserPwd` varchar(20) DEFAULT NULL,
                            `UserQuestion` varchar(50) DEFAULT NULL,
                            `UserAnswer` varchar(50) DEFAULT NULL,
                            PRIMARY KEY (`UserId`),
                            CONSTRAINT `UserLogInfo` FOREIGN KEY (`UserId`) REFERENCES `loginfo` (`LogUserId`) ON DELETE CASCADE ON UPDATE CASCADE,
                            CONSTRAINT `UserAct` FOREIGN KEY (`UserId`) REFERENCES `activityinfo` (`ActLeaderId`) ON DELETE CASCADE ON UPDATE CASCADE,
                            CONSTRAINT `UserActCo` FOREIGN KEY (`UserId`) REFERENCES `activitythumb` (`ActThUserId`) ON DELETE CASCADE ON UPDATE CASCADE,
                            CONSTRAINT `UserActTh` FOREIGN KEY (`UserId`) REFERENCES `activitycomment` (`ActCoUserId`) ON DELETE CASCADE ON UPDATE CASCADE,
                            CONSTRAINT `UserInfo` FOREIGN KEY (`UserId`) REFERENCES `userinfo` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE,
                            CONSTRAINT `UserLogCo` FOREIGN KEY (`UserId`) REFERENCES `logcomment` (`LogCoUserId`) ON DELETE CASCADE ON UPDATE CASCADE,
                            CONSTRAINT `UserLogTh` FOREIGN KEY (`UserId`) REFERENCES `logthumb` (`LogThUserId`) ON DELETE CASCADE ON UPDATE CASCADE,
                            CONSTRAINT `UserPart` FOREIGN KEY (`UserId`) REFERENCES `partinfo` (`ActPartId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of uselogin
-- ----------------------------

-- ----------------------------
-- Table structure for `userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
                            `UserId` int(11) NOT NULL,
                            `UserNickName` varchar(20) DEFAULT NULL,
                            `UserGender` varchar(20) DEFAULT NULL,
                            `UserBirth` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
                            `UserCardnumber` varchar(20) DEFAULT NULL,
                            `UserEmail` varchar(20) DEFAULT NULL,
                            `UserTel` int(11) DEFAULT NULL,
                            `UserCity` varchar(255) DEFAULT NULL,
                            `UserPro` varchar(255) DEFAULT NULL,
                            `UserRegisterTime` datetime DEFAULT NULL,
                            `UserImg` varchar(255) DEFAULT NULL,
                            PRIMARY KEY (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
