-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2022 at 09:21 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vengg`
--

-- --------------------------------------------------------

--
-- Table structure for table `dep`
--

CREATE TABLE `dep` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_create` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dep`
--

INSERT INTO `dep` (`id`, `name`, `date_create`) VALUES
(1, 'พนักงานคอมพิวเตอร์', '2019-08-10 17:45:49'),
(2, 'นักวิชาการคอมพิวเตอร์', '2019-08-10 17:45:49'),
(3, 'เจ้าหน้าที่ศาลยุติธรรมปฏิบัติงาน', '2019-08-10 17:45:49'),
(4, 'เจ้าหน้าที่ศาลยุติธรรมชำนาญงาน', '2019-08-10 17:45:49'),
(5, 'นักจิตวิทยาปฏิบัติการ', '2019-08-10 17:45:49'),
(6, 'พนักงานสถานที่', '2019-08-10 17:45:49'),
(7, 'พนักงานขับรถยนต์', '2019-08-10 17:45:49'),
(8, 'เจ้าหน้าที่ศาลยุติธรรม', '2019-08-10 17:45:49'),
(9, 'เจ้าพนักงานศาลยุติธรรมปฏิบัติการ', '2019-08-10 17:45:49'),
(10, 'นิติกรชำนาญการ', '2019-08-10 17:45:49'),
(11, 'เจ้าพนักงานศาลยุติธรรมชำนาญการ', '2019-08-10 17:45:49'),
(12, 'นักวิชาการเงินและบัญชีปฏิบัติการ', '2019-08-10 17:45:49'),
(13, 'เจ้าพนักงานศาลยุติธรรมชำนาญการพิเศษ', '2019-08-10 17:45:49'),
(14, 'นิติกร', '2019-08-10 17:45:49'),
(15, 'ผู้อำนวยการฯ', '2019-08-10 17:45:49'),
(16, 'เจ้าพนักงานการเงินและบัญชีปฏิบัติงาน', NULL),
(17, 'พนักงานขับรถยนต์(จ้างเหมา)', NULL),
(18, 'ผู้พิพากษาศาลเยาวชนและครอบครัวจังหวัดประจวบคีรีขันธ์', NULL),
(19, 'นิติกรชำนาญการพิเศษ', NULL),
(20, 'ผู้พิพากษาหัวหน้าศาลเยาวชนและครอบครัวจังหวัดประจวบคีรีขันธ์', NULL),
(21, 'ผู้พิพากษาหัวหน้าคณะชั้นต้นในศาลเยาวชนและครอบครัวจังหวัดประจวบคีรีขันธ์', NULL),
(22, 'นักจิตวิทยาชำนาญการ', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fname`
--

CREATE TABLE `fname` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_create` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fname`
--

INSERT INTO `fname` (`id`, `name`, `date_create`) VALUES
(1, 'นาย', '2019-08-10 17:45:49'),
(2, 'นาง', '2019-08-10 17:45:50'),
(3, 'นางสาว', '2019-08-10 17:45:50'),
(4, 'พันจ่าเอก', NULL),
(5, 'พ.ต.อ.', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE `group` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_create` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`id`, `name`, `date_create`) VALUES
(1, 'ผู้อำนวยการฯ', '2019-10-06 18:49:32'),
(2, 'กลุ่มช่วยอำนวยการ', '2019-10-06 18:49:32'),
(3, 'กลุ่มงานช่วยพิจารณาคดี', '2019-10-06 18:49:32'),
(4, 'กลุ่มงานคดี', '2019-10-06 18:49:32'),
(5, 'กลุ่มงานคลัง', '2019-10-06 18:49:32'),
(6, 'กลุ่มงานปริการประชาชนและประชาสัมพันธ์', '2019-10-06 18:49:32'),
(7, 'กลุ่มงานไกล่เกลี่ยและประนอมข้อพิพาท', '2019-10-06 18:49:32'),
(8, 'ผู้พิพากษา', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `line`
--

CREATE TABLE `line` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `line`
--

INSERT INTO `line` (`id`, `name`, `token`, `status`) VALUES
(23, 'ven', 'on2isqp1dpGKDoknsAVBCY3aIrhH5CBLPXPykujzUkq', 1),
(31, 'admin', 'on2isqp1dpGKDoknsAVBCY3aIrhH5CBLPXPykujzUkq', 1),
(41, 'ven_admin', 'on2isqp1dpGKDoknsAVBCY3aIrhH5CBLPXPykujzUkq', 1);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_card` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fname` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `bloodtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dep` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `workgroup` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_account` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_comment` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) DEFAULT 10,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `st` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id`, `user_id`, `id_card`, `fname`, `name`, `sname`, `img`, `birthday`, `bloodtype`, `dep`, `workgroup`, `address`, `phone`, `bank_account`, `bank_comment`, `status`, `created_at`, `updated_at`, `st`) VALUES
(1566445991, '1566445991', NULL, 'นาย', 'admin', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, '2022-10-20 11:27:24', 1),
(1666244627, '1666244627', NULL, 'นาย', 'user1', 'suser1', NULL, NULL, NULL, 'นิติกร', 'กลุ่มงานคดี', NULL, '', '', '', 10, '2022-10-20 12:43:47', '2022-10-20 12:43:54', 1),
(1666246165, '1666246165', NULL, 'นาย', 'ผู้พิพากษา1', 'just1', NULL, NULL, NULL, 'ผู้พิพากษาศาลเยาวชนและครอบครัวจังหวัดประจวบคีรีขันธ์', 'ผู้พิพากษา', NULL, '0000', '123456000', 'ลาดพร้าว', 10, '2022-10-20 01:09:25', '2022-10-20 01:10:00', NULL),
(1666246246, '1666246246', NULL, 'นางสาว', 'ผู้พิพากษา2', 'j2', NULL, NULL, NULL, 'ผู้พิพากษาหัวหน้าคณะชั้นต้นในศาลเยาวชนและครอบครัวจังหวัดประจวบคีรีขันธ์', 'ผู้พิพากษา', NULL, '', '', '', 10, '2022-10-20 01:10:46', '2022-10-20 01:10:46', NULL),
(1666246310, '1666246310', NULL, 'นาย', 'ผู้พิพากษา3', 'j3', NULL, NULL, NULL, 'ผู้พิพากษาหัวหน้าศาลเยาวชนและครอบครัวจังหวัดประจวบคีรีขันธ์', 'ผู้พิพากษา', NULL, '', '1234', 'ประจวบ', 10, '2022-10-20 01:11:50', '2022-10-20 01:11:50', NULL),
(1666246391, '1666246391', NULL, 'นาย', 'ผอ', 'p', NULL, NULL, NULL, 'ผู้อำนวยการฯ', 'ผู้อำนวยการฯ', NULL, '', '1234', 'ทดสอบ', 10, '2022-10-20 01:13:11', '2022-10-20 01:13:11', NULL),
(1666246444, '1666246444', NULL, 'นาย', 'u3', '33', NULL, NULL, NULL, 'นิติกรชำนาญการพิเศษ', 'กลุ่มงานปริการประชาชนและประชาสัมพันธ์', NULL, '', '111', '111', 10, '2022-10-20 01:14:04', '2022-10-20 01:14:04', NULL),
(1666246496, '1666246496', NULL, 'นาย', 'user4', '44', NULL, NULL, NULL, 'เจ้าพนักงานศาลยุติธรรมปฏิบัติการ', 'กลุ่มงานคดี', NULL, '', '123', '', 10, '2022-10-20 01:14:56', '2022-10-20 01:14:56', NULL),
(1666246541, '1666246541', NULL, 'นางสาว', 'u5', 'u5', NULL, NULL, NULL, 'นักวิชาการเงินและบัญชีปฏิบัติการ', 'กลุ่มงานคลัง', NULL, '', '', '', 10, '2022-10-20 01:15:41', '2022-10-20 01:15:41', NULL),
(1666246577, '1666246577', NULL, 'นาย', 'u6', 'u6', NULL, NULL, NULL, 'พนักงานขับรถยนต์', 'กลุ่มงานคลัง', NULL, '', '', '', 10, '2022-10-20 01:16:17', '2022-10-20 01:16:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` smallint(6) NOT NULL DEFAULT 1,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `role`, `status`, `created_at`, `updated_at`) VALUES
(1566445991, 'admin', 'qdYs15wrU3R7ghAuAuXNMc-fFxlZ8QyT', '$2y$10$Qu3WyTQeq88ZEjej.4gdOe6jNbIQSBmJZiFYYgrWXkyjFzxlH38Wy', 'VSorsXwWyDjK0WwK76PNqcdsextFlwai_1566445992', NULL, 9, 10, '2000-01-01 00:00:00', '2022-10-20 11:27:24'),
(1666244627, 'user1', NULL, '$2y$10$90wlQYqxCav/Apw6AWaCA.107w3wjGwBirvRd81btuxV3v6nRZiMi', NULL, NULL, 1, 10, '2022-10-20 12:43:47', '2022-10-20 12:43:54'),
(1666246165, 'j6501', NULL, '$2y$10$1euEAu.gsIgscYqvnVMEaeap6Tsy7jt/SlqdGRMXCWRVqgfzGAO8W', NULL, NULL, 1, 10, '2022-10-20 01:09:25', '2022-10-20 01:09:25'),
(1666246246, 'j6502', NULL, '$2y$10$ryOKlwQBgSd2tz6SjYPMFO1QmVyp4hERRclf.A/tGcxOrYLFXfovq', NULL, NULL, 1, 10, '2022-10-20 01:10:46', '2022-10-20 01:10:46'),
(1666246310, 'j6503', NULL, '$2y$10$4w3CfthmbKidoQg21pJcyekF74PmmwTuKIqmklUiAH8JD4jF34o66', NULL, NULL, 1, 10, '2022-10-20 01:11:50', '2022-10-20 01:11:50'),
(1666246391, 'u2', NULL, '$2y$10$WSBy9RtPUgu8YCzW7N6lPuM4HKlaeUwIsfXgtQ26nQ0woQwAFIv6i', NULL, NULL, 1, 10, '2022-10-20 01:13:11', '2022-10-20 01:13:11'),
(1666246444, 'u3', NULL, '$2y$10$PzAslI.iinzhTrlCMk2WXeT9QT/pKFKV00hVqdHqQ6Vdhq66D32Vu', NULL, NULL, 1, 10, '2022-10-20 01:14:04', '2022-10-20 01:14:04'),
(1666246496, 'u4', NULL, '$2y$10$cOQbgNPPZdTL6FwJlWzEb.8.MUTmDBaXFuIBqgUFzEji9VGajqXzO', NULL, NULL, 1, 10, '2022-10-20 01:14:56', '2022-10-20 01:14:56'),
(1666246541, 'u5', NULL, '$2y$10$pyiybDFK9f.wL9HeIX8yGuuLM9maDh84xWOYM5wSmXKPvBp2Z/oWe', NULL, NULL, 1, 10, '2022-10-20 01:15:41', '2022-10-20 01:15:41'),
(1666246577, 'u6', NULL, '$2y$10$DlsS8jmn8Y01GUyejXxXougyenxsvUKXZJsLNd9Z2GEr7SuCAnC1C', NULL, NULL, 1, 10, '2022-10-20 01:16:17', '2022-10-20 01:16:17');

-- --------------------------------------------------------

--
-- Table structure for table `ven`
--

CREATE TABLE `ven` (
  `id` int(11) NOT NULL,
  `user_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `u_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ven_com_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ven_com_idb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ven_date` date NOT NULL,
  `ven_time` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ven_month` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DN` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ven_com_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ven_com_num_all` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ven_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `u_role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gcal_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `create_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ven`
--

INSERT INTO `ven` (`id`, `user_id`, `u_name`, `ven_com_id`, `ven_com_idb`, `ven_date`, `ven_time`, `ven_month`, `DN`, `ven_com_name`, `ven_com_num_all`, `ven_name`, `u_role`, `ref1`, `ref2`, `price`, `file`, `comment`, `gcal_id`, `status`, `update_at`, `create_at`) VALUES
(1666249182, '1666246165', 'นายผู้พิพากษา1 just1', '[1666249130]', '1666249130', '2022-11-01', '08:30:10', '2022-11', 'กลางวัน', '', '1/2565', 'ฟื้นฟู/ตรวจสอบการจับ', 'ผู้พิพากษา', 'Nnyq8xbFWXTjriLZC0Mp', 'Nnyq8xbFWXTjriLZC0Mp', '3500.00', NULL, NULL, NULL, 1, '2022-10-20 13:59:42', '2022-10-20 13:59:42'),
(1666249184, '1666246246', 'นางสาวผู้พิพากษา2 j2', '[1666249130]', '1666249130', '2022-11-02', '08:30:10', '2022-11', 'กลางวัน', '', '1/2565', 'ฟื้นฟู/ตรวจสอบการจับ', 'ผู้พิพากษา', 'EV1ax4I2yb0UKXiAfck8', 'EV1ax4I2yb0UKXiAfck8', '3500.00', NULL, NULL, NULL, 1, '2022-10-20 13:59:44', '2022-10-20 13:59:44'),
(1666249187, '1666246310', 'นายผู้พิพากษา3 j3', '[1666249130]', '1666249130', '2022-11-03', '08:30:10', '2022-11', 'กลางวัน', '', '1/2565', 'ฟื้นฟู/ตรวจสอบการจับ', 'ผู้พิพากษา', 'ES0gLNGwxpJI1yWTmuHe', 'ES0gLNGwxpJI1yWTmuHe', '3500.00', NULL, NULL, NULL, 1, '2022-10-20 13:59:47', '2022-10-20 13:59:47'),
(1666249195, '1666246165', 'นายผู้พิพากษา1 just1', '[1666249152]', '1666249152', '2022-11-02', '16:30:10', '2022-11', 'กลางคืน', '', '2/2565', 'หมายจับ-ค้น', 'ผู้พิพากษา', '03VlKti1ELGSCydMwUYo', '03VlKti1ELGSCydMwUYo', '2500.00', NULL, NULL, NULL, 1, '2022-10-20 13:59:55', '2022-10-20 13:59:55'),
(1666249200, '1666246310', 'นายผู้พิพากษา3 j3', '[1666249152]', '1666249152', '2022-11-01', '16:30:10', '2022-11', 'กลางคืน', '', '2/2565', 'หมายจับ-ค้น', 'ผู้พิพากษา', '80LhqEUkvwHf3PIYMKmp', '80LhqEUkvwHf3PIYMKmp', '2500.00', NULL, NULL, NULL, 1, '2022-10-20 14:00:00', '2022-10-20 14:00:00'),
(1666249204, '1666246165', 'นายผู้พิพากษา1 just1', '[1666249152]', '1666249152', '2022-11-03', '16:30:10', '2022-11', 'กลางคืน', '', '2/2565', 'หมายจับ-ค้น', 'ผู้พิพากษา', '96QajqIMuWLY8roU5ybN', '96QajqIMuWLY8roU5ybN', '2500.00', NULL, NULL, NULL, 1, '2022-10-20 14:20:03', '2022-10-20 14:00:04'),
(1666250403, '1666246246', 'นางสาวผู้พิพากษา2 j2', '[1666249152]', '1666249152', '2022-11-03', '16:30:10', '2022-11', 'กลางคืน', '', '2/2565', 'หมายจับ-ค้น', 'ผู้พิพากษา', 'R7YD4sUvWLCVdTz0Pocx', '96QajqIMuWLY8roU5ybN', '2500.00', NULL, NULL, NULL, 77, '2022-10-20 14:20:03', '2022-10-20 14:20:03');

-- --------------------------------------------------------

--
-- Table structure for table `ven_change`
--

CREATE TABLE `ven_change` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ven_month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ven_date1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ven_date2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ven_com_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ven_com_num_all` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `u_role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ven_id1` int(11) DEFAULT NULL,
  `ven_id2` int(11) DEFAULT NULL,
  `ven_id1_old` int(11) DEFAULT NULL,
  `ven_id2_old` int(11) DEFAULT NULL,
  `user_id1` int(11) DEFAULT NULL,
  `user_id2` int(11) DEFAULT NULL,
  `s_po` int(11) DEFAULT NULL,
  `s_bb` int(11) DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ven_change`
--

INSERT INTO `ven_change` (`id`, `ven_month`, `ven_date1`, `ven_date2`, `ven_com_id`, `ven_com_num_all`, `DN`, `u_role`, `ven_id1`, `ven_id2`, `ven_id1_old`, `ven_id2_old`, `user_id1`, `user_id2`, `s_po`, `s_bb`, `file`, `status`, `ref1`, `ref2`, `comment`, `create_at`) VALUES
('CH1666250403', '2022-11', '2022-11-03', '2022-11-03', '[1666249152]', '2/2565', 'กลางคืน', 'ผู้พิพากษา', 1666250403, NULL, 1666249204, NULL, 1666246165, 1666246246, NULL, NULL, NULL, '77', 'R7YD4sUvWLCVdTz0Pocx', NULL, NULL, '2022-10-20 14:20:03');

-- --------------------------------------------------------

--
-- Table structure for table `ven_com`
--

CREATE TABLE `ven_com` (
  `id` int(11) NOT NULL,
  `ven_com_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ven_com_date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ven_month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ven_com_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ven_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ven_name_id` int(11) DEFAULT NULL,
  `u_role` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  `color` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ven_com`
--

INSERT INTO `ven_com` (`id`, `ven_com_num`, `ven_com_date`, `ven_month`, `ven_com_name`, `status`, `ven_name`, `ven_name_id`, `u_role`, `price`, `color`, `comment`, `file`, `ref`, `create_at`) VALUES
(1666249130, '1/2565', '2022-10-20', '2022-11', '', '1', 'ฟื้นฟู/ตรวจสอบการจับ', NULL, NULL, NULL, NULL, NULL, NULL, 'EG4nYb8lhINUJdKRZcpe', NULL),
(1666249152, '2/2565', '2022-10-20', '2022-11', '', '1', 'หมายจับ-ค้น', NULL, NULL, NULL, NULL, NULL, NULL, 'yfaHsQb0mDKRBA6JnvT2', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ven_name`
--

CREATE TABLE `ven_name` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `DN` varchar(255) DEFAULT NULL,
  `srt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ven_name`
--

INSERT INTO `ven_name` (`id`, `name`, `DN`, `srt`) VALUES
(18, 'ฟื้นฟู/ตรวจสอบการจับ', 'กลางวัน', 1),
(19, 'หมายจับ-ค้น', 'กลางคืน', 2);

-- --------------------------------------------------------

--
-- Table structure for table `ven_name_sub`
--

CREATE TABLE `ven_name_sub` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ven_name_id` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `srt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ven_name_sub`
--

INSERT INTO `ven_name_sub` (`id`, `name`, `ven_name_id`, `price`, `color`, `srt`) VALUES
(90, 'ผอ./แทน', 18, 1500, 'Violet', 2),
(91, 'เจ้าหน้าที่', 18, 1500, 'Magenta', 3),
(92, 'ผู้พิพากษา', 18, 3500, 'BlueViolet', 1),
(95, 'ผู้พิพากษา', 19, 2500, 'Purple', 1),
(96, 'จนท.', 19, 1200, 'SlateBlue', 2);

-- --------------------------------------------------------

--
-- Table structure for table `ven_user`
--

CREATE TABLE `ven_user` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `u_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(2) DEFAULT NULL,
  `ven_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uvn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `v_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ven_user`
--

INSERT INTO `ven_user` (`id`, `user_id`, `u_name`, `order`, `ven_name`, `uvn`, `DN`, `v_time`, `price`, `color`, `comment`, `create_at`) VALUES
(152, 1666246165, 'นายผู้พิพากษา1 just1', 1, 'ฟื้นฟู/ตรวจสอบการจับ', 'ผู้พิพากษา', 'กลางวัน', '08:30:11', '3500', 'BlueViolet', NULL, '2022-10-20 01:16:25'),
(153, 1666246246, 'นางสาวผู้พิพากษา2 j2', 2, 'ฟื้นฟู/ตรวจสอบการจับ', 'ผู้พิพากษา', 'กลางวัน', '08:30:11', '3500', 'BlueViolet', NULL, '2022-10-20 01:16:25'),
(161, 1666246165, 'นายผู้พิพากษา1 just1', 1, 'หมายจับ-ค้น', 'ผู้พิพากษา', 'กลางคืน', '16:30:21', '2500', 'Purple', NULL, '2022-10-20 01:18:09'),
(162, 1666246246, 'นางสาวผู้พิพากษา2 j2', 2, 'หมายจับ-ค้น', 'ผู้พิพากษา', 'กลางคืน', '16:30:21', '2500', 'Purple', NULL, '2022-10-20 01:18:09'),
(163, 1666246310, 'นายผู้พิพากษา3 j3', 3, 'หมายจับ-ค้น', 'ผู้พิพากษา', 'กลางคืน', '16:30:21', '2500', 'Purple', NULL, '2022-10-20 01:18:09'),
(164, 1666246310, 'นายผู้พิพากษา3 j3', 3, 'ฟื้นฟู/ตรวจสอบการจับ', 'ผู้พิพากษา', 'กลางวัน', '08:30:11', '3500', 'BlueViolet', NULL, '2022-10-20 01:51:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dep`
--
ALTER TABLE `dep`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fname`
--
ALTER TABLE `fname`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `line`
--
ALTER TABLE `line`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- Indexes for table `ven`
--
ALTER TABLE `ven`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ven_change`
--
ALTER TABLE `ven_change`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ven_com`
--
ALTER TABLE `ven_com`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ven_name`
--
ALTER TABLE `ven_name`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ven_name_sub`
--
ALTER TABLE `ven_name_sub`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ven_user`
--
ALTER TABLE `ven_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dep`
--
ALTER TABLE `dep`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `fname`
--
ALTER TABLE `fname`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `group`
--
ALTER TABLE `group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `line`
--
ALTER TABLE `line`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1666246578;

--
-- AUTO_INCREMENT for table `ven`
--
ALTER TABLE `ven`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1666250404;

--
-- AUTO_INCREMENT for table `ven_com`
--
ALTER TABLE `ven_com`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1666249153;

--
-- AUTO_INCREMENT for table `ven_name`
--
ALTER TABLE `ven_name`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `ven_name_sub`
--
ALTER TABLE `ven_name_sub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `ven_user`
--
ALTER TABLE `ven_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
