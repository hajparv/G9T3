-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 05, 2023 at 10:32 AM
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
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment` (
  `appointmentID` int(11) NOT NULL,
  `clinicName` varchar(200) NOT NULL,
  `nric` varchar(9) NOT NULL,
  `mobile` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `address` varchar(200) NOT NULL,
  `dob` date NOT NULL,
  `datetime` datetime NOT NULL,
  `vaccinationStatus` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointmentID`, `clinicName`, `nric`, `mobile`, `name`, `address`, `dob`, `datetime`, `vaccinationStatus`) VALUES
(1, 'Complete Healthcare International', 'T0123456A', '+6597801945', 'John Tan', 'BUKIT BATOK STREET 25', '1994-04-12', '2023-11-04 09:18:44', 'vaccinated'),
(2, 'Orchard Group Clinic', 'T0122222A', '+6597801945', 'Joe Lee', '10 BRADDELL HILL', '2000-01-30', '2023-12-18 10:02:35', 'non-vaccinated'),
(3, 'Tanglin Medical Clinic', 'T0333333A', '+6597801945', 'Mary Goh', '148 GANGSA ROAD', '1990-08-09', '2023-11-04 13:02:45', 'vaccinated'),
(4, 'Complete Healthcare International', 'T0109111G', '+6597801945', 'Matilda Lim', 'JURONG EAST STREET 21', '1987-07-17', '2023-12-23 16:02:34', 'non-vaccinated'),
(5, 'UNIHEALTH 24-HR CLINIC (JURONG EAST)', 'T0213921S', '+6597801945', 'William Tan', 'TELOK BLANGAH STREET 31', '1995-09-23', '2023-11-11 11:02:13', 'vaccinated');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
CREATE TABLE `booking` (
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `time` time NOT NULL,
  `date` date NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `clinic` varchar(100) NOT NULL,
  `service` varchar(255) NOT NULL,
  `special_request` varchar(300) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booking`
--


-- --------------------------------------------------------

--
-- Table structure for table `drugallergy`
--


--
-- Table structure for table `drug_allergy`
--

DROP TABLE IF EXISTS `drug_allergy`;
CREATE TABLE `drug_allergy` (
  `AllergyID` int(11) NOT NULL,
  `DrugName` varchar(255) NOT NULL,
  `AllergyDescription` text,
  `Severity` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `drug_allergy`
--

INSERT INTO `drug_allergy` (`AllergyID`, `DrugName`, `AllergyDescription`, `Severity`) VALUES
(1, 'Penicillin', 'Patient is allergic to penicillin', 'Severe'),
(2, 'Sulfa Drugs', 'Severe allergic reaction to sulfa drugs', 'Critical'),
(3, 'Aspirin', 'Mild rash when taking aspirin', 'Mild'),
(4, 'Amoxicillin', 'Hives and itching after taking amoxicillin', 'Moderate'),
(5, 'Codeine', 'Breathing difficulties when taking codeine', 'Critical'),
(6, 'Ibuprofen', 'Stomach ache and nausea when taking ibuprofen', 'Mild');

-- --------------------------------------------------------

--
-- Table structure for table `healthrecord`
--

DROP TABLE IF EXISTS `healthrecord`;
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
-- Table structure for table `HealthScreenings`
--

DROP TABLE IF EXISTS `HealthScreenings`;
CREATE TABLE `HealthScreenings` (
  `ScreeningID` int(11) NOT NULL,
  `ScreeningName` varchar(255) NOT NULL,
  `ScreeningDescription` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `HealthScreenings`
--

INSERT INTO `HealthScreenings` (`ScreeningID`, `ScreeningName`, `ScreeningDescription`) VALUES
(1, 'Annual Physical Examination', 'A comprehensive examination to assess overall health, including blood pressure, cholesterol, and general wellness.'),
(2, 'Mammogram', 'A screening test for breast cancer in women, typically performed using X-rays.'),
(3, 'Colonoscopy', 'A screening procedure to detect and prevent colorectal cancer by examining the colon and rectum.'),
(4, 'Prostate-Specific Antigen (PSA) Test', 'A blood test to screen for prostate cancer in men.'),
(5, 'Pap Smear', 'A cervical cancer screening test for women, involving the collection and examination of cervical cells.'),
(6, 'Bone Density Scan', 'A test to measure bone density and assess the risk of osteoporosis.');

-- --------------------------------------------------------

--
-- Table structure for table `LabTestResults`
--

DROP TABLE IF EXISTS `LabTestResults`;
CREATE TABLE `LabTestResults` (
  `ResultID` int(11) NOT NULL,
  `TestName` varchar(255) NOT NULL,
  `ResultValue` decimal(10,2) NOT NULL,
  `ResultDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `LabTestResults`
--

INSERT INTO `LabTestResults` (`ResultID`, `TestName`, `ResultValue`, `ResultDate`) VALUES
(1, 'Basic Metabolic Panel (BMP)', '95.50', '2023-09-20'),
(2, 'Lipid Panel', '150.20', '2023-09-18'),
(3, 'Thyroid Function Tests', '2.50', '2023-09-19'),
(4, 'Mammogram', '0.10', '2023-10-10'),
(5, 'Complete Blood Count (CBC)', '4.80', '2023-10-05'),
(6, 'Prostate-Specific Antigen (PSA) Test', '3.20', '2023-10-08'),
(7, 'Pap Smear', '0.02', '2023-10-12'),
(8, 'Colonoscopy', '1.80', '2023-10-11'),
(9, 'Bone Density Scan', '1.20', '2023-09-25');

-- --------------------------------------------------------

--
-- Table structure for table `MedicationRecords`
--

DROP TABLE IF EXISTS `MedicationRecords`;
CREATE TABLE `MedicationRecords` (
  `RecordID` int(11) NOT NULL,
  `MedicationName` varchar(255) NOT NULL,
  `Dosage` varchar(50) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date DEFAULT NULL,
  `Notes` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `MedicationRecords`
--

INSERT INTO `MedicationRecords` (`RecordID`, `MedicationName`, `Dosage`, `StartDate`, `EndDate`, `Notes`) VALUES
(1, 'Aspirin', '1 tablet daily', '2023-09-15', '2023-09-30', 'For pain relief'),
(2, 'Lisinopril', '10 mg once a day', '2023-09-10', '2023-10-10', 'For hypertension'),
(3, 'Amoxicillin', '500 mg three times a day', '2023-09-20', '2023-09-30', 'For infection'),
(4, 'Atorvastatin', '20 mg daily', '2023-09-18', NULL, 'For cholesterol control'),
(5, 'Ibuprofen', '400 mg as needed', '2023-10-01', '2023-10-10', 'For pain relief'),
(6, 'Metformin', '1000 mg twice a day', '2023-09-15', NULL, 'For diabetes control');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `date` varchar(20) NOT NULL,
  `receiptID` int(11) NOT NULL,
  `clinicName` varchar(64) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `status` varchar(30) NOT NULL,
  `duedate` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`date`, `receiptID`, `clinicName`, `cost`, `status`, `duedate`) VALUES
('2022-01-03 15:00:01', 72382725, 'Complete Healthcare International', '55.00', 'completed', '-'),
('2022-06-01 13:28:55', 72382726, 'Orchard Group Clinic', '55.00', 'completed', '-'),
('2023-04-22 13:42:45', 72382727, 'YSL Aljuined Clinic', '55.00', 'pending', '2023-04-29'),
('2023-11-01 11:22:44', 72382728, 'Spring Health Clinic', '55.00', 'pending', '2023-11-11');

-- --------------------------------------------------------

--
-- Table structure for table `paymentrecord`
--

DROP TABLE IF EXISTS `paymentrecord`;
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
('PAYID-MQJNXUQ0BV826347B922551E', '2022-01-03 15:00:01', 72382725, 1, 'Complete Healthcare International', '55.00'),
('PAYID-MQJNXUQ0BV507247B923593E', '2022-02-01 13:28:55', 72382726, 2, 'Orchard Group Clinic', '55.00');

-- --------------------------------------------------------

--
-- Table structure for table `pendingpayment`
--

DROP TABLE IF EXISTS `pendingpayment`;
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

DROP TABLE IF EXISTS `record`;
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
-- Table structure for table `Subsidies`
--

DROP TABLE IF EXISTS `Subsidies`;
CREATE TABLE `Subsidies` (
  `SubsidyID` int(11) NOT NULL,
  `SubsidyName` varchar(255) NOT NULL,
  `SubsidyDescription` text,
  `EligibilityCriteria` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Subsidies`
--

INSERT INTO `Subsidies` (`SubsidyID`, `SubsidyName`, `SubsidyDescription`, `EligibilityCriteria`) VALUES
(1, 'Low-Income Assistance', 'Financial assistance for patients with low income.', 'Annual income below a specified threshold.'),
(2, 'Senior Citizen Discount', 'Discount for senior citizens to make healthcare more affordable.', 'Age above a specified limit, such as 65 or 60.'),
(3, 'Student Discount', 'Discount for students to reduce healthcare costs.', 'Valid student ID or enrollment proof required.'),
(4, 'Family Health Plan', 'Subsidy for families to promote family healthcare.', 'Eligible for families with a certain number of members.'),
(5, 'Chronic Disease Subsidy', 'Assistance for patients with chronic illnesses.', 'Valid medical diagnosis for a chronic condition required.'),
(6, 'Veterans Discount', 'Discount for military veterans to support their healthcare needs.', 'Veteran status verified with military service records.');

-- --------------------------------------------------------

--
-- Table structure for table `user_form`
--

DROP TABLE IF EXISTS `user_form`;
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



--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointmentID`,`clinicName`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`);

--
-- Indexes for table `drug_allergy`
--
ALTER TABLE `drug_allergy`
  ADD PRIMARY KEY (`AllergyID`);

--
-- Indexes for table `healthrecord`
--
ALTER TABLE `healthrecord`
  ADD PRIMARY KEY (`recordID`,`name`);

--
-- Indexes for table `HealthScreenings`
--
ALTER TABLE `HealthScreenings`
  ADD PRIMARY KEY (`ScreeningID`);

--
-- Indexes for table `LabTestResults`
--
ALTER TABLE `LabTestResults`
  ADD PRIMARY KEY (`ResultID`);

--
-- Indexes for table `MedicationRecords`
--
ALTER TABLE `MedicationRecords`
  ADD PRIMARY KEY (`RecordID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`receiptID`);

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
-- Indexes for table `Subsidies`
--
ALTER TABLE `Subsidies`
  ADD PRIMARY KEY (`SubsidyID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `drug_allergy`
--
ALTER TABLE `drug_allergy`
  MODIFY `AllergyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `HealthScreenings`
--
ALTER TABLE `HealthScreenings`
  MODIFY `ScreeningID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `LabTestResults`
--
ALTER TABLE `LabTestResults`
  MODIFY `ResultID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `MedicationRecords`
--
ALTER TABLE `MedicationRecords`
  MODIFY `RecordID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `record`
--
ALTER TABLE `record`
  MODIFY `recordID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `Subsidies`
--
ALTER TABLE `Subsidies`
  MODIFY `SubsidyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
