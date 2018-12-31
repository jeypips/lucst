-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 28, 2018 at 05:21 AM
-- Server version: 5.7.11
-- PHP Version: 7.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lucst`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `course_name` varchar(255) DEFAULT NULL,
  `course_short_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_name`, `course_short_name`) VALUES
(1, 'Bachelor of Science in Information Technology', 'BSIT'),
(2, 'BACHELOR OF SCIENCE IN HOTEL AND RESTAURANT MANAGEMENT', 'BSHRM');

-- --------------------------------------------------------

--
-- Table structure for table `curriculum`
--

CREATE TABLE `curriculum` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `semester` varchar(50) DEFAULT NULL,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `curriculum`
--

INSERT INTO `curriculum` (`id`, `course_id`, `semester`, `date_added`) VALUES
(1, 1, '1st year & 1st Semester', '2018-12-02 00:00:00'),
(2, 2, '1st year & 2nd Semester', '2018-12-19 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `curriculum_data`
--

CREATE TABLE `curriculum_data` (
  `id` int(11) NOT NULL,
  `curriculum_id` int(11) DEFAULT NULL,
  `grade` varchar(50) DEFAULT NULL,
  `subject_code` varchar(50) DEFAULT NULL,
  `descriptive_title` varchar(200) DEFAULT NULL,
  `units` varchar(50) DEFAULT NULL,
  `lec` varchar(50) DEFAULT NULL,
  `lab` varchar(50) DEFAULT NULL,
  `total` varchar(50) DEFAULT NULL,
  `pre_req` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `curriculum_data`
--

INSERT INTO `curriculum_data` (`id`, `curriculum_id`, `grade`, `subject_code`, `descriptive_title`, `units`, `lec`, `lab`, `total`, `pre_req`) VALUES
(1, 2, '', 'Engl 1', 'Study and Thinking Skills', '3', NULL, NULL, NULL, ''),
(2, 2, '', 'Fil 1', 'Sining ng Pakikipagtalastasan', '3', NULL, NULL, NULL, ''),
(3, 2, '', 'CS 1', 'Intro to Information Technology with Key Boarding', '3', NULL, NULL, NULL, ''),
(4, 2, '', 'PD', 'Personality Development & Human Relations', '3', NULL, NULL, NULL, ''),
(5, 2, '', 'HRMS 1', 'Intro to Hotel & Restaurant Management', '3', NULL, NULL, NULL, ''),
(6, 2, '', 'TC 1', 'Culinary Science – Commercial Cooking', '3/3', NULL, NULL, NULL, ''),
(7, 2, '', 'HRMR 1', 'Housekeeping Operations & Procedures', '3/2', NULL, NULL, NULL, ''),
(8, 2, '', 'TC 2', 'Principles of Tourism I', '3', NULL, NULL, NULL, ''),
(9, 2, '', 'PE 1', 'Self Testing Activities', '2', NULL, NULL, NULL, ''),
(10, 2, '', 'FTS 1', 'Industry Immersion', '1', NULL, NULL, NULL, ''),
(11, 1, '', 'sample', 'sample', '1', '2', '3', '4', '5');

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `id` int(11) NOT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `middlename` varchar(100) DEFAULT NULL,
  `home_address` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `pob` varchar(255) DEFAULT NULL,
  `age` varchar(50) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `religion` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `name_of_spouse` varchar(100) DEFAULT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `father_occupation` varchar(100) DEFAULT NULL,
  `father_number` varchar(50) DEFAULT NULL,
  `mother_name` varchar(100) DEFAULT NULL,
  `mother_occupation` varchar(100) DEFAULT NULL,
  `mother_number` varchar(50) DEFAULT NULL,
  `address_of_parents` varchar(100) DEFAULT NULL,
  `guardian_name` varchar(100) DEFAULT NULL,
  `guardian_occupation` varchar(100) DEFAULT NULL,
  `guardian_relationship` varchar(100) DEFAULT NULL,
  `guardian_address` varchar(255) DEFAULT NULL,
  `guardian_number` varchar(50) DEFAULT NULL,
  `course` varchar(255) DEFAULT NULL,
  `date_of_enrollment` date DEFAULT NULL,
  `year_level` varchar(50) DEFAULT NULL,
  `semester` varchar(50) DEFAULT NULL,
  `elem_school_name` varchar(255) DEFAULT NULL,
  `elem_school_address` varchar(255) DEFAULT NULL,
  `secon_school_name` varchar(255) DEFAULT NULL,
  `secon_school_address` varchar(255) DEFAULT NULL,
  `techvoc_school_name` varchar(255) DEFAULT NULL,
  `techvoc_school_address` varchar(255) DEFAULT NULL,
  `tertiary_school_name` varchar(255) DEFAULT NULL,
  `tertiary_school_address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`id`, `firstname`, `lastname`, `middlename`, `home_address`, `dob`, `pob`, `age`, `sex`, `religion`, `status`, `phone_number`, `name_of_spouse`, `father_name`, `father_occupation`, `father_number`, `mother_name`, `mother_occupation`, `mother_number`, `address_of_parents`, `guardian_name`, `guardian_occupation`, `guardian_relationship`, `guardian_address`, `guardian_number`, `course`, `date_of_enrollment`, `year_level`, `semester`, `elem_school_name`, `elem_school_address`, `secon_school_name`, `secon_school_address`, `techvoc_school_name`, `techvoc_school_address`, `tertiary_school_name`, `tertiary_school_address`) VALUES
(1, 'Juan', 'Lee', 'Loo', 'Bauang, La Union', '1997-02-04', 'Bauang, La Union', '21', 'Male', 'Catholic', 'Single', '09586598336', NULL, 'Jaunito Lee', 'OFW', '09586525445', 'Juanita Lee', 'Housekeeper', '09586525448', 'Bauang, La Union', 'Juanita Lee', 'Housekeeper', 'Mother', 'Bauang, La Union', '09586525448', '2', '2018-11-28', 'First Year', '2', 'Catbangen Elementary School', 'Catbangen  San Fernando City La Union', 'LUNHS', 'Catbangen  San Fernando City La Union', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE `instructor` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `office` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`id`, `firstname`, `middlename`, `lastname`, `office`) VALUES
(1, 'Joan', 'M', 'Balcit', 'BSHRM');

-- --------------------------------------------------------

--
-- Table structure for table `students_curriculum_data`
--

CREATE TABLE `students_curriculum_data` (
  `id` int(11) NOT NULL,
  `enrollment_id` int(11) DEFAULT NULL,
  `curriculum_data_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students_curriculum_data`
--

INSERT INTO `students_curriculum_data` (`id`, `enrollment_id`, `curriculum_data_id`) VALUES
(1, 1, 1),
(2, 1, 10),
(3, 1, 10),
(4, 1, 9),
(5, 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`) VALUES
(1, 'Catherine', 'Palabay', 'admin', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `curriculum`
--
ALTER TABLE `curriculum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `curriculum_data`
--
ALTER TABLE `curriculum_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `curriculum_id` (`curriculum_id`);

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students_curriculum_data`
--
ALTER TABLE `students_curriculum_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enrollment_id` (`enrollment_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `curriculum`
--
ALTER TABLE `curriculum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `curriculum_data`
--
ALTER TABLE `curriculum_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `enrollment`
--
ALTER TABLE `enrollment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `instructor`
--
ALTER TABLE `instructor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `students_curriculum_data`
--
ALTER TABLE `students_curriculum_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `curriculum`
--
ALTER TABLE `curriculum`
  ADD CONSTRAINT `curriculum_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `curriculum_data`
--
ALTER TABLE `curriculum_data`
  ADD CONSTRAINT `curriculum_data_ibfk_1` FOREIGN KEY (`curriculum_id`) REFERENCES `curriculum` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `students_curriculum_data`
--
ALTER TABLE `students_curriculum_data`
  ADD CONSTRAINT `students_curriculum_data_ibfk_1` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollment` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
