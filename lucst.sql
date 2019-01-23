-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 11, 2019 at 05:46 PM
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
-- Table structure for table `adds`
--

CREATE TABLE `adds` (
  `id` int(11) NOT NULL,
  `enrollment_id` int(11) DEFAULT NULL,
  `school_year` varchar(100) DEFAULT NULL,
  `semester` varchar(100) DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `reason` varchar(550) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `codes`
--

CREATE TABLE `codes` (
  `id` int(11) NOT NULL,
  `code_number` varchar(50) DEFAULT NULL,
  `code_title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `codes`
--

INSERT INTO `codes` (`id`, `code_number`, `code_title`) VALUES
(1, 'COD # 1', 'Absenteeism 		\r\n'),
(2, 'COD # 2', 'Sample');

-- --------------------------------------------------------

--
-- Table structure for table `completion`
--

CREATE TABLE `completion` (
  `id` int(11) NOT NULL,
  `enrollment_id` int(11) DEFAULT NULL,
  `curriculum_data_id` int(11) DEFAULT NULL,
  `school_year` varchar(50) DEFAULT NULL,
  `semester` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `completion_data`
--

CREATE TABLE `completion_data` (
  `id` int(11) NOT NULL,
  `completion_id` int(11) DEFAULT NULL,
  `ww` varchar(100) DEFAULT NULL,
  `obe` varchar(100) DEFAULT NULL,
  `att` varchar(100) DEFAULT NULL,
  `exam` varchar(100) DEFAULT NULL,
  `pg` varchar(100) DEFAULT NULL,
  `tg` varchar(100) DEFAULT NULL,
  `fg` varchar(100) DEFAULT NULL,
  `remarks` varchar(550) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `pre_req` varchar(50) DEFAULT NULL,
  `day` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `room` varchar(50) DEFAULT NULL,
  `instructor` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `curriculum_data`
--

INSERT INTO `curriculum_data` (`id`, `curriculum_id`, `grade`, `subject_code`, `descriptive_title`, `units`, `lec`, `lab`, `total`, `pre_req`, `day`, `time`, `room`, `instructor`) VALUES
(1, 2, '', 'Engl 1', 'Study and Thinking Skills', '3', NULL, '0', '0', '', 'Mon', '8-9am', '24', '1'),
(2, 2, '', 'Fil 1', 'Sining ng Pakikipagtalastasan', '3', NULL, '0', '0', '', 'Mon', '9-10am', '24', '1'),
(3, 2, '', 'CS 1', 'Intro to Information Technology with Key Boarding', '3', NULL, '0', '0', '', 'Tue', '9-12am', '24', '1'),
(4, 2, '', 'PD', 'Personality Development & Human Relations', '3', NULL, '0', '0', '', 'Wed', '1-3pm', '24', '1'),
(5, 2, '', 'HRMS 1', 'Intro to Hotel & Restaurant Management', '3', NULL, '0', '0', '', 'Mon', '10-12am', '24', '1'),
(6, 2, '', 'TC 1', 'Culinary Science – Commercial Cooking', '3/3', NULL, '0', '0', '', 'Fri', '9-12am', '24', '1'),
(7, 2, '', 'HRMR 1', 'Housekeeping Operations & Procedures', '3/2', NULL, '0', '0', '', 'Thu', '2-3pm', '24', '1'),
(8, 2, '', 'TC 2', 'Principles of Tourism I', '3', NULL, '0', '0', '', 'Mon', '1-3pm', '24', '1'),
(9, 2, '', 'PE 1', 'Self Testing Activities', '2', NULL, '0', '0', '', 'Tue', '1-3pm', '24', '1'),
(10, 2, '', 'FTS 1', 'Industry Immersion', '1', NULL, '3', '3', '', 'Mon', '3-5pm', '24', '1'),
(11, 1, '', '', 'Sample', 'Sample', '3', '3', '6', 'Sample', '', '1-2pm', '25', '2');

-- --------------------------------------------------------

--
-- Table structure for table `disciplinary`
--

CREATE TABLE `disciplinary` (
  `id` int(11) NOT NULL,
  `enrollment_id` int(11) DEFAULT NULL,
  `school_year` varchar(100) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `disciplinary_data`
--

CREATE TABLE `disciplinary_data` (
  `id` int(11) NOT NULL,
  `disciplinary_id` int(11) DEFAULT NULL,
  `semester` varchar(100) DEFAULT NULL,
  `code_number` varchar(100) DEFAULT NULL,
  `code_title` varchar(255) DEFAULT NULL,
  `action_taken` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `drops`
--

CREATE TABLE `drops` (
  `id` int(11) NOT NULL,
  `enrollment_id` int(11) DEFAULT NULL,
  `school_year` varchar(50) DEFAULT NULL,
  `semester` varchar(50) DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `reason` varchar(550) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `id` int(11) NOT NULL,
  `id_number` varchar(50) DEFAULT NULL,
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
(1, 'Joan', 'M', 'Balcit', 'BSHRM'),
(2, 'Jovit', 'A', 'Baldo', 'BSHRM');

-- --------------------------------------------------------

--
-- Table structure for table `students_curriculum_data`
--

CREATE TABLE `students_curriculum_data` (
  `id` int(11) NOT NULL,
  `enrollment_id` int(11) DEFAULT NULL,
  `curriculum_data_id` int(11) DEFAULT NULL,
  `written_works` varchar(100) DEFAULT NULL,
  `obe` varchar(100) DEFAULT NULL,
  `att` varchar(100) DEFAULT NULL,
  `exam` varchar(100) DEFAULT NULL,
  `previous_grade` varchar(100) DEFAULT NULL,
  `tentative_grade` varchar(100) DEFAULT NULL,
  `final_grade` varchar(100) DEFAULT NULL,
  `remarks` varchar(550) DEFAULT NULL,
  `adding` varchar(50) DEFAULT NULL,
  `prelim` varchar(50) DEFAULT NULL,
  `midterm` varchar(50) DEFAULT NULL,
  `semifinal` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `middlename`, `username`, `password`) VALUES
(1, 'Catherine', 'Palabay', 'M', 'admin', 'admin'),
(2, 'Jasper', 'Capudoy', 'M', 'jasper', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adds`
--
ALTER TABLE `adds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enrollment_id` (`enrollment_id`);

--
-- Indexes for table `codes`
--
ALTER TABLE `codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `completion`
--
ALTER TABLE `completion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enrollment_id` (`enrollment_id`);

--
-- Indexes for table `completion_data`
--
ALTER TABLE `completion_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `completion_id` (`completion_id`);

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
-- Indexes for table `disciplinary`
--
ALTER TABLE `disciplinary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enrollment_id` (`enrollment_id`);

--
-- Indexes for table `disciplinary_data`
--
ALTER TABLE `disciplinary_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disciplinary_id` (`disciplinary_id`);

--
-- Indexes for table `drops`
--
ALTER TABLE `drops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enrollment_id` (`enrollment_id`);

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
-- AUTO_INCREMENT for table `adds`
--
ALTER TABLE `adds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `codes`
--
ALTER TABLE `codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `completion`
--
ALTER TABLE `completion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `completion_data`
--
ALTER TABLE `completion_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `curriculum`
--
ALTER TABLE `curriculum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `curriculum_data`
--
ALTER TABLE `curriculum_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `disciplinary`
--
ALTER TABLE `disciplinary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `disciplinary_data`
--
ALTER TABLE `disciplinary_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `drops`
--
ALTER TABLE `drops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `enrollment`
--
ALTER TABLE `enrollment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `adds`
--
ALTER TABLE `adds`
  ADD CONSTRAINT `adds_ibfk_1` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollment` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `completion`
--
ALTER TABLE `completion`
  ADD CONSTRAINT `completion_ibfk_1` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollment` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `completion_data`
--
ALTER TABLE `completion_data`
  ADD CONSTRAINT `completion_data_ibfk_1` FOREIGN KEY (`completion_id`) REFERENCES `completion` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

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
-- Constraints for table `disciplinary`
--
ALTER TABLE `disciplinary`
  ADD CONSTRAINT `disciplinary_ibfk_1` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollment` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `disciplinary_data`
--
ALTER TABLE `disciplinary_data`
  ADD CONSTRAINT `disciplinary_data_ibfk_1` FOREIGN KEY (`disciplinary_id`) REFERENCES `disciplinary` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `drops`
--
ALTER TABLE `drops`
  ADD CONSTRAINT `drops_ibfk_1` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollment` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `students_curriculum_data`
--
ALTER TABLE `students_curriculum_data`
  ADD CONSTRAINT `students_curriculum_data_ibfk_1` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollment` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
