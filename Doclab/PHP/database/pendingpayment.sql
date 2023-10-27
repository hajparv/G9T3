
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `payment_db`
--
CREATE DATABASE IF NOT EXISTS `payment_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `payment_db`;

-- --------------------------------------------------------

--
-- Table structure for table `pendingpayment`
--

DROP TABLE IF EXISTS `pendingpayment`;
CREATE TABLE IF NOT EXISTS `pendingpayment` (
    `date` VARCHAR(20) NOT NULL,
    `receiptID` INT NOT NULL,
    `appointmentID` INT NOT NULL,
    `clinicName` varchar(64) NOT NULL,
    `cost` decimal(10,2) NOT NULL,
    `duedate` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`receiptID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `pendingpayment` (`date`,`receiptID`, `appointmentID`, `clinicName`, `cost`,`duedate`) VALUES
('2022-04-02 21:01:02',72382727, 3, 'Tanglin Medical Clinic', 56.00,'2022-05-02'),
('2022-04-29 17:30:00',72382728, 4, 'Complete Healthcare International',35.40,'2022-05-29');

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;