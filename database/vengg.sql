-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2022 at 03:13 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `main`
--

-- --------------------------------------------------------

--
-- Table structure for table `bila`
--

CREATE TABLE `bila` (
  `id` int(11) NOT NULL,
  `running` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `cat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `p1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `p2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_begin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_end` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_total` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `due` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateO_begin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateO_end` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateO_total` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `t1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `t2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `po` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bigboss` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_create` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bila`
--

INSERT INTO `bila` (`id`, `running`, `user_id`, `cat`, `p1`, `p2`, `date_begin`, `date_end`, `date_total`, `due`, `dateO_begin`, `dateO_end`, `dateO_total`, `address`, `t1`, `t2`, `t3`, `comment`, `file`, `po`, `bigboss`, `date_create`, `status`) VALUES
(1663163149, '65001', 1566445991, 'ลาพักผ่อน', '10', '20', '2022-09-23', '2022-09-30', '8', NULL, NULL, NULL, NULL, '-', '8', '8', '16', '', NULL, '14', '14', '2022-09-14', '4'),
(1663437266, '65002', 1566445991, 'ลาป่วย', NULL, NULL, '2022-09-15', '2022-09-16', '2', '', '2022-09-01', '2022-09-02', '2', '-', '0', '2', '2', '', NULL, '14', '11', '2022-09-18', '1');

-- --------------------------------------------------------

--
-- Table structure for table `blueshirt`
--

CREATE TABLE `blueshirt` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `line_alert` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(18, 'ผู้พิพากษาศาลจังหวัดสมุทรสาคร', NULL),
(19, 'นิติกรชำนาญการพิเศษ', NULL),
(20, 'ผู้พิพากษาหัวหน้าศาลจังหวัดสมุทรสาคร', NULL),
(21, 'ผู้พิพากษาหัวหน้าคณะชั้นต้นในศาลจังหวัดสมุทรสาคร', NULL),
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
(8, 'ผู้พิพากษา', NULL),
(9, 'ผู้พิพากษาหัวหน้าศาลฯ', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `law_ban`
--

CREATE TABLE `law_ban` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ban` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_owner` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `legal_c`
--

CREATE TABLE `legal_c` (
  `id` int(11) NOT NULL,
  `id_card` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fname` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `legal_c_ven`
--

CREATE TABLE `legal_c_ven` (
  `id` int(11) NOT NULL,
  `ven_date` date NOT NULL,
  `legal_c_id` int(11) NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(20, 'bila_admin', '', 1),
(23, 'ven', 'on2isqp1dpGKDoknsAVBCY3aIrhH5CBLPXPykujzUkq', 1),
(31, 'admin', 'on2isqp1dpGKDoknsAVBCY3aIrhH5CBLPXPykujzUkq', 1),
(39, 'LineGroup', 'Smew8QWVNcOnjwvTeHCn4awTI4bZbdIPT1HUzaC2ZHo', 1),
(41, 'ven_admin', 'on2isqp1dpGKDoknsAVBCY3aIrhH5CBLPXPykujzUkq', 1);

-- --------------------------------------------------------

--
-- Table structure for table `line_home`
--

CREATE TABLE `line_home` (
  `id` int(11) NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `client_secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_ser` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `api_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `callback_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `line_home`
--

INSERT INTO `line_home` (`id`, `client_id`, `client_secret`, `name_ser`, `api_url`, `callback_url`) VALUES
(1, 'JtRAgPTreLiGpyGWFuWj1S', 'QK5yEVct0oCxhD7JIWgh0fyYJ6UJkPxcBrRROs4EQSK', 'webPk', 'http://127.0.0.1/main/line/line_index', 'http://127.0.0.1/main/line/callback'),
(2, 'JtRAgPTreLiGpyGWFuWj1S', 'QK5yEVct0oCxhD7JIWgh0fyYJ6UJkPxcBrRROs4EQSK', 'webPk_user', 'http://127.0.0.1/main/user/line_index', 'http://127.0.0.1/main/user/callback'),
(4, '', '', 'googleCal', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `manager` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `detail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(1566445991, '1566445991', '', 'นาย', 'admin', 'admin', NULL, NULL, NULL, '', '', '', '032000', '123456125', 'Plldkd', 10, NULL, '2021-10-14 21:58:28', NULL),
(1663280470, '1663280470', '10', 'นาง', 'ปิยพร', 'พหรมเทศน์', NULL, NULL, NULL, 'ผู้พิพากษาหัวหน้าศาลจังหวัดสมุทรสาคร', 'ผู้พิพากษาหัวหน้าศาลฯ', '', '', NULL, NULL, 10, NULL, '2022-11-10 08:08:13', 1),
(1663499891, '1663499891', '', 'นาย', 'อาคม', 'ปุณยธัญพงศ์', '9d45f4ca13d65be020d35d53e697180a.jpg', NULL, NULL, 'นักวิชาการคอมพิวเตอร์', 'กลุ่มช่วยอำนวยการ', '', '', NULL, NULL, 10, NULL, NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `running`
--

CREATE TABLE `running` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `r` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `running`
--

INSERT INTO `running` (`id`, `name`, `y`, `r`) VALUES
(1, 'bila', 2565, 65002);

-- --------------------------------------------------------

--
-- Table structure for table `sign_boss_name`
--

CREATE TABLE `sign_boss_name` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dep1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dep2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dep3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `date_create` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sign_boss_name`
--

INSERT INTO `sign_boss_name` (`id`, `name`, `dep1`, `dep2`, `dep3`, `status`, `date_create`) VALUES
(11, 'นางปิยพร  พหรมเทศน์', 'ผู้พิพากษาหัวหน้าศาลจังหวัดสมุทรสาคร', 'จังหวัดสมุทรสาคร', '', 1, '2022-11-08 14:35:10'),
(14, 'นายอนุเทพ อินทรชิต', 'ผู้อำนวยการสำนักงานประจำศาลจังหวัดสมุทรสาคร', 'สมุทรสาคร', '', 1, '2022-11-08 14:35:50');

-- --------------------------------------------------------

--
-- Table structure for table `somtop`
--

CREATE TABLE `somtop` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `st` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `somtop_v`
--

CREATE TABLE `somtop_v` (
  `id` int(11) NOT NULL,
  `ven_date` date NOT NULL,
  `somtop_id` int(11) NOT NULL,
  `comment` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(1566445991, 'admin', 'qdYs15wrU3R7ghAuAuXNMc-fFxlZ8QyT', '$2y$13$UmmYnhZMbjISIu8HAyn5nOPgW7pEXwczrjAhTHBsEs0FF5da5vbVK', 'VSorsXwWyDjK0WwK76PNqcdsextFlwai_1566445992', '', 9, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1663280470, 'Boss', 'LT1ykKY4zcaELtsbcj88wR0o-7hqXihW', '$2y$13$.Uwt1vTzaEp.tYYjOXQQhuobfnaqJ0eGYwkqox60fkTbgaRNdJyka', 'Bbq2ME3JbltAOYwYWWxCU6tFL4kvfL8D_1663280470', '', 1, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1663499891, 'arkhom', '_FXb4-Rs1aYhqgG6oZXAH08gdnBmXBMC', '$2y$13$zzilTUSWsVnGyH/OSlxW/.RP.6DWcZmotzvDeEiy6DrFq8WQQj3iq', 'dn7OYHjduxfvL5FJPWqDZwyeEcdgDhu9_1663499891', '', 1, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

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
(1668086438, '1663280470', 'นางปิยพร พหรมเทศน์', '[1668086419]', '1668086419', '2022-12-07', '08:30:20', '2022-12', 'กลางวัน', 'ฟื้นฟู/ตรวจสอบการจับ', '1/2565', 'ฟื้นฟู/ตรวจสอบการจับ', 'ดดด', 'stKkMXhy9v28FbJLNCRB', 'stKkMXhy9v28FbJLNCRB', '1500.00', NULL, NULL, NULL, 1, '2022-11-10 20:20:38', '2022-11-10 20:20:38'),
(1668086440, '1566445991', 'นายadmin admin', '[1668086419]', '1668086419', '2022-12-08', '08:30:20', '2022-12', 'กลางวัน', 'ฟื้นฟู/ตรวจสอบการจับ', '1/2565', 'ฟื้นฟู/ตรวจสอบการจับ', 'ดดด', 'beTa4ZwN6ArIzSjL1VYp', 'beTa4ZwN6ArIzSjL1VYp', '1500.00', NULL, NULL, NULL, 4, '2022-11-10 20:55:17', '2022-11-10 20:20:40'),
(1668086442, '1663499891', 'นายอาคม ปุณยธัญพงศ์', '[1668086419]', '1668086419', '2022-12-09', '08:30:20', '2022-12', 'กลางวัน', 'ฟื้นฟู/ตรวจสอบการจับ', '1/2565', 'ฟื้นฟู/ตรวจสอบการจับ', 'ดดด', 'jxXhY8vO3A42m0Wrtuyf', 'jxXhY8vO3A42m0Wrtuyf', '1500.00', NULL, NULL, NULL, 4, '2022-11-10 20:55:17', '2022-11-10 20:20:42'),
(1668088517, '1663499891', 'นายอาคม ปุณยธัญพงศ์', '[1668086419]', '1668086419', '2022-12-08', '08:30:20', '2022-12', 'กลางวัน', 'ฟื้นฟู/ตรวจสอบการจับ', '1/2565', 'ฟื้นฟู/ตรวจสอบการจับ', 'ดดด', 'XL98BOnxs2TrdJcezYC5', 'beTa4ZwN6ArIzSjL1VYp', '1500.00', NULL, NULL, NULL, 2, '2022-11-10 20:55:17', '2022-11-10 20:55:17'),
(1668088518, '1566445991', 'นายadmin admin', '[1668086419]', '1668086419', '2022-12-09', '08:30:20', '2022-12', 'กลางวัน', 'ฟื้นฟู/ตรวจสอบการจับ', '1/2565', 'ฟื้นฟู/ตรวจสอบการจับ', 'ดดด', 'XL98BOnxs2TrdJcezYC5', 'jxXhY8vO3A42m0Wrtuyf', '1500.00', NULL, NULL, NULL, 2, '2022-11-10 20:55:17', '2022-11-10 20:55:17');

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
('CH1666250403', '2022-11', '2022-11-03', '2022-11-03', '[1666249152]', '2/2565', 'กลางคืน', 'ผู้พิพากษา', 1666250403, NULL, 1666249204, NULL, 1666246165, 1666246246, NULL, NULL, NULL, '77', 'R7YD4sUvWLCVdTz0Pocx', NULL, NULL, '2022-10-20 14:20:03'),
('CH1668088517', '2022-12', '2022-12-08', '2022-12-09', '[1668086419]', '1/2565', 'กลางวัน', 'ดดด', 1668088517, 1668088518, 1668086440, 1668086442, 1566445991, 1663499891, NULL, NULL, NULL, '2', 'XL98BOnxs2TrdJcezYC5', NULL, NULL, '2022-11-10 20:55:17');

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
(1668086419, '1/2565', '2022-11-11', '2022-12', '', '1', 'ฟื้นฟู/ตรวจสอบการจับ', NULL, NULL, NULL, NULL, NULL, NULL, '7L49OEApmYkes2w1d5jQ', NULL);

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
(95, 'ผู้พิพากษา', 19, 2500, 'Purple', 1),
(96, 'จนท.', 19, 1200, 'SlateBlue', 2),
(98, 'ผู้พิพากษา', 18, 1500, '', 1),
(99, 'ดดด', 18, 1500, '', 2);

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
(165, 1566445991, 'นายadmin admin', 3, 'ฟื้นฟู/ตรวจสอบการจับ', 'ดดด', 'กลางวัน', '08:30:12', '1500', '', NULL, '2022-11-10 08:19:47'),
(166, 1663280470, 'นางปิยพร พหรมเทศน์', 1, 'ฟื้นฟู/ตรวจสอบการจับ', 'ดดด', 'กลางวัน', '08:30:12', '1500', '', NULL, '2022-11-10 08:19:47'),
(167, 1663499891, 'นายอาคม ปุณยธัญพงศ์', 4, 'ฟื้นฟู/ตรวจสอบการจับ', 'ดดด', 'กลางวัน', '08:30:12', '1500', '', NULL, '2022-11-10 08:19:47');

-- --------------------------------------------------------

--
-- Table structure for table `web_link`
--

CREATE TABLE `web_link` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `web_link`
--

INSERT INTO `web_link` (`id`, `name`, `link`, `img`, `create_at`, `update_at`) VALUES
(1, 'Network Studio --', 'http://cbooking.coj.intra/', '39b0ccc77a60bab868d70f61531d6e72.jpg', '2019-01-24 09:24:17', '2019-02-26 19:34:33'),
(3, 'ระบบบริการข้อมูลคดีศาลยุติธรรม - Case Information Online Service (CIOS) --เจ้าหน้าที่--', 'http://cios.coj.intra/', '0418d82fe2dbb8b1875fe76b6cf6c2d7.jpg', '2019-01-24 09:26:39', '2020-03-30 14:01:03'),
(4, 'ระบบการจัดการงานล่ามศาลยุติธรรม (Court Interpreter Service and Management System : CISMS)', 'http://cisms.coj.intra/index.php', '716e9f8dbbb59d4f4c45557ac4d53078.jpg', '2019-01-24 09:27:16', '2019-02-22 10:48:24'),
(5, 'โปรแกรมระบบจัดเก็บข้อมูลสถิติคดี ของศาลยุติธรรม ระยะที่ 2', 'http://10.1.2.9/court_stat_program/', '3d3938d99fccc4ce1679af86c4935532.jpg', '2019-01-28 11:39:36', '2019-02-22 10:47:32'),
(6, 'ระบบการส่งเอกสารและการประกาศนัดไต่สวนโดยวิธีการลงโฆษณาทางสื่อเทคโนโลยีสารสนเทศ e-notice (enotice)', 'https://enotice.coj.go.th/login', '4d7f52b2665abe5e99e018f6f98c9771.jpg', '2019-01-28 15:02:30', '2021-02-08 14:59:47'),
(7, 'ที่ปรึกษากฎหมาย ศาลเยาวชนฯกลาง', 'http://10.25.0.115/lcon/', 'd533fa6ff0a1832a46164dcf71402b22.jpg', '2019-01-29 08:53:04', '2019-02-22 10:19:06'),
(8, 'ระบบสืบค้นคำพิพากษาชั้นต้น', 'https://decision.coj.go.th/admin', '5937775d969f086eade58217719c0f71.jpg', '2019-01-29 13:57:04', '2019-02-28 14:27:00'),
(9, 'ระบบการจัดเก็บและให้บริการคัดสำเนาคำพิพากษาระหว่างศาล DSS-Decision System ', 'http://dss.coj.intra/', '8444c083d7d6f6477aaf6763e316dfd4.jpg', '2019-01-30 09:58:35', '2019-02-22 13:44:26'),
(10, 'สมุดโทรศัพท์ศาลยุติธรรม E-Phonebook', 'https://phonebook.coj.go.th', 'ff4119231e7631a10719b6fb8125070e.jpg', '2019-02-04 09:11:38', '2019-02-22 10:14:34'),
(11, 'ระบบตรวจสอบรายชื่อผู้กระทำผิดในงานคุมประพฤติ (คดีสอดส่อง) กรมคุมประพฤติ', 'http://203.113.100.106/dopcheck/index.php', '372604ce9f3969cabc212f0d22e355c6.jpg', '2019-02-04 10:29:56', '2019-02-22 10:13:14'),
(12, 'ระบบสารสนเทศสำนักงานศาลยุติธรรมข้าราชการตุลาการและดะโต๊ะยุติธรรม', 'http://esv-ojc.coj.go.th/index.php', '740552c3866b2f138a077e5508435611.jpg', '2019-02-06 09:05:53', '2019-02-22 10:11:55'),
(13, 'การแจ้งการอ่านคำพิพากษาศาลฎีกาทางอิเล็กทรอนิกส์', 'http://read.supremecourt.or.th/index.php', '8055bd73c87ad9c9b4928ac2fc5376b5.jpg', '2019-02-06 10:15:31', '2019-02-22 10:09:32'),
(14, 'ระบบบริหารจัดการเนื้อหาเว็บไซต์ (CMS 4.0) เก่า', 'http://cms.coj.intra/gadmin', 'c4be9b47307415ceced9f18415ea150b.jpg', '2019-02-07 11:09:17', '2019-02-22 10:05:04'),
(15, 'ระบบจัดการเนื้อหาเว็บไซต์ (CMS) ใหม่', 'http://pkkjc.coj.go.th/admin/auth/login', '4fe99d410032fc3bfde136b3050f281a.jpg', '2019-02-07 11:17:49', '2019-02-22 10:04:54'),
(16, 'ระบบส่งข้อมูล คพ.', 'http://compensation.coj.intra/login.php', '158b91a92b24d5c87f3fcc16518244b4.jpg', '2019-02-21 14:19:09', '2019-09-02 08:55:36'),
(18, 'E-Mail (อีเมล์)', 'https://accounts.mail.go.th/', 'ef992e7765e1c48a22d93b4d1e96d16a.jpg', '2019-02-25 09:31:04', '2019-03-11 10:59:46'),
(19, 'ระบบคำนวณอัตราค่าขึ้นศาล', 'https://fees.coj.go.th/', '64df6f2a0373b58ce14a4efeea8d4669.png', '2019-02-26 16:32:23', '2019-02-28 14:57:59'),
(20, 'COJ Video ตารางถ่ายทอด สัญญาณ ภาพเสียง Streamingชมเทปบันทึกภาพย้อนหลัง', 'http://video.coj.go.th/', 'f41daa2e1a18a90062e0c3d8f544c294.jpg', '2019-02-26 18:46:54', '2019-02-28 14:58:57'),
(21, 'ระบบค้นหาเขตอำนาจศาล.', 'https://pubdata.coj.go.th/jurisdiction/', 'dd2cd809bf608626ed8472bf66168b6c.jpg', '2019-02-26 18:47:21', '2019-02-28 15:03:57'),
(22, 'ระบบค้นหาอัตราค่า นำหมาย', 'http://exp.coj.go.th/sentnotice/', '93470837c27fa39e2a866a092fa01906.jpg', '2019-02-26 18:47:53', '2019-04-18 11:28:27'),
(23, 'แอปพลิเคชันสโตร์ ศาลยุติธรรม - App Store COJ', 'https://appstore.coj.go.th/', '39afae1c6ce2bcd3c64a45fce9c9f7a1.jpg', '2019-02-26 18:48:29', '2019-04-18 11:29:50'),
(24, 'โปรแกรมสำรวจข้อมูลอาคารที่ทำการศาลและบ้านพัก', 'http://jws.coj.intra/bds/views/frm_login.php', '84a5629c0fdcfaf8fe771059d0c5c5f9.jpg', '2019-02-26 18:49:06', '2019-02-28 15:05:42'),
(25, 'โปรแกรมรายงานผลการใช้จ่ายเงินสำนักงานศาลยุติธรร', 'http://jws.coj.intra/fris/', '0ce15f5be5b5c3665d8b6bf7a3f94a65.jpg', '2019-02-26 18:49:24', '2019-02-28 15:12:40'),
(26, 'โปรแกรมพิมพ์หนังสือรับรองการหักภาษี ณ ที่จ่าย', 'http://apps.coj.go.th/tax50/login.php', 'dd3ab04cd6b2c8fe48adcd71b8a9bfd7.jpg', '2019-02-26 18:49:43', '2019-04-18 11:27:41'),
(28, 'รายงานและติดตามผลการดำเนินงานตามนโยบายประธานศาลฎีกา', 'http://policy.coj.intra/', '800658fe98a10e3ff4a0f19ec523e6df.jpg', '2019-02-26 18:50:22', '2019-04-18 11:20:06'),
(29, 'ระบบรายงานการสืบหาหลักทรัพย์และการผ่อนชำระหนี้ของลูกหนี้ตามคำพิพากษา', 'http://jws.coj.intra/aiq/views/login.php', 'cc511f079a54a00344cbedb112562017.jpg', '2019-02-26 18:51:10', '2019-04-18 11:28:55'),
(31, 'ระบบค้นหาทะเบียนนิติบุคคล', 'http://jws.coj.intra/cojws/', 'fa98b995c4427f90b5fd7b30ac84118c.jpg', '2019-02-26 18:51:45', '2019-04-18 11:25:00'),
(32, 'ระบบรับส่งเอกสารศาลฎีกา', 'http://senddoc.supremecourt.or.th', '5f5259d60d408d4e35fa86cfffe9797d.jpg', '2019-02-26 18:53:45', '2019-04-18 11:24:31'),
(33, 'การใช้ประโยชน์ข้อมูลทะเบียนราษฎร', 'http://10.100.76.4/ami/authen/authen_start.php', 'b31da5b073be30e56fb72a81f6f98206.jpg', '2019-02-26 18:54:11', '2019-03-11 14:43:58'),
(34, 'ระบบพิมพ์สลิปเงินเดือนข้าราชการตุลาการศาลยุติธรรม', 'http://www.psis.e-service.coj.go.th', '1fe8ab89687583bd5cc85d1986877ac4.jpg', '2019-02-26 18:54:28', '2019-04-03 14:29:28'),
(35, 'ระบบฐานข้อมูลกลาง', 'http://10.100.76.4/itdb/index.php/authentication', '9eb66664ab917ea6c547dcec5b3fe1f0.jpg', '2019-02-26 18:54:41', '2019-04-18 11:23:43'),
(36, 'ระบบรายงานสถิติการใช้งานระบบสื่อสารทางไกลผ่านจอภาพ conf', 'http://10.100.76.4/vcs/', 'b56fed33ef779b14d440127b6236fd3e.jpg', '2019-02-26 18:54:59', '2020-05-07 15:18:45'),
(37, 'โปรแกรมตรวจสอบนายประกันผิดสัญญา', 'http://jws.coj.intra/insurance/views/login.php', '8d21e8d911028e649cab370590d59a8c.jpg', '2019-02-26 18:55:13', '2019-02-28 14:57:15'),
(38, 'เข้าใช้งานระบบ ต่างๆ ของสำนักงานศาล', 'https://it.coj.go.th/Authen/', '0b0150da846030837d2240c8cca2a5db.jpg', '2019-02-26 18:55:33', '2019-03-11 14:42:38'),
(39, 'โปรแกรมระบบสารสนเทศทรัพยากรบุคคล (DPIS)', 'http://10.1.2.101:8080/', '2f8fa9e4d45dfd22160c5c3a62e5479d.jpg', '2019-02-26 18:55:47', '2019-03-11 14:41:48'),
(40, 'ระบบแจ้งการอ่านศาลฎีกา senddoc', 'http://read.supremecourt.or.th/', '1cdc742352a0acccd144c0cb88264f81.jpg', '2019-02-26 18:56:28', '2021-01-08 15:13:05'),
(41, 'บันทึกข้อมูลเพื่อการตรวจราชการ ประจำปีงบประมาณ', 'http://jws.coj.intra/iss/views/frm_login.php', '333478e7be168fbda28f08dba7fc915b.jpg', '2019-02-26 18:56:47', '2020-10-16 10:11:05'),
(42, 'ระบบสารบรรณอิเล็กทรอนิกส์ ระยะ 2', 'http://e-office.coj.intra/ESB/', '5c31ba2c7340ac856fc46528eaf251d9.jpg', '2019-02-26 18:57:03', '2019-06-28 14:48:34'),
(44, 'โปรแกรมระบบงานฐานข้อมูลหมายจับ(AWIS)', 'http://sso.coj.intra/', 'f80cc7a2f8a21cca7450702f7edfb9d3.jpg', '2019-02-27 09:33:53', '2019-02-27 09:38:33'),
(45, 'Disk Error', 'https://www.partitionwizard.com/partitionmagic/disk-read-error.html', '', '2019-02-27 09:40:27', '2019-02-27 09:40:27'),
(46, 'ระบบติดตามสำนวนคดี Tracking System', 'https://cios.coj.go.th/tracking/index.php?page=form&host=pkkjc', '9f2e45da07c0a8283ea951951a7b1349.jpg', '2019-02-27 16:28:09', '2019-07-24 14:04:52'),
(47, 'ระบบบริหารจัดการลูกจ้างชั่วคราวและพนักงานราชการ Employee Management System', 'http://ems.coj.go.th/ems/index.php', 'ed2e9867dd002b0adb46ce5b818af61d.jpg', '2019-02-28 10:16:25', '2019-02-28 14:55:48'),
(48, 'ระบบรายงานคดีของศาลในภาค 7 (คดีค้าง)', 'http://10.37.0.1/intranet/clogin.php', 'a43c94ee4a497e389df743bdefaec95d.jpg', '2019-03-01 12:06:02', '2019-03-18 16:36:57'),
(49, 'intranet.coj.go.th', 'https://intranet.coj.go.th/', '726872bd4eacdea29ad8bc874da4dfc1.jpg', '2019-03-06 11:17:26', '2019-03-11 14:36:57'),
(50, 'GIN Conference สถานพินิจ ศูนย์ฝึก', 'https://www.ginconference.com/', '5f37e17b2105bf8df74e1fc75a8b5f2f.jpg', '2019-03-11 14:10:09', '2019-03-18 16:36:28'),
(51, 'ระยะทาง กรมทางหลวง (เบิกค่าเดินทาง)', 'http://dohgis.doh.go.th/dohtotravel/', '679275a7dd36016fbfe34ae3bb0d25ef.jpg', '2019-03-18 09:15:28', '2019-03-18 16:35:51'),
(52, 'สื่อศาล facebook', 'https://www.facebook.com/pr.coj/', '75315b082cd0087649b2fefc855a7729.jpg', '2019-03-20 13:22:05', '2019-03-20 13:22:31'),
(53, 'โปรแกรมการติดตามและรายงานผลหมายข้ามเขตทางอิเล็กทรอนิกส์', 'http://summons.coj.intra', '3feacd92238ab212f35d8f533f4525e6.jpg', '2019-03-21 12:46:21', '2019-03-21 12:46:21'),
(54, 'โปรแกรมบัญชีสำนักงานศาลยุติธรรม v.3', 'https://ac.coj.go.th/', '104408561949b3f14fb8100f71075f0a.jpg', '2019-04-01 13:46:20', '2019-04-18 09:32:24'),
(55, 'โปรแกรมทะเบียนทรัพย์สิน', 'https://assetws.coj.go.th/assetCoj/', 'df5c36224e4b9d91861398384a928c51.jpg', '2019-04-03 14:26:38', '2019-04-18 11:22:34'),
(56, 'ระบบสืบค้นข้อมูลคดีล้มละลายโดยระบบอิเล็กทรอนิคส์', 'http://www.cbc.e-service.coj.go.th/service', '3c74b28de0cd518dc0efb219c18c1ef8.jpg', '2019-04-03 14:27:00', '2019-04-18 11:22:03'),
(57, 'ตรวจสอบบุลคลล้มละลาย กรมบังคับคี', 'http://ledwebsite.led.go.th/ledweb/led/web/system/WEB1I010Action.do', '497478f0c949f7ec9bbf2dc2224c699a.jpg', '2019-04-03 14:27:19', '2019-04-18 11:21:20'),
(59, 'คำนวณระยะทาง GIS', 'http://gisweb.doh.go.th/doh/download/', '60f507123eb12118eb5927c96902444d.jpg', '2019-04-03 14:28:26', '2019-04-18 11:17:33'),
(61, 'โปรแกรมข้อมูลเงินฝาก', 'http://bookbank.coj.intra/login.php', '18f249caf387ee5df649c797eda135d2.jpg', '2019-04-05 10:47:16', '2019-04-18 11:16:58'),
(62, 'โปรแกรมบริหารจัดการฐานข้อมูลกลางคอมพิวเตอร์ ', 'http://10.100.76.4/itdb/index.php/', '2b8fb4aab9c24a438c68cd91d8654cb6.jpg', '2019-04-05 10:49:23', '2019-04-18 11:16:22'),
(63, 'ระบบรายงานสถิติ 7 วันอันตราย 2562', 'https://report.coj.go.th/', '5f5a8ef127c2c35e956d5888ba2b2cb9.jpg', '2019-04-10 15:18:44', '2019-04-18 11:15:44'),
(64, 'ระบบรายงานผลการให้บริการ ข้อมูลข่าวสารของหน่วยงานในสังกัด สำนักงานศาลยุติธรรม', 'http://cicsystem.coj.intra/infocenter/loginform.php', '4187a074b601ef84bea8528297a61017.jpg', '2019-04-23 10:30:26', '2019-04-23 10:30:26'),
(65, 'หนังสือเวียนสำนักงานศาลยุติธรรม', 'http://e-office.coj.intra/Circular', 'ee4d33f8a72098c7995fae5ac26eeea7.jpg', '2019-04-30 15:42:00', '2019-04-30 15:43:09'),
(66, 'แบบรายงานสถิติประจำเดือน ศูนย์รักษาความปลอดภัย www.ojso.coj.co.th', 'http://10.1.41.5/ojso/login.php', '039b8a4d53bdbd151eec7488f4d66c18.jpg', '2019-05-07 16:04:56', '2019-05-07 16:05:33'),
(67, 'ระบบฐานข้อมูลการประเมินผล การปฏิบัติราชการของศาลยุติธรรม (มิติ)', 'https://asm.coj.go.th/', '7235da9716d79c4e7e915271945b0e3f.jpg', '2019-05-22 11:27:38', '2019-05-22 13:17:51'),
(1561022564, 'การสมัครใช้งานระบบจดหมายอิเล็กทรอนิกส์ (e-Mail) สำนักงานศาลยุติธรรม (name@coj.go.th)', 'https://intranet.coj.go.th/email/', '7b574158255e75e007a664d6c144b869.jpg', '2019-06-20 16:22:44', '2019-06-20 16:22:44'),
(1561605936, 'gfmis online', 'https://webonlineinter.gfmis.go.th/', '6163cfd0eff3d60cc7b927aa17fee566.jpg', '2019-06-27 10:25:36', '2019-06-28 09:57:32'),
(1562130135, 'การรายงานผลตามแนวทางบริหารจัดการลดใช้กระดาษในหน่วยงาน', 'https://docs.google.com/forms/d/e/1FAIpQLSfEE8H64ongfP0579Bwoiyyn_y6c30PoUmDagYkAhn-B6na4Q/viewform', 'f25a3517a9238765132b2f8b0cd59dda.jpg', '2019-07-03 12:02:15', '2019-07-03 12:02:15'),
(1562552234, 'สมัครที่ปรึกษากฎหมาย จดแจ้ง', 'http://10.25.0.115/lcon/index.php', '08cef975523ddafa4b8a7707dea077c7.jpg', '2019-07-08 09:17:14', '2019-07-08 09:17:14'),
(1562658983, 'การพัฒนาทักษะด้านดิจิทัลของข้าราชการ ด้วยเครื่องมือประเมิน', 'https://www.ocsc.go.th/DLProject/dev-skill-dlp', 'e0eecebc4fbdf2ae9ac3f7f88c7d6abd.png', '2019-07-09 14:56:23', '2019-07-09 15:00:09'),
(1563166948, 'สถาบันพัฒนาข้าราชการฝ่ายตุลาการศาลยุติธรรม  e-learning ', 'http://elearning.coj.intra/', '7f13144254d12de00f1eb708909f4051.jpg', '2019-07-15 12:02:28', '2019-07-24 11:40:30'),
(1563521158, 'การรายงานแผนพัฒนารายบุคคล IDP รอบ 25 สิงหาคม 2562', 'https://goo.gl/forms/SxeCv9etO7IL7ApI3', '', '2019-07-19 14:25:58', '2019-07-19 14:25:58'),
(1563869824, 'Streaming Coj ดูสดและดูย้อนหลังได้นะ', 'http://live.coj.intra', 'f2628172fa2dfc286fa6a1639ec750b3.png', '2019-07-23 15:17:04', '2019-08-26 11:39:51'),
(1567045964, 'โปรแกรมบังคับคดีนายประกัน สท', 'http://beds.coj.intra/BEDS', '904b7ccd038a4aa31a012e423404bcca.png', '2019-08-29 09:32:44', '2019-11-25 13:28:01'),
(1567389318, 'ระบบจัดเก็บข้อมูลค่าตอบแทนพิเศษข้าราชการศาลยุติธรรม (สำหรับหน่วยงาน)', 'http://compensation.coj.intra/organite/login.php', '85b14757cd69897236015fa3db82d125.png', '2019-09-02 08:55:18', '2019-09-02 08:55:18'),
(1568172199, 'ระบบบริหารสัญญาจ้างพนักงานจ้างเหมาบริการรายบุคคล Service Contractor Management System สำนักงานศาลยุติธรรม', 'http://ems.coj.go.th/scms/', '0c6b76e48b0ffa3ebc728ecadf7e16e7.jpg', '2019-09-11 10:23:19', '2019-09-11 10:23:19'),
(1569486513, 'แจ้งชำระเงิน EDC', 'https://docs.google.com/forms/d/1GRYSgGQNqomqgIGoz7dwRXjr_-aiNm7w-3ERoK6ohYw/edit#responses', '', '2019-09-26 15:28:33', '2019-09-26 16:08:12'),
(1573786768, 'ระบบบริหารงานการเลื่อนและการโยกย้ายตำแหน่งข้าราชการตุลาการ', 'http://e-appointment.coj.go.th/', '6b8ed7b0727eee29e3eda5d34ae0cdfc.jpg', '2019-11-15 09:59:28', '2019-11-15 10:00:54'),
(1575337456, 'โปรแกรมระบบฐานข้อมูลคำสั่งห้ามออกนอกประเทศ', 'http://git.coj.intra/chalermchon.s/wlis_manual', '', '2019-12-03 08:44:16', '2019-12-03 08:44:16'),
(1575357791, 'ระบบสารสนเทศสำหรับผู้พิพากษา - Judicial Information System (JIS)', 'https://jis.coj.go.th/', 'e9099b658872cf2b467cfcbd4ae80477.png', '2019-12-03 14:23:11', '2019-12-03 14:23:11'),
(1576035096, 'หนังสือคู่มือมาตรฐานการใช้งานระบบอัตลักษณ์แบรนด์ศาลยุติธรรม และ Template สำหรับใช้งานโปรแกรม Presentation', 'https://iprd.coj.go.th/th/content/category/detail/id/8/iid/172706', '', '2019-12-11 10:31:36', '2019-12-11 10:31:36'),
(1576207374, 'โปรแกรมบันทึกข้อมูลแบบแจ้งรายการเพื่อการหักลดหย่อนภาษี(ล.ย.01) (สำหรับผู้พิพากษา)', 'https://das.coj.go.th/ly/', '3d435a448e5a60395a09cee04ecda1ac.jpg', '2019-12-13 10:22:54', '2019-12-13 10:23:25'),
(1578034774, 'ระบบบันทึกข้อมูลคดีสำคัญ', 'http://cdc.coj.intra/', '', '2020-01-03 13:59:34', '2020-01-03 13:59:34'),
(1578898514, 'โปรแกรมระบบสารสนเทศทรัพยากรบุคล DPIS', 'http://dpis.coj.intra:8080/', '', '2020-01-13 13:55:14', '2020-01-13 13:55:30'),
(1580178502, 'โปรแกรมให้บริการคัดถ่ายสำเนาคำพิพากษาผ่านเครื่องอัตโนมัติด้วยตัวเอง', 'https://drive.google.com/drive/u/0/mobile/folders/1Nf_As4HW62AhT26atbX2dcHzwJDkiPWZ?usp=sharing', '', '2020-01-28 09:28:22', '2020-01-28 09:28:22'),
(1583892730, 'ระบบประเมินบุคคลและรายงานการปฏิบัติราชการของข้าราชการตุลาการ', 'http://evaluation.coj.go.th/', '95939af6f95d2b800c709bc8c751800f.jpg', '2020-03-11 09:12:10', '2020-03-11 09:12:10'),
(1584339965, 'โปรแกรมส่งไฟส์เอกสาร ศาลอุทธรณ์คดีชำนัญพิเศษ', 'http://10.20.80.99/sharedoc/', '', '2020-03-16 13:26:05', '2021-10-14 21:36:38'),
(1584590004, 'บัญชีนัดพิจารณาคดีผ่านระบบ google Sheet', 'https://docs.google.com/spreadsheets/d/1pVZSO60EI71MDP7u382Tg4LOowwx9EidDLIXhh-zKBI/edit?usp=sharing', '', '2020-03-19 10:53:24', '2020-03-19 10:53:24'),
(1584679211, 'ระบบจัดเก็บข้อมูลในการบริหารสัญญาณเกี่ยวกับงานก่อสร้างหรืองานปรับปรุง', 'https://pms.coj.go.th/index.php?module=users/login', '0a2270eeeb46a10145f13756f8583010.jpg', '2020-03-20 11:40:11', '2020-03-20 11:40:11'),
(1585708211, 'รายงานปัญหาการออกหมายจับ', 'https://forms.gle/8VNibEKnM4mf1Kmy5', '', '2020-04-01 09:30:11', '2020-04-01 09:30:55'),
(1586399167, 'ระบบรายงานสถิติ ( สถานการณ์ฉุกเฉิน )', 'https://report.coj.go.th/emergency/', '', '2020-04-09 09:26:07', '2020-04-09 09:26:07'),
(1588147462, 'ระบบบัญชีวันทำการและวันหยุดราชการของข้าราชการตุลาการ ', 'http://jpis.coj.intra/worktime', '', '2020-04-29 15:04:22', '2021-10-14 21:36:56'),
(1588305269, 'รายงายสถิติ e-notice ประจำเดือน ', 'https://goo.gl/forms/slSqaX6M0v18cKT82', '', '2020-05-01 10:54:29', '2020-05-01 10:54:29'),
(1590388518, 'การพิมพ์สลิปเงินเดือนสำหรับพนักงาน', 'http://of.coj.intra/hr/', '3e943aa1ffe63b8ae887b40d4ab2d47e.jpg', '2020-05-25 13:35:18', '2020-05-25 13:35:18'),
(1600659309, 'ประเมินผู้พิพากษา', 'http://evaluation.coj.go.th/login', 'c21d1cfa214b5ec4bd658cbd5fd0e27e.png', '2020-09-21 10:35:09', '2020-11-06 13:24:21'),
(1604027637, 'โปรแกรม Venngage (ทำInfographic และ Poster สำเร็จรูป)', 'https://venngage.com', '', '2020-10-30 10:13:57', '2020-10-30 10:13:57'),
(1604643053, 'LineBot ศาลเยาวชนฯ ประจวบ', 'https://lin.ee/Vs4rR4I', 'da5f80744e58864b528a103cdcd7854c.png', '2020-11-06 13:10:53', '2020-11-06 13:18:40'),
(1606703915, 'ย้ายข้าราชการศาลยุติธรรม', 'http://dpis.coj.intra:8080', 'cb837f4f69ce8916ab57b8d4d9f4d040.jpg', '2020-11-30 09:38:35', '2020-12-02 12:04:11'),
(1608526352, 'ระบบตรวจสอบข้อมูลรายบุคคล (WSRS)  SSO', 'http://arch.coj.intra/wsrs/party', '', '2020-12-21 11:52:32', '2020-12-21 11:55:14'),
(1610598462, 'ระบบพิมพ์หนังสือรับรองการหักภาษี ณ ที่จ่าย ตามมาตรา 50 ทวิ', 'http://50tavi.coj.go.th/', '98290edb032698ed62c8d47d01e59387.jpg', '2021-01-14 11:27:42', '2021-01-14 11:27:42'),
(1613639371, 'คัดทะเบียนราชฎร+คู่มือ', 'http://git.coj.intra/techno.app/coj_ami_manual.git', '', '2021-02-18 16:09:31', '2021-04-30 16:06:27'),
(1619579860, 'เคาน์เตอร์เซอร์วิส', 'https://counterservice.co.th/ticketnet/clients/login_ftp.asp', '', '2021-04-28 10:17:40', '2021-04-28 10:18:08'),
(1620030476, 'ระบบสำนวนบังคับคดีผู้ประกันในคดีอาญา', 'http://10.100.76.243/beis/login', 'c9dc83994021f75f08d4c21fa1b62e64.jpg', '2021-05-03 15:27:56', '2021-05-03 15:27:56'),
(1620958258, 'จำหน่ายคดีชั่วคราว K.บุ๋ม', 'http://10.37.64.1/work_case/index.php', '', '2021-05-14 09:10:58', '2021-05-18 14:23:07'),
(1622091669, 'โปรแกรมรายงานคดีและส่งสำนวนและร่างคำพิพากษาหรือคำสั่งเพื่อตรวจด้วยระบบอิเล็กทรอนิกส์(ECRM) ภาค7', 'http://10.37.0.1:8080/casereport116/', '424ad36e70c40c82fbd6f195b6a0d4ff.jpg', '2021-05-27 12:01:09', '2021-05-27 12:01:09'),
(1630399573, 'รายงานสถิติคดีไกล่เกลี่ยประจำเดือน', 'https://bit.ly/3fKHx8e', '5015f2fdad77bca39a20a690deff3934.jpg', '2021-08-31 15:46:13', '2021-08-31 15:47:37'),
(1631980239, 'เซ็นเอกสารออนไลน์ https://varias.co.th/', 'https://varias.co.th/', '', '2021-09-18 22:50:39', '2021-09-18 22:50:39'),
(1633415561, 'Zoom conf', 'https://zoom.us/', '40a6e09190b7e2a93e6ef05e9f64a045.jpg', '2021-10-05 13:32:41', '2021-10-05 13:32:41');

-- --------------------------------------------------------

--
-- Table structure for table `web_link_file`
--

CREATE TABLE `web_link_file` (
  `id` int(11) NOT NULL,
  `web_link_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bila`
--
ALTER TABLE `bila`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blueshirt`
--
ALTER TABLE `blueshirt`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `law_ban`
--
ALTER TABLE `law_ban`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `legal_c`
--
ALTER TABLE `legal_c`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `legal_c_ven`
--
ALTER TABLE `legal_c_ven`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `line`
--
ALTER TABLE `line`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `line_home`
--
ALTER TABLE `line_home`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `running`
--
ALTER TABLE `running`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sign_boss_name`
--
ALTER TABLE `sign_boss_name`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `somtop`
--
ALTER TABLE `somtop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `somtop_v`
--
ALTER TABLE `somtop_v`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `web_link`
--
ALTER TABLE `web_link`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web_link_file`
--
ALTER TABLE `web_link_file`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bila`
--
ALTER TABLE `bila`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1663437267;

--
-- AUTO_INCREMENT for table `blueshirt`
--
ALTER TABLE `blueshirt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `law_ban`
--
ALTER TABLE `law_ban`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `legal_c`
--
ALTER TABLE `legal_c`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1634231162;

--
-- AUTO_INCREMENT for table `legal_c_ven`
--
ALTER TABLE `legal_c_ven`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1634231170;

--
-- AUTO_INCREMENT for table `line`
--
ALTER TABLE `line`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `line_home`
--
ALTER TABLE `line_home`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `running`
--
ALTER TABLE `running`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sign_boss_name`
--
ALTER TABLE `sign_boss_name`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `somtop`
--
ALTER TABLE `somtop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1634230419;

--
-- AUTO_INCREMENT for table `somtop_v`
--
ALTER TABLE `somtop_v`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1634230998;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1666246578;

--
-- AUTO_INCREMENT for table `ven`
--
ALTER TABLE `ven`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1668088519;

--
-- AUTO_INCREMENT for table `ven_com`
--
ALTER TABLE `ven_com`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1668086420;

--
-- AUTO_INCREMENT for table `ven_name`
--
ALTER TABLE `ven_name`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `ven_name_sub`
--
ALTER TABLE `ven_name_sub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `ven_user`
--
ALTER TABLE `ven_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT for table `web_link`
--
ALTER TABLE `web_link`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1633415562;

--
-- AUTO_INCREMENT for table `web_link_file`
--
ALTER TABLE `web_link_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
