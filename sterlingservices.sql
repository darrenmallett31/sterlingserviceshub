-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 21, 2017 at 03:06 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sterlingservices`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `code` varchar(16) NOT NULL,
  `description` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `code`, `description`) VALUES
(1, 'ACCOM', 'Accomodation'),
(2, 'LAB', 'Labour'),
(3, 'MAT', 'Materials'),
(4, 'PLT', 'Plant'),
(5, 'WST', 'Waste'),
(6, 'TRANS', 'Transport'),
(7, 'OTH', 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `shortname` varchar(32) NOT NULL,
  `type` enum('Domestic-Private','Commercial-Retail','Education-Direct','Local Authority') NOT NULL,
  `companyregno` varchar(32) NOT NULL,
  `website` varchar(128) DEFAULT NULL,
  `quote_email` varchar(128) DEFAULT NULL,
  `kpi_quote_rtnd_by` int(11) DEFAULT NULL,
  `experian_score` varchar(32) NOT NULL,
  `credit_score` varchar(32) NOT NULL,
  `credit_hard_limit` int(11) NOT NULL,
  `credit_soft_limit` int(11) NOT NULL,
  `credit_outstanding` int(11) NOT NULL,
  `terms_id` int(11) NOT NULL,
  `kpi_agreed` tinyint(1) NOT NULL,
  `quote_breakdown_rqrd` tinyint(1) NOT NULL,
  `quote_rtn_trigger` int(11) NOT NULL,
  `days_to_review` int(11) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `employee_id`, `name`, `shortname`, `type`, `companyregno`, `website`, `quote_email`, `kpi_quote_rtnd_by`, `experian_score`, `credit_score`, `credit_hard_limit`, `credit_soft_limit`, `credit_outstanding`, `terms_id`, `kpi_agreed`, `quote_breakdown_rqrd`, `quote_rtn_trigger`, `days_to_review`, `date_updated`) VALUES
(1, 1, 'Test Customer', 'Test', 'Domestic-Private', 'NEWREGNO', 'www.website.co.uk', 'foo@bar.com', 31, 'EXPSCORE', 'CRDSCORE', 0, 0, 0, 1, 1, 0, 31, 7, '2017-03-14 12:11:53'),
(2, 1, 'Another Customer', 'Anh', 'Domestic-Private', '001', 'www.asite.co.uk', 'foo@address.com', 31, 'EXP', 'CRD', 10000, 5000, 1250, 1, 1, 0, 15, 14, '2017-03-14 12:15:03'),
(3, 3, 'Yet another Customer', 'Yet', 'Domestic-Private', 'YET001', 'www.yet.co.uk', 'yet@yet.com', 7, 'BETTERSCORE', 'YETSCORE', 0, 0, 0, 1, 1, 0, 13, 5, '2017-03-14 14:29:04');

--
-- Triggers `customer`
--
DELIMITER $$
CREATE TRIGGER `insert_customer` AFTER INSERT ON `customer` FOR EACH ROW BEGIN
      INSERT INTO customer_history (
       customer_id,
       employee_id,
       name,
       shortname,
       companyregno,
       website,
       quote_email,
       kpi_quote_rtnd_by,
       experian_score,
       credit_score,
       credit_hard_limit,
       credit_soft_limit,
       credit_outstanding,
       terms_id,
       kpi_agreed,
       quote_breakdown_rqrd,
       quote_rtn_trigger,
       days_to_review
      ) VALUES (
       NEW.id,
       NEW.employee_id,
       NEW.name,
       NEW.shortname,
       NEW.companyregno,
       NEW.website,
       NEW.quote_email,
       NEW.kpi_quote_rtnd_by,
       NEW.experian_score,
       NEW.credit_score,
       NEW.credit_hard_limit,
       NEW.credit_soft_limit,
       NEW.credit_outstanding,
       NEW.terms_id,
       NEW.kpi_agreed,
       NEW.quote_breakdown_rqrd,
       NEW.quote_rtn_trigger,
       NEW.days_to_review
      );
     END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_customer` AFTER UPDATE ON `customer` FOR EACH ROW BEGIN
      INSERT INTO customer_history (
       customer_id,
       employee_id,
       name,
       shortname,
       companyregno,
       website,
       quote_email,
       kpi_quote_rtnd_by,
       experian_score,
       credit_score,
       credit_hard_limit,
       credit_soft_limit,
       credit_outstanding,
       terms_id,
       kpi_agreed,
       quote_breakdown_rqrd,
       quote_rtn_trigger,
       days_to_review
      ) VALUES (
       NEW.id,
       NEW.employee_id,
       NEW.name,
       NEW.shortname,
       NEW.companyregno,
       NEW.website,
       NEW.quote_email,
       NEW.kpi_quote_rtnd_by,
       NEW.experian_score,
       NEW.credit_score,
       NEW.credit_hard_limit,
       NEW.credit_soft_limit,
       NEW.credit_outstanding,
       NEW.terms_id,
       NEW.kpi_agreed,
       NEW.quote_breakdown_rqrd,
       NEW.quote_rtn_trigger,
       NEW.days_to_review
      );
     END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_address`
--

CREATE TABLE `customer_address` (
  `customer_id` int(11) NOT NULL,
  `type` enum('Billing','Trading','Other1','Other2') NOT NULL,
  `address1` varchar(32) NOT NULL,
  `address2` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `county` varchar(32) DEFAULT NULL,
  `postcode` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer_contact`
--

CREATE TABLE `customer_contact` (
  `customer_id` int(11) NOT NULL,
  `type` enum('Main','Accounts','Other1','Other2') NOT NULL,
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `tel_no` varchar(32) NOT NULL,
  `email_address` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer_history`
--

CREATE TABLE `customer_history` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `shortname` varchar(32) NOT NULL,
  `type` enum('Domestic-Private','Commercial-Retail','Education-Direct','Local Authority') NOT NULL,
  `companyregno` varchar(32) NOT NULL,
  `website` varchar(128) DEFAULT NULL,
  `quote_email` varchar(128) DEFAULT NULL,
  `kpi_quote_rtnd_by` int(11) DEFAULT NULL,
  `experian_score` varchar(32) NOT NULL,
  `credit_score` varchar(32) NOT NULL,
  `credit_hard_limit` int(11) NOT NULL,
  `credit_soft_limit` int(11) NOT NULL,
  `credit_outstanding` int(11) NOT NULL,
  `terms_id` int(11) NOT NULL,
  `kpi_agreed` tinyint(1) NOT NULL,
  `quote_breakdown_rqrd` tinyint(1) NOT NULL,
  `quote_rtn_trigger` int(11) NOT NULL,
  `days_to_review` int(11) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_history`
--

INSERT INTO `customer_history` (`id`, `customer_id`, `employee_id`, `name`, `shortname`, `type`, `companyregno`, `website`, `quote_email`, `kpi_quote_rtnd_by`, `experian_score`, `credit_score`, `credit_hard_limit`, `credit_soft_limit`, `credit_outstanding`, `terms_id`, `kpi_agreed`, `quote_breakdown_rqrd`, `quote_rtn_trigger`, `days_to_review`, `date_updated`) VALUES
(1, 1, 1, 'Test Customer', 'Test', 'Domestic-Private', 'REGNO', 'www.website.co.uk', 'foo@bar.com', 14, 'EXPSCORE', 'CRDSCORE', 0, 0, 0, 1, 1, 0, 31, 7, '2017-03-14 12:11:53'),
(2, 1, 1, 'Test Customer', 'Test', 'Domestic-Private', 'NEWREGNO', 'www.website.co.uk', 'foo@bar.com', 14, 'EXPSCORE', 'CRDSCORE', 0, 0, 0, 1, 1, 0, 31, 7, '2017-03-14 12:13:54'),
(3, 2, 1, 'Another Customer', 'Anh', 'Domestic-Private', '001', 'www.asite.co.uk', 'foo@address.com', 14, 'EXP', 'CRD', 0, 0, 0, 1, 1, 0, 15, 14, '2017-03-14 12:15:03'),
(4, 2, 1, 'Another Customer', 'Anh', 'Domestic-Private', '001', 'www.asite.co.uk', 'foo@address.com', 7, 'EXP', 'CRD', 0, 0, 0, 1, 1, 0, 15, 14, '2017-03-14 12:16:41'),
(5, 1, 1, 'Test Customer', 'Test', 'Domestic-Private', 'NEWREGNO', 'www.website.co.uk', 'foo@bar.com', 31, 'EXPSCORE', 'CRDSCORE', 0, 0, 0, 1, 1, 0, 31, 7, '2017-03-14 12:17:25'),
(6, 2, 1, 'Another Customer', 'Anh', 'Domestic-Private', '001', 'www.asite.co.uk', 'foo@address.com', 31, 'EXP', 'CRD', 0, 0, 0, 1, 1, 0, 15, 14, '2017-03-14 12:17:25'),
(7, 3, 3, 'Yet another Customer', 'Yet', 'Domestic-Private', 'YET001', 'www.yet.co.uk', 'yet@yet.com', 7, 'EXP1', 'CRD1', 0, 0, 0, 1, 1, 0, 13, 5, '2017-03-14 14:29:04'),
(8, 3, 3, 'Yet another Customer', 'Yet', 'Domestic-Private', 'YET001', 'www.yet.co.uk', 'yet@yet.com', 7, 'BETTERSCORE', 'YETSCORE', 0, 0, 0, 1, 1, 0, 13, 5, '2017-03-14 14:30:01'),
(9, 2, 1, 'Another Customer', 'Anh', 'Domestic-Private', '001', 'www.asite.co.uk', 'foo@address.com', 31, 'EXP', 'CRD', 10000, 5000, 1250, 1, 1, 0, 15, 14, '2017-03-19 11:21:53');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_option`
--

CREATE TABLE `delivery_option` (
  `id` int(11) NOT NULL,
  `description` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `delivery_option`
--

INSERT INTO `delivery_option` (`id`, `description`) VALUES
(1, 'Courier'),
(2, 'Parcel Force'),
(3, 'Royal Mail');

-- --------------------------------------------------------

--
-- Table structure for table `division`
--

CREATE TABLE `division` (
  `id` int(11) NOT NULL,
  `description` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `division`
--

INSERT INTO `division` (`id`, `description`) VALUES
(1, 'Administrators'),
(2, 'Office Admin'),
(3, 'Finance'),
(4, 'Projects'),
(5, 'Maintenance'),
(6, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_manager` tinyint(1) DEFAULT NULL,
  `emp_no` varchar(32) NOT NULL,
  `job_title` varchar(64) NOT NULL,
  `job_role` varchar(64) NOT NULL,
  `manager_id` int(11) NOT NULL,
  `division_id` int(11) NOT NULL,
  `team_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `user_id`, `is_manager`, `emp_no`, `job_title`, `job_role`, `manager_id`, `division_id`, `team_id`) VALUES
(1, 1, 1, 'EMP001', 'Boss Man', 'Pays everyone...', 1, 1, NULL),
(2, 2, 0, 'EMP002', 'Pleb', 'Does nothing...', 1, 4, 5),
(3, 3, 0, 'EMP003', 'Another Pleb', 'Works from Home...', 1, 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `employee_address`
--

CREATE TABLE `employee_address` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `address1` varchar(32) NOT NULL,
  `address2` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `county` varchar(32) DEFAULT NULL,
  `postcode` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_address`
--

INSERT INTO `employee_address` (`id`, `employee_id`, `address1`, `address2`, `city`, `county`, `postcode`) VALUES
(1, 1, '14 Main Street', 'Burton Salmon', 'Leeds', 'Yorkshire', 'LS25 5JS'),
(2, 2, '11 Montrose Close', 'Fearnhead', 'Warrington', 'Cheshire', 'WA2 0SD'),
(3, 3, 'The Castle', 'In the Bush', 'God Knows', 'Yorkshire', 'LS25 5JS');

-- --------------------------------------------------------

--
-- Table structure for table `employee_email`
--

CREATE TABLE `employee_email` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `type` enum('Work','Home','Other') NOT NULL,
  `address` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_email`
--

INSERT INTO `employee_email` (`id`, `employee_id`, `type`, `address`) VALUES
(1, 1, 'Work', 'dm@work.co.uk'),
(2, 1, 'Home', 'dm@home.co.uk'),
(3, 2, 'Work', 'gw@work.co.uk'),
(4, 2, 'Home', 'gw@home.co.uk'),
(5, 3, 'Work', 'dw@work.co.uk'),
(6, 3, 'Home', 'dw@home.co.uk'),
(7, 3, 'Other', 'dw@other.co.uk');

-- --------------------------------------------------------

--
-- Table structure for table `employee_telephone`
--

CREATE TABLE `employee_telephone` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `type` enum('Main','Work','Home','Mobile','Accounts','Other1','Other2') NOT NULL,
  `tel_no` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_telephone`
--

INSERT INTO `employee_telephone` (`id`, `employee_id`, `type`, `tel_no`) VALUES
(1, 1, 'Main', '111222222'),
(2, 1, 'Work', '222111111'),
(3, 3, 'Mobile', '333111111'),
(4, 3, 'Main', '222111111'),
(5, 2, 'Main', '222111111'),
(6, 2, 'Work', '222111112'),
(7, 2, 'Home', '222111113'),
(8, 2, 'Mobile', '222111114');

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `closed` tinyint(1) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`id`, `site_id`, `employee_id`, `status_id`, `closed`, `date_updated`) VALUES
(3, 2, 2, 1, 0, '2017-03-21 13:27:56');

--
-- Triggers `job`
--
DELIMITER $$
CREATE TRIGGER `insert_job` AFTER INSERT ON `job` FOR EACH ROW BEGIN
    INSERT INTO job_history (
      job_id,
      site_id,
      employee_id,
      status_id
    ) VALUES (
      NEW.id,
      NEW.site_id,
      NEW.employee_id,
      NEW.status_id
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_job` AFTER UPDATE ON `job` FOR EACH ROW BEGIN
    INSERT INTO job_history (
      job_id,
      site_id,
      employee_id,
      status_id
    ) VALUES (
      NEW.id,
      NEW.site_id,
      NEW.employee_id,
      NEW.status_id
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `job_history`
--

CREATE TABLE `job_history` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `job_history`
--

INSERT INTO `job_history` (`id`, `job_id`, `site_id`, `employee_id`, `status_id`, `date_updated`) VALUES
(5, 3, 2, 2, 1, '2017-03-21 13:27:56');

-- --------------------------------------------------------

--
-- Table structure for table `job_status`
--

CREATE TABLE `job_status` (
  `id` int(11) NOT NULL,
  `description` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `job_status`
--

INSERT INTO `job_status` (`id`, `description`) VALUES
(1, 'Status 1'),
(2, 'Status 2'),
(3, 'Status 3'),
(4, 'Status 4'),
(5, 'Status 5'),
(6, 'Status 6');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order`
--

CREATE TABLE `purchase_order` (
  `id` int(11) NOT NULL,
  `quote_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `purchase_order_number` varchar(64) NOT NULL,
  `category_id` int(11) NOT NULL,
  `supplier_budget` decimal(15,2) NOT NULL DEFAULT '0.00',
  `description` text,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_calloff`
--

CREATE TABLE `purchase_order_calloff` (
  `id` int(11) NOT NULL,
  `purchase_order_id` int(11) NOT NULL,
  `delivery_contact` varchar(32) DEFAULT NULL,
  `contact_tel_no` varchar(32) NOT NULL,
  `delivery_or_collection` enum('Delivery','Collection') NOT NULL,
  `pay_by` enum('Account','Credit Card','BACS') NOT NULL,
  `notes` text,
  `delivery_option_id` int(11) NOT NULL,
  `delivery_pickup_date` datetime DEFAULT NULL,
  `total_net_cost` decimal(15,2) NOT NULL DEFAULT '0.00',
  `vat_rate` int(6) DEFAULT NULL,
  `vat_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total_inc_vat` decimal(15,2) NOT NULL DEFAULT '0.00',
  `po_sent_date` datetime NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_line_item`
--

CREATE TABLE `purchase_order_line_item` (
  `id` int(11) NOT NULL,
  `purchase_order_calloff_id` int(11) NOT NULL,
  `description` varchar(64) NOT NULL,
  `cost_code` varchar(32) NOT NULL,
  `product_code` varchar(32) NOT NULL,
  `qty` int(5) NOT NULL,
  `rate` int(5) NOT NULL,
  `line_item_cost` decimal(15,2) NOT NULL DEFAULT '0.00',
  `days` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quote`
--

CREATE TABLE `quote` (
  `id` int(11) NOT NULL,
  `quote_option_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `status` enum('In-Progress','Accepted','Disabled') NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quote`
--

INSERT INTO `quote` (`id`, `quote_option_id`, `employee_id`, `status`, `date_updated`) VALUES
(2, 4, 2, 'In-Progress', '2017-03-21 13:40:35'),
(3, 4, 3, 'In-Progress', '2017-03-21 13:40:50');

--
-- Triggers `quote`
--
DELIMITER $$
CREATE TRIGGER `insert_quote` AFTER INSERT ON `quote` FOR EACH ROW BEGIN
    INSERT INTO quote_history (
      quote_id,
      quote_option_id,
      employee_id,
      status
    ) VALUES (
      NEW.id,
      NEW.quote_option_id,
      NEW.employee_id,
      NEW.status
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_quote` AFTER UPDATE ON `quote` FOR EACH ROW BEGIN
    INSERT INTO quote_history (
      quote_id,
      quote_option_id,
      employee_id,
      status
    ) VALUES (
      NEW.id,
      NEW.quote_option_id,
      NEW.employee_id,
      NEW.status
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `quote_history`
--

CREATE TABLE `quote_history` (
  `id` int(11) NOT NULL,
  `quote_id` int(11) NOT NULL,
  `quote_option_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `status` enum('In-Progress','Accepted','Disabled') NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quote_history`
--

INSERT INTO `quote_history` (`id`, `quote_id`, `quote_option_id`, `employee_id`, `status`, `date_updated`) VALUES
(2, 2, 4, 2, 'In-Progress', '2017-03-21 13:40:35'),
(3, 3, 4, 3, 'In-Progress', '2017-03-21 13:40:50');

-- --------------------------------------------------------

--
-- Table structure for table `quote_option`
--

CREATE TABLE `quote_option` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quote_option`
--

INSERT INTO `quote_option` (`id`, `employee_id`, `job_id`, `date_updated`) VALUES
(4, 2, 3, '2017-03-21 13:29:14');

-- --------------------------------------------------------

--
-- Table structure for table `quote_work`
--

CREATE TABLE `quote_work` (
  `id` int(11) NOT NULL,
  `quote_id` int(11) NOT NULL,
  `quote_work_option_id` int(11) NOT NULL,
  `description` varchar(64) NOT NULL,
  `pricing` decimal(15,2) NOT NULL DEFAULT '0.00',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quote_work`
--

INSERT INTO `quote_work` (`id`, `quote_id`, `quote_work_option_id`, `description`, `pricing`, `date_updated`) VALUES
(3, 2, 10, '1 Day stay in Hotel', '10.00', '2017-03-21 13:43:27'),
(5, 2, 11, '1 Day Labour', '25.00', '2017-03-21 13:44:01'),
(6, 2, 12, 'Bag of Sand', '15.00', '2017-03-21 13:44:27'),
(7, 3, 10, '1 Day stay in Hotel', '10.00', '2017-03-21 13:44:57'),
(8, 3, 11, '1 Day Labour', '25.00', '2017-03-21 13:45:16'),
(9, 3, 12, 'Bag of Sand', '15.00', '2017-03-21 13:45:35'),
(10, 3, 13, 'Digger Rental', '110.00', '2017-03-21 13:46:17');

-- --------------------------------------------------------

--
-- Table structure for table `quote_work_option`
--

CREATE TABLE `quote_work_option` (
  `id` int(11) NOT NULL,
  `quote_option_id` int(11) NOT NULL,
  `work_option_id` int(11) NOT NULL,
  `description` varchar(64) NOT NULL,
  `pricing` decimal(15,2) NOT NULL DEFAULT '0.00',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quote_work_option`
--

INSERT INTO `quote_work_option` (`id`, `quote_option_id`, `work_option_id`, `description`, `pricing`, `date_updated`) VALUES
(10, 4, 1, '1 Day stay in Hotel', '10.00', '2017-03-21 13:31:52'),
(11, 4, 9, '1 Day Labour', '25.00', '2017-03-21 13:32:21'),
(12, 4, 12, 'Bag of Sand', '15.00', '2017-03-21 13:32:45'),
(13, 4, 13, 'Digger Rental', '110.00', '2017-03-21 13:33:16'),
(14, 4, 15, 'Train to location', '75.25', '2017-03-21 13:33:43');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `access_allowed` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`user_id`, `task_id`, `access_allowed`) VALUES
(1, 1, 0),
(1, 2, 0),
(1, 3, 0),
(1, 4, 0),
(1, 5, 0),
(1, 6, 0),
(1, 7, 0),
(1, 8, 0),
(1, 9, 0),
(1, 10, 0),
(2, 1, 0),
(2, 2, 0),
(2, 3, 0),
(2, 4, 0),
(2, 5, 0),
(2, 6, 0),
(2, 7, 0),
(2, 8, 0),
(2, 9, 0),
(2, 10, 0),
(3, 1, 0),
(3, 2, 0),
(3, 3, 0),
(3, 4, 0),
(3, 5, 0),
(3, 6, 0),
(3, 7, 0),
(3, 8, 0),
(3, 9, 0),
(3, 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `site`
--

CREATE TABLE `site` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `shortname` varchar(32) DEFAULT NULL,
  `address1` varchar(32) NOT NULL,
  `address2` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `county` varchar(32) DEFAULT NULL,
  `postcode` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `site`
--

INSERT INTO `site` (`id`, `customer_id`, `name`, `shortname`, `address1`, `address2`, `city`, `county`, `postcode`) VALUES
(1, 1, 'GJW', 'GJ', 'Some Street', 'Near another', 'Nowhere', 'Some County', 'Pcode'),
(2, 1, 'GJW1', 'GJ1', 'another street', '', 'Liverpool', 'Merseyside', 'L1'),
(3, 1, 'GJW2', 'GJ2', 'yet another street', '', 'Liverpool', 'Merseyside', 'L1'),
(4, 2, 'AS1', 'A1', 'street 1', '', 'Manchester', 'Greater Manchester', 'M15'),
(5, 2, 'AS2', 'A2', 'street 2', 'Bit near 1', 'Manchester', 'Greater Manchester', 'M15'),
(6, 3, 'LEE1', 'L1', 'Leeds street 2', '', 'Leeds', 'Yorkshire', 'LS1');

-- --------------------------------------------------------

--
-- Table structure for table `site_contact`
--

CREATE TABLE `site_contact` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `type` enum('Main','Security','Other1','Other2') NOT NULL,
  `first_name` varchar(32) DEFAULT NULL,
  `last_name` varchar(32) DEFAULT NULL,
  `tel_no` varchar(32) NOT NULL,
  `email_address` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `shortname` varchar(32) NOT NULL,
  `companyregno` varchar(32) NOT NULL,
  `website` varchar(128) DEFAULT NULL,
  `quote_email` varchar(128) DEFAULT NULL,
  `experian_score` varchar(32) NOT NULL,
  `credit_score` varchar(32) NOT NULL,
  `credit_hard_limit` int(11) NOT NULL,
  `credit_soft_limit` int(11) NOT NULL,
  `credit_outstanding` int(11) NOT NULL,
  `terms_id` int(11) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `employee_id`, `name`, `shortname`, `companyregno`, `website`, `quote_email`, `experian_score`, `credit_score`, `credit_hard_limit`, `credit_soft_limit`, `credit_outstanding`, `terms_id`, `date_updated`) VALUES
(1, 2, 'Travis Perkins', 'TPERK', 'T001', 'https://www.travisperkins.co.uk/', 'dummy@travisperkins-test.co.uk', 'UNK', 'UNK', 10000, 1000, 7500, 2, '2017-03-21 10:27:52');

--
-- Triggers `supplier`
--
DELIMITER $$
CREATE TRIGGER `insert_supplier` AFTER INSERT ON `supplier` FOR EACH ROW BEGIN
      INSERT INTO supplier_history (
       supplier_id,
       employee_id,
       name,
       shortname,
       companyregno,
       website,
       quote_email,
       experian_score,
       credit_score,
       credit_hard_limit,
       credit_soft_limit,
       credit_outstanding,
       terms_id
      ) VALUES (
       NEW.id,
       NEW.employee_id,
       NEW.name,
       NEW.shortname,
       NEW.companyregno,
       NEW.website,
       NEW.quote_email,
       NEW.experian_score,
       NEW.credit_score,
       NEW.credit_hard_limit,
       NEW.credit_soft_limit,
       NEW.credit_outstanding,
       NEW.terms_id
      );
     END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_supplier` AFTER UPDATE ON `supplier` FOR EACH ROW BEGIN
      INSERT INTO supplier_history (
       supplier_id,
       employee_id,
       name,
       shortname,
       companyregno,
       website,
       quote_email,
       experian_score,
       credit_score,
       credit_hard_limit,
       credit_soft_limit,
       credit_outstanding,
       terms_id
      ) VALUES (
       NEW.id,
       NEW.employee_id,
       NEW.name,
       NEW.shortname,
       NEW.companyregno,
       NEW.website,
       NEW.quote_email,
       NEW.experian_score,
       NEW.credit_score,
       NEW.credit_hard_limit,
       NEW.credit_soft_limit,
       NEW.credit_outstanding,
       NEW.terms_id
      );
     END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_address`
--

CREATE TABLE `supplier_address` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `type` enum('Billing','Trading','Other1','Other2') NOT NULL,
  `address1` varchar(32) NOT NULL,
  `address2` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `county` varchar(32) DEFAULT NULL,
  `postcode` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supplier_address`
--

INSERT INTO `supplier_address` (`id`, `supplier_id`, `type`, `address1`, `address2`, `city`, `county`, `postcode`) VALUES
(1, 1, 'Billing', 'An address line 1', 'An address line 2', 'A city', 'The county', 'PC1 CD02');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_contact`
--

CREATE TABLE `supplier_contact` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `type` enum('Main','Accounts','Other1','Other2') NOT NULL,
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `tel_no` varchar(32) NOT NULL,
  `email_address` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supplier_contact`
--

INSERT INTO `supplier_contact` (`id`, `supplier_id`, `type`, `first_name`, `last_name`, `tel_no`, `email_address`) VALUES
(1, 1, 'Main', 'Main', 'Contact', 'Main tel', 'email@main.co.uk');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_history`
--

CREATE TABLE `supplier_history` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `shortname` varchar(32) NOT NULL,
  `companyregno` varchar(32) NOT NULL,
  `website` varchar(128) DEFAULT NULL,
  `quote_email` varchar(128) DEFAULT NULL,
  `experian_score` varchar(32) NOT NULL,
  `credit_score` varchar(32) NOT NULL,
  `credit_hard_limit` int(11) NOT NULL,
  `credit_soft_limit` int(11) NOT NULL,
  `credit_outstanding` int(11) NOT NULL,
  `terms_id` int(11) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supplier_history`
--

INSERT INTO `supplier_history` (`id`, `supplier_id`, `employee_id`, `name`, `shortname`, `companyregno`, `website`, `quote_email`, `experian_score`, `credit_score`, `credit_hard_limit`, `credit_soft_limit`, `credit_outstanding`, `terms_id`, `date_updated`) VALUES
(1, 1, 2, 'Travis Perkins', 'TPERK', 'T001', 'https://www.travisperkins.co.uk/', 'info@travisperkins-test.co.uk', 'UNK', 'UNK', 10000, 1000, 7500, 2, '2017-03-21 10:27:52'),
(2, 1, 2, 'Travis Perkins', 'TPERK', 'T001', 'https://www.travisperkins.co.uk/', 'dummy@travisperkins-test.co.uk', 'UNK', 'UNK', 10000, 1000, 7500, 2, '2017-03-21 10:28:39');

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `id` int(11) NOT NULL,
  `description` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`id`, `description`) VALUES
(1, 'Login'),
(2, 'Customer Maintenance'),
(3, 'Quotes'),
(4, 'Sales Orders'),
(5, 'Cancellations'),
(6, 'Finance'),
(7, 'Financial Reporting'),
(8, 'Customer Reporting'),
(9, 'Debt Collection'),
(10, 'Work Sheets');

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int(11) NOT NULL,
  `description` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `description`) VALUES
(1, 'Civils Team 1'),
(2, 'Civils Team 2'),
(3, 'Civils Team 3'),
(4, 'Civils Team 4'),
(5, 'Civils Team 5'),
(6, 'Build Team 1'),
(7, 'Build Team 2'),
(8, 'Build Team 3'),
(9, 'Build Team 4'),
(10, 'Build Team 5');

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE `terms` (
  `id` int(11) NOT NULL,
  `description` varchar(32) NOT NULL,
  `days` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `terms`
--

INSERT INTO `terms` (`id`, `description`, `days`) VALUES
(1, '30 Days', 30),
(2, 'Month End', 0),
(3, 'None', 14);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `title` varchar(16) DEFAULT NULL,
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `password` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `title`, `first_name`, `last_name`, `email_address`, `start_date`, `end_date`, `password`) VALUES
(1, 'Mr', 'Darren', 'Mallett', 'dm@work.co.uk', '2017-03-13', NULL, 'letmeinplease'),
(2, 'Mr', 'Graham', 'Watson', 'gw@work.co.uk', '2017-03-13', NULL, 'letmeinplease'),
(3, 'Mr', 'David', 'White', 'dw@work.co.uk', '2017-03-13', NULL, 'letmeinpleaseaswell');

--
-- Triggers `user`
--
DELIMITER $$
CREATE TRIGGER `insert_user` AFTER INSERT ON `user` FOR EACH ROW BEGIN
    INSERT INTO roles (user_id,task_id,access_allowed) SELECT NEW.id, t.id, false FROM task t;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_employees`
-- (See below for the actual view)
--
CREATE TABLE `view_employees` (
`Name` varchar(66)
,`Manager` varchar(66)
,`Reports` varchar(3)
,`Division` varchar(32)
,`Team` varchar(32)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_quote`
-- (See below for the actual view)
--
CREATE TABLE `view_quote` (
`site` varchar(80)
,`customer` varchar(32)
,`status` enum('In-Progress','Accepted','Disabled')
,`by` varchar(66)
,`updated` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_roles`
-- (See below for the actual view)
--
CREATE TABLE `view_roles` (
`Name` varchar(66)
,`description` varchar(32)
,`Access Allowed` varchar(3)
);

-- --------------------------------------------------------

--
-- Table structure for table `work_option`
--

CREATE TABLE `work_option` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `code` varchar(16) NOT NULL,
  `description` varchar(64) NOT NULL,
  `default_pricing` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `work_option`
--

INSERT INTO `work_option` (`id`, `category_id`, `code`, `description`, `default_pricing`) VALUES
(1, 1, 'ACCOM001', '1 Day stay in Hotel', '10.00'),
(2, 1, 'ACCOM002', '2 Day stay in Hotel', '25.00'),
(3, 1, 'ACCOM003', '3 Day stay in Hotel', '38.50'),
(4, 1, 'ACCOM004', '4 Day stay in Hotel', '49.50'),
(5, 1, 'ACCOM005', '5 Day stay in Hotel', '22.50'),
(6, 1, 'ACCOMW01', '1 Week stay in Hotel', '30.00'),
(7, 1, 'ACCOMW02', '2 Week stay in Hotel', '50.00'),
(8, 1, 'ACCOMM01', '1 Month stay in Hotel', '15.75'),
(9, 2, 'LABD01', '1 Day Labour', '25.00'),
(10, 2, 'LABW01', '1 Week Labour', '100.00'),
(11, 2, 'LABM01', '1 Month Labour', '225.00'),
(12, 3, 'MATBAG', 'Bag of Sand', '15.00'),
(13, 4, 'PLTDIG', 'Digger Rental', '110.00'),
(14, 5, 'WSTSKIP', 'Skip Hire', '95.00'),
(15, 6, 'TRANSLOC', 'Train to location', '75.25'),
(16, 7, 'OTHUNK', 'Unforeseen site clearance', '55.25');

-- --------------------------------------------------------

--
-- Structure for view `view_employees`
--
DROP TABLE IF EXISTS `view_employees`;

CREATE ALGORITHM=UNDEFINED DEFINER=`sterlingadmin`@`%` SQL SECURITY DEFINER VIEW `view_employees`  AS  select concat(`u1`.`last_name`,', ',`u1`.`first_name`) AS `Name`,ifnull(concat(`u2`.`last_name`,', ',`u2`.`first_name`),'Top Manager') AS `Manager`,(case when (`e`.`is_manager` = 1) then 'Yes' else 'No' end) AS `Reports`,coalesce(`d`.`description`,'None') AS `Division`,coalesce(`t`.`description`,'None') AS `Team` from (((((`employee` `e` left join `user` `u1` on((`u1`.`id` = `e`.`user_id`))) left join `employee` `m` on((`m`.`user_id` = `e`.`manager_id`))) left join `user` `u2` on((`u2`.`id` = `m`.`user_id`))) left join `division` `d` on((`d`.`id` = `e`.`division_id`))) left join `team` `t` on((`t`.`id` = `e`.`team_id`))) order by `u1`.`last_name`,`u1`.`first_name` desc ;

-- --------------------------------------------------------

--
-- Structure for view `view_quote`
--
DROP TABLE IF EXISTS `view_quote`;

CREATE ALGORITHM=UNDEFINED DEFINER=`sterlingadmin`@`localhost` SQL SECURITY DEFINER VIEW `view_quote`  AS  select concat(`s`.`name`,', ',`s`.`address1`,', ',`s`.`postcode`) AS `site`,`c`.`name` AS `customer`,`q`.`status` AS `status`,concat(`u`.`last_name`,', ',`u`.`first_name`) AS `by`,`q`.`date_updated` AS `updated` from ((((((`quote` `q` left join `employee` `e` on((`q`.`employee_id` = `e`.`id`))) left join `user` `u` on((`e`.`user_id` = `u`.`id`))) left join `quote_option` `qo` on((`q`.`quote_option_id` = `qo`.`id`))) left join `job` `j` on((`qo`.`job_id` = `j`.`id`))) left join `site` `s` on((`j`.`site_id` = `s`.`id`))) left join `customer` `c` on((`s`.`customer_id` = `c`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_roles`
--
DROP TABLE IF EXISTS `view_roles`;

CREATE ALGORITHM=UNDEFINED DEFINER=`sterlingadmin`@`%` SQL SECURITY DEFINER VIEW `view_roles`  AS  select concat(`u`.`last_name`,', ',`u`.`first_name`) AS `Name`,`t`.`description` AS `description`,(case when (`r`.`access_allowed` = 1) then 'Yes' else 'No' end) AS `Access Allowed` from ((`user` `u` left join `roles` `r` on((`u`.`id` = `r`.`user_id`))) left join `task` `t` on((`r`.`task_id` = `t`.`id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `customer_ibfk_1` (`employee_id`),
  ADD KEY `customer_ibfk_2` (`terms_id`);

--
-- Indexes for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD PRIMARY KEY (`customer_id`,`type`) USING BTREE;

--
-- Indexes for table `customer_contact`
--
ALTER TABLE `customer_contact`
  ADD PRIMARY KEY (`customer_id`,`type`) USING BTREE;

--
-- Indexes for table `customer_history`
--
ALTER TABLE `customer_history`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `customer_history_ibfk_1` (`customer_id`);

--
-- Indexes for table `delivery_option`
--
ALTER TABLE `delivery_option`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `division`
--
ALTER TABLE `division`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `uc_emp_no` (`emp_no`),
  ADD KEY `employee_ibfk_1` (`user_id`),
  ADD KEY `employee_ibfk_2` (`division_id`),
  ADD KEY `employee_ibfk_3` (`manager_id`),
  ADD KEY `employee_ibfk_4` (`team_id`);

--
-- Indexes for table `employee_address`
--
ALTER TABLE `employee_address`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `employee_address_ibfk_1` (`employee_id`);

--
-- Indexes for table `employee_email`
--
ALTER TABLE `employee_email`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `employee_email_ibfk_1` (`employee_id`);

--
-- Indexes for table `employee_telephone`
--
ALTER TABLE `employee_telephone`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `uc_employee_type` (`employee_id`,`type`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `job_ibfk_1` (`site_id`),
  ADD KEY `job_ibfk_2` (`employee_id`),
  ADD KEY `job_ibfk_3` (`status_id`);

--
-- Indexes for table `job_history`
--
ALTER TABLE `job_history`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `job_history_ibfk_1` (`job_id`);

--
-- Indexes for table `job_status`
--
ALTER TABLE `job_status`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `purchase_order_ibfk_1` (`quote_id`),
  ADD KEY `purchase_order_ibfk_2` (`supplier_id`),
  ADD KEY `purchase_order_ibfk_3` (`category_id`);

--
-- Indexes for table `purchase_order_calloff`
--
ALTER TABLE `purchase_order_calloff`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `purchase_order_calloff_ibfk_1` (`purchase_order_id`),
  ADD KEY `purchase_order_calloff_ibfk_2` (`delivery_option_id`);

--
-- Indexes for table `purchase_order_line_item`
--
ALTER TABLE `purchase_order_line_item`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `purchase_order_line_item_ibfk_1` (`purchase_order_calloff_id`);

--
-- Indexes for table `quote`
--
ALTER TABLE `quote`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `quote_ibfk_1` (`quote_option_id`),
  ADD KEY `quote_ibfk_2` (`employee_id`);

--
-- Indexes for table `quote_history`
--
ALTER TABLE `quote_history`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `quote_history_ibfk_1` (`quote_id`);

--
-- Indexes for table `quote_option`
--
ALTER TABLE `quote_option`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `quote_option_ibfk_2` (`employee_id`),
  ADD KEY `quote_option_ibfk_1` (`job_id`);

--
-- Indexes for table `quote_work`
--
ALTER TABLE `quote_work`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `quote_work_ibfk_1` (`quote_id`),
  ADD KEY `quote_work_ibfk_2` (`quote_work_option_id`);

--
-- Indexes for table `quote_work_option`
--
ALTER TABLE `quote_work_option`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `quote_work_option_ibfk_1` (`quote_option_id`),
  ADD KEY `quote_work_option_ibfk_2` (`work_option_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`user_id`,`task_id`) USING BTREE,
  ADD KEY `roles_ibfk_2` (`task_id`);

--
-- Indexes for table `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `site_ibfk_1` (`customer_id`);

--
-- Indexes for table `site_contact`
--
ALTER TABLE `site_contact`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `site_contact_ibfk_1` (`site_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `supplier_ibfk_1` (`employee_id`),
  ADD KEY `supplier_ibfk_2` (`terms_id`);

--
-- Indexes for table `supplier_address`
--
ALTER TABLE `supplier_address`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `supplier_address_ibfk_1` (`supplier_id`);

--
-- Indexes for table `supplier_contact`
--
ALTER TABLE `supplier_contact`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `supplier_contact_ibfk_1` (`supplier_id`);

--
-- Indexes for table `supplier_history`
--
ALTER TABLE `supplier_history`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `supplier_history_ibfk_1` (`supplier_id`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `work_option`
--
ALTER TABLE `work_option`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `work_option_uq` (`code`),
  ADD KEY `work_option_ibfk_1` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `customer_history`
--
ALTER TABLE `customer_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `delivery_option`
--
ALTER TABLE `delivery_option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `division`
--
ALTER TABLE `division`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `employee_address`
--
ALTER TABLE `employee_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `employee_email`
--
ALTER TABLE `employee_email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `employee_telephone`
--
ALTER TABLE `employee_telephone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `job_history`
--
ALTER TABLE `job_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `job_status`
--
ALTER TABLE `job_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `purchase_order`
--
ALTER TABLE `purchase_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `purchase_order_calloff`
--
ALTER TABLE `purchase_order_calloff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `purchase_order_line_item`
--
ALTER TABLE `purchase_order_line_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `quote`
--
ALTER TABLE `quote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `quote_history`
--
ALTER TABLE `quote_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `quote_option`
--
ALTER TABLE `quote_option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `quote_work`
--
ALTER TABLE `quote_work`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `quote_work_option`
--
ALTER TABLE `quote_work_option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `site`
--
ALTER TABLE `site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `site_contact`
--
ALTER TABLE `site_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `supplier_address`
--
ALTER TABLE `supplier_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `supplier_contact`
--
ALTER TABLE `supplier_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `supplier_history`
--
ALTER TABLE `supplier_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `work_option`
--
ALTER TABLE `work_option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`terms_id`) REFERENCES `terms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD CONSTRAINT `customer_address_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_contact`
--
ALTER TABLE `customer_contact`
  ADD CONSTRAINT `customer_contact_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_history`
--
ALTER TABLE `customer_history`
  ADD CONSTRAINT `customer_history_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`division_id`) REFERENCES `division` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_ibfk_4` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_address`
--
ALTER TABLE `employee_address`
  ADD CONSTRAINT `employee_address_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_email`
--
ALTER TABLE `employee_email`
  ADD CONSTRAINT `employee_email_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_telephone`
--
ALTER TABLE `employee_telephone`
  ADD CONSTRAINT `employee_telephone_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `job_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `job_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `job_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `job_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `job_history`
--
ALTER TABLE `job_history`
  ADD CONSTRAINT `job_history_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD CONSTRAINT `purchase_order_ibfk_1` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_order_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_order_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchase_order_calloff`
--
ALTER TABLE `purchase_order_calloff`
  ADD CONSTRAINT `purchase_order_calloff_ibfk_1` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_order_calloff_ibfk_2` FOREIGN KEY (`delivery_option_id`) REFERENCES `delivery_option` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchase_order_line_item`
--
ALTER TABLE `purchase_order_line_item`
  ADD CONSTRAINT `purchase_order_line_item_ibfk_1` FOREIGN KEY (`purchase_order_calloff_id`) REFERENCES `purchase_order_calloff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quote`
--
ALTER TABLE `quote`
  ADD CONSTRAINT `quote_ibfk_1` FOREIGN KEY (`quote_option_id`) REFERENCES `quote_option` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quote_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quote_history`
--
ALTER TABLE `quote_history`
  ADD CONSTRAINT `quote_history_ibfk_1` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quote_option`
--
ALTER TABLE `quote_option`
  ADD CONSTRAINT `quote_option_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quote_option_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quote_work`
--
ALTER TABLE `quote_work`
  ADD CONSTRAINT `quote_work_ibfk_1` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quote_work_ibfk_2` FOREIGN KEY (`quote_work_option_id`) REFERENCES `quote_work_option` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quote_work_option`
--
ALTER TABLE `quote_work_option`
  ADD CONSTRAINT `quote_work_option_ibfk_1` FOREIGN KEY (`quote_option_id`) REFERENCES `quote_option` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quote_work_option_ibfk_2` FOREIGN KEY (`work_option_id`) REFERENCES `work_option` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `roles_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `site_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `site_contact`
--
ALTER TABLE `site_contact`
  ADD CONSTRAINT `site_contact_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `supplier_ibfk_2` FOREIGN KEY (`terms_id`) REFERENCES `terms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `supplier_address`
--
ALTER TABLE `supplier_address`
  ADD CONSTRAINT `supplier_address_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `supplier_contact`
--
ALTER TABLE `supplier_contact`
  ADD CONSTRAINT `supplier_contact_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `supplier_history`
--
ALTER TABLE `supplier_history`
  ADD CONSTRAINT `supplier_history_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `work_option`
--
ALTER TABLE `work_option`
  ADD CONSTRAINT `work_option_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
