-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 03, 2018 at 10:56 PM
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
(1, 'Bachelor of Science in Information Technology', 'BSIT');

-- --------------------------------------------------------

--
-- Table structure for table `curriculum`
--

CREATE TABLE `curriculum` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `year_name` varchar(500) DEFAULT NULL,
  `semester` varchar(50) DEFAULT NULL,
  `date_added` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `curriculum`
--

INSERT INTO `curriculum` (`id`, `course_id`, `year_name`, `semester`, `date_added`) VALUES
(1, 1, 'Second Year', '2nd Semester', '2018-12-02');

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
  `pre_req` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `id` int(11) NOT NULL,
  `students_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
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
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `firstname`, `lastname`, `middlename`, `home_address`, `dob`, `pob`, `age`, `sex`, `religion`, `status`, `phone_number`, `name_of_spouse`, `father_name`, `father_occupation`, `father_number`, `mother_name`, `mother_occupation`, `mother_number`, `address_of_parents`, `guardian_name`, `guardian_occupation`, `guardian_relationship`, `guardian_address`, `guardian_number`, `course`, `date_of_enrollment`, `semester`, `elem_school_name`, `elem_school_address`, `secon_school_name`, `secon_school_address`, `techvoc_school_name`, `techvoc_school_address`, `tertiary_school_name`, `tertiary_school_address`) VALUES
(1, 'Juan', 'Lee', 'Loo', 'Bauang, La Union', '1997-02-04', 'Bauang, La Union', '21', 'Male', 'Catholic', 'Single', '09586598336', NULL, 'Jaunito Lee', 'OFW', '09586525445', 'Juanita Lee', 'Housekeeper', '09586525448', 'Bauang, La Union', 'Juanita Lee', 'Housekeeper', 'Mother', 'Bauang, La Union', '09586525448', '1', '2018-11-28', 'First Semester', 'Catbangen Elementary School', 'Catbangen  San Fernando City La Union', 'LUNHS', 'Catbangen  San Fernando City La Union', '', '', '', '');

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `curriculum_data`
--
ALTER TABLE `curriculum_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `curriculum`
--
ALTER TABLE `curriculum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `curriculum_data`
--
ALTER TABLE `curriculum_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `enrollment`
--
ALTER TABLE `enrollment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
