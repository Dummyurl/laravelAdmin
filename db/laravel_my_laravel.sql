-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 12, 2017 at 02:32 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.0.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_my_laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_actions`
--

CREATE TABLE `admin_actions` (
  `id` bigint(64) NOT NULL,
  `description` varchar(100) DEFAULT NULL COMMENT 'Description of Admin Action.',
  `remark` varchar(500) DEFAULT NULL COMMENT 'Details Description of Admin Action.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_actions`
--

INSERT INTO `admin_actions` (`id`, `description`, `remark`) VALUES
(1, 'Login', 'Logged In User'),
(2, 'Logout', 'Logged Out User'),
(3, 'Update Profile', 'Update Profile'),
(4, 'Change Password', 'Change Password'),
(5, 'Add Admin Module', 'Add Admin Module'),
(6, 'Edit Admin Module', 'Edit Admin Module'),
(7, 'Delete Admin Module', 'Delete Admin Module'),
(8, 'Add Admin Action', 'Add Admin Action'),
(9, 'Edit Admin Action', 'Edit Admin Action'),
(10, 'Delete Admin Action', 'Delete Admin Action'),
(11, 'Add Module Page', 'Add Module Page'),
(12, 'Edit Module Page', 'Edit Module Page'),
(13, 'Delete Module Page', 'Delete Module Page');

-- --------------------------------------------------------

--
-- Table structure for table `admin_groups`
--

CREATE TABLE `admin_groups` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `title` varchar(128) NOT NULL,
  `order_index` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_groups`
--

INSERT INTO `admin_groups` (`id`, `parent_id`, `title`, `order_index`) VALUES
(1, NULL, 'Admin Users', 0),
(2, NULL, 'User Permissions', 10),
(3, NULL, 'Frontend Users', 2),
(4, NULL, 'Masters', 9);

-- --------------------------------------------------------

--
-- Table structure for table `admin_group_pages`
--

CREATE TABLE `admin_group_pages` (
  `id` int(11) NOT NULL,
  `admin_group_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `menu_title` varchar(128) NOT NULL,
  `menu_order` int(11) NOT NULL,
  `description` text NOT NULL,
  `is_sub_menu` char(1) NOT NULL DEFAULT 'Y',
  `url` varchar(512) NOT NULL DEFAULT '',
  `show_in_menu` char(1) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_group_pages`
--

INSERT INTO `admin_group_pages` (`id`, `admin_group_id`, `name`, `menu_title`, `menu_order`, `description`, `is_sub_menu`, `url`, `show_in_menu`) VALUES
(1, 4, 'List Admin Log Users', 'List Admin Log Users', 1, '', 'Y', '/admin/admin-users', 'Y'),
(2, 4, 'Add Admin Log Actions', 'Add Admin Log Actions', 2, '', 'Y', '/admin/admin-actions', 'N'),
(3, 4, 'Edit Admin Log Actions', 'Edit Admin Log Actions', 3, '', 'Y', '/admin/admin-actions', 'N'),
(4, 4, 'Delete Admin Log Actions', 'Delete Admin Log Actions', 4, '', 'Y', '/admin/admin-actions', 'N'),
(5, 2, 'List Admin Modules', 'List Admin Modules', 3, '', 'Y', '/admin/modules', 'Y'),
(6, 2, 'Add Admin Modules', 'Add Admin Modules', 4, '', 'Y', '/admin/modules', 'N'),
(7, 2, 'Edit Admin  Modules', 'Edit Admin  Modules', 5, '', 'Y', '/admin/modules', 'N'),
(8, 2, 'Delete Admin Modules', 'Delete Admin Modules', 6, '', 'Y', '/admin/modules', 'N'),
(9, 2, 'List  Admin Module Pages', 'List  Admin Module Pages', 1, '', 'Y', '/admin/module-pages', 'Y'),
(10, 2, 'Add Admin Modules Pages', 'Add Admin Modules Pages', 7, '', 'Y', '/admin/module-pages', 'N'),
(11, 2, 'Edit Admin Modules Pages', 'Edit Admin Modules Pages', 8, '', 'Y', '/admin/module-pages', 'N'),
(12, 2, 'Delete Admin Modules Pages', 'Delete Admin Modules Pages', 9, '', 'Y', '/admin/module-pages', 'N'),
(13, 3, 'List Users', 'List Users', 1, 'this is frontend user list page.', 'Y', '/admin/users', 'Y'),
(14, 3, 'Add Users', 'Add Users', 2, '', 'Y', '/admin/users', 'N'),
(15, 3, 'Edit Users', 'Edit Users', 3, '', 'Y', '/admin/users', 'N'),
(16, 3, 'Delete Users', 'Delete Users', 4, '', 'Y', '/admin/users', 'N'),
(17, 4, 'List Users Actions', 'List Users Actions', 5, '', 'Y', '/admin/user-actions', 'Y'),
(18, 4, 'Add Users Actions', 'Add Users Actions', 6, '', 'Y', '/admin/user-actions', 'N'),
(19, 4, 'Edit Users Actions', 'Edit Users Actions', 7, '', 'Y', '/admin/user-actions', 'N'),
(20, 4, 'Delete Users Actions', 'Delete Users Actions', 8, '', 'Y', '/admin/user-actions', 'N'),
(21, 1, 'Admin User ', 'Admin User ', 1, '', 'Y', '/admin/admin-userlogs', 'Y'),
(22, 2, 'Assign Rights', 'Assign Rights', 2, '', 'Y', '/admin/user-type-rights', 'Y'),
(23, 4, 'Admin Actions', 'Admin Actions', 1, '', 'Y', '/admin/admin-actions', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `admin_logs`
--

CREATE TABLE `admin_logs` (
  `id` int(64) NOT NULL,
  `adminuserid` bigint(64) NOT NULL DEFAULT '0',
  `actionid` bigint(64) NOT NULL DEFAULT '0',
  `actionvalue` varchar(30) DEFAULT NULL,
  `remark` longtext,
  `ipaddress` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_logs`
--

INSERT INTO `admin_logs` (`id`, `adminuserid`, `actionid`, `actionvalue`, `remark`, `ipaddress`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '1', 'Login Admin User', '::1', '2017-08-20 12:44:15', '2017-08-20 12:44:15'),
(2, 1, 2, '1', 'Logout Admin User', '::1', '2017-08-20 12:44:34', '2017-08-20 12:44:34'),
(3, 1, 1, '1', 'Login Admin User', '::1', '2017-08-20 12:48:08', '2017-08-20 12:48:08'),
(4, 1, 3, '1', 'Update Profile', '::1', '2017-08-20 12:48:19', '2017-08-20 12:48:19'),
(5, 1, 4, '1', 'Change Password', '::1', '2017-08-20 12:48:49', '2017-08-20 12:48:49'),
(6, 1, 2, '1', 'Logout Admin User', '::1', '2017-08-20 12:52:32', '2017-08-20 12:52:32'),
(7, 1, 1, '1', 'Login Admin User', '::1', '2017-08-20 13:06:12', '2017-08-20 13:06:12'),
(8, 1, 2, '1', 'Logout Admin User', '::1', '2017-08-20 13:14:43', '2017-08-20 13:14:43'),
(9, 1, 1, '1', 'Login Admin User', '::1', '2017-08-20 13:14:46', '2017-08-20 13:14:46'),
(10, 1, 2, '1', 'Logout Admin User', '::1', '2017-08-20 13:19:30', '2017-08-20 13:19:30'),
(11, 1, 1, '1', 'Login Admin User', '::1', '2017-08-20 13:19:35', '2017-08-20 13:19:35'),
(12, 1, 2, '1', 'Logout Admin User', '::1', '2017-08-20 13:19:41', '2017-08-20 13:19:41'),
(13, 1, 1, '1', 'Login Admin User', '::1', '2017-08-20 13:57:19', '2017-08-20 13:57:19'),
(14, 1, 2, '1', 'Logout Admin User', '::1', '2017-08-20 14:00:41', '2017-08-20 14:00:41'),
(15, 1, 1, '1', 'Login Admin User', '::1', '2017-08-20 14:00:45', '2017-08-20 14:00:45'),
(16, 1, 5, '3', 'Add Admin Module::3', '::1', '2017-08-20 14:19:21', '2017-08-20 14:19:21'),
(17, 1, 6, '3', 'Edit Admin Module::3', '::1', '2017-08-20 14:19:40', '2017-08-20 14:19:40'),
(18, 1, 6, '2', 'Edit Admin Module::2', '::1', '2017-08-20 14:19:55', '2017-08-20 14:19:55'),
(19, 1, 6, '3', 'Edit Admin Module::3', '::1', '2017-08-20 14:20:06', '2017-08-20 14:20:06'),
(20, 1, 5, '4', 'Add Admin Module::4', '::1', '2017-08-20 14:20:31', '2017-08-20 14:20:31'),
(21, 1, 5, '5', 'Add Admin Module::5', '::1', '2017-08-20 14:20:45', '2017-08-20 14:20:45'),
(22, 1, 6, '5', 'Edit Admin Module::5', '::1', '2017-08-20 14:20:59', '2017-08-20 14:20:59'),
(23, 1, 7, '5', 'Delete Admin Module::5', '::1', '2017-08-20 14:21:07', '2017-08-20 14:21:07'),
(24, 1, 8, '8', 'Add Admin Action::8', '::1', NULL, NULL),
(25, 1, 8, '9', 'Add Admin Action::9', '::1', NULL, NULL),
(26, 1, 8, '10', 'Add Admin Action::10', '::1', NULL, NULL),
(27, 1, 9, '10', 'Edit Admin Action::10', '::1', NULL, NULL),
(28, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(29, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(30, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(31, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(32, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(33, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(34, 1, 8, '11', 'Add Admin Action::11', '::1', NULL, NULL),
(35, 1, 10, '11', 'Delete Admin Action::11', '::1', NULL, NULL),
(36, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(37, 1, 8, '11', 'Add Admin Action::11', '::1', NULL, NULL),
(38, 1, 9, '11', 'Edit Admin Action::11', '::1', NULL, NULL),
(39, 1, 8, '12', 'Add Admin Action::12', '::1', NULL, NULL),
(40, 1, 8, '13', 'Add Admin Action::13', '::1', NULL, NULL),
(41, 1, 8, '14', 'Add Admin Action::14', '::1', NULL, NULL),
(42, 1, 8, '15', 'Add Admin Action::15', '::1', NULL, NULL),
(43, 1, 8, '16', 'Add Admin Action::16', '::1', NULL, NULL),
(44, 1, 8, '17', 'Add Admin Action::17', '::1', NULL, NULL),
(45, 1, 3, '1', 'Update Profile', '::1', NULL, NULL),
(46, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(47, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(48, 1, 10, '11', 'Delete Admin Action::11', '::1', NULL, NULL),
(49, 1, 10, '12', 'Delete Admin Action::12', '::1', NULL, NULL),
(50, 1, 10, '13', 'Delete Admin Action::13', '::1', NULL, NULL),
(51, 1, 9, '14', 'Edit Admin Action::14', '::1', NULL, NULL),
(52, 1, 9, '15', 'Edit Admin Action::15', '::1', NULL, NULL),
(53, 1, 9, '16', 'Edit Admin Action::16', '::1', NULL, NULL),
(54, 1, 9, '17', 'Edit Admin Action::17', '::1', NULL, NULL),
(55, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(56, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(57, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(58, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(59, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(60, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(61, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(62, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(63, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(64, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(65, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(66, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(67, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(68, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(69, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(70, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(71, 1, 13, '7', 'Delete Admin Module Page::7', '::1', NULL, NULL),
(72, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(73, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(74, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(75, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(76, 1, 9, '15', 'Edit Admin Action::15', '::1', NULL, NULL),
(77, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(78, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(79, 1, 9, '16', 'Edit Admin Action::16', '::1', NULL, NULL),
(80, 1, 9, '16', 'Edit Admin Action::16', '::1', NULL, NULL),
(81, 1, 10, '16', 'Delete Admin Action::16', '::1', NULL, NULL),
(82, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(83, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(84, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(85, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(86, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(87, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(88, 1, 8, '17', 'Edit Admin Action::17', '::1', NULL, NULL),
(89, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(90, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(91, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(92, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(93, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(94, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(95, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(96, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(97, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(98, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(99, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(100, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(101, 1, 10, '17', 'Edit Admin Action::17', '::1', NULL, NULL),
(102, 1, 10, '15', 'Edit Admin Action::15', '::1', NULL, NULL),
(103, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(104, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(105, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(106, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(107, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(108, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(109, 1, 9, '14', 'Edit Admin Action::14', '::1', NULL, NULL),
(110, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(111, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(112, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(113, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(114, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(115, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(116, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(117, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(118, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(119, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(120, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(121, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(122, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(123, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(124, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(125, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(126, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(127, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(128, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(129, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(130, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(131, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(132, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(133, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(134, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(135, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(136, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(137, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(138, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(139, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(140, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(141, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(142, 1, 12, '5', 'Delete Admin Module Page::5', '::1', NULL, NULL),
(143, 1, 12, '5', 'Delete Admin Module Page::5', '::1', NULL, NULL),
(144, 1, 12, '5', 'Delete Admin Module Page::5', '::1', NULL, NULL),
(145, 1, 12, '1', 'Delete Admin Module Page::1', '::1', NULL, NULL),
(146, 1, 12, '8', 'Delete Admin Module Page::8', '::1', NULL, NULL),
(147, 1, 12, '8', 'Delete Admin Module Page::8', '::1', NULL, NULL),
(148, 1, 12, '8', 'Delete Admin Module Page::8', '::1', NULL, NULL),
(149, 1, 12, '2', 'Delete Admin Module Page::2', '::1', NULL, NULL),
(150, 1, 12, '2', 'Delete Admin Module Page::2', '::1', NULL, NULL),
(151, 1, 12, '5', 'Delete Admin Module Page::5', '::1', NULL, NULL),
(152, 1, 12, '2', 'Delete Admin Module Page::2', '::1', NULL, NULL),
(153, 1, 12, '2', 'Delete Admin Module Page::2', '::1', NULL, NULL),
(154, 1, 12, '8', 'Delete Admin Module Page::8', '::1', NULL, NULL),
(155, 1, 12, '2', 'Delete Admin Module Page::2', '::1', NULL, NULL),
(156, 1, 12, '2', 'Delete Admin Module Page::2', '::1', NULL, NULL),
(157, 1, 12, '16', 'Delete Admin Module Page::16', '::1', NULL, NULL),
(158, 1, 12, '8', 'Delete Admin Module Page::8', '::1', NULL, NULL),
(159, 1, 12, '8', 'Delete Admin Module Page::8', '::1', NULL, NULL),
(160, 1, 12, '2', 'Delete Admin Module Page::2', '::1', NULL, NULL),
(161, 1, 12, '2', 'Delete Admin Module Page::2', '::1', NULL, NULL),
(162, 1, 12, '2', 'Delete Admin Module Page::2', '::1', NULL, NULL),
(163, 1, 12, '2', 'Delete Admin Module Page::2', '::1', NULL, NULL),
(164, 1, 12, '2', 'Delete Admin Module Page::2', '::1', NULL, NULL),
(165, 1, 12, '2', 'Delete Admin Module Page::2', '::1', NULL, NULL),
(166, 1, 12, '2', 'Delete Admin Module Page::2', '::1', NULL, NULL),
(167, 1, 12, '8', 'Delete Admin Module Page::8', '::1', NULL, NULL),
(168, 1, 12, '3', 'Delete Admin Module Page::3', '::1', NULL, NULL),
(169, 1, 12, '9', 'Delete Admin Module Page::9', '::1', NULL, NULL),
(170, 1, 12, '4', 'Delete Admin Module Page::4', '::1', NULL, NULL),
(171, 1, 12, '10', 'Delete Admin Module Page::10', '::1', NULL, NULL),
(172, 1, 12, '5', 'Delete Admin Module Page::5', '::1', NULL, NULL),
(173, 1, 12, '6', 'Delete Admin Module Page::6', '::1', NULL, NULL),
(174, 1, 12, '30', 'Delete Admin Module Page::30', '::1', NULL, NULL),
(175, 1, 12, '6', 'Delete Admin Module Page::6', '::1', NULL, NULL),
(176, 1, 12, '11', 'Delete Admin Module Page::11', '::1', NULL, NULL),
(177, 1, 12, '12', 'Delete Admin Module Page::12', '::1', NULL, NULL),
(178, 1, 12, '13', 'Delete Admin Module Page::13', '::1', NULL, NULL),
(179, 1, 12, '6', 'Delete Admin Module Page::6', '::1', NULL, NULL),
(180, 1, 12, '7', 'Delete Admin Module Page::7', '::1', NULL, NULL),
(181, 1, 12, '8', 'Delete Admin Module Page::8', '::1', NULL, NULL),
(182, 1, 12, '9', 'Delete Admin Module Page::9', '::1', NULL, NULL),
(183, 1, 12, '40', 'Delete Admin Module Page::40', '::1', NULL, NULL),
(184, 1, 12, '14', 'Delete Admin Module Page::14', '::1', NULL, NULL),
(185, 1, 12, '15', 'Delete Admin Module Page::15', '::1', NULL, NULL),
(186, 1, 12, '16', 'Delete Admin Module Page::16', '::1', NULL, NULL),
(187, 1, 12, '20', 'Delete Admin Module Page::20', '::1', NULL, NULL),
(188, 1, 12, '50', 'Delete Admin Module Page::50', '::1', NULL, NULL),
(189, 1, 12, '60', 'Delete Admin Module Page::60', '::1', NULL, NULL),
(190, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(191, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(192, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(193, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(194, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(195, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(196, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(197, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(198, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(199, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(200, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(201, 1, 11, '16', 'Edit Admin Action::16', '::1', NULL, NULL),
(202, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(203, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(204, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(205, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(206, 1, 11, '17', 'Edit Admin Action::17', '::1', NULL, NULL),
(207, 1, 13, '17', 'Delete Admin Module Page::17', '::1', NULL, NULL),
(208, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(209, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(210, 1, 12, '15', 'Delete Admin Module Page::15', '::1', NULL, NULL),
(211, 1, 11, '18', 'Edit Admin Action::18', '::1', NULL, NULL),
(212, 1, 11, '19', 'Edit Admin Action::19', '::1', NULL, NULL),
(213, 1, 11, '20', 'Edit Admin Action::20', '::1', NULL, NULL),
(214, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(215, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(216, 1, 12, '16', 'Delete Admin Module Page::16', '::1', NULL, NULL),
(217, 1, 12, '18', 'Delete Admin Module Page::18', '::1', NULL, NULL),
(218, 1, 12, '19', 'Delete Admin Module Page::19', '::1', NULL, NULL),
(219, 1, 12, '20', 'Delete Admin Module Page::20', '::1', NULL, NULL),
(220, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(221, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(222, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(223, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(224, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(225, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(226, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(227, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(228, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(229, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(230, 1, 11, '21', 'Edit Admin Action::21', '::1', NULL, NULL),
(231, 1, 12, '21', 'Delete Admin Module Page::21', '::1', NULL, NULL),
(232, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(233, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(234, 1, 11, '22', 'Edit Admin Action::22', '::1', NULL, NULL),
(235, 1, 11, '23', 'Edit Admin Action::23', '::1', NULL, NULL),
(236, 1, 11, '24', 'Edit Admin Action::24', '::1', NULL, NULL),
(237, 1, 12, '22', 'Delete Admin Module Page::22', '::1', NULL, NULL),
(238, 1, 12, '23', 'Delete Admin Module Page::23', '::1', NULL, NULL),
(239, 1, 12, '24', 'Delete Admin Module Page::24', '::1', NULL, NULL),
(240, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(241, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(242, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(243, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(244, 1, 12, '1', 'Delete Admin Module Page::1', '::1', NULL, NULL),
(245, 1, 12, '9', 'Delete Admin Module Page::9', '::1', NULL, NULL),
(246, 1, 12, '5', 'Delete Admin Module Page::5', '::1', NULL, NULL),
(247, 1, 12, '6', 'Delete Admin Module Page::6', '::1', NULL, NULL),
(248, 1, 12, '7', 'Delete Admin Module Page::7', '::1', NULL, NULL),
(249, 1, 12, '8', 'Delete Admin Module Page::8', '::1', NULL, NULL),
(250, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(251, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(252, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(253, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(254, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(255, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(256, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(257, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_type_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `last_login_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `user_type_id`, `name`, `email`, `password`, `status`, `last_login_at`, `remember_token`, `slug`, `created_at`, `updated_at`, `phone`) VALUES
(1, 1, 'Admin', 'admin@gmail.com', '$2y$10$8HiNGIdnO18q7KVAsx6vCONxj4e9WCiNdGg0xwVIxZaQa3C9VbxfK', 1, '2017-09-12 06:42:34', 'Nlqp3dtxk7UE0hy5Ba1GQSfB6NNYjN482yEFNQw7I7kuXpPDaOB0udRAXWMq', NULL, '2016-12-11 10:31:25', '2017-09-12 06:42:34', '1234567890');

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_rights`
--

CREATE TABLE `admin_user_rights` (
  `user_type_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_types`
--

CREATE TABLE `admin_user_types` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_user_types`
--

INSERT INTO `admin_user_types` (`id`, `title`) VALUES
(1, 'Super Admin'),
(2, 'Admin'),
(3, 'Operator');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(6, '2017_08_20_115043_create_admin_actions_table', 1),
(7, '2017_08_20_115043_create_admin_group_pages_table', 1),
(8, '2017_08_20_115043_create_admin_groups_table', 1),
(9, '2017_08_20_115043_create_admin_logs_table', 1),
(10, '2017_08_20_115043_create_admin_user_rights_table', 1),
(11, '2017_08_20_115043_create_admin_user_types_table', 1),
(12, '2017_08_20_115043_create_admin_users_table', 1),
(13, '2017_08_20_115043_create_password_resets_table', 1),
(14, '2017_08_20_115043_create_users_table', 1),
(15, '2017_08_20_115046_add_foreign_keys_to_admin_group_pages_table', 1),
(16, '2017_08_20_115046_add_foreign_keys_to_admin_groups_table', 1),
(17, '2017_08_20_115046_add_foreign_keys_to_admin_user_rights_table', 1),
(18, '2017_08_20_125645_alter_admin_users', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_login_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `firstname`, `lastname`, `address`, `city`, `state`, `country`, `zipcode`, `mobile`, `last_login_at`, `status`, `email`, `password`, `remember_token`, `slug`, `created_at`, `updated_at`) VALUES
(2, NULL, 'steave', 'smith', NULL, NULL, NULL, NULL, NULL, '1234553400', '2016-12-11 13:31:44', 'pending', 'steave.smith@gmail.com', '$2y$10$OjBLKtLTgiAc6A2zQxo6fOzf5LooIUEfH8mDfiTwgeyS.KKy9imQ.', NULL, 'john-smith', '2016-12-11 07:59:03', '2016-12-11 08:01:44'),
(4, NULL, 'kishan', 'lashkari', NULL, NULL, NULL, NULL, NULL, '9904553400', '2017-01-13 13:21:54', 'pending', 'kishan.yugtia@gmail.com', '$2y$10$iNBXlVEv5XKPbLcP.MqpFeUprDDAKMxU2ElF1m7w62kWj5PBgmV16', NULL, 'kishan-lashkari', '2017-01-13 07:51:54', '2017-01-13 07:51:54');

-- --------------------------------------------------------

--
-- Table structure for table `user_actions`
--

CREATE TABLE `user_actions` (
  `id` bigint(64) NOT NULL,
  `description` varchar(100) NOT NULL,
  `remark` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_actions`
--

INSERT INTO `user_actions` (`id`, `description`, `remark`) VALUES
(1, 'Admin', 'Admin'),
(6, 'Test', 'Test'),
(7, 'Aa', 'aa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_actions`
--
ALTER TABLE `admin_actions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_groups`
--
ALTER TABLE `admin_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `admin_group_pages`
--
ALTER TABLE `admin_group_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_group_id` (`admin_group_id`);

--
-- Indexes for table `admin_logs`
--
ALTER TABLE `admin_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_email_unique` (`email`),
  ADD KEY `admin_user_type_fk_1` (`user_type_id`);

--
-- Indexes for table `admin_user_rights`
--
ALTER TABLE `admin_user_rights`
  ADD KEY `page_id` (`page_id`),
  ADD KEY `user_type_id` (`user_type_id`);

--
-- Indexes for table `admin_user_types`
--
ALTER TABLE `admin_user_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_actions`
--
ALTER TABLE `user_actions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_actions`
--
ALTER TABLE `admin_actions`
  MODIFY `id` bigint(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `admin_groups`
--
ALTER TABLE `admin_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `admin_group_pages`
--
ALTER TABLE `admin_group_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `admin_logs`
--
ALTER TABLE `admin_logs`
  MODIFY `id` int(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;
--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `admin_user_types`
--
ALTER TABLE `admin_user_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user_actions`
--
ALTER TABLE `user_actions`
  MODIFY `id` bigint(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_groups`
--
ALTER TABLE `admin_groups`
  ADD CONSTRAINT `admin_groups_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `admin_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `admin_group_pages`
--
ALTER TABLE `admin_group_pages`
  ADD CONSTRAINT `admin_group_pages_ibfk_1` FOREIGN KEY (`admin_group_id`) REFERENCES `admin_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD CONSTRAINT `admin_user_type_fk_1` FOREIGN KEY (`user_type_id`) REFERENCES `admin_user_types` (`id`);

--
-- Constraints for table `admin_user_rights`
--
ALTER TABLE `admin_user_rights`
  ADD CONSTRAINT `admin_user_rights_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `admin_group_pages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `admin_user_rights_ibfk_2` FOREIGN KEY (`user_type_id`) REFERENCES `admin_user_types` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
