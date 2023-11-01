SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Database: `healthrecord`
CREATE DATABASE IF NOT EXISTS `healthrecord` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `healthrecord`;

-- Table structure for table `healthrecord`
DROP TABLE IF EXISTS `record`;
CREATE TABLE IF NOT EXISTS `record` (
  `recordID` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(100) NOT NULL,
  `record_date` DATE NOT NULL,
  `location` VARCHAR(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table `healthrecord`
INSERT INTO `record` (`name`, `record_date`, `location`) VALUES
('COVID-19 PFIZER-BIONTECH/COMIRNATY ORIGINAL (A-COV)', '2021-12-23', 'FULLERTON HEALTH VACCINATION CENTRE @JALAN BESAR'),
('COVID-19 PFIZER-BIONTECH/COMIRNATY ORIGINAL (A-COV)', '2021-07-10', 'FULLERTON HEALTH VACCINATION CENTRE @JALAN BESAR'),
('COVID-19 PFIZER-BIONTECH/COMIRNATY ORIGINAL (A-COV)', '2021-06-01', 'FULLERTON HEALTH VACCINATION CENTRE @JALAN BESAR'),
('Measles (AMI)', '2010-05-10', 'HOUGANG POLYCLINIC'),
('Poliomyelitis (SAB)', '2000-03-20', 'OVERSEAS IMMUNISATION'),
('Tetanus Toxoid, Reduced Diphtheria Toxoid and Acellular Pertussis Vaccine, Absorbed (Tdap)', '2014-07-01', 'HOUGANG POLYCLINIC'),
('Diphtheria/Tetanus with Acellular Pertussis (DTPa)', '2001-08-09', 'OVERSEAS IMMUNISATION'),
('Inactivated Polio Vaccine (IPV)', '2001-08-09', 'OVERSEAS IMMUNISATION');

CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    time TIME NOT NULL,
    date VARCHAR(30) NOT NULL,
    mobile VARCHAR(15) NOT NULL,
    service VARCHAR(255) NOT NULL,
    special_request TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert a new appointment based on the payload
INSERT INTO appointments (name, email, time, date, mobile, service, special_request)
VALUES (
    'John Doe',                 -- Replace with your fullName
    'johndoe@example.com',      -- Replace with your email
    '10:00:00',                 -- Replace with your time
    '2023-11-01',               -- Replace with your date
    '1234567890',               -- Replace with your mobile
    'Consultation',            -- Replace with your service
    'Any special request'       -- Replace with your specialRequest
);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
