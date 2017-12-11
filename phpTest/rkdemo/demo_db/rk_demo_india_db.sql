-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2017 at 07:27 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rk_demo_india_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_settings`
--

CREATE TABLE IF NOT EXISTS `admin_settings` (
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
  `status` tinyint(4) NOT NULL DEFAULT '1',
  UNIQUE KEY `settingId` (`settingId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_settings`
--

INSERT INTO `admin_settings` (`settingId`, `companyName`, `logo`, `caption`, `address`, `phone`, `fax`, `email`, `website`, `host`, `port`, `hostUsername`, `hostPassword`, `from`, `fromText`, `signature`, `automatedReply`, `automatedMsg`, `status`) VALUES
(1, 'Poorna App Systems', 'logo.png', '', 'Address', '232323', '', 'info@poornaapp.com', 'www.poornaapp.com', 'sg2plcpnl0100.prod.sin2.secureserver.net', 465, 'info@poornaapp.com', 'Saritha@123', 'info@poornaapp.com', 'Poorna App Systems', 'Regards,\r\nRakshaKids', 0, '0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE IF NOT EXISTS `admin_users` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` bigint(10) DEFAULT NULL,
  `roleId` int(11) NOT NULL,
  `createdBy` varchar(25) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `updatedBy` varchar(25) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`adminId`, `username`, `password`, `firstName`, `lastName`, `email`, `phone`, `roleId`, `createdBy`, `createdDate`, `updatedBy`, `updatedDate`, `status`) VALUES
(1, 'ravipoornaapp@gmail.com', '618572', 'admin', 'admin', 'ravipoornaapp@gmail.com', 1111111111, 1, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE IF NOT EXISTS `attendance` (
  `attendanceId` int(11) NOT NULL AUTO_INCREMENT,
  `studentId` int(11) NOT NULL,
  `gateName` varchar(50) NOT NULL,
  `logType` varchar(20) NOT NULL,
  `logDate` datetime NOT NULL,
  `staffId` int(11) DEFAULT NULL,
  `attendance` varchar(20) NOT NULL,
  `notes` varchar(200) DEFAULT NULL,
  `createdBy` varchar(25) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `updatedBy` varchar(25) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`attendanceId`),
  KEY `studentId` (`studentId`),
  KEY `staffId` (`staffId`),
  KEY `studentId_2` (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `class_staffs`
--

CREATE TABLE IF NOT EXISTS `class_staffs` (
  `mappingId` int(11) NOT NULL AUTO_INCREMENT,
  `classId` int(11) NOT NULL,
  `staffId` int(11) NOT NULL,
  `academicId` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`mappingId`),
  KEY `classId` (`classId`),
  KEY `staffId` (`staffId`),
  KEY `academicId` (`academicId`),
  KEY `classId_2` (`classId`),
  KEY `staffId_2` (`staffId`),
  KEY `academicId_2` (`academicId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `class_staffs`
--

INSERT INTO `class_staffs` (`mappingId`, `classId`, `staffId`, `academicId`, `status`) VALUES
(1, 1, 1, 1, 1),
(2, 2, 2, 1, 1),
(3, 3, 3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `class_syllabus`
--

CREATE TABLE IF NOT EXISTS `class_syllabus` (
  `syllabusId` int(11) NOT NULL AUTO_INCREMENT,
  `classId` int(11) NOT NULL,
  `academicId` int(11) NOT NULL,
  `syllabus` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `createdBy` varchar(25) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `updatedBy` varchar(25) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`syllabusId`),
  KEY `classId` (`classId`),
  KEY `academicId` (`academicId`),
  KEY `academicId_2` (`academicId`),
  KEY `classId_2` (`classId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE IF NOT EXISTS `designations` (
  `designationId` int(11) NOT NULL AUTO_INCREMENT,
  `designationName` varchar(50) NOT NULL,
  `createdBy` varchar(25) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `updatedBy` varchar(25) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`designationId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`designationId`, `designationName`, `createdBy`, `createdDate`, `updatedBy`, `updatedDate`, `status`) VALUES
(1, 'Teacher', NULL, NULL, NULL, NULL, 1),
(2, 'Bus Attender', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `diary_events`
--

CREATE TABLE IF NOT EXISTS `diary_events` (
  `eventId` int(11) NOT NULL AUTO_INCREMENT,
  `academicId` int(11) NOT NULL,
  `eventName` varchar(50) NOT NULL,
  `details` varchar(150) NOT NULL,
  `eventDate` date NOT NULL,
  `createdBy` varchar(25) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `updatedBy` varchar(25) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`eventId`),
  KEY `academicId` (`academicId`),
  KEY `academicId_2` (`academicId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `diary_event_banners`
--

CREATE TABLE IF NOT EXISTS `diary_event_banners` (
  `eventBannerId` int(11) NOT NULL AUTO_INCREMENT,
  `eventId` int(11) NOT NULL,
  `bannerImage` varchar(255) NOT NULL,
  `createdDate` datetime DEFAULT NULL,
  `creadedBy` varchar(50) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `updatedBy` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`eventBannerId`),
  KEY `eventId` (`eventId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `messageId` int(11) NOT NULL AUTO_INCREMENT,
  `staffId` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `heading` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sentDate` datetime NOT NULL,
  `createdBy` varchar(25) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `updatedBy` varchar(25) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`messageId`),
  KEY `staffId` (`staffId`),
  KEY `staffId_2` (`staffId`),
  KEY `studentId` (`studentId`),
  KEY `typeId` (`typeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`messageId`, `staffId`, `studentId`, `typeId`, `heading`, `content`, `sentDate`, `createdBy`, `createdDate`, `updatedBy`, `updatedDate`, `status`) VALUES
(1, 1, 1, 1, 'Testing', 'Please ignore', '2017-07-18 12:52:54', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `notificationId` int(11) NOT NULL AUTO_INCREMENT,
  `typeId` int(11) NOT NULL,
  `heading` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sentDate` datetime NOT NULL,
  `createdBy` varchar(25) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `updatedBy` varchar(25) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`notificationId`),
  KEY `typeId` (`typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `notification_types`
--

CREATE TABLE IF NOT EXISTS `notification_types` (
  `typeId` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(50) NOT NULL,
  `createdBy` varchar(25) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `updatedBy` varchar(25) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `notification_types`
--

INSERT INTO `notification_types` (`typeId`, `typeName`, `createdBy`, `createdDate`, `updatedBy`, `updatedDate`, `status`) VALUES
(1, 'Automatic', NULL, NULL, NULL, NULL, 1),
(2, 'Manual', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `reader_alert`
--

CREATE TABLE IF NOT EXISTS `reader_alert` (
  `alertId` int(11) NOT NULL AUTO_INCREMENT,
  `heading` varchar(50) NOT NULL,
  `message` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` varchar(10) NOT NULL,
  `creadedOn` datetime NOT NULL,
  `createdBy` varchar(25) NOT NULL,
  `updatedOn` datetime NOT NULL,
  `updatedBy` varchar(25) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`alertId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

-- --------------------------------------------------------

--
-- Table structure for table `school_academics`
--

CREATE TABLE IF NOT EXISTS `school_academics` (
  `academicId` int(11) NOT NULL AUTO_INCREMENT,
  `academicYear` varchar(20) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `workingDays` int(11) NOT NULL,
  `createdBy` varchar(25) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `updatedBy` varchar(25) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`academicId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `school_academics`
--

INSERT INTO `school_academics` (`academicId`, `academicYear`, `startDate`, `endDate`, `workingDays`, `createdBy`, `createdDate`, `updatedBy`, `updatedDate`, `status`) VALUES
(1, '2017-2018', '2017-07-18', '2018-07-18', 200, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `school_classes`
--

CREATE TABLE IF NOT EXISTS `school_classes` (
  `classId` int(11) NOT NULL AUTO_INCREMENT,
  `standardId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `createdBy` varchar(25) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `updatedBy` varchar(25) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`classId`),
  KEY `standardId` (`standardId`),
  KEY `sectionId` (`sectionId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `school_classes`
--

INSERT INTO `school_classes` (`classId`, `standardId`, `sectionId`, `createdBy`, `createdDate`, `updatedBy`, `updatedDate`, `status`) VALUES
(1, 1, 1, NULL, NULL, NULL, NULL, 1),
(2, 2, 1, NULL, NULL, NULL, NULL, 1),
(3, 3, 1, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `school_details`
--

CREATE TABLE IF NOT EXISTS `school_details` (
  `schoolId` int(11) NOT NULL AUTO_INCREMENT,
  `schoolName` varchar(250) NOT NULL,
  `email` varchar(255) NOT NULL,
  `noOfStudents` int(50) NOT NULL,
  `noOfstaffs` int(50) NOT NULL,
  `contactName` varchar(50) NOT NULL,
  `contactPhone` bigint(10) NOT NULL,
  `address` text NOT NULL,
  `country` varchar(150) NOT NULL,
  `implementationType` varchar(20) NOT NULL,
  `allocationMemory` int(10) NOT NULL,
  `startWorkingDay` varchar(10) DEFAULT NULL,
  `endWorkingDay` varchar(10) NOT NULL,
  `startTime` varchar(10) NOT NULL,
  `endTime` varchar(10) NOT NULL,
  `createdBy` varchar(25) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `updatedBy` varchar(25) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`schoolId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `school_details`
--

INSERT INTO `school_details` (`schoolId`, `schoolName`, `email`, `noOfStudents`, `noOfstaffs`, `contactName`, `contactPhone`, `address`, `country`, `implementationType`, `allocationMemory`, `startWorkingDay`, `endWorkingDay`, `startTime`, `endTime`, `createdBy`, `createdDate`, `updatedBy`, `updatedDate`, `status`) VALUES
(2, 'Myanmar School', 'ravipoornaapp@gmail.com', 20, 5, 'Ravi', 1111111111, 'Myanmar', 'Myanmar', 'BOTH', 1, '1', '6', '7:30 AM', '4:30 PM', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `school_students`
--

CREATE TABLE IF NOT EXISTS `school_students` (
  `studentId` int(11) NOT NULL AUTO_INCREMENT,
  `gateCardNo` varchar(100) DEFAULT NULL,
  `vehicleCardNo` varchar(100) DEFAULT NULL,
  `admissionNo` varchar(100) NOT NULL,
  `name` varchar(150) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `fatherName` varchar(100) NOT NULL,
  `fatherEmail` varchar(100) NOT NULL,
  `motherName` varchar(100) NOT NULL,
  `motherEmail` varchar(100) NOT NULL,
  `fatherPhone` bigint(10) NOT NULL,
  `motherPhone` bigint(10) NOT NULL,
  `guardianName` varchar(100) NOT NULL,
  `guardianEmail` varchar(100) NOT NULL,
  `guardianPhone` bigint(10) NOT NULL,
  `createdBy` varchar(25) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `updatedBy` varchar(25) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`studentId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `school_students`
--

INSERT INTO `school_students` (`studentId`, `gateCardNo`, `vehicleCardNo`, `admissionNo`, `name`, `photo`, `fatherName`, `fatherEmail`, `motherName`, `motherEmail`, `fatherPhone`, `motherPhone`, `guardianName`, `guardianEmail`, `guardianPhone`, `createdBy`, `createdDate`, `updatedBy`, `updatedDate`, `status`) VALUES
(1, NULL, NULL, '1', 'myanmar student1', 'profile_pic.png', 'myanmar father1', 'myanmar_f@gmail.com', 'myanmar mother1', 'XXX@GMAIL.COM', 1111111111, 1111111111, '', '', 0, NULL, NULL, NULL, NULL, 1),
(2, NULL, NULL, '2', 'myanmar student2', 'profile_pic.png', 'myanmar father2', 'myanmar_f@gmail.com', 'myanmar mother2', 'XXX@GMAIL.COM', 1111111111, 1111111111, '', '', 0, NULL, NULL, NULL, NULL, 1),
(3, NULL, NULL, '3', 'myanmar student3', 'profile_pic.png', 'myanmar dummy', 'myanmar_demo@gmail.com', 'myanmar mother3', 'XXX@GMAIL.COM', 1111111111, 1111111111, '', '', 0, NULL, NULL, NULL, NULL, 1),
(4, NULL, NULL, '4', 'myanmar student4', 'profile_pic.png', 'myanmar dummy', 'myanmar_demo@gmail.com', 'myanmar mother4', 'XXX@GMAIL.COM', 1111111111, 1111111111, '', '', 0, NULL, NULL, NULL, NULL, 1),
(5, NULL, NULL, '5', 'myanmar student5', 'profile_pic.png', 'myanmar dummy', 'myanmar_demo@gmail.com', 'myanmar mother5', 'XXX@GMAIL.COM', 1111111111, 1111111111, '', '', 0, NULL, NULL, NULL, NULL, 1),
(6, NULL, NULL, '6', 'myanmar student6', 'profile_pic.png', 'myanmar dummy', 'myanmar_demo@gmail.com', 'myanmar mother6', 'XXX@GMAIL.COM', 1111111111, 1111111111, '', '', 0, NULL, NULL, NULL, NULL, 1),
(7, NULL, NULL, '7', 'myanmar student7', 'profile_pic.png', 'myanmar dummy', 'myanmar_demo@gmail.com', 'myanmar mother7', 'XXX@GMAIL.COM', 1111111111, 1111111111, '', '', 0, NULL, NULL, NULL, NULL, 1),
(8, NULL, NULL, '8', 'myanmar student8', 'profile_pic.png', 'myanmar dummy', 'myanmar_demo@gmail.com', 'myanmar mother8', 'XXX@GMAIL.COM', 1111111111, 1111111111, '', '', 0, NULL, NULL, NULL, NULL, 1),
(9, NULL, NULL, '9', 'myanmar student9', 'profile_pic.png', 'myanmar dummy', 'myanmar_demo@gmail.com', 'myanmar mother9', 'XXX@GMAIL.COM', 1111111111, 1111111111, '', '', 0, NULL, NULL, NULL, NULL, 1),
(10, NULL, NULL, '10', 'myanmar student10', 'profile_pic.png', 'myanmar dummy', 'myanmar_demo@gmail.com', 'myanmar mother10', 'XXX@GMAIL.COM', 1111111111, 1111111111, '', '', 0, NULL, NULL, NULL, NULL, 1),
(11, NULL, NULL, '11', 'myanmar student11', 'profile_pic.png', 'myanmar dummy', 'myanmar_demo@gmail.com', 'myanmar mother11', 'XXX@GMAIL.COM', 1111111111, 1111111111, '', '', 0, NULL, NULL, NULL, NULL, 1),
(12, NULL, NULL, '12', 'myanmar student12', 'profile_pic.png', 'myanmar dummy', 'myanmar_demo@gmail.com', 'myanmar mother12', 'XXX@GMAIL.COM', 1111111111, 1111111111, '', '', 0, NULL, NULL, NULL, NULL, 1),
(13, NULL, NULL, '13', 'myanmar student13', 'profile_pic.png', 'myanmar dummy', 'myanmar_demo@gmail.com', 'myanmar mother13', 'XXX@GMAIL.COM', 1111111111, 1111111111, '', '', 0, NULL, NULL, NULL, NULL, 1),
(14, NULL, NULL, '14', 'myanmar student14', 'profile_pic.png', 'myanmar dummy', 'myanmar_demo@gmail.com', 'myanmar mother14', 'XXX@GMAIL.COM', 1111111111, 1111111111, '', '', 0, NULL, NULL, NULL, NULL, 1),
(15, NULL, NULL, '15', 'myanmar student15', 'profile_pic.png', 'myanmar dummy', 'myanmar_demo@gmail.com', 'myanmar mother15', 'XXX@GMAIL.COM', 1111111111, 1111111111, '', '', 0, NULL, NULL, NULL, NULL, 1),
(16, NULL, NULL, '16', 'myanmar student16', 'profile_pic.png', 'myanmar dummy', 'myanmar_demo@gmail.com', 'myanmar mother16', 'XXX@GMAIL.COM', 1111111111, 1111111111, '', '', 0, NULL, NULL, NULL, NULL, 1),
(17, NULL, NULL, '17', 'myanmar student17', 'profile_pic.png', 'myanmar dummy', 'myanmar_demo@gmail.com', 'myanmar mother17', 'XXX@GMAIL.COM', 1111111111, 1111111111, '', '', 0, NULL, NULL, NULL, NULL, 1),
(18, NULL, NULL, '18', 'myanmar student18', 'profile_pic.png', 'myanmar dummy', 'myanmar_demo@gmail.com', 'myanmar mother18', 'XXX@GMAIL.COM', 1111111111, 1111111111, '', '', 0, NULL, NULL, NULL, NULL, 1),
(19, NULL, NULL, '19', 'myanmar student19', 'profile_pic.png', 'myanmar dummy', 'myanmar_demo@gmail.com', 'myanmar mother19', 'XXX@GMAIL.COM', 1111111111, 1111111111, '', '', 0, NULL, NULL, NULL, NULL, 1),
(20, NULL, NULL, '20', 'myanmar student20', 'profile_pic.png', 'myanmar dummy', 'myanmar_demo@gmail.com', 'myanmar mother20', 'XXX@GMAIL.COM', 1111111111, 1111111111, '', '', 0, NULL, NULL, NULL, NULL, 1),
(21, NULL, NULL, '21', 'myanmar student21', 'profile_pic.png', 'myanmar dummy', 'myanmar_demo@gmail.com', 'myanmar mother21', 'XXX@GMAIL.COM', 1111111111, 1111111111, '', '', 0, NULL, NULL, NULL, NULL, 1),
(22, NULL, NULL, '22', 'myanmar student22', 'profile_pic.png', 'myanmar dummy', 'myanmar_demo@gmail.com', 'myanmar mother22', 'XXX@GMAIL.COM', 1111111111, 1111111111, '', '', 0, NULL, NULL, NULL, NULL, 1),
(23, NULL, NULL, '23', 'myanmar student23', 'profile_pic.png', 'myanmar dummy', 'myanmar_demo@gmail.com', 'myanmar mother23', 'XXX@GMAIL.COM', 1111111111, 1111111111, '', '', 0, NULL, NULL, NULL, NULL, 1),
(24, NULL, NULL, '24', 'myanmar student24', 'profile_pic.png', 'myanmar dummy', 'myanmar_demo@gmail.com', 'myanmar mother24', 'XXX@GMAIL.COM', 1111111111, 1111111111, '', '', 0, NULL, NULL, NULL, NULL, 1),
(25, NULL, NULL, '25', 'myanmar student25', 'profile_pic.png', 'myanmar dummy', 'myanmar_demo@gmail.com', 'myanmar mother25', 'XXX@GMAIL.COM', 1111111111, 1111111111, '', '', 0, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `school_vehicles`
--

CREATE TABLE IF NOT EXISTS `school_vehicles` (
  `vehicleId` int(11) NOT NULL AUTO_INCREMENT,
  `registrationNo` varchar(20) NOT NULL,
  `vehicleNo` varchar(20) NOT NULL,
  `typeId` int(11) NOT NULL,
  `ownedBySchool` tinyint(4) NOT NULL,
  `createdBy` varchar(25) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `updatedBy` varchar(25) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`vehicleId`),
  KEY `typeId` (`typeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `school_vehicles`
--

INSERT INTO `school_vehicles` (`vehicleId`, `registrationNo`, `vehicleNo`, `typeId`, `ownedBySchool`, `createdBy`, `createdDate`, `updatedBy`, `updatedDate`, `status`) VALUES
(1, 'MYM001', 'MYM 4561', 1, 0, NULL, NULL, NULL, NULL, 1),
(2, 'MYM002', 'MYM 4562', 1, 0, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE IF NOT EXISTS `sections` (
  `sectionId` int(11) NOT NULL AUTO_INCREMENT,
  `sectionName` varchar(100) NOT NULL,
  `createdBy` varchar(25) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `updatedBy` varchar(25) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`sectionId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`sectionId`, `sectionName`, `createdBy`, `createdDate`, `updatedBy`, `updatedDate`, `status`) VALUES
(1, 'A', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE IF NOT EXISTS `staffs` (
  `staffId` int(11) NOT NULL AUTO_INCREMENT,
  `staffCode` varchar(20) NOT NULL,
  `designationId` int(11) DEFAULT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `address` text NOT NULL,
  `phone` bigint(10) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `createdBy` varchar(25) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `updatedBy` varchar(25) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`staffId`),
  KEY `designationId` (`designationId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `staffs`
--

INSERT INTO `staffs` (`staffId`, `staffCode`, `designationId`, `firstName`, `lastName`, `username`, `password`, `email`, `address`, `phone`, `status`, `createdBy`, `createdDate`, `updatedBy`, `updatedDate`) VALUES
(1, 'MYM01', 1, 'Myanmar Teacher1', '', 'Myanmar Teacher1 ', '508395', 'mym_teacher1@poornaapp.com', 'Myanmar', 1111111111, 1, NULL, NULL, NULL, NULL),
(2, 'MYM02', 1, 'Myanmar Teacher2', '', 'Myanmar Teacher2 ', '442228', 'mym_teacher2@poornaapp.com', 'Myanmar', 1111111111, 1, NULL, NULL, NULL, NULL),
(3, 'MYM03', 1, 'Myanmar Teacher3', '', 'Myanmar Teacher3 ', '213660', 'mym_teacher3@poornaapp.com', 'Myanmar', 1111111111, 1, NULL, NULL, NULL, NULL),
(4, 'MYMB01', 2, 'myanmar', 'driver1', 'driver1', '194235', 'mymdriver1@poornaapp.com', 'Myanmar', 111111111, 1, NULL, NULL, NULL, NULL),
(5, 'MYMB02', 2, 'myanmar2', 'driver2', 'driver2', '373318', 'mymdriver2@poornaapp.com', 'Myanmar', 111111111, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff_attendance`
--

CREATE TABLE IF NOT EXISTS `staff_attendance` (
  `staffAttendanceId` int(11) NOT NULL AUTO_INCREMENT,
  `staffId` int(11) NOT NULL,
  `gateName` varchar(50) NOT NULL,
  `logType` varchar(20) NOT NULL,
  `logDate` datetime NOT NULL,
  `attendance` varchar(20) NOT NULL,
  `createdBy` varchar(25) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `updatedBy` varchar(25) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`staffAttendanceId`),
  KEY `staffId` (`staffId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `standards`
--

CREATE TABLE IF NOT EXISTS `standards` (
  `standardId` int(11) NOT NULL AUTO_INCREMENT,
  `standardName` varchar(50) NOT NULL,
  `createdBy` varchar(25) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `updatedBy` varchar(25) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`standardId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `standards`
--

INSERT INTO `standards` (`standardId`, `standardName`, `createdBy`, `createdDate`, `updatedBy`, `updatedDate`, `status`) VALUES
(1, '1', NULL, NULL, NULL, NULL, 1),
(2, '2', NULL, NULL, NULL, NULL, 1),
(3, '3', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student_classes`
--

CREATE TABLE IF NOT EXISTS `student_classes` (
  `mappingId` int(11) NOT NULL AUTO_INCREMENT,
  `studentId` int(11) NOT NULL,
  `classId` int(11) NOT NULL,
  `academicId` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`mappingId`),
  KEY `studentId` (`studentId`),
  KEY `classId` (`classId`),
  KEY `academicId` (`academicId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `student_classes`
--

INSERT INTO `student_classes` (`mappingId`, `studentId`, `classId`, `academicId`, `status`) VALUES
(1, 1, 1, 1, 1),
(2, 2, 1, 1, 1),
(3, 3, 1, 1, 1),
(4, 4, 1, 1, 1),
(5, 5, 1, 1, 1),
(6, 6, 1, 1, 1),
(7, 7, 1, 1, 1),
(8, 8, 1, 1, 1),
(9, 9, 1, 1, 1),
(10, 10, 1, 1, 1),
(11, 11, 2, 1, 1),
(12, 12, 2, 1, 1),
(13, 13, 2, 1, 1),
(14, 14, 2, 1, 1),
(15, 15, 2, 1, 1),
(16, 16, 2, 1, 1),
(17, 17, 2, 1, 1),
(18, 18, 2, 1, 1),
(19, 19, 2, 1, 1),
(20, 20, 2, 1, 1),
(21, 21, 3, 1, 1),
(22, 22, 3, 1, 1),
(23, 23, 3, 1, 1),
(24, 24, 3, 1, 1),
(25, 25, 3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student_leave`
--

CREATE TABLE IF NOT EXISTS `student_leave` (
  `leaveId` int(11) NOT NULL AUTO_INCREMENT,
  `studentId` int(11) NOT NULL,
  `heading` varchar(255) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `fromDate` date NOT NULL,
  `toDate` date NOT NULL,
  `approvalStatus` varchar(25) NOT NULL,
  `added_on` datetime NOT NULL,
  `createdBy` varchar(25) DEFAULT NULL,
  `updatedBy` varchar(25) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`leaveId`),
  KEY `studentId` (`studentId`),
  KEY `studentId_2` (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `student_marks_card`
--

CREATE TABLE IF NOT EXISTS `student_marks_card` (
  `markscardId` int(11) NOT NULL AUTO_INCREMENT,
  `studentId` int(11) NOT NULL,
  `examType` varchar(25) NOT NULL,
  `marksCard` varchar(100) NOT NULL,
  `createdBy` varchar(25) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `updatedBy` varchar(25) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`markscardId`),
  KEY `studentId` (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `student_staffs`
--

CREATE TABLE IF NOT EXISTS `student_staffs` (
  `mappingId` int(11) NOT NULL AUTO_INCREMENT,
  `studentId` int(11) NOT NULL,
  `staffId` int(11) NOT NULL,
  `assignedDate` date NOT NULL,
  `createdBy` varchar(25) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `updatedBy` varchar(25) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`mappingId`),
  KEY `studentId` (`studentId`),
  KEY `staffId` (`staffId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `student_vehicles`
--

CREATE TABLE IF NOT EXISTS `student_vehicles` (
  `mappingId` int(11) NOT NULL AUTO_INCREMENT,
  `studentId` int(11) NOT NULL,
  `assignedDate` date NOT NULL,
  `pickupVehicleId` int(11) DEFAULT NULL,
  `dropVehicleId` int(11) DEFAULT NULL,
  `createdBy` varchar(25) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `updatedBy` varchar(25) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`mappingId`),
  KEY `studentId` (`studentId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `student_vehicles`
--

INSERT INTO `student_vehicles` (`mappingId`, `studentId`, `assignedDate`, `pickupVehicleId`, `dropVehicleId`, `createdBy`, `createdDate`, `updatedBy`, `updatedDate`, `status`) VALUES
(1, 1, '2017-07-18', 1, 1, NULL, NULL, NULL, NULL, 1),
(2, 2, '2017-07-18', 1, 1, NULL, NULL, NULL, NULL, 1),
(3, 3, '2017-07-18', 1, 1, NULL, NULL, NULL, NULL, 1),
(4, 4, '2017-07-18', 1, 1, NULL, NULL, NULL, NULL, 1),
(5, 5, '2017-07-18', 1, 1, NULL, NULL, NULL, NULL, 1),
(6, 6, '2017-07-18', 1, 1, NULL, NULL, NULL, NULL, 1),
(7, 7, '2017-07-18', 1, 1, NULL, NULL, NULL, NULL, 1),
(8, 8, '2017-07-18', 1, 1, NULL, NULL, NULL, NULL, 1),
(9, 9, '2017-07-18', 1, 1, NULL, NULL, NULL, NULL, 1),
(10, 10, '2017-07-18', 1, 1, NULL, NULL, NULL, NULL, 1),
(11, 11, '2017-07-18', 2, 2, NULL, NULL, NULL, NULL, 1),
(12, 12, '2017-07-18', 2, 2, NULL, NULL, NULL, NULL, 1),
(13, 13, '2017-07-18', 2, 2, NULL, NULL, NULL, NULL, 1),
(14, 14, '2017-07-18', 2, 2, NULL, NULL, NULL, NULL, 1),
(15, 15, '2017-07-18', 2, 2, NULL, NULL, NULL, NULL, 1),
(16, 16, '2017-07-18', 2, 2, NULL, NULL, NULL, NULL, 1),
(17, 17, '2017-07-18', 2, 2, NULL, NULL, NULL, NULL, 1),
(18, 18, '2017-07-18', 2, 2, NULL, NULL, NULL, NULL, 1),
(19, 19, '2017-07-18', 2, 2, NULL, NULL, NULL, NULL, 1),
(20, 20, '2017-07-18', 2, 2, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `time_table_classes`
--

CREATE TABLE IF NOT EXISTS `time_table_classes` (
  `timeTableId` int(11) NOT NULL AUTO_INCREMENT,
  `classId` int(11) NOT NULL,
  `academicId` int(11) NOT NULL,
  `timeTable` varchar(100) NOT NULL,
  `createdBy` varchar(25) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `updatedBy` varchar(25) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`timeTableId`),
  KEY `academicId` (`academicId`),
  KEY `classId` (`classId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `travel_details`
--

CREATE TABLE IF NOT EXISTS `travel_details` (
  `detailsId` int(11) NOT NULL AUTO_INCREMENT,
  `staffId` int(11) NOT NULL,
  `vehicleId` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  `travelType` varchar(50) NOT NULL,
  `travelDate` date NOT NULL,
  `inTime` time NOT NULL,
  `outTime` time DEFAULT NULL,
  `inLocation` varchar(250) NOT NULL,
  `outLocation` varchar(250) NOT NULL,
  `comments` varchar(100) DEFAULT NULL,
  `isManual` tinyint(4) NOT NULL,
  `createdBy` varchar(25) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `updatedBy` varchar(25) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`detailsId`),
  KEY `staffId` (`staffId`,`vehicleId`,`studentId`),
  KEY `vehicleId` (`vehicleId`),
  KEY `studentId` (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_locations`
--

CREATE TABLE IF NOT EXISTS `vehicle_locations` (
  `locationId` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleId` int(11) NOT NULL,
  `staffId` int(11) NOT NULL,
  `travelDate` datetime NOT NULL,
  `travelType` varchar(50) NOT NULL,
  `lat` varchar(50) NOT NULL,
  `lng` varchar(50) NOT NULL,
  `location` text NOT NULL,
  `createdBy` varchar(25) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `updatedBy` varchar(25) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`locationId`),
  KEY `vehicleId` (`vehicleId`),
  KEY `staffId` (`staffId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_staffs`
--

CREATE TABLE IF NOT EXISTS `vehicle_staffs` (
  `mappingId` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleId` int(11) NOT NULL,
  `staffId` int(11) NOT NULL,
  `assignedDate` date NOT NULL,
  `travelType` varchar(50) NOT NULL,
  `createdBy` varchar(25) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `updatedBy` varchar(25) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`mappingId`),
  KEY `vehicleId` (`vehicleId`),
  KEY `staffId` (`staffId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `vehicle_staffs`
--

INSERT INTO `vehicle_staffs` (`mappingId`, `vehicleId`, `staffId`, `assignedDate`, `travelType`, `createdBy`, `createdDate`, `updatedBy`, `updatedDate`, `status`) VALUES
(1, 1, 2, '2017-07-19', 'BOTH', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_types`
--

CREATE TABLE IF NOT EXISTS `vehicle_types` (
  `typeId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `createdBy` varchar(25) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `updatedBy` varchar(25) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `vehicle_types`
--

INSERT INTO `vehicle_types` (`typeId`, `name`, `createdBy`, `createdDate`, `updatedBy`, `updatedDate`, `status`) VALUES
(1, 'Bus', NULL, NULL, NULL, NULL, 1),
(2, 'Van', NULL, NULL, NULL, NULL, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `school_students` (`studentId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`staffId`) REFERENCES `staffs` (`staffId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `class_staffs`
--
ALTER TABLE `class_staffs`
  ADD CONSTRAINT `class_staffs_ibfk_1` FOREIGN KEY (`classId`) REFERENCES `school_classes` (`classId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `class_staffs_ibfk_2` FOREIGN KEY (`staffId`) REFERENCES `staffs` (`staffId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `class_staffs_ibfk_3` FOREIGN KEY (`academicId`) REFERENCES `school_academics` (`academicId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `class_syllabus`
--
ALTER TABLE `class_syllabus`
  ADD CONSTRAINT `class_syllabus_ibfk_1` FOREIGN KEY (`classId`) REFERENCES `school_classes` (`classId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `class_syllabus_ibfk_2` FOREIGN KEY (`academicId`) REFERENCES `school_academics` (`academicId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `diary_events`
--
ALTER TABLE `diary_events`
  ADD CONSTRAINT `diary_events_ibfk_1` FOREIGN KEY (`academicId`) REFERENCES `school_academics` (`academicId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `diary_event_banners`
--
ALTER TABLE `diary_event_banners`
  ADD CONSTRAINT `diary_event_banners_ibfk_1` FOREIGN KEY (`eventId`) REFERENCES `diary_events` (`eventId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`typeId`) REFERENCES `notification_types` (`typeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`staffId`) REFERENCES `staffs` (`staffId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_ibfk_3` FOREIGN KEY (`studentId`) REFERENCES `school_students` (`studentId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`typeId`) REFERENCES `notification_types` (`typeId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `school_classes`
--
ALTER TABLE `school_classes`
  ADD CONSTRAINT `school_classes_ibfk_1` FOREIGN KEY (`standardId`) REFERENCES `standards` (`standardId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `school_classes_ibfk_2` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`sectionId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `school_vehicles`
--
ALTER TABLE `school_vehicles`
  ADD CONSTRAINT `school_vehicles_ibfk_1` FOREIGN KEY (`typeId`) REFERENCES `vehicle_types` (`typeId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staffs`
--
ALTER TABLE `staffs`
  ADD CONSTRAINT `staffs_ibfk_1` FOREIGN KEY (`designationId`) REFERENCES `designations` (`designationId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff_attendance`
--
ALTER TABLE `staff_attendance`
  ADD CONSTRAINT `staff_attendance_ibfk_2` FOREIGN KEY (`staffId`) REFERENCES `staffs` (`staffId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_classes`
--
ALTER TABLE `student_classes`
  ADD CONSTRAINT `student_classes_ibfk_1` FOREIGN KEY (`classId`) REFERENCES `school_classes` (`classId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_classes_ibfk_2` FOREIGN KEY (`academicId`) REFERENCES `school_academics` (`academicId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_classes_ibfk_3` FOREIGN KEY (`studentId`) REFERENCES `school_students` (`studentId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_leave`
--
ALTER TABLE `student_leave`
  ADD CONSTRAINT `student_leave_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `school_students` (`studentId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_marks_card`
--
ALTER TABLE `student_marks_card`
  ADD CONSTRAINT `student_marks_card_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `school_students` (`studentId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_staffs`
--
ALTER TABLE `student_staffs`
  ADD CONSTRAINT `student_staffs_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `school_students` (`studentId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_staffs_ibfk_2` FOREIGN KEY (`staffId`) REFERENCES `staffs` (`staffId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_vehicles`
--
ALTER TABLE `student_vehicles`
  ADD CONSTRAINT `student_vehicles_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `school_students` (`studentId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `time_table_classes`
--
ALTER TABLE `time_table_classes`
  ADD CONSTRAINT `time_table_classes_ibfk_1` FOREIGN KEY (`classId`) REFERENCES `school_classes` (`classId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `time_table_classes_ibfk_2` FOREIGN KEY (`academicId`) REFERENCES `school_academics` (`academicId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `travel_details`
--
ALTER TABLE `travel_details`
  ADD CONSTRAINT `travel_details_ibfk_1` FOREIGN KEY (`vehicleId`) REFERENCES `school_vehicles` (`vehicleId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `travel_details_ibfk_2` FOREIGN KEY (`staffId`) REFERENCES `staffs` (`staffId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `travel_details_ibfk_3` FOREIGN KEY (`studentId`) REFERENCES `school_students` (`studentId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vehicle_locations`
--
ALTER TABLE `vehicle_locations`
  ADD CONSTRAINT `vehicle_locations_ibfk_1` FOREIGN KEY (`vehicleId`) REFERENCES `school_vehicles` (`vehicleId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vehicle_locations_ibfk_2` FOREIGN KEY (`staffId`) REFERENCES `staffs` (`staffId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vehicle_staffs`
--
ALTER TABLE `vehicle_staffs`
  ADD CONSTRAINT `vehicle_staffs_ibfk_1` FOREIGN KEY (`vehicleId`) REFERENCES `school_vehicles` (`vehicleId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vehicle_staffs_ibfk_2` FOREIGN KEY (`staffId`) REFERENCES `staffs` (`staffId`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
