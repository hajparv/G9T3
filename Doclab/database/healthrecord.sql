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
-- Table structure for table `labtest_results`
--
-- Create the labtest_results table
CREATE TABLE LabTestResults (
    ResultID INT AUTO_INCREMENT PRIMARY KEY,
    TestName VARCHAR(255) NOT NULL,
    ResultValue DECIMAL(10, 2) NOT NULL,
    ResultDate DATE NOT NULL
);

INSERT INTO LabTestResults (TestName, ResultValue, ResultDate)
VALUES
    ('Basic Metabolic Panel (BMP)', 95.5, '2023-09-20'),
    ('Lipid Panel', 150.2, '2023-09-18'),
    ('Thyroid Function Tests', 2.5, '2023-09-19'),
    ('Mammogram', 0.1, '2023-10-10'),
    ('Complete Blood Count (CBC)', 4.8, '2023-10-05'),
    ('Prostate-Specific Antigen (PSA) Test', 3.2, '2023-10-08'),
    ('Pap Smear', 0.02, '2023-10-12'),
    ('Colonoscopy', 1.8, '2023-10-11'),
    ('Bone Density Scan', 1.2, '2023-09-25');

-- Table structure for table `drugallergy`
-- Create the patients table
CREATE TABLE drug_allergy (
    AllergyID INT AUTO_INCREMENT PRIMARY KEY,
    DrugName VARCHAR(255) NOT NULL,
    AllergyDescription TEXT,
    Severity VARCHAR(50)
);

INSERT INTO drug_allergy (DrugName, AllergyDescription, Severity)
VALUES
    ('Penicillin', 'Patient is allergic to penicillin', 'Severe'),
    ('Sulfa Drugs', 'Severe allergic reaction to sulfa drugs', 'Critical'),
    ('Aspirin', 'Mild rash when taking aspirin', 'Mild'),
    ('Amoxicillin', 'Hives and itching after taking amoxicillin', 'Moderate'),
    ('Codeine', 'Breathing difficulties when taking codeine', 'Critical'),
    ('Ibuprofen', 'Stomach ache and nausea when taking ibuprofen', 'Mild');



-- Table structure for table `HealthScreenings`
-- Create the HealthScreenings table


CREATE TABLE HealthScreenings (
    ScreeningID INT AUTO_INCREMENT PRIMARY KEY,
    ScreeningName VARCHAR(255) NOT NULL,
    ScreeningDescription TEXT
);
INSERT INTO HealthScreenings (ScreeningName, ScreeningDescription)
VALUES
    ('Annual Physical Examination', 'A comprehensive examination to assess overall health, including blood pressure, cholesterol, and general wellness.'),
    ('Mammogram', 'A screening test for breast cancer in women, typically performed using X-rays.'),
    ('Colonoscopy', 'A screening procedure to detect and prevent colorectal cancer by examining the colon and rectum.'),
    ('Prostate-Specific Antigen (PSA) Test', 'A blood test to screen for prostate cancer in men.'),
    ('Pap Smear', 'A cervical cancer screening test for women, involving the collection and examination of cervical cells.'),
    ('Bone Density Scan', 'A test to measure bone density and assess the risk of osteoporosis.');


-- Table structure for table `Subsidies`
-- Create the Subsidies table



CREATE TABLE Subsidies (
    SubsidyID INT AUTO_INCREMENT PRIMARY KEY,
    SubsidyName VARCHAR(255) NOT NULL,
    SubsidyDescription TEXT,
    EligibilityCriteria TEXT
);

INSERT INTO Subsidies (SubsidyName, SubsidyDescription, EligibilityCriteria)
VALUES
    ('Low-Income Assistance', 'Financial assistance for patients with low income.', 'Annual income below a specified threshold.'),
    ('Senior Citizen Discount', 'Discount for senior citizens to make healthcare more affordable.', 'Age above a specified limit, such as 65 or 60.'),
    ('Student Discount', 'Discount for students to reduce healthcare costs.', 'Valid student ID or enrollment proof required.'),
    ('Family Health Plan', 'Subsidy for families to promote family healthcare.', 'Eligible for families with a certain number of members.'),
    ('Chronic Disease Subsidy', 'Assistance for patients with chronic illnesses.', 'Valid medical diagnosis for a chronic condition required.'),
    ('Veterans Discount', 'Discount for military veterans to support their healthcare needs.', 'Veteran status verified with military service records.');




-- Table structure for table `MedicationRecords`
-- Create the MedicationRecords table

CREATE TABLE MedicationRecords (
    RecordID INT AUTO_INCREMENT PRIMARY KEY,
    MedicationName VARCHAR(255) NOT NULL,
    Dosage VARCHAR(50) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE,
    Notes TEXT
);

INSERT INTO MedicationRecords (MedicationName, Dosage, StartDate, EndDate, Notes)
VALUES
    ('Aspirin', '1 tablet daily', '2023-09-15', '2023-09-30', 'For pain relief'),
    ('Lisinopril', '10 mg once a day', '2023-09-10', '2023-10-10', 'For hypertension'),
    ('Amoxicillin', '500 mg three times a day', '2023-09-20', '2023-09-30', 'For infection'),
    ('Atorvastatin', '20 mg daily', '2023-09-18', NULL, 'For cholesterol control'),
    ('Ibuprofen', '400 mg as needed', '2023-10-01', '2023-10-10', 'For pain relief'),
    ('Metformin', '1000 mg twice a day', '2023-09-15', NULL, 'For diabetes control');

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
