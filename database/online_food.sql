-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 28, 2020 at 03:08 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_food`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `username`, `password`, `email`, `photo`) VALUES
(1, 'Admin', 'shadab', 'admin', 'admin@gmail.com', 'khan-shadab_1594910437.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `heading` varchar(500) NOT NULL,
  `sub_heading` varchar(500) NOT NULL,
  `link` varchar(100) NOT NULL,
  `link_txt` varchar(100) NOT NULL,
  `order_number` int(11) NOT NULL,
  `added_on` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `image`, `heading`, `sub_heading`, `link`, `link_txt`, `order_number`, `added_on`, `status`) VALUES
(1, '533799913_banner-4.jpg', 'Drink & Heathy Food', 'Fresh Heathy and Organic', 'shop', 'Order Now', 1, '2020-06-23 03:00:05', 1),
(2, '546847873_banner-4.jpg', 'Drink & Heathy Food', 'Fresh Heathy and Organic', 'shop', 'Order Now', 1, '2020-06-23 03:06:53', 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `order_number` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category`, `order_number`, `status`, `added_on`) VALUES
(1, 'Chaat & Snacks', 1121, 1, '2020-06-16 12:06:33'),
(2, 'Chinese', 2, 1, '2020-06-16 12:06:41'),
(4, 'Desserts', 4, 1, '2020-06-16 12:07:18'),
(5, 'Murg', 11, 1, '2020-06-27 12:49:37'),
(7, 'Shadab', 255, 1, '2020-07-28 05:12:53');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `mobile`, `subject`, `message`, `added_on`) VALUES
(3, 'khan shadab', 'ks615044@gmail.com', '9167263576', 'sas', 'sa', '2020-07-24 06:38:22');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_code`
--

CREATE TABLE `coupon_code` (
  `id` int(11) NOT NULL,
  `coupon_code` varchar(20) NOT NULL,
  `coupon_type` enum('P','F') NOT NULL,
  `coupon_value` int(11) NOT NULL,
  `cart_min_value` int(11) NOT NULL,
  `expired_on` date NOT NULL,
  `status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coupon_code`
--

INSERT INTO `coupon_code` (`id`, `coupon_code`, `coupon_type`, `coupon_value`, `cart_min_value`, `expired_on`, `status`, `added_on`) VALUES
(1, 'FIRST50', 'P', 10, 50, '2020-08-20', 1, '2020-06-20 05:31:03');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boy`
--

CREATE TABLE `delivery_boy` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `delivery_boy`
--

INSERT INTO `delivery_boy` (`id`, `name`, `mobile`, `password`, `status`, `added_on`) VALUES
(3, 'khan shadab', '9167263576', '$2y$10$lajrzj0UxkvQhEm2AEikReg4/RR5YV/yIvRLbXs/VD3', 1, '2020-07-24 12:04:31'),
(8, 'khan shadab', '7021918970', '', 1, '2020-07-28 06:29:27');

-- --------------------------------------------------------

--
-- Table structure for table `dish`
--

CREATE TABLE `dish` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `dish` varchar(100) NOT NULL,
  `dish_detail` text NOT NULL,
  `image` varchar(100) NOT NULL,
  `type` enum('veg','non-veg') NOT NULL,
  `status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dish`
--

INSERT INTO `dish` (`id`, `category_id`, `dish`, `dish_detail`, `image`, `type`, `status`, `added_on`) VALUES
(1, 4, 'Gulab Jamun', 'Gulab Jamun', '977945963_862169053_gulab-jamun.jpg', 'veg', 1, '2020-06-17 10:43:59'),
(3, 2, 'Chow mein', 'Chow mein', '836724175_Chowmein.jpg', 'non-veg', 1, '2020-06-17 10:47:26'),
(4, 5, 'Butter Chicken', 'Butter chicken or murg makhani is a dish, originating in the Indian subcontinent, of chicken in a mildly spiced tomato sauce.', '348714192_30-Minute-Instant-Pot-Butter-Chicken-7.jpg', 'non-veg', 1, '2020-06-27 12:50:50');

-- --------------------------------------------------------

--
-- Table structure for table `dish_cart`
--

CREATE TABLE `dish_cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `dish_detail_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dish_cart`
--

INSERT INTO `dish_cart` (`id`, `user_id`, `dish_detail_id`, `qty`, `added_on`) VALUES
(10, 15, 8, 15, '2020-07-28 03:53:33'),
(11, 15, 6, 10, '2020-07-28 03:53:33');

-- --------------------------------------------------------

--
-- Table structure for table `dish_details`
--

CREATE TABLE `dish_details` (
  `id` int(11) NOT NULL,
  `dish_id` int(11) NOT NULL,
  `attribute` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dish_details`
--

INSERT INTO `dish_details` (`id`, `dish_id`, `attribute`, `price`, `status`, `added_on`) VALUES
(1, 3, 'Full', 300, 1, '2020-06-19 10:25:47'),
(2, 3, 'Half', 170, 1, '2020-06-19 10:49:45'),
(6, 1, 'Per Piece', 40, 1, '2020-06-20 00:00:00'),
(8, 4, 'Half', 250, 1, '2020-06-27 12:50:50'),
(11, 5, 'Test1', 100, 1, '2020-07-06 12:00:24'),
(12, 5, 'Test2', 200, 0, '2020-07-06 12:00:24'),
(13, 6, 'sasa', 2121, 0, '2020-07-21 02:42:14'),
(14, 7, 'asas', 100, 1, '2020-07-21 02:45:03'),
(15, 7, 'sasas', 1212, 1, '2020-07-21 02:45:03'),
(16, 4, 'Full', 350, 1, '2020-07-28 04:58:06');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `dish_details_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `dish_details_id`, `price`, `qty`) VALUES
(1, 1, 8, 250, 15),
(2, 2, 2, 170, 5),
(3, 3, 1, 300, 20),
(4, 3, 6, 40, 20),
(5, 4, 8, 250, 15),
(6, 4, 6, 40, 10),
(7, 5, 8, 250, 15),
(8, 5, 6, 40, 10),
(9, 5, 2, 170, 4);

-- --------------------------------------------------------

--
-- Table structure for table `order_master`
--

CREATE TABLE `order_master` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `total_price` float NOT NULL,
  `coupon_code` varchar(20) NOT NULL,
  `final_price` float NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `delivery_boy_id` int(11) NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `payment_type` varchar(10) NOT NULL,
  `payment_id` varchar(100) NOT NULL,
  `order_status` int(11) NOT NULL,
  `cancel_by` enum('user','admin') NOT NULL,
  `cancel_at` datetime NOT NULL,
  `added_on` datetime NOT NULL,
  `delivered_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_master`
--

INSERT INTO `order_master` (`id`, `user_id`, `name`, `email`, `mobile`, `address`, `total_price`, `coupon_code`, `final_price`, `zipcode`, `delivery_boy_id`, `payment_status`, `payment_type`, `payment_id`, `order_status`, `cancel_by`, `cancel_at`, `added_on`, `delivered_on`) VALUES
(1, 3, 'Khan Shadab', 'ks615044@gmail.com', '9167263576', 'sayeed manzil12111', 3750, '', 3750, '400613', 3, 'success', 'cod', '', 4, 'admin', '2020-07-28 12:54:59', '2020-07-28 11:36:49', '2020-07-28 12:01:39'),
(2, 14, 'Khan Shadab', 'ks615044@gmail.com', '9167263576', 'sayeed manzil12111', 850, 'FIRST50', 765, '400613', 3, 'success', 'cod', '20200728111212800110168586001730422', 4, 'user', '0000-00-00 00:00:00', '2020-07-28 11:37:56', '2020-07-28 12:03:56'),
(3, 14, 'Khan Shadab', 'ks615044@gmail.com', '9167263576', 'sayeed manzil12111', 6800, 'FIRST50', 6120, '400613', 0, 'success', 'wallet', '', 1, 'user', '0000-00-00 00:00:00', '2020-07-28 11:51:51', '2020-08-02 00:00:00'),
(4, 14, 'Khan Shadab', 'ks615044@gmail.com', '9167263576', 'sayeed manzil12111', 4150, 'FIRST50', 3735, '400613', 3, 'success', 'paytm', '20200728111212800110168801301760265', 4, 'user', '0000-00-00 00:00:00', '2020-07-28 01:09:11', '2020-07-28 01:32:00'),
(5, 14, 'Khan Shadab', 'ks615044@gmail.com', '9167263576', 'sayeed manzil12111', 4830, '', 4830, '400613', 3, 'success', 'cod', '', 5, 'admin', '2020-07-28 01:58:03', '2020-07-28 01:36:01', '2020-07-28 13:56:24');

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `order_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `order_status`) VALUES
(1, 'Order Approved By Admin'),
(2, 'Cooking'),
(3, 'On the Way'),
(4, 'Delivered'),
(5, 'Canceled'),
(6, 'Out for Delivery'),
(7, 'Dispatched'),
(9, 'Shipped');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `dish_detail_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`id`, `user_id`, `order_id`, `dish_detail_id`, `rating`) VALUES
(1, 1, 6, 1, 5),
(2, 4, 4, 2, 1),
(3, 4, 4, 1, 3),
(4, 4, 3, 6, 5),
(5, 4, 7, 14, 5),
(6, 4, 10, 9, 4),
(7, 4, 3, 2, 5),
(8, 4, 5, 6, 5),
(9, 4, 5, 6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `cart_min_price` int(11) NOT NULL,
  `cart_min_price_msg` varchar(250) NOT NULL,
  `website_close` int(11) NOT NULL,
  `wallet_amt` int(11) NOT NULL,
  `website_close_msg` varchar(250) NOT NULL,
  `referral_amt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `cart_min_price`, `cart_min_price_msg`, `website_close`, `wallet_amt`, `website_close_msg`, `referral_amt`) VALUES
(1, 300, 'Cart min price will be 50 rs', 0, 100, 'Today will close', 200);

-- --------------------------------------------------------

--
-- Table structure for table `track_details`
--

CREATE TABLE `track_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `message` varchar(33) NOT NULL,
  `delay_msg` varchar(255) NOT NULL,
  `arrived_at` varchar(255) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `track_details`
--

INSERT INTO `track_details` (`id`, `user_id`, `order_id`, `message`, `delay_msg`, `arrived_at`, `added_on`) VALUES
(25, 3, 5, '1', '', '', '2020-07-28 13:57:27'),
(26, 3, 5, '2', '', '', '2020-07-28 13:57:47'),
(27, 3, 5, '5', '', '', '2020-07-28 13:58:03'),
(28, 3, 1, '1', '', 'South india, post office', '2020-07-28 05:26:22'),
(29, 3, 1, '2', '', 'Dubai Dhaba, Kausa', '2020-07-28 05:28:20'),
(30, 3, 1, '3', '', '', '2020-07-28 17:28:59'),
(31, 3, 1, '', 'Soory, bro your order will not deliver today', '', '2020-07-28 17:31:01'),
(32, 14, 5, '', 'Sorry, We will arrive at 10 pm', '', '2020-07-28 18:21:06'),
(33, 3, 1, '9', '', 'Mumbai', '2020-07-28 18:26:37'),
(34, 3, 1, '', 'Help', '', '2020-07-28 18:26:46'),
(35, 3, 1, '6', '', '', '2020-07-28 18:26:59'),
(36, 3, 1, '4', '', '', '2020-07-28 18:27:12');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `user_photo` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `email_verify` int(11) NOT NULL,
  `rand_str` varchar(20) NOT NULL,
  `referral_code` varchar(20) NOT NULL,
  `from_referral_code` varchar(20) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `user_photo`, `email`, `mobile`, `password`, `status`, `email_verify`, `rand_str`, `referral_code`, `from_referral_code`, `added_on`) VALUES
(15, 'Khan Shadab', '', 'ks615044@gmail.com', '9167263576', '$2y$10$utW1wx0NfEpfAM4TD02HveR66eofD.L.2OCLEpf3bvx/QsQMHzDVy', 0, 1, 'qoisbdtbcxmwtkh', 'tbtbdizzcnkjlcx', '', '2020-07-27 17:30:47');

-- --------------------------------------------------------

--
-- Table structure for table `wallet`
--

CREATE TABLE `wallet` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amt` int(11) NOT NULL,
  `msg` varchar(500) NOT NULL,
  `type` enum('in','out') NOT NULL,
  `payment_id` varchar(50) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wallet`
--

INSERT INTO `wallet` (`id`, `user_id`, `amt`, `msg`, `type`, `payment_id`, `added_on`) VALUES
(2, 4, 50, 'Registration', 'in', '', '2020-07-18 05:11:38'),
(4, 2, 50, 'Shoping', 'out', '', '0000-00-00 00:00:00'),
(5, 2, 100, 'Added', 'in', '', '0000-00-00 00:00:00'),
(7, 2, 100, 'Added', 'in', '', '2020-07-18 05:58:29'),
(8, 2, 20, 'Added', 'in', '', '2020-07-18 05:59:02'),
(9, 2, 15, 'Added', 'in', '', '2020-07-18 06:00:35'),
(10, 2, 30, 'Added', 'in', '', '2020-07-18 06:01:17'),
(11, 2, 10, 'Added', 'in', '20200718111212800110168602301710786', '2020-07-18 06:04:04'),
(13, 4, 160, 'Order Id-2', 'out', '', '2020-07-18 06:09:59'),
(14, 4, 800, 'Added', 'in', '20200718111212800110168644701732407', '2020-07-18 06:17:19'),
(15, 3, 0, 'Register', 'in', '', '2020-07-18 08:00:53'),
(16, 4, 200, 'Order Id-3', 'out', '', '2020-07-19 04:29:04'),
(17, 4, 200, 'Order Id-4', 'out', '', '2020-07-19 04:30:51'),
(18, 3, 100, 'Test msg', 'in', '', '2020-07-21 08:22:33'),
(19, 4, 200, 'Test Msg', 'in', '', '2020-07-21 08:22:46'),
(20, 4, 170, 'Order Id-6', 'out', '', '2020-07-21 12:49:01'),
(21, 4, 121, 'a', 'in', '', '2020-07-21 03:01:59'),
(22, 4, 4000, '', 'in', '', '2020-07-21 03:02:11'),
(23, 4, 2, '', 'in', '', '2020-07-21 03:02:28'),
(24, 4, 1900, 'Order Id-7', 'out', '', '2020-07-23 08:49:04'),
(25, 9, 100, 'Register', 'in', '', '2020-07-08 10:58:23'),
(26, 9, 100, 'Register', 'in', '', '2020-07-08 10:58:26'),
(27, 9, 100, 'Register', 'in', '', '2020-07-08 10:58:34'),
(28, 9, 100, 'Register', 'in', '', '2020-07-08 10:58:35'),
(29, 9, 100, 'Register', 'in', '', '2020-07-08 10:58:37'),
(30, 9, 100, 'Register', 'in', '', '2020-07-08 10:59:44'),
(31, 9, 100, 'Register', 'in', '', '2020-07-08 10:59:49'),
(32, 9, 100, 'Register', 'in', '', '2020-07-08 10:59:50'),
(33, 9, 100, 'Register', 'in', '', '2020-07-08 10:59:50'),
(34, 9, 100, 'Register', 'in', '', '2020-07-08 11:00:10'),
(35, 9, 100, 'Register', 'in', '', '2020-07-08 11:00:11'),
(36, 9, 100, 'Register', 'in', '', '2020-07-08 11:00:52'),
(37, 9, 100, 'Register', 'in', '', '2020-07-08 11:03:03'),
(38, 9, 100, 'Register', 'in', '', '2020-07-08 11:04:06'),
(39, 9, 100, 'Register', 'in', '', '2020-07-08 11:08:42'),
(40, 5, 100, 'Register', 'in', '', '2020-07-08 11:13:40'),
(41, 6, 100, 'Register', 'in', '', '2020-07-08 11:15:11'),
(42, 7, 100, 'Register', 'in', '', '2020-07-08 11:15:34'),
(43, 8, 100, 'Register', 'in', '', '2020-07-08 11:17:51'),
(44, 9, 100, 'Register', 'in', '', '2020-07-08 11:18:37'),
(45, 10, 100, 'Register', 'in', '', '2020-07-08 11:25:08'),
(46, 11, 100, 'Register', 'in', '', '2020-07-24 11:58:45'),
(47, 12, 100, 'Register', 'in', '', '2020-07-24 12:01:42'),
(48, 4, 50, 'Referral Amt from skshadabkhojo@gmail.com', 'in', '', '2020-07-24 12:01:58'),
(49, 4, 738, 'Order Id-10', 'out', '', '2020-07-24 01:09:27'),
(50, 4, 120, 'Added', 'in', '20200724111212800110168080602797060', '2020-07-24 02:27:44'),
(51, 12, 200, 'For expensive buying product', 'in', '', '2020-07-24 05:27:24'),
(52, 4, 6000, 'Biggest Referaal Earning', 'in', '', '2020-07-24 05:27:47'),
(53, 4, 200, 'Added', 'in', '20200724111212800110168826401749831', '2020-07-24 05:38:19'),
(54, 4, 6125, 'Added', 'in', '20200724111212800110168255201742435', '2020-07-24 05:39:04'),
(55, 4, 720, 'Order Id-2', 'out', '', '2020-07-24 06:18:44'),
(56, 4, 1360, 'Order Id-3', 'out', '', '2020-07-24 06:24:44'),
(57, 4, 900, 'Order Id-4', 'out', '', '2020-07-24 07:58:36'),
(58, 4, 20000, 'Added', 'in', '20200724111212800110168718001733683', '2020-07-24 08:02:09'),
(59, 2, 100, 'Referral Amt from ks615044@gmail.com', 'in', '', '2020-07-24 08:29:08'),
(60, 12, 20, 'For expensive buying product', 'in', '', '2020-07-25 02:52:05'),
(61, 2, 100, 'Referral Amt from ks615044@gmail.com', 'in', '', '2020-07-25 03:51:32'),
(62, 4, 684, 'Order Id-5', 'out', '', '2020-07-25 04:15:01'),
(63, 2, 100, 'Referral Amt from ks615044@gmail.com', 'in', '', '2020-07-25 04:18:02'),
(64, 2, 100, 'Referral Amt from ks615044@gmail.com', 'in', '', '2020-07-25 04:18:34'),
(65, 2, 100, 'Referral Amt from ks615044@gmail.com', 'in', '', '2020-07-25 04:20:33'),
(66, 2, 100, 'Referral Amt from ks615044@gmail.com', 'in', '', '2020-07-25 04:23:56'),
(67, 4, 11484, 'Order Id-6', 'out', '', '2020-07-25 04:32:28'),
(68, 4, 540, 'Order Id-11', 'out', '', '2020-07-27 01:11:50'),
(69, 4, 680, 'Order Id-12', 'out', '', '2020-07-27 01:21:54'),
(70, 13, 100, 'Register', 'in', '', '2020-07-27 01:37:07'),
(71, 14, 100, 'Register', 'in', '', '2020-07-27 01:51:11'),
(72, 15, 100, 'Register', 'in', '', '2020-07-27 05:30:48'),
(73, 16, 100, 'Register', 'in', '', '2020-07-27 06:20:46'),
(74, 3, 10000, 'Added', 'in', '20200728111212800110168358601761516', '2020-07-28 11:51:05'),
(75, 3, 6120, 'Order Id-3', 'out', '', '2020-07-28 11:51:52'),
(76, 4, 500000, '', 'in', '', '2020-07-28 02:34:43'),
(77, 12, 2147483647, 'For expensive buying product', 'in', '', '2020-07-28 02:46:53'),
(78, 15, 200, '', 'in', '', '2020-07-28 03:51:55'),
(79, 15, 4000, 'For You', 'in', '', '2020-07-28 03:52:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_code`
--
ALTER TABLE `coupon_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_boy`
--
ALTER TABLE `delivery_boy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dish`
--
ALTER TABLE `dish`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dish_cart`
--
ALTER TABLE `dish_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dish_details`
--
ALTER TABLE `dish_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_master`
--
ALTER TABLE `order_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `track_details`
--
ALTER TABLE `track_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `coupon_code`
--
ALTER TABLE `coupon_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `delivery_boy`
--
ALTER TABLE `delivery_boy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `dish`
--
ALTER TABLE `dish`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `dish_cart`
--
ALTER TABLE `dish_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `dish_details`
--
ALTER TABLE `dish_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order_master`
--
ALTER TABLE `order_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `track_details`
--
ALTER TABLE `track_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `wallet`
--
ALTER TABLE `wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
