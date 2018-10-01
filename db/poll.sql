-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 02, 2017 at 04:33 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poll`
--

-- --------------------------------------------------------

--
-- Table structure for table `poll`
--

CREATE TABLE `poll` (
  `poll_id` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `question` varchar(500) NOT NULL,
  `choice1` varchar(200) NOT NULL,
  `choice2` varchar(200) NOT NULL,
  `choice3` varchar(200) NOT NULL,
  `choice4` varchar(200) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `poll`
--

INSERT INTO `poll` (`poll_id`, `email`, `question`, `choice1`, `choice2`, `choice3`, `choice4`, `start_date`, `end_date`) VALUES
(10, 'mangesh@gmail.com', 'which mobile screen is more usable?', '4.5 nich', '5.0 inch', '5.5 inch', '6.0 inch', '2017-10-25', '2017-10-28'),
(9, 'sandipkengar@gmail.com', 'who is best actor from bollywood?', 'salman', 'sharukh', 'amir', 'hritik', '2017-10-25', '2017-10-29'),
(8, 'sandipkengar@gmail.com', 'who is next president of india?', 'a', 'b', 'c', 'd', '2017-10-24', '2017-10-26'),
(7, 'sandipkengar@gmail.com', 'who is best cricketer from india?', 'sachin', 'dhoni', 'virat', 'hardik', '2017-10-26', '2017-10-28'),
(11, 'mangesh123@gmail.com', 'who is best leader in india?', 'rahul gandhi', 'narendra modi', 'mayavati', 'lalu prasad', '2017-10-30', '2017-10-31'),
(12, 'v1@gmail.com', 'who is best singer??', 'sonu nigam', 'kailash kahir', 'lata mangeshkar', 'shan', '2017-10-31', '2017-11-02'),
(13, 'sandipkengar@gmail.com', 'who is best cricketer from india?', 'sachin', 'sevag', 'yuvraj', 'dhoni', '2017-11-01', '2017-11-03');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `username` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `date` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`username`, `email`, `mobile`, `password`, `date`) VALUES
('', 'sandipkengar@gmail.com', 8898856624, 'sandip', '26-10-2017'),
('mangesh', 'mangesh@gmail.com', 8851425412, 'sandip', '27-10-2017'),
('pratik', 'pratik@gmail.com', 7745121254, 'sandip', '29-10-2017'),
('mukhi', 'mukhi@gmail.com', 7745214521, 'sandip', '29-10-2017'),
('sandip', 'sunil@gmail.com', 7744521232, 'sandip', '02-11-2017'),
('admin', 'kengar@gmail.com', 7744521232, 'sandip', '02-11-2017'),
('a', 'a@gamil.com', 33, 'sandip', '29-10-2017'),
('b', 'b@gmail.com', 64, 'sandip', '29-10-2017'),
('anurag', 'anurag@gmail.com', 7752365211, 'sandip', '29-10-2017'),
('ravi', 'ravi@gmail.com', 44, 'sandip', '29-10-2017'),
('m', 'mahdsask@gmail.com', 4646464, 'sandip', '29-10-2017'),
('mangesh', 'mangesh123@gmail.com', 7756254124, 'sandip', '30-10-2017'),
('rahul', 'rahul@gmail.com', 775485245, 'sandip', '31-10-2017'),
('vivek', 'v1@gmail.com', 646, 'sandip', '31-10-2017'),
('sagar', 's@gmail.com', 77544, 'sandip', '31-10-2017'),
('admin', 'sandi8@gmail.com', 7744521232, 'x', '02-11-2017');

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `rid` int(11) NOT NULL,
  `poll_id` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `answer` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`rid`, `poll_id`, `email`, `answer`) VALUES
(19, 9, 'mahdsask@gmail.com', 'amir'),
(14, 9, 'ram@gmail.com', 'amir'),
(18, 9, 'ravi@gmail.com', 'amir'),
(16, 9, 'b@gmail.com', 'salman'),
(17, 9, 'anurag@gmail.com', 'amir'),
(12, 9, 'mukhi@gmail.com', 'hritik'),
(8, 9, 'sandipkengar@gmail.com', 'hritik'),
(9, 9, 'mangesh@gmail.com', 'hritik'),
(10, 9, 'sandipkengar@gmail.com', 'sharukh'),
(11, 9, 'pratik@gmail.com', 'hritik'),
(20, 9, 'v@gmail.com', 'sharukh'),
(21, 11, 'mangesh123@gmail.com', 'narendra modi'),
(22, 11, 'sandipkengar@gmail.com', 'narendra modi'),
(23, 11, 'rahul@gmail.com', 'rahul gandhi'),
(24, 11, 'a@gmail.com', 'mayavati'),
(25, 11, 'v1@gmail.com', 'rahul gandhi'),
(26, 12, 'v1@gmail.com', 'sonu nigam'),
(27, 12, 'sandipkengar@gmail.com', 'lata mangeshkar'),
(28, 12, 's@gmail.com', 'kailash kahir'),
(29, 11, 's@gmail.com', 'narendra modi'),
(30, 12, 'manoj@gmail.com', 'shan'),
(31, 12, 'mangesh12@gmail.com', 'lata mangeshkar'),
(32, 13, 'mangesh12@gmail.com', 'yuvraj'),
(33, 13, 'sandipkengar@gmail.com', 'dhoni');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `poll`
--
ALTER TABLE `poll`
  ADD PRIMARY KEY (`poll_id`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`rid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `poll`
--
ALTER TABLE `poll`
  MODIFY `poll_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
