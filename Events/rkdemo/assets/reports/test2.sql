#
# TABLE STRUCTURE FOR: admin_settings
#

DROP TABLE IF EXISTS `admin_settings`;

CREATE TABLE `admin_settings` (
  `settingId` int(11) NOT NULL,
  `companyName` varchar(100) NOT NULL,
  `logo` text NOT NULL,
  `caption` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `fax` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `website` varchar(100) NOT NULL,
  `host` varchar(200) NOT NULL,
  `port` int(11) NOT NULL,
  `hostUsername` varchar(100) NOT NULL,
  `hostPassword` text NOT NULL,
  `from` varchar(150) NOT NULL,
  `fromText` varchar(250) NOT NULL,
  `signature` varchar(500) NOT NULL,
  `automatedReply` tinyint(4) NOT NULL,
  `automatedMsg` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  UNIQUE KEY `settingId` (`settingId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `admin_settings` (`settingId`, `companyName`, `logo`, `caption`, `address`, `phone`, `fax`, `email`, `website`, `host`, `port`, `hostUsername`, `hostPassword`, `from`, `fromText`, `signature`, `automatedReply`, `automatedMsg`, `status`) VALUES ('1', 'Poorna App Systems', 'logo.png', '', 'Address', '232323', '', 'info@poornaapp.com', 'www.poornaapp.com', 'sg2plcpnl0100.prod.sin2.secureserver.net', '465', 'info@poornaapp.com', 'yzyMm9\"L', 'info@poornaapp.com', 'Poorna App Systems', 'Regards,\r\nRakshaKids', '0', '0', '1');


#
# TABLE STRUCTURE FOR: admin_users
#

DROP TABLE IF EXISTS `admin_users`;

CREATE TABLE `admin_users` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `roleId` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `admin_users` (`adminId`, `username`, `password`, `firstName`, `lastName`, `email`, `phone`, `roleId`, `status`) VALUES ('1', 'admin', '123456', 'admin', 'admin', 'rexvofficial@gmail.com', '1234567890', '0', '1');
INSERT INTO `admin_users` (`adminId`, `username`, `password`, `firstName`, `lastName`, `email`, `phone`, `roleId`, `status`) VALUES ('2', 'school', '123456', 'school', 'user', 'schooluser@gmail.com', '1234567890', '1', '1');


#
# TABLE STRUCTURE FOR: attendance
#

DROP TABLE IF EXISTS `attendance`;

CREATE TABLE `attendance` (
  `attendanceId` int(11) NOT NULL AUTO_INCREMENT,
  `studentId` int(11) NOT NULL,
  `gateName` varchar(50) NOT NULL,
  `logType` varchar(20) NOT NULL,
  `logDate` datetime NOT NULL,
  `staffId` int(11) DEFAULT NULL,
  `attendance` varchar(20) NOT NULL,
  `notes` varchar(200) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`attendanceId`)
) ENGINE=InnoDB AUTO_INCREMENT=754 DEFAULT CHARSET=latin1;

INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('1', '1', 'Gate No 1', 'ENTRY', '2017-01-03 17:27:34', '3', 'ABSENT', NULL, '2016-11-23 16:11:51', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('2', '1', 'Gate No 1', 'ENTRY', '2016-10-10 17:31:36', NULL, 'PRESENT', NULL, '2017-01-03 00:00:00', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('3', '2', 'Gate No 1', 'ENTRY', '2016-10-18 16:24:02', '3', '1,2,2', NULL, '2016-11-23 13:58:53', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('4', '17', 'Gate No 1', 'ENTRY', '2016-10-18 16:24:03', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('5', '5', 'Gate No 1', 'ENTRY', '2016-10-18 16:24:04', '3', '1,2,2', NULL, '2016-11-23 16:00:30', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('6', '9008', 'Gate No 1', 'ENTRY', '2016-10-18 16:24:05', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('7', '9010', 'Gate No 1', 'ENTRY', '2016-10-18 16:24:06', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('8', '45', 'Gate No 1', 'ENTRY', '2016-10-18 16:24:07', '3', '1,2,2', NULL, '2016-11-23 13:58:53', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('9', '9003', 'Gate No 1', 'ENTRY', '2016-10-18 16:24:08', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('10', '9013', 'Gate No 1', 'ENTRY', '2016-10-18 16:24:09', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('11', '1', 'Gate No 1', 'ENTRY', '2016-10-25 08:48:04', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('12', '2', 'Gate No 1', 'ENTRY', '2016-10-25 08:48:05', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('13', '1', 'Gate No 1', 'ENTRY', '2016-10-25 10:20:56', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('14', '2', 'Gate No 1', 'ENTRY', '2016-10-25 10:20:57', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('15', '2', 'Gate No 1', 'ENTRY', '2016-10-25 10:26:10', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('16', '1', 'Gate No 1', 'ENTRY', '2016-10-25 10:26:11', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('17', '1', 'Gate No 1', 'ENTRY', '2016-10-25 11:20:05', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('18', '2', 'Gate No 1', 'ENTRY', '2016-10-25 11:20:06', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('19', '18', 'MANUAL', 'ENTRY', '2016-10-25 16:32:00', '3', 'PRESENT', '', '2016-10-25 16:32:00', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('20', '18', 'Gate No 1', 'ENTRY', '2016-11-02 15:52:56', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('21', '17', 'Gate No 1', 'ENTRY', '2016-11-02 15:52:57', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('22', '18', 'Gate No 1', 'ENTRY', '2016-11-02 15:57:45', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('23', '17', 'Gate No 1', 'ENTRY', '2016-11-02 15:57:46', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('24', '18', 'Gate No 1', 'ENTRY', '2016-11-02 15:59:25', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('25', '17', 'Gate No 1', 'ENTRY', '2016-11-02 15:59:26', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('26', '17', 'Gate No 1', 'ENTRY', '2016-11-03 18:55:24', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('27', '18', 'Gate No 1', 'ENTRY', '2016-11-03 18:55:25', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('28', '9009', 'Gate No 1', 'ENTRY', '2016-11-03 18:55:25', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('29', '17', 'Gate No 1', 'ENTRY', '2016-11-03 18:58:03', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('30', '18', 'Gate No 1', 'ENTRY', '2016-11-03 18:58:04', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('31', '9009', 'Gate No 1', 'ENTRY', '2016-11-03 18:58:13', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('32', '9005', 'Gate No 1', 'ENTRY', '2016-11-03 18:59:03', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('33', '9009', 'Gate No 1', 'ENTRY', '2016-11-03 19:03:23', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('34', '17', 'Gate No 1', 'ENTRY', '2016-11-03 19:03:23', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('35', '18', 'Gate No 1', 'ENTRY', '2016-11-03 19:03:24', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('36', '18', 'Gate No 1', 'ENTRY', '2016-11-03 19:09:03', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('37', '17', 'Gate No 1', 'ENTRY', '2016-11-03 19:09:13', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('38', '9009', 'Gate No 1', 'ENTRY', '2016-11-03 19:09:23', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('39', '18', 'Gate No 1', 'ENTRY', '2016-11-03 19:13:03', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('40', '17', 'Gate No 1', 'ENTRY', '2016-11-03 19:13:04', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('41', '9009', 'Gate No 1', 'ENTRY', '2016-11-03 19:13:05', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('42', '17', 'Gate No 1', 'ENTRY', '2016-11-03 19:13:33', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('43', '18', 'Gate No 1', 'ENTRY', '2016-11-03 19:13:34', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('44', '9009', 'Gate No 1', 'ENTRY', '2016-11-03 19:13:45', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('45', '9009', 'Gate No 1', 'ENTRY', '2016-11-03 19:16:13', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('46', '17', 'Gate No 1', 'ENTRY', '2016-11-03 19:16:13', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('47', '18', 'Gate No 1', 'ENTRY', '2016-11-03 19:16:14', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('48', '18', 'Gate No 1', 'ENTRY', '2016-11-03 19:16:43', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('49', '17', 'Gate No 1', 'ENTRY', '2016-11-03 19:16:44', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('50', '18', 'Gate No 1', 'ENTRY', '2016-11-03 19:17:54', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('51', '17', 'Gate No 1', 'ENTRY', '2016-11-03 19:18:04', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('52', '9009', 'Gate No 1', 'ENTRY', '2016-11-03 19:18:24', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('53', '9002', 'Gate No 1', 'ENTRY', '2016-11-03 19:18:45', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('54', '9005', 'Gate No 1', 'ENTRY', '2016-11-03 19:18:46', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('55', '9010', 'Gate No 1', 'ENTRY', '2016-11-03 19:19:14', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('56', '9004', 'Gate No 1', 'ENTRY', '2016-11-03 19:19:14', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('57', '9007', 'Gate No 1', 'ENTRY', '2016-11-03 19:19:15', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('58', '9003', 'Gate No 1', 'ENTRY', '2016-11-03 19:19:24', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('59', '9011', 'Gate No 1', 'ENTRY', '2016-11-03 19:19:24', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('60', '18', 'Gate No 1', 'ENTRY', '2016-11-03 19:19:56', '3', 'ABSENT', 'student isn\'t present in class. hence marking absent', '2016-11-03 20:10:01', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('61', '17', 'Gate No 1', 'ENTRY', '2016-11-03 19:19:56', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('62', '18', 'Gate No 1', 'EXIT', '2016-11-03 19:31:06', NULL, '', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('63', '17', 'Gate No 1', 'EXIT', '2016-11-03 19:31:06', NULL, '', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('64', '18', 'MANUAL', 'ENTRY', '2016-11-04 08:46:06', '3', 'PRESENT', '', '2016-11-04 08:46:06', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('65', '5', 'Gate No 1', 'ENTRY', '2016-11-04 11:54:58', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('66', '18', 'Gate No 1', 'ENTRY', '2016-11-04 11:54:59', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('67', '17', 'Gate No 1', 'ENTRY', '2016-11-04 11:55:00', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('68', '10', 'Gate No 1', 'ENTRY', '2016-11-04 11:55:01', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('69', '8', 'Gate No 1', 'ENTRY', '2016-11-04 11:55:02', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('70', '15', 'Gate No 1', 'ENTRY', '2016-11-04 11:55:03', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('71', '14', 'Gate No 1', 'ENTRY', '2016-11-04 11:55:04', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('72', '3', 'Gate No 1', 'ENTRY', '2016-11-04 11:55:05', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('73', '16', 'Gate No 1', 'ENTRY', '2016-11-04 11:55:17', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('74', '3', 'Gate No 1', 'ENTRY', '2016-11-04 11:57:30', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('75', '18', 'Gate No 1', 'ENTRY', '2016-11-04 11:57:31', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('76', '10', 'Gate No 1', 'ENTRY', '2016-11-04 11:57:32', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('77', '14', 'Gate No 1', 'ENTRY', '2016-11-04 11:57:33', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('78', '5', 'Gate No 1', 'ENTRY', '2016-11-04 11:57:34', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('79', '8', 'Gate No 1', 'ENTRY', '2016-11-04 11:57:34', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('80', '15', 'Gate No 1', 'ENTRY', '2016-11-04 11:57:35', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('81', '17', 'Gate No 1', 'ENTRY', '2016-11-04 11:57:36', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('82', '16', 'Gate No 1', 'ENTRY', '2016-11-04 11:57:37', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('83', '10', 'Gate No 1', 'ENTRY', '2016-11-04 11:58:19', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('84', '3', 'Gate No 1', 'ENTRY', '2016-11-04 11:58:20', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('85', '16', 'Gate No 1', 'ENTRY', '2016-11-04 11:58:21', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('86', '5', 'Gate No 1', 'ENTRY', '2016-11-04 11:58:22', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('87', '14', 'Gate No 1', 'ENTRY', '2016-11-04 11:58:22', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('88', '15', 'Gate No 1', 'ENTRY', '2016-11-04 11:58:23', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('89', '18', 'Gate No 1', 'ENTRY', '2016-11-04 11:58:24', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('90', '17', 'Gate No 1', 'ENTRY', '2016-11-04 11:58:24', '3', 'PRESENT', '', '2016-11-04 13:51:28', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('91', '17', 'MANUAL', 'EXIT', '2016-11-04 13:52:13', '3', 'PRESENT', '', '2016-11-04 13:52:13', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('92', '18', 'MANUAL', 'EXIT', '2016-11-04 13:52:46', '3', 'PRESENT', '', '2016-11-04 13:52:46', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('93', '0', 'MANUAL', 'ENTRY', '2016-11-17 15:32:41', '3', 'PRESENT', '', '2016-11-17 15:32:41', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('94', '17', 'MANUAL', 'ENTRY', '2016-11-18 15:57:14', '3', 'PRESENT', 'asdasd', '2016-11-18 15:59:34', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('95', '0', 'MANUAL', 'EXIT', '2016-11-18 17:36:22', '3', 'PRESENT', '', '2016-11-18 17:36:22', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('96', '17', 'Gate No 1', 'ENTRY', '2016-11-18 17:49:20', '3', 'ABSENT', '', '2016-11-18 17:55:57', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('97', '18', 'Gate No 1', 'ENTRY', '2016-11-18 17:49:21', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('98', '17', 'MANUAL', 'EXIT', '2016-11-18 17:54:44', '3', 'PRESENT', 'Jonathan forgot I\'d. But he is in class ', '2016-11-18 18:12:31', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('99', '17', 'Gate No 1', 'ENTRY', '2016-11-18 18:05:23', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('100', '18', 'Gate No 1', 'ENTRY', '2016-11-18 18:05:24', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('101', '17', 'MANUAL', 'ENTRY', '2016-11-21 10:01:47', '3', 'PRESENT', 'sddss', '2016-11-21 11:12:12', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('102', '1', 'MANUAL', 'ENTRY', '2016-11-21 11:09:49', '3', 'PRESENT', '', '2016-11-21 11:09:49', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('125', '9', 'Gate No 1', 'ENTRY', '2016-11-22 15:26:20', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('126', '4', 'Gate No 1', 'ENTRY', '2016-11-22 15:26:21', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('127', '7', 'Gate No 1', 'ENTRY', '2016-11-22 15:26:21', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('128', '15', 'Gate No 1', 'ENTRY', '2016-11-22 15:26:22', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('129', '11', 'Gate No 1', 'ENTRY', '2016-11-22 15:26:22', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('130', '13', 'Gate No 1', 'ENTRY', '2016-11-22 15:26:23', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('131', '6', 'Gate No 1', 'ENTRY', '2016-11-22 15:26:24', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('132', '18', 'Gate No 1', 'ENTRY', '2016-11-22 15:26:24', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('133', '17', 'Gate No 1', 'ENTRY', '2016-11-22 15:26:25', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('134', '5', 'Gate No 1', 'ENTRY', '2016-11-22 15:26:26', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('135', '14', 'Gate No 1', 'ENTRY', '2016-11-22 15:26:26', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('136', '16', 'Gate No 1', 'ENTRY', '2016-11-22 15:26:27', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('137', '12', 'Gate No 1', 'ENTRY', '2016-11-22 15:26:28', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('138', '10', 'Gate No 1', 'ENTRY', '2016-11-22 15:26:28', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('139', '4', 'Gate No 1', 'ENTRY', '2016-11-22 15:29:17', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('140', '8', 'Gate No 1', 'ENTRY', '2016-11-22 15:29:18', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('141', '12', 'Gate No 1', 'ENTRY', '2016-11-22 15:29:19', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('142', '5', 'Gate No 1', 'ENTRY', '2016-11-22 15:29:19', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('143', '9', 'Gate No 1', 'ENTRY', '2016-11-22 15:29:20', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('144', '6', 'Gate No 1', 'ENTRY', '2016-11-22 15:29:21', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('145', '7', 'Gate No 1', 'ENTRY', '2016-11-22 15:29:21', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('146', '13', 'Gate No 1', 'ENTRY', '2016-11-22 15:29:22', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('147', '18', 'Gate No 1', 'ENTRY', '2016-11-22 15:29:23', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('148', '11', 'Gate No 1', 'ENTRY', '2016-11-22 15:29:23', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('149', '14', 'Gate No 1', 'ENTRY', '2016-11-22 15:29:24', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('150', '17', 'Gate No 1', 'ENTRY', '2016-11-22 15:29:25', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('151', '16', 'Gate No 1', 'ENTRY', '2016-11-22 15:29:25', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('152', '10', 'Gate No 1', 'ENTRY', '2016-11-22 15:29:37', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('153', '15', 'Gate No 1', 'ENTRY', '2016-11-22 15:29:38', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('154', '154', 'MANUAL', 'Absent type', '2016-11-23 12:19:56', '3', '1,2', NULL, '2016-11-23 15:38:02', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('155', '155', 'MANUAL', 'Absent type', '2016-11-23 12:19:56', '3', '1', NULL, '2016-11-23 16:16:51', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('156', '156', 'MANUAL', 'In type', '2016-11-23 12:21:32', '3', '1', NULL, '2016-11-23 16:07:00', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('157', '0', 'MANUAL', 'In type', '2016-11-23 13:00:50', '3', '[1, 3, 1]', NULL, '2016-11-23 13:00:50', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('158', '0', 'MANUAL', 'Out type', '2016-11-23 13:04:31', '3', '1,3,2', NULL, '2016-11-23 13:04:31', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('159', '0', 'MANUAL', 'Absent type', '2016-11-23 13:04:53', '3', '2,3', NULL, '2016-11-23 13:04:53', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('160', '4', 'MANUAL', 'Absent type', '2016-11-23 13:04:53', '3', 'ABSENT', 'Sorry to inform you that your ward is not present in the class so marked as absent', '2016-11-23 17:08:25', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('161', '0', 'MANUAL', 'Absent type', '2016-11-23 13:56:12', '3', '1,2,3', NULL, '2016-11-23 13:56:12', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('162', '0', 'MANUAL', 'test', '2016-11-23 13:57:56', '3', '1', NULL, '2016-11-23 13:57:56', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('163', '0', 'MANUAL', 'test', '2016-11-23 13:58:05', '3', '1', NULL, '2016-11-23 13:58:05', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('164', '0', 'MANUAL', 'test', '2016-11-23 13:58:30', '3', '1,2', NULL, '2016-11-23 13:58:30', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('165', '0', 'MANUAL', 'test', '2016-11-23 13:58:53', '3', '1,2,2', NULL, '2016-11-23 13:58:53', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('166', '0', 'MANUAL', 'test', '2016-11-23 13:59:11', '3', '1,2,2', NULL, '2016-11-23 13:59:11', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('167', '0', 'MANUAL', 'test', '2016-11-23 13:59:25', '0', '1,2,2', NULL, '2016-11-23 13:59:25', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('168', '0', 'MANUAL', 'In type', '2016-11-23 14:00:28', '3', '1', NULL, '2016-11-23 14:00:28', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('169', '0', 'MANUAL', 'Out type', '2016-11-23 14:06:38', '3', '1,2', NULL, '2016-11-23 14:06:38', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('170', '170', 'MANUAL', 'Out type', '2016-11-23 15:38:02', '3', '1,2,2,3', NULL, '2016-11-23 15:52:28', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('171', '2', 'MANUAL', 'Absent type', '2016-11-23 15:52:28', '3', 'ABSENT', 'Sorry to inform you that your ward is not present in the class so marked as absent', '2016-11-23 17:08:25', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('172', '0', 'MANUAL', 'Absent type', '2016-11-23 16:08:46', '3', '1,3', NULL, '2016-11-23 16:08:46', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('173', '173', 'MANUAL', 'Absent type', '2016-11-23 16:08:46', '3', '1', NULL, '2016-11-23 16:17:04', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('174', '0', 'MANUAL', 'In type', '2016-11-23 16:09:42', '3', '2,1', NULL, '2016-11-23 16:09:42', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('175', '175', 'MANUAL', 'In type', '2016-11-23 16:09:42', '3', '1,2', NULL, '2016-11-23 16:18:37', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('176', '0', 'MANUAL', 'Absent type', '2016-11-23 16:17:13', '3', '2,3', NULL, '2016-11-23 16:17:13', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('177', '0', 'MANUAL', 'Out type', '2016-11-23 16:18:03', '3', '1,2', NULL, '2016-11-23 16:18:03', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('178', '0', 'MANUAL', 'Absent type', '2016-11-23 16:18:12', '3', '3,3', NULL, '2016-11-23 16:18:12', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('179', '179', 'MANUAL', 'Out type', '2016-11-23 16:18:37', '3', '1', NULL, '2016-11-23 16:25:40', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('180', '0', 'MANUAL', 'In type', '2016-11-23 16:25:29', '3', '1', NULL, '2016-11-23 16:25:29', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('181', '0', 'MANUAL', 'Absent type', '2016-11-23 16:25:57', '3', '3,3', NULL, '2016-11-23 16:25:57', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('182', '182', 'MANUAL', 'Absent type', '2016-11-23 16:25:57', '3', '2', NULL, '2016-11-23 16:33:44', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('183', '0', 'MANUAL', 'Out type', '2016-11-23 16:30:40', '3', '2', NULL, '2016-11-23 16:30:40', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('184', '0', 'MANUAL', 'In type', '2016-11-23 16:30:55', '3', '1,1', NULL, '2016-11-23 16:30:55', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('185', '17', 'MANUAL', 'ENTRY', '2016-11-23 16:46:22', '3', 'PRESENT', 'Manual Entry', '2016-11-24 09:53:54', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('186', '18', 'MANUAL', 'EXIT', '2016-11-23 16:46:34', '3', 'PRESENT', 'Manual Entry', '2016-11-24 09:54:07', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('187', '3', 'MANUAL', 'ENTRY', '2016-11-23 17:06:48', '3', 'PRESENT', 'Manual Exit', '2016-11-23 17:08:25', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('188', '1', 'MANUAL', 'EXIT', '2016-11-23 17:08:25', '3', 'PRESENT', 'Manual Exit', '2016-11-24 09:53:54', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('189', '12', 'MANUAL', 'ENTRY', '2016-11-23 17:08:25', '3', 'PRESENT', 'Manual Entry', '2016-11-23 17:08:25', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('190', '16', 'MANUAL', 'EXIT', '2016-11-23 17:08:25', '3', 'PRESENT', 'Manual Exit', '2016-11-23 17:08:25', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('191', '11', 'MANUAL', 'EXIT', '2016-11-23 17:08:25', '3', 'PRESENT', 'Manual Exit', '2016-11-23 17:08:25', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('192', '8', 'MANUAL', 'ENTRY', '2016-11-23 17:08:25', '3', 'PRESENT', 'Manual Entry', '2016-11-23 17:08:25', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('193', '7', 'MANUAL', 'EXIT', '2016-11-23 17:08:25', '3', 'PRESENT', 'Manual Exit', '2016-11-23 17:08:25', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('194', '6', 'MANUAL', 'ENTRY', '2016-11-23 17:08:25', '3', 'PRESENT', 'Manual Entry', '2016-11-23 17:08:25', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('195', '5', 'MANUAL', 'EXIT', '2016-11-23 17:08:25', '3', 'PRESENT', 'Manual Exit', '2016-11-23 17:08:25', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('196', '13', 'MANUAL', 'EXIT', '2016-11-23 17:08:25', '3', 'PRESENT', 'Manual Exit', '2016-11-23 17:08:25', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('197', '13', 'MANUAL', 'ENTRY', '2016-11-24 18:02:46', '3', 'PRESENT', 'Manual Entry', '2016-11-24 18:02:46', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('198', '18', 'Gate No 1', 'ENTRY', '2016-11-25 09:15:28', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('199', '17', 'Gate No 1', 'ENTRY', '2016-11-25 09:15:29', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('200', '18', 'Gate No 1', 'ENTRY', '2016-11-25 11:05:01', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('201', '17', 'Gate No 1', 'ENTRY', '2016-11-25 11:05:03', '3', 'ABSENT', '', '2016-11-25 11:10:36', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('202', '18', 'Gate No 1', 'ENTRY', '2016-11-25 11:11:02', '3', 'PRESENT', 'Manual Exit', '2016-11-25 11:52:44', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('203', '17', 'Gate No 1', 'ENTRY', '2016-11-25 11:11:04', '3', 'PRESENT', 'Manual Exit', '2016-11-25 11:46:34', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('204', '17', 'Gate No 1', 'ENTRY', '2016-11-25 12:43:58', '3', 'PRESENT', '', '2016-11-25 12:51:36', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('205', '18', 'Gate No 1', 'ENTRY', '2016-11-25 12:43:59', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('237', '17', 'Gate No 1', 'ENTRY', '2016-11-28 21:57:44', '3', 'ABSENT', 'Sorry to inform you that your ward is not present in the class so marked as absent', '2016-11-28 21:57:44', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('238', '4', 'Gate No 1', 'ENTRY', '2016-11-28 17:24:59', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('239', '11', 'Gate No 1', 'ENTRY', '2016-11-28 17:24:59', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('240', '14', 'Gate No 1', 'ENTRY', '2016-11-28 17:25:00', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('241', '15', 'Gate No 1', 'ENTRY', '2016-11-28 17:25:01', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('242', '10', 'Gate No 1', 'ENTRY', '2016-11-28 17:25:01', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('243', '18', 'Gate No 1', 'ENTRY', '2016-11-28 21:40:38', '3', 'ABSENT', 'Sorry to inform you that your ward is not present in the class so marked as absent', '2016-11-28 21:40:38', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('244', '12', 'Gate No 1', 'ENTRY', '2016-11-28 17:25:03', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('245', '8', 'Gate No 1', 'ENTRY', '2016-11-28 17:25:03', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('246', '16', 'Gate No 1', 'ENTRY', '2016-11-28 17:25:04', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('247', '1', 'MANUAL', 'ENTRY', '2016-11-28 17:31:11', '3', 'PRESENT', 'Manual Entry', '2016-11-28 17:31:11', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('248', '2', 'MANUAL', 'ENTRY', '2016-11-28 18:32:29', '3', 'PRESENT', 'Manual Entry', '2016-11-28 18:32:29', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('249', '17', 'MANUAL', 'ENTRY', '2016-11-29 12:32:28', '3', 'PRESENT', 'Manual Entry', '2016-11-29 12:32:28', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('250', '18', 'MANUAL', 'EXIT', '2016-11-29 12:30:13', '3', 'PRESENT', 'Manual Exit', '2016-11-29 12:30:13', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('251', '1', 'MANUAL', 'ENTRY', '2016-11-29 12:06:50', '3', 'PRESENT', 'Manual Entry', '2016-11-29 12:06:50', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('252', '17', 'MANUAL', 'EXIT', '2016-11-30 17:52:41', '3', 'PRESENT', 'Manual Exit', '2016-11-30 17:52:41', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('253', '18', 'MANUAL', 'EXIT', '2016-11-30 17:52:41', '3', 'PRESENT', 'Manual Exit', '2016-11-30 17:52:41', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('254', '1', 'MANUAL', 'ENTRY', '2016-11-30 12:51:35', '3', 'PRESENT', 'Manual Entry', '2016-11-30 12:51:35', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('255', '17', 'MANUAL', 'ENTRY', '2016-12-01 18:42:41', '3', 'PRESENT', 'Manual Entry', '2016-12-01 18:42:41', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('256', '18', 'MANUAL', 'ENTRY', '2016-12-01 18:42:41', '3', 'ABSENT', 'Sorry to inform you that your ward is not present in the class so marked as absent', '2016-12-01 18:42:41', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('257', '17', 'MANUAL', 'ENTRY', '2016-12-02 16:26:32', '3', 'ABSENT', 'Sorry to inform you that your ward is not present in the class so marked as absent', '2016-12-02 16:26:32', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('258', '18', 'MANUAL', 'ENTRY', '2016-12-02 16:25:18', '3', 'PRESENT', 'Manual Entry', '2016-12-02 16:25:18', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('259', '17', 'MANUAL', 'ENTRY', '2016-12-03 00:27:49', '3', 'ABSENT', 'Sorry to inform you that your ward is not present in the class so marked as absent', '2016-12-03 00:27:49', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('260', '18', 'MANUAL', 'ENTRY', '2016-12-03 00:16:43', '3', 'PRESENT', 'Manual Entry', '2016-12-03 00:16:43', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('261', '4', 'Gate No 1', 'ENTRY', '2016-12-05 09:56:49', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('262', '1', 'Gate No 1', 'ENTRY', '2016-12-05 09:56:49', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('263', '17', 'Gate No 1', 'ENTRY', '2016-12-05 10:11:22', '3', 'PRESENT', 'Manual Entry', '2016-12-05 10:11:22', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('264', '18', 'Gate No 1', 'ENTRY', '2016-12-05 10:11:22', '3', 'ABSENT', 'Sorry to inform you that your ward is not present in the class so marked as absent', '2016-12-05 10:11:22', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('265', '13', 'Gate No 1', 'ENTRY', '2016-12-05 09:56:52', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('266', '16', 'Gate No 1', 'ENTRY', '2016-12-05 09:56:52', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('267', '8', 'Gate No 1', 'ENTRY', '2016-12-05 09:56:53', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('268', '6', 'Gate No 1', 'ENTRY', '2016-12-05 09:56:53', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('269', '9', 'Gate No 1', 'ENTRY', '2016-12-05 09:56:54', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('270', '14', 'Gate No 1', 'ENTRY', '2016-12-05 09:56:55', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('271', '16', 'Gate No 1', 'ENTRY', '2016-12-05 10:14:19', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('272', '18', 'Gate No 1', 'ENTRY', '2016-12-05 10:14:20', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('273', '17', 'Gate No 1', 'ENTRY', '2016-12-05 10:14:21', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('274', '1', 'Gate No 1', 'ENTRY', '2016-12-05 17:18:28', '3', 'ABSENT', 'Sorry to inform you that your ward is not present in the class so marked as absent', '2016-12-05 17:18:28', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('275', '6', 'Gate No 1', 'ENTRY', '2016-12-05 10:14:23', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('276', '11', 'Gate No 1', 'ENTRY', '2016-12-05 10:14:24', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('277', '9', 'Gate No 1', 'ENTRY', '2016-12-05 10:14:24', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('278', '4', 'Gate No 1', 'ENTRY', '2016-12-05 10:14:25', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('279', '17', 'MANUAL', 'ENTRY', '2016-12-05 10:22:58', '3', 'PRESENT', 'Manual Entry', '2016-12-05 10:22:58', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('280', '18', 'MANUAL', 'ENTRY', '2016-12-05 10:22:58', '3', 'PRESENT', 'Manual Entry', '2016-12-05 10:22:58', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('281', '17', 'MANUAL', 'ENTRY', '2016-12-05 10:23:15', '3', 'PRESENT', 'Manual Entry', '2016-12-05 10:23:15', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('282', '18', 'MANUAL', 'ENTRY', '2016-12-05 10:23:33', '3', 'PRESENT', 'Manual Entry', '2016-12-05 10:23:33', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('283', '17', 'Gate No 1', 'ENTRY', '2016-12-05 12:41:12', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('284', '18', 'Gate No 1', 'ENTRY', '2016-12-05 12:41:13', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('285', '17', 'Gate No 1', 'ENTRY', '2016-12-05 15:54:15', '3', 'ABSENT', 'Sorry to inform you that your ward is not present in the class so marked as absent', '2016-12-05 15:54:15', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('286', '18', 'Gate No 1', 'ENTRY', '2016-12-05 13:02:54', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('287', '18', 'Gate No 1', 'EXIT', '2016-12-05 19:07:28', '3', 'ABSENT', 'Sorry to inform you that your ward is not present in the class so marked as absent', '2016-12-05 19:07:28', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('288', '17', 'Gate No 1', 'EXIT', '2016-12-05 19:07:28', '3', 'ABSENT', 'Sorry to inform you that your ward is not present in the class so marked as absent', '2016-12-05 19:07:28', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('289', '13', 'Gate No 1', 'ENTRY', '2016-12-05 15:17:35', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('290', '4', 'Gate No 1', 'ENTRY', '2016-12-05 15:17:36', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('291', '17', 'Gate No 1', 'ENTRY', '2016-12-05 15:17:37', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('292', '16', 'Gate No 1', 'ENTRY', '2016-12-05 15:17:38', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('293', '6', 'Gate No 1', 'ENTRY', '2016-12-05 15:17:39', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('294', '9', 'Gate No 1', 'ENTRY', '2016-12-05 15:17:40', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('295', '7', 'Gate No 1', 'ENTRY', '2016-12-05 15:17:40', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('296', '14', 'Gate No 1', 'ENTRY', '2016-12-05 15:17:41', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('297', '11', 'Gate No 1', 'ENTRY', '2016-12-05 15:17:42', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('298', '10', 'Gate No 1', 'ENTRY', '2016-12-05 15:17:43', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('299', '15', 'Gate No 1', 'ENTRY', '2016-12-05 15:17:45', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('300', '8', 'Gate No 1', 'ENTRY', '2016-12-05 15:17:56', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('301', '12', 'Gate No 1', 'ENTRY', '2016-12-05 15:17:56', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('302', '2', 'Gate No 1', 'ENTRY', '2016-12-05 15:17:57', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('303', '5', 'Gate No 1', 'ENTRY', '2016-12-05 15:17:58', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('304', '18', 'Gate No 1', 'ENTRY', '2016-12-05 15:18:05', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('305', '13', 'Gate No 1', 'ENTRY', '2016-12-05 15:50:04', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('306', '4', 'Gate No 1', 'ENTRY', '2016-12-05 15:50:05', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('307', '16', 'Gate No 1', 'ENTRY', '2016-12-05 15:50:06', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('308', '17', 'Gate No 1', 'ENTRY', '2016-12-05 15:50:08', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('309', '2', 'Gate No 1', 'ENTRY', '2016-12-05 15:50:09', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('310', '10', 'Gate No 1', 'ENTRY', '2016-12-05 15:50:10', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('311', '8', 'Gate No 1', 'ENTRY', '2016-12-05 15:50:11', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('312', '11', 'Gate No 1', 'ENTRY', '2016-12-05 15:50:12', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('313', '7', 'Gate No 1', 'ENTRY', '2016-12-05 15:50:13', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('314', '18', 'Gate No 1', 'ENTRY', '2016-12-05 15:50:14', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('315', '15', 'Gate No 1', 'ENTRY', '2016-12-05 15:50:15', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('316', '5', 'Gate No 1', 'ENTRY', '2016-12-05 15:50:16', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('317', '13', 'Gate No 1', 'ENTRY', '2016-12-05 15:51:05', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('318', '6', 'Gate No 1', 'ENTRY', '2016-12-05 15:51:05', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('319', '18', 'Gate No 1', 'ENTRY', '2016-12-05 15:51:06', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('320', '2', 'Gate No 1', 'ENTRY', '2016-12-05 15:51:07', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('321', '8', 'Gate No 1', 'ENTRY', '2016-12-05 15:51:08', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('322', '12', 'Gate No 1', 'ENTRY', '2016-12-05 15:51:09', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('323', '7', 'Gate No 1', 'ENTRY', '2016-12-05 15:51:09', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('324', '4', 'Gate No 1', 'ENTRY', '2016-12-05 15:51:10', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('325', '16', 'Gate No 1', 'ENTRY', '2016-12-05 15:51:11', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('326', '10', 'Gate No 1', 'ENTRY', '2016-12-05 15:51:12', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('327', '5', 'Gate No 1', 'ENTRY', '2016-12-05 15:51:13', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('328', '14', 'Gate No 1', 'ENTRY', '2016-12-05 15:51:13', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('329', '6', 'Gate No 1', 'ENTRY', '2016-12-05 15:51:24', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('330', '7', 'Gate No 1', 'ENTRY', '2016-12-05 15:51:25', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('331', '17', 'Gate No 1', 'ENTRY', '2016-12-05 15:51:26', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('332', '11', 'Gate No 1', 'ENTRY', '2016-12-05 15:51:27', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('333', '14', 'Gate No 1', 'ENTRY', '2016-12-05 15:51:28', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('334', '13', 'Gate No 1', 'ENTRY', '2016-12-05 15:51:28', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('335', '8', 'Gate No 1', 'ENTRY', '2016-12-05 15:51:29', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('336', '17', 'Gate No 1', 'ENTRY', '2016-12-05 16:19:50', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('337', '18', 'Gate No 1', 'ENTRY', '2016-12-05 16:19:52', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('338', '18', 'Gate No 1', 'ENTRY', '2016-12-05 16:20:20', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('339', '17', 'Gate No 1', 'ENTRY', '2016-12-05 16:20:31', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('340', '3', 'MANUAL', 'ENTRY', '2016-12-05 17:18:45', '3', 'ABSENT', 'Sorry to inform you that your ward is not present in the class so marked as absent', '2016-12-05 17:18:45', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('341', '17', 'MANUAL', 'ENTRY', '2016-12-07 18:38:18', '3', 'PRESENT', 'Manual Entry', '2016-12-07 18:38:18', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('342', '18', 'MANUAL', 'ENTRY', '2016-12-07 18:39:56', '3', 'PRESENT', 'Manual Entry', '2016-12-07 18:39:56', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('343', '17', 'MANUAL', 'ENTRY', '2016-12-13 15:11:50', '3', 'PRESENT', 'Manual Entry', '2016-12-13 15:11:50', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('344', '17', 'Gate No 1', 'ENTRY', '2016-12-13 15:12:52', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('345', '18', 'Gate No 1', 'ENTRY', '2016-12-13 15:12:54', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('346', '17', 'Gate No 1', 'ENTRY', '2016-12-13 15:14:37', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('347', '18', 'Gate No 1', 'ENTRY', '2016-12-13 15:14:39', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('348', '17', 'Gate No 1', 'ENTRY', '2016-12-13 15:25:11', '3', 'ABSENT', 'Sorry to inform you that your ward is not present in the class so marked as absent', '2016-12-13 15:25:11', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('349', '18', 'Gate No 1', 'ENTRY', '2016-12-13 15:25:11', '3', 'ABSENT', 'Sorry to inform you that your ward is not present in the class so marked as absent', '2016-12-13 15:25:11', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('350', '1', 'MANUAL', 'ENTRY', '2016-12-13 15:26:37', '3', 'PRESENT', 'Manual Entry', '2016-12-13 15:26:37', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('351', '2', 'MANUAL', 'ENTRY', '2016-12-13 15:26:37', '3', 'PRESENT', 'Manual Entry', '2016-12-13 15:26:37', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('352', '3', 'MANUAL', 'ENTRY', '2016-12-13 15:26:37', '3', 'PRESENT', 'Manual Entry', '2016-12-13 15:26:37', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('353', '18', 'Gate No 1', 'ENTRY', '2016-12-13 15:35:23', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('354', '17', 'Gate No 1', 'ENTRY', '2016-12-13 15:40:36', '3', 'PRESENT', 'Manual Entry', '2016-12-13 15:40:36', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('355', '18', 'Gate No 1', 'ENTRY', '2016-12-13 15:39:35', '3', 'ABSENT', 'Sorry to inform you that your ward is not present in the class so marked as absent', '2016-12-13 15:39:35', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('356', '17', 'Gate No 1', 'ENTRY', '2016-12-13 15:44:13', '3', 'ABSENT', 'Sorry to inform you that your ward is not present in the class so marked as absent', '2016-12-13 15:44:13', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('357', '18', 'Gate No 1', 'ENTRY', '2016-12-13 15:42:05', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('358', '17', 'Gate No 1', 'ENTRY', '2016-12-13 15:42:06', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('359', '18', 'Gate No 1', 'ENTRY', '2016-12-13 15:43:12', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('360', '17', 'Gate No 1', 'ENTRY', '2016-12-13 15:43:13', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('361', '18', 'Gate No 1', 'ENTRY', '2016-12-13 15:47:10', '3', 'ABSENT', 'Sorry to inform you that your ward is not present in the class so marked as absent', '2016-12-13 15:47:10', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('362', '17', 'Gate No 1', 'ENTRY', '2016-12-13 15:43:23', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('363', '17', 'Gate No 1', 'ENTRY', '2016-12-13 15:48:06', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('364', '18', 'Gate No 1', 'ENTRY', '2016-12-13 15:48:08', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('365', '18', 'Gate No 1', 'ENTRY', '2016-12-17 12:12:58', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('366', '17', 'Gate No 1', 'ENTRY', '2016-12-17 12:12:59', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('367', '12', 'Gate No 1', 'ENTRY', '2016-12-17 12:13:00', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('368', '5', 'Gate No 1', 'ENTRY', '2016-12-17 12:13:01', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('369', '14', 'Gate No 1', 'ENTRY', '2016-12-17 12:13:01', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('370', '13', 'Gate No 1', 'ENTRY', '2016-12-17 12:13:02', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('371', '7', 'Gate No 1', 'ENTRY', '2016-12-17 12:13:03', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('372', '8', 'Gate No 1', 'ENTRY', '2016-12-17 12:13:03', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('373', '16', 'Gate No 1', 'ENTRY', '2016-12-17 12:13:04', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('374', '15', 'Gate No 1', 'ENTRY', '2016-12-17 12:13:05', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('375', '9', 'Gate No 1', 'ENTRY', '2016-12-17 12:13:05', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('376', '11', 'Gate No 1', 'ENTRY', '2016-12-17 12:13:06', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('377', '10', 'Gate No 1', 'ENTRY', '2016-12-17 12:13:07', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('378', '6', 'Gate No 1', 'ENTRY', '2016-12-17 12:13:08', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('379', '4', 'Gate No 1', 'ENTRY', '2016-12-17 12:13:28', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('380', '7', 'Gate No 1', 'ENTRY', '2016-12-17 12:15:14', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('381', '13', 'Gate No 1', 'ENTRY', '2016-12-17 12:15:15', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('382', '10', 'Gate No 1', 'ENTRY', '2016-12-17 12:15:16', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('383', '12', 'Gate No 1', 'ENTRY', '2016-12-17 12:15:17', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('384', '16', 'Gate No 1', 'ENTRY', '2016-12-17 12:15:18', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('385', '4', 'Gate No 1', 'ENTRY', '2016-12-17 12:15:19', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('386', '11', 'Gate No 1', 'ENTRY', '2016-12-17 12:15:20', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('387', '6', 'Gate No 1', 'ENTRY', '2016-12-17 12:15:20', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('388', '15', 'Gate No 1', 'ENTRY', '2016-12-17 12:15:21', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('389', '18', 'Gate No 1', 'ENTRY', '2016-12-17 12:15:22', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('390', '17', 'Gate No 1', 'ENTRY', '2016-12-17 12:40:18', '3', 'PRESENT', 'Manual Entry', '2016-12-17 12:40:18', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('391', '5', 'Gate No 1', 'ENTRY', '2016-12-17 12:15:23', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('392', '9', 'Gate No 1', 'ENTRY', '2016-12-17 12:15:24', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('393', '12', 'Gate No 1', 'ENTRY', '2016-12-17 12:17:39', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('394', '17', 'Gate No 1', 'ENTRY', '2016-12-17 13:53:51', '3', 'ABSENT', 'Sorry to inform you that your ward is not present in the class so marked as absent', '2016-12-17 13:53:51', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('395', '5', 'Gate No 1', 'ENTRY', '2016-12-17 12:17:40', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('396', '14', 'Gate No 1', 'ENTRY', '2016-12-17 12:17:41', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('397', '11', 'Gate No 1', 'ENTRY', '2016-12-17 12:17:42', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('398', '18', 'Gate No 1', 'ENTRY', '2016-12-17 13:52:36', '3', 'PRESENT', 'Manual Entry', '2016-12-17 13:52:36', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('399', '15', 'Gate No 1', 'ENTRY', '2016-12-17 12:17:43', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('400', '13', 'Gate No 1', 'ENTRY', '2016-12-17 12:17:44', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('401', '9', 'Gate No 1', 'ENTRY', '2016-12-17 12:17:45', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('402', '10', 'Gate No 1', 'ENTRY', '2016-12-17 12:17:45', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('403', '6', 'Gate No 1', 'ENTRY', '2016-12-17 12:17:46', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('404', '16', 'Gate No 1', 'ENTRY', '2016-12-17 12:17:47', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('405', '1', 'MANUAL', 'ENTRY', '2016-12-17 13:07:07', '3', 'PRESENT', 'Manual Entry', '2016-12-17 13:07:07', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('406', '18', 'Gate No 1', 'ENTRY', '2016-12-17 13:30:33', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('407', '15', 'Gate No 1', 'ENTRY', '2016-12-17 13:30:34', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('408', '8', 'Gate No 1', 'ENTRY', '2016-12-17 13:30:35', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('409', '10', 'Gate No 1', 'ENTRY', '2016-12-17 13:30:35', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('410', '17', 'Gate No 1', 'ENTRY', '2016-12-17 13:30:36', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('411', '5', 'Gate No 1', 'ENTRY', '2016-12-17 13:30:37', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('412', '14', 'Gate No 1', 'ENTRY', '2016-12-17 16:33:08', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('413', '18', 'Gate No 1', 'ENTRY', '2016-12-17 16:33:09', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('414', '12', 'Gate No 1', 'ENTRY', '2016-12-17 16:33:09', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('415', '7', 'Gate No 1', 'ENTRY', '2016-12-17 16:33:10', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('416', '15', 'Gate No 1', 'ENTRY', '2016-12-17 16:33:11', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('417', '9', 'Gate No 1', 'ENTRY', '2016-12-17 16:33:11', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('418', '17', 'Gate No 1', 'ENTRY', '2016-12-17 16:33:12', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('419', '176', 'Gate No 1', 'ENTRY', '2016-12-19 17:05:17', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('420', '260', 'Gate No 1', 'ENTRY', '2016-12-19 17:05:18', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('421', '269', 'Gate No 1', 'ENTRY', '2016-12-19 17:05:19', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('422', '277', 'Gate No 1', 'ENTRY', '2016-12-19 17:05:21', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('423', '266', 'Gate No 1', 'ENTRY', '2016-12-19 17:05:23', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('424', '276', 'Gate No 1', 'ENTRY', '2016-12-19 17:05:25', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('425', '278', 'Gate No 1', 'ENTRY', '2016-12-19 17:05:26', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('426', '261', 'Gate No 1', 'ENTRY', '2016-12-19 17:05:27', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('427', '259', 'Gate No 1', 'ENTRY', '2016-12-19 17:05:28', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('428', '279', 'Gate No 1', 'ENTRY', '2016-12-19 17:05:29', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('429', '273', 'Gate No 1', 'ENTRY', '2016-12-19 17:05:30', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('430', '268', 'Gate No 1', 'ENTRY', '2016-12-19 17:05:46', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('431', '270', 'Gate No 1', 'ENTRY', '2016-12-19 17:05:47', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('432', '263', 'Gate No 1', 'ENTRY', '2016-12-19 17:05:47', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('433', '271', 'Gate No 1', 'ENTRY', '2016-12-19 17:05:48', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('434', '264', 'Gate No 1', 'ENTRY', '2016-12-19 17:05:49', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('435', '267', 'Gate No 1', 'ENTRY', '2016-12-19 17:05:49', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('436', '274', 'Gate No 1', 'ENTRY', '2016-12-19 17:05:50', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('437', '257', 'Gate No 1', 'ENTRY', '2016-12-19 17:05:51', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('438', '265', 'Gate No 1', 'ENTRY', '2016-12-19 17:05:51', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('439', '275', 'Gate No 1', 'ENTRY', '2016-12-19 17:05:52', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('440', '256', 'Gate No 1', 'ENTRY', '2016-12-19 17:05:53', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('441', '272', 'Gate No 1', 'ENTRY', '2016-12-19 17:05:53', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('442', '258', 'Gate No 1', 'ENTRY', '2016-12-19 17:05:54', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('443', '265', 'Gate No 1', 'ENTRY', '2016-12-19 17:06:47', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('444', '264', 'Gate No 1', 'ENTRY', '2016-12-19 17:06:48', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('445', '272', 'Gate No 1', 'ENTRY', '2016-12-19 17:06:49', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('446', '274', 'Gate No 1', 'ENTRY', '2016-12-19 17:06:49', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('447', '267', 'Gate No 1', 'ENTRY', '2016-12-19 17:06:50', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('448', '268', 'Gate No 1', 'ENTRY', '2016-12-19 17:06:51', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('449', '271', 'Gate No 1', 'ENTRY', '2016-12-19 17:06:52', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('450', '270', 'Gate No 1', 'ENTRY', '2016-12-19 17:06:52', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('451', '273', 'Gate No 1', 'ENTRY', '2016-12-19 17:06:53', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('452', '258', 'Gate No 1', 'ENTRY', '2016-12-19 17:06:54', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('453', '176', 'Gate No 1', 'ENTRY', '2016-12-19 17:06:54', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('454', '263', 'Gate No 1', 'ENTRY', '2016-12-19 17:06:55', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('455', '261', 'Gate No 1', 'ENTRY', '2016-12-19 17:06:56', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('456', '275', 'Gate No 1', 'ENTRY', '2016-12-19 17:06:56', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('457', '257', 'Gate No 1', 'ENTRY', '2016-12-19 17:06:57', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('458', '278', 'Gate No 1', 'ENTRY', '2016-12-19 17:06:58', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('459', '256', 'Gate No 1', 'ENTRY', '2016-12-19 17:06:59', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('460', '266', 'Gate No 1', 'ENTRY', '2016-12-19 17:07:07', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('461', '277', 'Gate No 1', 'ENTRY', '2016-12-19 17:07:08', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('462', '279', 'Gate No 1', 'ENTRY', '2016-12-19 17:07:09', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('463', '269', 'Gate No 1', 'ENTRY', '2016-12-19 17:07:09', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('464', '260', 'Gate No 1', 'ENTRY', '2016-12-19 17:07:10', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('465', '276', 'Gate No 1', 'ENTRY', '2016-12-19 17:07:11', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('466', '268', 'Gate No 1', 'ENTRY', '2016-12-19 17:08:58', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('467', '267', 'Gate No 1', 'ENTRY', '2016-12-19 17:09:01', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('468', '278', 'Gate No 1', 'ENTRY', '2016-12-19 17:09:02', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('469', '277', 'Gate No 1', 'ENTRY', '2016-12-19 17:09:08', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('470', '266', 'Gate No 1', 'ENTRY', '2016-12-19 17:09:18', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('471', '265', 'Gate No 1', 'ENTRY', '2016-12-19 17:09:18', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('472', '269', 'Gate No 1', 'ENTRY', '2016-12-19 17:09:19', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('473', '260', 'Gate No 1', 'ENTRY', '2016-12-19 17:09:20', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('474', '261', 'Gate No 1', 'ENTRY', '2016-12-19 17:09:20', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('475', '276', 'Gate No 1', 'ENTRY', '2016-12-19 17:09:21', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('476', '279', 'Gate No 1', 'ENTRY', '2016-12-19 17:09:22', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('477', '275', 'Gate No 1', 'ENTRY', '2016-12-19 17:09:28', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('478', '273', 'Gate No 1', 'ENTRY', '2016-12-19 17:09:29', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('479', '264', 'Gate No 1', 'ENTRY', '2016-12-19 17:09:38', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('480', '263', 'Gate No 1', 'ENTRY', '2016-12-19 17:09:58', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('481', '274', 'Gate No 1', 'ENTRY', '2016-12-19 17:10:18', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('482', '271', 'Gate No 1', 'ENTRY', '2016-12-19 17:10:18', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('483', '272', 'Gate No 1', 'ENTRY', '2016-12-19 17:10:19', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('484', '270', 'Gate No 1', 'ENTRY', '2016-12-19 17:10:28', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('485', '259', 'Gate No 1', 'ENTRY', '2016-12-19 17:10:49', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('486', '257', 'Gate No 1', 'ENTRY', '2016-12-19 17:10:59', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('487', '256', 'Gate No 1', 'ENTRY', '2016-12-19 17:11:08', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('488', '258', 'Gate No 1', 'ENTRY', '2016-12-19 17:11:08', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('489', '123', 'Gate No 1', 'ENTRY', '2016-12-19 17:13:05', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('490', '125', 'Gate No 1', 'ENTRY', '2016-12-19 17:13:06', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('491', '146', 'Gate No 1', 'ENTRY', '2016-12-19 17:13:07', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('492', '126', 'Gate No 1', 'ENTRY', '2016-12-19 17:13:08', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('493', '127', 'Gate No 1', 'ENTRY', '2016-12-19 17:13:08', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('494', '128', 'Gate No 1', 'ENTRY', '2016-12-19 17:13:09', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('495', '132', 'Gate No 1', 'ENTRY', '2016-12-19 17:13:10', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('496', '122', 'Gate No 1', 'ENTRY', '2016-12-19 17:13:15', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('497', '129', 'Gate No 1', 'ENTRY', '2016-12-19 17:13:25', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('498', '131', 'Gate No 1', 'ENTRY', '2016-12-19 17:13:26', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('499', '134', 'Gate No 1', 'ENTRY', '2016-12-19 17:13:35', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('500', '135', 'Gate No 1', 'ENTRY', '2016-12-19 17:13:45', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('501', '137', 'Gate No 1', 'ENTRY', '2016-12-19 17:13:46', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('502', '138', 'Gate No 1', 'ENTRY', '2016-12-19 17:14:03', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('503', '143', 'Gate No 1', 'ENTRY', '2016-12-19 17:14:15', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('504', '142', 'Gate No 1', 'ENTRY', '2016-12-19 17:14:16', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('505', '147', 'Gate No 1', 'ENTRY', '2016-12-19 17:14:17', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('506', '202', 'Gate No 1', 'ENTRY', '2016-12-19 17:14:45', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('507', '7', 'Gate No 1', 'ENTRY', '2016-12-20 11:24:19', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('508', '15', 'Gate No 1', 'ENTRY', '2016-12-20 11:24:20', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('509', '8', 'Gate No 1', 'ENTRY', '2016-12-20 11:24:21', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('510', '4', 'Gate No 1', 'ENTRY', '2016-12-20 11:24:22', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('511', '13', 'Gate No 1', 'ENTRY', '2016-12-20 11:24:23', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('512', '16', 'Gate No 1', 'ENTRY', '2016-12-20 11:24:24', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('513', '17', 'Gate No 1', 'ENTRY', '2016-12-20 11:24:25', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('514', '12', 'Gate No 1', 'ENTRY', '2016-12-20 11:24:26', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('515', '14', 'Gate No 1', 'ENTRY', '2016-12-20 11:24:27', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('516', '6', 'Gate No 1', 'ENTRY', '2016-12-20 11:24:28', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('517', '18', 'Gate No 1', 'ENTRY', '2016-12-20 11:39:00', '3', 'PRESENT', 'Manual Entry', '2016-12-20 11:39:00', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('518', '11', 'Gate No 1', 'ENTRY', '2016-12-20 11:24:30', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('519', '5', 'Gate No 1', 'ENTRY', '2016-12-20 11:24:31', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('520', '9', 'Gate No 1', 'ENTRY', '2016-12-20 11:24:32', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('521', '13', 'Gate No 1', 'ENTRY', '2016-12-20 11:26:06', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('522', '15', 'Gate No 1', 'ENTRY', '2016-12-20 11:26:06', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('523', '9', 'Gate No 1', 'ENTRY', '2016-12-20 11:26:07', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('524', '18', 'Gate No 1', 'EXIT', '2016-12-20 11:38:30', '3', 'PRESENT', 'Manual Exit', '2016-12-20 11:38:30', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('525', '7', 'Gate No 1', 'ENTRY', '2016-12-20 11:26:09', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('526', '8', 'Gate No 1', 'ENTRY', '2016-12-20 11:26:10', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('527', '5', 'Gate No 1', 'ENTRY', '2016-12-20 11:26:11', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('528', '14', 'Gate No 1', 'ENTRY', '2016-12-20 11:26:11', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('529', '16', 'Gate No 1', 'ENTRY', '2016-12-20 11:26:12', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('530', '4', 'Gate No 1', 'ENTRY', '2016-12-20 11:26:13', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('531', '17', 'Gate No 1', 'ENTRY', '2016-12-20 11:38:04', '3', 'ABSENT', 'Sorry to inform you that your ward is not present in the class so marked as absent', '2016-12-20 11:38:04', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('532', '11', 'Gate No 1', 'ENTRY', '2016-12-20 11:26:15', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('533', '12', 'Gate No 1', 'ENTRY', '2016-12-20 11:26:17', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('534', '1', 'MANUAL', 'ENTRY', '2016-12-20 11:38:30', '3', 'PRESENT', 'Manual Entry', '2016-12-20 11:38:30', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('535', '2', 'MANUAL', 'ENTRY', '2016-12-20 11:38:30', '3', 'PRESENT', 'Manual Entry', '2016-12-20 11:38:30', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('538', '17', 'MANUAL', 'ENTRY', '2016-12-21 11:37:29', '3', 'ABSENT', 'Sorry to inform you that your ward is not present in the class so marked as absent', '2016-12-21 11:37:29', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('539', '18', 'MANUAL', 'ENTRY', '2016-12-21 11:32:10', '3', 'PRESENT', 'Manual Entry', '2016-12-21 11:32:10', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('540', '18', 'Gate No 1', 'ENTRY', '2016-12-21 11:39:14', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('541', '17', 'Gate No 1', 'ENTRY', '2016-12-21 11:39:16', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('542', '2', 'Gate No 1', 'ENTRY', '2016-12-21 11:39:18', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('543', '12', 'Gate No 1', 'ENTRY', '2016-12-21 11:39:20', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('544', '18', 'Gate No 1', 'ENTRY', '2016-12-21 11:40:12', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('545', '17', 'Gate No 1', 'ENTRY', '2016-12-21 11:40:13', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('546', '2', 'Gate No 1', 'ENTRY', '2016-12-21 11:40:14', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('547', '12', 'Gate No 1', 'ENTRY', '2016-12-21 11:40:15', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('548', '18', 'Gate No 1', 'ENTRY', '2016-12-21 11:42:27', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('549', '17', 'Gate No 1', 'ENTRY', '2016-12-21 11:42:28', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('550', '18', 'Gate No 1', 'ENTRY', '2016-12-21 11:48:39', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('551', '17', 'Gate No 1', 'ENTRY', '2016-12-21 11:48:41', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('552', '17', 'MANUAL', 'ENTRY', '2016-12-24 22:06:09', '3', 'PRESENT', 'Manual Entry', '2016-12-24 22:06:09', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('553', '2', 'Gate No 1', 'ENTRY', '2016-12-28 16:16:20', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('554', '12', 'Gate No 1', 'ENTRY', '2016-12-28 16:16:20', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('555', '4', 'Gate No 1', 'ENTRY', '2016-12-28 16:16:21', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('556', '6', 'Gate No 1', 'ENTRY', '2016-12-28 16:16:22', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('557', '8', 'Gate No 1', 'ENTRY', '2016-12-28 16:16:22', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('558', '17', 'Gate No 1', 'ENTRY', '2016-12-28 16:16:23', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('559', '1', 'Gate No 1', 'ENTRY', '2016-12-28 16:16:24', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('560', '6', 'Gate No 1', 'ENTRY', '2016-12-28 16:16:38', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('561', '16', 'Gate No 1', 'ENTRY', '2016-12-28 16:16:39', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('562', '11', 'Gate No 1', 'ENTRY', '2016-12-28 16:16:40', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('563', '5', 'Gate No 1', 'ENTRY', '2016-12-28 16:16:40', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('564', '9', 'Gate No 1', 'ENTRY', '2016-12-28 16:16:41', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('565', '14', 'Gate No 1', 'ENTRY', '2016-12-28 16:16:42', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('566', '2', 'Gate No 1', 'ENTRY', '2016-12-28 16:16:42', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('567', '17', 'Gate No 1', 'ENTRY', '2016-12-28 16:16:43', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('568', '13', 'Gate No 1', 'ENTRY', '2016-12-28 16:16:44', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('569', '10', 'Gate No 1', 'ENTRY', '2016-12-28 16:16:44', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('570', '15', 'Gate No 1', 'ENTRY', '2016-12-28 16:16:45', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('571', '8', 'Gate No 1', 'ENTRY', '2016-12-28 16:16:46', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('572', '18', 'Gate No 1', 'ENTRY', '2016-12-28 16:16:46', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('573', '12', 'Gate No 1', 'ENTRY', '2016-12-28 16:16:47', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('574', '7', 'Gate No 1', 'ENTRY', '2016-12-28 16:16:48', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('575', '4', 'Gate No 1', 'ENTRY', '2016-12-28 16:16:49', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('576', '18', 'Gate No 1', 'ENTRY', '2016-12-28 16:18:30', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('577', '7', 'Gate No 1', 'ENTRY', '2016-12-28 16:18:31', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('578', '4', 'Gate No 1', 'ENTRY', '2016-12-28 16:18:32', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('579', '13', 'Gate No 1', 'ENTRY', '2016-12-28 16:18:32', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('580', '17', 'Gate No 1', 'ENTRY', '2016-12-28 16:18:33', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('581', '5', 'Gate No 1', 'ENTRY', '2016-12-28 16:19:56', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('582', '18', 'Gate No 1', 'ENTRY', '2016-12-28 16:19:57', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('583', '6', 'Gate No 1', 'ENTRY', '2016-12-28 16:19:58', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('584', '4', 'Gate No 1', 'ENTRY', '2016-12-28 16:19:58', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('585', '7', 'Gate No 1', 'ENTRY', '2016-12-28 16:19:59', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('586', '16', 'Gate No 1', 'ENTRY', '2016-12-28 16:20:00', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('587', '17', 'Gate No 1', 'ENTRY', '2016-12-28 16:20:00', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('588', '13', 'Gate No 1', 'ENTRY', '2016-12-28 16:20:01', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('589', '11', 'Gate No 1', 'ENTRY', '2016-12-28 16:20:02', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('590', '2', 'Gate No 1', 'ENTRY', '2016-12-28 16:20:03', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('591', '15', 'Gate No 1', 'ENTRY', '2016-12-28 16:20:04', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('592', '1', 'Gate No 1', 'ENTRY', '2016-12-28 16:20:04', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('593', '8', 'Gate No 1', 'ENTRY', '2016-12-28 18:35:32', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('594', '6', 'Gate No 1', 'ENTRY', '2016-12-28 18:35:32', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('595', '2', 'Gate No 1', 'ENTRY', '2016-12-28 18:35:33', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('596', '10', 'Gate No 1', 'ENTRY', '2016-12-28 18:35:34', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('597', '11', 'Gate No 1', 'ENTRY', '2016-12-28 18:35:34', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('598', '17', 'Gate No 1', 'ENTRY', '2016-12-28 18:51:22', '3', 'ABSENT', 'Sorry to inform you that your ward is not present in the class so marked as absent', '2016-12-28 18:51:22', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('599', '16', 'Gate No 1', 'ENTRY', '2016-12-28 18:35:36', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('600', '18', 'Gate No 1', 'ENTRY', '2016-12-28 18:35:37', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('654', '14', 'Gate No 1', 'ENTRY', '2016-12-29 16:02:52', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('655', '11', 'Gate No 1', 'ENTRY', '2016-12-29 16:02:53', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('656', '17', 'Gate No 1', 'ENTRY', '2016-12-29 16:23:03', '3', 'PRESENT', 'Manual Entry', '2016-12-29 16:23:03', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('657', '15', 'Gate No 1', 'ENTRY', '2016-12-29 16:02:55', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('658', '7', 'Gate No 1', 'ENTRY', '2016-12-29 16:02:57', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('659', '9', 'Gate No 1', 'ENTRY', '2016-12-29 16:02:58', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('660', '12', 'Gate No 1', 'ENTRY', '2016-12-29 16:03:00', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('661', '16', 'Gate No 1', 'ENTRY', '2016-12-29 16:03:01', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('662', '13', 'Gate No 1', 'ENTRY', '2016-12-29 16:03:02', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('663', '18', 'Gate No 1', 'ENTRY', '2016-12-29 19:19:06', '3', 'ABSENT', 'Sorry to inform you that your ward is not present in the class so marked as absent', '2016-12-29 19:19:06', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('664', '10', 'Gate No 1', 'ENTRY', '2016-12-29 16:03:14', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('665', '4', 'Gate No 1', 'ENTRY', '2016-12-29 16:03:15', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('666', '8', 'Gate No 1', 'ENTRY', '2016-12-29 16:03:16', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('667', '5', 'Gate No 1', 'ENTRY', '2016-12-29 16:03:17', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('668', '6', 'Gate No 1', 'ENTRY', '2016-12-29 16:03:18', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('669', '10', 'Gate No 1', 'ENTRY', '2016-12-29 16:24:08', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('670', '11', 'Gate No 1', 'ENTRY', '2016-12-29 16:38:39', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('671', '5', 'Gate No 1', 'ENTRY', '2016-12-29 16:38:40', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('672', '16', 'Gate No 1', 'ENTRY', '2016-12-29 16:38:42', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('673', '8', 'Gate No 1', 'ENTRY', '2016-12-29 16:38:43', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('674', '18', 'Gate No 1', 'EXIT', '2016-12-29 17:49:04', '3', 'PRESENT', 'Manual Exit', '2016-12-29 17:49:04', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('675', '6', 'Gate No 1', 'ENTRY', '2016-12-29 16:38:45', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('676', '4', 'Gate No 1', 'ENTRY', '2016-12-29 16:38:47', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('677', '12', 'Gate No 1', 'ENTRY', '2016-12-29 16:38:48', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('678', '9', 'Gate No 1', 'ENTRY', '2016-12-29 16:38:49', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('679', '14', 'Gate No 1', 'ENTRY', '2016-12-29 16:38:59', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('680', '17', 'Gate No 1', 'ENTRY', '2016-12-29 19:19:06', '3', 'ABSENT', 'Sorry to inform you that your ward is not present in the class so marked as absent', '2016-12-29 19:19:06', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('681', '13', 'Gate No 1', 'ENTRY', '2016-12-29 16:39:03', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('682', '14', 'Gate No 1', 'ENTRY', '2016-12-29 16:47:19', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('683', '12', 'Gate No 1', 'ENTRY', '2016-12-29 16:47:20', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('684', '9', 'Gate No 1', 'ENTRY', '2016-12-29 16:47:21', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('685', '10', 'Gate No 1', 'ENTRY', '2016-12-29 16:47:22', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('686', '17', 'Gate No 1', 'EXIT', '2016-12-29 16:55:24', '3', 'PRESENT', 'Manual Exit', '2016-12-29 16:55:24', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('687', '15', 'Gate No 1', 'ENTRY', '2016-12-29 16:47:29', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('688', '7', 'Gate No 1', 'ENTRY', '2016-12-29 16:47:32', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('689', '18', 'Gate No 1', 'EXIT', '2016-12-29 17:15:23', '3', 'PRESENT', 'Manual Exit', '2016-12-29 17:15:23', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('690', '13', 'Gate No 1', 'ENTRY', '2016-12-29 16:47:40', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('691', '1', 'MANUAL', 'ENTRY', '2016-12-29 18:14:16', '3', 'PRESENT', 'Manual Entry', '2016-12-29 18:14:16', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('692', '12', 'Gate No 1', 'ENTRY', '2016-12-30 13:33:44', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('693', '17', 'Gate No 1', 'ENTRY', '2016-12-30 13:33:45', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('694', '7', 'Gate No 1', 'ENTRY', '2016-12-30 13:33:46', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('695', '15', 'Gate No 1', 'ENTRY', '2016-12-30 13:33:53', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('696', '9', 'Gate No 1', 'ENTRY', '2016-12-30 13:33:54', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('697', '14', 'Gate No 1', 'ENTRY', '2016-12-30 13:33:54', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('698', '18', 'Gate No 1', 'ENTRY', '2016-12-30 13:33:55', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('699', '17', 'Gate No 1', 'ENTRY', '2016-12-30 13:49:34', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('700', '18', 'Gate No 1', 'ENTRY', '2016-12-30 13:49:35', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('701', '14', 'Gate No 1', 'ENTRY', '2016-12-30 13:49:44', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('702', '7', 'Gate No 1', 'ENTRY', '2016-12-30 13:49:44', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('703', '15', 'Gate No 1', 'ENTRY', '2016-12-30 13:49:45', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('704', '12', 'Gate No 1', 'ENTRY', '2016-12-30 13:49:46', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('705', '9', 'Gate No 1', 'ENTRY', '2016-12-30 13:49:47', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('706', '17', 'Gate No 1', 'ENTRY', '2016-12-30 13:52:14', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('707', '9', 'Gate No 1', 'ENTRY', '2016-12-30 13:52:15', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('708', '7', 'Gate No 1', 'ENTRY', '2016-12-30 13:52:15', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('709', '18', 'Gate No 1', 'ENTRY', '2016-12-30 14:31:55', '3', 'ABSENT', 'Sorry to inform you that your ward is not present in the class so marked as absent', '2016-12-30 14:31:55', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('710', '12', 'Gate No 1', 'ENTRY', '2016-12-30 13:52:17', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('711', '14', 'Gate No 1', 'ENTRY', '2016-12-30 13:52:18', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('712', '17', 'Gate No 1', 'EXIT', '2016-12-30 17:43:01', '3', 'ABSENT', 'Sorry to inform you that your ward is not present in the class so marked as absent', '2016-12-30 17:43:01', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('713', '15', 'Gate No 1', 'ENTRY', '2016-12-30 13:57:25', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('714', '18', 'Gate No 1', 'EXIT', '2016-12-30 14:24:19', '3', 'PRESENT', 'Manual Exit', '2016-12-30 14:24:19', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('715', '7', 'Gate No 1', 'ENTRY', '2016-12-30 13:57:27', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('716', '9', 'Gate No 1', 'ENTRY', '2016-12-30 13:57:27', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('717', '12', 'Gate No 1', 'ENTRY', '2016-12-30 14:22:04', '3', 'ABSENT', 'Sorry to inform you that your ward is not present in the class so marked as absent', '2016-12-30 14:22:04', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('718', '14', 'Gate No 1', 'ENTRY', '2016-12-30 13:57:35', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('719', '17', 'Gate No 1', 'ENTRY', '2016-12-30 15:58:54', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('720', '14', 'Gate No 1', 'ENTRY', '2016-12-30 15:58:55', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('721', '9', 'Gate No 1', 'ENTRY', '2016-12-30 15:58:57', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('722', '18', 'Gate No 1', 'ENTRY', '2016-12-30 15:58:58', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('723', '12', 'Gate No 1', 'ENTRY', '2016-12-30 15:59:13', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('724', '7', 'Gate No 1', 'ENTRY', '2016-12-30 15:59:14', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('725', '15', 'Gate No 1', 'ENTRY', '2016-12-30 15:59:15', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('726', '15', 'Gate No 1', 'ENTRY', '2016-12-30 16:44:51', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('727', '14', 'Gate No 1', 'ENTRY', '2016-12-30 16:44:57', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('728', '12', 'Gate No 1', 'ENTRY', '2016-12-30 16:44:58', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('729', '17', 'Gate No 1', 'ENTRY', '2016-12-30 16:44:59', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('730', '9', 'Gate No 1', 'ENTRY', '2016-12-30 16:45:01', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('731', '7', 'Gate No 1', 'ENTRY', '2016-12-30 16:45:10', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('732', '18', 'Gate No 1', 'ENTRY', '2016-12-30 16:45:11', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('733', '14', 'Gate No 1', 'ENTRY', '2016-12-31 13:08:46', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('734', '12', 'Gate No 1', 'ENTRY', '2016-12-31 13:08:47', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('735', '15', 'Gate No 1', 'ENTRY', '2016-12-31 13:08:49', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('736', '12', 'Gate No 1', 'ENTRY', '2016-12-31 13:08:53', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('737', '14', 'Gate No 1', 'ENTRY', '2016-12-31 13:08:54', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('738', '13', 'Gate No 1', 'ENTRY', '2017-01-02 11:10:54', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('739', '17', 'Gate No 1', 'ENTRY', '2017-01-02 11:10:54', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('740', '18', 'Gate No 1', 'ENTRY', '2017-01-02 11:10:55', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('741', '12', 'Gate No 1', 'ENTRY', '2017-01-02 11:10:56', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('742', '14', 'Gate No 1', 'ENTRY', '2017-01-02 11:10:57', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('743', '15', 'Gate No 1', 'ENTRY', '2017-01-02 11:11:03', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('744', '12', 'Gate No 1', 'ENTRY', '2017-01-02 11:18:14', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('745', '18', 'Gate No 1', 'ENTRY', '2017-01-02 11:29:17', '3', 'ABSENT', 'Sorry to inform you that your ward is not present in the class so marked as absent', '2017-01-02 11:29:17', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('746', '17', 'Gate No 1', 'ENTRY', '2017-01-02 11:28:28', '3', 'ABSENT', 'Sorry to inform you that your ward is not present in the class so marked as absent', '2017-01-02 11:28:28', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('747', '9', 'Gate No 1', 'ENTRY', '2017-01-02 11:18:17', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('748', '1', 'Gate No 1', 'ENTRY', '2017-01-02 11:29:17', '3', 'ABSENT', 'Sorry to inform you that your ward is not present in the class so marked as absent', '2017-01-02 11:29:17', '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('749', '14', 'Gate No 1', 'ENTRY', '2017-01-02 11:18:18', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('750', '15', 'Gate No 1', 'ENTRY', '2017-01-02 11:18:19', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('751', '7', 'Gate No 1', 'ENTRY', '2017-01-02 11:18:20', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('752', '13', 'Gate No 1', 'ENTRY', '2017-01-02 11:18:21', NULL, 'PRESENT', NULL, NULL, '1');
INSERT INTO `attendance` (`attendanceId`, `studentId`, `gateName`, `logType`, `logDate`, `staffId`, `attendance`, `notes`, `updatedDate`, `status`) VALUES ('753', '2', 'MANUAL', 'ENTRY', '2017-01-02 11:30:07', '3', 'PRESENT', 'Manual Entry', '2017-01-02 11:30:07', '1');


#
# TABLE STRUCTURE FOR: class_staffs
#

DROP TABLE IF EXISTS `class_staffs`;

CREATE TABLE `class_staffs` (
  `mappingId` int(11) NOT NULL AUTO_INCREMENT,
  `classId` int(11) NOT NULL,
  `staffId` int(11) NOT NULL,
  `academicId` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`mappingId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

INSERT INTO `class_staffs` (`mappingId`, `classId`, `staffId`, `academicId`, `status`) VALUES ('1', '1', '3', '1', '1');
INSERT INTO `class_staffs` (`mappingId`, `classId`, `staffId`, `academicId`, `status`) VALUES ('2', '2', '3', '1', '1');
INSERT INTO `class_staffs` (`mappingId`, `classId`, `staffId`, `academicId`, `status`) VALUES ('3', '3', '3', '1', '1');
INSERT INTO `class_staffs` (`mappingId`, `classId`, `staffId`, `academicId`, `status`) VALUES ('4', '4', '3', '1', '1');
INSERT INTO `class_staffs` (`mappingId`, `classId`, `staffId`, `academicId`, `status`) VALUES ('5', '5', '3', '1', '1');
INSERT INTO `class_staffs` (`mappingId`, `classId`, `staffId`, `academicId`, `status`) VALUES ('8', '8', '3', '1', '1');
INSERT INTO `class_staffs` (`mappingId`, `classId`, `staffId`, `academicId`, `status`) VALUES ('9', '9', '3', '1', '1');


#
# TABLE STRUCTURE FOR: designations
#

DROP TABLE IF EXISTS `designations`;

CREATE TABLE `designations` (
  `designationId` int(11) NOT NULL AUTO_INCREMENT,
  `designationName` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`designationId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `designations` (`designationId`, `designationName`, `status`) VALUES ('1', 'Teacher', '1');
INSERT INTO `designations` (`designationId`, `designationName`, `status`) VALUES ('2', 'Bus Attender', '1');


#
# TABLE STRUCTURE FOR: diary_events
#

DROP TABLE IF EXISTS `diary_events`;

CREATE TABLE `diary_events` (
  `eventId` int(11) NOT NULL AUTO_INCREMENT,
  `academicId` int(11) NOT NULL,
  `eventName` varchar(50) NOT NULL,
  `details` varchar(150) NOT NULL,
  `eventDate` date NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`eventId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

INSERT INTO `diary_events` (`eventId`, `academicId`, `eventName`, `details`, `eventDate`, `status`) VALUES ('1', '1', 'School Reopens', 'School Reopens on', '2016-06-01', '1');
INSERT INTO `diary_events` (`eventId`, `academicId`, `eventName`, `details`, `eventDate`, `status`) VALUES ('2', '1', 'Sports Day', 'Annual Sports Day', '2016-09-02', '1');
INSERT INTO `diary_events` (`eventId`, `academicId`, `eventName`, `details`, `eventDate`, `status`) VALUES ('3', '1', 'Sports Day', 'School sports day ', '2016-12-16', '1');
INSERT INTO `diary_events` (`eventId`, `academicId`, `eventName`, `details`, `eventDate`, `status`) VALUES ('4', '1', 'Sports Day', 'test', '2016-10-29', '1');
INSERT INTO `diary_events` (`eventId`, `academicId`, `eventName`, `details`, `eventDate`, `status`) VALUES ('5', '1', ' Racial Harmony ', 'Be dressed in ethnic wear', '2016-10-27', '1');
INSERT INTO `diary_events` (`eventId`, `academicId`, `eventName`, `details`, `eventDate`, `status`) VALUES ('6', '1', 'school da', 'sxhbcdsc,', '2016-12-06', '1');
INSERT INTO `diary_events` (`eventId`, `academicId`, `eventName`, `details`, `eventDate`, `status`) VALUES ('7', '1', 'annual exam', 'abcd', '2016-11-30', '1');
INSERT INTO `diary_events` (`eventId`, `academicId`, `eventName`, `details`, `eventDate`, `status`) VALUES ('8', '1', 'color dress day', 'abc jjj', '2017-01-12', '1');
INSERT INTO `diary_events` (`eventId`, `academicId`, `eventName`, `details`, `eventDate`, `status`) VALUES ('9', '1', 'PTA', 'presence required', '2016-12-30', '1');
INSERT INTO `diary_events` (`eventId`, `academicId`, `eventName`, `details`, `eventDate`, `status`) VALUES ('10', '1', 'School Test', 'Test', '2016-12-31', '1');
INSERT INTO `diary_events` (`eventId`, `academicId`, `eventName`, `details`, `eventDate`, `status`) VALUES ('11', '1', '30 event', 'check 30', '2016-12-30', '1');
INSERT INTO `diary_events` (`eventId`, `academicId`, `eventName`, `details`, `eventDate`, `status`) VALUES ('12', '1', 'test', 'maths', '2016-12-31', '1');


#
# TABLE STRUCTURE FOR: messages
#

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `messageId` int(11) NOT NULL AUTO_INCREMENT,
  `staffId` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `heading` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `content` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sentDate` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`messageId`)
) ENGINE=InnoDB AUTO_INCREMENT=406 DEFAULT CHARSET=latin1;

INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('1', '0', '2', '1', 'Test', 'Test message', '2016-10-05 17:27:44', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('2', '3', '1', '1', 'Test message', 'This is a test message.', '2016-10-05 22:42:09', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('3', '3', '2', '1', 'Maths homework', 'Please submit maths homework tomorrow ', '2016-10-10 15:38:07', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('4', '3', '2', '1', 'Test', 'Test message', '2016-10-15 17:20:57', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('5', '3', '1', '1', 'Test', 'Test message', '2016-10-15 17:20:57', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('6', '4', '1', '1', 'Assignment', 'Please send the assignment', '2016-10-25 09:00:28', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('7', '3', '18', '1', 'Assignments', 'Please send assignment', '2016-11-02 15:54:37', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('8', '3', '17', '1', 'Test', 'Test message', '2016-11-02 15:56:03', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('9', '3', '18', '1', 'Assignment', 'Send assignment', '2016-11-02 16:01:07', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('10', '3', '18', '1', 'Assignment', 'Send assignment', '2016-11-02 16:01:31', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('11', '3', '18', '1', 'Test', 'Math test on Monday\n\n', '2016-11-03 12:13:16', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('12', '3', '18', '1', 'Test on 25thnov', 'Math test on 25th\n', '2016-11-03 19:58:43', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('13', '3', '17', '1', 'Parent meeting ', 'Jonathan  has scored less in math\n', '2016-11-04 12:13:56', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('14', '3', '17', '1', 'Homework ', 'Math  homework . Page 22', '2016-11-04 12:15:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('15', '3', '18', '1', 'Homework ', 'Math  homework . Page 22', '2016-11-04 12:15:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('16', '3', '1', '1', 'Homework ', 'Math  homework . Page 22', '2016-11-04 12:15:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('17', '3', '2', '1', 'Homework ', 'Math  homework . Page 22', '2016-11-04 12:15:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('18', '3', '3', '1', 'Homework ', 'Math  homework . Page 22', '2016-11-04 12:15:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('19', '3', '4', '1', 'Homework ', 'Math  homework . Page 22', '2016-11-04 12:15:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('20', '3', '5', '1', 'Homework ', 'Math  homework . Page 22', '2016-11-04 12:15:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('21', '3', '6', '1', 'Homework ', 'Math  homework . Page 22', '2016-11-04 12:15:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('22', '3', '7', '1', 'Homework ', 'Math  homework . Page 22', '2016-11-04 12:15:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('23', '3', '8', '1', 'Homework ', 'Math  homework . Page 22', '2016-11-04 12:15:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('24', '3', '9', '1', 'Homework ', 'Math  homework . Page 22', '2016-11-04 12:15:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('25', '3', '10', '1', 'Homework ', 'Math  homework . Page 22', '2016-11-04 12:15:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('26', '3', '11', '1', 'Homework ', 'Math  homework . Page 22', '2016-11-04 12:15:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('27', '3', '12', '1', 'Homework ', 'Math  homework . Page 22', '2016-11-04 12:15:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('28', '3', '16', '1', 'Homework ', 'Math  homework . Page 22', '2016-11-04 12:15:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('29', '3', '13', '1', 'Homework ', 'Math  homework . Page 22', '2016-11-04 12:15:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('30', '3', '14', '1', 'Homework ', 'Math  homework . Page 22', '2016-11-04 12:15:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('31', '3', '15', '1', 'Homework ', 'Math  homework . Page 22', '2016-11-04 12:15:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('32', '3', '17', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:57:25', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('33', '3', '18', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:57:26', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('34', '3', '1', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:57:26', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('35', '3', '2', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:57:26', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('36', '3', '3', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:57:26', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('37', '3', '4', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:57:26', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('38', '3', '5', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:57:26', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('39', '3', '6', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:57:26', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('40', '3', '7', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:57:26', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('41', '3', '8', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:57:26', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('42', '3', '9', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:57:26', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('43', '3', '10', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:57:26', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('44', '3', '11', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:57:26', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('45', '3', '12', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:57:26', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('46', '3', '16', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:57:26', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('47', '3', '13', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:57:26', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('48', '3', '14', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:57:26', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('49', '3', '15', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:57:26', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('50', '3', '17', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:58:10', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('51', '3', '18', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:58:10', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('52', '3', '1', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:58:10', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('53', '3', '2', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:58:10', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('54', '3', '3', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:58:10', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('55', '3', '4', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:58:10', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('56', '3', '5', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:58:10', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('57', '3', '6', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:58:10', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('58', '3', '7', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:58:10', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('59', '3', '8', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:58:10', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('60', '3', '9', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:58:10', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('61', '3', '10', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:58:10', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('62', '3', '11', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:58:10', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('63', '3', '12', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:58:10', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('64', '3', '16', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:58:10', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('65', '3', '13', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:58:10', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('66', '3', '14', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:58:10', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('67', '3', '15', '1', '29th nov homework ', 'Kannada page no. 12\nEnglish  page no. 5\nMaths page no. 61\nSocial science page no. 3\nScience page no. 14\nHindi page no. 27', '2016-11-04 13:58:10', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('68', '3', '17', '1', 'sdfsdf', 'sdfsdfs', '2016-11-18 15:55:36', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('69', '3', '17', '1', 'asd', 'asdas', '2016-11-18 16:32:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('70', '3', '17', '1', 'asd', 'sad', '2016-11-18 16:35:10', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('71', '3', '17', '1', 'sdfs', 'sdfgdf', '2016-11-18 17:33:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('72', '3', '17', '1', 'Xyz', 'Jonathan  did not bring class  work', '2016-11-18 18:16:40', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('73', '3', '17', '1', 'P t m on 7thnov ', 'Abc', '2016-11-18 18:18:13', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('74', '3', '18', '1', 'P t m on 7thnov ', 'Abc', '2016-11-18 18:18:14', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('75', '3', '1', '1', 'P t m on 7thnov ', 'Abc', '2016-11-18 18:18:14', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('76', '3', '2', '1', 'P t m on 7thnov ', 'Abc', '2016-11-18 18:18:14', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('77', '3', '3', '1', 'P t m on 7thnov ', 'Abc', '2016-11-18 18:18:14', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('78', '3', '4', '1', 'P t m on 7thnov ', 'Abc', '2016-11-18 18:18:14', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('79', '3', '5', '1', 'P t m on 7thnov ', 'Abc', '2016-11-18 18:18:14', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('80', '3', '6', '1', 'P t m on 7thnov ', 'Abc', '2016-11-18 18:18:14', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('81', '3', '7', '1', 'P t m on 7thnov ', 'Abc', '2016-11-18 18:18:14', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('82', '3', '8', '1', 'P t m on 7thnov ', 'Abc', '2016-11-18 18:18:14', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('83', '3', '9', '1', 'P t m on 7thnov ', 'Abc', '2016-11-18 18:18:14', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('84', '3', '10', '1', 'P t m on 7thnov ', 'Abc', '2016-11-18 18:18:14', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('85', '3', '11', '1', 'P t m on 7thnov ', 'Abc', '2016-11-18 18:18:14', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('86', '3', '12', '1', 'P t m on 7thnov ', 'Abc', '2016-11-18 18:18:14', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('87', '3', '16', '1', 'P t m on 7thnov ', 'Abc', '2016-11-18 18:18:14', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('88', '3', '13', '1', 'P t m on 7thnov ', 'Abc', '2016-11-18 18:18:14', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('89', '3', '14', '1', 'P t m on 7thnov ', 'Abc', '2016-11-18 18:18:14', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('90', '3', '15', '1', 'P t m on 7thnov ', 'Abc', '2016-11-18 18:18:14', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('91', '3', '13', '1', 'sdjkvcbsdkjcs', 'sdkjbwdicudwcds', '2016-11-21 10:00:14', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('92', '3', '13', '1', 'sadbsa', 'sdvkjbskvds', '2016-11-21 10:00:21', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('93', '3', '17', '1', 'Hi', 'Hello123', '2016-11-22 15:14:40', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('94', '3', '17', '1', 'Vyyh', 'Qefgvxgh\n', '2016-11-22 15:22:02', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('95', '3', '17', '1', 'Abc', 'Test on 25th', '2016-11-25 11:09:24', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('96', '3', '17', '1', 'Holidays', 'From holiday', '2016-11-25 12:52:52', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('97', '3', '18', '1', 'Holidays', 'From holiday', '2016-11-25 12:52:52', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('98', '3', '1', '1', 'Holidays', 'From holiday', '2016-11-25 12:52:53', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('99', '3', '2', '1', 'Holidays', 'From holiday', '2016-11-25 12:52:53', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('100', '3', '3', '1', 'Holidays', 'From holiday', '2016-11-25 12:52:53', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('101', '3', '4', '1', 'Holidays', 'From holiday', '2016-11-25 12:52:53', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('102', '3', '5', '1', 'Holidays', 'From holiday', '2016-11-25 12:52:53', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('103', '3', '6', '1', 'Holidays', 'From holiday', '2016-11-25 12:52:53', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('104', '3', '7', '1', 'Holidays', 'From holiday', '2016-11-25 12:52:53', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('105', '3', '8', '1', 'Holidays', 'From holiday', '2016-11-25 12:52:53', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('106', '3', '9', '1', 'Holidays', 'From holiday', '2016-11-25 12:52:53', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('107', '3', '10', '1', 'Holidays', 'From holiday', '2016-11-25 12:52:53', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('108', '3', '11', '1', 'Holidays', 'From holiday', '2016-11-25 12:52:53', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('109', '3', '12', '1', 'Holidays', 'From holiday', '2016-11-25 12:52:53', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('110', '3', '16', '1', 'Holidays', 'From holiday', '2016-11-25 12:52:53', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('111', '3', '13', '1', 'Holidays', 'From holiday', '2016-11-25 12:52:53', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('112', '3', '14', '1', 'Holidays', 'From holiday', '2016-11-25 12:52:53', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('113', '3', '15', '1', 'Holidays', 'From holiday', '2016-11-25 12:52:53', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('114', '3', '17', '1', 's', 'm', '2016-11-28 12:40:15', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('115', '3', '17', '1', 'Zdx', 'Zxczx', '2016-11-28 17:53:23', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('116', '3', '17', '1', 'Msg2', 'Chck', '2016-11-28 17:54:15', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('117', '3', '17', '1', 'Ff', 'Cc', '2016-11-28 18:31:51', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('118', '3', '17', '1', 'Msg3', 'Check3', '2016-11-28 21:41:24', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('119', '3', '17', '1', 'Msg3', 'Check3', '2016-11-28 21:57:32', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('120', '3', '17', '1', 'Dfv', 'Xvv', '2016-12-05 09:58:52', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('121', '3', '18', '1', 'Abc', 'Ahvc', '2016-12-05 10:15:17', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('122', '3', '18', '1', 'Abc', 'Ahvc', '2016-12-05 10:19:42', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('123', '3', '18', '1', 'Abc', 'Ahv', '2016-12-05 10:20:08', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('124', '3', '17', '1', 'His', 'Dg', '2016-12-05 10:20:54', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('125', '3', '17', '1', 'test 4', 'msg4', '2016-12-05 12:01:17', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('126', '3', '17', '1', 'Abc', 'Abc', '2016-12-05 12:41:59', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('127', '3', '17', '1', 'Abc', 'Abc', '2016-12-06 12:43:27', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('128', '3', '17', '1', 'Xyz', 'Xyz', '2016-12-06 12:44:16', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('129', '3', '18', '1', 'ಜಯಾ ಬದುಕಲ್ಲಿ ಅವಳಿ', 'ಜಯಾ ಬದುಕಲ್ಲಿ ಅವಳಿ', '2016-12-06 18:25:27', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('130', '3', '17', '1', 'ಈ್್್ೂೂ', 'ೠಈಎ', '2016-12-07 17:58:40', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('131', '3', '17', '1', 'ಈ್್್ೂೂ', 'ೠಈಎ್ಅೠೂಔಉಉಈಎಏಔೂೂೂಎಎಎಈಈೂೄೄೇೀಿ್ಎೃೌೈೈಓೠಿೇಏೠೠಈೇೌಃುೀಾೂೂೠೠಋಋಆಆ', '2016-12-07 17:59:39', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('132', '3', '17', '1', 'ಈ್್್ೂೂ', 'ೠಈಎ್ಅೠೂಔಉಉಈಎಏಔೂೂೂಎಎಎಈಈೂೄೄೇೀಿ್ಎೃೌೈೈಓೠ', '2016-12-07 18:02:56', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('133', '3', '17', '1', 'ಈ್್್ೂೂढदयमणतततय', 'तणभभभढणययथथठणयय', '2016-12-07 18:10:10', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('134', '3', '17', '1', 'ಈ್್್ೂೂढदयमणतततय45fയ്', 'तणभभभढणययथथഡെർഫ്ഫ്ठणयय', '2016-12-07 18:11:30', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('135', '3', '17', '1', 'Fbv', 'Rgv', '2016-12-13 15:23:42', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('136', '3', '17', '1', 'Xtt', 'Gxg\n', '2016-12-17 12:22:20', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('137', '3', '17', '1', 'Cvb', 'Hbv', '2016-12-17 12:45:48', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('138', '3', '17', '1', 'Shs', 'Bzbz\n', '2016-12-17 13:06:03', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('139', '3', '18', '1', 'Shs', 'Bzbz\n', '2016-12-17 13:06:03', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('140', '3', '1', '1', 'Shs', 'Bzbz\n', '2016-12-17 13:06:03', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('141', '3', '2', '1', 'Shs', 'Bzbz\n', '2016-12-17 13:06:03', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('142', '3', '3', '1', 'Shs', 'Bzbz\n', '2016-12-17 13:06:03', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('143', '3', '4', '1', 'Shs', 'Bzbz\n', '2016-12-17 13:06:03', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('144', '3', '5', '1', 'Shs', 'Bzbz\n', '2016-12-17 13:06:03', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('145', '3', '6', '1', 'Shs', 'Bzbz\n', '2016-12-17 13:06:03', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('146', '3', '7', '1', 'Shs', 'Bzbz\n', '2016-12-17 13:06:03', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('147', '3', '8', '1', 'Shs', 'Bzbz\n', '2016-12-17 13:06:03', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('148', '3', '9', '1', 'Shs', 'Bzbz\n', '2016-12-17 13:06:03', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('149', '3', '10', '1', 'Shs', 'Bzbz\n', '2016-12-17 13:06:03', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('150', '3', '11', '1', 'Shs', 'Bzbz\n', '2016-12-17 13:06:03', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('151', '3', '12', '1', 'Shs', 'Bzbz\n', '2016-12-17 13:06:03', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('152', '3', '16', '1', 'Shs', 'Bzbz\n', '2016-12-17 13:06:03', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('153', '3', '13', '1', 'Shs', 'Bzbz\n', '2016-12-17 13:06:03', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('154', '3', '14', '1', 'Shs', 'Bzbz\n', '2016-12-17 13:06:03', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('155', '3', '15', '1', 'Shs', 'Bzbz\n', '2016-12-17 13:06:03', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('156', '3', '17', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:07:57', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('157', '3', '18', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:07:57', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('158', '3', '1', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:07:58', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('159', '3', '2', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:07:58', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('160', '3', '3', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:07:58', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('161', '3', '4', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:07:58', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('162', '3', '5', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:07:58', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('163', '3', '6', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:07:58', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('164', '3', '7', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:07:58', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('165', '3', '8', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:07:58', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('166', '3', '9', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:07:58', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('167', '3', '10', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:07:58', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('168', '3', '11', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:07:58', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('169', '3', '12', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:07:58', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('170', '3', '16', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:07:58', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('171', '3', '13', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:07:58', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('172', '3', '14', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:07:58', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('173', '3', '15', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:07:58', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('174', '3', '17', '1', 'Test', 'Test December 17', '2016-12-17 13:32:46', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('175', '3', '17', '1', 'Test', 'This is test for Dec 17', '2016-12-17 13:36:23', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('176', '3', '18', '1', 'Test', 'This is test for Dec 17', '2016-12-17 13:36:23', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('177', '3', '1', '1', 'Test', 'This is test for Dec 17', '2016-12-17 13:36:23', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('178', '3', '2', '1', 'Test', 'This is test for Dec 17', '2016-12-17 13:36:23', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('179', '3', '3', '1', 'Test', 'This is test for Dec 17', '2016-12-17 13:36:23', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('180', '3', '4', '1', 'Test', 'This is test for Dec 17', '2016-12-17 13:36:23', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('181', '3', '5', '1', 'Test', 'This is test for Dec 17', '2016-12-17 13:36:23', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('182', '3', '6', '1', 'Test', 'This is test for Dec 17', '2016-12-17 13:36:23', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('183', '3', '7', '1', 'Test', 'This is test for Dec 17', '2016-12-17 13:36:23', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('184', '3', '8', '1', 'Test', 'This is test for Dec 17', '2016-12-17 13:36:23', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('185', '3', '9', '1', 'Test', 'This is test for Dec 17', '2016-12-17 13:36:23', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('186', '3', '10', '1', 'Test', 'This is test for Dec 17', '2016-12-17 13:36:23', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('187', '3', '11', '1', 'Test', 'This is test for Dec 17', '2016-12-17 13:36:23', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('188', '3', '12', '1', 'Test', 'This is test for Dec 17', '2016-12-17 13:36:23', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('189', '3', '16', '1', 'Test', 'This is test for Dec 17', '2016-12-17 13:36:23', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('190', '3', '13', '1', 'Test', 'This is test for Dec 17', '2016-12-17 13:36:23', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('191', '3', '14', '1', 'Test', 'This is test for Dec 17', '2016-12-17 13:36:23', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('192', '3', '15', '1', 'Test', 'This is test for Dec 17', '2016-12-17 13:36:23', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('193', '3', '17', '1', 'This is test for Dec', 'This is test for Dec 17', '2016-12-17 13:45:09', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('194', '3', '18', '1', 'This is test for Dec', 'This is test for Dec 17', '2016-12-17 13:45:09', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('195', '3', '1', '1', 'This is test for Dec', 'This is test for Dec 17', '2016-12-17 13:45:09', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('196', '3', '2', '1', 'This is test for Dec', 'This is test for Dec 17', '2016-12-17 13:45:09', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('197', '3', '3', '1', 'This is test for Dec', 'This is test for Dec 17', '2016-12-17 13:45:09', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('198', '3', '4', '1', 'This is test for Dec', 'This is test for Dec 17', '2016-12-17 13:45:09', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('199', '3', '5', '1', 'This is test for Dec', 'This is test for Dec 17', '2016-12-17 13:45:09', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('200', '3', '6', '1', 'This is test for Dec', 'This is test for Dec 17', '2016-12-17 13:45:09', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('201', '3', '7', '1', 'This is test for Dec', 'This is test for Dec 17', '2016-12-17 13:45:09', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('202', '3', '8', '1', 'This is test for Dec', 'This is test for Dec 17', '2016-12-17 13:45:09', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('203', '3', '9', '1', 'This is test for Dec', 'This is test for Dec 17', '2016-12-17 13:45:09', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('204', '3', '10', '1', 'This is test for Dec', 'This is test for Dec 17', '2016-12-17 13:45:09', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('205', '3', '11', '1', 'This is test for Dec', 'This is test for Dec 17', '2016-12-17 13:45:09', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('206', '3', '12', '1', 'This is test for Dec', 'This is test for Dec 17', '2016-12-17 13:45:09', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('207', '3', '16', '1', 'This is test for Dec', 'This is test for Dec 17', '2016-12-17 13:45:09', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('208', '3', '13', '1', 'This is test for Dec', 'This is test for Dec 17', '2016-12-17 13:45:09', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('209', '3', '14', '1', 'This is test for Dec', 'This is test for Dec 17', '2016-12-17 13:45:09', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('210', '3', '15', '1', 'This is test for Dec', 'This is test for Dec 17', '2016-12-17 13:45:09', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('211', '3', '17', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:49:12', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('212', '3', '18', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:49:12', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('213', '3', '1', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:49:13', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('214', '3', '2', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:49:13', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('215', '3', '3', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:49:13', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('216', '3', '4', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:49:13', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('217', '3', '5', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:49:13', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('218', '3', '6', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:49:13', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('219', '3', '7', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:49:13', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('220', '3', '8', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:49:13', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('221', '3', '9', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:49:13', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('222', '3', '10', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:49:13', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('223', '3', '11', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:49:13', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('224', '3', '12', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:49:13', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('225', '3', '16', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:49:13', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('226', '3', '13', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:49:13', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('227', '3', '14', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:49:13', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('228', '3', '15', '1', 'Hhhsh', 'Hshhs', '2016-12-17 13:49:13', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('229', '3', '17', '1', 'Djdj', 'Znsk', '2016-12-17 13:49:52', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('230', '3', '18', '1', 'Djdj', 'Znsk', '2016-12-17 13:49:52', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('231', '3', '1', '1', 'Djdj', 'Znsk', '2016-12-17 13:49:52', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('232', '3', '2', '1', 'Djdj', 'Znsk', '2016-12-17 13:49:52', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('233', '3', '3', '1', 'Djdj', 'Znsk', '2016-12-17 13:49:52', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('234', '3', '4', '1', 'Djdj', 'Znsk', '2016-12-17 13:49:52', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('235', '3', '5', '1', 'Djdj', 'Znsk', '2016-12-17 13:49:52', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('236', '3', '6', '1', 'Djdj', 'Znsk', '2016-12-17 13:49:52', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('237', '3', '7', '1', 'Djdj', 'Znsk', '2016-12-17 13:49:52', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('238', '3', '8', '1', 'Djdj', 'Znsk', '2016-12-17 13:49:52', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('239', '3', '9', '1', 'Djdj', 'Znsk', '2016-12-17 13:49:52', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('240', '3', '10', '1', 'Djdj', 'Znsk', '2016-12-17 13:49:52', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('241', '3', '11', '1', 'Djdj', 'Znsk', '2016-12-17 13:49:52', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('242', '3', '12', '1', 'Djdj', 'Znsk', '2016-12-17 13:49:52', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('243', '3', '16', '1', 'Djdj', 'Znsk', '2016-12-17 13:49:52', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('244', '3', '13', '1', 'Djdj', 'Znsk', '2016-12-17 13:49:52', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('245', '3', '14', '1', 'Djdj', 'Znsk', '2016-12-17 13:49:52', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('246', '3', '15', '1', 'Djdj', 'Znsk', '2016-12-17 13:49:52', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('247', '3', '17', '1', 'Fjufg', 'Zghf', '2016-12-20 11:36:51', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('248', '3', '17', '1', 'Tdfuu', 'Cygu', '2016-12-20 11:37:20', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('249', '3', '18', '1', 'Tdfuu', 'Cygu', '2016-12-20 11:37:20', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('250', '3', '1', '1', 'Tdfuu', 'Cygu', '2016-12-20 11:37:20', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('251', '3', '2', '1', 'Tdfuu', 'Cygu', '2016-12-20 11:37:20', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('252', '3', '3', '1', 'Tdfuu', 'Cygu', '2016-12-20 11:37:20', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('253', '3', '4', '1', 'Tdfuu', 'Cygu', '2016-12-20 11:37:20', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('254', '3', '5', '1', 'Tdfuu', 'Cygu', '2016-12-20 11:37:20', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('255', '3', '6', '1', 'Tdfuu', 'Cygu', '2016-12-20 11:37:20', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('256', '3', '7', '1', 'Tdfuu', 'Cygu', '2016-12-20 11:37:20', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('257', '3', '8', '1', 'Tdfuu', 'Cygu', '2016-12-20 11:37:20', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('258', '3', '9', '1', 'Tdfuu', 'Cygu', '2016-12-20 11:37:20', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('259', '3', '10', '1', 'Tdfuu', 'Cygu', '2016-12-20 11:37:20', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('260', '3', '11', '1', 'Tdfuu', 'Cygu', '2016-12-20 11:37:20', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('261', '3', '12', '1', 'Tdfuu', 'Cygu', '2016-12-20 11:37:20', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('262', '3', '16', '1', 'Tdfuu', 'Cygu', '2016-12-20 11:37:20', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('263', '3', '13', '1', 'Tdfuu', 'Cygu', '2016-12-20 11:37:20', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('264', '3', '14', '1', 'Tdfuu', 'Cygu', '2016-12-20 11:37:20', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('265', '3', '15', '1', 'Tdfuu', 'Cygu', '2016-12-20 11:37:20', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('266', '3', '17', '1', '5yuu', 'Herkk', '2016-12-24 22:06:47', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('267', '3', '17', '1', 'Jon is sick ', 'Pleasr meet me asap', '2016-12-29 11:54:35', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('268', '3', '17', '1', 'Tomo pta', 'Abc\n', '2016-12-29 11:56:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('269', '3', '18', '1', 'Tomo pta', 'Abc\n', '2016-12-29 11:56:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('270', '3', '1', '1', 'Tomo pta', 'Abc\n', '2016-12-29 11:56:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('271', '3', '2', '1', 'Tomo pta', 'Abc\n', '2016-12-29 11:56:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('272', '3', '3', '1', 'Tomo pta', 'Abc\n', '2016-12-29 11:56:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('273', '3', '4', '1', 'Tomo pta', 'Abc\n', '2016-12-29 11:56:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('274', '3', '5', '1', 'Tomo pta', 'Abc\n', '2016-12-29 11:56:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('275', '3', '6', '1', 'Tomo pta', 'Abc\n', '2016-12-29 11:56:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('276', '3', '7', '1', 'Tomo pta', 'Abc\n', '2016-12-29 11:56:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('277', '3', '8', '1', 'Tomo pta', 'Abc\n', '2016-12-29 11:56:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('278', '3', '9', '1', 'Tomo pta', 'Abc\n', '2016-12-29 11:56:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('279', '3', '10', '1', 'Tomo pta', 'Abc\n', '2016-12-29 11:56:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('280', '3', '11', '1', 'Tomo pta', 'Abc\n', '2016-12-29 11:56:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('281', '3', '12', '1', 'Tomo pta', 'Abc\n', '2016-12-29 11:56:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('282', '3', '16', '1', 'Tomo pta', 'Abc\n', '2016-12-29 11:56:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('283', '3', '13', '1', 'Tomo pta', 'Abc\n', '2016-12-29 11:56:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('284', '3', '14', '1', 'Tomo pta', 'Abc\n', '2016-12-29 11:56:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('285', '3', '15', '1', 'Tomo pta', 'Abc\n', '2016-12-29 11:56:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('286', '3', '17', '1', 'No homework ', 'No homework \n', '2016-12-29 12:21:08', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('287', '3', '17', '1', 'No school', 'Holiday due to bad weather ', '2016-12-29 12:22:21', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('288', '3', '18', '1', 'No school', 'Holiday due to bad weather ', '2016-12-29 12:22:21', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('289', '3', '1', '1', 'No school', 'Holiday due to bad weather ', '2016-12-29 12:22:21', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('290', '3', '2', '1', 'No school', 'Holiday due to bad weather ', '2016-12-29 12:22:21', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('291', '3', '3', '1', 'No school', 'Holiday due to bad weather ', '2016-12-29 12:22:21', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('292', '3', '4', '1', 'No school', 'Holiday due to bad weather ', '2016-12-29 12:22:21', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('293', '3', '5', '1', 'No school', 'Holiday due to bad weather ', '2016-12-29 12:22:21', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('294', '3', '6', '1', 'No school', 'Holiday due to bad weather ', '2016-12-29 12:22:21', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('295', '3', '7', '1', 'No school', 'Holiday due to bad weather ', '2016-12-29 12:22:21', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('296', '3', '8', '1', 'No school', 'Holiday due to bad weather ', '2016-12-29 12:22:21', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('297', '3', '9', '1', 'No school', 'Holiday due to bad weather ', '2016-12-29 12:22:21', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('298', '3', '10', '1', 'No school', 'Holiday due to bad weather ', '2016-12-29 12:22:21', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('299', '3', '11', '1', 'No school', 'Holiday due to bad weather ', '2016-12-29 12:22:21', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('300', '3', '12', '1', 'No school', 'Holiday due to bad weather ', '2016-12-29 12:22:21', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('301', '3', '16', '1', 'No school', 'Holiday due to bad weather ', '2016-12-29 12:22:21', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('302', '3', '13', '1', 'No school', 'Holiday due to bad weather ', '2016-12-29 12:22:21', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('303', '3', '14', '1', 'No school', 'Holiday due to bad weather ', '2016-12-29 12:22:21', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('304', '3', '15', '1', 'No school', 'Holiday due to bad weather ', '2016-12-29 12:22:21', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('305', '3', '17', '1', 'Hi', 'Hi', '2016-12-29 13:27:45', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('306', '3', '17', '1', 'Hi', 'Hi', '2016-12-29 13:27:59', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('307', '3', '17', '1', 'Hi', 'Hi', '2016-12-29 13:28:52', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('308', '3', '17', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:18:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('309', '3', '18', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:18:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('310', '3', '1', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:18:30', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('311', '3', '2', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:18:30', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('312', '3', '3', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:18:30', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('313', '3', '4', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:18:30', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('314', '3', '5', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:18:30', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('315', '3', '6', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:18:30', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('316', '3', '7', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:18:30', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('317', '3', '8', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:18:30', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('318', '3', '9', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:18:30', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('319', '3', '10', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:18:30', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('320', '3', '11', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:18:30', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('321', '3', '12', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:18:30', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('322', '3', '16', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:18:30', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('323', '3', '13', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:18:30', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('324', '3', '14', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:18:30', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('325', '3', '15', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:18:30', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('326', '3', '17', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:19:27', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('327', '3', '18', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:19:27', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('328', '3', '1', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:19:27', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('329', '3', '2', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:19:27', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('330', '3', '3', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:19:27', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('331', '3', '4', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:19:27', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('332', '3', '5', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:19:27', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('333', '3', '6', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:19:27', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('334', '3', '7', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:19:27', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('335', '3', '8', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:19:27', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('336', '3', '9', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:19:27', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('337', '3', '10', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:19:27', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('338', '3', '11', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:19:27', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('339', '3', '12', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:19:27', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('340', '3', '16', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:19:27', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('341', '3', '13', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:19:27', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('342', '3', '14', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:19:27', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('343', '3', '15', '1', 'Maths homework ', 'Please support ', '2016-12-29 16:19:27', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('344', '3', '17', '1', 'Parent team meeting ', 'Rgu', '2016-12-29 16:53:10', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('345', '3', '18', '1', 'Parent team meeting ', 'Rgu', '2016-12-29 16:53:10', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('346', '3', '1', '1', 'Parent team meeting ', 'Rgu', '2016-12-29 16:53:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('347', '3', '2', '1', 'Parent team meeting ', 'Rgu', '2016-12-29 16:53:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('348', '3', '3', '1', 'Parent team meeting ', 'Rgu', '2016-12-29 16:53:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('349', '3', '4', '1', 'Parent team meeting ', 'Rgu', '2016-12-29 16:53:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('350', '3', '5', '1', 'Parent team meeting ', 'Rgu', '2016-12-29 16:53:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('351', '3', '6', '1', 'Parent team meeting ', 'Rgu', '2016-12-29 16:53:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('352', '3', '7', '1', 'Parent team meeting ', 'Rgu', '2016-12-29 16:53:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('353', '3', '8', '1', 'Parent team meeting ', 'Rgu', '2016-12-29 16:53:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('354', '3', '9', '1', 'Parent team meeting ', 'Rgu', '2016-12-29 16:53:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('355', '3', '10', '1', 'Parent team meeting ', 'Rgu', '2016-12-29 16:53:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('356', '3', '11', '1', 'Parent team meeting ', 'Rgu', '2016-12-29 16:53:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('357', '3', '12', '1', 'Parent team meeting ', 'Rgu', '2016-12-29 16:53:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('358', '3', '16', '1', 'Parent team meeting ', 'Rgu', '2016-12-29 16:53:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('359', '3', '13', '1', 'Parent team meeting ', 'Rgu', '2016-12-29 16:53:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('360', '3', '14', '1', 'Parent team meeting ', 'Rgu', '2016-12-29 16:53:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('361', '3', '15', '1', 'Parent team meeting ', 'Rgu', '2016-12-29 16:53:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('362', '3', '17', '1', 'Helo ', 'Hi. ', '2016-12-29 17:12:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('363', '3', '17', '1', 'Dths', 'Hello', '2016-12-30 13:54:00', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('364', '3', '18', '1', 'Dths', 'Hello', '2016-12-30 13:54:00', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('365', '3', '1', '1', 'Dths', 'Hello', '2016-12-30 13:54:00', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('366', '3', '2', '1', 'Dths', 'Hello', '2016-12-30 13:54:00', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('367', '3', '3', '1', 'Dths', 'Hello', '2016-12-30 13:54:00', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('368', '3', '4', '1', 'Dths', 'Hello', '2016-12-30 13:54:00', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('369', '3', '5', '1', 'Dths', 'Hello', '2016-12-30 13:54:00', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('370', '3', '6', '1', 'Dths', 'Hello', '2016-12-30 13:54:00', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('371', '3', '7', '1', 'Dths', 'Hello', '2016-12-30 13:54:00', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('372', '3', '8', '1', 'Dths', 'Hello', '2016-12-30 13:54:00', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('373', '3', '9', '1', 'Dths', 'Hello', '2016-12-30 13:54:00', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('374', '3', '10', '1', 'Dths', 'Hello', '2016-12-30 13:54:00', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('375', '3', '11', '1', 'Dths', 'Hello', '2016-12-30 13:54:00', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('376', '3', '12', '1', 'Dths', 'Hello', '2016-12-30 13:54:00', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('377', '3', '16', '1', 'Dths', 'Hello', '2016-12-30 13:54:00', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('378', '3', '13', '1', 'Dths', 'Hello', '2016-12-30 13:54:00', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('379', '3', '14', '1', 'Dths', 'Hello', '2016-12-30 13:54:00', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('380', '3', '15', '1', 'Dths', 'Hello', '2016-12-30 13:54:00', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('381', '3', '17', '1', 'Good', 'Afternoon \n', '2016-12-30 14:06:41', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('382', '3', '17', '1', 'Hello', 'Help\n\n', '2016-12-30 16:47:42', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('383', '3', '17', '1', 'Hello', 'Help\n\n', '2016-12-30 16:48:11', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('384', '3', '17', '1', 'Hello', 'Help\n\n', '2016-12-30 16:48:49', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('385', '3', '17', '1', 'Hj', 'S', '2016-12-30 17:02:07', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('386', '3', '17', '1', 'Hey ', 'Hi ', '2016-12-31 12:55:34', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('387', '3', '17', '1', 'Test', 'Test 123\n', '2017-01-02 11:26:32', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('388', '3', '17', '1', 'Test hw', 'HW 123', '2017-01-02 11:27:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('389', '3', '18', '1', 'Test hw', 'HW 123', '2017-01-02 11:27:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('390', '3', '1', '1', 'Test hw', 'HW 123', '2017-01-02 11:27:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('391', '3', '2', '1', 'Test hw', 'HW 123', '2017-01-02 11:27:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('392', '3', '3', '1', 'Test hw', 'HW 123', '2017-01-02 11:27:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('393', '3', '4', '1', 'Test hw', 'HW 123', '2017-01-02 11:27:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('394', '3', '5', '1', 'Test hw', 'HW 123', '2017-01-02 11:27:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('395', '3', '6', '1', 'Test hw', 'HW 123', '2017-01-02 11:27:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('396', '3', '7', '1', 'Test hw', 'HW 123', '2017-01-02 11:27:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('397', '3', '8', '1', 'Test hw', 'HW 123', '2017-01-02 11:27:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('398', '3', '9', '1', 'Test hw', 'HW 123', '2017-01-02 11:27:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('399', '3', '10', '1', 'Test hw', 'HW 123', '2017-01-02 11:27:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('400', '3', '11', '1', 'Test hw', 'HW 123', '2017-01-02 11:27:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('401', '3', '12', '1', 'Test hw', 'HW 123', '2017-01-02 11:27:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('402', '3', '16', '1', 'Test hw', 'HW 123', '2017-01-02 11:27:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('403', '3', '13', '1', 'Test hw', 'HW 123', '2017-01-02 11:27:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('404', '3', '14', '1', 'Test hw', 'HW 123', '2017-01-02 11:27:29', '1');
INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('405', '3', '15', '1', 'Test hw', 'HW 123', '2017-01-02 11:27:29', '1');


#
# TABLE STRUCTURE FOR: notification_types
#

DROP TABLE IF EXISTS `notification_types`;

CREATE TABLE `notification_types` (
  `typeId` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `notification_types` (`typeId`, `typeName`, `status`) VALUES ('1', 'Automatic', '1');
INSERT INTO `notification_types` (`typeId`, `typeName`, `status`) VALUES ('2', 'Manual', '1');


#
# TABLE STRUCTURE FOR: notifications
#

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `notificationId` int(11) NOT NULL AUTO_INCREMENT,
  `typeId` int(11) NOT NULL,
  `heading` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `content` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sentDate` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`notificationId`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('1', '1', 'Test', 'Test', '2016-10-15 05:15:24', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('2', '1', 'Sports day', 'Sports day scheduled on nov 5th 2016', '2016-11-03 07:26:55', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('3', '1', 'Annual Day', 'annual day on 15th nov', '2016-11-04 12:05:21', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('4', '1', 'annual exam', 'abc', '2016-11-23 03:18:41', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('5', '1', 'holiday on 27th', 'due to strike', '2016-11-25 11:12:22', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('6', '1', 'rthuj', 'vbjgj', '2016-11-25 12:49:50', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('7', '1', 'leave', 'gtrkjhgfd', '2016-12-02 01:25:38', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('8', '1', 'holiday', '123', '2016-12-05 10:15:09', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('9', '1', 'yghh', 'ffgh', '2016-12-05 10:15:59', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('10', '1', 'hgh', 'fcghb,', '2016-12-05 10:18:38', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('11', '1', 'annual day fee', 'annual day fee 1000 ', '2016-12-05 01:11:41', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('12', '1', 'holiday', 'due to strike', '2016-12-05 03:16:24', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('13', '1', 'annual day fee', '134', '2016-12-05 03:51:57', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('14', '1', '6th dec holiday', 'due to strike', '2016-12-05 04:21:28', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('15', '1', 'holiday due strike', 'tomorrow holiday', '2016-12-13 03:18:18', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('16', '1', 'abc', 'abc 14th', '2016-12-14 11:45:27', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('17', '1', 'Sample', 'Sample message', '2016-12-14 12:35:56', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('18', '1', 'Sample1', 'Sample1 Test', '2016-12-14 12:53:06', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('19', '1', 'test1', 'test on 21', '2016-12-17 12:19:47', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('20', '1', 'sample notification', '123', '2016-12-20 11:31:39', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('21', '1', 'gh', 'gffh', '2016-12-21 11:25:40', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('22', '1', 'asdfkl', 'zxnmasdhjk', '2016-12-21 11:26:02', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('23', '1', 'iluhi', 'ggj', '2016-12-21 11:35:55', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('24', '1', 'birtday', 'th', '2016-12-21 11:41:14', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('25', '1', 'hjhjj', 'tytyty', '2016-12-21 11:44:12', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('26', '1', 'scool nnual day', 'ytyy', '2016-12-21 11:50:28', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('27', '1', '29th holiday', 'abc', '2016-12-28 04:25:17', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('28', '1', 'gfhngj', 'bnnghjn', '2016-12-28 04:26:24', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('29', '1', 'gyuhu', 'dfg', '2016-12-29 10:18:12', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('30', '1', 'annual day on 18th j', 'annual day on 18th jan', '2016-12-29 12:03:47', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('31', '1', 'ddcsjh', 'jdcvjkkn', '2016-12-29 12:38:53', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('32', '1', 'PTA Tomorrow', 'pta', '2016-12-29 04:25:14', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('33', '1', 'PTA Tomorrow', 'fdsd', '2016-12-29 04:57:52', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('34', '1', 'gfgh', 'hgvhj', '2016-12-30 10:25:10', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('35', '1', 'new notification', 'hello', '2016-12-30 10:32:41', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('36', '1', 'hi', 'hi', '2016-12-30 10:41:49', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('37', '1', 'hi', 'hi notification', '2016-12-30 10:55:26', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('38', '1', 'test', 'check', '2016-12-30 11:01:13', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('39', '1', 'test1', 'check', '2016-12-30 02:13:02', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('40', '1', 'test1', 'check', '2016-12-30 02:14:09', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('41', '1', 'test2', 'check', '2016-12-30 02:15:51', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('42', '1', 'test3', 'check', '2016-12-30 02:16:53', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('43', '1', 'ncjkdsx', 'jdjkdsdc', '2016-12-30 02:17:14', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('44', '1', 'sdhbch', 'hdcbh', '2016-12-30 02:32:38', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('45', '1', 'test4', 'check', '2016-12-30 02:37:43', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('46', '1', 'test5', 'check', '2016-12-30 03:23:29', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('47', '1', 'test6', 'check', '2016-12-30 03:50:30', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('48', '1', 'test7', 'check', '2016-12-30 03:56:00', '1');
INSERT INTO `notifications` (`notificationId`, `typeId`, `heading`, `content`, `sentDate`, `status`) VALUES ('49', '1', 'test notification', 'abc', '2017-01-02 11:44:20', '1');


#
# TABLE STRUCTURE FOR: school_academics
#

DROP TABLE IF EXISTS `school_academics`;

CREATE TABLE `school_academics` (
  `academicId` int(11) NOT NULL AUTO_INCREMENT,
  `academicYear` varchar(20) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `workingDays` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`academicId`),
  CONSTRAINT `school_academics_ibfk_1` FOREIGN KEY (`academicId`) REFERENCES `rk_demo`.`schools` (`schoolId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `school_academics` (`academicId`, `academicYear`, `startDate`, `endDate`, `workingDays`, `status`) VALUES ('1', '2016-2017', '2016-06-01', '2017-03-31', '200', '0');


#
# TABLE STRUCTURE FOR: school_classes
#

DROP TABLE IF EXISTS `school_classes`;

CREATE TABLE `school_classes` (
  `classId` int(11) NOT NULL AUTO_INCREMENT,
  `standardId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

INSERT INTO `school_classes` (`classId`, `standardId`, `sectionId`, `status`) VALUES ('1', '1', '1', '1');
INSERT INTO `school_classes` (`classId`, `standardId`, `sectionId`, `status`) VALUES ('2', '2', '1', '1');
INSERT INTO `school_classes` (`classId`, `standardId`, `sectionId`, `status`) VALUES ('3', '3', '1', '1');
INSERT INTO `school_classes` (`classId`, `standardId`, `sectionId`, `status`) VALUES ('4', '4', '2', '1');
INSERT INTO `school_classes` (`classId`, `standardId`, `sectionId`, `status`) VALUES ('5', '5', '3', '1');
INSERT INTO `school_classes` (`classId`, `standardId`, `sectionId`, `status`) VALUES ('8', '6', '1', '1');
INSERT INTO `school_classes` (`classId`, `standardId`, `sectionId`, `status`) VALUES ('9', '7', '1', '1');


#
# TABLE STRUCTURE FOR: school_details
#

DROP TABLE IF EXISTS `school_details`;

CREATE TABLE `school_details` (
  `detailsId` int(11) NOT NULL AUTO_INCREMENT,
  `schoolId` int(11) NOT NULL,
  `contactPerson` varchar(200) NOT NULL,
  `contactPhone` varchar(20) NOT NULL,
  `noOfStudents` int(11) NOT NULL,
  `noOfVehicles` int(11) NOT NULL,
  `noOfEnrolled` int(11) NOT NULL,
  `accademicStart` date NOT NULL,
  `accademicEnd` date NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`detailsId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# TABLE STRUCTURE FOR: school_students
#

DROP TABLE IF EXISTS `school_students`;

CREATE TABLE `school_students` (
  `studentId` bigint(20) NOT NULL AUTO_INCREMENT,
  `schoolId` int(11) NOT NULL,
  `admissionNo` varchar(100) NOT NULL,
  `name` varchar(150) NOT NULL,
  `photo` text NOT NULL,
  `fatherName` varchar(100) NOT NULL,
  `fatherEmail` varchar(100) NOT NULL,
  `motherName` varchar(100) NOT NULL,
  `motherEmail` varchar(100) NOT NULL,
  `fatherPhone` varchar(20) NOT NULL,
  `motherPhone` varchar(20) NOT NULL,
  `guardianName` varchar(100) NOT NULL,
  `guardianEmail` varchar(100) NOT NULL,
  `guardianPhone` varchar(20) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`studentId`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;

INSERT INTO `school_students` (`studentId`, `schoolId`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `status`) VALUES ('1', '1', '1252', 'Sakshi N', 'profile_pic.png', 'Father', '', 'Mother', '', '9535530701', '7795004080', '', '', '', '1');
INSERT INTO `school_students` (`studentId`, `schoolId`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `status`) VALUES ('2', '1', '1602', 'Varun Raghu', 'profile_pic.png', 'Father', '', '', '', '9876543210', '', '', '', '', '1');
INSERT INTO `school_students` (`studentId`, `schoolId`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `status`) VALUES ('3', '1', '95', 'Mg Sai Myint Myat', '1007.JPG', 'A1 Father Name', 'a1father@gmail.com', '', '', '9876543210', '', '', '', '', '1');
INSERT INTO `school_students` (`studentId`, `schoolId`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `status`) VALUES ('4', '1', '9002', 'Avinash H', 'profile_pic.png', 'B1 Father Name', 'b1father@gmail.com', '', '', '9876543210', '', '', '', '', '1');
INSERT INTO `school_students` (`studentId`, `schoolId`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `status`) VALUES ('5', '1', '9003', 'Chandrasekhar', 'profile_pic.png', 'C1 Father Name', 'c1father@gmail.com', '', '', '9876543210', '', '', '', '', '1');
INSERT INTO `school_students` (`studentId`, `schoolId`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `status`) VALUES ('6', '1', '9004', 'Dayanand', 'profile_pic.png', 'D1 Father Name', 'd1father@gmail.com', '', '', '9876543210', '', '', '', '', '1');
INSERT INTO `school_students` (`studentId`, `schoolId`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `status`) VALUES ('7', '1', '9005', 'Geeta', 'profile_pic.png', 'E1 Father Name', 'e1father@gmail.com', '', '', '9876543210', '', '', '', '', '1');
INSERT INTO `school_students` (`studentId`, `schoolId`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `status`) VALUES ('8', '1', '9006', 'Asma', 'profile_pic.png', 'F1 Father Name', 'f1father@gmail.com', '', '', '9876543210', '', '', '', '', '1');
INSERT INTO `school_students` (`studentId`, `schoolId`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `status`) VALUES ('9', '1', '9007', 'Preeti', 'profile_pic.png', 'G1 Father Name', 'g1father@gmail.com', '', '', '9876543210', '', '', '', '', '1');
INSERT INTO `school_students` (`studentId`, `schoolId`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `status`) VALUES ('10', '1', '9008', 'Savitha', 'profile_pic.png', 'H1 Father Name', 'h1father@gmail.com', '', '', '9876543210', '', '', '', '', '1');
INSERT INTO `school_students` (`studentId`, `schoolId`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `status`) VALUES ('11', '1', '9009', 'Ruchi', 'profile_pic.png', 'I1 Father Name', 'i1father@gmail.com', '', '', '9876543210', '', '', '', '', '1');
INSERT INTO `school_students` (`studentId`, `schoolId`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `status`) VALUES ('12', '1', '9010', 'Rajesh', 'profile_pic.png', 'J1 Father Name', 'j1father@gmail.com', '', '', '9876543210', '', '', '', '', '1');
INSERT INTO `school_students` (`studentId`, `schoolId`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `status`) VALUES ('13', '1', '9011', 'Vijaya', 'profile_pic.png', 'K1 Father Name', 'k1father@gmail.com', '', '', '9876543210', '', '', '', '', '1');
INSERT INTO `school_students` (`studentId`, `schoolId`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `status`) VALUES ('14', '1', '9012', 'Kishore', 'profile_pic.png', 'L1 Father Name', 'l1father@gmail.com', '', '', '9876543210', '', '', '', '', '1');
INSERT INTO `school_students` (`studentId`, `schoolId`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `status`) VALUES ('15', '1', '9013', 'Ayesha Banu', 'pictures-7.jpg', 'L2 Father Name', 'l2father@gmail.com', 'ghhgjh', 'gfghjhhg@dbhbc', '9876543211', '1234567893', '', '', '', '1');
INSERT INTO `school_students` (`studentId`, `schoolId`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `status`) VALUES ('16', '1', '9014', 'Vani', 'profile_pic.png', 'Demo Father Bangalore', 'demofatherblr@gmail.com', '', '', '987654321', '', '', '', '', '1');
INSERT INTO `school_students` (`studentId`, `schoolId`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `status`) VALUES ('17', '1', '9000', 'Jonathan Rex Varghese', '1002.JPG ', 'Demo Father', 'demo@poornaapp.com', 'Mother', 'demo1@poornaapp.com', '9123456789', '1234567890', '', '', '', '1');
INSERT INTO `school_students` (`studentId`, `schoolId`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `status`) VALUES ('18', '1', '9001', 'Nathaniel Rex Varghese', '1.jpg', 'Demo Father', 'demo@poornaapp.com', '', 'demo1@poornaapp.com', '', '', '', '', '', '1');
INSERT INTO `school_students` (`studentId`, `schoolId`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `status`) VALUES ('42', '1', '1000', 'test', '1001.JPG  ', 'test', 'test@hd', 'dfgg', 'dhvhdf@hhc.com', '1234567897', '2345676543', '', '', '', '1');
INSERT INTO `school_students` (`studentId`, `schoolId`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `status`) VALUES ('43', '1', '1001', 'test', '1003.JPG', 'test', 'test@shxh.com', 'test', 'test@heh.com', '0987654345', '8327473264', '', '', '', '1');
INSERT INTO `school_students` (`studentId`, `schoolId`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `status`) VALUES ('44', '1', 'test', 'test', '7-15.jpg', 'test', 'test@gmail.com', '', '', '2345678942', '', '', '', '', '1');
INSERT INTO `school_students` (`studentId`, `schoolId`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `status`) VALUES ('45', '1', 'test1', 'test', '04-15.jpg', 'test', 'test@shxh.com', '', '', '7738274737', '', '', '', '', '1');
INSERT INTO `school_students` (`studentId`, `schoolId`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `status`) VALUES ('46', '1', 'sdg', 'rgeth', '10-15.jpg', 'test', 'test@shxh.com', '', '', '1234567897', '', '', '', '', '1');
INSERT INTO `school_students` (`studentId`, `schoolId`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `status`) VALUES ('47', '1', 'dfsdf', 'dsfsdf', '6-14.jpg', 'dfsed', 'umapathynalini@gmail.com', '', '', '3534547567', '', '', '', '', '1');
INSERT INTO `school_students` (`studentId`, `schoolId`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `status`) VALUES ('48', '1', 'dfsdfyy', 'dsfsdf', '5-15.jpg', 'dfsed', 'umapathynalini@gmail.com', '', '', '3534547567', '', '', '', '', '1');
INSERT INTO `school_students` (`studentId`, `schoolId`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `status`) VALUES ('49', '1', 'dfsdfyyw', 'dsfsdf', '7-15.jpg', 'dfsed', 'umapathynalini@gmail.com', '', '', '3534547567', '', '', '', '', '1');
INSERT INTO `school_students` (`studentId`, `schoolId`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `status`) VALUES ('50', '1', 'hhddhcde', 'edfwse', '7-15.jpg', 'dfr', 'fe@bdf.com', '', '', '1234567899', '', '', '', '', '1');
INSERT INTO `school_students` (`studentId`, `schoolId`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `status`) VALUES ('51', '1', '', '', '', '', '', '', '', '', '', '', '', '', '0');
INSERT INTO `school_students` (`studentId`, `schoolId`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `status`) VALUES ('52', '1', '1002', 'Nalini', 'dog.jpg', 'test', 'nalinipoornaappsys@gmail.com', '', '', '4853478734', '', '', '', '', '1');
INSERT INTO `school_students` (`studentId`, `schoolId`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `status`) VALUES ('53', '1', '1009', 'Nalini', 'pictures-14.jpg', 'test', 'nalinipoornaappsys@gmail.com', '', '', '4853478734', '', '', '', '', '1');
INSERT INTO `school_students` (`studentId`, `schoolId`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `status`) VALUES ('54', '1', '1010', 'Nalini', 'pictures-11.jpg', 'test', 'nalinipoornaappsys@gmail.com', '', '', '4853478734', '', '', '', '', '1');
INSERT INTO `school_students` (`studentId`, `schoolId`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `status`) VALUES ('55', '1', '1292', 'djvhj', 'pictures-10.jpg', 'dfd', 'nalinipoornaappsys@gmail.com', '', '', '2435465756', '', '', '', '', '1');
INSERT INTO `school_students` (`studentId`, `schoolId`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `status`) VALUES ('56', '1', 'testhj', 'test', 'pictures-2.jpg', 'dfsed', 'nalinipoornaappsys@gmail.com', '', '', '1234567898', '', '', '', '', '1');
INSERT INTO `school_students` (`studentId`, `schoolId`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `status`) VALUES ('57', '1', 'testhghhj', 'dsfsdf', 'pictures-10.jpg', 'dfsed', 'nalinipoornaappsys@gmail.com', '', '', '2345678979', '', '', '', '', '1');


#
# TABLE STRUCTURE FOR: school_vehicles
#

DROP TABLE IF EXISTS `school_vehicles`;

CREATE TABLE `school_vehicles` (
  `vehicleId` int(11) NOT NULL AUTO_INCREMENT,
  `schoolId` int(11) NOT NULL,
  `registrationNo` varchar(20) NOT NULL,
  `vehicleNo` varchar(20) NOT NULL,
  `typeId` int(11) NOT NULL,
  `ownedBySchool` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`vehicleId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

INSERT INTO `school_vehicles` (`vehicleId`, `schoolId`, `registrationNo`, `vehicleNo`, `typeId`, `ownedBySchool`, `status`) VALUES ('1', '1', 'KA 58 AA 1234', '1', '1', '1', '1');
INSERT INTO `school_vehicles` (`vehicleId`, `schoolId`, `registrationNo`, `vehicleNo`, `typeId`, `ownedBySchool`, `status`) VALUES ('2', '1', 'KA 03 MM 4321', '2', '1', '1', '1');
INSERT INTO `school_vehicles` (`vehicleId`, `schoolId`, `registrationNo`, `vehicleNo`, `typeId`, `ownedBySchool`, `status`) VALUES ('3', '2', 'A1', '1', '1', '1', '1');
INSERT INTO `school_vehicles` (`vehicleId`, `schoolId`, `registrationNo`, `vehicleNo`, `typeId`, `ownedBySchool`, `status`) VALUES ('4', '3', 'B1', '1', '1', '1', '1');
INSERT INTO `school_vehicles` (`vehicleId`, `schoolId`, `registrationNo`, `vehicleNo`, `typeId`, `ownedBySchool`, `status`) VALUES ('5', '4', 'C1', '1', '1', '1', '1');
INSERT INTO `school_vehicles` (`vehicleId`, `schoolId`, `registrationNo`, `vehicleNo`, `typeId`, `ownedBySchool`, `status`) VALUES ('6', '5', 'D1', '1', '1', '1', '1');
INSERT INTO `school_vehicles` (`vehicleId`, `schoolId`, `registrationNo`, `vehicleNo`, `typeId`, `ownedBySchool`, `status`) VALUES ('7', '6', 'E1', '1', '1', '1', '1');
INSERT INTO `school_vehicles` (`vehicleId`, `schoolId`, `registrationNo`, `vehicleNo`, `typeId`, `ownedBySchool`, `status`) VALUES ('8', '7', 'F1', '1', '1', '1', '1');
INSERT INTO `school_vehicles` (`vehicleId`, `schoolId`, `registrationNo`, `vehicleNo`, `typeId`, `ownedBySchool`, `status`) VALUES ('9', '8', 'G1', '1', '1', '1', '1');
INSERT INTO `school_vehicles` (`vehicleId`, `schoolId`, `registrationNo`, `vehicleNo`, `typeId`, `ownedBySchool`, `status`) VALUES ('10', '9', 'H1', '1', '1', '1', '1');
INSERT INTO `school_vehicles` (`vehicleId`, `schoolId`, `registrationNo`, `vehicleNo`, `typeId`, `ownedBySchool`, `status`) VALUES ('11', '10', 'I1', '1', '1', '1', '1');
INSERT INTO `school_vehicles` (`vehicleId`, `schoolId`, `registrationNo`, `vehicleNo`, `typeId`, `ownedBySchool`, `status`) VALUES ('12', '11', 'J1', '1', '1', '1', '1');
INSERT INTO `school_vehicles` (`vehicleId`, `schoolId`, `registrationNo`, `vehicleNo`, `typeId`, `ownedBySchool`, `status`) VALUES ('13', '12', 'K1', '1', '1', '1', '1');
INSERT INTO `school_vehicles` (`vehicleId`, `schoolId`, `registrationNo`, `vehicleNo`, `typeId`, `ownedBySchool`, `status`) VALUES ('14', '13', 'L1', '1', '1', '1', '1');
INSERT INTO `school_vehicles` (`vehicleId`, `schoolId`, `registrationNo`, `vehicleNo`, `typeId`, `ownedBySchool`, `status`) VALUES ('15', '1', 'Demo', '0087', '1', '1', '1');
INSERT INTO `school_vehicles` (`vehicleId`, `schoolId`, `registrationNo`, `vehicleNo`, `typeId`, `ownedBySchool`, `status`) VALUES ('16', '1', 'hfhe', 'efwrg', '1', '0', '1');


#
# TABLE STRUCTURE FOR: schools
#

DROP TABLE IF EXISTS `schools`;

CREATE TABLE `schools` (
  `schoolId` int(11) NOT NULL AUTO_INCREMENT,
  `schoolName` varchar(250) NOT NULL,
  `address` text NOT NULL,
  `country` varchar(150) NOT NULL,
  `implementationType` varchar(20) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`schoolId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

INSERT INTO `schools` (`schoolId`, `schoolName`, `address`, `country`, `implementationType`, `status`) VALUES ('1', 'Saint John\'s High School', '#132,St. John\'s Church Road, Cleveland Town, Bangalore - 560005', 'India', 'VEHICLE', '1');
INSERT INTO `schools` (`schoolId`, `schoolName`, `address`, `country`, `implementationType`, `status`) VALUES ('2', 'A International School', 'Address', 'India', 'VEHICLE', '1');
INSERT INTO `schools` (`schoolId`, `schoolName`, `address`, `country`, `implementationType`, `status`) VALUES ('3', 'B International School', 'Address', 'India', 'VEHICLE', '1');
INSERT INTO `schools` (`schoolId`, `schoolName`, `address`, `country`, `implementationType`, `status`) VALUES ('4', 'C International School', 'Address', 'India', 'VEHICLE', '1');
INSERT INTO `schools` (`schoolId`, `schoolName`, `address`, `country`, `implementationType`, `status`) VALUES ('5', 'D International School', 'Address', 'India', 'VEHICLE', '1');
INSERT INTO `schools` (`schoolId`, `schoolName`, `address`, `country`, `implementationType`, `status`) VALUES ('6', 'E International School', 'Address', 'India', 'VEHICLE', '1');
INSERT INTO `schools` (`schoolId`, `schoolName`, `address`, `country`, `implementationType`, `status`) VALUES ('7', 'F International School', 'Address', 'India', 'VEHICLE', '1');
INSERT INTO `schools` (`schoolId`, `schoolName`, `address`, `country`, `implementationType`, `status`) VALUES ('8', 'G International School', 'Address', 'India', 'VEHICLE', '1');
INSERT INTO `schools` (`schoolId`, `schoolName`, `address`, `country`, `implementationType`, `status`) VALUES ('9', 'H International School', 'Address', 'India', 'VEHICLE', '1');
INSERT INTO `schools` (`schoolId`, `schoolName`, `address`, `country`, `implementationType`, `status`) VALUES ('10', 'I International School', 'Address', 'India', 'VEHICLE', '1');
INSERT INTO `schools` (`schoolId`, `schoolName`, `address`, `country`, `implementationType`, `status`) VALUES ('11', 'J International School', 'Address', 'India', 'VEHICLE', '1');
INSERT INTO `schools` (`schoolId`, `schoolName`, `address`, `country`, `implementationType`, `status`) VALUES ('12', 'K International School', 'Address', 'India', 'VEHICLE', '1');
INSERT INTO `schools` (`schoolId`, `schoolName`, `address`, `country`, `implementationType`, `status`) VALUES ('13', 'L International School', 'Address', 'Mexico', 'VEHICLE', '1');
INSERT INTO `schools` (`schoolId`, `schoolName`, `address`, `country`, `implementationType`, `status`) VALUES ('14', 'Demo School', 'Address', 'India', 'VEHICLE', '1');
INSERT INTO `schools` (`schoolId`, `schoolName`, `address`, `country`, `implementationType`, `status`) VALUES ('15', 'Singapore Demo International School', 'Address', 'Singapore', 'GATE', '1');
INSERT INTO `schools` (`schoolId`, `schoolName`, `address`, `country`, `implementationType`, `status`) VALUES ('16', 'Demo International School', 'Address', 'Malaysia', 'GATE', '1');


#
# TABLE STRUCTURE FOR: sections
#

DROP TABLE IF EXISTS `sections`;

CREATE TABLE `sections` (
  `sectionId` int(11) NOT NULL AUTO_INCREMENT,
  `sectionName` varchar(100) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`sectionId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO `sections` (`sectionId`, `sectionName`, `status`) VALUES ('1', 'A Section', '1');
INSERT INTO `sections` (`sectionId`, `sectionName`, `status`) VALUES ('2', 'B Section', '1');
INSERT INTO `sections` (`sectionId`, `sectionName`, `status`) VALUES ('3', 'C Section', '1');


#
# TABLE STRUCTURE FOR: staffs
#

DROP TABLE IF EXISTS `staffs`;

CREATE TABLE `staffs` (
  `staffId` int(11) NOT NULL AUTO_INCREMENT,
  `schoolId` int(11) NOT NULL,
  `staffCode` varchar(20) NOT NULL,
  `designationId` int(11) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(20) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`staffId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `staffs` (`staffId`, `schoolId`, `staffCode`, `designationId`, `firstName`, `lastName`, `username`, `password`, `email`, `address`, `phone`, `status`) VALUES ('3', '1', 'S103', '2', 'Demo', 'Teacher', 'demoteacher', '123456', 'demoteacher@poornaapp.com', 'Address', '1234567890', '1');
INSERT INTO `staffs` (`staffId`, `schoolId`, `staffCode`, `designationId`, `firstName`, `lastName`, `username`, `password`, `email`, `address`, `phone`, `status`) VALUES ('4', '1', 'S102', '1', 'Teacher', 'Teacher', 'teacher', '123456', 'teacher@poornaapp.com', 'Address', '9123456789', '1');
INSERT INTO `staffs` (`staffId`, `schoolId`, `staffCode`, `designationId`, `firstName`, `lastName`, `username`, `password`, `email`, `address`, `phone`, `status`) VALUES ('6', '1', 'S104', '2', 'Demo', 'Attender', 'demoattender', '123456', 'demoattender@poornaapp.com', 'Address', '91234567890', '1');


#
# TABLE STRUCTURE FOR: standards
#

DROP TABLE IF EXISTS `standards`;

CREATE TABLE `standards` (
  `standardId` int(11) NOT NULL AUTO_INCREMENT,
  `standardName` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`standardId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

INSERT INTO `standards` (`standardId`, `standardName`, `status`) VALUES ('1', '1st', '1');
INSERT INTO `standards` (`standardId`, `standardName`, `status`) VALUES ('2', '2nd', '1');
INSERT INTO `standards` (`standardId`, `standardName`, `status`) VALUES ('3', '3rd', '1');
INSERT INTO `standards` (`standardId`, `standardName`, `status`) VALUES ('4', '4th', '1');
INSERT INTO `standards` (`standardId`, `standardName`, `status`) VALUES ('5', '5th', '1');
INSERT INTO `standards` (`standardId`, `standardName`, `status`) VALUES ('6', 'Pre KG', '1');
INSERT INTO `standards` (`standardId`, `standardName`, `status`) VALUES ('7', '6th', '1');


#
# TABLE STRUCTURE FOR: student_classes
#

DROP TABLE IF EXISTS `student_classes`;

CREATE TABLE `student_classes` (
  `mappingId` int(11) NOT NULL AUTO_INCREMENT,
  `studentId` int(11) NOT NULL,
  `classId` int(11) NOT NULL,
  `academicId` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`mappingId`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;

INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('14', '17', '2', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('15', '18', '1', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('16', '1', '3', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('17', '2', '8', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('18', '3', '2', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('19', '4', '8', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('20', '5', '8', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('21', '6', '8', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('22', '7', '8', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('23', '8', '8', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('24', '9', '8', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('25', '10', '8', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('26', '11', '8', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('27', '12', '8', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('28', '16', '8', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('29', '13', '8', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('30', '14', '8', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('31', '15', '8', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('32', '29', '9', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('33', '30', '1', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('34', '31', '1', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('35', '32', '1', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('36', '33', '1', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('37', '34', '1', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('38', '35', '1', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('39', '36', '1', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('40', '37', '1', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('41', '38', '1', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('42', '39', '1', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('43', '39', '1', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('44', '40', '1', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('45', '39', '1', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('46', '41', '1', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('47', '41', '1', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('48', '42', '1', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('49', '43', '1', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('50', '44', '1', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('51', '45', '1', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('52', '46', '1', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('53', '47', '1', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('54', '48', '1', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('55', '49', '1', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('56', '50', '1', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('57', '52', '9', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('58', '53', '9', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('59', '54', '9', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('60', '55', '1', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('61', '56', '1', '1', '1');
INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES ('62', '57', '1', '1', '1');


#
# TABLE STRUCTURE FOR: student_details
#

DROP TABLE IF EXISTS `student_details`;

CREATE TABLE `student_details` (
  `detailsId` int(11) NOT NULL AUTO_INCREMENT,
  `studentId` bigint(20) NOT NULL,
  `standard` varchar(50) NOT NULL,
  `section` varchar(50) NOT NULL,
  `pickupVehicleId` int(11) NOT NULL,
  `dropVehicleId` int(11) NOT NULL,
  `schoolStart` date NOT NULL,
  `schoolEnd` date NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`detailsId`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

INSERT INTO `student_details` (`detailsId`, `studentId`, `standard`, `section`, `pickupVehicleId`, `dropVehicleId`, `schoolStart`, `schoolEnd`, `status`) VALUES ('1', '1', '3rd', 'D Section', '1', '1', '2016-06-01', '2017-03-31', '1');
INSERT INTO `student_details` (`detailsId`, `studentId`, `standard`, `section`, `pickupVehicleId`, `dropVehicleId`, `schoolStart`, `schoolEnd`, `status`) VALUES ('2', '2', 'Pre KG', 'D Section', '1', '2', '2016-06-01', '2017-03-31', '1');
INSERT INTO `student_details` (`detailsId`, `studentId`, `standard`, `section`, `pickupVehicleId`, `dropVehicleId`, `schoolStart`, `schoolEnd`, `status`) VALUES ('3', '3', 'Play School', 'A Section', '3', '3', '2015-06-01', '2016-04-30', '1');
INSERT INTO `student_details` (`detailsId`, `studentId`, `standard`, `section`, `pickupVehicleId`, `dropVehicleId`, `schoolStart`, `schoolEnd`, `status`) VALUES ('4', '4', '2nd', 'C Section', '4', '4', '2015-06-01', '2016-04-30', '1');
INSERT INTO `student_details` (`detailsId`, `studentId`, `standard`, `section`, `pickupVehicleId`, `dropVehicleId`, `schoolStart`, `schoolEnd`, `status`) VALUES ('5', '5', 'Play School', 'A Section', '5', '5', '2015-06-01', '2016-04-30', '1');
INSERT INTO `student_details` (`detailsId`, `studentId`, `standard`, `section`, `pickupVehicleId`, `dropVehicleId`, `schoolStart`, `schoolEnd`, `status`) VALUES ('6', '6', '2nd', 'C Section', '6', '6', '2015-06-01', '2016-04-30', '1');
INSERT INTO `student_details` (`detailsId`, `studentId`, `standard`, `section`, `pickupVehicleId`, `dropVehicleId`, `schoolStart`, `schoolEnd`, `status`) VALUES ('7', '7', 'Play School', 'A Section', '7', '7', '2015-06-01', '2016-04-30', '1');
INSERT INTO `student_details` (`detailsId`, `studentId`, `standard`, `section`, `pickupVehicleId`, `dropVehicleId`, `schoolStart`, `schoolEnd`, `status`) VALUES ('8', '8', '2nd', 'C Section', '8', '8', '2015-06-01', '2016-04-30', '1');
INSERT INTO `student_details` (`detailsId`, `studentId`, `standard`, `section`, `pickupVehicleId`, `dropVehicleId`, `schoolStart`, `schoolEnd`, `status`) VALUES ('9', '9', 'Play School', 'A Section', '9', '9', '2015-06-01', '2016-04-30', '1');
INSERT INTO `student_details` (`detailsId`, `studentId`, `standard`, `section`, `pickupVehicleId`, `dropVehicleId`, `schoolStart`, `schoolEnd`, `status`) VALUES ('10', '10', '2nd', 'C Section', '10', '10', '2015-06-01', '2016-04-30', '1');
INSERT INTO `student_details` (`detailsId`, `studentId`, `standard`, `section`, `pickupVehicleId`, `dropVehicleId`, `schoolStart`, `schoolEnd`, `status`) VALUES ('11', '11', 'Play School', 'A Section', '11', '11', '2015-06-01', '2016-04-30', '1');
INSERT INTO `student_details` (`detailsId`, `studentId`, `standard`, `section`, `pickupVehicleId`, `dropVehicleId`, `schoolStart`, `schoolEnd`, `status`) VALUES ('12', '12', '2nd', 'C Section', '12', '12', '2015-06-01', '2016-04-30', '1');
INSERT INTO `student_details` (`detailsId`, `studentId`, `standard`, `section`, `pickupVehicleId`, `dropVehicleId`, `schoolStart`, `schoolEnd`, `status`) VALUES ('13', '13', '2nd', 'D Section', '13', '13', '2015-06-01', '2016-04-30', '1');
INSERT INTO `student_details` (`detailsId`, `studentId`, `standard`, `section`, `pickupVehicleId`, `dropVehicleId`, `schoolStart`, `schoolEnd`, `status`) VALUES ('14', '14', '3rd', 'B Section', '14', '14', '2015-06-01', '2016-04-30', '1');
INSERT INTO `student_details` (`detailsId`, `studentId`, `standard`, `section`, `pickupVehicleId`, `dropVehicleId`, `schoolStart`, `schoolEnd`, `status`) VALUES ('15', '15', 'Play School', 'D Section', '14', '14', '2015-06-01', '2016-04-30', '1');
INSERT INTO `student_details` (`detailsId`, `studentId`, `standard`, `section`, `pickupVehicleId`, `dropVehicleId`, `schoolStart`, `schoolEnd`, `status`) VALUES ('16', '16', '3rd', 'F Section', '15', '15', '2016-02-01', '2016-05-31', '1');
INSERT INTO `student_details` (`detailsId`, `studentId`, `standard`, `section`, `pickupVehicleId`, `dropVehicleId`, `schoolStart`, `schoolEnd`, `status`) VALUES ('17', '17', '3rd', 'D Section', '1', '1', '2016-06-01', '2017-03-31', '1');
INSERT INTO `student_details` (`detailsId`, `studentId`, `standard`, `section`, `pickupVehicleId`, `dropVehicleId`, `schoolStart`, `schoolEnd`, `status`) VALUES ('18', '18', 'Play School', 'A Section', '1', '1', '2016-06-01', '2017-03-31', '1');
INSERT INTO `student_details` (`detailsId`, `studentId`, `standard`, `section`, `pickupVehicleId`, `dropVehicleId`, `schoolStart`, `schoolEnd`, `status`) VALUES ('19', '19', '2', 'E Section', '1', '1', '2016-06-01', '2017-03-31', '1');
INSERT INTO `student_details` (`detailsId`, `studentId`, `standard`, `section`, `pickupVehicleId`, `dropVehicleId`, `schoolStart`, `schoolEnd`, `status`) VALUES ('20', '20', '1', 'A Section', '1', '1', '2016-06-01', '2017-03-31', '1');
INSERT INTO `student_details` (`detailsId`, `studentId`, `standard`, `section`, `pickupVehicleId`, `dropVehicleId`, `schoolStart`, `schoolEnd`, `status`) VALUES ('21', '21', '3', 'B Section', '1', '1', '2016-06-01', '2017-03-31', '1');
INSERT INTO `student_details` (`detailsId`, `studentId`, `standard`, `section`, `pickupVehicleId`, `dropVehicleId`, `schoolStart`, `schoolEnd`, `status`) VALUES ('22', '22', '4', 'A Section', '1', '1', '2016-06-01', '2017-03-31', '1');
INSERT INTO `student_details` (`detailsId`, `studentId`, `standard`, `section`, `pickupVehicleId`, `dropVehicleId`, `schoolStart`, `schoolEnd`, `status`) VALUES ('23', '23', '5', 'C Section', '1', '1', '2016-06-01', '2017-03-31', '1');
INSERT INTO `student_details` (`detailsId`, `studentId`, `standard`, `section`, `pickupVehicleId`, `dropVehicleId`, `schoolStart`, `schoolEnd`, `status`) VALUES ('24', '24', '5', 'E Section', '1', '1', '2016-06-01', '2017-03-31', '1');
INSERT INTO `student_details` (`detailsId`, `studentId`, `standard`, `section`, `pickupVehicleId`, `dropVehicleId`, `schoolStart`, `schoolEnd`, `status`) VALUES ('25', '25', 'Pre KG', 'A Section', '1', '1', '2016-06-01', '2017-03-31', '1');
INSERT INTO `student_details` (`detailsId`, `studentId`, `standard`, `section`, `pickupVehicleId`, `dropVehicleId`, `schoolStart`, `schoolEnd`, `status`) VALUES ('26', '26', '3', 'B Section', '1', '1', '2016-06-01', '2017-03-31', '1');
INSERT INTO `student_details` (`detailsId`, `studentId`, `standard`, `section`, `pickupVehicleId`, `dropVehicleId`, `schoolStart`, `schoolEnd`, `status`) VALUES ('27', '27', '2', 'A Section', '1', '1', '2016-06-01', '2017-03-31', '1');
INSERT INTO `student_details` (`detailsId`, `studentId`, `standard`, `section`, `pickupVehicleId`, `dropVehicleId`, `schoolStart`, `schoolEnd`, `status`) VALUES ('28', '28', '4', 'C Section', '1', '1', '2016-06-01', '2017-03-31', '1');


#
# TABLE STRUCTURE FOR: student_staffs
#

DROP TABLE IF EXISTS `student_staffs`;

CREATE TABLE `student_staffs` (
  `mappingId` int(11) NOT NULL AUTO_INCREMENT,
  `studentId` int(11) NOT NULL,
  `staffId` int(11) NOT NULL,
  `assignedDate` date NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`mappingId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `student_staffs` (`mappingId`, `studentId`, `staffId`, `assignedDate`, `status`) VALUES ('1', '17', '6', '2016-06-01', '1');
INSERT INTO `student_staffs` (`mappingId`, `studentId`, `staffId`, `assignedDate`, `status`) VALUES ('2', '17', '6', '2016-06-01', '1');


#
# TABLE STRUCTURE FOR: student_vehicles
#

DROP TABLE IF EXISTS `student_vehicles`;

CREATE TABLE `student_vehicles` (
  `mappingId` int(11) NOT NULL AUTO_INCREMENT,
  `studentId` int(11) NOT NULL,
  `cardNo` varchar(50) NOT NULL,
  `pickupVehicleId` int(11) NOT NULL,
  `dropVehicleId` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`mappingId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO `student_vehicles` (`mappingId`, `studentId`, `cardNo`, `pickupVehicleId`, `dropVehicleId`, `status`) VALUES ('2', '18', '71BEDA1D', '1', '1', '1');
INSERT INTO `student_vehicles` (`mappingId`, `studentId`, `cardNo`, `pickupVehicleId`, `dropVehicleId`, `status`) VALUES ('3', '1', '', '1', '1', '1');


#
# TABLE STRUCTURE FOR: time_table_classes
#

DROP TABLE IF EXISTS `time_table_classes`;

CREATE TABLE `time_table_classes` (
  `timeTableId` int(11) NOT NULL AUTO_INCREMENT,
  `classId` int(11) NOT NULL,
  `academicId` int(11) NOT NULL,
  `timeTable` varchar(100) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`timeTableId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

INSERT INTO `time_table_classes` (`timeTableId`, `classId`, `academicId`, `timeTable`, `status`) VALUES ('1', '1', '1', 'time_table_cs.png', '1');
INSERT INTO `time_table_classes` (`timeTableId`, `classId`, `academicId`, `timeTable`, `status`) VALUES ('2', '2', '1', 'time_table_cs.png', '1');
INSERT INTO `time_table_classes` (`timeTableId`, `classId`, `academicId`, `timeTable`, `status`) VALUES ('3', '3', '1', 'time_table_cs.png', '1');
INSERT INTO `time_table_classes` (`timeTableId`, `classId`, `academicId`, `timeTable`, `status`) VALUES ('4', '4', '1', 'time_table_cs.png', '1');
INSERT INTO `time_table_classes` (`timeTableId`, `classId`, `academicId`, `timeTable`, `status`) VALUES ('5', '5', '1', 'time_table_cs.png', '1');
INSERT INTO `time_table_classes` (`timeTableId`, `classId`, `academicId`, `timeTable`, `status`) VALUES ('6', '1', '1', 'pictures-14.jpg', '1');
INSERT INTO `time_table_classes` (`timeTableId`, `classId`, `academicId`, `timeTable`, `status`) VALUES ('7', '1', '1', '5-14.jpg', '1');
INSERT INTO `time_table_classes` (`timeTableId`, `classId`, `academicId`, `timeTable`, `status`) VALUES ('8', '1', '1', 'pictures-14.jpg', '1');
INSERT INTO `time_table_classes` (`timeTableId`, `classId`, `academicId`, `timeTable`, `status`) VALUES ('9', '3', '1', '56-16.jpg', '1');


#
# TABLE STRUCTURE FOR: travel_details
#

DROP TABLE IF EXISTS `travel_details`;

CREATE TABLE `travel_details` (
  `detailsId` int(11) NOT NULL AUTO_INCREMENT,
  `staffId` int(11) NOT NULL,
  `vehicleId` int(11) NOT NULL,
  `studentId` bigint(20) NOT NULL,
  `travelType` varchar(50) NOT NULL,
  `travelDate` date NOT NULL,
  `inTime` time NOT NULL,
  `outTime` time DEFAULT NULL,
  `inLocation` varchar(250) NOT NULL,
  `outLocation` varchar(250) NOT NULL,
  `comments` varchar(100) DEFAULT NULL,
  `isManual` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`detailsId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

INSERT INTO `travel_details` (`detailsId`, `staffId`, `vehicleId`, `studentId`, `travelType`, `travelDate`, `inTime`, `outTime`, `inLocation`, `outLocation`, `comments`, `isManual`, `status`) VALUES ('1', '6', '1', '17', 'PICKUP', '2016-12-12', '07:26:00', NULL, 'RT Nagar', '', NULL, '0', '1');
INSERT INTO `travel_details` (`detailsId`, `staffId`, `vehicleId`, `studentId`, `travelType`, `travelDate`, `inTime`, `outTime`, `inLocation`, `outLocation`, `comments`, `isManual`, `status`) VALUES ('2', '6', '1', '17', 'PICKUP', '2016-12-13', '07:26:00', '00:00:00', 'RTNagar', '', NULL, '0', '1');
INSERT INTO `travel_details` (`detailsId`, `staffId`, `vehicleId`, `studentId`, `travelType`, `travelDate`, `inTime`, `outTime`, `inLocation`, `outLocation`, `comments`, `isManual`, `status`) VALUES ('3', '6', '1', '17', 'PICKUP', '2016-12-14', '07:26:00', NULL, 'RTNagar', '', NULL, '0', '1');
INSERT INTO `travel_details` (`detailsId`, `staffId`, `vehicleId`, `studentId`, `travelType`, `travelDate`, `inTime`, `outTime`, `inLocation`, `outLocation`, `comments`, `isManual`, `status`) VALUES ('4', '6', '1', '17', 'PICKUP', '2016-12-15', '07:26:00', NULL, 'RTNagar', '', NULL, '0', '1');
INSERT INTO `travel_details` (`detailsId`, `staffId`, `vehicleId`, `studentId`, `travelType`, `travelDate`, `inTime`, `outTime`, `inLocation`, `outLocation`, `comments`, `isManual`, `status`) VALUES ('5', '6', '1', '17', 'PICKUP', '2016-12-16', '07:26:00', NULL, 'RTNagar', '', NULL, '0', '1');
INSERT INTO `travel_details` (`detailsId`, `staffId`, `vehicleId`, `studentId`, `travelType`, `travelDate`, `inTime`, `outTime`, `inLocation`, `outLocation`, `comments`, `isManual`, `status`) VALUES ('6', '6', '1', '17', 'PICKUP', '2016-12-19', '07:26:00', NULL, 'RTNagar', '', NULL, '0', '1');
INSERT INTO `travel_details` (`detailsId`, `staffId`, `vehicleId`, `studentId`, `travelType`, `travelDate`, `inTime`, `outTime`, `inLocation`, `outLocation`, `comments`, `isManual`, `status`) VALUES ('7', '6', '1', '17', 'DROP', '2016-12-19', '07:26:00', '00:00:00', 'RTNagar', '', NULL, '1', '1');
INSERT INTO `travel_details` (`detailsId`, `staffId`, `vehicleId`, `studentId`, `travelType`, `travelDate`, `inTime`, `outTime`, `inLocation`, `outLocation`, `comments`, `isManual`, `status`) VALUES ('8', '6', '1', '17', 'PICKUP', '2016-12-20', '07:26:00', NULL, 'RTNagar', '', NULL, '0', '1');
INSERT INTO `travel_details` (`detailsId`, `staffId`, `vehicleId`, `studentId`, `travelType`, `travelDate`, `inTime`, `outTime`, `inLocation`, `outLocation`, `comments`, `isManual`, `status`) VALUES ('9', '6', '1', '17', 'DROP', '2016-12-20', '07:26:00', '00:00:00', 'RTNagar', '', NULL, '1', '1');
INSERT INTO `travel_details` (`detailsId`, `staffId`, `vehicleId`, `studentId`, `travelType`, `travelDate`, `inTime`, `outTime`, `inLocation`, `outLocation`, `comments`, `isManual`, `status`) VALUES ('10', '6', '1', '17', 'PICKUP', '2016-12-22', '07:26:00', NULL, 'RTNagar', '', NULL, '0', '1');
INSERT INTO `travel_details` (`detailsId`, `staffId`, `vehicleId`, `studentId`, `travelType`, `travelDate`, `inTime`, `outTime`, `inLocation`, `outLocation`, `comments`, `isManual`, `status`) VALUES ('11', '6', '1', '17', 'PICKUP', '2016-12-23', '07:26:00', NULL, 'RTNagar', '', NULL, '0', '1');
INSERT INTO `travel_details` (`detailsId`, `staffId`, `vehicleId`, `studentId`, `travelType`, `travelDate`, `inTime`, `outTime`, `inLocation`, `outLocation`, `comments`, `isManual`, `status`) VALUES ('12', '6', '1', '17', 'PICKUP', '2016-12-26', '07:26:00', NULL, 'RTNagar', '', NULL, '0', '1');
INSERT INTO `travel_details` (`detailsId`, `staffId`, `vehicleId`, `studentId`, `travelType`, `travelDate`, `inTime`, `outTime`, `inLocation`, `outLocation`, `comments`, `isManual`, `status`) VALUES ('13', '6', '1', '17', 'DROP', '2016-12-26', '07:26:00', '03:00:00', 'RTNagar', 'RTNagar', NULL, '1', '1');
INSERT INTO `travel_details` (`detailsId`, `staffId`, `vehicleId`, `studentId`, `travelType`, `travelDate`, `inTime`, `outTime`, `inLocation`, `outLocation`, `comments`, `isManual`, `status`) VALUES ('14', '6', '1', '17', 'PICKUP', '2016-12-27', '07:26:00', NULL, 'RTNagar', '', NULL, '0', '1');
INSERT INTO `travel_details` (`detailsId`, `staffId`, `vehicleId`, `studentId`, `travelType`, `travelDate`, `inTime`, `outTime`, `inLocation`, `outLocation`, `comments`, `isManual`, `status`) VALUES ('15', '6', '1', '17', 'PICKUP', '2016-12-28', '07:26:00', '00:00:00', 'RTNagar', '', NULL, '1', '1');
INSERT INTO `travel_details` (`detailsId`, `staffId`, `vehicleId`, `studentId`, `travelType`, `travelDate`, `inTime`, `outTime`, `inLocation`, `outLocation`, `comments`, `isManual`, `status`) VALUES ('17', '6', '1', '17', 'PICKUP', '2016-12-29', '19:41:00', NULL, 'V', '', NULL, '0', '1');
INSERT INTO `travel_details` (`detailsId`, `staffId`, `vehicleId`, `studentId`, `travelType`, `travelDate`, `inTime`, `outTime`, `inLocation`, `outLocation`, `comments`, `isManual`, `status`) VALUES ('18', '6', '1', '18', 'PICKUP', '2016-12-29', '16:48:00', NULL, '', '', NULL, '0', '1');
INSERT INTO `travel_details` (`detailsId`, `staffId`, `vehicleId`, `studentId`, `travelType`, `travelDate`, `inTime`, `outTime`, `inLocation`, `outLocation`, `comments`, `isManual`, `status`) VALUES ('19', '6', '1', '17', 'PICKUP', '2016-12-30', '18:13:00', NULL, 'V . V Nagar, HMT Layout, Dinnur, Ganga Nagar', '', NULL, '0', '1');
INSERT INTO `travel_details` (`detailsId`, `staffId`, `vehicleId`, `studentId`, `travelType`, `travelDate`, `inTime`, `outTime`, `inLocation`, `outLocation`, `comments`, `isManual`, `status`) VALUES ('20', '6', '1', '18', 'PICKUP', '2016-12-30', '17:34:00', NULL, 'V', '', NULL, '0', '1');
INSERT INTO `travel_details` (`detailsId`, `staffId`, `vehicleId`, `studentId`, `travelType`, `travelDate`, `inTime`, `outTime`, `inLocation`, `outLocation`, `comments`, `isManual`, `status`) VALUES ('21', '6', '1', '17', 'DROP', '2016-12-30', '23:54:00', '23:54:00', 'Bangalore', 'Bangalore', NULL, '0', '1');


#
# TABLE STRUCTURE FOR: vehicle_locations
#

DROP TABLE IF EXISTS `vehicle_locations`;

CREATE TABLE `vehicle_locations` (
  `locationId` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleId` int(11) NOT NULL,
  `staffId` int(11) NOT NULL,
  `travelDate` datetime NOT NULL,
  `travelType` varchar(50) NOT NULL,
  `lat` varchar(50) NOT NULL,
  `lng` varchar(50) NOT NULL,
  `location` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`locationId`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=latin1;

INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('2', '1', '6', '2016-12-12 15:33:47', 'PICKUP', '1231231231', '3424343433', 'RT Nagar', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('3', '1', '6', '2016-12-12 16:43:26', 'PICKUP', '1231231231', '3424343433', 'RT Nagar', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('4', '1', '6', '2016-12-12 22:55:06', 'PICKUP', '1231231231', '3424343433', 'RT', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('5', '1', '6', '2016-12-29 11:35:07', 'PICKUP', '1231231231', '1231231232', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('6', '1', '6', '2016-12-29 11:39:17', 'DROP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('7', '1', '6', '2016-12-29 12:57:25', 'DROP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('8', '1', '6', '2016-12-29 12:58:18', 'DROP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('9', '1', '6', '2016-12-29 12:59:35', 'DROP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('10', '1', '6', '2016-12-29 13:01:51', 'DROP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('11', '1', '6', '2016-12-29 13:35:10', 'DROP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('12', '1', '6', '2016-12-29 13:40:17', 'DROP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('13', '1', '6', '2016-12-29 13:44:13', 'DROP', '13.0271669', '77.593865', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('14', '1', '6', '2016-12-29 13:53:17', 'DROP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('15', '1', '6', '2016-12-29 13:53:19', 'DROP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('16', '1', '6', '2016-12-29 13:53:35', 'DROP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('17', '1', '6', '2016-12-29 14:06:53', 'DROP', '13.0258796', '77.5937307', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('18', '1', '6', '2016-12-29 14:22:23', 'DROP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('19', '1', '6', '2016-12-29 14:23:22', 'PICKUP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('20', '1', '6', '2016-12-29 14:23:31', 'PICKUP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('21', '1', '6', '2016-12-29 15:08:48', 'PICKUP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('22', '1', '6', '2016-12-29 15:09:04', 'PICKUP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('23', '1', '6', '2016-12-29 15:09:28', 'PICKUP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('24', '1', '6', '2016-12-29 15:10:28', 'PICKUP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('25', '1', '6', '2016-12-29 15:10:49', 'PICKUP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('26', '1', '6', '2016-12-29 15:14:31', 'PICKUP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('27', '1', '6', '2016-12-29 15:58:14', 'PICKUP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('28', '1', '6', '2016-12-29 16:23:15', 'null', '13.0271669', '77.593865', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('29', '1', '6', '2016-12-29 16:23:41', 'null', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('30', '1', '6', '2016-12-29 16:23:46', 'null', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('31', '1', '6', '2016-12-29 16:23:55', 'null', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('32', '1', '6', '2016-12-29 16:24:12', 'PICKUP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('33', '1', '6', '2016-12-29 16:33:23', 'PICKUP', '13.0271669', '77.593865', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('34', '1', '6', '2016-12-29 16:36:00', 'PICKUP', '13.0271669', '77.593865', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('35', '1', '6', '2016-12-29 16:36:20', 'PICKUP', '13.0271669', '77.593865', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('36', '1', '6', '2016-12-29 16:43:37', 'PICKUP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('37', '1', '6', '2016-12-29 16:45:32', 'PICKUP', '13.0271669', '77.593865', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('38', '1', '6', '2016-12-29 16:48:14', 'null', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('39', '1', '6', '2016-12-29 16:50:17', 'null', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('40', '1', '6', '2016-12-29 16:52:03', 'PICKUP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('41', '1', '6', '2016-12-29 16:52:12', 'PICKUP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('42', '1', '6', '2016-12-29 16:52:45', 'PICKUP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('43', '1', '6', '2016-12-29 16:53:06', 'PICKUP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('44', '1', '6', '2016-12-29 16:53:18', 'PICKUP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('45', '1', '6', '2016-12-29 16:53:37', 'PICKUP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('46', '1', '6', '2016-12-29 16:55:22', 'PICKUP', '13.0271669', '77.593865', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('47', '1', '6', '2016-12-29 16:55:30', 'PICKUP', '13.0271669', '77.593865', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('48', '1', '6', '2016-12-29 16:55:33', 'PICKUP', '13.0271669', '77.593865', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('49', '1', '6', '2016-12-29 16:55:38', 'PICKUP', '13.0271669', '77.593865', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('50', '1', '6', '2016-12-29 16:55:44', 'PICKUP', '13.0271669', '77.593865', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('51', '1', '6', '2016-12-29 16:55:48', 'PICKUP', '13.0271669', '77.593865', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('52', '1', '6', '2016-12-29 16:56:42', 'PICKUP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('53', '1', '6', '2016-12-29 16:57:55', 'PICKUP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('54', '1', '6', '2016-12-29 16:58:46', 'PICKUP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('55', '1', '6', '2016-12-29 16:58:54', 'PICKUP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('56', '1', '6', '2016-12-29 16:59:02', 'PICKUP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('57', '1', '6', '2016-12-29 16:59:16', 'PICKUP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('58', '1', '6', '2016-12-29 16:59:17', 'PICKUP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('59', '1', '6', '2016-12-29 16:59:24', 'PICKUP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('60', '1', '6', '2016-12-29 16:59:34', 'PICKUP', '13.0271626', '77.5937754', '', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('61', '1', '6', '2016-12-29 19:44:48', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('62', '1', '6', '2016-12-29 19:48:07', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('63', '1', '6', '2016-12-29 19:48:45', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('64', '1', '6', '2016-12-29 19:48:59', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('65', '1', '6', '2016-12-29 22:30:58', 'PICKUP', '13.0251179', '77.5935068', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('66', '1', '6', '2016-12-30 09:29:05', 'PICKUP', '13.0251179', '77.5935068', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('67', '1', '6', '2016-12-30 09:34:16', 'PICKUP', '13.0248615', '77.5936859', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('68', '1', '6', '2016-12-30 11:06:58', 'PICKUP', '13.0271669', '77.593865', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('69', '1', '6', '2016-12-30 11:07:12', 'PICKUP', '13.0271669', '77.593865', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('70', '1', '6', '2016-12-30 11:11:04', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('71', '1', '6', '2016-12-30 11:11:36', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('72', '1', '6', '2016-12-30 11:15:39', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('73', '1', '6', '2016-12-30 11:48:22', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('74', '1', '6', '2016-12-30 11:52:08', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('75', '1', '6', '2016-12-30 12:04:50', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('76', '1', '6', '2016-12-30 12:11:52', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('77', '1', '6', '2016-12-30 12:15:05', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('78', '1', '6', '2016-12-30 12:16:33', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('79', '1', '6', '2016-12-30 12:17:43', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('80', '1', '6', '2016-12-30 12:19:16', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('81', '1', '6', '2016-12-30 12:19:55', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('82', '1', '6', '2016-12-30 12:24:41', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('83', '1', '6', '2016-12-30 12:29:01', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('84', '1', '6', '2016-12-30 12:31:38', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('85', '1', '6', '2016-12-30 12:33:09', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('86', '1', '6', '2016-12-30 12:36:20', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('87', '1', '6', '2016-12-30 12:38:41', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('88', '1', '6', '2016-12-30 13:08:48', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('89', '1', '6', '2016-12-30 13:29:23', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('90', '1', '6', '2016-12-30 13:30:14', 'PICKUP', '13.0271669', '77.593865', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('91', '1', '6', '2016-12-30 13:32:49', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('92', '1', '6', '2016-12-30 13:34:53', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('93', '1', '6', '2016-12-30 15:21:41', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('94', '1', '6', '2016-12-30 16:15:33', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('95', '1', '6', '2016-12-30 16:18:29', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('96', '1', '6', '2016-12-30 16:19:17', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('97', '1', '6', '2016-12-30 16:25:05', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('98', '1', '6', '2016-12-30 16:36:38', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('99', '1', '6', '2016-12-30 16:36:40', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('100', '1', '6', '2016-12-30 17:14:47', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('101', '1', '6', '2016-12-30 17:15:20', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('102', '1', '6', '2016-12-30 17:16:56', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('103', '1', '6', '2016-12-30 17:38:15', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('104', '1', '6', '2016-12-30 17:39:13', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('105', '1', '6', '2016-12-30 18:17:20', 'DROP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('106', '1', '6', '2016-12-30 18:17:45', 'DROP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('107', '1', '6', '2016-12-30 18:34:13', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('108', '1', '6', '2017-01-01 00:57:49', 'DROP', '13.03802', '77.6130505', 'Bengaluru,', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('109', '1', '6', '2017-01-02 11:55:22', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('110', '1', '6', '2017-01-02 12:55:27', 'PICKUP', '13.0271626', '77.5937754', 'V', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('111', '1', '6', '2017-01-02 13:05:33', 'PICKUP', '13.0271626', '77.5937754', 'V . V Nagar, HMT Layout, Dinnur, Ganga Nagar', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('112', '1', '6', '2017-01-02 13:08:22', 'PICKUP', '13.0271626', '77.5937754', 'V . V Nagar, HMT Layout, Dinnur, Ganga Nagar', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('113', '1', '6', '2017-01-02 13:11:19', 'PICKUP', '13.0271626', '77.5937754', 'V . V Nagar, HMT Layout, Dinnur, Ganga Nagar', '1');
INSERT INTO `vehicle_locations` (`locationId`, `vehicleId`, `staffId`, `travelDate`, `travelType`, `lat`, `lng`, `location`, `status`) VALUES ('114', '1', '6', '2017-01-02 13:17:10', 'PICKUP', '13.0270699', '77.5936859', 'V . V Nagar, HMT Layout, Dinnur, Ganga Nagar', '1');


#
# TABLE STRUCTURE FOR: vehicle_staffs
#

DROP TABLE IF EXISTS `vehicle_staffs`;

CREATE TABLE `vehicle_staffs` (
  `mappingId` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleId` int(11) NOT NULL,
  `staffId` int(11) NOT NULL,
  `assignedDate` date NOT NULL,
  `travelType` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`mappingId`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

INSERT INTO `vehicle_staffs` (`mappingId`, `vehicleId`, `staffId`, `assignedDate`, `travelType`, `status`) VALUES ('2', '1', '6', '2017-01-25', 'DROP', '1');
INSERT INTO `vehicle_staffs` (`mappingId`, `vehicleId`, `staffId`, `assignedDate`, `travelType`, `status`) VALUES ('30', '16', '6', '2017-01-23', 'PICKUP', '1');
INSERT INTO `vehicle_staffs` (`mappingId`, `vehicleId`, `staffId`, `assignedDate`, `travelType`, `status`) VALUES ('32', '0', '0', '2017-01-23', 'DROP', '1');
INSERT INTO `vehicle_staffs` (`mappingId`, `vehicleId`, `staffId`, `assignedDate`, `travelType`, `status`) VALUES ('33', '0', '0', '2017-01-23', 'DROP', '1');
INSERT INTO `vehicle_staffs` (`mappingId`, `vehicleId`, `staffId`, `assignedDate`, `travelType`, `status`) VALUES ('34', '0', '0', '2017-01-23', 'DROP', '1');
INSERT INTO `vehicle_staffs` (`mappingId`, `vehicleId`, `staffId`, `assignedDate`, `travelType`, `status`) VALUES ('35', '9', '4', '2017-01-26', 'PICKUP', '1');
INSERT INTO `vehicle_staffs` (`mappingId`, `vehicleId`, `staffId`, `assignedDate`, `travelType`, `status`) VALUES ('36', '1', '3', '2017-01-11', 'PICKUP', '1');
INSERT INTO `vehicle_staffs` (`mappingId`, `vehicleId`, `staffId`, `assignedDate`, `travelType`, `status`) VALUES ('37', '11', '6', '2017-01-09', 'DROP', '1');


#
# TABLE STRUCTURE FOR: vehicle_types
#

DROP TABLE IF EXISTS `vehicle_types`;

CREATE TABLE `vehicle_types` (
  `typeId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `vehicle_types` (`typeId`, `name`, `status`) VALUES ('1', 'Bus', '1');
INSERT INTO `vehicle_types` (`typeId`, `name`, `status`) VALUES ('2', 'Van', '1');


