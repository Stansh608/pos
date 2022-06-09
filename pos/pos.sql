-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2022 at 09:05 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_us`
--

CREATE TABLE `about_us` (
  `about_id` int(10) NOT NULL,
  `about_heading` text NOT NULL,
  `about_short_desc` text NOT NULL,
  `about_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `about_us`
--

INSERT INTO `about_us` (`about_id`, `about_heading`, `about_short_desc`, `about_desc`) VALUES
(1, 'About Us - Our Story', 'hey', 'dkfjoh');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_pass` varchar(255) NOT NULL,
  `admin_image` text NOT NULL,
  `admin_contact` varchar(255) NOT NULL,
  `admin_country` text NOT NULL,
  `admin_job` varchar(255) NOT NULL,
  `admin_about` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `admin_name`, `admin_email`, `admin_pass`, `admin_image`, `admin_contact`, `admin_country`, `admin_job`, `admin_about`) VALUES
(3, 'Star', 'stan@stan.com', '1234', 'IMG_20211229_084842_064.jpg', '0798602758', 'Kenya', 'Developer', ' I love Coding');

-- --------------------------------------------------------

--
-- Table structure for table `bundle_product_relation`
--

CREATE TABLE `bundle_product_relation` (
  `rel_id` int(10) NOT NULL,
  `rel_title` varchar(255) NOT NULL,
  `product_id` int(10) NOT NULL,
  `bundle_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(255) NOT NULL,
  `qty` int(10) NOT NULL,
  `p_price` varchar(255) NOT NULL,
  `size` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`p_id`, `ip_add`, `qty`, `p_price`, `size`) VALUES
(7, '::1', 0, '150', 'Select a Size'),
(11, '::1', 1, '200', 'Small'),
(16, '::1', 0, '', 'Select a Size'),
(17, '::1', 0, '500', 'Select a Size');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(10) NOT NULL,
  `cat_title` text NOT NULL,
  `cat_top` text NOT NULL,
  `cat_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`, `cat_top`, `cat_image`) VALUES
(6, 'Men Collection', 'yes', 'mens-coll-logo.jpg'),
(7, 'Women Collections', 'yes', 'women-coll-logo.jpg'),
(8, 'Baby Skin Care', 'yes', 'baby-cosmetics-logo.jpg'),
(9, 'mens cologne', 'no', 'mens-coll-logo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `contact_id` int(10) NOT NULL,
  `contact_email` text NOT NULL,
  `contact_heading` text NOT NULL,
  `contact_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`contact_id`, `contact_email`, `contact_heading`, `contact_desc`) VALUES
(1, 'kutusdevs@gmail.com', 'Contact  Us', 'If you have any questions, please feel free to contact us, our customer service agents are always available.');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `coupon_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `coupon_title` varchar(255) NOT NULL,
  `coupon_price` varchar(255) NOT NULL,
  `coupon_code` varchar(255) NOT NULL,
  `coupon_limit` int(100) NOT NULL,
  `coupon_used` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`coupon_id`, `product_id`, `coupon_title`, `coupon_price`, `coupon_code`, `coupon_limit`, `coupon_used`) VALUES
(3, 9, 'Remind T-shirt', '40', '333444', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(10) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_pass` varchar(255) NOT NULL,
  `customer_country` text NOT NULL,
  `customer_city` text NOT NULL,
  `customer_contact` varchar(255) NOT NULL,
  `customer_address` text NOT NULL,
  `customer_image` text NOT NULL,
  `customer_ip` varchar(255) NOT NULL,
  `customer_confirm_code` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_email`, `customer_pass`, `customer_country`, `customer_city`, `customer_contact`, `customer_address`, `customer_image`, `customer_ip`, `customer_confirm_code`) VALUES
(4, 'mike', 'mike@test.com', 'NO1customer', 'Kenya', 'Kerugoya', '0798602758', '1300', 'NIVEA_logo.png', '::1', '1333348450');

-- --------------------------------------------------------

--
-- Table structure for table `customer_orders`
--

CREATE TABLE `customer_orders` (
  `order_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `due_amount` int(100) NOT NULL,
  `invoice_no` int(100) NOT NULL,
  `qty` int(10) NOT NULL,
  `size` text NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_orders`
--

INSERT INTO `customer_orders` (`order_id`, `customer_id`, `due_amount`, `invoice_no`, `qty`, `size`, `order_date`, `order_status`) VALUES
(16, 2, 207, 1715523401, 3, 'Small', '2017-02-20 08:21:42', 'pending'),
(17, 2, 100, 1715523401, 2, 'Large', '2017-02-20 08:21:42', 'pending'),
(18, 2, 300, 1715523401, 1, 'Medium', '2017-02-20 08:21:42', 'pending'),
(19, 2, 150, 1068059025, 1, 'Medium', '2017-02-20 08:26:47', 'pending'),
(20, 2, 288, 909940689, 3, 'Large', '2017-02-27 11:06:32', 'complete'),
(21, 2, 400, 909940689, 2, 'Meduim', '2017-02-27 11:06:37', 'complete');

-- --------------------------------------------------------

--
-- Table structure for table `enquiry_types`
--

CREATE TABLE `enquiry_types` (
  `enquiry_id` int(10) NOT NULL,
  `enquiry_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enquiry_types`
--

INSERT INTO `enquiry_types` (`enquiry_id`, `enquiry_title`) VALUES
(1, 'Order and Delivery Support'),
(2, 'Technical Support'),
(3, 'Price Concern');

-- --------------------------------------------------------

--
-- Table structure for table `gdgg`
--

CREATE TABLE `gdgg` (
  `supplier_id` int(10) UNSIGNED NOT NULL,
  `supplier_name` varchar(255) DEFAULT NULL,
  `supplier_email` varchar(50) DEFAULT NULL,
  `supplier_phone` varchar(20) DEFAULT NULL,
  `supplier_city` varchar(50) DEFAULT NULL,
  `supplier_address` varchar(255) DEFAULT NULL,
  `product_category` varchar(50) DEFAULT NULL,
  `supplier_image` varchar(50) DEFAULT NULL,
  `supplier_status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gdgg`
--

INSERT INTO `gdgg` (`supplier_id`, `supplier_name`, `supplier_email`, `supplier_phone`, `supplier_city`, `supplier_address`, `product_category`, `supplier_image`, `supplier_status`) VALUES
(1, 'gdgg', 'djbjud@gmail.com', '0798602758', 'Kerugoya', '1300', '17', 'body-lotion-logo.png', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `munene`
--

CREATE TABLE `munene` (
  `supplier_id` int(10) UNSIGNED NOT NULL,
  `supplier_name` varchar(255) DEFAULT NULL,
  `supplier_email` varchar(50) DEFAULT NULL,
  `supplier_phone` varchar(20) DEFAULT NULL,
  `supplier_city` varchar(50) DEFAULT NULL,
  `supplier_address` varchar(255) DEFAULT NULL,
  `product_category` varchar(50) DEFAULT NULL,
  `supplier_image` varchar(50) DEFAULT NULL,
  `supplier_status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `munene`
--

INSERT INTO `munene` (`supplier_id`, `supplier_name`, `supplier_email`, `supplier_phone`, `supplier_city`, `supplier_address`, `product_category`, `supplier_image`, `supplier_status`) VALUES
(1, 'munene', 'djbjud@gmail.com', '0798602758', 'Kerugoya', '1300', 'Manicuring Preparations', 'baby-cosmetics-logo.jpg', 'yes'),
(2, NULL, NULL, NULL, NULL, NULL, 'Baby_Products', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(10) NOT NULL,
  `invoice_no` int(10) NOT NULL,
  `amount` int(10) NOT NULL,
  `payment_mode` text NOT NULL,
  `ref_no` int(10) NOT NULL,
  `code` int(10) NOT NULL,
  `payment_date` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pending_orders`
--

CREATE TABLE `pending_orders` (
  `order_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `invoice_no` int(10) NOT NULL,
  `product_id` text NOT NULL,
  `qty` int(10) NOT NULL,
  `size` text NOT NULL,
  `order_status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(10) NOT NULL,
  `product_category` varchar(255) NOT NULL,
  `product_subcat` varchar(255) NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `product_name` varchar(255) NOT NULL,
  `product_url` varchar(255) NOT NULL,
  `product_img1` text NOT NULL,
  `product_img2` text NOT NULL,
  `product_img3` text NOT NULL,
  `product_bprice` int(10) NOT NULL,
  `product_sellprice` int(100) NOT NULL,
  `product_desc` varchar(255) NOT NULL,
  `product_features` varchar(255) NOT NULL,
  `product_quantity` int(100) NOT NULL,
  `product_keywords` varchar(255) NOT NULL,
  `product_label` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_category`, `product_subcat`, `supplier_name`, `date`, `product_name`, `product_url`, `product_img1`, `product_img2`, `product_img3`, `product_bprice`, `product_sellprice`, `product_desc`, `product_features`, `product_quantity`, `product_keywords`, `product_label`) VALUES
(14, '10', '6', '10', '2022-05-31 09:31:09', 'MENS Collongne', 'lotion-1', 'mens-coll-logo.jpg', 'mens-coll-logo.jpg', 'NIVEA_logo.png', 1200, 1800, '\r\n\r\nmens collogne fresh all day.', '\r\n\r\n', 0, 'cologne', 'trending'),
(15, '10', '6', '10', '2022-05-31 09:30:22', 'Versman', 'lotion-M2', 'versman-logo.jpg', 'versman-logo.jpg', 'wholesaler 1.jpeg', 500, 600, '\r\n\r\n', '\r\n\r\n', 0, 'lotion', 'hot'),
(16, '8', '7', '8', '2022-05-31 09:49:47', 'Lip balmneuhfu', 'balm-1', 'women-coll-logo.jpg', 'baby-cosmetics-logo.jpg', 'body-lotion-logo.png', 50, 90, 'hot and new\r\n\r\n', 'perfect impression\r\nblack\r\n\r\n', 0, 'lipbalm', 'New'),
(17, '8', '7', '8', '2022-06-01 18:40:29', 'Lip balm', 'lip-10', 'body-lotion-logo.png', 'baby-cosmetics-logo.jpg', 'baby-cosmetics-logo.jpg', 500, 700, 'it is a new product in the market\r\n\r\n', '\r\n\r\n', 0, 'lip', 'New');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `p_cat_id` int(10) NOT NULL,
  `p_cat_title` text NOT NULL,
  `p_cat_top` text NOT NULL,
  `p_cat_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`p_cat_id`, `p_cat_title`, `p_cat_top`, `p_cat_image`) VALUES
(12, 'Bath Preparations', '', ''),
(13, 'Baby Products', 'yes', 'baby-cosmetics-logo.jpg'),
(14, 'Eye makeup', 'yes', ''),
(15, 'Fragrance', 'yes', ''),
(16, 'Hair Preparations', 'no', ''),
(17, 'Hair Coloring', 'yes', ''),
(18, 'Makeup Preparations', 'yes', ''),
(19, 'Manicuring Preparations', 'yes', ''),
(20, 'Oral Hygiene Products', 'no', ''),
(21, 'Personal Cleanliness', 'no', ''),
(22, 'Shaving Preparations', 'no', ''),
(23, 'Skin care preparations ', 'no', '');

-- --------------------------------------------------------

--
-- Table structure for table `ramah`
--

CREATE TABLE `ramah` (
  `supplier_id` int(10) UNSIGNED NOT NULL,
  `supplier_name` varchar(255) DEFAULT NULL,
  `supplier_email` varchar(50) DEFAULT NULL,
  `supplier_phone` varchar(20) DEFAULT NULL,
  `supplier_city` varchar(50) DEFAULT NULL,
  `supplier_address` varchar(255) DEFAULT NULL,
  `product_category` varchar(50) DEFAULT NULL,
  `supplier_image` varchar(50) DEFAULT NULL,
  `supplier_status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ramah`
--

INSERT INTO `ramah` (`supplier_id`, `supplier_name`, `supplier_email`, `supplier_phone`, `supplier_city`, `supplier_address`, `product_category`, `supplier_image`, `supplier_status`) VALUES
(1, 'Ramah', 'djbjud@gmail.com', '0798602758', 'Kerugoya', '1300', 'Hair Coloring', 'body-lotion-logo.png', 'yes'),
(2, NULL, NULL, NULL, NULL, NULL, 'Bath_Preparations', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stansh`
--

CREATE TABLE `stansh` (
  `supplier_id` int(10) UNSIGNED NOT NULL,
  `supplier_name` varchar(255) DEFAULT NULL,
  `supplier_email` varchar(50) DEFAULT NULL,
  `supplier_phone` varchar(20) DEFAULT NULL,
  `supplier_city` varchar(50) DEFAULT NULL,
  `supplier_address` varchar(255) DEFAULT NULL,
  `product_category` varchar(50) DEFAULT NULL,
  `supplier_image` varchar(50) DEFAULT NULL,
  `supplier_status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `star`
--

CREATE TABLE `star` (
  `supplier_id` int(10) DEFAULT NULL,
  `supplier_name` varchar(255) DEFAULT NULL,
  `supplier_email` varchar(255) DEFAULT NULL,
  `supplier_pass` varchar(255) DEFAULT NULL,
  `supplier_country` varchar(255) DEFAULT NULL,
  `supplier_city` varchar(255) DEFAULT NULL,
  `supplier_contact` varchar(255) DEFAULT NULL,
  `supplier_address` varchar(255) DEFAULT NULL,
  `supplier_image` varchar(255) DEFAULT NULL,
  `supplier_ip` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `starhr_green`
--

CREATE TABLE `starhr_green` (
  `supplier_id` int(10) UNSIGNED NOT NULL,
  `supplier_name` varchar(255) DEFAULT NULL,
  `supplier_email` varchar(50) DEFAULT NULL,
  `supplier_phone` varchar(20) DEFAULT NULL,
  `supplier_city` varchar(50) DEFAULT NULL,
  `supplier_address` varchar(255) DEFAULT NULL,
  `product_category` varchar(50) DEFAULT NULL,
  `supplier_image` varchar(50) DEFAULT NULL,
  `supplier_status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `starhr_green`
--

INSERT INTO `starhr_green` (`supplier_id`, `supplier_name`, `supplier_email`, `supplier_phone`, `supplier_city`, `supplier_address`, `product_category`, `supplier_image`, `supplier_status`) VALUES
(1, 'starhr_green', 'djbjud@gmail.com', '0798602758', 'Kerugoya', '1300', '19', 'body-lotion-logo.png', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `starkjg`
--

CREATE TABLE `starkjg` (
  `supplier_id` int(10) UNSIGNED NOT NULL,
  `supplier_name` varchar(255) DEFAULT NULL,
  `supplier_email` varchar(50) DEFAULT NULL,
  `supplier_phone` varchar(20) DEFAULT NULL,
  `supplier_city` varchar(50) DEFAULT NULL,
  `supplier_address` varchar(255) DEFAULT NULL,
  `product_category` varchar(50) DEFAULT NULL,
  `supplier_image` varchar(50) DEFAULT NULL,
  `supplier_status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `starreud`
--

CREATE TABLE `starreud` (
  `supplier_id` int(10) UNSIGNED NOT NULL,
  `supplier_name` varchar(255) DEFAULT NULL,
  `supplier_email` varchar(50) DEFAULT NULL,
  `supplier_phone` varchar(20) DEFAULT NULL,
  `supplier_city` varchar(50) DEFAULT NULL,
  `supplier_address` varchar(255) DEFAULT NULL,
  `product_category` varchar(50) DEFAULT NULL,
  `supplier_image` varchar(50) DEFAULT NULL,
  `supplier_status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `starreud`
--

INSERT INTO `starreud` (`supplier_id`, `supplier_name`, `supplier_email`, `supplier_phone`, `supplier_city`, `supplier_address`, `product_category`, `supplier_image`, `supplier_status`) VALUES
(1, 'starreud', 'djbjud@gmail.com', '0798602758', 'Kerugoya', '1300', 'Skin care preparations ', 'baby-cosmetics-logo.jpg', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `startt`
--

CREATE TABLE `startt` (
  `supplier_id` int(10) UNSIGNED NOT NULL,
  `supplier_name` varchar(255) DEFAULT NULL,
  `supplier_email` varchar(50) DEFAULT NULL,
  `supplier_phone` varchar(20) DEFAULT NULL,
  `supplier_city` varchar(50) DEFAULT NULL,
  `supplier_address` varchar(255) DEFAULT NULL,
  `product_category` varchar(50) DEFAULT NULL,
  `supplier_image` varchar(50) DEFAULT NULL,
  `supplier_status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `startt`
--

INSERT INTO `startt` (`supplier_id`, `supplier_name`, `supplier_email`, `supplier_phone`, `supplier_city`, `supplier_address`, `product_category`, `supplier_image`, `supplier_status`) VALUES
(1, 'startt', 'djbjud@gmail.com', '0798602758', 'Kerugoya', '1300', '20', 'body-lotion-logo.png', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `star_wars`
--

CREATE TABLE `star_wars` (
  `supplier_id` int(10) UNSIGNED NOT NULL,
  `supplier_name` varchar(255) DEFAULT NULL,
  `supplier_email` varchar(50) DEFAULT NULL,
  `supplier_phone` varchar(20) DEFAULT NULL,
  `supplier_city` varchar(50) DEFAULT NULL,
  `supplier_address` varchar(255) DEFAULT NULL,
  `product_category` varchar(50) DEFAULT NULL,
  `supplier_image` varchar(50) DEFAULT NULL,
  `supplier_status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `star_wars`
--

INSERT INTO `star_wars` (`supplier_id`, `supplier_name`, `supplier_email`, `supplier_phone`, `supplier_city`, `supplier_address`, `product_category`, `supplier_image`, `supplier_status`) VALUES
(1, 'star_wars', 'djbjud@gmail.com', '0798602758', 'Kerugoya', '1300', 'Skin_care_preparations ', 'baby-cosmetics-logo.jpg', 'no'),
(7, NULL, NULL, NULL, NULL, NULL, 'Fragrance', NULL, NULL),
(9, NULL, NULL, NULL, NULL, NULL, 'Hair Preparations', NULL, NULL),
(10, NULL, NULL, NULL, NULL, NULL, 'Baby_Products', NULL, NULL),
(14, NULL, NULL, NULL, NULL, NULL, 'Manicuring_Preparations', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `store_id` int(10) NOT NULL,
  `store_title` varchar(255) NOT NULL,
  `store_image` varchar(255) NOT NULL,
  `store_desc` text NOT NULL,
  `store_button` varchar(255) NOT NULL,
  `store_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`store_id`, `store_title`, `store_image`, `store_desc`, `store_button`, `store_url`) VALUES
(7, 'Nivea', 'NIVEA_logo.png', '<b>Nivea Company</b> is a German personal care brand that specializes in skin and body care. It is owned by the Hamburg-based company Beiersdorf Global AG. The company was founded on 28 March 1882, by Paul Carl Beiersdorf. In 1890, it was sold to Oscar Troplowitz.', 'Quality', 'https://www.nivea.co.ke/'),
(8, 'Versman', 'versman-logo.jpg', '<b> Versman Company </b> Is a Kenyan-based Company that deals with Cosmetics brands. It was established in 2010.\r\n', 'Quality', 'https://web.facebook.com/VersmanKenya/');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(255) NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `supplier_city` varchar(20) NOT NULL,
  `supplier_phone` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `supplier_name`, `supplier_city`, `supplier_phone`) VALUES
(1, '', '', ''),
(2, 'star', '', ''),
(3, 'gdgg', '', ''),
(4, 'starreud', '', ''),
(5, 'star_wars', 'Kerugoya', '0798602758'),
(6, 'munene', 'Kerugoya', '0798602758'),
(7, 'Ramah', 'Kerugoya', '0798602758');

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE `terms` (
  `term_id` int(10) NOT NULL,
  `term_title` varchar(100) NOT NULL,
  `term_link` varchar(100) NOT NULL,
  `term_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlist_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_us`
--
ALTER TABLE `about_us`
  ADD PRIMARY KEY (`about_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `bundle_product_relation`
--
ALTER TABLE `bundle_product_relation`
  ADD PRIMARY KEY (`rel_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `customer_orders`
--
ALTER TABLE `customer_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `enquiry_types`
--
ALTER TABLE `enquiry_types`
  ADD PRIMARY KEY (`enquiry_id`);

--
-- Indexes for table `gdgg`
--
ALTER TABLE `gdgg`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `munene`
--
ALTER TABLE `munene`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `pending_orders`
--
ALTER TABLE `pending_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`p_cat_id`);

--
-- Indexes for table `ramah`
--
ALTER TABLE `ramah`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `stansh`
--
ALTER TABLE `stansh`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `starhr_green`
--
ALTER TABLE `starhr_green`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `starkjg`
--
ALTER TABLE `starkjg`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `starreud`
--
ALTER TABLE `starreud`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `startt`
--
ALTER TABLE `startt`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `star_wars`
--
ALTER TABLE `star_wars`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`term_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlist_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_us`
--
ALTER TABLE `about_us`
  MODIFY `about_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bundle_product_relation`
--
ALTER TABLE `bundle_product_relation`
  MODIFY `rel_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `contact_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `coupon_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer_orders`
--
ALTER TABLE `customer_orders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `enquiry_types`
--
ALTER TABLE `enquiry_types`
  MODIFY `enquiry_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `gdgg`
--
ALTER TABLE `gdgg`
  MODIFY `supplier_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `munene`
--
ALTER TABLE `munene`
  MODIFY `supplier_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pending_orders`
--
ALTER TABLE `pending_orders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `p_cat_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `ramah`
--
ALTER TABLE `ramah`
  MODIFY `supplier_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stansh`
--
ALTER TABLE `stansh`
  MODIFY `supplier_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `starhr_green`
--
ALTER TABLE `starhr_green`
  MODIFY `supplier_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `starkjg`
--
ALTER TABLE `starkjg`
  MODIFY `supplier_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `starreud`
--
ALTER TABLE `starreud`
  MODIFY `supplier_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `startt`
--
ALTER TABLE `startt`
  MODIFY `supplier_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `star_wars`
--
ALTER TABLE `star_wars`
  MODIFY `supplier_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `store`
--
ALTER TABLE `store`
  MODIFY `store_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `term_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlist_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
