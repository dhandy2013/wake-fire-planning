-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jun 24, 2020 at 01:16 AM
-- Server version: 5.7.26
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `NorthernWake`
--

-- --------------------------------------------------------

--
-- Table structure for table `ResponseTimeDept`
--

CREATE TABLE `ResponseTimeDept` (
  `ID` int(50) UNSIGNED NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Identifier` varchar(50) NOT NULL,
  `RuralID` varchar(200) NOT NULL,
  `CityID` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ResponseTimeDept`
--

INSERT INTO `ResponseTimeDept` (`ID`, `Name`, `Identifier`, `RuralID`, `CityID`) VALUES
(1, 'Apex Fire', 'AF', 'AFD RURAL', 'AFD CITY'),
(2, 'Durham Highway', 'DH', 'DHFD RURAL', 'DHFD CITY'),
(3, 'Eastern Wake', 'EW', 'EWFD RURAL', 'EWFD CITY'),
(4, 'Fairview', 'FF', 'FFD RURAL', 'FFD CITY'),
(5, 'Fuquay Varina', 'FV', 'FVFD RURAL', 'FVFD CITY'),
(6, 'Garner', 'GF', 'GFD RURAL', 'GFD CITY'),
(7, 'Hopkins', 'HO', 'HOPFD RURAL', 'HOFD CITY'),
(8, 'Holly Springs', 'HS', 'HSFD RURAL', 'HSFD CITY'),
(9, 'Knightdale City', 'KC', 'KFD RURAL', 'KFD CITY'),
(10, 'Morrisville', 'MF', 'MFD RURAL', 'MFD CITY'),
(11, 'New Hope', 'NH', 'NHFD RURAL', 'NHFD CITY'),
(12, 'Northern Wake', 'NW', 'NWFD RURAL', 'NWFD CITY'),
(13, 'Rolesville', 'RV', 'ROFD RURAL', 'ROFD CITY'),
(14, 'Swift Creek', 'SC', 'SCFD RURAL', 'SCFD CITY'),
(15, 'Wendell', 'WE', 'WFD RURAL', 'WFD CITY'),
(16, 'Wake Forest', 'WF', 'WFFD RURAL', 'WFFD CITY'),
(17, 'Western Wake', 'WW', 'WWFD RURAL', 'WWFD CITY'),
(18, 'Zebulon', 'ZF', 'ZFD RURAL', 'ZFD CITY');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ResponseTimeDept`
--
ALTER TABLE `ResponseTimeDept`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ResponseTimeDept`
--
ALTER TABLE `ResponseTimeDept`
  MODIFY `ID` int(50) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
