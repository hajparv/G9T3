-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 01, 2023 at 05:08 PM
-- Server version: 5.7.39
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `healthrecord`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `time` time NOT NULL,
  `date` date NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `service` varchar(255) NOT NULL,
  `special_request` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `name`, `email`, `time`, `date`, `mobile`, `service`, `special_request`, `created_at`) VALUES
(1, 'John Doe', 'johndoe@example.com', '10:00:00', '2023-11-01', '1234567890', 'Consultation', 'Any special request', '2023-11-01 16:13:01');

-- --------------------------------------------------------

--
-- Table structure for table `healthrecord`
--

CREATE TABLE `healthrecord` (
  `recordID` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `date` varchar(20) NOT NULL,
  `location` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `healthrecord`
--

INSERT INTO `healthrecord` (`recordID`, `name`, `date`, `location`) VALUES
(1, 'COVID-19 PFIZER-BION', '23 Dec 2021', 'FULLERTON HEALTH VACCINATION CENTRE @JALAN BESAR'),
(2, 'COVID-19 PFIZER-BION', '10 Jul 2021', 'FULLERTON HEALTH VACCINATION CENTRE @JALAN BESAR'),
(3, 'COVID-19 PFIZER-BION', '01 Jun 2021', 'FULLERTON HEALTH VACCINATION CENTRE @JALAN BESAR'),
(4, 'Measles (AMI)', '10 May 2010', 'HOUGANG POLYCLINIC'),
(5, 'Poliomyelitis (SAB)', '20 Mar 2000', 'OVERSEAS IMMUNISATION'),
(6, 'Tetanus Toxoid, Redu', ' 01 Jul 2014', 'HOUGANG POLYCLINIC'),
(7, 'Diphtheria/Tetanus w', '09 Aug 2001', 'OVERSEAS IMMUNISATION'),
(8, 'Inactivated Polio Va', '09 Aug 2001', 'OVERSEAS IMMUNISATION');

-- --------------------------------------------------------

--
-- Table structure for table `paymentrecord`
--

CREATE TABLE `paymentrecord` (
  `invoiceID` varchar(50) NOT NULL,
  `date` varchar(20) NOT NULL,
  `receiptID` int(11) NOT NULL,
  `appointmentID` int(11) NOT NULL,
  `clinicName` varchar(64) NOT NULL,
  `cost` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `paymentrecord`
--

INSERT INTO `paymentrecord` (`invoiceID`, `date`, `receiptID`, `appointmentID`, `clinicName`, `cost`) VALUES
('PAYID-MQJNXUQ0BV826347B922551E', '2022-01-03 15:00:01', 72382725, 1, 'Complete Healthcare International', '70.00'),
('PAYID-MQJNXUQ0BV507247B923593E', '2022-02-01 13:28:55', 72382726, 2, 'Orchard Group Clinic', '35.40');

-- --------------------------------------------------------

--
-- Table structure for table `pendingpayment`
--

CREATE TABLE `pendingpayment` (
  `date` varchar(20) NOT NULL,
  `receiptID` int(11) NOT NULL,
  `appointmentID` int(11) NOT NULL,
  `clinicName` varchar(64) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `duedate` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pendingpayment`
--

INSERT INTO `pendingpayment` (`date`, `receiptID`, `appointmentID`, `clinicName`, `cost`, `duedate`) VALUES
('2022-04-02 21:01:02', 72382727, 3, 'Tanglin Medical Clinic', '56.00', '2022-05-02'),
('2022-04-29 17:30:00', 72382728, 4, 'Complete Healthcare International', '35.40', '2022-05-29');

-- --------------------------------------------------------

--
-- Table structure for table `record`
--

CREATE TABLE `record` (
  `recordID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `record_date` date NOT NULL,
  `location` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `record`
--

INSERT INTO `record` (`recordID`, `name`, `record_date`, `location`) VALUES
(1, 'COVID-19 PFIZER-BIONTECH/COMIRNATY ORIGINAL (A-COV)', '2021-12-23', 'FULLERTON HEALTH VACCINATION CENTRE @JALAN BESAR'),
(2, 'COVID-19 PFIZER-BIONTECH/COMIRNATY ORIGINAL (A-COV)', '2021-07-10', 'FULLERTON HEALTH VACCINATION CENTRE @JALAN BESAR'),
(3, 'COVID-19 PFIZER-BIONTECH/COMIRNATY ORIGINAL (A-COV)', '2021-06-01', 'FULLERTON HEALTH VACCINATION CENTRE @JALAN BESAR'),
(4, 'Measles (AMI)', '2010-05-10', 'HOUGANG POLYCLINIC'),
(5, 'Poliomyelitis (SAB)', '2000-03-20', 'OVERSEAS IMMUNISATION'),
(6, 'Tetanus Toxoid, Reduced Diphtheria Toxoid and Acellular Pertussis Vaccine, Absorbed (Tdap)', '2014-07-01', 'HOUGANG POLYCLINIC'),
(7, 'Diphtheria/Tetanus with Acellular Pertussis (DTPa)', '2001-08-09', 'OVERSEAS IMMUNISATION'),
(8, 'Inactivated Polio Vaccine (IPV)', '2001-08-09', 'OVERSEAS IMMUNISATION');

-- --------------------------------------------------------

--
-- Table structure for table `user_form`
--

CREATE TABLE `user_form` (
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_form`
--

INSERT INTO `user_form` (`name`, `email`, `address`, `phone`, `password`, `user_type`) VALUES
('david', 'dd@gmail.com', 'blk 111 lorong ah soo road', '90090099', '202cb962ac59075b964b07152d234b70', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`);

--
-- Indexes for table `healthrecord`
--
ALTER TABLE `healthrecord`
  ADD PRIMARY KEY (`recordID`,`name`);

--
-- Indexes for table `paymentrecord`
--
ALTER TABLE `paymentrecord`
  ADD PRIMARY KEY (`receiptID`);

--
-- Indexes for table `pendingpayment`
--
ALTER TABLE `pendingpayment`
  ADD PRIMARY KEY (`receiptID`);

--
-- Indexes for table `record`
--
ALTER TABLE `record`
  ADD PRIMARY KEY (`recordID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `record`
--
ALTER TABLE `record`
  MODIFY `recordID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
