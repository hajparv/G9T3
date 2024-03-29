
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `schedule`
--
CREATE DATABASE IF NOT EXISTS `schedule` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `schedule`;

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
CREATE TABLE IF NOT EXISTS `schedule` (
    `scheduleID` INT NOT NULL AUTO_INCREMENT,
    `scheduleName` VARCHAR(20) NOT NULL,
    `scheduleDescription` VARCHAR(200) NOT NULL,
    `date` DATE NOT NULL,
    `time` VARCHAR(20) NOT NULL,
    

    PRIMARY KEY (`scheduleID`, `scheduleName`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `appointment`
--




INSERT INTO schedule (scheduleName,scheduleDescription,date,time) VALUES

('Class','WAD','2023-10-24','12pm - 3.30pm'),
('Class','LTB','2023-10-25','3.30pm - 6.30pm'),
('Class','BPAS','2023-10-23','8.15am - 11.30am'),
('Class','AI','2023-10-24','9.00am - 11.30am'),
('Class','IDP','2023-10-23','12.00pm - 3.30pm'),
('Meeting','Flim IDP video','2023-10-30','12.00pm - 3.30pm'),
('Meeting','Finish up WAD webpage','2023-10-26','4.00pm - 7.00pm'),
('Gym','Run 30 minutes and do weights','2023-10-24','5.00pm - 6.30pm'),
('Badminton','Competition with NTU at SUTD','2023-11-09','7.30pm - 10.30pm'),
('Badminton','Competition with NUS at SUTD','2023-11-09','9.30am - 12.30pm'),
('Badminton','Competition with SUSS at SUTD','2023-11-09','7.30pm - 10.30pm'),
('Badminton','Competition with SIM at SUTD','2023-11-09','7.30pm - 10.30pm'),
('Badminton','Competition with NTU at SUTD','2023-11-09','9.30am - 12.30pm'),
('Social','Meetup with Dap for dinner','2023-10-28','7.00pm'),
('Badminton','Training at school','2023-10-05','8.00pm - 11.00pm'),
('Badminton','Training at school','2023-10-12','8.00pm - 11.00pm'),
('Badminton','Training at school','2023-10-19','8.00pm - 11.00pm'),
('Badminton','Training at school','2023-10-26','8.00pm - 11.00pm'),
('Class','WAD','2023-10-17','12pm - 3.30pm'),
('Class','LTB','2023-10-18','3.30pm - 6.30pm'),
('Class','BPAS','2023-10-16','8.15am - 11.30am'),
('Class','AI','2023-10-17','9.00am - 11.30am'),
('Class','IDP','2023-10-18','12.00pm - 3.30pm'),
('Class','WAD','2023-10-10','12pm - 3.30pm'),
('Class','LTB','2023-10-11','3.30pm - 6.30pm'),
('Class','BPAS','2023-10-09','8.15am - 11.30am'),
('Class','AI','2023-10-10','9.00am - 11.30am'),
('Class','IDP','2023-10-11','12.00pm - 3.30pm'),
('Test','LTB essay and quiz in class','2023-10-18','3.30pm - 6.30pm'),
('Class','BPAS','2023-10-16','8.15am - 11.30am'),
('Class','AI','2023-10-17','9.00am - 11.30am'),
('Presentation','LTB final presentation @ NVPC','2023-11-08','3.30pm - 6.30pm'),
('Report','LTB final report @ NVPC','2023-11-10','12.59pm'),
('Exam','WAD2 finals','2023-11-22','4.30pm - 6.30pm'),
('Exam','IDP finals','2023-11-24','4.30pm - 6.30pm'),
('Exam','BPAS finals','2023-12-01','4.30pm - 6.30pm');
COMMIT;

