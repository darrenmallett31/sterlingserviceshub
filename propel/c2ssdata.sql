-- MySQL dump 10.14  Distrib 5.5.52-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: c2ssdata
-- ------------------------------------------------------
-- Server version	5.5.52-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `asset`
--

DROP TABLE IF EXISTS `asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_type_id` int(11) DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `date_allocated` datetime DEFAULT NULL,
  `date_to_service` datetime DEFAULT NULL,
  `make` varchar(32) DEFAULT NULL,
  `model` varchar(32) DEFAULT NULL,
  `serial_number` varchar(32) DEFAULT NULL,
  `internal_id` varchar(32) DEFAULT NULL,
  `in_service_date` varchar(32) DEFAULT NULL,
  `total_cost` decimal(15,2) NOT NULL DEFAULT '0.00',
  `purchase_date` datetime DEFAULT NULL,
  `depreciation_years` int(11) DEFAULT NULL,
  `depreciation_rate` decimal(15,2) NOT NULL DEFAULT '0.00',
  `book_value` decimal(15,2) NOT NULL DEFAULT '0.00',
  `supplier_id` int(11) DEFAULT NULL,
  `tracker_id` varchar(64) DEFAULT NULL,
  `allocated_employee_id` int(11) DEFAULT NULL,
  `allocation_status` tinyint(1) DEFAULT NULL,
  `location` varchar(32) DEFAULT NULL,
  `notes` text,
  `condition` varchar(128) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `asset_ibfk_1` (`asset_type_id`),
  KEY `asset_ibfk_2` (`employee_id`),
  CONSTRAINT `asset_ibfk_1` FOREIGN KEY (`asset_type_id`) REFERENCES `asset_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `asset_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset`
--

LOCK TABLES `asset` WRITE;
/*!40000 ALTER TABLE `asset` DISABLE KEYS */;
INSERT INTO `asset` VALUES (1,1,2,'Audi A3','2017-04-10 12:09:34','2017-07-06 11:51:33','Audi','A3','DAZ001','WRECK001','From the start of April 2017',22599.99,'2017-04-07 11:51:33',3,8500.99,22599.99,NULL,'TRCK001',1,1,'Burton on Salmon','This won\'t last long!','New','2017-04-10 11:09:34'),(2,2,2,'A Big Digger',NULL,'2017-05-22 11:58:07','BIG','DIGGER','DAVO001','DAVO001','End of March 2017',142599.99,'2017-04-07 11:58:07',7,18500.99,152599.99,NULL,'DIG001',NULL,0,'On site','Built like a digger!','Pristine','2017-04-10 11:09:06');
/*!40000 ALTER TABLE `asset` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`c2ssdbuser`@`localhost`*/ /*!50003 TRIGGER `insert_asset` AFTER INSERT ON `asset`
 FOR EACH ROW BEGIN
      INSERT INTO asset_history (
          asset_id,
          asset_type_id,
          employee_id,
          name,
          date_allocated,
          date_to_service,
          make,
          model,
          serial_number,
          internal_id,
          in_service_date,
          total_cost,
          purchase_date,
          depreciation_years,
          depreciation_rate,
          book_value,
          supplier_id,
          tracker_id,
          allocated_employee_id,
          allocation_status,
          location,
          notes,
          `condition`
      ) VALUES (
          NEW.id,
          NEW.asset_type_id,
          NEW.employee_id,
          NEW.name,
          NEW.date_allocated,
          NEW.date_to_service,
          NEW.make,
          NEW.model,
          NEW.serial_number,
          NEW.internal_id,
          NEW.in_service_date,
          NEW.total_cost,
          NEW.purchase_date,
          NEW.depreciation_years,
          NEW.depreciation_rate,
          NEW.book_value,
          NEW.supplier_id,
          NEW.tracker_id,
          NEW.allocated_employee_id,
          NEW.allocation_status,
          NEW.location,
          NEW.notes,
          NEW.`condition`
      );
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`c2ssdbuser`@`localhost`*/ /*!50003 TRIGGER `update_asset` AFTER UPDATE ON `asset`
 FOR EACH ROW BEGIN
      INSERT INTO asset_history (
          asset_id,
          asset_type_id,
          employee_id,
          name,
          date_allocated,
          date_to_service,
          make,
          model,
          serial_number,
          internal_id,
          in_service_date,
          total_cost,
          purchase_date,
          depreciation_years,
          depreciation_rate,
          book_value,
          supplier_id,
          tracker_id,
          allocated_employee_id,
          allocation_status,
          location,
          notes,
          `condition`
      ) VALUES (
          NEW.id,
          NEW.asset_type_id,
          NEW.employee_id,
          NEW.name,
          NEW.date_allocated,
          NEW.date_to_service,
          NEW.make,
          NEW.model,
          NEW.serial_number,
          NEW.internal_id,
          NEW.in_service_date,
          NEW.total_cost,
          NEW.purchase_date,
          NEW.depreciation_years,
          NEW.depreciation_rate,
          NEW.book_value,
          NEW.supplier_id,
          NEW.tracker_id,
          NEW.allocated_employee_id,
          NEW.allocation_status,
          NEW.location,
          NEW.notes,
          NEW.`condition`
      );
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `asset_history`
--

DROP TABLE IF EXISTS `asset_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) NOT NULL,
  `asset_type_id` int(11) DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `date_allocated` datetime DEFAULT NULL,
  `date_to_service` datetime DEFAULT NULL,
  `make` varchar(32) DEFAULT NULL,
  `model` varchar(32) DEFAULT NULL,
  `serial_number` varchar(32) DEFAULT NULL,
  `internal_id` varchar(32) DEFAULT NULL,
  `in_service_date` varchar(32) DEFAULT NULL,
  `total_cost` decimal(15,2) NOT NULL DEFAULT '0.00',
  `purchase_date` datetime DEFAULT NULL,
  `depreciation_years` int(11) DEFAULT NULL,
  `depreciation_rate` decimal(15,2) NOT NULL DEFAULT '0.00',
  `book_value` decimal(15,2) NOT NULL DEFAULT '0.00',
  `supplier_id` int(11) DEFAULT NULL,
  `tracker_id` varchar(64) DEFAULT NULL,
  `allocated_employee_id` int(11) DEFAULT NULL,
  `allocation_status` tinyint(1) DEFAULT NULL,
  `location` varchar(32) DEFAULT NULL,
  `notes` text,
  `condition` varchar(128) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `asset_history_ibfk_1` (`asset_id`),
  CONSTRAINT `asset_history_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_history`
--

LOCK TABLES `asset_history` WRITE;
/*!40000 ALTER TABLE `asset_history` DISABLE KEYS */;
INSERT INTO `asset_history` VALUES (1,1,1,2,'Audi A3','2017-04-07 11:51:33','2017-04-07 11:52:23','Audi','A3','DAZ001','WRECK001','From the start of April 2017',22599.99,'2017-04-07 11:51:33',3,8500.99,22599.99,NULL,'TRCK001',1,0,'Burton on Salmon','This won\'t last long!','New','2017-04-07 10:51:33'),(2,1,1,2,'Audi A3','2017-04-07 11:51:33','2017-07-06 11:51:33','Audi','A3','DAZ001','WRECK001','From the start of April 2017',22599.99,'2017-04-07 11:51:33',3,8500.99,22599.99,NULL,'TRCK001',1,0,'Burton on Salmon','This won\'t last long!','New','2017-04-07 10:55:29'),(3,2,2,2,'A Big Digger','2017-04-07 11:58:07','2017-05-22 11:58:07','BIG','DIGGER','DAVO001','DAVO001','End of March 2017',142599.99,'2017-04-07 11:58:07',7,18500.99,152599.99,NULL,'DIG001',1,0,'','Built like a digger!','Pristine','2017-04-07 10:58:07'),(4,2,2,2,'A Big Digger','2017-04-07 11:58:07','2017-05-22 11:58:07','BIG','DIGGER','DAVO001','DAVO001','End of March 2017',142599.99,'2017-04-07 11:58:07',7,18500.99,152599.99,NULL,'DIG001',1,0,'On site','Built like a digger!','Pristine','2017-04-07 10:58:32'),(5,2,2,2,'A Big Digger',NULL,'2017-05-22 11:58:07','BIG','DIGGER','DAVO001','DAVO001','End of March 2017',142599.99,'2017-04-07 11:58:07',7,18500.99,152599.99,NULL,'DIG001',NULL,0,'On site','Built like a digger!','Pristine','2017-04-10 11:09:06'),(6,1,1,2,'Audi A3','2017-04-10 12:09:34','2017-07-06 11:51:33','Audi','A3','DAZ001','WRECK001','From the start of April 2017',22599.99,'2017-04-07 11:51:33',3,8500.99,22599.99,NULL,'TRCK001',1,1,'Burton on Salmon','This won\'t last long!','New','2017-04-10 11:09:34');
/*!40000 ALTER TABLE `asset_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_type`
--

DROP TABLE IF EXISTS `asset_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `days_to_review` int(11) NOT NULL DEFAULT '0',
  `type` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_type`
--

LOCK TABLES `asset_type` WRITE;
/*!40000 ALTER TABLE `asset_type` DISABLE KEYS */;
INSERT INTO `asset_type` VALUES (1,90,'Car'),(2,45,'Digger'),(3,365,'Spade');
/*!40000 ALTER TABLE `asset_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(16) NOT NULL,
  `description` varchar(64) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'ACCOM','Accomodation'),(2,'LAB','Labour'),(3,'MAT','Materials'),(4,'PLT','Plant'),(5,'WST','Waste'),(6,'TRANS','Transport'),(7,'OTH','Other');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `customer_ibfk_1` (`employee_id`),
  KEY `customer_ibfk_2` (`terms_id`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`terms_id`) REFERENCES `terms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,1,'Test Customer','Test','Domestic-Private','NEWREGNO','www.website.co.uk','foo@bar.com',31,'EXPSCORE','CRDSCORE',0,0,0,1,1,0,31,7,'2017-03-14 12:11:53'),(2,1,'Another Customer','Anh','Domestic-Private','001','www.asite.co.uk','foo@address.com',31,'EXP','CRD',10000,5000,1250,1,1,0,15,14,'2017-03-14 12:15:03'),(3,3,'Yet another Customer','Yet','Domestic-Private','YET001','www.yet.co.uk','yet@yet.com',7,'BETTERSCORE','YETSCORE',0,0,0,1,1,0,13,5,'2017-03-14 14:29:04');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`c2ssdbuser`@`localhost`*/ /*!50003 TRIGGER `insert_customer` AFTER INSERT ON `customer`
 FOR EACH ROW BEGIN
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
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`c2ssdbuser`@`localhost`*/ /*!50003 TRIGGER `update_customer` AFTER UPDATE ON `customer`
 FOR EACH ROW BEGIN
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
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `customer_address`
--

DROP TABLE IF EXISTS `customer_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address` (
  `customer_id` int(11) NOT NULL,
  `type` enum('Billing','Trading','Other1','Other2') NOT NULL,
  `address1` varchar(32) NOT NULL,
  `address2` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `county` varchar(32) DEFAULT NULL,
  `postcode` varchar(12) NOT NULL,
  PRIMARY KEY (`customer_id`,`type`) USING BTREE,
  CONSTRAINT `customer_address_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address`
--

LOCK TABLES `customer_address` WRITE;
/*!40000 ALTER TABLE `customer_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_contact`
--

DROP TABLE IF EXISTS `customer_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_contact` (
  `customer_id` int(11) NOT NULL,
  `type` enum('Main','Accounts','Other1','Other2') NOT NULL,
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `tel_no` varchar(32) NOT NULL,
  `email_address` varchar(128) NOT NULL,
  PRIMARY KEY (`customer_id`,`type`) USING BTREE,
  CONSTRAINT `customer_contact_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_contact`
--

LOCK TABLES `customer_contact` WRITE;
/*!40000 ALTER TABLE `customer_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_history`
--

DROP TABLE IF EXISTS `customer_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `customer_history_ibfk_1` (`customer_id`),
  CONSTRAINT `customer_history_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_history`
--

LOCK TABLES `customer_history` WRITE;
/*!40000 ALTER TABLE `customer_history` DISABLE KEYS */;
INSERT INTO `customer_history` VALUES (1,1,1,'Test Customer','Test','Domestic-Private','REGNO','www.website.co.uk','foo@bar.com',14,'EXPSCORE','CRDSCORE',0,0,0,1,1,0,31,7,'2017-03-14 12:11:53'),(2,1,1,'Test Customer','Test','Domestic-Private','NEWREGNO','www.website.co.uk','foo@bar.com',14,'EXPSCORE','CRDSCORE',0,0,0,1,1,0,31,7,'2017-03-14 12:13:54'),(3,2,1,'Another Customer','Anh','Domestic-Private','001','www.asite.co.uk','foo@address.com',14,'EXP','CRD',0,0,0,1,1,0,15,14,'2017-03-14 12:15:03'),(4,2,1,'Another Customer','Anh','Domestic-Private','001','www.asite.co.uk','foo@address.com',7,'EXP','CRD',0,0,0,1,1,0,15,14,'2017-03-14 12:16:41'),(5,1,1,'Test Customer','Test','Domestic-Private','NEWREGNO','www.website.co.uk','foo@bar.com',31,'EXPSCORE','CRDSCORE',0,0,0,1,1,0,31,7,'2017-03-14 12:17:25'),(6,2,1,'Another Customer','Anh','Domestic-Private','001','www.asite.co.uk','foo@address.com',31,'EXP','CRD',0,0,0,1,1,0,15,14,'2017-03-14 12:17:25'),(7,3,3,'Yet another Customer','Yet','Domestic-Private','YET001','www.yet.co.uk','yet@yet.com',7,'EXP1','CRD1',0,0,0,1,1,0,13,5,'2017-03-14 14:29:04'),(8,3,3,'Yet another Customer','Yet','Domestic-Private','YET001','www.yet.co.uk','yet@yet.com',7,'BETTERSCORE','YETSCORE',0,0,0,1,1,0,13,5,'2017-03-14 14:30:01'),(9,2,1,'Another Customer','Anh','Domestic-Private','001','www.asite.co.uk','foo@address.com',31,'EXP','CRD',10000,5000,1250,1,1,0,15,14,'2017-03-19 11:21:53');
/*!40000 ALTER TABLE `customer_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_option`
--

DROP TABLE IF EXISTS `delivery_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(64) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_option`
--

LOCK TABLES `delivery_option` WRITE;
/*!40000 ALTER TABLE `delivery_option` DISABLE KEYS */;
INSERT INTO `delivery_option` VALUES (1,'Courier'),(2,'Parcel Force'),(3,'Royal Mail');
/*!40000 ALTER TABLE `delivery_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `division`
--

DROP TABLE IF EXISTS `division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `division` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(32) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `division`
--

LOCK TABLES `division` WRITE;
/*!40000 ALTER TABLE `division` DISABLE KEYS */;
INSERT INTO `division` VALUES (1,'Administrators'),(2,'Office Admin'),(3,'Finance'),(4,'Projects'),(5,'Maintenance'),(6,'Other');
/*!40000 ALTER TABLE `division` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentation`
--

DROP TABLE IF EXISTS `documentation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(256) NOT NULL,
  `header` text,
  `main_body` text,
  `footer` text,
  `url_path` varchar(256) DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `documentation_ibfk_1` (`employee_id`),
  CONSTRAINT `documentation_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentation`
--

LOCK TABLES `documentation` WRITE;
/*!40000 ALTER TABLE `documentation` DISABLE KEYS */;
INSERT INTO `documentation` VALUES (1,2,'Database Design','The database design documentation',NULL,NULL,NULL,'./document_path/db design version 2.doc','2017-04-07 11:49:04'),(2,2,'UI Design','The user interface design documentation',NULL,NULL,NULL,'http://www.sterling-services.co.uk/document_path/ui_design_v2.pdf','2017-04-07 11:48:30');
/*!40000 ALTER TABLE `documentation` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`c2ssdbuser`@`localhost`*/ /*!50003 TRIGGER `insert_documentation` AFTER INSERT ON `documentation`
 FOR EACH ROW BEGIN
      INSERT INTO documentation_history (
          `documentation_id`,
          `employee_id`,
          `name`,
          `description`,
          `header`,
          `main_body`,
          `footer`,
          `url_path`
      ) VALUES (
          NEW.`id`,
          NEW.`employee_id`,
          NEW.`name`,
          NEW.`description`,
          NEW.`header`,
          NEW.`main_body`,
          NEW.`footer`,
          NEW.`url_path`
      );
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`c2ssdbuser`@`localhost`*/ /*!50003 TRIGGER `update_documentation` AFTER UPDATE ON `documentation`
 FOR EACH ROW BEGIN
      INSERT INTO documentation_history (
          `documentation_id`,
          `employee_id`,
          `name`,
          `description`,
          `header`,
          `main_body`,
          `footer`,
          `url_path`
      ) VALUES (
          NEW.`id`,
          NEW.`employee_id`,
          NEW.`name`,
          NEW.`description`,
          NEW.`header`,
          NEW.`main_body`,
          NEW.`footer`,
          NEW.`url_path`
      );
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `documentation_history`
--

DROP TABLE IF EXISTS `documentation_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentation_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documentation_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(256) NOT NULL,
  `header` text,
  `main_body` text,
  `footer` text,
  `url_path` varchar(256) DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `documentation_history_ibfk_1` (`documentation_id`),
  CONSTRAINT `documentation_history_ibfk_1` FOREIGN KEY (`documentation_id`) REFERENCES `documentation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentation_history`
--

LOCK TABLES `documentation_history` WRITE;
/*!40000 ALTER TABLE `documentation_history` DISABLE KEYS */;
INSERT INTO `documentation_history` VALUES (1,1,2,'Database Design','The database design documentation',NULL,NULL,NULL,'./document_path/db design.doc','2017-04-07 11:46:12'),(2,2,1,'UI Design','The user interface design documentation',NULL,NULL,NULL,'http://www.sterling-services.co.uk/document_path/ui_design.pdf','2017-04-07 11:47:36'),(3,2,2,'UI Design','The user interface design documentation',NULL,NULL,NULL,'http://www.sterling-services.co.uk/document_path/ui_design_v2.pdf','2017-04-07 11:48:30'),(4,1,2,'Database Design','The database design documentation',NULL,NULL,NULL,'./document_path/db design version 2.doc','2017-04-07 11:49:04');
/*!40000 ALTER TABLE `documentation_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `is_manager` tinyint(1) DEFAULT NULL,
  `emp_no` varchar(32) NOT NULL,
  `job_title` varchar(64) NOT NULL,
  `job_role` varchar(64) NOT NULL,
  `manager_id` int(11) NOT NULL,
  `division_id` int(11) NOT NULL,
  `team_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uc_emp_no` (`emp_no`),
  KEY `employee_ibfk_1` (`user_id`),
  KEY `employee_ibfk_2` (`division_id`),
  KEY `employee_ibfk_3` (`manager_id`),
  KEY `employee_ibfk_4` (`team_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`division_id`) REFERENCES `division` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employee_ibfk_4` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,1,1,'EMP001','Boss Man','Pays everyone...',1,1,NULL),(2,2,0,'EMP002','Pleb','Does nothing...',1,4,5),(3,3,0,'EMP003','Another Pleb','Works from Home...',1,5,3);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_address`
--

DROP TABLE IF EXISTS `employee_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `address1` varchar(32) NOT NULL,
  `address2` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `county` varchar(32) DEFAULT NULL,
  `postcode` varchar(12) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `employee_address_ibfk_1` (`employee_id`),
  CONSTRAINT `employee_address_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_address`
--

LOCK TABLES `employee_address` WRITE;
/*!40000 ALTER TABLE `employee_address` DISABLE KEYS */;
INSERT INTO `employee_address` VALUES (1,1,'14 Main Street','Burton Salmon','Leeds','Yorkshire','LS25 5JS'),(2,2,'11 Montrose Close','Fearnhead','Warrington','Cheshire','WA2 0SD'),(3,3,'The Castle','In the Bush','God Knows','Yorkshire','LS25 5JS');
/*!40000 ALTER TABLE `employee_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_email`
--

DROP TABLE IF EXISTS `employee_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `type` enum('Work','Home','Other') NOT NULL,
  `address` varchar(128) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `employee_email_ibfk_1` (`employee_id`),
  CONSTRAINT `employee_email_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_email`
--

LOCK TABLES `employee_email` WRITE;
/*!40000 ALTER TABLE `employee_email` DISABLE KEYS */;
INSERT INTO `employee_email` VALUES (1,1,'Work','dm@work.co.uk'),(2,1,'Home','dm@home.co.uk'),(3,2,'Work','gw@work.co.uk'),(4,2,'Home','gw@home.co.uk'),(5,3,'Work','dw@work.co.uk'),(6,3,'Home','dw@home.co.uk'),(7,3,'Other','dw@other.co.uk');
/*!40000 ALTER TABLE `employee_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_telephone`
--

DROP TABLE IF EXISTS `employee_telephone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_telephone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `type` enum('Main','Work','Home','Mobile','Accounts','Other1','Other2') NOT NULL,
  `tel_no` varchar(32) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uc_employee_type` (`employee_id`,`type`),
  CONSTRAINT `employee_telephone_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_telephone`
--

LOCK TABLES `employee_telephone` WRITE;
/*!40000 ALTER TABLE `employee_telephone` DISABLE KEYS */;
INSERT INTO `employee_telephone` VALUES (1,1,'Main','111222222'),(2,1,'Work','222111111'),(3,3,'Mobile','333111111'),(4,3,'Main','222111111'),(5,2,'Main','222111111'),(6,2,'Work','222111112'),(7,2,'Home','222111113'),(8,2,'Mobile','222111114');
/*!40000 ALTER TABLE `employee_telephone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `closed` tinyint(1) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `job_ibfk_1` (`site_id`),
  KEY `job_ibfk_2` (`employee_id`),
  KEY `job_ibfk_3` (`status_id`),
  CONSTRAINT `job_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `job_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `job_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `job_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (3,2,2,1,0,'2017-03-21 13:27:56');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`c2ssdbuser`@`localhost`*/ /*!50003 TRIGGER `insert_job` AFTER INSERT ON `job`
 FOR EACH ROW BEGIN
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
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`c2ssdbuser`@`localhost`*/ /*!50003 TRIGGER `update_job` AFTER UPDATE ON `job`
 FOR EACH ROW BEGIN
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
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `job_history`
--

DROP TABLE IF EXISTS `job_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `job_history_ibfk_1` (`job_id`),
  CONSTRAINT `job_history_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_history`
--

LOCK TABLES `job_history` WRITE;
/*!40000 ALTER TABLE `job_history` DISABLE KEYS */;
INSERT INTO `job_history` VALUES (5,3,2,2,1,'2017-03-21 13:27:56');
/*!40000 ALTER TABLE `job_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_status`
--

DROP TABLE IF EXISTS `job_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(32) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_status`
--

LOCK TABLES `job_status` WRITE;
/*!40000 ALTER TABLE `job_status` DISABLE KEYS */;
INSERT INTO `job_status` VALUES (1,'Status 1'),(2,'Status 2'),(3,'Status 3'),(4,'Status 4'),(5,'Status 5'),(6,'Status 6');
/*!40000 ALTER TABLE `job_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propel_migration`
--

DROP TABLE IF EXISTS `propel_migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propel_migration` (
  `version` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propel_migration`
--

LOCK TABLES `propel_migration` WRITE;
/*!40000 ALTER TABLE `propel_migration` DISABLE KEYS */;
INSERT INTO `propel_migration` VALUES (1492033635);
/*!40000 ALTER TABLE `propel_migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order`
--

DROP TABLE IF EXISTS `purchase_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quote_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `purchase_order_number` varchar(64) NOT NULL,
  `category_id` int(11) NOT NULL,
  `supplier_budget` decimal(15,2) NOT NULL DEFAULT '0.00',
  `description` text,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `purchase_order_ibfk_1` (`quote_id`),
  KEY `purchase_order_ibfk_2` (`supplier_id`),
  KEY `purchase_order_ibfk_3` (`category_id`),
  CONSTRAINT `purchase_order_ibfk_1` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchase_order_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchase_order_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order`
--

LOCK TABLES `purchase_order` WRITE;
/*!40000 ALTER TABLE `purchase_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order_calloff`
--

DROP TABLE IF EXISTS `purchase_order_calloff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order_calloff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `purchase_order_calloff_ibfk_1` (`purchase_order_id`),
  KEY `purchase_order_calloff_ibfk_2` (`delivery_option_id`),
  CONSTRAINT `purchase_order_calloff_ibfk_1` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchase_order_calloff_ibfk_2` FOREIGN KEY (`delivery_option_id`) REFERENCES `delivery_option` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order_calloff`
--

LOCK TABLES `purchase_order_calloff` WRITE;
/*!40000 ALTER TABLE `purchase_order_calloff` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_order_calloff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order_line_item`
--

DROP TABLE IF EXISTS `purchase_order_line_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order_line_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_order_calloff_id` int(11) NOT NULL,
  `description` varchar(64) NOT NULL,
  `cost_code` varchar(32) NOT NULL,
  `product_code` varchar(32) NOT NULL,
  `qty` int(5) NOT NULL,
  `rate` int(5) NOT NULL,
  `line_item_cost` decimal(15,2) NOT NULL DEFAULT '0.00',
  `days` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `purchase_order_line_item_ibfk_1` (`purchase_order_calloff_id`),
  CONSTRAINT `purchase_order_line_item_ibfk_1` FOREIGN KEY (`purchase_order_calloff_id`) REFERENCES `purchase_order_calloff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order_line_item`
--

LOCK TABLES `purchase_order_line_item` WRITE;
/*!40000 ALTER TABLE `purchase_order_line_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_order_line_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quote`
--

DROP TABLE IF EXISTS `quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quote_option_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `status` enum('In-Progress','Accepted','Disabled') NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `quote_ibfk_1` (`quote_option_id`),
  KEY `quote_ibfk_2` (`employee_id`),
  CONSTRAINT `quote_ibfk_1` FOREIGN KEY (`quote_option_id`) REFERENCES `quote_option` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quote_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote`
--

LOCK TABLES `quote` WRITE;
/*!40000 ALTER TABLE `quote` DISABLE KEYS */;
INSERT INTO `quote` VALUES (2,4,2,'In-Progress','2017-03-21 13:40:35'),(3,4,3,'In-Progress','2017-03-21 13:40:50');
/*!40000 ALTER TABLE `quote` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`c2ssdbuser`@`localhost`*/ /*!50003 TRIGGER `insert_quote` AFTER INSERT ON `quote`
 FOR EACH ROW BEGIN
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
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`c2ssdbuser`@`localhost`*/ /*!50003 TRIGGER `update_quote` AFTER UPDATE ON `quote`
 FOR EACH ROW BEGIN
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
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `quote_history`
--

DROP TABLE IF EXISTS `quote_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quote_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quote_id` int(11) NOT NULL,
  `quote_option_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `status` enum('In-Progress','Accepted','Disabled') NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `quote_history_ibfk_1` (`quote_id`),
  CONSTRAINT `quote_history_ibfk_1` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote_history`
--

LOCK TABLES `quote_history` WRITE;
/*!40000 ALTER TABLE `quote_history` DISABLE KEYS */;
INSERT INTO `quote_history` VALUES (2,2,4,2,'In-Progress','2017-03-21 13:40:35'),(3,3,4,3,'In-Progress','2017-03-21 13:40:50');
/*!40000 ALTER TABLE `quote_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quote_option`
--

DROP TABLE IF EXISTS `quote_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quote_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `quote_option_ibfk_2` (`employee_id`),
  KEY `quote_option_ibfk_1` (`job_id`),
  CONSTRAINT `quote_option_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quote_option_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote_option`
--

LOCK TABLES `quote_option` WRITE;
/*!40000 ALTER TABLE `quote_option` DISABLE KEYS */;
INSERT INTO `quote_option` VALUES (4,2,3,'2017-03-21 13:29:14');
/*!40000 ALTER TABLE `quote_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quote_work`
--

DROP TABLE IF EXISTS `quote_work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quote_work` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quote_id` int(11) NOT NULL,
  `quote_work_option_id` int(11) NOT NULL,
  `description` varchar(64) NOT NULL,
  `pricing` decimal(15,2) NOT NULL DEFAULT '0.00',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `quote_work_ibfk_1` (`quote_id`),
  KEY `quote_work_ibfk_2` (`quote_work_option_id`),
  CONSTRAINT `quote_work_ibfk_1` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quote_work_ibfk_2` FOREIGN KEY (`quote_work_option_id`) REFERENCES `quote_work_option` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote_work`
--

LOCK TABLES `quote_work` WRITE;
/*!40000 ALTER TABLE `quote_work` DISABLE KEYS */;
INSERT INTO `quote_work` VALUES (3,2,10,'1 Day stay in Hotel',10.00,'2017-03-21 13:43:27'),(5,2,11,'1 Day Labour',25.00,'2017-03-21 13:44:01'),(6,2,12,'Bag of Sand',15.00,'2017-03-21 13:44:27'),(7,3,10,'1 Day stay in Hotel',10.00,'2017-03-21 13:44:57'),(8,3,11,'1 Day Labour',25.00,'2017-03-21 13:45:16'),(9,3,12,'Bag of Sand',15.00,'2017-03-21 13:45:35'),(10,3,13,'Digger Rental',110.00,'2017-03-21 13:46:17');
/*!40000 ALTER TABLE `quote_work` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quote_work_option`
--

DROP TABLE IF EXISTS `quote_work_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quote_work_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quote_option_id` int(11) NOT NULL,
  `work_option_id` int(11) NOT NULL,
  `description` varchar(64) NOT NULL,
  `pricing` decimal(15,2) NOT NULL DEFAULT '0.00',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `quote_work_option_ibfk_1` (`quote_option_id`),
  KEY `quote_work_option_ibfk_2` (`work_option_id`),
  CONSTRAINT `quote_work_option_ibfk_1` FOREIGN KEY (`quote_option_id`) REFERENCES `quote_option` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quote_work_option_ibfk_2` FOREIGN KEY (`work_option_id`) REFERENCES `work_option` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote_work_option`
--

LOCK TABLES `quote_work_option` WRITE;
/*!40000 ALTER TABLE `quote_work_option` DISABLE KEYS */;
INSERT INTO `quote_work_option` VALUES (10,4,1,'1 Day stay in Hotel',10.00,'2017-03-21 13:31:52'),(11,4,9,'1 Day Labour',25.00,'2017-03-21 13:32:21'),(12,4,12,'Bag of Sand',15.00,'2017-03-21 13:32:45'),(13,4,13,'Digger Rental',110.00,'2017-03-21 13:33:16'),(14,4,15,'Train to location',75.25,'2017-03-21 13:33:43');
/*!40000 ALTER TABLE `quote_work_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `access_allowed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`task_id`) USING BTREE,
  KEY `roles_ibfk_2` (`task_id`),
  CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roles_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,1,0),(1,2,0),(1,3,0),(1,4,0),(1,5,0),(1,6,0),(1,7,0),(1,8,0),(1,9,0),(1,10,0),(2,1,0),(2,2,0),(2,3,0),(2,4,0),(2,5,0),(2,6,0),(2,7,0),(2,8,0),(2,9,0),(2,10,0),(3,1,0),(3,2,0),(3,3,0),(3,4,0),(3,5,0),(3,6,0),(3,7,0),(3,8,0),(3,9,0),(3,10,0);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `session_guid` varchar(64) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  `accessed` datetime NOT NULL,
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `browser` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `sessions_FI_1` (`userId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(32) NOT NULL,
  `shortname` varchar(32) NOT NULL,
  `companyregno` varchar(32) NOT NULL,
  `website` varchar(128) DEFAULT NULL,
  `default_email` varchar(128) DEFAULT NULL,
  `address1` varchar(32) NOT NULL,
  `address2` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `county` varchar(32) DEFAULT NULL,
  `postcode` varchar(12) NOT NULL,
  `tel_no` varchar(32) NOT NULL,
  `vat_rate` decimal(15,2) NOT NULL DEFAULT '0.00',
  `default_kpi_quote_rtnd_by` int(11) DEFAULT NULL,
  `default_credit_hard_limit` decimal(15,2) NOT NULL DEFAULT '0.00',
  `default_credit_soft_limit` decimal(15,2) NOT NULL DEFAULT '0.00',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'Sterling Services','Sterling','STERL001','http://www.sterling-services.co.uk/','info@sterling-services.co.uk','line 1','line 2','Somewhere','A county','A postcode','0800 111 2222',20.00,5,10000.00,5000.00,'2017-04-07 11:18:07');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`c2ssdbuser`@`localhost`*/ /*!50003 TRIGGER `insert_settings` AFTER INSERT ON `settings`
 FOR EACH ROW BEGIN
      INSERT INTO settings_history (
          `settings_id`,
          `company_name`,
          `shortname`,
          `companyregno`,
          `website`,
          `default_email`,
          `address1`,
          `address2`,
          `city`,
          `county`,
          `postcode`,
          `tel_no`,
          `vat_rate`,
          `default_kpi_quote_rtnd_by`,
          `default_credit_hard_limit`,
          `default_credit_soft_limit`
      ) VALUES (
          NEW.`id`,
          NEW.`company_name`,
          NEW.`shortname`,
          NEW.`companyregno`,
          NEW.`website`,
          NEW.`default_email`,
          NEW.`address1`,
          NEW.`address2`,
          NEW.`city`,
          NEW.`county`,
          NEW.`postcode`,
          NEW.`tel_no`,
          NEW.`vat_rate`,
          NEW.`default_kpi_quote_rtnd_by`,
          NEW.`default_credit_hard_limit`,
          NEW.`default_credit_soft_limit`
      );
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`c2ssdbuser`@`localhost`*/ /*!50003 TRIGGER `update_settings` AFTER UPDATE ON `settings`
 FOR EACH ROW BEGIN
      INSERT INTO settings_history (
          `settings_id`,
          `company_name`,
          `shortname`,
          `companyregno`,
          `website`,
          `default_email`,
          `address1`,
          `address2`,
          `city`,
          `county`,
          `postcode`,
          `tel_no`,
          `vat_rate`,
          `default_kpi_quote_rtnd_by`,
          `default_credit_hard_limit`,
          `default_credit_soft_limit`
      ) VALUES (
          NEW.`id`,
          NEW.`company_name`,
          NEW.`shortname`,
          NEW.`companyregno`,
          NEW.`website`,
          NEW.`default_email`,
          NEW.`address1`,
          NEW.`address2`,
          NEW.`city`,
          NEW.`county`,
          NEW.`postcode`,
          NEW.`tel_no`,
          NEW.`vat_rate`,
          NEW.`default_kpi_quote_rtnd_by`,
          NEW.`default_credit_hard_limit`,
          NEW.`default_credit_soft_limit`
      );
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `settings_history`
--

DROP TABLE IF EXISTS `settings_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `settings_id` int(11) NOT NULL,
  `company_name` varchar(32) NOT NULL,
  `shortname` varchar(32) NOT NULL,
  `companyregno` varchar(32) NOT NULL,
  `website` varchar(128) DEFAULT NULL,
  `default_email` varchar(128) DEFAULT NULL,
  `address1` varchar(32) NOT NULL,
  `address2` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `county` varchar(32) DEFAULT NULL,
  `postcode` varchar(12) NOT NULL,
  `tel_no` varchar(32) NOT NULL,
  `vat_rate` decimal(15,2) NOT NULL DEFAULT '0.00',
  `default_kpi_quote_rtnd_by` int(11) DEFAULT NULL,
  `default_credit_hard_limit` decimal(15,2) NOT NULL DEFAULT '0.00',
  `default_credit_soft_limit` decimal(15,2) NOT NULL DEFAULT '0.00',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `settings_history_ibfk_1` (`settings_id`),
  CONSTRAINT `settings_history_ibfk_1` FOREIGN KEY (`settings_id`) REFERENCES `settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings_history`
--

LOCK TABLES `settings_history` WRITE;
/*!40000 ALTER TABLE `settings_history` DISABLE KEYS */;
INSERT INTO `settings_history` VALUES (2,1,'Sterling Services','Sterling','STERL001','http://www.sterling-services.co.uk/','info@sterling-services.co.uk','line 1','line 2','Somewhere','A county','A postcode','0800 111 2222',17.50,5,10000.00,5000.00,'2017-04-07 11:17:56'),(3,1,'Sterling Services','Sterling','STERL001','http://www.sterling-services.co.uk/','info@sterling-services.co.uk','line 1','line 2','Somewhere','A county','A postcode','0800 111 2222',20.00,5,10000.00,5000.00,'2017-04-07 11:18:07');
/*!40000 ALTER TABLE `settings_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `shortname` varchar(32) DEFAULT NULL,
  `address1` varchar(32) NOT NULL,
  `address2` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `county` varchar(32) DEFAULT NULL,
  `postcode` varchar(12) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `site_ibfk_1` (`customer_id`),
  CONSTRAINT `site_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES (1,1,'GJW','GJ','Some Street','Near another','Nowhere','Some County','Pcode'),(2,1,'GJW1','GJ1','another street','','Liverpool','Merseyside','L1'),(3,1,'GJW2','GJ2','yet another street','','Liverpool','Merseyside','L1'),(4,2,'AS1','A1','street 1','','Manchester','Greater Manchester','M15'),(5,2,'AS2','A2','street 2','Bit near 1','Manchester','Greater Manchester','M15'),(6,3,'LEE1','L1','Leeds street 2','','Leeds','Yorkshire','LS1');
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_contact`
--

DROP TABLE IF EXISTS `site_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `type` enum('Main','Security','Other1','Other2') NOT NULL,
  `first_name` varchar(32) DEFAULT NULL,
  `last_name` varchar(32) DEFAULT NULL,
  `tel_no` varchar(32) NOT NULL,
  `email_address` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `site_contact_ibfk_1` (`site_id`),
  CONSTRAINT `site_contact_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_contact`
--

LOCK TABLES `site_contact` WRITE;
/*!40000 ALTER TABLE `site_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `supplier_ibfk_1` (`employee_id`),
  KEY `supplier_ibfk_2` (`terms_id`),
  CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplier_ibfk_2` FOREIGN KEY (`terms_id`) REFERENCES `terms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,2,'Travis Perkins','TPERK','T001','https://www.travisperkins.co.uk/','dummy@travisperkins-test.co.uk','UNK','UNK',10000,1000,7500,2,'2017-03-21 10:27:52');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`c2ssdbuser`@`localhost`*/ /*!50003 TRIGGER `insert_supplier` AFTER INSERT ON `supplier`
 FOR EACH ROW BEGIN
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
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`c2ssdbuser`@`localhost`*/ /*!50003 TRIGGER `update_supplier` AFTER UPDATE ON `supplier`
 FOR EACH ROW BEGIN
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
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `supplier_address`
--

DROP TABLE IF EXISTS `supplier_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL,
  `type` enum('Billing','Trading','Other1','Other2') NOT NULL,
  `address1` varchar(32) NOT NULL,
  `address2` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `county` varchar(32) DEFAULT NULL,
  `postcode` varchar(12) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `supplier_address_ibfk_1` (`supplier_id`),
  CONSTRAINT `supplier_address_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_address`
--

LOCK TABLES `supplier_address` WRITE;
/*!40000 ALTER TABLE `supplier_address` DISABLE KEYS */;
INSERT INTO `supplier_address` VALUES (1,1,'Billing','An address line 1','An address line 2','A city','The county','PC1 CD02');
/*!40000 ALTER TABLE `supplier_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_contact`
--

DROP TABLE IF EXISTS `supplier_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL,
  `type` enum('Main','Accounts','Other1','Other2') NOT NULL,
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `tel_no` varchar(32) NOT NULL,
  `email_address` varchar(128) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `supplier_contact_ibfk_1` (`supplier_id`),
  CONSTRAINT `supplier_contact_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_contact`
--

LOCK TABLES `supplier_contact` WRITE;
/*!40000 ALTER TABLE `supplier_contact` DISABLE KEYS */;
INSERT INTO `supplier_contact` VALUES (1,1,'Main','Main','Contact','Main tel','email@main.co.uk');
/*!40000 ALTER TABLE `supplier_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_history`
--

DROP TABLE IF EXISTS `supplier_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `supplier_history_ibfk_1` (`supplier_id`),
  CONSTRAINT `supplier_history_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_history`
--

LOCK TABLES `supplier_history` WRITE;
/*!40000 ALTER TABLE `supplier_history` DISABLE KEYS */;
INSERT INTO `supplier_history` VALUES (1,1,2,'Travis Perkins','TPERK','T001','https://www.travisperkins.co.uk/','info@travisperkins-test.co.uk','UNK','UNK',10000,1000,7500,2,'2017-03-21 10:27:52'),(2,1,2,'Travis Perkins','TPERK','T001','https://www.travisperkins.co.uk/','dummy@travisperkins-test.co.uk','UNK','UNK',10000,1000,7500,2,'2017-03-21 10:28:39');
/*!40000 ALTER TABLE `supplier_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(32) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,'Login'),(2,'Customer Maintenance'),(3,'Quotes'),(4,'Sales Orders'),(5,'Cancellations'),(6,'Finance'),(7,'Financial Reporting'),(8,'Customer Reporting'),(9,'Debt Collection'),(10,'Work Sheets');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(32) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'Civils Team 1'),(2,'Civils Team 2'),(3,'Civils Team 3'),(4,'Civils Team 4'),(5,'Civils Team 5'),(6,'Build Team 1'),(7,'Build Team 2'),(8,'Build Team 3'),(9,'Build Team 4'),(10,'Build Team 5');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terms`
--

DROP TABLE IF EXISTS `terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `terms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(32) NOT NULL,
  `days` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terms`
--

LOCK TABLES `terms` WRITE;
/*!40000 ALTER TABLE `terms` DISABLE KEYS */;
INSERT INTO `terms` VALUES (1,'30 Days',30),(2,'Month End',0),(3,'None',14);
/*!40000 ALTER TABLE `terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(16) DEFAULT NULL,
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `password` varchar(64) NOT NULL,
  `userGUID` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Mr','Darren','Mallett','dm@work.co.uk','2017-03-13',NULL,'letmeinplease',''),(2,'Mr','Graham','Watson','gw@work.co.uk','2017-03-13',NULL,'letmeinplease',''),(3,'Mr','David','White','dw@work.co.uk','2017-03-13',NULL,'letmeinpleaseaswell','');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`c2ssdbuser`@`localhost`*/ /*!50003 TRIGGER `insert_user` AFTER INSERT ON `user`
 FOR EACH ROW BEGIN
    INSERT INTO roles (user_id,task_id,access_allowed) SELECT NEW.id, t.id, false FROM task t;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `view_asset_allocation`
--

DROP TABLE IF EXISTS `view_asset_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `view_asset_allocation` (
  `id` int(11) NOT NULL,
  `asset` varchar(64) DEFAULT NULL,
  `asset_type` varchar(64) DEFAULT NULL,
  `allocated_to` varchar(66) DEFAULT NULL,
  `allocated_on` varchar(19) DEFAULT NULL,
  `allocated_employee_id` int(11) DEFAULT NULL,
  `tracker_id` varchar(64) DEFAULT NULL,
  `location` varchar(32) DEFAULT NULL,
  `condition` varchar(128) DEFAULT NULL,
  `by` varchar(66) DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `view_asset_allocation`
--

LOCK TABLES `view_asset_allocation` WRITE;
/*!40000 ALTER TABLE `view_asset_allocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_asset_allocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `view_employees`
--

DROP TABLE IF EXISTS `view_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `view_employees` (
  `Name` varchar(66) NOT NULL,
  `Manager` varchar(66) DEFAULT NULL,
  `Reports` varchar(3) DEFAULT NULL,
  `Division` varchar(32) DEFAULT NULL,
  `Team` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `view_employees`
--

LOCK TABLES `view_employees` WRITE;
/*!40000 ALTER TABLE `view_employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `view_quote`
--

DROP TABLE IF EXISTS `view_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `view_quote` (
  `site` varchar(80) NOT NULL,
  `customer` varchar(32) DEFAULT NULL,
  `status` enum('In-Progress','Accepted','Disabled') DEFAULT NULL,
  `by` varchar(66) DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`site`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `view_quote`
--

LOCK TABLES `view_quote` WRITE;
/*!40000 ALTER TABLE `view_quote` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_quote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `view_roles`
--

DROP TABLE IF EXISTS `view_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `view_roles` (
  `Name` varchar(66) NOT NULL,
  `description` varchar(32) DEFAULT NULL,
  `Access_Allowed` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `view_roles`
--

LOCK TABLES `view_roles` WRITE;
/*!40000 ALTER TABLE `view_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_option`
--

DROP TABLE IF EXISTS `work_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `code` varchar(16) NOT NULL,
  `description` varchar(64) NOT NULL,
  `default_pricing` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `work_option_uq` (`code`),
  KEY `work_option_ibfk_1` (`category_id`),
  CONSTRAINT `work_option_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_option`
--

LOCK TABLES `work_option` WRITE;
/*!40000 ALTER TABLE `work_option` DISABLE KEYS */;
INSERT INTO `work_option` VALUES (1,1,'ACCOM001','1 Day stay in Hotel',10.00),(2,1,'ACCOM002','2 Day stay in Hotel',25.00),(3,1,'ACCOM003','3 Day stay in Hotel',38.50),(4,1,'ACCOM004','4 Day stay in Hotel',49.50),(5,1,'ACCOM005','5 Day stay in Hotel',22.50),(6,1,'ACCOMW01','1 Week stay in Hotel',30.00),(7,1,'ACCOMW02','2 Week stay in Hotel',50.00),(8,1,'ACCOMM01','1 Month stay in Hotel',15.75),(9,2,'LABD01','1 Day Labour',25.00),(10,2,'LABW01','1 Week Labour',100.00),(11,2,'LABM01','1 Month Labour',225.00),(12,3,'MATBAG','Bag of Sand',15.00),(13,4,'PLTDIG','Digger Rental',110.00),(14,5,'WSTSKIP','Skip Hire',95.00),(15,6,'TRANSLOC','Train to location',75.25),(16,7,'OTHUNK','Unforeseen site clearance',55.25);
/*!40000 ALTER TABLE `work_option` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-12 23:00:32
