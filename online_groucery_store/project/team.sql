-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-12-11 00:21:37
-- 服务器版本： 5.7.15-log
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- 表的结构 `cart`
--

CREATE TABLE `cart` (
  `p_id` int(100) NOT NULL,
  `ip_add` varchar(255) NOT NULL,
  `qty` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cart`
--

INSERT INTO `cart` (`p_id`, `ip_add`, `qty`) VALUES
(1, '::1', 1),
(2, '::1', 1),
(3, '::1', 1),
(4, '::1', 1),
(5, '::1', 1),
(7, '::1', 1),
(8, '::1', 1);

-- --------------------------------------------------------

--
-- 表的结构 `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) UNSIGNED NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Food'),
(2, 'Baverage');

-- --------------------------------------------------------

--
-- 表的结构 `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(100) NOT NULL,
  `customer_ip` varchar(255) NOT NULL,
  `customer_email` text NOT NULL,
  `customer_pass` text NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_state` text NOT NULL,
  `customer_city` text NOT NULL,
  `customer_contact` varchar(255) NOT NULL,
  `customer_address` text NOT NULL,
  `customer_card` int(100) NOT NULL,
  `customer_payAddress` text NOT NULL,
  `customer_balance` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_ip`, `customer_email`, `customer_pass`, `customer_name`, `customer_state`, `customer_city`, `customer_contact`, `customer_address`, `customer_card`, `customer_payAddress`, `customer_balance`) VALUES
(2, '::1', 'dannyqbw@gmail.com', 'qibinwei', 'Binwei', 'Illinois', 'Chicago', '3125360075', '', 0, '3456 s ave', 0),
(13, '::2', 'dannyqbw@hotmail.com', 'qibinwei', 'BinweiQi', 'California', 'san jose', '3125360071', '123 ave', 0, '1234 sdf ave san jose', 0);

-- --------------------------------------------------------

--
-- 表的结构 `order`
--

CREATE TABLE `order` (
  `order_id` int(100) NOT NULL,
  `order_time` datetime NOT NULL,
  `order_status` varchar(255) NOT NULL,
  `order_card` int(100) NOT NULL,
  `order_ip` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `order`
--

INSERT INTO `order` (`order_id`, `order_time`, `order_status`, `order_card`, `order_ip`) VALUES
(1, '2016-12-08 13:53:41', 'issued', 12345678, '::1');

-- --------------------------------------------------------

--
-- 表的结构 `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) UNSIGNED NOT NULL,
  `product_type` int(100) UNSIGNED NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_addinfo` text NOT NULL,
  `product_size` int(100) NOT NULL,
  `product_amount` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_type`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_addinfo`, `product_size`, `product_amount`) VALUES
(1, 1, 1, 'Beef ribeye', 1, 'it not good beef ribeye', 'beef_ribeye.jpg', '10 lb/bag', 20, 2),
(2, 1, 2, 'tomato', 5, '<p>Tomatoes are widely known for their outstanding antioxidant content, including, of course, their oftentimes-rich concentration of lycopene.</p>\r\n<p>5lb/bag</p>', 'tomato.jpg', '', 2, 100),
(3, 1, 2, 'asparagus', 5, '<p>The fleshy green spears of asparagus are both succulent and tender and have been considered a delicacy since ancient times.</p>', 'asparagus.jpg', '1lb/bag', 2, 150),
(4, 1, 3, 'apple', 5, '<p>Delicious and crunchy, apple fruit is one of the most popular and favorite fruits among the health conscious, fitness lovers who firmly believe in the concept of &ldquo;health is wealth.&rdquo; This wonderful fruit is packed with rich phyto-nutrients that, in the true sense, indispensable for optimal health.</p>', 'apple.png', '5lb/bag', 3, 500),
(5, 1, 1, 'lamb', 50, '<p>Lamb is the meat of the domestic sheep (<em>Ovis aries</em>).</p>\r\n<p>It is a type of red meat, a term used for the meat of mammals, which is richer in iron than chicken or fish.</p>', 'lamb.jpg', '5lb/bag', 4, 100),
(6, 1, 2, 'potato', 5, '<p>Whether mashed, baked or roasted, people often consider potatoes as comfort food. It is an important food staple and the number one vegetable crop in the world. Potatoes are available year-round as they are harvested somewhere every month of the year.</p>', 'potato.jpg', '8lb/bag', 5, 100),
(7, 2, 5, 'Insignia 2012 red wine', 1100, '<p>The 2012 Insignia has an inky dark hue and aromas of ripe blackberries, star anise, cigarbox, clove and sweet mochanotes. Richly opulent with velvety texture and supple tannins, this full-bodied offering envelops the palate in luscious, lingeringblack plum and violets along with layers of baking spices.</p>', 'Insignia2012wine.jpg', '6 bottle/box, alcohol: 14%', 8, 10),
(8, 2, 6, 'coca cola', 2, '<p>&nbsp;Coca-Cola is the most popular soft drink in history, as well as the best-known brand in the world.</p>', 'cocacola.png', '2L/bottle', 2, 200),
(11, 1, 1, 'porkchops', 10, '<p>good pork chops</p>', 'porkchops.jpg', '3lb/bag', 5, 100);

-- --------------------------------------------------------

--
-- 表的结构 `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(100) NOT NULL,
  `staff_ip` text NOT NULL,
  `staff_email` text NOT NULL,
  `staff_pass` text NOT NULL,
  `staff_name` varchar(255) NOT NULL,
  `staff_address` text NOT NULL,
  `staff_job` varchar(255) NOT NULL,
  `staff_salary` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `staff`
--

INSERT INTO `staff` (`staff_id`, `staff_ip`, `staff_email`, `staff_pass`, `staff_name`, `staff_address`, `staff_job`, `staff_salary`) VALUES
(1, '', 'bqi2@hawk.iit.edu', 'qibinwei', 'BinweiQi', '1234 W Pershing Rd Chicago Illinois', 'manager', 10000);

-- --------------------------------------------------------

--
-- 表的结构 `stock`
--

CREATE TABLE `stock` (
  `product_id` int(100) NOT NULL,
  `warehouse_id` int(100) NOT NULL,
  `stock` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `stock`
--

INSERT INTO `stock` (`product_id`, `warehouse_id`, `stock`) VALUES
(11, 1, 100),
(12, 2, 100);

-- --------------------------------------------------------

--
-- 表的结构 `type`
--

CREATE TABLE `type` (
  `type_id` int(100) UNSIGNED NOT NULL,
  `parent_id` int(100) UNSIGNED NOT NULL,
  `type_title` varchar(255) NOT NULL,
  `type_disc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `type`
--

INSERT INTO `type` (`type_id`, `parent_id`, `type_title`, `type_disc`) VALUES
(1, 1, 'meat', 'many kinds of animal''s meat verified by the USDA'),
(2, 1, 'vegetable', 'many kinds of vegetables from local farm'),
(3, 1, 'fruit', 'many kinds of fresh fruit from local farm'),
(4, 1, 'snack', 'many kinds of snak for leisure time'),
(5, 2, 'liquor', 'wine,beer,vodka and many other for you to enjoy'),
(6, 2, 'soda', 'many kinds of soda and sparkling water');

-- --------------------------------------------------------

--
-- 表的结构 `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(100) NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `supplier_address` text NOT NULL,
  `supplier_item` varchar(255) NOT NULL,
  `supplier_price` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `supplier_name`, `supplier_address`, `supplier_item`, `supplier_price`) VALUES
(1, 'supplier1', '9876 s abc ave chicago Illinois', 'beef rib eye', 3);

-- --------------------------------------------------------

--
-- 表的结构 `types`
--

CREATE TABLE `types` (
  `type_id` int(100) NOT NULL,
  `type_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `types`
--

INSERT INTO `types` (`type_id`, `type_title`) VALUES
(1, 'Meat'),
(2, 'Vegetable'),
(3, 'Fruit'),
(4, 'Snack'),
(5, 'liquor'),
(6, 'soda');

-- --------------------------------------------------------

--
-- 表的结构 `warehouse`
--

CREATE TABLE `warehouse` (
  `warehouse_id` int(100) NOT NULL,
  `warehouse_address` text NOT NULL,
  `warehouse_capacity` int(100) NOT NULL,
  `warehouse_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `warehouse`
--

INSERT INTO `warehouse` (`warehouse_id`, `warehouse_address`, `warehouse_capacity`, `warehouse_name`) VALUES
(1, '1234 S king dr Chicago Illinois', 10000, 'warehouse 1'),
(2, '2345 W stevens rd San Francisco Califonia', 200000, 'warehouse 2');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `product_cat` (`product_cat`),
  ADD KEY `product_type` (`product_type`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`warehouse_id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`type_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`warehouse_id`);


--
-- 限制表 `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`product_cat`) REFERENCES `categories` (`cat_id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`product_type`) REFERENCES `type` (`type_id`);

--
-- 限制表 `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`warehouse_id`);

--
-- 限制表 `type`
--
ALTER TABLE `type`
  ADD CONSTRAINT `type_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`cat_id`);


