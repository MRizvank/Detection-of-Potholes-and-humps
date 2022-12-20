-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2021 at 10:16 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `detection_of_potholes`
--

-- --------------------------------------------------------

--
-- Table structure for table `accident_alert`
--

CREATE TABLE `accident_alert` (
  `id` int(11) NOT NULL,
  `area` varchar(50) NOT NULL,
  `alert` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accident_alert`
--

INSERT INTO `accident_alert` (`id`, `area`, `alert`) VALUES
(1, 'calicut', 'yhtnyj');

-- --------------------------------------------------------

--
-- Table structure for table `accident_area`
--

CREATE TABLE `accident_area` (
  `id` int(11) NOT NULL,
  `location` varchar(50) NOT NULL,
  `details` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accident_area`
--

INSERT INTO `accident_area` (`id`, `location`, `details`) VALUES
(1, 'dklwjshgf', 'lkjhgf'),
(2, 'dfghjkl', 'rshjklflklvuygtubgggbiuobijbninjinjonjbjuhb ib khb jhvbjlhvluhjvhjubvkh'),
(3, 'nadakkavu', 'beware');

-- --------------------------------------------------------

--
-- Table structure for table `accident_report`
--

CREATE TABLE `accident_report` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `vehicle_code` varchar(50) NOT NULL,
  `area` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accident_report`
--

INSERT INTO `accident_report` (`id`, `date`, `time`, `vehicle_code`, `area`) VALUES
(1, '1234-11-01', '13:44:00', 'jhgfd', 'calicutr'),
(2, '2021-01-06', '13:45:00', 'sdfghn', 'sdfgh'),
(3, '2021-01-02', '17:47:00', 'KL11BH1834', 'dxfcgvhbnm,'),
(4, '2020-12-30', '12:50:00', 'KL11BH1834', 'sdkj'),
(1234, '2021-01-11', '09:58:42', '123345676kh', 'droiturojthlgflnblngblndlfjgoitu98w4tjlljgutuskjkdkbfehkufyeaedrfghj'),
(1235, '2020-12-29', '12:20:00', 'KL 11 BH 1834', 'xchjkl');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `replay` varchar(30) NOT NULL,
  `date` date NOT NULL,
  `complaint` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`id`, `user_id`, `replay`, `date`, `complaint`) VALUES
(1, 1, 'rejected', '2021-01-07', 'system not working'),
(1234, 63746375, 'rejected', '2021-01-11', 'fhjghm'),
(1235, 123, 'rejected', '2021-01-01', 'NE PODA');

-- --------------------------------------------------------

--
-- Table structure for table `dangerous_area`
--

CREATE TABLE `dangerous_area` (
  `id` int(11) NOT NULL,
  `location` varchar(50) NOT NULL,
  `details` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dangerous_area`
--

INSERT INTO `dangerous_area` (`id`, `location`, `details`) VALUES
(1, 'thrissur', 'erejhjgdffrjgrjakljkgddfkfkj'),
(2, '', ''),
(3, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `detection_alert`
--

CREATE TABLE `detection_alert` (
  `id` int(11) NOT NULL,
  `alert` varchar(50) NOT NULL,
  `area` varchar(50) NOT NULL,
  `details` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detection_alert`
--

INSERT INTO `detection_alert` (`id`, `alert`, `area`, `details`) VALUES
(1, 'hiuhoijknjmklm', 'hghjjkj', 'yiunkmnm'),
(2, '', '', ''),
(3, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-01-02 06:28:38.612219'),
(2, 'auth', '0001_initial', '2021-01-02 06:28:40.037347'),
(3, 'admin', '0001_initial', '2021-01-02 06:28:47.461187'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-01-02 06:28:49.348654'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-01-02 06:28:49.398994'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-01-02 06:28:49.918875'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-01-02 06:28:50.606173'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-01-02 06:28:50.890968'),
(9, 'auth', '0004_alter_user_username_opts', '2021-01-02 06:28:50.932435'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-01-02 06:28:51.511555'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-01-02 06:28:51.571673'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-01-02 06:28:51.637152'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-01-02 06:28:51.745164'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-01-02 06:28:51.862011'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-01-02 06:28:51.964227'),
(16, 'auth', '0011_update_proxy_permissions', '2021-01-02 06:28:52.026743'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-01-02 06:28:52.468332'),
(18, 'sessions', '0001_initial', '2021-01-02 06:28:52.955409');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('1vmx1iz7jtipo10zoe1jmpwpa1f36cus', 'eyJ1aWQiOjF9:1kxRHM:yj_fIiVjACSktYEFdYdKCRzcs-Q-4ITPKNxF3d1Cs4M', '2021-01-21 09:08:24.729039');

-- --------------------------------------------------------

--
-- Table structure for table `emergencys_registration`
--

CREATE TABLE `emergencys_registration` (
  `id` int(11) NOT NULL,
  `service_name` varchar(60) NOT NULL,
  `contact` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `lid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `emergencys_registration`
--

INSERT INTO `emergencys_registration` (`id`, `service_name`, `contact`, `email`, `address`, `date`, `time`, `lid`) VALUES
(1, 'fhm', 'loca', 'dfghj@gmail.com', 'sasd', '2021-01-06', '14:41:00', 0),
(2, 'fhm', 'loca', 'dfghj@gmail.com', 'sasd', '2021-01-06', '14:41:00', 0),
(3, 'service', 'loca', 'dfghj@gmail.com', 'dfqw', '2021-01-06', '14:51:00', 0),
(4, 'service', 'loca', 'dfghj@gmail.com', 'dfqw', '2021-01-06', '14:51:00', 3),
(5, 'new', 'loca', 'dfghj@gmail.com', 'kjli', '2021-01-06', '18:02:00', 4);

-- --------------------------------------------------------

--
-- Table structure for table `emergency_contact`
--

CREATE TABLE `emergency_contact` (
  `e_id` int(11) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `name` varchar(20) NOT NULL,
  `place` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `emergency_contact`
--

INSERT INTO `emergency_contact` (`e_id`, `contact`, `name`, `place`) VALUES
(1, '789567899', 'nnmklhkjg', 'bhjbjbj'),
(34567, '1234', 'rthyujkilo', 'jkl;'),
(34568, 'ghjkl', 'fhjkl', 'fghjkl'),
(34569, '12345678', 'hitha vrinda', 'calicut palace'),
(34570, '04952242525', 'toll free', 'calicut');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `username`, `password`, `type`) VALUES
(1, 'admin', 'admin', 'admin'),
(2, 'emerg', 'emerg', 'emergency'),
(3, 'traffic', 'traffic', 'traffic'),
(4, 'emrg', 'emrg', 'emergency');

-- --------------------------------------------------------

--
-- Table structure for table `pothole_alert`
--

CREATE TABLE `pothole_alert` (
  `id` int(11) NOT NULL,
  `area` varchar(50) NOT NULL,
  `details` varchar(50) NOT NULL,
  `alert` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pothole_alert`
--

INSERT INTO `pothole_alert` (`id`, `area`, `details`, `alert`) VALUES
(1, 'jhjhkn', 'guyhihi', 'joijlji'),
(2, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `pothole_detailsid`
--

CREATE TABLE `pothole_detailsid` (
  `id` int(11) NOT NULL,
  `area` varchar(25) NOT NULL,
  `details` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pothole_detailsid`
--

INSERT INTO `pothole_detailsid` (`id`, `area`, `details`) VALUES
(1, '', ''),
(123, 'calicut', 'ghhjkll'),
(124, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `email` varchar(25) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `phone` varchar(20) NOT NULL,
  `lid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`id`, `name`, `address`, `email`, `date`, `time`, `phone`, `lid`) VALUES
(1, 'sdfghj', '\'[;plokijuhygtfr', 'dcv fb g h', '2021-01-05', '03:22:00', '', 0),
(2, '1234567', 'jkgjbjnk', 'cvbnm@gmail.com', '2021-01-04', '14:22:00', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `trafficcomplaint`
--

CREATE TABLE `trafficcomplaint` (
  `id` int(11) NOT NULL,
  `traffic_id` int(50) NOT NULL,
  `complaint` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reply` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trafficcomplaint`
--

INSERT INTO `trafficcomplaint` (`id`, `traffic_id`, `complaint`, `user_id`, `reply`) VALUES
(1, 3, 'traffic complaint', 1, 'TRAFFIC REPLY');

-- --------------------------------------------------------

--
-- Table structure for table `traffic_registration`
--

CREATE TABLE `traffic_registration` (
  `id` int(11) NOT NULL,
  `control_room` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telephone_no` varchar(25) NOT NULL,
  `location` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `lid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `traffic_registration`
--

INSERT INTO `traffic_registration` (`id`, `control_room`, `email`, `telephone_no`, `location`, `date`, `time`, `lid`) VALUES
(1, '67899', 'dfghj@gmail.com', '1234567', 'rtyuiop', '2021-02-04', '13:41:00', 0),
(2, '67899', 'dfghj@gmail.com', '1234567', 'rtyuiop', '2021-01-06', '13:41:00', 3),
(3, '67899', 'dfghj@gmail.com', '1234567', 'dklwjshgf', '2021-01-06', '16:40:00', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accident_alert`
--
ALTER TABLE `accident_alert`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `accident_area`
--
ALTER TABLE `accident_area`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `accident_report`
--
ALTER TABLE `accident_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dangerous_area`
--
ALTER TABLE `dangerous_area`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detection_alert`
--
ALTER TABLE `detection_alert`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `emergencys_registration`
--
ALTER TABLE `emergencys_registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emergency_contact`
--
ALTER TABLE `emergency_contact`
  ADD PRIMARY KEY (`e_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pothole_alert`
--
ALTER TABLE `pothole_alert`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pothole_detailsid`
--
ALTER TABLE `pothole_detailsid`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trafficcomplaint`
--
ALTER TABLE `trafficcomplaint`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `traffic_registration`
--
ALTER TABLE `traffic_registration`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accident_alert`
--
ALTER TABLE `accident_alert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `accident_area`
--
ALTER TABLE `accident_area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `accident_report`
--
ALTER TABLE `accident_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1236;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1236;

--
-- AUTO_INCREMENT for table `dangerous_area`
--
ALTER TABLE `dangerous_area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `detection_alert`
--
ALTER TABLE `detection_alert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `emergencys_registration`
--
ALTER TABLE `emergencys_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `emergency_contact`
--
ALTER TABLE `emergency_contact`
  MODIFY `e_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34571;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pothole_alert`
--
ALTER TABLE `pothole_alert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pothole_detailsid`
--
ALTER TABLE `pothole_detailsid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `trafficcomplaint`
--
ALTER TABLE `trafficcomplaint`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `traffic_registration`
--
ALTER TABLE `traffic_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
