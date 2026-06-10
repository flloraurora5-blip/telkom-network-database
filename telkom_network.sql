-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 10, 2026 at 07:14 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `telkom_network`
--

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_logs`
--

CREATE TABLE `maintenance_logs` (
  `log_id` int NOT NULL,
  `asset_id` int NOT NULL,
  `maintenance_date` date NOT NULL,
  `technician_name` varchar(100) NOT NULL,
  `cost` decimal(12,2) NOT NULL,
  `action_taken` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `maintenance_logs`
--

INSERT INTO `maintenance_logs` (`log_id`, `asset_id`, `maintenance_date`, `technician_name`, `cost`, `action_taken`) VALUES
(1, 3, '2026-06-01', 'Rahmat Hidayat', '4500000.00', 'RAM upgrade and thermal paste replacement on core server rack.'),
(2, 2, '2026-06-05', 'Ahmad Fauzi', '1250000.00', 'Splicing broken fiber optic cable lines due to road construction.'),
(3, 4, '2026-06-08', 'Siti Aminah', '850000.00', 'Firmware update and port configuration cleaning.');

-- --------------------------------------------------------

--
-- Table structure for table `operational_budgets`
--

CREATE TABLE `operational_budgets` (
  `budget_id` int NOT NULL,
  `regional_zone` varchar(50) NOT NULL,
  `budget_period` varchar(20) NOT NULL,
  `allocated_budget` decimal(15,2) NOT NULL,
  `technician_payroll` decimal(15,2) NOT NULL,
  `remaining_budget` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `operational_budgets`
--

INSERT INTO `operational_budgets` (`budget_id`, `regional_zone`, `budget_period`, `allocated_budget`, `technician_payroll`, `remaining_budget`) VALUES
(1, 'Telkom Regional 2 Jakarta', 'June 2026', '500000000.00', '185000000.00', '315000000.00'),
(2, 'Telkom Regional 3 Jawa Barat', 'June 2026', '400000000.00', '140000000.00', '260000000.00');

-- --------------------------------------------------------

--
-- Table structure for table `telkom_assets`
--

CREATE TABLE `telkom_assets` (
  `asset_id` int NOT NULL,
  `asset_name` varchar(100) NOT NULL,
  `asset_type` varchar(50) NOT NULL,
  `regional_zone` varchar(50) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `telkom_assets`
--

INSERT INTO `telkom_assets` (`asset_id`, `asset_name`, `asset_type`, `regional_zone`, `status`) VALUES
(1, 'Core Router Juniper MX960', 'Core Router', 'Telkom Regional 2 Jakarta', 'Active'),
(2, 'Optical Distribution Point ODP-TGR-01', 'Fiber Optic Distribution', 'Telkom Regional 2 Jakarta', 'Active'),
(3, 'Data Center Server HP ProLiant DL380', 'Data Center Server', 'Telkom Regional 3 Jawa Barat', 'Under Maintenance'),
(4, 'Core Switch Cisco Nexus 9000', 'Core Switch', 'Telkom Regional 2 Jakarta', 'Active'),
(5, 'GPON OLT Alcatel-Lucent 7360', 'Fiber Optic Distribution', 'Telkom Regional 3 Jawa Barat', 'Broken');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `maintenance_logs`
--
ALTER TABLE `maintenance_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `asset_id` (`asset_id`);

--
-- Indexes for table `operational_budgets`
--
ALTER TABLE `operational_budgets`
  ADD PRIMARY KEY (`budget_id`);

--
-- Indexes for table `telkom_assets`
--
ALTER TABLE `telkom_assets`
  ADD PRIMARY KEY (`asset_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `maintenance_logs`
--
ALTER TABLE `maintenance_logs`
  MODIFY `log_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `operational_budgets`
--
ALTER TABLE `operational_budgets`
  MODIFY `budget_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `telkom_assets`
--
ALTER TABLE `telkom_assets`
  MODIFY `asset_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `maintenance_logs`
--
ALTER TABLE `maintenance_logs`
  ADD CONSTRAINT `maintenance_logs_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `telkom_assets` (`asset_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
