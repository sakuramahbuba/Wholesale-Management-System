-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2017 at 09:30 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wholesale`
--

-- --------------------------------------------------------

--
-- Table structure for table `bought_from`
--

CREATE TABLE `bought_from` (
  `supplier_id` int(11) NOT NULL,
  `stock_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bought_from`
--

INSERT INTO `bought_from` (`supplier_id`, `stock_ID`) VALUES
(9001, 1),
(9002, 2),
(9003, 3),
(9004, 4);

-- --------------------------------------------------------

--
-- Table structure for table `buying_payment`
--

CREATE TABLE `buying_payment` (
  `buy_pay_no` int(11) NOT NULL,
  `buy_unit_price` int(11) NOT NULL,
  `buy_quantity` int(11) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buying_payment`
--

INSERT INTO `buying_payment` (`buy_pay_no`, `buy_unit_price`, `buy_quantity`, `paid_amount`, `supplier_id`) VALUES
(3001, 60, 100, 6000, 9001),
(3002, 30, 90, 2600, 9002),
(3003, 30, 60, 1800, 9003),
(3004, 5, 1000, 4900, 9004);

-- --------------------------------------------------------

--
-- Table structure for table `buying_provides`
--

CREATE TABLE `buying_provides` (
  `Stock_ID` int(30) DEFAULT NULL,
  `buy_pay_no` int(30) DEFAULT NULL,
  `report_ID` int(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buying_provides`
--

INSERT INTO `buying_provides` (`Stock_ID`, `buy_pay_no`, `report_ID`) VALUES
(1, 3001, 1),
(2, 3002, 1),
(3, 3003, 1),
(4, 3004, 2);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(30) NOT NULL,
  `customer_name` varchar(30) NOT NULL,
  `customer_address` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `customer_address`) VALUES
(1001, 'Sazzad', 'Cuet'),
(1002, 'Mishad', 'North hall'),
(1003, 'Fahad', 'Room 125'),
(1004, 'Tanvir', 'Room 225'),
(1005, 'Tishad', 'Room 203');

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `manager_ID` int(11) NOT NULL,
  `manager_name` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`manager_ID`, `manager_name`, `password`) VALUES
(1404019, 'antor', '19');

-- --------------------------------------------------------

--
-- Table structure for table `selling_payment`
--

CREATE TABLE `selling_payment` (
  `sell_pay_no` int(30) NOT NULL,
  `sell_unit_price` int(30) NOT NULL,
  `sell_quantity` int(11) NOT NULL,
  `received_amount` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `selling_payment`
--

INSERT INTO `selling_payment` (`sell_pay_no`, `sell_unit_price`, `sell_quantity`, `received_amount`, `customer_id`) VALUES
(5001, 80, 5, 400, 1001),
(5002, 50, 5, 240, 1002),
(5003, 40, 10, 400, 1003),
(5004, 8, 100, 800, 1004),
(5005, 25, 10, 250, 1001);

-- --------------------------------------------------------

--
-- Table structure for table `selling_provides`
--

CREATE TABLE `selling_provides` (
  `Stock_ID` int(20) DEFAULT NULL,
  `sell_pay_no` int(20) DEFAULT NULL,
  `report_ID` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `selling_provides`
--

INSERT INTO `selling_provides` (`Stock_ID`, `sell_pay_no`, `report_ID`) VALUES
(1, 5001, 1),
(2, 5002, 1),
(3, 5003, 1),
(4, 5004, 2),
(4, 5005, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sold_to`
--

CREATE TABLE `sold_to` (
  `stock_ID` int(20) NOT NULL,
  `customer_ID` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sold_to`
--

INSERT INTO `sold_to` (`stock_ID`, `customer_ID`) VALUES
(2, 1002),
(3, 1003),
(4, 1004),
(4, 1001);

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `Stock_ID` int(11) NOT NULL,
  `Stock_name` varchar(30) NOT NULL,
  `Stock_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`Stock_ID`, `Stock_name`, `Stock_quantity`) VALUES
(1, 'Rice', 95),
(2, 'Almond', 85),
(3, 'potato', 50),
(4, 'Paper', 890);

-- --------------------------------------------------------

--
-- Table structure for table `stock_report`
--

CREATE TABLE `stock_report` (
  `report_ID` int(11) NOT NULL,
  `report_date` date NOT NULL,
  `manager_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_report`
--

INSERT INTO `stock_report` (`report_ID`, `report_date`, `manager_ID`) VALUES
(1, '2017-08-01', 1404019),
(2, '2017-09-01', 1404019),
(3, '2017-10-03', 1404019),
(4, '2017-11-03', 1404019);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(30) NOT NULL,
  `supplier_name` varchar(30) NOT NULL,
  `supplier_address` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `supplier_name`, `supplier_address`) VALUES
(9001, 'Mishad', 'Dhaka'),
(9002, 'Sojib', 'dhaka'),
(9003, 'Sayem', 'Moymonsingh'),
(9004, 'Shariar', 'Gazipur'),
(9005, 'RAJU', 'Room 216');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bought_from`
--
ALTER TABLE `bought_from`
  ADD KEY `stock_ID` (`stock_ID`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `buying_payment`
--
ALTER TABLE `buying_payment`
  ADD PRIMARY KEY (`buy_pay_no`),
  ADD KEY `buy_pay_no` (`buy_pay_no`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `buying_provides`
--
ALTER TABLE `buying_provides`
  ADD KEY `Stock_ID` (`Stock_ID`),
  ADD KEY `report_ID` (`report_ID`),
  ADD KEY `buy_pay_no` (`buy_pay_no`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`manager_ID`),
  ADD KEY `manager_ID` (`manager_ID`);

--
-- Indexes for table `selling_payment`
--
ALTER TABLE `selling_payment`
  ADD PRIMARY KEY (`sell_pay_no`),
  ADD KEY `sell_pay_no` (`sell_pay_no`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `selling_provides`
--
ALTER TABLE `selling_provides`
  ADD KEY `Stock_ID` (`Stock_ID`),
  ADD KEY `report_ID` (`report_ID`),
  ADD KEY `sell_pay_no` (`sell_pay_no`);

--
-- Indexes for table `sold_to`
--
ALTER TABLE `sold_to`
  ADD KEY `stock_ID` (`stock_ID`),
  ADD KEY `customer_ID` (`customer_ID`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`Stock_ID`),
  ADD KEY `Stock_ID` (`Stock_ID`);

--
-- Indexes for table `stock_report`
--
ALTER TABLE `stock_report`
  ADD PRIMARY KEY (`report_ID`),
  ADD KEY `manager_ID` (`manager_ID`),
  ADD KEY `manager_ID_2` (`manager_ID`),
  ADD KEY `report_ID` (`report_ID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buying_payment`
--
ALTER TABLE `buying_payment`
  MODIFY `buy_pay_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3005;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1006;
--
-- AUTO_INCREMENT for table `selling_payment`
--
ALTER TABLE `selling_payment`
  MODIFY `sell_pay_no` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5006;
--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `Stock_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `stock_report`
--
ALTER TABLE `stock_report`
  MODIFY `report_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9006;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `bought_from`
--
ALTER TABLE `bought_from`
  ADD CONSTRAINT `bought_from_ibfk_1` FOREIGN KEY (`stock_ID`) REFERENCES `stock` (`Stock_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bought_from_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `buying_payment`
--
ALTER TABLE `buying_payment`
  ADD CONSTRAINT `buying_payment_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `buying_provides`
--
ALTER TABLE `buying_provides`
  ADD CONSTRAINT `buying_provides_ibfk_2` FOREIGN KEY (`Stock_ID`) REFERENCES `stock` (`Stock_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `buying_provides_ibfk_3` FOREIGN KEY (`report_ID`) REFERENCES `stock_report` (`report_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `buying_provides_ibfk_4` FOREIGN KEY (`buy_pay_no`) REFERENCES `buying_payment` (`buy_pay_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `selling_payment`
--
ALTER TABLE `selling_payment`
  ADD CONSTRAINT `selling_payment_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `selling_provides`
--
ALTER TABLE `selling_provides`
  ADD CONSTRAINT `selling_provides_ibfk_1` FOREIGN KEY (`Stock_ID`) REFERENCES `stock` (`Stock_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `selling_provides_ibfk_2` FOREIGN KEY (`report_ID`) REFERENCES `stock_report` (`report_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `selling_provides_ibfk_3` FOREIGN KEY (`sell_pay_no`) REFERENCES `selling_payment` (`sell_pay_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sold_to`
--
ALTER TABLE `sold_to`
  ADD CONSTRAINT `sold_to_ibfk_1` FOREIGN KEY (`stock_ID`) REFERENCES `stock` (`Stock_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sold_to_ibfk_2` FOREIGN KEY (`customer_ID`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stock_report`
--
ALTER TABLE `stock_report`
  ADD CONSTRAINT `stock_report_ibfk_1` FOREIGN KEY (`manager_ID`) REFERENCES `manager` (`manager_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
