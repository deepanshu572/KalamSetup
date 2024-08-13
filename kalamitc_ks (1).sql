-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 09, 2024 at 05:11 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kalamitc_ks`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories_tb`
--

CREATE TABLE `categories_tb` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories_tb`
--

INSERT INTO `categories_tb` (`id`, `parent_id`, `name`, `images`, `status`, `date`) VALUES
(1, 0, 'processor', 'https://avatars.mds.yandex.net/i?id=a3882a571863e09693132c9a6c977ad2b59e0e36-9390856-images-thumbs&n=13', '', '2023-06-16 03:19:34'),
(2, 1, 'AMD', 'https://cdn.patchbot.io/games/140/amd-gpu-drivers_sm.webp', '', '2023-06-16 03:19:34'),
(3, 0, 'Fruits', 'https://avatars.mds.yandex.net/i?id=68484aa319b7b5c97554f859bd11027e6d52170b-9599837-images-thumbs&n=13', '', '2023-06-16 03:19:34'),
(4, 1, 'Intel', 'https://avatars.mds.yandex.net/i?id=c51cead60b324738e17d02710465edf27b913716-9147977-images-thumbs&n=13', '', '2023-06-16 03:19:34'),
(5, 2, 'Ryzen', 'https://avatars.mds.yandex.net/i?id=ca988a9441dc1edd7427b5ada76e44c4ddd21149-10121710-images-thumbs&n=13', '', '2023-06-16 03:19:34'),
(6, 3, 'Mango', 'https://cpimg.tistatic.com/05795489/b/4/Fresh-Mango.jpg', '', '2023-06-16 03:19:34'),
(7, 0, 'grocery', 'https://avatars.mds.yandex.net/i?id=b789113281c3bedbdcab768dc2d734908d782496-10517487-images-thumbs&n=13', '', '2023-06-16 03:19:34'),
(8, 7, 'cooking oil', 'https://5.imimg.com/data5/XN/XJ/MY-29603004/fortune-groundnut-oil-250x250.jpg', '', '2024-02-07 08:31:23'),
(9, 5, 'Ryzen 3 3100', 'https://i.otzovik.com/objects/b/1810000/1809536.png', '', '2024-02-07 08:54:26');

-- --------------------------------------------------------

--
-- Table structure for table `images_tb`
--

CREATE TABLE `images_tb` (
  `id` int(11) NOT NULL,
  `pid` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images_tb`
--

INSERT INTO `images_tb` (`id`, `pid`, `image_name`, `date`) VALUES
(1, '1', 'KA20220925084802.jpg', '2022-09-26 02:18:02'),
(2, '1', 'KA20220925084823.jpg', '2022-09-26 02:18:23'),
(3, '2', 'KA20220925084838.jpg', '2022-09-26 02:18:38'),
(4, '2', 'KA20220925084849.jpg', '2022-09-26 02:18:49'),
(5, '3', 'KA20220925050815.jpg', '2022-09-25 17:08:15'),
(6, '3', 'KA20220926043543.jpg', '2022-09-26 16:35:43'),
(7, '4', 'KA20230312102458.jpg', '2023-03-12 15:54:58');

-- --------------------------------------------------------

--
-- Table structure for table `keywords`
--

CREATE TABLE `keywords` (
  `id` int(11) NOT NULL,
  `product_nm` varchar(100) NOT NULL,
  `keyword` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `keywords`
--

INSERT INTO `keywords` (`id`, `product_nm`, `keyword`, `date`) VALUES
(1, 'APPLE', 'apple,fresh apple,sweet apple', '2023-02-02 12:52:23'),
(2, 'APPLE', 'apple,fresh apple,sweet apple', '2023-02-02 12:52:23'),
(3, 'Banana', 'banana,', '2023-02-02 13:04:40'),
(4, 'aabb', 'aaa', '2023-03-12 15:52:07');

-- --------------------------------------------------------

--
-- Table structure for table `product_tb`
--

CREATE TABLE `product_tb` (
  `id` int(11) NOT NULL,
  `product_nm` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_cm` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_tb`
--

INSERT INTO `product_tb` (`id`, `product_nm`, `product_cm`, `cat_id`, `description`) VALUES
(1, 'Ryzen 9', 'AMD', '2', 'About this item 12 Cores & 24 Threads, 20 MB Cache Base Clock: 3.8 GHz, Max Boost Clock: up to 4.6 GHz Memory Support: DDR4 Upto 3200 MHz, Memory Channels: 2, TDP: 65W Compatible with Motherboards based on 500 series chipset, Socket AM4 Graphics: AMD Radeon Graphics, Included Heatsink Fan: Wrgeneralth Stealth 3 Years Brand Warranty. For Technical Support : Please Contact : Tel: +91-80-67030050 (Mon-Fri: 09:00 - 17:00 IST); Expect Delayed Response due to ongoing COVID Crisis For all performance-related issues in: AMD Processor: Please reach out via AMD brand home page > Drivers & Support > Customer Support  (Technical & Warranty help) > Contact Support > Online Service Request In case you are not satisfied the resolution provided by the above brands, please reach back to Amazon Customer service for next steps.'),
(2, 'Ryzen 7', 'AMD', '2', 'About this item\n8 Cores & 16 Threads, 20 MB Cache\nBase Clock: 3.8 GHz, Max Boost Clock: up to 4.6 GHz\nMemory Support: DDR4 Upto 3200 MHz, Memory Channels: 2, TDP: 65W\nCompatible with Motherboards based on 500 series chipset, Socket AM4\nGraphics: AMD Radeon Graphics, Included Heatsink Fan: Wrgeneralth Stealth\n3 Years Brand Warranty. For Technical Support : Please Contact : Tel: +91-80-67030050 (Mon-Fri: 09:00 - 17:00 IST); Expect Delayed Response due to ongoing COVID Crisis\nFor all performance-related issues in: AMD Processor: Please reach out via AMD brand home page > Drivers & Support > Customer Support  (Technical & Warranty help) > Contact Support > Online Service Request In case you are not satisfied the resolution provided by the above brands, please reach back to Amazon Customer service for next steps.'),
(3, 'APPLE', 'Kashmiri Apple', '3', '<b>fresh and sweet</b>'),
(4, 'APPLE', 'Kashmiri Apple', '3', '<b>fresh and sweet</b>'),
(5, 'Banana', 'chiquita brands', '3', '<p><b style=\"\"><font color=\"#000000\" style=\"background-color: rgb(255, 156, 0);\">fresh and sweets</font></b><br></p>'),
(6, 'aabb', 'amd', '3', '<p>saddsa</p>');

-- --------------------------------------------------------

--
-- Table structure for table `product_var`
--

CREATE TABLE `product_var` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `type_name_1` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_qty_1` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_name_2` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_qty_2` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fprice` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_var`
--

INSERT INTO `product_var` (`id`, `product_id`, `type_name_1`, `type_qty_1`, `type_name_2`, `type_qty_2`, `fprice`, `price`, `sku`) VALUES
(1, 1, 'SERIES', '5900X', 'SPECS', '8 Core', '80000', '39000', '456'),
(2, 1, 'SERIES', '5950X', 'SPECS', '12 cores', '90000', '51000', '789'),
(3, 2, 'Series', '5800X', 'Cores', '8', '60000', '40000', '111'),
(4, 3, 'kg', '5', 'size', 'small', '220', '180', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories_tb`
--
ALTER TABLE `categories_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images_tb`
--
ALTER TABLE `images_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keywords`
--
ALTER TABLE `keywords`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_tb`
--
ALTER TABLE `product_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_var`
--
ALTER TABLE `product_var`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories_tb`
--
ALTER TABLE `categories_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `images_tb`
--
ALTER TABLE `images_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `keywords`
--
ALTER TABLE `keywords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_tb`
--
ALTER TABLE `product_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_var`
--
ALTER TABLE `product_var`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
