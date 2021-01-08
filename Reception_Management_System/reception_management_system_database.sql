-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2021 at 04:56 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reception_management_system_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email_id` varchar(100) NOT NULL,
  `contact_number` int(11) NOT NULL,
  `salary` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `name`, `gender`, `designation`, `address`, `email_id`, `contact_number`, `salary`) VALUES
(1, 'Tousif', 'Male', 'Owner/Boss', 'address 1', 'tousif@gmail.com', 11111, 50000),
(2, 'Evan', 'Male', 'Receptionist', 'address-2', 'evan@gmail.com', 11112, 2000),
(3, 'Farjana', 'Female', 'Business Analyst', 'adress-3', 'farjana@gnial.com', 55555, 2020);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `username`, `employee_id`, `password`) VALUES
(1, 'tousif', 1, '12345'),
(2, 'evan', 2, '12345');

-- --------------------------------------------------------

--
-- Stand-in structure for view `loginview`
-- (See below for the actual view)
--
CREATE TABLE `loginview` (
`id` int(11)
,`employee_id` int(11)
,`username` varchar(100)
,`password` varchar(100)
,`designation` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `visitor`
--

CREATE TABLE `visitor` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `relationship` varchar(100) NOT NULL,
  `purpose` varchar(500) NOT NULL,
  `occupation` varchar(100) NOT NULL,
  `office_name` varchar(100) DEFAULT NULL,
  `email_id` varchar(100) DEFAULT NULL,
  `contact_number` int(11) NOT NULL,
  `visiting_date` date NOT NULL,
  `visiting_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `visitor`
--

INSERT INTO `visitor` (`id`, `name`, `gender`, `employee_id`, `relationship`, `purpose`, `occupation`, `office_name`, `email_id`, `contact_number`, `visiting_date`, `visiting_time`) VALUES
(2, 'abdullah', 'Male', 3, 'Professional', 'hudai', 'php developer', 'PHP', 'ab@gmail.com', 555555, '2021-01-07', '2021-01-07 20:35:34'),
(3, 'ab', 'Male', 1, 'Professional', 'vendor talks', 'engineer', 'phpeng', 'aaaa', 1521432679, '2021-01-07', '2021-01-07 21:49:25');

-- --------------------------------------------------------

--
-- Stand-in structure for view `visitoremployeeview`
-- (See below for the actual view)
--
CREATE TABLE `visitoremployeeview` (
`visiting_time` datetime
,`visitor_id` int(11)
,`visitor_name` varchar(100)
,`employee_id` int(11)
,`employee_name` varchar(100)
,`relationship` varchar(100)
,`purpose` varchar(500)
);

-- --------------------------------------------------------

--
-- Structure for view `loginview`
--
DROP TABLE IF EXISTS `loginview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `loginview`  AS SELECT `login`.`id` AS `id`, `employee`.`id` AS `employee_id`, `login`.`username` AS `username`, `login`.`password` AS `password`, `employee`.`designation` AS `designation` FROM (`login` join `employee` on(`login`.`employee_id` = `employee`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `visitoremployeeview`
--
DROP TABLE IF EXISTS `visitoremployeeview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `visitoremployeeview`  AS SELECT `visitor`.`visiting_time` AS `visiting_time`, `visitor`.`id` AS `visitor_id`, `visitor`.`name` AS `visitor_name`, `employee`.`id` AS `employee_id`, `employee`.`name` AS `employee_name`, `visitor`.`relationship` AS `relationship`, `visitor`.`purpose` AS `purpose` FROM (`visitor` join `employee` on(`visitor`.`employee_id` = `employee`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contact_number` (`contact_number`),
  ADD UNIQUE KEY `email_id` (`email_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `visitor`
--
ALTER TABLE `visitor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `visitor`
--
ALTER TABLE `visitor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);

--
-- Constraints for table `visitor`
--
ALTER TABLE `visitor`
  ADD CONSTRAINT `visitor_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
