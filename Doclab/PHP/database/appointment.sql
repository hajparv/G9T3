-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 14, 2019 at 06:42 AM
-- Server version: 5.7.19
-- PHP Version: 7.1.9


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `appointment`
--
CREATE DATABASE IF NOT EXISTS `appointment` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `appointment`;

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
CREATE TABLE IF NOT EXISTS `appointment` (
    `appointmentID` INT NOT NULL AUTO_INCREMENT,
    `clinicName` VARCHAR(200) NOT NULL,
    `nric` VARCHAR(9) NOT NULL,
    `mobile` VARCHAR(64) NOT NULL,
    `name` VARCHAR(64) NOT NULL,
    `address` VARCHAR(200) NOT NULL,
    `dob` DATE NOT NULL,
    `datetime` DATETIME NOT NULL,

    PRIMARY KEY (`appointmentID`, `clinicName`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `appointment`
--



ALTER TABLE `appointment` ADD COLUMN `vaccinationStatus` VARCHAR(15) NOT NULL;
INSERT INTO `appointment` (`clinicName`, `nric`, `mobile`, `name`, `address`, `dob`, `datetime`, `vaccinationStatus`) VALUES
('Complete Healthcare International', 'T0123456A', '+6597801945', 'John Tan', 'BUKIT BATOK STREET 25', '1994-04-12', '2023-11-04 09:18:44', 'vaccinated'),
('Orchard Group Clinic', 'T0122222A', '+6597801945', 'Joe Lee', '10 BRADDELL HILL', '2000-01-30', '2023-12-18 10:02:35', 'non-vaccinated'),
('Tanglin Medical Clinic', 'T0333333A', '+6597801945', 'Mary Goh', '148 GANGSA ROAD', '1990-08-09', '2023-11-04 13:02:45', 'vaccinated'),
('Complete Healthcare International', 'T0109111G', '+6597801945', 'Matilda Lim', 'JURONG EAST STREET 21', '1987-07-17', '2023-12-23 16:02:34', 'non-vaccinated'),
('UNIHEALTH 24-HR CLINIC (JURONG EAST)', 'T0213921S', '+6597801945', 'William Tan', 'TELOK BLANGAH STREET 31', '1995-09-23', '2023-11-11 11:02:13', 'vaccinated');
COMMIT;

