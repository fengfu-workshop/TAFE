-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2014 at 05:51 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tafebook`
--
CREATE DATABASE IF NOT EXISTS `tafebook` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `tafebook`;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `friendship`;
DROP TABLE IF EXISTS `comment`;
DROP TABLE IF EXISTS `message`;
DROP TABLE IF EXISTS `postlike`;
DROP TABLE IF EXISTS `post`;
DROP TABLE IF EXISTS `person`;

CREATE TABLE IF NOT EXISTS `comment` (
  `commentId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `postId` int(10) unsigned NOT NULL,
  `personId` int(10) unsigned NOT NULL,
  `commentDateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`commentId`),
  KEY `postId` (`postId`),
  KEY `personId` (`personId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `friendship`
--

DROP TABLE IF EXISTS `friendship`;
CREATE TABLE IF NOT EXISTS `friendship` (
  `personId1` int(10) unsigned NOT NULL,
  `personId2` int(10) unsigned NOT NULL,
  PRIMARY KEY (`personId1`,`personId2`),
  KEY `personId2` (`personId2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `messageId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `personFrom` int(10) unsigned NOT NULL,
  `personTo` int(10) unsigned NOT NULL,
  `messageDateTime` datetime NOT NULL,
  `message` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`messageId`),
  KEY `personFrom` (`personFrom`),
  KEY `personTo` (`personTo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
CREATE TABLE IF NOT EXISTS `person` (
  `personId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(200) NOT NULL,
  `password` char(40) NOT NULL,
  `firstName` varchar(80) DEFAULT NULL,
  `lastName` varchar(80) DEFAULT NULL,
  `about` varchar(1000) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  PRIMARY KEY (`personId`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `postId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `personId` int(10) unsigned NOT NULL,
  `postDateTime` datetime NOT NULL,
  `post` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`postId`),
  KEY `personId` (`personId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `postlike`
--

DROP TABLE IF EXISTS `postlike`;
CREATE TABLE IF NOT EXISTS `postlike` (
  `postId` int(10) unsigned NOT NULL,
  `personId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`postId`,`personId`),
  KEY `personId` (`personId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`postId`) REFERENCES `post` (`postId`) ON DELETE CASCADE,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`personId`) REFERENCES `person` (`personId`) ON DELETE CASCADE;

--
-- Constraints for table `friendship`
--
ALTER TABLE `friendship`
  ADD CONSTRAINT `friendship_ibfk_1` FOREIGN KEY (`personId1`) REFERENCES `person` (`personId`) ON DELETE CASCADE,
  ADD CONSTRAINT `friendship_ibfk_2` FOREIGN KEY (`personId2`) REFERENCES `person` (`personId`) ON DELETE CASCADE;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`personFrom`) REFERENCES `person` (`personId`) ON DELETE CASCADE,
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`personTo`) REFERENCES `person` (`personId`) ON DELETE CASCADE;

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`personId`) REFERENCES `person` (`personId`) ON DELETE CASCADE;

--
-- Constraints for table `postlike`
--
ALTER TABLE `postlike`
  ADD CONSTRAINT `postlike_ibfk_1` FOREIGN KEY (`postId`) REFERENCES `post` (`postId`) ON DELETE CASCADE,
  ADD CONSTRAINT `postlike_ibfk_2` FOREIGN KEY (`personId`) REFERENCES `person` (`personId`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

INSERT INTO person (email, password, firstName, lastName, about, gender) VALUES ('michael.jordan@gmail.com', 'puRYZrfk52rmo', 'Michael', 'Jordan', 'I am Michael Jordan', 'M');
INSERT INTO person (email, password, firstName, lastName, about, gender) VALUES ('adam.scott@gmail.com', 'puRYZrfk52rmo', 'Adam', 'Scott', 'I am Adam Lawson', 'M');
INSERT INTO person (email, password, firstName, lastName, about, gender) VALUES ('tiger.Woods@gmail.com', 'puRYZrfk52rmo', 'Tiger', 'Woords', 'I am Tiger Woords', 'M');
INSERT INTO person (email, password, firstName, lastName, about, gender) VALUES ('tommy.jones@gmail.com', 'puRYZrfk52rmo', 'Tommy', 'Jones', 'I am Tommy Jones', 'M');
INSERT INTO person (email, password, firstName, lastName, about, gender) VALUES ('marcus.hams@gmail.com', 'puRYZrfk52rmo', 'Marcus', 'Hams', 'I am Marcus Hams', 'M');
INSERT INTO person (email, password, firstName, lastName, about, gender) VALUES ('yanny.tseng@gmail.com', 'puRYZrfk52rmo', 'Yanny', 'Tseng', 'I am Yanny Tseng', 'F');

INSERT INTO friendship (personId1, personId2) VALUES (1, 2);
INSERT INTO friendship (personId1, personId2) VALUES (2, 1);
INSERT INTO friendship (personId1, personId2) VALUES (1, 3);
INSERT INTO friendship (personId1, personId2) VALUES (3, 1);
INSERT INTO friendship (personId1, personId2) VALUES (1, 4);
INSERT INTO friendship (personId1, personId2) VALUES (4, 1);
INSERT INTO friendship (personId1, personId2) VALUES (1, 5);
INSERT INTO friendship (personId1, personId2) VALUES (5, 1);
INSERT INTO friendship (personId1, personId2) VALUES (1, 6);
INSERT INTO friendship (personId1, personId2) VALUES (6, 1);

INSERT INTO friendship (personId1, personId2) VALUES (2, 3);
INSERT INTO friendship (personId1, personId2) VALUES (3, 2);
INSERT INTO friendship (personId1, personId2) VALUES (2, 4);
INSERT INTO friendship (personId1, personId2) VALUES (4, 2);
INSERT INTO friendship (personId1, personId2) VALUES (2, 5);
INSERT INTO friendship (personId1, personId2) VALUES (5, 2);
INSERT INTO friendship (personId1, personId2) VALUES (2, 6);
INSERT INTO friendship (personId1, personId2) VALUES (6, 2);

INSERT INTO friendship (personId1, personId2) VALUES (3, 4);
INSERT INTO friendship (personId1, personId2) VALUES (4, 3);
INSERT INTO friendship (personId1, personId2) VALUES (3, 5);
INSERT INTO friendship (personId1, personId2) VALUES (5, 3);
INSERT INTO friendship (personId1, personId2) VALUES (3, 6);
INSERT INTO friendship (personId1, personId2) VALUES (6, 3);

INSERT INTO post (personId, postDateTime, post) VALUES (1, '2014-5-31', 'How can I see the specific value of the sql_mode?');
INSERT INTO post (personId, postDateTime, post) VALUES (2, '2014-6-1', 'Building Dynamic Websites with PHP and MySQL');
INSERT INTO post (personId, postDateTime, post) VALUES (3, '2014-6-2', 'Froala Editor is an easy to include and easy to use plugin');
