
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
-- Table structure for table `paymentrecord`
--

DROP TABLE IF EXISTS `paymentrecord`;
CREATE TABLE IF NOT EXISTS `paymentrecord` (
  `invoiceID` VARCHAR(50) NOT NULL,
  `date` VARCHAR(20) NOT NULL,
  `receiptID` INT NOT NULL,
  `appointmentID` INT NOT NULL,
  `clinicName` varchar(64) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  PRIMARY KEY (`receiptID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `paymentrecord`
--

INSERT INTO `paymentrecord` (`invoiceID`,`date`,`receiptID`, `appointmentID`, `clinicName`, `cost`) VALUES
('PAYID-MQJNXUQ0BV826347B922551E','2022-01-03 15:00:01',72382725, 1, 'Complete Healthcare International', 70.00),
('PAYID-MQJNXUQ0BV507247B923593E','2022-02-01 13:28:55',72382726, 2, 'Orchard Group Clinic',35.40);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;