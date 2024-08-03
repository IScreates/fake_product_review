-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2022 at 09:32 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `fake_product`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_details`
--

CREATE TABLE IF NOT EXISTS `admin_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin_details`
--

INSERT INTO `admin_details` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `cart_whish_list_products`
--

CREATE TABLE IF NOT EXISTS `cart_whish_list_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` varchar(30) DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  `p_name` varchar(255) NOT NULL,
  `base_price` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `request_by` varchar(30) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `cart_whish_list_products`
--

INSERT INTO `cart_whish_list_products` (`id`, `p_id`, `category`, `p_name`, `base_price`, `quantity`, `request_by`, `status`) VALUES
(18, '3', 'Mobile', 'IPhone 11', '45500', '1', 'yadnesh@gmail.com', 'Wish List Product'),
(21, '2', 'Camera', 'SonyCamers', '34200', '1', 'yadnesh@gmail.com', 'Wish List Product');

-- --------------------------------------------------------

--
-- Table structure for table `customer_details`
--

CREATE TABLE IF NOT EXISTS `customer_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customer_details`
--

INSERT INTO `customer_details` (`id`, `name`, `address`, `mobile`, `email`, `password`, `status`) VALUES
(1, 'Piya', 'Katraj, Pune', '9876543211', 'piya@gmail.com', '1122', 'Active'),
(2, 'Raj', 'Shivajinagar, Pune', '9812453217', 'raj@gmail.com', '4545', 'Active'),
(3, 'Yadnesh', 'Sambhajinagar', '8764123456', 'yadnesh@gmail.com', '1010', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback` varchar(200) NOT NULL,
  `stars` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `status` varchar(255) DEFAULT 'Orignal Review',
  `sentiment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `feedback`, `stars`, `email`, `status`, `sentiment`) VALUES
(1, 'good morning friends', '3', 'raj@gmail.com', 'Fake Review', 'positive'),
(2, 'good quality of product', '4', 'raj@gmail.com', 'Orignal Review', 'positive');

-- --------------------------------------------------------

--
-- Table structure for table `payment_details`
--

CREATE TABLE IF NOT EXISTS `payment_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `totalPrice` varchar(200) NOT NULL,
  `card_no` varchar(200) NOT NULL,
  `month_year` varchar(200) NOT NULL,
  `cvv` varchar(200) NOT NULL,
  `payment_by` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Payment Done',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `payment_details`
--

INSERT INTO `payment_details` (`id`, `totalPrice`, `card_no`, `month_year`, `cvv`, `payment_by`, `status`) VALUES
(1, '44320', '718299187600', '12/22', '123', 'raj@gmail.com', 'Payment Done');

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE IF NOT EXISTS `product_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(1000) DEFAULT NULL,
  `p_name` varchar(100) DEFAULT NULL,
  `specification` text,
  `file_name` varchar(30) DEFAULT NULL,
  `base_price` varchar(30) DEFAULT NULL,
  `mfg_date` varchar(30) DEFAULT NULL,
  `exp_date` varchar(30) DEFAULT NULL,
  `upload_by` varchar(30) DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'Not_Sell',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`id`, `category`, `p_name`, `specification`, `file_name`, `base_price`, `mfg_date`, `exp_date`, `upload_by`, `status`) VALUES
(2, 'Camera', 'SonyCamers', 'Sony DSLR Cammera', 'camera2.jpg', '34200', '2021-02-27', '2023-03-22', 'Admin', 'Not_Sell'),
(3, 'Mobile', 'IPhone 11', 'IPhone Pro Version', 'iphone11.jpg', '45500', '2021-03-06', '2023-03-16', 'Admin', 'Not_Sell'),
(4, 'Laptop', 'HPLaptop', 'HP E244 Laptop', 'laptop2.jpg', '44320', '2021-12-26', '2023-03-06', 'Admin', 'Not_Sell');

-- --------------------------------------------------------

--
-- Table structure for table `seller_details`
--

CREATE TABLE IF NOT EXISTS `seller_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `seller_details`
--

INSERT INTO `seller_details` (`id`, `fname`, `email`, `mobile`, `password`) VALUES
(1, 'Cakes', 'Cakes@gmail.com', '8900890089', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `statistics`
--

CREATE TABLE IF NOT EXISTS `statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `p_name` varchar(255) DEFAULT NULL,
  `base_price` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `statistics`
--

INSERT INTO `statistics` (`id`, `p_id`, `category`, `p_name`, `base_price`, `quantity`) VALUES
(1, '7', 'Cake', 'Cake', '500', '1'),
(2, '12', 'Bread', 'Bread', '35', '2'),
(3, '11', 'Cake', 'IceCake', '450', '2'),
(4, '9', 'Bread', 'Bread', '400', '1'),
(5, '3', 'Mobile', 'IPhone 11', '45500', '1'),
(6, '4', 'Laptop', 'HPLaptop', '44320', '1'),
(7, '3', 'Mobile', 'IPhone 11', '45500', '1'),
(8, '2', 'Camera', 'SonyCamers', '34200', '1'),
(9, '3', 'Mobile', 'IPhone 11', '45500', '1'),
(10, '2', 'Camera', 'SonyCamers', '34200', '1'),
(11, '3', 'Mobile', 'IPhone 11', '45500', '1'),
(12, '3', 'Mobile', 'IPhone 11', '45500', '1'),
(13, '4', 'Laptop', 'HPLaptop', '44320', '1'),
(14, '4', 'Laptop', 'HPLaptop', '44320', '1'),
(15, '2', 'Camera', 'SonyCamers', '34200', '1'),
(16, '4', 'Laptop', 'HPLaptop', '44320', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tblfeedback`
--

CREATE TABLE IF NOT EXISTS `tblfeedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `feedback` varchar(255) DEFAULT NULL,
  `stars` varchar(255) DEFAULT NULL,
  `sentiment_sts` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tblfeedback`
--

INSERT INTO `tblfeedback` (`id`, `email`, `feedback`, `stars`, `sentiment_sts`, `status`) VALUES
(1, 'raj@gmail.com', 'good day', '3', 'positive', 'null'),
(2, 'raj@gmail.com', 'good today', '3', 'positive', NULL),
(3, 'raj@gmail.com', 'bad product', '1', 'negative', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
