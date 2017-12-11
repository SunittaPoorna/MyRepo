-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 11, 2017 at 12:12 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rk_demo`
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
  `status` tinyint(4) NOT NULL,
  UNIQUE KEY `settingId` (`settingId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `phone` varchar(50) DEFAULT NULL,
  `roleId` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE IF NOT EXISTS `email_templates` (
  `templateId` int(11) NOT NULL AUTO_INCREMENT,
  `templateName` varchar(150) NOT NULL,
  `subject` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `signature` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `createdDate` datetime NOT NULL,
  `updatedDate` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  UNIQUE KEY `templateId` (`templateId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE IF NOT EXISTS `schools` (
  `schoolId` int(11) NOT NULL AUTO_INCREMENT,
  `schoolName` varchar(250) NOT NULL,
  `address` text NOT NULL,
  `country` varchar(150) NOT NULL,
  `implementationType` varchar(20) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`schoolId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

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
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`academicId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `school_details`
--

CREATE TABLE IF NOT EXISTS `school_details` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sent_email`
--

CREATE TABLE IF NOT EXISTS `sent_email` (
  `sentId` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `subject` varchar(150) NOT NULL,
  `message` text NOT NULL,
  `sentDate` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`sentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE IF NOT EXISTS `staffs` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `staffs_school`
--

CREATE TABLE IF NOT EXISTS `staffs_school` (
  `mappingId` int(11) NOT NULL AUTO_INCREMENT,
  `staffId` int(11) NOT NULL,
  `email` varchar(150) NOT NULL,
  `url` varchar(200) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`mappingId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(150) NOT NULL,
  `name` varchar(200) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `passCode` varchar(50) NOT NULL,
  `deviceType` varchar(50) NOT NULL,
  `deviceId` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`userId`),
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=380 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_schools`
--

CREATE TABLE IF NOT EXISTS `user_schools` (
  `mappingId` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(200) NOT NULL,
  `schoolId` int(11) NOT NULL,
  `db` varchar(150) NOT NULL,
  `url` varchar(250) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`mappingId`),
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=407 ;

-- --------------------------------------------------------

--
-- Table structure for table `versions`
--

CREATE TABLE IF NOT EXISTS `versions` (
  `versionId` int(11) NOT NULL AUTO_INCREMENT,
  `versionCode` int(11) NOT NULL,
  `updatedDate` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`versionId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
