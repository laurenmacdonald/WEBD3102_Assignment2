-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2024 at 07:11 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `order_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `addressId` int(11) NOT NULL,
  `addressLine1` varchar(100) DEFAULT NULL,
  `addressLine2` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postalCode` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`addressId`, `addressLine1`, `addressLine2`, `city`, `province`, `country`, `postalCode`) VALUES
(1, '123 Main St', '', 'Halifax', 'Nova Scotia', 'Canada', 'B3H 1A7'),
(2, '456 Maple Ave', 'Apt 101', 'Halifax', 'Nova Scotia', 'Canada', 'B3H 2B8'),
(3, '789 Oak St', '', 'Halifax', 'Nova Scotia', 'Canada', 'B3H 3C9'),
(4, '101 Pine St', '', 'Halifax', 'Nova Scotia', 'Canada', 'B3H 4D0'),
(5, '234 Elm St', 'Unit 201', 'Halifax', 'Nova Scotia', 'Canada', 'B3H 5E1'),
(6, '567 Cedar St', '', 'Halifax', 'Nova Scotia', 'Canada', 'B3H 6F2'),
(7, '890 Birch St', '', 'Halifax', 'Nova Scotia', 'Canada', 'B3H 7G3'),
(8, '112 Spruce St', '', 'Halifax', 'Nova Scotia', 'Canada', 'B3H 8H4'),
(9, '345 Walnut St', 'Suite 301', 'Halifax', 'Nova Scotia', 'Canada', 'B3H 9I5'),
(10, '678 Pineapple Dr', '', 'Halifax', 'Nova Scotia', 'Canada', 'B3H 1J6'),
(11, '910 Mango Rd', '', 'Halifax', 'Nova Scotia', 'Canada', 'B3H 2K7'),
(12, '111 Strawberry Blvd', '', 'Halifax', 'Nova Scotia', 'Canada', 'B3H 3L8'),
(13, '222 Blueberry Ln', '', 'Halifax', 'Nova Scotia', 'Canada', 'B3H 4M9'),
(14, '333 Raspberry Cres', 'Unit 401', 'Halifax', 'Nova Scotia', 'Canada', 'B3H 5N0'),
(15, '444 Peach St', '', 'Halifax', 'Nova Scotia', 'Canada', 'B3H 6O1'),
(16, '555 Lemon Ave', '', 'Halifax', 'Nova Scotia', 'Canada', 'B3H 7P2'),
(17, '666 Orange Dr', '', 'Halifax', 'Nova Scotia', 'Canada', 'B3H 8Q3'),
(18, '777 Apple St', '', 'Halifax', 'Nova Scotia', 'Canada', 'B3H 9R4'),
(19, '888 Grape Rd', '', 'Halifax', 'Nova Scotia', 'Canada', 'B3H 1S5'),
(20, '999 Cherry Ln', '', 'Halifax', 'Nova Scotia', 'Canada', 'B3H 2T6'),
(43, '456 Robie Street', '', 'Halifax', 'NS', 'Canada', 'B3K5R4'),
(44, '456 Robie Street', '', 'Halifax', 'NS', 'Canada', 'B3K4N5'),
(45, 'iooioi', 'oo', 'hohohio', 'hohoh', 'ohohoh', 'hohoho'),
(46, '123 Cool Street', 'Apt 404', 'Halifax', 'NS', 'Canada', 'B3K4N3'),
(47, 'guog', 'ig', 'ogo', 'gog', 'gog', 'gogo'),
(48, '123 Main Street', '', 'Dartmouth', 'NS', 'Canada', 'B3K4N2'),
(49, 'hoihoh', '', 'ohiohoi', 'hioh', 'hioio', 'hiohio');

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `billingId` int(11) NOT NULL,
  `cardNumber` bigint(255) DEFAULT NULL,
  `expiryDate` varchar(50) DEFAULT NULL,
  `securityCode` int(11) DEFAULT NULL,
  `addressId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `billing`
--

INSERT INTO `billing` (`billingId`, `cardNumber`, `expiryDate`, `securityCode`, `addressId`) VALUES
(1, 1234567890123456, '12/25', 123, 1),
(2, 9876543210987654, '06/24', 456, 2),
(3, 1111222233334444, '09/23', 789, 3),
(4, 5555666677778888, '03/26', 12, 4),
(5, 9999888877776666, '11/27', 345, 5),
(6, 4444555566667777, '07/25', 678, 6),
(7, 8888777766665555, '05/28', 901, 7),
(8, 3333222211110000, '08/24', 234, 8),
(9, 7777666655554444, '02/25', 567, 9),
(10, 6666555544443333, '10/23', 890, 10),
(11, 1234567891012345, '12/26', 456, 41),
(12, 1234567891012345, '12/27', 98, 42),
(13, 789456123078945, '07/26', 456, 44),
(14, 123456789123, '20/56', 123, 45),
(15, 1234567890321654, '05/29', 123, 46),
(16, 123548731667, '1234', 166, 47),
(17, 9874561230147852, '08/26', 123, 48),
(18, 123456789135, '10/85', 124, 49);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryId` int(11) NOT NULL,
  `categoryName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryId`, `categoryName`) VALUES
(1, 'Original Pizza'),
(2, 'Hero'),
(3, 'Salad'),
(4, 'Drink'),
(5, 'Dessert'),
(6, 'Feature Pizza'),
(7, 'Specialty Bianco Pizza');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customerId` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `phoneNumber` varchar(50) NOT NULL,
  `addressId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customerId`, `email`, `password`, `firstName`, `lastName`, `phoneNumber`, `addressId`) VALUES
(1, 'john@example.com', 'password123', 'John', 'Doe', '123-456-7890', 1),
(2, 'jane@example.com', 'qwerty123', 'Jane', 'Smith', '987-654-3210', 2),
(3, 'mike@example.com', 'mikepass', 'Mike', 'Johnson', '555-555-5555', 3),
(4, 'sara@example.com', 'sara123', 'Sara', 'Williams', '111-222-3333', 4),
(5, 'david@example.com', 'davidpass', 'David', 'Brown', '999-888-7777', 5),
(6, 'emily@example.com', 'emilypass', 'Emily', 'Taylor', '444-333-2222', 6),
(7, 'chris@example.com', 'chrispass', 'Chris', 'Anderson', '666-777-8888', 7),
(8, 'lisa@example.com', 'lisapass', 'Lisa', 'Martinez', '222-111-0000', 8),
(9, 'ryan@example.com', 'ryan123', 'Ryan', 'Hernandez', '777-888-9999', 9),
(10, 'amy@example.com', 'amypass', 'Amy', 'Garcia', '888-999-0000', 10),
(33, 'lauren@gmail.com', 'example123', 'Lauren', 'MacDonald', '9028188736', 44),
(34, 'ohiohio@gmail.com', 'example123', 'Idk', 'Something', '456137', 45),
(35, 'laurenmacdonald@gmail.com', 'example123', 'Lauren', 'MacDonald', '9028188736', 46),
(36, 'jphpohp@gmail.com', 'pohpoh', 'php', 'hoihoih', 'hohoi', 47),
(37, 'idksomething@gmail.com', 'example123', 'Something', 'IDK', '9028188733', 48),
(38, 'yo@gmail.com', 'example123', 'Idk', 'Someone', '123456780', 49);

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `deliveryId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `deliveryAgentId` int(11) NOT NULL,
  `deliveryStatus` enum('pending','in transit','delivered','') NOT NULL,
  `deliveryDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`deliveryId`, `orderId`, `deliveryAgentId`, `deliveryStatus`, `deliveryDate`) VALUES
(1, 1, 1, 'pending', '2024-03-14'),
(2, 77, 0, 'pending', '2024-03-14'),
(3, 78, 0, 'pending', '2024-03-14'),
(4, 79, 1, 'pending', '2024-03-14'),
(5, 81, 1, 'pending', '2024-03-14'),
(6, 82, 1, 'pending', '2024-03-14'),
(7, 83, 1, 'pending', '2024-03-14'),
(8, 84, 0, 'pending', '2024-03-14'),
(9, 86, 1, 'pending', '2024-03-14'),
(10, 87, 0, 'pending', '2024-03-14'),
(11, 88, 1, 'pending', '2024-03-14'),
(12, 89, 2, 'pending', '2024-03-14'),
(13, 90, 2, 'pending', '2024-03-14'),
(14, 91, 1, 'pending', '2024-03-14'),
(15, 92, 2, 'pending', '2024-03-14'),
(16, 93, 2, 'delivered', '2024-03-14'),
(17, 99, 1, 'delivered', '2024-03-14'),
(18, 100, 1, 'delivered', '2024-03-14'),
(19, 101, 1, 'delivered', '2024-03-14'),
(20, 102, 1, 'delivered', '2024-03-14'),
(21, 103, 1, 'delivered', '2024-03-14'),
(22, 104, 1, 'delivered', '2024-03-14'),
(23, 105, 2, 'delivered', '2024-03-14'),
(24, 107, 2, 'delivered', '2024-03-14'),
(25, 108, 1, 'delivered', '2024-03-15'),
(26, 117, 1, 'delivered', '2024-03-15'),
(27, 118, 1, 'delivered', '2024-03-15'),
(28, 119, 2, 'delivered', '2024-03-15'),
(29, 123, 2, 'delivered', '2024-03-15');

-- --------------------------------------------------------

--
-- Table structure for table `deliveryagent`
--

CREATE TABLE `deliveryagent` (
  `deliveryAgentId` int(11) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `phoneNumber` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deliveryagent`
--

INSERT INTO `deliveryagent` (`deliveryAgentId`, `firstName`, `lastName`, `phoneNumber`) VALUES
(1, 'Jim', 'Guy', '902-123-4567'),
(2, 'Pedro', 'Pascal', '902-456-1234');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `orderDetailId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `prodId` int(11) NOT NULL,
  `prodQuantity` int(11) NOT NULL,
  `totalAmount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`orderDetailId`, `orderId`, `prodId`, `prodQuantity`, `totalAmount`) VALUES
(32, 13, 1, 1, 17.99),
(33, 13, 2, 1, 24.48),
(34, 13, 3, 1, 23.48),
(35, 14, 1, 2, 35.98),
(36, 14, 23, 1, 7.99),
(37, 14, 25, 1, 2.25),
(38, 14, 28, 1, 7.49),
(39, 14, 15, 2, 13.98),
(40, 15, 17, 1, 7.99),
(41, 15, 3, 1, 23.48),
(42, 15, 10, 1, 25.48),
(43, 15, 13, 1, 25.48),
(44, 15, 17, 1, 7.99),
(45, 15, 3, 1, 23.48),
(46, 15, 10, 1, 25.48),
(47, 15, 13, 1, 25.48),
(48, 15, 17, 1, 7.99),
(49, 15, 3, 1, 23.48),
(50, 15, 10, 1, 25.48),
(51, 15, 13, 1, 25.48),
(52, 15, 17, 1, 7.99),
(53, 15, 3, 1, 23.48),
(54, 15, 10, 1, 25.48),
(55, 15, 13, 1, 25.48),
(56, 15, 17, 1, 7.99),
(57, 15, 3, 1, 23.48),
(58, 15, 10, 1, 25.48),
(59, 15, 13, 1, 25.48),
(60, 15, 17, 1, 7.99),
(61, 15, 3, 1, 23.48),
(62, 15, 10, 1, 25.48),
(63, 15, 13, 1, 25.48),
(64, 15, 17, 1, 7.99),
(65, 15, 3, 1, 23.48),
(66, 15, 10, 1, 25.48),
(67, 15, 13, 1, 25.48),
(68, 15, 17, 1, 7.99),
(69, 15, 3, 1, 23.48),
(70, 15, 10, 1, 25.48),
(71, 15, 13, 1, 25.48),
(72, 15, 17, 1, 7.99),
(73, 15, 3, 1, 23.48),
(74, 15, 10, 1, 25.48),
(75, 15, 13, 1, 25.48),
(76, 15, 17, 1, 7.99),
(77, 15, 3, 1, 23.48),
(78, 15, 10, 1, 25.48),
(79, 15, 13, 1, 25.48),
(80, 25, 17, 1, 7.99),
(81, 25, 3, 1, 23.48),
(82, 25, 10, 1, 25.48),
(83, 25, 13, 1, 25.48),
(84, 26, 17, 1, 7.99),
(85, 26, 3, 1, 23.48),
(86, 26, 10, 1, 25.48),
(87, 26, 13, 1, 25.48),
(88, 27, 17, 1, 7.99),
(89, 27, 3, 1, 23.48),
(90, 27, 10, 1, 25.48),
(91, 27, 13, 1, 25.48),
(92, 28, 17, 1, 7.99),
(93, 28, 3, 1, 23.48),
(94, 28, 10, 1, 25.48),
(95, 28, 13, 1, 25.48),
(96, 29, 17, 1, 7.99),
(97, 29, 3, 1, 23.48),
(98, 29, 10, 1, 25.48),
(99, 29, 13, 1, 25.48),
(100, 30, 17, 1, 7.99),
(101, 30, 3, 1, 23.48),
(102, 30, 10, 1, 25.48),
(103, 30, 13, 1, 25.48),
(104, 31, 17, 1, 7.99),
(105, 31, 3, 1, 23.48),
(106, 31, 10, 1, 25.48),
(107, 31, 13, 1, 25.48),
(108, 32, 17, 1, 7.99),
(109, 32, 3, 1, 23.48),
(110, 32, 10, 1, 25.48),
(111, 32, 13, 1, 25.48),
(112, 33, 17, 1, 7.99),
(113, 33, 3, 1, 23.48),
(114, 33, 10, 1, 25.48),
(115, 33, 13, 1, 25.48),
(116, 34, 17, 1, 7.99),
(117, 34, 3, 1, 23.48),
(118, 34, 10, 1, 25.48),
(119, 34, 13, 1, 25.48),
(120, 35, 17, 1, 7.99),
(121, 35, 3, 1, 23.48),
(122, 35, 10, 1, 25.48),
(123, 35, 13, 1, 25.48),
(124, 35, 17, 1, 7.99),
(125, 35, 3, 1, 23.48),
(126, 35, 10, 1, 25.48),
(127, 35, 13, 1, 25.48),
(128, 35, 17, 1, 7.99),
(129, 35, 3, 1, 23.48),
(130, 35, 10, 1, 25.48),
(131, 35, 13, 1, 25.48),
(132, 35, 17, 1, 7.99),
(133, 35, 3, 1, 23.48),
(134, 35, 10, 1, 25.48),
(135, 35, 13, 1, 25.48),
(136, 35, 17, 1, 7.99),
(137, 35, 3, 1, 23.48),
(138, 35, 10, 1, 25.48),
(139, 35, 13, 1, 25.48),
(140, 35, 17, 1, 7.99),
(141, 35, 3, 1, 23.48),
(142, 35, 10, 1, 25.48),
(143, 35, 13, 1, 25.48),
(144, 41, 17, 1, 7.99),
(145, 41, 3, 1, 23.48),
(146, 41, 10, 1, 25.48),
(147, 41, 13, 1, 25.48),
(148, 42, 17, 1, 7.99),
(149, 42, 3, 1, 23.48),
(150, 42, 10, 1, 25.48),
(151, 42, 13, 1, 25.48),
(152, 43, 17, 1, 7.99),
(153, 43, 3, 1, 23.48),
(154, 43, 10, 1, 25.48),
(155, 43, 13, 1, 25.48),
(156, 44, 17, 1, 7.99),
(157, 44, 3, 1, 23.48),
(158, 44, 10, 1, 25.48),
(159, 44, 13, 1, 25.48),
(160, 45, 17, 1, 7.99),
(161, 45, 3, 1, 23.48),
(162, 45, 10, 1, 25.48),
(163, 45, 13, 1, 25.48),
(164, 46, 17, 1, 7.99),
(165, 46, 3, 1, 23.48),
(166, 46, 10, 1, 25.48),
(167, 46, 13, 1, 25.48),
(168, 47, 17, 1, 7.99),
(169, 47, 3, 1, 23.48),
(170, 47, 10, 1, 25.48),
(171, 47, 13, 1, 25.48),
(172, 48, 17, 1, 7.99),
(173, 48, 3, 1, 23.48),
(174, 48, 10, 1, 25.48),
(175, 48, 13, 1, 25.48),
(176, 49, 17, 1, 7.99),
(177, 49, 3, 1, 23.48),
(178, 49, 10, 1, 25.48),
(179, 49, 13, 1, 25.48),
(180, 50, 17, 1, 7.99),
(181, 50, 3, 1, 23.48),
(182, 50, 10, 1, 25.48),
(183, 50, 13, 1, 25.48),
(184, 51, 17, 1, 7.99),
(185, 51, 3, 1, 23.48),
(186, 51, 10, 1, 25.48),
(187, 51, 13, 1, 25.48),
(188, 52, 17, 1, 7.99),
(189, 52, 3, 1, 23.48),
(190, 52, 10, 1, 25.48),
(191, 52, 13, 1, 25.48),
(192, 53, 17, 1, 7.99),
(193, 53, 3, 1, 23.48),
(194, 53, 10, 1, 25.48),
(195, 53, 13, 1, 25.48),
(196, 54, 17, 1, 7.99),
(197, 54, 3, 1, 23.48),
(198, 54, 10, 1, 25.48),
(199, 54, 13, 1, 25.48),
(200, 55, 2, 2, 48.96),
(201, 56, 2, 2, 48.96),
(202, 57, 2, 2, 48.96),
(203, 58, 2, 2, 48.96),
(204, 59, 2, 2, 48.96),
(205, 60, 2, 2, 48.96),
(206, 61, 2, 2, 48.96),
(207, 62, 2, 2, 48.96),
(208, 62, 2, 2, 48.96),
(209, 62, 2, 2, 48.96),
(210, 62, 2, 2, 48.96),
(211, 62, 2, 2, 48.96),
(212, 62, 2, 2, 48.96),
(213, 62, 2, 2, 48.96),
(214, 62, 2, 2, 48.96),
(215, 62, 2, 2, 48.96),
(216, 71, 1, 1, 17.99),
(217, 71, 2, 1, 24.48),
(218, 72, 1, 1, 17.99),
(219, 73, 1, 1, 17.99),
(220, 74, 1, 1, 17.99),
(221, 75, 1, 2, 35.98),
(222, 75, 29, 1, 3.49),
(223, 76, 10, 1, 25.48),
(224, 76, 27, 1, 2.5),
(225, 77, 21, 1, 7.99),
(226, 78, 20, 1, 7.99),
(227, 79, 19, 1, 7.99),
(228, 80, 19, 1, 7.99),
(229, 81, 24, 1, 7.99),
(230, 82, 22, 1, 7.99),
(231, 83, 14, 1, 20.48),
(232, 84, 1, 1, 17.99),
(233, 85, 1, 1, 17.99),
(234, 86, 4, 1, 25.48),
(235, 87, 2, 1, 24.48),
(236, 88, 29, 1, 3.49),
(237, 89, 2, 1, 24.48),
(238, 90, 24, 1, 7.99),
(239, 91, 1, 1, 17.99),
(240, 92, 2, 1, 24.48),
(241, 93, 2, 1, 24.48),
(242, 93, 3, 1, 23.48),
(243, 94, 11, 1, 24.48),
(244, 97, 11, 1, 24.48),
(245, 97, 11, 1, 24.48),
(246, 97, 11, 1, 24.48),
(247, 98, 2, 1, 24.48),
(248, 99, 2, 1, 24.48),
(249, 99, 3, 1, 23.48),
(250, 100, 6, 1, 24.98),
(251, 100, 9, 1, 24.48),
(252, 100, 10, 1, 25.48),
(253, 101, 1, 1, 17.99),
(254, 101, 2, 1, 24.48),
(255, 102, 3, 1, 23.48),
(256, 102, 7, 1, 17.99),
(257, 103, 12, 1, 25.48),
(258, 103, 13, 1, 25.48),
(259, 104, 17, 1, 7.99),
(260, 105, 17, 1, 7.99),
(261, 106, 17, 1, 7.99),
(262, 107, 17, 1, 7.99),
(263, 108, 23, 1, 7.99),
(264, 108, 28, 1, 7.49),
(265, 116, 2, 1, 24.48),
(266, 116, 20, 1, 7.99),
(267, 116, 29, 1, 3.49),
(268, 117, 19, 1, 7.99),
(269, 117, 29, 1, 3.49),
(270, 118, 18, 1, 7.99),
(271, 118, 20, 1, 7.99),
(272, 118, 24, 1, 7.99),
(273, 118, 25, 1, 2.25),
(274, 118, 27, 1, 2.5),
(275, 119, 26, 1, 2.25),
(276, 119, 12, 1, 25.48),
(277, 119, 14, 1, 20.48),
(278, 120, 1, 1, 17.99),
(279, 121, 16, 1, 7.99),
(280, 121, 1, 1, 17.99),
(281, 121, 7, 1, 17.99),
(282, 121, 29, 1, 3.49),
(283, 122, 16, 1, 7.99),
(284, 122, 1, 2, 35.98),
(285, 122, 7, 1, 17.99),
(286, 122, 29, 1, 3.49),
(287, 123, 16, 1, 7.99),
(288, 123, 1, 3, 53.97),
(289, 123, 7, 1, 17.99),
(290, 123, 29, 1, 3.49);

--
-- Triggers `orderdetails`
--
DELIMITER $$
CREATE TRIGGER `update_product_quantity` AFTER INSERT ON `orderdetails` FOR EACH ROW BEGIN
    DECLARE product_qty INT;
    
    -- Get the quantity of the product from the inserted order
    SELECT od.prodQuantity INTO product_qty FROM orderdetails AS od WHERE od.orderDetailId = NEW.orderDetailId;
    
    -- Update the product quantity in the products table
    UPDATE products AS p SET p.quantityAvail = p.quantityAvail - product_qty WHERE p.prodId = NEW.prodId;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderId`, `customerId`, `createdOn`) VALUES
(1, 1, '2024-03-13 03:00:00'),
(2, 1, '2024-03-13 03:00:00'),
(3, 2, '2024-03-13 03:00:00'),
(4, 1, '2024-03-13 21:52:09'),
(5, 3, '2024-03-13 21:52:09'),
(6, 2, '2024-03-13 21:52:09'),
(7, 1, '2024-03-13 22:08:33'),
(8, 1, '2024-03-13 22:10:28'),
(10, 1, '2024-03-14 14:11:34'),
(11, 1, '2024-03-14 14:15:26'),
(12, 1, '2024-03-14 14:17:21'),
(13, 1, '2024-03-14 14:19:11'),
(14, 1, '2024-03-14 14:21:08'),
(15, 1, '2024-03-14 14:34:48'),
(16, 1, '2024-03-14 14:34:48'),
(17, 1, '2024-03-14 14:34:48'),
(18, 1, '2024-03-14 14:34:48'),
(19, 1, '2024-03-14 14:34:48'),
(20, 1, '2024-03-14 14:34:48'),
(21, 1, '2024-03-14 14:34:48'),
(22, 1, '2024-03-14 14:34:48'),
(23, 1, '2024-03-14 14:34:48'),
(24, 1, '2024-03-14 14:34:48'),
(25, 1, '2024-03-14 14:34:49'),
(26, 1, '2024-03-14 14:34:49'),
(27, 1, '2024-03-14 14:34:49'),
(28, 1, '2024-03-14 14:34:49'),
(29, 1, '2024-03-14 14:34:49'),
(30, 1, '2024-03-14 14:34:49'),
(31, 1, '2024-03-14 14:34:49'),
(32, 1, '2024-03-14 14:34:49'),
(33, 1, '2024-03-14 14:34:49'),
(34, 1, '2024-03-14 14:34:49'),
(35, 1, '2024-03-14 14:34:50'),
(36, 1, '2024-03-14 14:34:50'),
(37, 1, '2024-03-14 14:34:50'),
(38, 1, '2024-03-14 14:34:50'),
(39, 1, '2024-03-14 14:34:50'),
(40, 1, '2024-03-14 14:34:50'),
(41, 1, '2024-03-14 14:34:51'),
(42, 1, '2024-03-14 14:34:51'),
(43, 1, '2024-03-14 14:34:51'),
(44, 1, '2024-03-14 14:34:51'),
(45, 1, '2024-03-14 14:34:51'),
(46, 1, '2024-03-14 14:34:51'),
(47, 1, '2024-03-14 14:34:51'),
(48, 1, '2024-03-14 14:34:51'),
(49, 1, '2024-03-14 14:34:51'),
(50, 1, '2024-03-14 14:34:51'),
(51, 1, '2024-03-14 14:34:51'),
(52, 1, '2024-03-14 14:34:51'),
(53, 1, '2024-03-14 14:34:51'),
(54, 1, '2024-03-14 14:34:51'),
(55, 1, '2024-03-14 14:36:43'),
(56, 1, '2024-03-14 14:37:15'),
(57, 1, '2024-03-14 14:37:15'),
(58, 1, '2024-03-14 14:37:15'),
(59, 1, '2024-03-14 14:37:15'),
(60, 1, '2024-03-14 14:37:15'),
(61, 1, '2024-03-14 14:37:15'),
(62, 1, '2024-03-14 14:37:16'),
(63, 1, '2024-03-14 14:37:16'),
(64, 1, '2024-03-14 14:37:16'),
(65, 1, '2024-03-14 14:37:16'),
(66, 1, '2024-03-14 14:37:16'),
(67, 1, '2024-03-14 14:37:16'),
(68, 1, '2024-03-14 14:37:16'),
(69, 1, '2024-03-14 14:37:16'),
(70, 1, '2024-03-14 14:37:16'),
(71, 1, '2024-03-14 14:38:09'),
(72, 1, '2024-03-14 14:39:35'),
(73, 1, '2024-03-14 14:41:03'),
(74, 1, '2024-03-14 14:41:31'),
(75, 1, '2024-03-14 14:45:48'),
(76, 1, '2024-03-14 17:03:49'),
(77, 1, '2024-03-14 17:06:05'),
(78, 1, '2024-03-14 17:07:29'),
(79, 1, '2024-03-14 17:08:47'),
(80, 1, '2024-03-14 17:10:09'),
(81, 1, '2024-03-14 17:12:33'),
(82, 1, '2024-03-14 17:14:40'),
(83, 1, '2024-03-14 17:16:14'),
(84, 1, '2024-03-14 17:19:37'),
(85, 1, '2024-03-14 17:20:48'),
(86, 1, '2024-03-14 17:21:40'),
(87, 1, '2024-03-14 17:25:15'),
(88, 1, '2024-03-14 17:26:55'),
(89, 1, '2024-03-14 17:29:19'),
(90, 1, '2024-03-14 17:30:19'),
(91, 1, '2024-03-14 17:32:06'),
(92, 1, '2024-03-14 17:33:26'),
(93, 1, '2024-03-14 17:39:33'),
(94, 1, '2024-03-14 18:40:09'),
(95, 1, '2024-03-14 18:42:38'),
(96, 1, '2024-03-14 18:42:38'),
(97, 1, '2024-03-14 18:42:38'),
(98, 1, '2024-03-14 18:43:02'),
(99, 1, '2024-03-14 18:43:06'),
(100, 1, '2024-03-14 18:44:32'),
(101, 1, '2024-03-14 19:36:27'),
(102, 1, '2024-03-14 19:43:20'),
(103, 1, '2024-03-14 21:10:25'),
(104, 1, '2024-03-14 21:22:23'),
(105, 1, '2024-03-14 21:26:42'),
(106, 1, '2024-03-14 21:27:13'),
(107, 1, '2024-03-14 21:30:47'),
(108, 1, '2024-03-15 12:13:02'),
(109, 1, '2024-03-15 12:13:37'),
(110, 1, '2024-03-15 12:13:46'),
(111, 1, '2024-03-15 12:16:04'),
(112, 1, '2024-03-15 12:16:06'),
(113, 1, '2024-03-15 12:18:39'),
(114, 1, '2024-03-15 12:18:41'),
(115, 33, '2024-03-15 14:22:28'),
(116, 33, '2024-03-15 14:22:49'),
(117, 33, '2024-03-15 14:25:56'),
(118, 37, '2024-03-15 15:42:34'),
(119, 38, '2024-03-15 16:12:59'),
(120, 33, '2024-03-15 18:04:09'),
(121, 33, '2024-03-15 18:04:25'),
(122, 33, '2024-03-15 18:04:30'),
(123, 33, '2024-03-15 18:04:39');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `prodId` int(11) NOT NULL,
  `prodName` varchar(100) NOT NULL,
  `prodDescription` varchar(255) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `price` double NOT NULL,
  `quantityAvail` int(11) NOT NULL,
  `avgRating` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`prodId`, `prodName`, `prodDescription`, `categoryId`, `price`, `quantityAvail`, `avgRating`) VALUES
(1, 'The Original', 'The ultimate thin crust pizza – brushed with garlic-infused extra-virgin olive oil, covered with mozzarella cheese, traditional tomato sauce, freshly grated Parmesan cheese and herbs.', 1, 17.99, 43, 5),
(2, 'The Rodger', 'The Original with roasted garlic and sautéed mushrooms. Finished with romano and a hint of cayenne.', 1, 24.48, 49, 4.5),
(3, 'Pizza alla Greca', 'No mozzarella, with feta cheese, black olives, onions, parmesan and herbs.', 1, 23.48, 50, 4),
(4, 'Pizza Tutto Carne', 'For meat lovers, our special blend of peperoni, salami and homemade meatballs', 1, 25.48, 50, 5),
(5, 'The Pomodoro', 'Sesame seed edged crust with sun dried tomatoes, black olives, feta and fresh garlic', 1, 27.48, 50, 5),
(6, 'The Lombardia', 'Poppy seed edged crust with sun dried tomatoes and gorgonzola cheese', 1, 24.98, 50, 4.5),
(7, 'The Vegan Original', 'A dairy free version of the Original Pizza with our own vegan ricotta and vegan parmesan', 1, 17.99, 47, 4.33333),
(8, 'The Maritimer', 'Our Original Pizza classically topped with mushrooms, green peppers and 2Boys pepperoni.', 6, 24.48, 50, 5),
(9, 'The Spinach One', 'Our Original Pizza topped with baby spinach, arugula and cheddar.', 6, 24.48, 50, 5),
(10, 'The Berkeley', 'Our Original Pizza topped with spinach, feta and our vegan portobello sausage', 6, 25.48, 50, 5),
(11, 'Bianco in Stephano', 'A thin crust brushed with garlic-infused extra-virgin olive oil, edged with cornmeal and layered with mozzarella, onions, ricotta cheese, parsley, freshly grated Parmesan, Romano cheese, fresh tomatoes, herbs and a squeeze of lemon.', 7, 24.48, 50, 0),
(12, 'Clam Pie Marinato', 'A thin crust brushed with garlic-infused extra-virgin olive oil, edged with cornmeal and layered with mozzarella, covered with baby clams marinated in extra-virgin olive oil, fresh parsley and garlic, freshly grated Parmesan and herbs.', 7, 25.48, 48, 5),
(13, 'Pizza di Tonno', 'A thin crust brushed with extra virgin olive oil and whole grain mustard, topped with mozzarella, marinated skipjack tuna, capers, parmesan and Romano cheeses, sliced tomatoes and black pepper', 7, 25.48, 49, 0),
(14, 'Pizza all Siciliana', 'A thick rectangular crust brushed with garlic-infused extra-virgin olive oil, filled with crushed imported Italian plum tomatoes, spices, fresh garlic, freshly grated Parmesan, mozzarella and Romano cheeses.', 7, 20.48, 49, 4),
(15, 'The Veg Hero', 'Mozzarella, cheddar, onion, tomato, romaine & mayo.', 2, 6.99, 50, 0),
(16, 'The Salami Hero', 'Spanish salami, mozzarella, cheddar, onion, tomato, romaine & mayo', 2, 7.99, 47, 5),
(17, 'The Spicy Peperoni Hero', 'Peperoni, mozzarella, cheddar, onion, tomato, romaine & mayo', 2, 7.99, 46, 3),
(18, 'The Pep/Sal Hero', 'Peperoni, salami, mozzarella, cheddar, tomato, onion, romaine & mayo', 2, 7.99, 49, 4),
(19, 'Sal’s Meatball Hero', 'Sliced meatballs, mozzarella, our tomato sauce, parmesan, onions, olives & mayo', 2, 7.99, 49, 5),
(20, 'Sal’s Tuna Melt', 'Marinated tuna, mozzarella, tomato, onion, romaine & mayo', 2, 7.99, 48, 4),
(21, 'Sal’s Roasted Ham Hero', 'Oven roasted ham, smoked mozzarella, tomato & mayo, with sautéed mushrooms and onions', 2, 7.99, 50, 0),
(22, 'Sal’s Roasted Portobello Melt', 'Sliced roasted portobello mushrooms, mozzarella, our tomato sauce, parmesan, onions, olives & mayo', 2, 7.99, 50, 0),
(23, 'Caesar', 'Romaine, housemade dressing, parm, croutons, lemon.', 3, 7.99, 49, 4),
(24, 'Garden', 'Mixed greens, dried cranberries, almonds, carrot, balsamic dressing.', 3, 7.99, 49, 5),
(25, 'Cola', 'Coke', 4, 2.25, 49, 5),
(26, 'Water', 'Bottled', 4, 2.25, 49, 5),
(27, 'Sparkling water', 'Canned', 4, 2.5, 49, 5),
(28, 'Fleur de sel cheese cake', 'Made fresh in house. Chocolate, sea salt.', 5, 7.49, 49, 5),
(29, 'Cannoli', 'A crisp Sicilian pastry shell stuffed with sweetened ricotta cheese and shaved chocolate, then dipped in toasted almonds.', 5, 3.49, 45, 3);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `reviewId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `rating` double NOT NULL,
  `reviewText` varchar(255) NOT NULL,
  `reviewDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`reviewId`, `productId`, `userId`, `rating`, `reviewText`, `reviewDate`) VALUES
(1, 1, 1, 5, 'Absolutely delicious! The thin crust is perfect and the garlic flavor is divine.', '2020-04-01'),
(2, 1, 2, 5, 'Always my go-to pizza! Cannot get enough of it.', '2021-05-01'),
(3, 2, 3, 4, 'The roasted garlic adds such a rich flavor, and the sautéed mushrooms are a perfect pairing.', '2021-06-01'),
(4, 2, 3, 5, 'Delicious combination of flavors, definitely a favorite!', '2020-06-01'),
(5, 3, 3, 4, 'Love the Greek twist with feta cheese and olives! So tasty and unique.', '2021-06-01'),
(6, 3, 4, 4, 'A great option for those looking for something different. The flavors blend perfectly.', '2021-07-01'),
(7, 4, 4, 5, 'Meat lovers dream! The blend of pepperoni, sausage, and ham is so satisfying.', '2021-07-21'),
(8, 4, 5, 5, 'Loaded with meat and flavor, this pizza never disappoints', '2021-07-21'),
(9, 5, 5, 5, 'The sun-dried tomatoes add a burst of flavor to every bite. A must-try!', '2021-07-21'),
(10, 5, 6, 5, 'Sesame seed crust is a nice touch, and the sun-dried tomatoes are delicious.', '2021-08-21'),
(11, 6, 7, 4, 'The poppy seed crust is unique and delicious! Love the sun-dried tomatoes too.', '2021-08-31'),
(12, 6, 8, 5, 'Great combination of flavors, always a hit at our gatherings.', '2021-09-21'),
(13, 7, 8, 5, 'Amazing dairy-free option! Tastes just as good as the original.', '2021-09-22'),
(14, 7, 9, 5, 'So happy to find a dairy-free pizza that tastes this good', '2021-09-25'),
(15, 8, 1, 5, 'Classic toppings done right! Mushrooms add a nice earthy flavor.', '2021-09-25'),
(16, 8, 2, 5, 'Always a crowd-pleaser, cannot go wrong with this choice.', '2021-09-25'),
(17, 9, 3, 5, 'Love the freshness of the baby spinach and arugula on this pizza!', '2021-09-25'),
(18, 9, 4, 5, 'A healthier option without sacrificing flavor. Definitely recommend.', '2021-09-25'),
(19, 10, 5, 5, 'Spinach, feta, and olives make for a delicious combination. One of my favorites!', '2021-09-25'),
(20, 10, 6, 5, 'Perfect for those who love Mediterranean flavors. Always a hit.', '2021-09-25'),
(27, 103, 1, 5, 'Great', '2024-03-14'),
(28, 103, 1, 5, 'Awesome', '2024-03-14'),
(29, 104, 1, 5, 'Superb.', '2024-03-14'),
(30, 105, 1, 4, 'Alrighty.', '2024-03-14'),
(31, 17, 1, 3, 'Meh', '2024-03-14'),
(32, 23, 1, 4, 'Pretty good.', '2024-03-15'),
(33, 28, 1, 5, 'Awesome.', '2024-03-15'),
(34, 19, 33, 5, 'So good.', '2024-03-15'),
(35, 29, 33, 5, 'Amazing.', '2024-03-15'),
(36, 18, 37, 4, 'Decent.', '2024-03-15'),
(37, 20, 37, 4, 'My favorite.', '2024-03-15'),
(38, 18, 37, 4, 'Decent.', '2024-03-15'),
(39, 20, 37, 4, 'My favorite.', '2024-03-15'),
(40, 24, 37, 5, 'Awesome.', '2024-03-15'),
(41, 25, 37, 5, 'Super good.', '2024-03-15'),
(42, 27, 37, 5, 'Hits.', '2024-03-15'),
(43, 26, 38, 5, 'refreshing.', '2024-03-15'),
(44, 12, 38, 5, 'Nice', '2024-03-15'),
(45, 14, 38, 4, 'Could be better', '2024-03-15'),
(46, 16, 33, 5, 'Not bad', '2024-03-15'),
(47, 1, 33, 5, 'Pretty good', '2024-03-15'),
(48, 7, 33, 3, 'Watery', '2024-03-15'),
(49, 29, 33, 1, 'Not sweet', '2024-03-15');

--
-- Triggers `reviews`
--
DELIMITER $$
CREATE TRIGGER `update_average_rating` AFTER INSERT ON `reviews` FOR EACH ROW BEGIN
UPDATE products AS p
INNER JOIN (
    SELECT productId, AVG(rating) AS avg_rating
    FROM reviews
    GROUP BY productId
) AS r ON p.prodId = r.productId
SET p.avgRating = r.avg_rating;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`addressId`);

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`billingId`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryId`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customerId`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`deliveryId`);

--
-- Indexes for table `deliveryagent`
--
ALTER TABLE `deliveryagent`
  ADD PRIMARY KEY (`deliveryAgentId`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`orderDetailId`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`prodId`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`reviewId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `addressId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `billing`
--
ALTER TABLE `billing`
  MODIFY `billingId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `deliveryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `deliveryagent`
--
ALTER TABLE `deliveryagent`
  MODIFY `deliveryAgentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `orderDetailId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=291;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `prodId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `reviewId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
