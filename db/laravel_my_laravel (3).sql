-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 28, 2017 at 02:16 PM
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
(5, 'Add Admin Action', 'Add Admin Module'),
(6, 'Edit Admin Action', 'Edit Admin Module'),
(7, 'Delete Admin Action', 'Delete Admin Module'),
(8, 'Add User Action', 'Add Admin Action'),
(9, 'Edit User Action', 'Edit Admin Action'),
(10, 'Delete User Action', 'Delete Admin Action'),
(11, 'Add Admin Module Page', 'Add Module Page'),
(12, 'Edit Admin Module Page', 'Edit Module Page'),
(13, 'Delete Admin Module Page', 'Delete Module Page'),
(14, 'Update Rights', ''),
(15, 'Add Admin Modules', ''),
(16, 'Edit Admin Modules', ''),
(17, 'Delete Admin Modules', ''),
(18, 'Add Countries', 'Add Countries'),
(19, 'Edit Countries', 'Edit Countries'),
(20, 'Delete Countries', 'Delete Countries'),
(21, 'Add State', ''),
(22, 'Edit State', ''),
(23, 'Delete State', ''),
(24, 'Add City', ''),
(25, 'Edit City', ''),
(26, 'Delete City', ''),
(27, 'Add Admin Users', 'Add Admin Users'),
(28, 'Edit Admin Users', 'Edit Admin Users'),
(29, 'Delete Admin Users', 'Delete Admin Users'),
(30, 'Add Blog Category', 'Add Blog Category'),
(31, 'Edit Blog Category', 'Edit Blog Category'),
(32, 'Delete Blog Category', 'Delete Blog Category'),
(33, 'Add Blog Tag', 'Add Blog Tag'),
(34, 'Edit Blog Tag', 'Edit Blog Tag'),
(35, 'Delete Blog Tag', 'Delete Blog Tag'),
(36, 'Add Blog Posts', 'Add Blog Posts'),
(37, 'Edit Blog Posts', 'Edit Blog Posts'),
(38, 'Delete Blog Posts', 'Delete Blog Posts'),
(39, 'Change Password Admin users', 'Change Password Admin users'),
(40, 'Add CMS Pages', ''),
(41, 'Edit CMS Pages', ''),
(42, 'Delete  CMS Pages', '');

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
(2, NULL, 'Permission', 5),
(3, NULL, 'Frontend Users', 1),
(4, NULL, 'Masters', 4),
(5, NULL, 'Blog', 3),
(6, NULL, 'CMS', 2);

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
(1, 4, ' Admin Log Actions', ' Admin Log Actions', 1, '', 'Y', '/admin/admin-actions', 'Y'),
(2, 4, 'Add Admin Log Actions', 'Add Admin Log Actions', 2, '', 'Y', '/admin/admin-actions', 'N'),
(3, 4, 'Edit Admin Log Actions', 'Edit Admin Log Actions', 3, '', 'Y', '/admin/admin-actions', 'N'),
(4, 4, 'Delete Admin Log Actions', 'Delete Admin Log Actions', 4, '', 'Y', '/admin/admin-actions', 'N'),
(5, 2, 'List Admin Module', 'List Admin Module', 0, '', 'Y', '/admin/modules', 'Y'),
(6, 2, 'Add Admin Modules', 'Add Admin Modules', 4, '', 'Y', '/admin/modules', 'N'),
(7, 2, 'Edit Admin  Modules', 'Edit Admin  Modules', 5, '', 'Y', '/admin/modules', 'N'),
(8, 2, 'Delete Admin Modules', 'Delete Admin Modules', 6, '', 'Y', '/admin/modules', 'N'),
(9, 2, 'List  Admin Module Pages', 'List  Admin Module Pages', 1, '', 'Y', '/admin/module-pages', 'Y'),
(10, 2, 'Add Admin Modules Pages', 'Add Admin Modules Pages', 7, '', 'Y', '/admin/module-pages', 'N'),
(11, 2, 'Edit Admin Modules Pages', 'Edit Admin Modules Pages', 8, '', 'Y', '/admin/module-pages', 'N'),
(12, 2, 'Delete Admin Modules Pages', 'Delete Admin Modules Pages', 9, '', 'Y', '/admin/module-pages', 'N'),
(13, 3, 'List Users', 'List Users', 1, '', 'Y', '/admin/users', 'Y'),
(14, 3, 'Add Users', 'Add Users', 2, 'Update Rights', 'Y', '/admin/users', 'N'),
(15, 3, 'Edit Users', 'Edit Users', 3, '', 'Y', '/admin/users', 'N'),
(16, 3, 'Delete Users', 'Delete Users', 4, '', 'Y', '/admin/users', 'N'),
(17, 4, ' Users Logs Actions', ' Users Logs Actions', 5, '', 'Y', '/admin/user-actions', 'Y'),
(18, 4, 'Add Users Actions', 'Add Users Actions', 6, '', 'Y', '/admin/user-actions', 'N'),
(19, 4, 'Edit Users Actions', 'Edit Users Actions', 7, '', 'Y', '/admin/user-actions', 'N'),
(20, 4, 'Delete Users Actions', 'Delete Users Actions', 8, '', 'Y', '/admin/user-actions', 'N'),
(21, 1, 'Admin Users', 'Admin Users', 1, '', 'Y', '/admin/admin-users', 'Y'),
(22, 2, 'Assign Rights', 'Assign Rights', 2, '', 'Y', '/admin/user-type-rights', 'Y'),
(23, 4, 'Countries', 'Countries', 9, '', 'Y', '/admin/countries', 'Y'),
(24, 4, 'Add Countries', 'Add Countries', 12, '', 'Y', '/admin/countries', 'N'),
(25, 4, 'Edit Countries', 'Edit Countries', 13, '', 'Y', '/admin/countries', 'N'),
(26, 4, 'Delete Countries', 'Delete Countries', 14, '', 'Y', '/admin/countries', 'N'),
(27, 4, 'States', 'States', 10, '', 'Y', '/admin/states', 'Y'),
(28, 4, 'Add States', 'Add States', 15, '', 'Y', '/admin/states', 'N'),
(29, 4, 'Edit States', 'Edit States', 16, '', 'Y', '/admin/states', 'N'),
(30, 4, 'Delete Stales', 'Delete Stales', 17, '', 'Y', '/admin/states', 'N'),
(31, 4, 'City', 'City', 11, '', 'Y', '/admin/cities', 'Y'),
(32, 4, 'Add City', 'Add City', 18, '', 'Y', '', 'N'),
(33, 4, 'Edit City', 'Edit City', 19, '', 'Y', '', 'N'),
(34, 4, 'Delete City', 'Delete City', 20, '', 'Y', '', 'N'),
(35, 5, 'Manage Categories', 'Manage Categories', 1, '', 'Y', '/admin/blog-categories', 'Y'),
(36, 5, 'Add Blog Category', 'Add Blog Category', 2, '', 'Y', '', 'N'),
(37, 5, 'Edit Blog Category', 'Edit Blog Category', 3, '', 'Y', '', 'N'),
(38, 5, 'Delete Blog Category', 'Delete Blog Category', 4, '', 'Y', '', 'N'),
(39, 5, 'Manage Blog Tags', 'Manage Blog Tags', 5, '', 'Y', '/admin/blog-tags', 'Y'),
(40, 5, 'Add Blog Tags', 'Add Blog Tags', 6, '', 'Y', '', 'N'),
(41, 5, 'Edit Blog Tags', 'Edit Blog Tags', 7, '', 'Y', '', 'N'),
(42, 5, 'Delete Blog Tags', 'Delete Blog Tags', 8, '', 'Y', '', 'N'),
(43, 5, 'Manage Blog Posts', 'Manage Blog Posts', 9, '', 'Y', '/admin/blog-posts', 'Y'),
(44, 5, 'Add Blog Posts', 'Add Blog Posts', 10, '', 'Y', '', 'N'),
(45, 5, 'Edit Blog Posts', 'Edit Blog Posts', 11, '', 'Y', '', 'N'),
(46, 5, 'Delete Blog Posts', 'Delete Blog Posts', 12, '', 'Y', '', 'N'),
(47, 1, 'Admin User Logs', 'Admin User Logs', 2, '', 'Y', '/admin/admin-userlogs', 'Y'),
(48, 1, 'Add Admin Users', 'Add Admin Users ', 3, '', 'Y', '', 'N'),
(49, 1, 'Edit Admin Users', 'Edit Admin Users', 4, '', 'Y', '', 'N'),
(50, 1, 'Delete Admin Users', 'Delete Admin Users', 5, '', 'Y', '', 'N'),
(51, 1, 'Change Password Admin users', 'Change Password Admin users', 6, '', 'Y', '', 'N'),
(52, 6, 'Manage CMS Pages', 'Manage CMS Pages', 1, '', 'Y', '/admin/cms-pages', 'Y'),
(53, 6, 'Add CMS Pages', 'Add CMS Pages', 2, '', 'Y', '', 'N'),
(54, 6, 'Edit CMS Pages', 'Edit CMS Pages', 3, '', 'Y', '', 'N'),
(55, 6, 'Delete CMS Pages', 'Delete CMS Pages', 4, '', 'Y', '', 'N');

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
(250, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-06 00:00:00', NULL),
(251, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(252, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(253, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(254, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(255, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(256, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(257, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(258, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(259, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(260, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(261, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(262, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(263, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(264, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(265, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(266, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(267, 1, 6, '5', 'Edit Admin Action::5', '::1', NULL, NULL),
(268, 1, 7, '5', 'Edit Admin Action::5', '::1', NULL, NULL),
(269, 1, 7, '13', 'Edit Admin Action::13', '::1', NULL, NULL),
(270, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(271, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(272, 1, 5, '14', 'Add Admin Action::14', '::1', NULL, NULL),
(273, 1, 6, '14', 'Edit Admin Action::14', '::1', NULL, NULL),
(274, 1, 6, '14', 'Edit Admin Action::14', '::1', NULL, NULL),
(275, 1, 5, '15', 'Add Admin Action::15', '::1', NULL, NULL),
(276, 1, 6, '15', 'Edit Admin Action::15', '::1', NULL, NULL),
(277, 1, 5, '16', 'Add Admin Action::16', '::1', NULL, NULL),
(278, 1, 6, '16', 'Edit Admin Action::16', '::1', NULL, NULL),
(279, 1, 5, '17', 'Add Admin Action::17', '::1', NULL, NULL),
(280, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(281, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(282, 1, 11, '24', 'Edit Admin Action::24', '::1', NULL, NULL),
(283, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(284, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(285, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(286, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(287, 1, 12, '24', 'Delete Admin Module Page::24', '::1', NULL, NULL),
(288, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(289, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(290, 1, 12, '1', 'Delete Admin Module Page::1', '::1', NULL, NULL),
(291, 1, 12, '1', 'Delete Admin Module Page::1', '::1', NULL, NULL),
(292, 1, 11, '25', 'Edit Admin Action::25', '::1', NULL, NULL),
(293, 1, 12, '25', 'Delete Admin Module Page::25', '::1', NULL, NULL),
(294, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(295, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(296, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(297, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(298, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(299, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(300, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(301, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(302, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(303, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(304, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(305, 1, 1, '1', 'Login Admin User', '::1', '2017-09-13 00:00:00', '2017-09-13 00:00:00'),
(306, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(307, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(308, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(309, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(310, 1, 2, '1', 'Logout Admin User', '::1', NULL, NULL),
(311, 1, 1, '1', 'Login Admin User', '::1', NULL, NULL),
(312, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-13 11:12:45', '2017-09-13 11:12:45'),
(313, 1, 1, '1', 'Login Admin User', '::1', '2017-09-13 11:12:50', '2017-09-13 11:12:50'),
(314, 1, 12, '5', 'Delete Admin Module Page::5', '::1', '2017-09-13 11:25:28', '2017-09-13 11:25:28'),
(315, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-13 11:25:35', '2017-09-13 11:25:35'),
(316, 1, 1, '1', 'Login Admin User', '::1', '2017-09-13 11:25:38', '2017-09-13 11:25:38'),
(317, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-13 11:25:55', '2017-09-13 11:25:55'),
(318, 1, 1, '1', 'Login Admin User', '::1', '2017-09-13 11:25:58', '2017-09-13 11:25:58'),
(319, 1, 12, '5', 'Delete Admin Module Page::5', '::1', '2017-09-13 11:27:10', '2017-09-13 11:27:10'),
(320, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-13 11:27:13', '2017-09-13 11:27:13'),
(321, 1, 1, '1', 'Login Admin User', '::1', '2017-09-13 11:27:16', '2017-09-13 11:27:16'),
(322, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-13 11:29:29', '2017-09-13 11:29:29'),
(323, 1, 1, '1', 'Login Admin User', '::1', '2017-09-13 11:29:32', '2017-09-13 11:29:32'),
(324, 1, 13, '23', 'Delete Admin Module Page::23', '::1', '2017-09-13 11:30:49', '2017-09-13 11:30:49'),
(325, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-13 11:30:54', '2017-09-13 11:30:54'),
(326, 1, 1, '1', 'Login Admin User', '::1', '2017-09-13 11:30:57', '2017-09-13 11:30:57'),
(327, 1, 12, '21', 'Delete Admin Module Page::21', '::1', '2017-09-13 12:08:45', '2017-09-13 12:08:45'),
(328, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-13 12:08:52', '2017-09-13 12:08:52'),
(329, 1, 1, '1', 'Login Admin User', '::1', '2017-09-13 12:08:55', '2017-09-13 12:08:55'),
(330, 1, 12, '17', 'Delete Admin Module Page::17', '::1', '2017-09-13 12:34:35', '2017-09-13 12:34:35'),
(331, 1, 12, '1', 'Delete Admin Module Page::1', '::1', '2017-09-13 12:34:58', '2017-09-13 12:34:58'),
(332, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-13 12:35:01', '2017-09-13 12:35:01'),
(333, 1, 1, '1', 'Login Admin User', '::1', '2017-09-13 12:35:05', '2017-09-13 12:35:05'),
(334, 1, 1, '1', 'Login Admin User', '::1', '2017-09-14 08:48:51', '2017-09-14 08:48:51'),
(335, 1, 11, '23', 'Edit Admin Action::23', '::1', '2017-09-14 08:52:33', '2017-09-14 08:52:33'),
(336, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-14 08:52:42', '2017-09-14 08:52:42'),
(337, 1, 1, '1', 'Login Admin User', '::1', '2017-09-14 08:52:45', '2017-09-14 08:52:45'),
(338, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-14 08:53:04', '2017-09-14 08:53:04'),
(339, 1, 1, '1', 'Login Admin User', '::1', '2017-09-14 08:53:08', '2017-09-14 08:53:08'),
(340, 1, 15, '5', 'Add Admin Module::5', '::1', '2017-09-14 09:35:48', '2017-09-14 09:35:48'),
(341, 1, 16, '5', 'Edit Admin Module::5', '::1', '2017-09-14 09:36:09', '2017-09-14 09:36:09'),
(342, 1, 17, '5', 'Delete Admin Module::5', '::1', '2017-09-14 09:36:14', '2017-09-14 09:36:14'),
(343, 1, 1, '1', 'Login Admin User', '::1', '2017-09-14 10:55:20', '2017-09-14 10:55:20'),
(344, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-14 11:04:41', '2017-09-14 11:04:41'),
(345, 1, 1, '1', 'Login Admin User', '::1', '2017-09-14 11:04:44', '2017-09-14 11:04:44'),
(346, 1, 11, '24', 'Add Admin Action::24', '::1', '2017-09-14 11:14:41', '2017-09-14 11:14:41'),
(347, 1, 12, '23', 'Delete Admin Module Page::23', '::1', '2017-09-14 11:15:19', '2017-09-14 11:15:19'),
(348, 1, 12, '24', 'Delete Admin Module Page::24', '::1', '2017-09-14 11:16:14', '2017-09-14 11:16:14'),
(349, 1, 11, '25', 'Add Admin Action::25', '::1', '2017-09-14 11:16:49', '2017-09-14 11:16:49'),
(350, 1, 12, '25', 'Delete Admin Module Page::25', '::1', '2017-09-14 11:17:09', '2017-09-14 11:17:09'),
(351, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-14 11:17:41', '2017-09-14 11:17:41'),
(352, 1, 1, '1', 'Login Admin User', '::1', '2017-09-14 11:17:44', '2017-09-14 11:17:44'),
(353, 1, 11, '26', 'Add Admin Action::26', '::1', '2017-09-14 11:30:56', '2017-09-14 11:30:56'),
(354, 1, 12, '26', 'Delete Admin Module Page::26', '::1', '2017-09-14 11:31:16', '2017-09-14 11:31:16'),
(355, 1, 11, '28', 'Add Admin Action::28', '::1', '2017-09-14 11:32:25', '2017-09-14 11:32:25'),
(356, 1, 12, '28', 'Delete Admin Module Page::28', '::1', '2017-09-14 11:32:37', '2017-09-14 11:32:37'),
(357, 1, 11, '29', 'Add Admin Action::29', '::1', '2017-09-14 11:33:53', '2017-09-14 11:33:53'),
(358, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-14 11:34:15', '2017-09-14 11:34:15'),
(359, 1, 1, '1', 'Login Admin User', '::1', '2017-09-14 11:34:19', '2017-09-14 11:34:19'),
(360, 1, 1, '1', 'Login Admin User', '::1', '2017-09-14 14:26:02', '2017-09-14 14:26:02'),
(361, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-14 15:20:51', '2017-09-14 15:20:51'),
(362, 1, 1, '1', 'Login Admin User', '::1', '2017-09-14 15:20:55', '2017-09-14 15:20:55'),
(363, 1, 1, '1', 'Login Admin User', '::1', '2017-09-15 03:50:37', '2017-09-15 03:50:37'),
(364, 1, 1, '1', 'Login Admin User', '::1', '2017-09-15 04:03:53', '2017-09-15 04:03:53'),
(365, 1, 5, '18', 'Add Admin Action::18', '::1', '2017-09-15 05:16:29', '2017-09-15 05:16:29'),
(366, 1, 5, '19', 'Add Admin Action::19', '::1', '2017-09-15 05:16:50', '2017-09-15 05:16:50'),
(367, 1, 5, '20', 'Add Admin Action::20', '::1', '2017-09-15 05:17:15', '2017-09-15 05:17:15'),
(368, 1, 11, '32', 'Add Admin Action::32', '::1', '2017-09-15 06:02:45', '2017-09-15 06:02:45'),
(369, 1, 12, '32', 'Delete Admin Module Page::32', '::1', '2017-09-15 06:03:03', '2017-09-15 06:03:03'),
(370, 1, 11, '33', 'Add Admin Action::33', '::1', '2017-09-15 06:03:54', '2017-09-15 06:03:54'),
(371, 1, 12, '29', 'Delete Admin Module Page::29', '::1', '2017-09-15 06:05:16', '2017-09-15 06:05:16'),
(372, 1, 12, '33', 'Delete Admin Module Page::33', '::1', '2017-09-15 06:05:34', '2017-09-15 06:05:34'),
(373, 1, 11, '34', 'Add Admin Action::34', '::1', '2017-09-15 06:06:09', '2017-09-15 06:06:09'),
(374, 1, 12, '34', 'Delete Admin Module Page::34', '::1', '2017-09-15 06:06:20', '2017-09-15 06:06:20'),
(375, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-15 06:07:03', '2017-09-15 06:07:03'),
(376, 1, 1, '1', 'Login Admin User', '::1', '2017-09-15 06:07:06', '2017-09-15 06:07:06'),
(377, 1, 12, '31', 'Delete Admin Module Page::31', '::1', '2017-09-15 06:58:43', '2017-09-15 06:58:43'),
(378, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-15 07:02:11', '2017-09-15 07:02:11'),
(379, 1, 1, '1', 'Login Admin User', '::1', '2017-09-15 07:02:15', '2017-09-15 07:02:15'),
(380, 1, 11, '35', 'Add Admin Action::35', '::1', '2017-09-15 07:03:00', '2017-09-15 07:03:00'),
(381, 1, 12, '35', 'Delete Admin Module Page::35', '::1', '2017-09-15 07:03:18', '2017-09-15 07:03:18'),
(382, 1, 11, '36', 'Add Admin Action::36', '::1', '2017-09-15 07:03:44', '2017-09-15 07:03:44'),
(383, 1, 11, '37', 'Add Admin Action::37', '::1', '2017-09-15 07:04:08', '2017-09-15 07:04:08'),
(384, 1, 12, '35', 'Delete Admin Module Page::35', '::1', '2017-09-15 07:04:29', '2017-09-15 07:04:29'),
(385, 1, 12, '36', 'Delete Admin Module Page::36', '::1', '2017-09-15 07:04:38', '2017-09-15 07:04:38'),
(386, 1, 12, '37', 'Delete Admin Module Page::37', '::1', '2017-09-15 07:04:49', '2017-09-15 07:04:49'),
(387, 1, 5, '21', 'Add Admin Action::21', '::1', '2017-09-15 07:06:09', '2017-09-15 07:06:09'),
(388, 1, 5, '22', 'Add Admin Action::22', '::1', '2017-09-15 07:06:28', '2017-09-15 07:06:28'),
(389, 1, 5, '23', 'Add Admin Action::23', '::1', '2017-09-15 07:06:40', '2017-09-15 07:06:40'),
(390, 1, 5, '24', 'Add Admin Action::24', '::1', '2017-09-15 07:06:54', '2017-09-15 07:06:54'),
(391, 1, 6, '24', 'Edit Admin Action::24', '::1', '2017-09-15 07:07:41', '2017-09-15 07:07:41'),
(392, 1, 5, '25', 'Add Admin Action::25', '::1', '2017-09-15 07:07:56', '2017-09-15 07:07:56'),
(393, 1, 5, '26', 'Add Admin Action::26', '::1', '2017-09-15 07:08:09', '2017-09-15 07:08:09'),
(394, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-15 07:12:10', '2017-09-15 07:12:10'),
(395, 1, 1, '1', 'Login Admin User', '::1', '2017-09-15 07:12:15', '2017-09-15 07:12:15'),
(396, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-15 07:14:13', '2017-09-15 07:14:13'),
(397, 1, 1, '1', 'Login Admin User', '::1', '2017-09-15 07:14:17', '2017-09-15 07:14:17'),
(398, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-15 07:17:16', '2017-09-15 07:17:16'),
(399, 1, 1, '1', 'Login Admin User', '::1', '2017-09-15 07:17:20', '2017-09-15 07:17:20'),
(400, 1, 24, '1', 'Add City::1', '::1', '2017-09-15 07:19:35', '2017-09-15 07:19:35'),
(401, 1, 25, '1', 'Edit City::1', '::1', '2017-09-15 07:25:35', '2017-09-15 07:25:35'),
(402, 1, 24, '2', 'Add City::2', '::1', '2017-09-15 07:27:18', '2017-09-15 07:27:18'),
(403, 1, 25, '2', 'Edit City::2', '::1', '2017-09-15 07:27:47', '2017-09-15 07:27:47'),
(404, 1, 24, '3', 'Add City::3', '::1', '2017-09-15 07:28:12', '2017-09-15 07:28:12'),
(405, 1, 26, '3', 'Delete City::3', '::1', '2017-09-15 07:37:51', '2017-09-15 07:37:51'),
(406, 1, 22, '9', 'Edit State::9', '::1', '2017-09-15 07:55:56', '2017-09-15 07:55:56'),
(407, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-15 07:58:49', '2017-09-15 07:58:49'),
(408, 1, 1, '1', 'Login Admin User', '::1', '2017-09-15 07:58:54', '2017-09-15 07:58:54'),
(409, 1, 21, '14', 'Add State ::14', '::1', '2017-09-15 08:01:37', '2017-09-15 08:01:37'),
(410, 1, 23, '14', 'Delete State::14', '::1', '2017-09-15 08:02:06', '2017-09-15 08:02:06'),
(411, 1, 23, '13', 'Delete State::13', '::1', '2017-09-15 08:02:13', '2017-09-15 08:02:13'),
(412, 1, 23, '12', 'Delete State::12', '::1', '2017-09-15 08:53:08', '2017-09-15 08:53:08'),
(413, 1, 23, '11', 'Delete State::11', '::1', '2017-09-15 08:53:12', '2017-09-15 08:53:12'),
(414, 1, 23, '10', 'Delete State::10', '::1', '2017-09-15 08:53:16', '2017-09-15 08:53:16'),
(415, 1, 23, '9', 'Delete State::9', '::1', '2017-09-15 08:53:21', '2017-09-15 08:53:21'),
(416, 1, 23, '8', 'Delete State::8', '::1', '2017-09-15 08:53:25', '2017-09-15 08:53:25'),
(417, 1, 23, '7', 'Delete State::7', '::1', '2017-09-15 08:53:30', '2017-09-15 08:53:30'),
(418, 1, 23, '6', 'Delete State::6', '::1', '2017-09-15 08:53:34', '2017-09-15 08:53:34'),
(419, 1, 21, '15', 'Add State ::15', '::1', '2017-09-15 08:53:49', '2017-09-15 08:53:49'),
(420, 1, 21, '16', 'Add State ::16', '::1', '2017-09-15 08:59:56', '2017-09-15 08:59:56'),
(421, 1, 21, '17', 'Add State ::17', '::1', '2017-09-15 09:02:29', '2017-09-15 09:02:29'),
(422, 1, 18, '16', 'Add Country::16', '::1', '2017-09-15 09:08:58', '2017-09-15 09:08:58'),
(423, 1, 19, '16', 'Edit City::16', '::1', '2017-09-15 09:09:10', '2017-09-15 09:09:10'),
(424, 1, 19, '16', 'Edit City::16', '::1', '2017-09-15 09:09:16', '2017-09-15 09:09:16'),
(425, 1, 21, '18', 'Add State ::18', '::1', '2017-09-15 09:10:10', '2017-09-15 09:10:10'),
(426, 1, 23, '17', 'Delete State::17', '::1', '2017-09-15 09:18:47', '2017-09-15 09:18:47'),
(427, 1, 23, '16', 'Delete State::16', '::1', '2017-09-15 09:18:51', '2017-09-15 09:18:51'),
(428, 1, 21, '19', 'Add State::19', '::1', '2017-09-15 09:18:59', '2017-09-15 09:18:59'),
(429, 1, 23, '19', 'Delete State::19', '::1', '2017-09-15 09:19:12', '2017-09-15 09:19:12'),
(430, 1, 22, '18', 'Edit State::18', '::1', '2017-09-15 09:19:24', '2017-09-15 09:19:24'),
(431, 1, 22, '18', 'Edit State::18', '::1', '2017-09-15 09:19:34', '2017-09-15 09:19:34'),
(432, 1, 21, '20', 'Add State::20', '::1', '2017-09-15 09:24:45', '2017-09-15 09:24:45'),
(433, 1, 23, '20', 'Delete State::20', '::1', '2017-09-15 09:25:04', '2017-09-15 09:25:04'),
(434, 1, 21, '21', 'Add State::21', '::1', '2017-09-15 09:33:02', '2017-09-15 09:33:02'),
(435, 1, 21, '22', 'Add State::22', '::1', '2017-09-15 09:34:58', '2017-09-15 09:34:58'),
(436, 1, 22, '22', 'Edit State::22', '::1', '2017-09-15 09:35:16', '2017-09-15 09:35:16'),
(437, 1, 22, '22', 'Edit State::22', '::1', '2017-09-15 09:48:17', '2017-09-15 09:48:17'),
(438, 1, 23, '22', 'Delete State::22', '::1', '2017-09-15 10:50:36', '2017-09-15 10:50:36'),
(439, 1, 21, '23', 'Add State::23', '::1', '2017-09-15 11:02:16', '2017-09-15 11:02:16'),
(440, 1, 21, '24', 'Add State::24', '::1', '2017-09-15 11:02:53', '2017-09-15 11:02:53'),
(441, 1, 21, '25', 'Add State::25', '::1', '2017-09-15 11:12:35', '2017-09-15 11:12:35'),
(442, 1, 21, '26', 'Add State::26', '::1', '2017-09-15 11:19:02', '2017-09-15 11:19:02'),
(443, 1, 24, '4', 'Add City::4', '::1', '2017-09-15 11:21:38', '2017-09-15 11:21:38'),
(444, 1, 24, '5', 'Add City::5', '::1', '2017-09-15 11:21:45', '2017-09-15 11:21:45'),
(445, 1, 24, '6', 'Add City::6', '::1', '2017-09-15 11:22:43', '2017-09-15 11:22:43'),
(446, 1, 24, '7', 'Add City::7', '::1', '2017-09-15 11:25:30', '2017-09-15 11:25:30'),
(447, 1, 24, '8', 'Add City::8', '::1', '2017-09-15 11:30:14', '2017-09-15 11:30:14'),
(448, 1, 24, '9', 'Add City::9', '::1', '2017-09-15 11:30:33', '2017-09-15 11:30:33'),
(449, 1, 1, '1', 'Login Admin User', '::1', '2017-09-15 11:51:03', '2017-09-15 11:51:03'),
(450, 1, 23, '26', 'Delete State::26', '::1', '2017-09-15 12:16:34', '2017-09-15 12:16:34'),
(451, 1, 23, '25', 'Delete State::25', '::1', '2017-09-15 12:16:39', '2017-09-15 12:16:39'),
(452, 1, 23, '24', 'Delete State::24', '::1', '2017-09-15 12:16:46', '2017-09-15 12:16:46'),
(453, 1, 23, '23', 'Delete State::23', '::1', '2017-09-15 12:16:50', '2017-09-15 12:16:50'),
(454, 1, 26, '9', 'Delete City::9', '::1', '2017-09-15 12:23:29', '2017-09-15 12:23:29'),
(455, 1, 26, '8', 'Delete City::8', '::1', '2017-09-15 12:23:33', '2017-09-15 12:23:33'),
(456, 1, 1, '1', 'Login Admin User', '::1', '2017-09-15 12:48:49', '2017-09-15 12:48:49'),
(457, 1, 1, '1', 'Login Admin User', '::1', '2017-09-18 04:09:25', '2017-09-18 04:09:25'),
(459, 1, 1, '1', 'Login Admin User', '::1', '2017-09-16 08:15:45', '2017-09-16 08:15:45'),
(460, 1, 14, '1', 'Update Rights ::1', '::1', '2017-09-16 08:16:40', '2017-09-16 08:16:40'),
(461, 1, 15, '5', 'Add Admin Module::5', '::1', '2017-09-16 08:21:16', '2017-09-16 08:21:16'),
(462, 1, 16, '5', 'Edit Admin Module::5', '::1', '2017-09-16 08:21:46', '2017-09-16 08:21:46'),
(463, 1, 15, '6', 'Add Admin Module::6', '::1', '2017-09-16 08:22:06', '2017-09-16 08:22:06'),
(464, 1, 17, '6', 'Delete Admin Module::6', '::1', '2017-09-16 08:22:14', '2017-09-16 08:22:14'),
(465, 1, 8, '11', 'Add User Action::11', '::1', '2017-09-16 08:27:13', '2017-09-16 08:27:13'),
(466, 1, 10, '11', 'Delete User Action::11', '::1', '2017-09-16 08:28:36', '2017-09-16 08:28:36'),
(467, 1, 10, '10', 'Delete User Action::10', '::1', '2017-09-16 08:28:42', '2017-09-16 08:28:42'),
(468, 1, 9, '8', 'Edit User Action::8', '::1', '2017-09-16 08:28:57', '2017-09-16 08:28:57'),
(469, 1, 12, '13', 'Edit Admin Module Page::13', '::1', '2017-09-16 08:35:19', '2017-09-16 08:35:19'),
(470, 1, 12, '31', 'Edit Admin Module Page::31', '::1', '2017-09-16 08:36:38', '2017-09-16 08:36:38'),
(471, 1, 12, '27', 'Edit Admin Module Page::27', '::1', '2017-09-16 08:37:02', '2017-09-16 08:37:02'),
(472, 1, 12, '23', 'Edit Admin Module Page::23', '::1', '2017-09-16 08:37:45', '2017-09-16 08:37:45'),
(473, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-16 08:38:19', '2017-09-16 08:38:19'),
(474, 1, 1, '1', 'Login Admin User', '::1', '2017-09-16 08:38:22', '2017-09-16 08:38:22'),
(475, 1, 12, '1', 'Edit Admin Module Page::1', '::1', '2017-09-16 08:44:25', '2017-09-16 08:44:25'),
(476, 1, 12, '17', 'Edit Admin Module Page::17', '::1', '2017-09-16 08:45:11', '2017-09-16 08:45:11'),
(477, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-16 08:45:26', '2017-09-16 08:45:26'),
(478, 1, 1, '1', 'Login Admin User', '::1', '2017-09-16 08:45:34', '2017-09-16 08:45:34'),
(479, 1, 5, '27', 'Add Admin Action::27', '::1', '2017-09-16 08:46:22', '2017-09-16 08:46:22'),
(480, 1, 6, '27', 'Edit Admin Action::27', '::1', '2017-09-16 08:46:29', '2017-09-16 08:46:29'),
(481, 1, 7, '27', 'Delete Admin Action::27', '::1', '2017-09-16 08:46:34', '2017-09-16 08:46:34'),
(482, 1, 18, '1', 'Add Country::1', '::1', '2017-09-16 08:47:07', '2017-09-16 08:47:07'),
(483, 1, 18, '2', 'Add Country::2', '::1', '2017-09-16 08:47:16', '2017-09-16 08:47:16'),
(484, 1, 19, '1', 'Edit Country::1', '::1', '2017-09-16 08:47:39', '2017-09-16 08:47:39'),
(485, 1, 19, '1', 'Edit Country::1', '::1', '2017-09-16 08:47:47', '2017-09-16 08:47:47'),
(486, 1, 21, '27', 'Add State::27', '::1', '2017-09-16 08:50:23', '2017-09-16 08:50:23'),
(487, 1, 21, '28', 'Add State::28', '::1', '2017-09-16 08:50:44', '2017-09-16 08:50:44'),
(488, 1, 22, '28', 'Edit State::28', '::1', '2017-09-16 08:50:54', '2017-09-16 08:50:54'),
(489, 1, 22, '28', 'Edit State::28', '::1', '2017-09-16 08:53:11', '2017-09-16 08:53:11'),
(490, 1, 21, '29', 'Add State::29', '::1', '2017-09-16 08:53:40', '2017-09-16 08:53:40'),
(491, 1, 21, '30', 'Add State::30', '::1', '2017-09-16 08:55:33', '2017-09-16 08:55:33'),
(492, 1, 23, '30', 'Delete State::30', '::1', '2017-09-16 08:55:39', '2017-09-16 08:55:39'),
(493, 1, 1, '1', 'Login Admin User', '::1', '2017-09-16 13:35:48', '2017-09-16 13:35:48'),
(494, 1, 14, '1', 'Update Rights ::1', '::1', '2017-09-16 13:37:07', '2017-09-16 13:37:07'),
(495, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-16 13:37:14', '2017-09-16 13:37:14'),
(496, 1, 1, '1', 'Login Admin User', '::1', '2017-09-16 13:37:16', '2017-09-16 13:37:16'),
(497, 1, 1, '1', 'Login Admin User', '::1', '2017-09-17 13:53:49', '2017-09-17 13:53:49'),
(498, 1, 1, '1', 'Login Admin User', '::1', '2017-09-18 05:31:44', '2017-09-18 05:31:44'),
(499, 1, 15, '5', 'Add Admin Module::5', '::1', '2017-09-27 08:06:10', '2017-09-27 08:06:10'),
(500, 1, 1, '1', 'Login Admin User', '::1', '2017-09-27 08:08:49', '2017-09-27 08:08:49'),
(501, 1, 1, '1', 'Login Admin User', '::1', '2017-09-27 08:51:31', '2017-09-27 08:51:31'),
(502, 1, 11, '35', 'Add Admin Models Page ::35', '::1', '2017-09-27 08:52:50', '2017-09-27 08:52:50'),
(503, 1, 14, '1', 'Update Rights ::1', '::1', '2017-09-27 08:53:07', '2017-09-27 08:53:07'),
(504, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-27 08:53:12', '2017-09-27 08:53:12'),
(505, 1, 1, '1', 'Login Admin User', '::1', '2017-09-27 08:53:16', '2017-09-27 08:53:16'),
(506, 1, 11, '36', 'Add Admin Models Page ::36', '::1', '2017-09-27 09:15:02', '2017-09-27 09:15:02'),
(507, 1, 11, '37', 'Add Admin Models Page ::37', '::1', '2017-09-27 09:15:52', '2017-09-27 09:15:52'),
(508, 1, 11, '38', 'Add Admin Models Page ::38', '::1', '2017-09-27 09:16:17', '2017-09-27 09:16:17'),
(509, 1, 1, '1', 'Login Admin User', '::1', '2017-09-27 09:34:55', '2017-09-27 09:34:55'),
(510, 1, 14, '1', 'Update Rights ::1', '::1', '2017-09-27 09:41:01', '2017-09-27 09:41:01'),
(511, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-27 09:41:06', '2017-09-27 09:41:06'),
(512, 1, 1, '1', 'Login Admin User', '::1', '2017-09-27 09:41:10', '2017-09-27 09:41:10'),
(513, 1, 30, '1', 'Add Country::1', '::1', '2017-09-27 09:44:36', '2017-09-27 09:44:36'),
(514, 1, 31, '1', 'Add Country::1', '::1', '2017-09-27 09:44:47', '2017-09-27 09:44:47'),
(515, 1, 32, '1', 'Add Country::1', '::1', '2017-09-27 09:44:52', '2017-09-27 09:44:52'),
(516, 1, 11, '39', 'Add Admin Models Page ::39', '::1', '2017-09-27 09:45:54', '2017-09-27 09:45:54'),
(517, 1, 11, '40', 'Add Admin Models Page ::40', '::1', '2017-09-27 09:46:26', '2017-09-27 09:46:26'),
(518, 1, 11, '41', 'Add Admin Models Page ::41', '::1', '2017-09-27 09:46:59', '2017-09-27 09:46:59'),
(519, 1, 11, '42', 'Add Admin Models Page ::42', '::1', '2017-09-27 09:47:25', '2017-09-27 09:47:25'),
(520, 1, 14, '1', 'Update Rights ::1', '::1', '2017-09-27 09:48:09', '2017-09-27 09:48:09'),
(521, 1, 14, '1', 'Update Rights ::1', '::1', '2017-09-27 09:48:24', '2017-09-27 09:48:24'),
(522, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-27 09:48:28', '2017-09-27 09:48:28'),
(523, 1, 1, '1', 'Login Admin User', '::1', '2017-09-27 09:48:32', '2017-09-27 09:48:32'),
(524, 1, 33, '1', 'Add Country::1', '::1', '2017-09-27 09:59:50', '2017-09-27 09:59:50'),
(525, 1, 34, '1', 'Add Country::1', '::1', '2017-09-27 10:00:02', '2017-09-27 10:00:02'),
(526, 1, 1, '1', 'Login Admin User', '::1', '2017-09-27 10:03:37', '2017-09-27 10:03:37'),
(527, 1, 11, '43', 'Add Admin Models Page ::43', '::1', '2017-09-27 10:07:20', '2017-09-27 10:07:20'),
(528, 1, 11, '44', 'Add Admin Models Page ::44', '::1', '2017-09-27 10:08:11', '2017-09-27 10:08:11'),
(529, 1, 11, '45', 'Add Admin Models Page ::45', '::1', '2017-09-27 10:09:09', '2017-09-27 10:09:09'),
(530, 1, 11, '46', 'Add Admin Models Page ::46', '::1', '2017-09-27 10:09:39', '2017-09-27 10:09:39'),
(531, 1, 14, '1', 'Update Rights ::1', '::1', '2017-09-27 10:13:04', '2017-09-27 10:13:04'),
(532, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-27 10:13:07', '2017-09-27 10:13:07'),
(533, 1, 1, '1', 'Login Admin User', '::1', '2017-09-27 10:13:12', '2017-09-27 10:13:12'),
(534, 1, 1, '1', 'Login Admin User', '::1', '2017-09-27 10:47:20', '2017-09-27 10:47:20'),
(535, 1, 30, '2', 'Add Country::2', '::1', '2017-09-27 11:00:26', '2017-09-27 11:00:26'),
(536, 1, 34, '1', 'Add Country::1', '::1', '2017-09-27 11:52:13', '2017-09-27 11:52:13'),
(537, 1, 35, '1', 'Add Country::1', '::1', '2017-09-27 11:52:21', '2017-09-27 11:52:21'),
(538, 1, 1, '1', 'Login Admin User', '::1', '2017-09-27 12:30:48', '2017-09-27 12:30:48'),
(539, 1, 1, '1', 'Login Admin User', '::1', '2017-09-28 03:59:53', '2017-09-28 03:59:53'),
(540, 1, 12, '1', 'Edit Admin Module Page::1', '::1', '2017-09-28 05:03:39', '2017-09-28 05:03:39'),
(541, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-28 05:03:43', '2017-09-28 05:03:43'),
(542, 1, 1, '1', 'Login Admin User', '::1', '2017-09-28 05:03:47', '2017-09-28 05:03:47'),
(543, 1, 5, '27', 'Add Admin Action::27', '::1', '2017-09-28 05:04:31', '2017-09-28 05:04:31'),
(544, 1, 6, '27', 'Edit Admin Action::27', '::1', '2017-09-28 05:04:44', '2017-09-28 05:04:44'),
(545, 1, 5, '28', 'Add Admin Action::28', '::1', '2017-09-28 05:04:53', '2017-09-28 05:04:53'),
(546, 1, 7, '28', 'Delete Admin Action::28', '::1', '2017-09-28 05:04:58', '2017-09-28 05:04:58'),
(547, 1, 10, '8', 'Delete User Action::8', '::1', '2017-09-28 05:05:41', '2017-09-28 05:05:41'),
(548, 1, 10, '7', 'Delete User Action::7', '::1', '2017-09-28 05:05:44', '2017-09-28 05:05:44'),
(549, 1, 10, '6', 'Delete User Action::6', '::1', '2017-09-28 05:05:49', '2017-09-28 05:05:49'),
(550, 1, 9, '1', 'Edit User Action::1', '::1', '2017-09-28 05:06:00', '2017-09-28 05:06:00'),
(551, 1, 8, '9', 'Add User Action::9', '::1', '2017-09-28 05:06:19', '2017-09-28 05:06:19'),
(552, 1, 19, '2', 'Edit Country::2', '::1', '2017-09-28 05:06:48', '2017-09-28 05:06:48'),
(553, 1, 19, '15', 'Edit Country::15', '::1', '2017-09-28 05:07:07', '2017-09-28 05:07:07'),
(554, 1, 18, '17', 'Add Country::17', '::1', '2017-09-28 05:07:18', '2017-09-28 05:07:18'),
(555, 1, 21, '30', 'Add State::30', '::1', '2017-09-28 05:07:52', '2017-09-28 05:07:52'),
(556, 1, 22, '30', 'Edit State::30', '::1', '2017-09-28 05:07:59', '2017-09-28 05:07:59'),
(557, 1, 24, '1', 'Add City::1', '::1', '2017-09-28 05:11:46', '2017-09-28 05:11:46'),
(558, 1, 25, '1', 'Edit City::1', '::1', '2017-09-28 05:11:57', '2017-09-28 05:11:57'),
(559, 1, 26, '1', 'Delete City::1', '::1', '2017-09-28 05:12:15', '2017-09-28 05:12:15'),
(560, 1, 16, '2', 'Edit Admin Module::2', '::1', '2017-09-28 05:12:51', '2017-09-28 05:12:51'),
(561, 1, 16, '3', 'Edit Admin Module::3', '::1', '2017-09-28 05:13:07', '2017-09-28 05:13:07'),
(562, 1, 16, '5', 'Edit Admin Module::5', '::1', '2017-09-28 05:13:17', '2017-09-28 05:13:17'),
(563, 1, 16, '5', 'Edit Admin Module::5', '::1', '2017-09-28 05:13:27', '2017-09-28 05:13:27'),
(564, 1, 16, '4', 'Edit Admin Module::4', '::1', '2017-09-28 05:13:30', '2017-09-28 05:13:30'),
(565, 1, 16, '2', 'Edit Admin Module::2', '::1', '2017-09-28 05:13:34', '2017-09-28 05:13:34'),
(566, 1, 16, '5', 'Edit Admin Module::5', '::1', '2017-09-28 05:13:55', '2017-09-28 05:13:55'),
(567, 1, 16, '4', 'Edit Admin Module::4', '::1', '2017-09-28 05:14:07', '2017-09-28 05:14:07'),
(568, 1, 16, '2', 'Edit Admin Module::2', '::1', '2017-09-28 05:14:23', '2017-09-28 05:14:23'),
(569, 1, 12, '21', 'Edit Admin Module Page::21', '::1', '2017-09-28 05:15:26', '2017-09-28 05:15:26'),
(570, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-28 05:17:47', '2017-09-28 05:17:47'),
(571, 1, 1, '1', 'Login Admin User', '::1', '2017-09-28 05:17:51', '2017-09-28 05:17:51'),
(572, 1, 28, '1', 'Edit Admin User::1', '::1', '2017-09-28 05:29:29', '2017-09-28 05:29:29'),
(573, 1, 11, '47', 'Add Admin Models Page ::47', '::1', '2017-09-28 05:38:37', '2017-09-28 05:38:37'),
(574, 1, 14, '1', 'Update Rights ::1', '::1', '2017-09-28 05:38:52', '2017-09-28 05:38:52'),
(575, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-28 05:38:58', '2017-09-28 05:38:58'),
(576, 1, 1, '1', 'Login Admin User', '::1', '2017-09-28 05:39:02', '2017-09-28 05:39:02'),
(577, 1, 12, '47', 'Edit Admin Module Page::47', '::1', '2017-09-28 05:40:31', '2017-09-28 05:40:31'),
(578, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-28 05:40:37', '2017-09-28 05:40:37'),
(579, 1, 1, '1', 'Login Admin User', '::1', '2017-09-28 05:40:40', '2017-09-28 05:40:40'),
(580, 1, 11, '48', 'Add Admin Models Page ::48', '::1', '2017-09-28 05:44:00', '2017-09-28 05:44:00'),
(581, 1, 11, '49', 'Add Admin Models Page ::49', '::1', '2017-09-28 05:44:27', '2017-09-28 05:44:27'),
(582, 1, 11, '50', 'Add Admin Models Page ::50', '::1', '2017-09-28 05:44:51', '2017-09-28 05:44:51'),
(583, 1, 14, '1', 'Update Rights ::1', '::1', '2017-09-28 05:45:16', '2017-09-28 05:45:16'),
(584, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-28 05:45:21', '2017-09-28 05:45:21'),
(585, 1, 1, '1', 'Login Admin User', '::1', '2017-09-28 05:45:25', '2017-09-28 05:45:25'),
(586, 1, 28, '1', 'Edit Admin User::1', '::1', '2017-09-28 06:10:17', '2017-09-28 06:10:17'),
(587, 1, 27, '2', 'Add Admin User::2', '::1', '2017-09-28 06:15:58', '2017-09-28 06:15:58'),
(588, 1, 28, '2', 'Edit Admin User::2', '::1', '2017-09-28 06:16:41', '2017-09-28 06:16:41'),
(589, 1, 30, '3', 'Add Country::3', '::1', '2017-09-28 06:19:26', '2017-09-28 06:19:26'),
(590, 1, 31, '3', 'Add Country::3', '::1', '2017-09-28 06:19:37', '2017-09-28 06:19:37'),
(591, 1, 6, '27', 'Edit Admin Action::27', '::1', '2017-09-28 06:20:43', '2017-09-28 06:20:43'),
(592, 1, 6, '27', 'Edit Admin Action::27', '::1', '2017-09-28 06:21:00', '2017-09-28 06:21:00'),
(593, 1, 6, '27', 'Edit Admin Action::27', '::1', '2017-09-28 06:22:02', '2017-09-28 06:22:02'),
(594, 1, 5, '29', 'Add Admin Action::29', '::1', '2017-09-28 06:22:22', '2017-09-28 06:22:22'),
(595, 1, 5, '30', 'Add Admin Action::30', '::1', '2017-09-28 06:22:36', '2017-09-28 06:22:36'),
(596, 1, 6, '29', 'Edit Admin Action::29', '::1', '2017-09-28 06:22:47', '2017-09-28 06:22:47'),
(597, 1, 6, '30', 'Edit Admin Action::30', '::1', '2017-09-28 06:22:55', '2017-09-28 06:22:55'),
(598, 1, 5, '31', 'Add Admin Action::31', '::1', '2017-09-28 06:23:22', '2017-09-28 06:23:22'),
(599, 1, 6, '31', 'Edit Admin Action::31', '::1', '2017-09-28 06:23:31', '2017-09-28 06:23:31'),
(600, 1, 5, '32', 'Add Admin Action::32', '::1', '2017-09-28 06:23:48', '2017-09-28 06:23:48'),
(601, 1, 6, '32', 'Edit Admin Action::32', '::1', '2017-09-28 06:23:56', '2017-09-28 06:23:56'),
(602, 1, 5, '33', 'Add Admin Action::33', '::1', '2017-09-28 06:24:14', '2017-09-28 06:24:14'),
(603, 1, 6, '33', 'Edit Admin Action::33', '::1', '2017-09-28 06:24:21', '2017-09-28 06:24:21'),
(604, 1, 5, '34', 'Add Admin Action::34', '::1', '2017-09-28 06:24:57', '2017-09-28 06:24:57'),
(605, 1, 6, '34', 'Edit Admin Action::34', '::1', '2017-09-28 06:25:05', '2017-09-28 06:25:05'),
(606, 1, 5, '35', 'Add Admin Action::35', '::1', '2017-09-28 06:25:18', '2017-09-28 06:25:18'),
(607, 1, 6, '35', 'Edit Admin Action::35', '::1', '2017-09-28 06:25:28', '2017-09-28 06:25:28'),
(608, 1, 5, '36', 'Add Admin Action::36', '::1', '2017-09-28 06:25:48', '2017-09-28 06:25:48'),
(609, 1, 6, '36', 'Edit Admin Action::36', '::1', '2017-09-28 06:25:57', '2017-09-28 06:25:57'),
(610, 1, 5, '37', 'Add Admin Action::37', '::1', '2017-09-28 06:27:52', '2017-09-28 06:27:52'),
(611, 1, 6, '37', 'Edit Admin Action::37', '::1', '2017-09-28 06:28:00', '2017-09-28 06:28:00'),
(612, 1, 5, '38', 'Add Admin Action::38', '::1', '2017-09-28 06:28:14', '2017-09-28 06:28:14'),
(613, 1, 6, '38', 'Edit Admin Action::38', '::1', '2017-09-28 06:28:21', '2017-09-28 06:28:21'),
(614, 1, 5, '39', 'Add Admin Action::39', '::1', '2017-09-28 06:28:36', '2017-09-28 06:28:36'),
(615, 1, 6, '39', 'Edit Admin Action::39', '::1', '2017-09-28 06:28:42', '2017-09-28 06:28:42'),
(616, 1, 30, '4', 'Add Country::4', '::1', '2017-09-28 06:31:53', '2017-09-28 06:31:53'),
(617, 1, 31, '4', 'Add Country::4', '::1', '2017-09-28 06:32:01', '2017-09-28 06:32:01'),
(618, 1, 32, '4', 'Add Country::4', '::1', '2017-09-28 06:32:05', '2017-09-28 06:32:05'),
(619, 1, 33, '2', 'Add Country::2', '::1', '2017-09-28 06:32:27', '2017-09-28 06:32:27'),
(620, 1, 34, '2', 'Add Country::2', '::1', '2017-09-28 06:32:34', '2017-09-28 06:32:34'),
(621, 1, 35, '2', 'Add Country::2', '::1', '2017-09-28 06:32:38', '2017-09-28 06:32:38'),
(622, 1, 36, '6', 'Add State::6', '::1', '2017-09-28 06:33:31', '2017-09-28 06:33:31'),
(623, 1, 37, '6', 'Add Country::6', '::1', '2017-09-28 06:33:42', '2017-09-28 06:33:42'),
(624, 1, 38, '6', 'Add Country::6', '::1', '2017-09-28 06:33:54', '2017-09-28 06:33:54'),
(625, 1, 28, '2', 'Edit Admin User::2', '::1', '2017-09-28 06:49:38', '2017-09-28 06:49:38'),
(626, 1, 11, '51', 'Add Admin Models Page ::51', '::1', '2017-09-28 07:39:41', '2017-09-28 07:39:41'),
(627, 1, 12, '51', 'Edit Admin Module Page::51', '::1', '2017-09-28 07:39:55', '2017-09-28 07:39:55'),
(628, 1, 5, '40', 'Add Admin Action::40', '::1', '2017-09-28 07:41:30', '2017-09-28 07:41:30'),
(629, 1, 6, '40', 'Edit Admin Action::40', '::1', '2017-09-28 07:41:38', '2017-09-28 07:41:38'),
(630, 1, 14, '1', 'Update Rights ::1', '::1', '2017-09-28 07:42:19', '2017-09-28 07:42:19'),
(631, 1, 14, '1', 'Update Rights ::1', '::1', '2017-09-28 07:42:29', '2017-09-28 07:42:29'),
(632, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-28 07:42:32', '2017-09-28 07:42:32'),
(633, 1, 1, '1', 'Login Admin User', '::1', '2017-09-28 07:42:50', '2017-09-28 07:42:50'),
(634, 1, 39, '1', 'Add Admin User::1', '::1', '2017-09-28 07:43:17', '2017-09-28 07:43:17'),
(635, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-28 07:43:38', '2017-09-28 07:43:38'),
(636, 1, 1, '1', 'Login Admin User', '::1', '2017-09-28 07:43:51', '2017-09-28 07:43:51'),
(637, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-28 07:44:08', '2017-09-28 07:44:08'),
(638, 1, 1, '1', 'Login Admin User', '::1', '2017-09-28 07:44:37', '2017-09-28 07:44:37'),
(639, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-28 07:44:48', '2017-09-28 07:44:48'),
(640, 1, 1, '1', 'Login Admin User', '::1', '2017-09-28 07:45:14', '2017-09-28 07:45:14'),
(641, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-28 07:46:42', '2017-09-28 07:46:42'),
(642, 1, 1, '1', 'Login Admin User', '::1', '2017-09-28 07:48:35', '2017-09-28 07:48:35'),
(643, 1, 28, '2', 'Edit Admin User::2', '::1', '2017-09-28 07:49:55', '2017-09-28 07:49:55'),
(644, 1, 28, '2', 'Edit Admin User::2', '::1', '2017-09-28 07:50:07', '2017-09-28 07:50:07'),
(645, 1, 3, '1', 'Update Profile', '::1', '2017-09-28 07:52:55', '2017-09-28 07:52:55');
INSERT INTO `admin_logs` (`id`, `adminuserid`, `actionid`, `actionvalue`, `remark`, `ipaddress`, `created_at`, `updated_at`) VALUES
(646, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-28 07:53:07', '2017-09-28 07:53:07'),
(647, 1, 1, '1', 'Login Admin User', '::1', '2017-09-28 07:53:11', '2017-09-28 07:53:11'),
(648, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-28 09:06:25', '2017-09-28 09:06:25'),
(649, 1, 1, '1', 'Login Admin User', '::1', '2017-09-28 09:07:02', '2017-09-28 09:07:02'),
(650, 1, 39, '2', 'Add Admin User::2', '::1', '2017-09-28 09:07:19', '2017-09-28 09:07:19'),
(651, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-28 09:07:37', '2017-09-28 09:07:37'),
(652, 2, 1, '2', 'Login Admin User', '::1', '2017-09-28 09:07:48', '2017-09-28 09:07:48'),
(653, 2, 27, '3', 'Add Admin User::3', '::1', '2017-09-28 09:08:42', '2017-09-28 09:08:42'),
(654, 2, 2, '2', 'Logout Admin User', '::1', '2017-09-28 09:08:48', '2017-09-28 09:08:48'),
(655, 3, 1, '3', 'Login Admin User', '::1', '2017-09-28 09:08:59', '2017-09-28 09:08:59'),
(656, 3, 28, '3', 'Edit Admin User::3', '::1', '2017-09-28 09:09:24', '2017-09-28 09:09:24'),
(657, 3, 2, '3', 'Logout Admin User', '::1', '2017-09-28 09:09:36', '2017-09-28 09:09:36'),
(658, 3, 1, '3', 'Login Admin User', '::1', '2017-09-28 09:09:54', '2017-09-28 09:09:54'),
(659, 3, 15, '6', 'Add Admin Module::6', '::1', '2017-09-28 09:44:13', '2017-09-28 09:44:13'),
(660, 3, 11, '52', 'Add Admin Models Page ::52', '::1', '2017-09-28 10:16:46', '2017-09-28 10:16:46'),
(661, 3, 2, '3', 'Logout Admin User', '::1', '2017-09-28 10:16:53', '2017-09-28 10:16:53'),
(662, 1, 1, '1', 'Login Admin User', '::1', '2017-09-28 10:16:58', '2017-09-28 10:16:58'),
(663, 1, 14, '1', 'Update Rights ::1', '::1', '2017-09-28 10:17:18', '2017-09-28 10:17:18'),
(664, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-28 10:17:23', '2017-09-28 10:17:23'),
(665, 1, 1, '1', 'Login Admin User', '::1', '2017-09-28 10:17:27', '2017-09-28 10:17:27'),
(666, 1, 16, '6', 'Edit Admin Module::6', '::1', '2017-09-28 10:17:46', '2017-09-28 10:17:46'),
(667, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-28 10:17:53', '2017-09-28 10:17:53'),
(668, 1, 1, '1', 'Login Admin User', '::1', '2017-09-28 10:17:57', '2017-09-28 10:17:57'),
(669, 1, 16, '6', 'Edit Admin Module::6', '::1', '2017-09-28 10:26:31', '2017-09-28 10:26:31'),
(670, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-28 10:26:33', '2017-09-28 10:26:33'),
(671, 1, 1, '1', 'Login Admin User', '::1', '2017-09-28 10:26:38', '2017-09-28 10:26:38'),
(672, 1, 11, '53', 'Add Admin Models Page ::53', '::1', '2017-09-28 10:36:38', '2017-09-28 10:36:38'),
(673, 1, 11, '54', 'Add Admin Models Page ::54', '::1', '2017-09-28 10:37:03', '2017-09-28 10:37:03'),
(674, 1, 11, '55', 'Add Admin Models Page ::55', '::1', '2017-09-28 10:37:29', '2017-09-28 10:37:29'),
(675, 1, 5, '41', 'Add Admin Action::41', '::1', '2017-09-28 10:37:47', '2017-09-28 10:37:47'),
(676, 1, 6, '41', 'Edit Admin Action::41', '::1', '2017-09-28 10:37:58', '2017-09-28 10:37:58'),
(677, 1, 5, '42', 'Add Admin Action::42', '::1', '2017-09-28 10:38:08', '2017-09-28 10:38:08'),
(678, 1, 6, '42', 'Edit Admin Action::42', '::1', '2017-09-28 10:38:15', '2017-09-28 10:38:15'),
(679, 1, 5, '43', 'Add Admin Action::43', '::1', '2017-09-28 10:38:33', '2017-09-28 10:38:33'),
(680, 1, 6, '43', 'Edit Admin Action::43', '::1', '2017-09-28 10:38:40', '2017-09-28 10:38:40'),
(681, 1, 14, '1', 'Update Rights ::1', '::1', '2017-09-28 10:39:00', '2017-09-28 10:39:00'),
(682, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-28 10:39:03', '2017-09-28 10:39:03'),
(683, 1, 1, '1', 'Login Admin User', '::1', '2017-09-28 10:39:06', '2017-09-28 10:39:06'),
(684, 1, 18, '1', 'Add CMS ::1', '::1', '2017-09-28 10:52:32', '2017-09-28 10:52:32'),
(685, 1, 19, '1', 'Edit Country::1', '::1', '2017-09-28 10:56:57', '2017-09-28 10:56:57'),
(686, 1, 20, '1', 'Delete Country::1', '::1', '2017-09-28 10:57:05', '2017-09-28 10:57:05'),
(687, 1, 40, '2', 'Add CMS ::2', '::1', '2017-09-28 10:58:59', '2017-09-28 10:58:59'),
(688, 1, 41, '2', 'Edit CMS::2', '::1', '2017-09-28 10:59:06', '2017-09-28 10:59:06'),
(689, 1, 16, '4', 'Edit Admin Module::4', '::1', '2017-09-28 11:47:07', '2017-09-28 11:47:07'),
(690, 1, 16, '6', 'Edit Admin Module::6', '::1', '2017-09-28 11:47:43', '2017-09-28 11:47:43'),
(691, 1, 16, '5', 'Edit Admin Module::5', '::1', '2017-09-28 11:48:07', '2017-09-28 11:48:07'),
(692, 1, 16, '6', 'Edit Admin Module::6', '::1', '2017-09-28 11:48:22', '2017-09-28 11:48:22'),
(693, 1, 16, '4', 'Edit Admin Module::4', '::1', '2017-09-28 11:49:03', '2017-09-28 11:49:03'),
(694, 1, 16, '5', 'Edit Admin Module::5', '::1', '2017-09-28 11:49:30', '2017-09-28 11:49:30'),
(695, 1, 16, '2', 'Edit Admin Module::2', '::1', '2017-09-28 11:49:48', '2017-09-28 11:49:48'),
(696, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-28 11:50:10', '2017-09-28 11:50:10'),
(697, 1, 1, '1', 'Login Admin User', '::1', '2017-09-28 11:50:16', '2017-09-28 11:50:16'),
(698, 1, 16, '4', 'Edit Admin Module::4', '::1', '2017-09-28 11:50:35', '2017-09-28 11:50:35'),
(699, 1, 16, '2', 'Edit Admin Module::2', '::1', '2017-09-28 11:50:46', '2017-09-28 11:50:46'),
(700, 1, 2, '1', 'Logout Admin User', '::1', '2017-09-28 11:50:51', '2017-09-28 11:50:51'),
(701, 1, 1, '1', 'Login Admin User', '::1', '2017-09-28 11:50:56', '2017-09-28 11:50:56');

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
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `user_type_id`, `name`, `email`, `password`, `status`, `last_login_at`, `remember_token`, `slug`, `created_at`, `updated_at`, `phone`) VALUES
(1, 1, 'Admin', 'admin@gmail.com', '$2y$10$GArb12qvi/byOeYWo2yRzehHkKHJ8bTh7hWA9Ga/MKu01f6e3lb5G', 1, '2017-09-28 06:20:56', 'lMuTadVYV9uYw7wZy5b8nszqrsaPwamzujjfgvvVHv4d1f4WKhkvRqBQvO5H', NULL, '2016-12-11 10:31:25', '2017-09-28 06:20:56', '1234567890'),
(2, 1, 'Rinkal', 'rinkal@gmail.com', '$2y$10$ETAmrgTyObz8dhCmsSbJuuHq1sEcJP288esOC0R3IUyIB6oLaVgBy', 1, '2017-09-28 09:08:48', 'YMBqeD2VrIne3Vtnr2BdoJrB6ZXZXR1jtkD5zU5GeeUG01pmLzGUvkstr4pR', NULL, '2017-09-28 00:45:58', '2017-09-28 03:37:48', NULL),
(3, 1, 'test', 'test@gmail.com', '$2y$10$mz.9LOorarHonhn7twLPzOGltv5f2r/m/Qll3mjH.xomFJ0sQAEA2', 1, '2017-09-28 10:16:53', 'fwaHx33PB459US5MR7YPVVf54XGyQgxYL3LCyAlCiuBecxn1oiJAwNgZb0rD', NULL, '2017-09-28 03:38:42', '2017-09-28 03:39:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_rights`
--

CREATE TABLE `admin_user_rights` (
  `user_type_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_user_rights`
--

INSERT INTO `admin_user_rights` (`user_type_id`, `page_id`) VALUES
(1, 21),
(1, 47),
(1, 48),
(1, 49),
(1, 50),
(1, 51),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(1, 45),
(1, 46),
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 23),
(1, 27),
(1, 31),
(1, 24),
(1, 25),
(1, 26),
(1, 28),
(1, 29),
(1, 30),
(1, 32),
(1, 33),
(1, 34),
(1, 5),
(1, 9),
(1, 22),
(1, 6),
(1, 7),
(1, 8),
(1, 10),
(1, 11),
(1, 12),
(1, 52),
(1, 53),
(1, 54),
(1, 55);

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
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `slug`, `title`, `status`, `created_at`, `updated_at`) VALUES
(2, 'test', 'Test', 1, '2017-09-27 05:30:26', '2017-09-27 05:30:26'),
(3, 'admin', 'Admin', 1, '2017-09-28 00:49:26', '2017-09-28 00:49:26');

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `blog_posts`
--

INSERT INTO `blog_posts` (`id`, `slug`, `title`, `short_description`, `content`, `category_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'test', 'TEST', 'TEST.........................', 'TEST.........................', 2, 1, '2017-09-27 06:11:18', '2017-09-27 06:22:21', '2017-09-27 06:22:21'),
(3, 'test1111111', 'TEST1111111', 'TEST..........111111111', 'TESST...............111111111', 2, 1, '2017-09-27 07:24:20', '2017-09-27 07:24:20', NULL),
(6, 'testssssssssssssssss', 'testssssssssssssssss', 'Fsdfssssssssdf', 'dggggggggggggggggggf', 3, 0, '2017-09-28 01:03:31', '2017-09-28 01:03:54', '2017-09-28 01:03:54');

-- --------------------------------------------------------

--
-- Table structure for table `blog_tags`
--

CREATE TABLE `blog_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `blog_tags`
--

INSERT INTO `blog_tags` (`id`, `slug`, `title`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', 'admin', 1, '2017-09-27 04:29:50', '2017-09-27 04:29:50', NULL),
(2, 'test', 'Test', 0, '2017-09-28 01:02:27', '2017-09-28 01:02:38', '2017-09-28 01:02:38');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(10) UNSIGNED NOT NULL,
  `state_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_pages`
--

CREATE TABLE `cms_pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `page_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cms_pages`
--

INSERT INTO `cms_pages` (`id`, `title`, `page_title`, `meta_title`, `meta_description`, `short_description`, `description`, `slug`, `created_at`, `updated_at`) VALUES
(2, 'test', 'test', 'test`', 'test', 'test', 'test', 'test', '2017-09-28 05:28:59', '2017-09-28 05:28:59');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'India', '2017-09-13 18:30:00', '2017-09-13 18:30:00'),
(2, 'Australia', '2017-09-13 18:30:00', '2017-09-27 23:36:48'),
(12, 'China', '2017-09-15 03:34:24', '2017-09-15 03:34:24'),
(13, 'Japan', '2017-09-15 03:35:37', '2017-09-15 03:35:37'),
(14, 'Kenya', '2017-09-15 03:37:22', '2017-09-15 03:37:22'),
(15, 'Newzelend', '2017-09-15 03:37:52', '2017-09-27 23:37:07'),
(16, 'Nepal ', '2017-09-15 03:38:58', '2017-09-15 03:39:16'),
(17, 'Englend', '2017-09-27 23:37:18', '2017-09-27 23:37:18');

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
(18, '2017_08_20_125645_alter_admin_users', 2),
(19, '2017_09_14_102319_Create_Countries_table', 3),
(20, '2017_09_14_102358_Create_States_table', 3),
(21, '2017_09_14_102513_Create_Cities_table', 3),
(22, '2017_09_14_102916_add_foreign_key_to__Cities_table', 3),
(23, '2017_09_14_102939_add_foreign_key_to__States_table', 3),
(24, '2017_09_27_085639_create_blog_category', 4),
(25, '2017_09_27_085706_create_blog_tag', 4),
(26, '2017_09_27_085851_create_blog_post', 4),
(27, '2017_09_28_095548_create_cms_page', 5);

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
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `country_id`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 'Goa', '2017-09-13 18:30:00', '2017-09-13 18:30:00'),
(2, 2, 'South Australia', '2017-09-13 18:30:00', '2017-09-13 18:30:00'),
(3, 1, 'Delhi', '2017-09-15 01:11:14', '2017-09-15 01:20:14'),
(15, 1, 'test', '2017-09-15 03:23:49', '2017-09-15 03:23:49'),
(18, 1, 'Assam', '2017-09-15 03:40:10', '2017-09-15 03:49:34'),
(21, 1, 'Kerala', '2017-09-15 04:03:02', '2017-09-15 04:03:02'),
(27, 1, 'Gujarat', '2017-09-16 03:20:23', '2017-09-16 03:20:23'),
(28, 1, 'Rajasthan', '2017-09-16 03:20:43', '2017-09-16 03:20:43'),
(29, 2, 'Alaska', '2017-09-16 03:23:40', '2017-09-16 03:23:40'),
(30, 17, 'London', '2017-09-27 23:37:52', '2017-09-27 23:37:52');

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
(4, NULL, 'kishan', 'lashkari', NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-28 06:17:20', 'pending', 'kishan.yugtia@gmail.com', '$2y$10$iNBXlVEv5XKPbLcP.MqpFeUprDDAKMxU2ElF1m7w62kWj5PBgmV16', NULL, 'kishan-lashkari', '2017-01-13 07:51:54', '2017-09-28 00:47:20');

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
(1, 'Login', 'Login'),
(9, 'Test', '');

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
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_categories_slug_unique` (`slug`),
  ADD UNIQUE KEY `blog_categories_title_unique` (`title`);

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_posts_slug_unique` (`slug`),
  ADD KEY `blog_posts_category_id_foreign` (`category_id`);

--
-- Indexes for table `blog_tags`
--
ALTER TABLE `blog_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_tags_slug_unique` (`slug`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_state_id_foreign` (`state_id`);

--
-- Indexes for table `cms_pages`
--
ALTER TABLE `cms_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slug` (`slug`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
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
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `states_country_id_foreign` (`country_id`);

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
  MODIFY `id` bigint(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `admin_groups`
--
ALTER TABLE `admin_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `admin_group_pages`
--
ALTER TABLE `admin_group_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `admin_logs`
--
ALTER TABLE `admin_logs`
  MODIFY `id` int(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=702;
--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `admin_user_types`
--
ALTER TABLE `admin_user_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `blog_tags`
--
ALTER TABLE `blog_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cms_pages`
--
ALTER TABLE `cms_pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user_actions`
--
ALTER TABLE `user_actions`
  MODIFY `id` bigint(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
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

--
-- Constraints for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD CONSTRAINT `blog_posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `blog_categories` (`id`);

--
-- Constraints for table `states`
--
ALTER TABLE `states`
  ADD CONSTRAINT `states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
