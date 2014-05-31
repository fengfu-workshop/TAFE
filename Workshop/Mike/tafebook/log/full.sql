-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2014 at 04:11 AM
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`commentId`, `postId`, `personId`, `commentDateTime`, `comment`) VALUES
(1, 1, 3, '2014-05-29 00:00:00', '$datetime = strtotime($row->createdate);\r\n$mysqldate = date("m/d/y g:i A", $datetime);'),
(2, 1, 5, '2014-05-30 06:17:13', 'this answer is confusing the topic '),
(7, 4, 2, '0000-00-00 00:00:00', '<div class=''$pErrorLevel''>\n	<h3>We have a problem...</h3>\n	<p>$pUserMsg</p>\n	<p>Our tech guys will already be working on the issue!</p>\n</div>'),
(8, 4, 2, '0000-00-00 00:00:00', 'I''m seeking for a job.'),
(9, 4, 2, '0000-00-00 00:00:00', '                <section id="new-post" class="new-post">\n\n                    <h2>Add a post</h2>\n\n                    <form action="" method="post" class="clearFix">\n                        <textarea name="new-post-content" id="new-post-content" cols="30" rows="10"></textarea>\n                        <input type="submit" name="new-post-submit" value="Send" />\n                    </form>\n                </section>'),
(10, 11, 2, '0000-00-00 00:00:00', 'Cross-browser\nAre you an Apple fan? Or maybe Microsoft? It doesn''t matter, our WYSIWYG text editor will work the same on Safari, Internet Explorer and other browsers.'),
(12, 11, 2, '0000-00-00 00:00:00', 'Complete Functionality\nSimple and yet the most complete WYSIWYG text editor with lots of customization options. Style it your way for the best editing experience!'),
(28, 11, 7, '0000-00-00 00:00:00', '<h1>Contact</h1>\n\n                <p>Have some contact information:</p>\n\n                <table><tr><th>Phone:</th>\n                        <td>xx xxxx xxxx</td>\n                    </tr><tr><th>Email:</th>\n                        <td>info@tafebook.com</td>\n                    </tr><tr><th>Address:</th>\n                        <td>123 Somewhere St<br>Someville, NSW 2222</td>\n                    </tr></table>'),
(34, 11, 7, '2014-05-31 11:50:52', '<p>Hello <i>There</i></p>\n');

-- --------------------------------------------------------

--
-- Table structure for table `friendship`
--


CREATE TABLE IF NOT EXISTS `friendship` (
  `personId1` int(10) unsigned NOT NULL,
  `personId2` int(10) unsigned NOT NULL,
  PRIMARY KEY (`personId1`,`personId2`),
  KEY `personId2` (`personId2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `friendship`
--

INSERT INTO `friendship` (`personId1`, `personId2`) VALUES
(2, 1),
(3, 1),
(5, 1),
(1, 2),
(6, 2),
(1, 3),
(6, 3),
(1, 5),
(3, 5),
(1, 6),
(2, 6),
(5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--


CREATE TABLE IF NOT EXISTS `message` (
  `messageId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `personFrom` int(10) unsigned NOT NULL,
  `personTo` int(10) unsigned NOT NULL,
  `messageDateTime` datetime NOT NULL,
  `message` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`messageId`),
  KEY `personFrom` (`personFrom`),
  KEY `personTo` (`personTo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`messageId`, `personFrom`, `personTo`, `messageDateTime`, `message`) VALUES
(1, 1, 2, '2014-05-30 04:58:40', 'Wolves GM: Love talks haven''t heated up yet'),
(2, 2, 6, '2014-05-30 15:26:05', 'Building Dynamic Websites with PHP and MySQL'),
(3, 6, 2, '2014-05-30 15:36:57', 'I saw the video on Pluralsight'),
(4, 2, 6, '2014-05-30 15:37:33', 'Is it good?');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`personId`, `email`, `password`, `firstName`, `lastName`, `about`, `gender`) VALUES
(1, 'abc@abc.com', '123', 'ABC', 'COM', 'From ABC.COM', 'M'),
(2, 'michael.jordan@gmail.com', '123', 'Michael', 'Jordan', 'I love basketball', 'M'),
(3, 'yanny.tseng@gmail.com', '123', 'Yanny', 'Tseng', 'I was the LPGA champion', 'F'),
(5, 'tiger.woods@gmail.com', '123', 'Tiger', 'Woods', 'I love golf', 'M'),
(6, 'hornsby.tafe@gmail.com', '123', 'Hornsby', 'TAFE', 'I lived in Hornsby', 'F'),
(7, 'dixon.lawson@gmail.com', 'puRYZrfk52rmo', 'Dixon', 'Lawson', 'I am Dixon Lawson', 'M'),
(8, 'test.only@gmail.com', 'puRYZrfk52rmo', NULL, NULL, NULL, NULL),
(12, 'first@gmail.com', 'puRYZrfk52rmo', NULL, NULL, NULL, NULL),
(13, 'Adam.Scott@gmail.com', 'puRYZrfk52rmo', 'Adam', 'Lawson', 'I am Adam Lawson', 'M'),
(15, 'Tommy.Jones@gmail.com', 'puRYZrfk52rmo', 'Tommy', 'Jones', 'I am Tommy Jones', 'M'),
(16, 'Marcus.Hams@gmail.com', 'puRYZrfk52rmo', 'Marcus', 'Hams', 'I am Marcus Hams', 'M');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--


CREATE TABLE IF NOT EXISTS `post` (
  `postId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `personId` int(10) unsigned NOT NULL,
  `postDateTime` datetime NOT NULL,
  `post` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`postId`),
  KEY `personId` (`personId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`postId`, `personId`, `postDateTime`, `post`) VALUES
(1, 2, '2014-05-29 12:05:31', 'Whats the correct format using the date() function in PHP to insert into a MySQL datetime type column?'),
(2, 5, '2014-05-29 13:45:10', 'Adam Scott wins Colonial, beating Jason Dufner in playoff'),
(3, 1, '2014-05-29 23:11:48', 'Why sublime text better than notepad++\r\n&lt;script&gt; alert(&quot;Hello&quot;); &lt;/script&gt;'),
(4, 2, '2014-05-30 00:53:22', 'Accessing a Database from PHP'),
(11, 2, '2014-05-30 13:47:16', 'Froala WYSIWYG Editor\r\nA beautiful jQuery WYSIWYG text editor built on the latest technologies and according to the latest industry trends.');

-- --------------------------------------------------------

--
-- Table structure for table `postlike`
--

CREATE TABLE IF NOT EXISTS `postlike` (
  `postId` int(10) unsigned NOT NULL,
  `personId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`postId`,`personId`),
  KEY `personId` (`personId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `postlike`
--

INSERT INTO `postlike` (`postId`, `personId`) VALUES
(2, 1),
(3, 1),
(11, 1),
(11, 2),
(4, 7),
(11, 7),
(11, 8),
(11, 12);

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
