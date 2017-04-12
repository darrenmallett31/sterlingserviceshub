
# This is a fix for InnoDB in MySQL >= 4.1.x
# It "suspends judgement" for fkey relationships until are tables are set.
SET FOREIGN_KEY_CHECKS = 0;

-- ---------------------------------------------------------------------
-- asset
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `asset`;

CREATE TABLE `asset`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `asset_type_id` INTEGER,
    `employee_id` INTEGER NOT NULL,
    `name` VARCHAR(64) NOT NULL,
    `date_allocated` DATETIME,
    `date_to_service` DATETIME,
    `make` VARCHAR(32),
    `model` VARCHAR(32),
    `serial_number` VARCHAR(32),
    `internal_id` VARCHAR(32),
    `in_service_date` VARCHAR(32),
    `total_cost` DECIMAL(15,2) DEFAULT 0.00 NOT NULL,
    `purchase_date` DATETIME,
    `depreciation_years` INTEGER,
    `depreciation_rate` DECIMAL(15,2) DEFAULT 0.00 NOT NULL,
    `book_value` DECIMAL(15,2) DEFAULT 0.00 NOT NULL,
    `supplier_id` INTEGER,
    `tracker_id` VARCHAR(64),
    `allocated_employee_id` INTEGER,
    `allocation_status` TINYINT(1),
    `location` VARCHAR(32),
    `notes` TEXT,
    `condition` VARCHAR(128) NOT NULL,
    `date_updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `asset_ibfk_1` (`asset_type_id`),
    INDEX `asset_ibfk_2` (`employee_id`),
    CONSTRAINT `asset_ibfk_1`
        FOREIGN KEY (`asset_type_id`)
        REFERENCES `asset_type` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT `asset_ibfk_2`
        FOREIGN KEY (`employee_id`)
        REFERENCES `employee` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- asset_history
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `asset_history`;

CREATE TABLE `asset_history`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `asset_id` INTEGER NOT NULL,
    `asset_type_id` INTEGER,
    `employee_id` INTEGER NOT NULL,
    `name` VARCHAR(64) NOT NULL,
    `date_allocated` DATETIME,
    `date_to_service` DATETIME,
    `make` VARCHAR(32),
    `model` VARCHAR(32),
    `serial_number` VARCHAR(32),
    `internal_id` VARCHAR(32),
    `in_service_date` VARCHAR(32),
    `total_cost` DECIMAL(15,2) DEFAULT 0.00 NOT NULL,
    `purchase_date` DATETIME,
    `depreciation_years` INTEGER,
    `depreciation_rate` DECIMAL(15,2) DEFAULT 0.00 NOT NULL,
    `book_value` DECIMAL(15,2) DEFAULT 0.00 NOT NULL,
    `supplier_id` INTEGER,
    `tracker_id` VARCHAR(64),
    `allocated_employee_id` INTEGER,
    `allocation_status` TINYINT(1),
    `location` VARCHAR(32),
    `notes` TEXT,
    `condition` VARCHAR(128) NOT NULL,
    `date_updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `asset_history_ibfk_1` (`asset_id`),
    CONSTRAINT `asset_history_ibfk_1`
        FOREIGN KEY (`asset_id`)
        REFERENCES `asset` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- asset_type
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `asset_type`;

CREATE TABLE `asset_type`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `days_to_review` INTEGER DEFAULT 0 NOT NULL,
    `type` VARCHAR(64) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- category
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(16) NOT NULL,
    `description` VARCHAR(64) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- customer
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `employee_id` INTEGER NOT NULL,
    `name` VARCHAR(32) NOT NULL,
    `shortname` VARCHAR(32) NOT NULL,
    `type` enum('Domestic-Private','Commercial-Retail','Education-Direct','Local Authority') NOT NULL,
    `companyregno` VARCHAR(32) NOT NULL,
    `website` VARCHAR(128),
    `quote_email` VARCHAR(128),
    `kpi_quote_rtnd_by` INTEGER,
    `experian_score` VARCHAR(32) NOT NULL,
    `credit_score` VARCHAR(32) NOT NULL,
    `credit_hard_limit` INTEGER NOT NULL,
    `credit_soft_limit` INTEGER NOT NULL,
    `credit_outstanding` INTEGER NOT NULL,
    `terms_id` INTEGER NOT NULL,
    `kpi_agreed` TINYINT(1) NOT NULL,
    `quote_breakdown_rqrd` TINYINT(1) NOT NULL,
    `quote_rtn_trigger` INTEGER NOT NULL,
    `days_to_review` INTEGER NOT NULL,
    `date_updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `customer_ibfk_1` (`employee_id`),
    INDEX `customer_ibfk_2` (`terms_id`),
    CONSTRAINT `customer_ibfk_1`
        FOREIGN KEY (`employee_id`)
        REFERENCES `employee` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT `customer_ibfk_2`
        FOREIGN KEY (`terms_id`)
        REFERENCES `terms` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- customer_address
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `customer_address`;

CREATE TABLE `customer_address`
(
    `customer_id` INTEGER NOT NULL,
    `type` enum('Billing','Trading','Other1','Other2') NOT NULL,
    `address1` VARCHAR(32) NOT NULL,
    `address2` VARCHAR(32),
    `city` VARCHAR(32),
    `county` VARCHAR(32),
    `postcode` VARCHAR(12) NOT NULL,
    PRIMARY KEY (`customer_id`,`type`),
    CONSTRAINT `customer_address_ibfk_1`
        FOREIGN KEY (`customer_id`)
        REFERENCES `customer` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- customer_contact
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `customer_contact`;

CREATE TABLE `customer_contact`
(
    `customer_id` INTEGER NOT NULL,
    `type` enum('Main','Accounts','Other1','Other2') NOT NULL,
    `first_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32) NOT NULL,
    `tel_no` VARCHAR(32) NOT NULL,
    `email_address` VARCHAR(128) NOT NULL,
    PRIMARY KEY (`customer_id`,`type`),
    CONSTRAINT `customer_contact_ibfk_1`
        FOREIGN KEY (`customer_id`)
        REFERENCES `customer` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- customer_history
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `customer_history`;

CREATE TABLE `customer_history`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `customer_id` INTEGER NOT NULL,
    `employee_id` INTEGER NOT NULL,
    `name` VARCHAR(32) NOT NULL,
    `shortname` VARCHAR(32) NOT NULL,
    `type` enum('Domestic-Private','Commercial-Retail','Education-Direct','Local Authority') NOT NULL,
    `companyregno` VARCHAR(32) NOT NULL,
    `website` VARCHAR(128),
    `quote_email` VARCHAR(128),
    `kpi_quote_rtnd_by` INTEGER,
    `experian_score` VARCHAR(32) NOT NULL,
    `credit_score` VARCHAR(32) NOT NULL,
    `credit_hard_limit` INTEGER NOT NULL,
    `credit_soft_limit` INTEGER NOT NULL,
    `credit_outstanding` INTEGER NOT NULL,
    `terms_id` INTEGER NOT NULL,
    `kpi_agreed` TINYINT(1) NOT NULL,
    `quote_breakdown_rqrd` TINYINT(1) NOT NULL,
    `quote_rtn_trigger` INTEGER NOT NULL,
    `days_to_review` INTEGER NOT NULL,
    `date_updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `customer_history_ibfk_1` (`customer_id`),
    CONSTRAINT `customer_history_ibfk_1`
        FOREIGN KEY (`customer_id`)
        REFERENCES `customer` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- delivery_option
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `delivery_option`;

CREATE TABLE `delivery_option`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `description` VARCHAR(64) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- division
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `division`;

CREATE TABLE `division`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `description` VARCHAR(32) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- documentation
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `documentation`;

CREATE TABLE `documentation`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `employee_id` INTEGER NOT NULL,
    `name` VARCHAR(64) NOT NULL,
    `description` VARCHAR(256) NOT NULL,
    `header` TEXT,
    `main_body` TEXT,
    `footer` TEXT,
    `url_path` VARCHAR(256),
    `date_updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `documentation_ibfk_1` (`employee_id`),
    CONSTRAINT `documentation_ibfk_1`
        FOREIGN KEY (`employee_id`)
        REFERENCES `employee` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- documentation_history
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `documentation_history`;

CREATE TABLE `documentation_history`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `documentation_id` INTEGER NOT NULL,
    `employee_id` INTEGER NOT NULL,
    `name` VARCHAR(64) NOT NULL,
    `description` VARCHAR(256) NOT NULL,
    `header` TEXT,
    `main_body` TEXT,
    `footer` TEXT,
    `url_path` VARCHAR(256),
    `date_updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `documentation_history_ibfk_1` (`documentation_id`),
    CONSTRAINT `documentation_history_ibfk_1`
        FOREIGN KEY (`documentation_id`)
        REFERENCES `documentation` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- employee
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `is_manager` TINYINT(1),
    `emp_no` VARCHAR(32) NOT NULL,
    `job_title` VARCHAR(64) NOT NULL,
    `job_role` VARCHAR(64) NOT NULL,
    `manager_id` INTEGER NOT NULL,
    `division_id` INTEGER NOT NULL,
    `team_id` INTEGER,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `uc_emp_no` (`emp_no`),
    INDEX `employee_ibfk_1` (`user_id`),
    INDEX `employee_ibfk_2` (`division_id`),
    INDEX `employee_ibfk_3` (`manager_id`),
    INDEX `employee_ibfk_4` (`team_id`),
    CONSTRAINT `employee_ibfk_1`
        FOREIGN KEY (`user_id`)
        REFERENCES `user` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT `employee_ibfk_2`
        FOREIGN KEY (`division_id`)
        REFERENCES `division` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT `employee_ibfk_3`
        FOREIGN KEY (`manager_id`)
        REFERENCES `employee` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT `employee_ibfk_4`
        FOREIGN KEY (`team_id`)
        REFERENCES `team` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- employee_address
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `employee_address`;

CREATE TABLE `employee_address`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `employee_id` INTEGER NOT NULL,
    `address1` VARCHAR(32) NOT NULL,
    `address2` VARCHAR(32),
    `city` VARCHAR(32),
    `county` VARCHAR(32),
    `postcode` VARCHAR(12) NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `employee_address_ibfk_1` (`employee_id`),
    CONSTRAINT `employee_address_ibfk_1`
        FOREIGN KEY (`employee_id`)
        REFERENCES `employee` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- employee_email
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `employee_email`;

CREATE TABLE `employee_email`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `employee_id` INTEGER NOT NULL,
    `type` enum('Work','Home','Other') NOT NULL,
    `address` VARCHAR(128) NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `employee_email_ibfk_1` (`employee_id`),
    CONSTRAINT `employee_email_ibfk_1`
        FOREIGN KEY (`employee_id`)
        REFERENCES `employee` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- employee_telephone
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `employee_telephone`;

CREATE TABLE `employee_telephone`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `employee_id` INTEGER NOT NULL,
    `type` enum('Main','Work','Home','Mobile','Accounts','Other1','Other2') NOT NULL,
    `tel_no` VARCHAR(32) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `uc_employee_type` (`employee_id`, `type`),
    CONSTRAINT `employee_telephone_ibfk_1`
        FOREIGN KEY (`employee_id`)
        REFERENCES `employee` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- job
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `job`;

CREATE TABLE `job`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `site_id` INTEGER NOT NULL,
    `employee_id` INTEGER NOT NULL,
    `status_id` INTEGER NOT NULL,
    `closed` TINYINT(1) NOT NULL,
    `date_updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `job_ibfk_1` (`site_id`),
    INDEX `job_ibfk_2` (`employee_id`),
    INDEX `job_ibfk_3` (`status_id`),
    CONSTRAINT `job_ibfk_1`
        FOREIGN KEY (`site_id`)
        REFERENCES `site` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT `job_ibfk_2`
        FOREIGN KEY (`employee_id`)
        REFERENCES `employee` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT `job_ibfk_3`
        FOREIGN KEY (`status_id`)
        REFERENCES `job_status` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- job_history
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `job_history`;

CREATE TABLE `job_history`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `job_id` INTEGER NOT NULL,
    `site_id` INTEGER NOT NULL,
    `employee_id` INTEGER NOT NULL,
    `status_id` INTEGER NOT NULL,
    `date_updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `job_history_ibfk_1` (`job_id`),
    CONSTRAINT `job_history_ibfk_1`
        FOREIGN KEY (`job_id`)
        REFERENCES `job` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- job_status
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `job_status`;

CREATE TABLE `job_status`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `description` VARCHAR(32) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- purchase_order
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `purchase_order`;

CREATE TABLE `purchase_order`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `quote_id` INTEGER NOT NULL,
    `supplier_id` INTEGER NOT NULL,
    `purchase_order_number` VARCHAR(64) NOT NULL,
    `category_id` INTEGER NOT NULL,
    `supplier_budget` DECIMAL(15,2) DEFAULT 0.00 NOT NULL,
    `description` TEXT,
    `date_updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `purchase_order_ibfk_1` (`quote_id`),
    INDEX `purchase_order_ibfk_2` (`supplier_id`),
    INDEX `purchase_order_ibfk_3` (`category_id`),
    CONSTRAINT `purchase_order_ibfk_1`
        FOREIGN KEY (`quote_id`)
        REFERENCES `quote` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT `purchase_order_ibfk_2`
        FOREIGN KEY (`supplier_id`)
        REFERENCES `supplier` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT `purchase_order_ibfk_3`
        FOREIGN KEY (`category_id`)
        REFERENCES `category` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- purchase_order_calloff
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `purchase_order_calloff`;

CREATE TABLE `purchase_order_calloff`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `purchase_order_id` INTEGER NOT NULL,
    `delivery_contact` VARCHAR(32),
    `contact_tel_no` VARCHAR(32) NOT NULL,
    `delivery_or_collection` enum('Delivery','Collection') NOT NULL,
    `pay_by` enum('Account','Credit Card','BACS') NOT NULL,
    `notes` TEXT,
    `delivery_option_id` INTEGER NOT NULL,
    `delivery_pickup_date` DATETIME,
    `total_net_cost` DECIMAL(15,2) DEFAULT 0.00 NOT NULL,
    `vat_rate` INTEGER(6),
    `vat_amount` DECIMAL(15,2) DEFAULT 0.00 NOT NULL,
    `total_inc_vat` DECIMAL(15,2) DEFAULT 0.00 NOT NULL,
    `po_sent_date` DATETIME NOT NULL,
    `date_created` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `purchase_order_calloff_ibfk_1` (`purchase_order_id`),
    INDEX `purchase_order_calloff_ibfk_2` (`delivery_option_id`),
    CONSTRAINT `purchase_order_calloff_ibfk_1`
        FOREIGN KEY (`purchase_order_id`)
        REFERENCES `purchase_order` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT `purchase_order_calloff_ibfk_2`
        FOREIGN KEY (`delivery_option_id`)
        REFERENCES `delivery_option` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- purchase_order_line_item
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `purchase_order_line_item`;

CREATE TABLE `purchase_order_line_item`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `purchase_order_calloff_id` INTEGER NOT NULL,
    `description` VARCHAR(64) NOT NULL,
    `cost_code` VARCHAR(32) NOT NULL,
    `product_code` VARCHAR(32) NOT NULL,
    `qty` INTEGER(5) NOT NULL,
    `rate` INTEGER(5) NOT NULL,
    `line_item_cost` DECIMAL(15,2) DEFAULT 0.00 NOT NULL,
    `days` INTEGER,
    PRIMARY KEY (`id`),
    INDEX `purchase_order_line_item_ibfk_1` (`purchase_order_calloff_id`),
    CONSTRAINT `purchase_order_line_item_ibfk_1`
        FOREIGN KEY (`purchase_order_calloff_id`)
        REFERENCES `purchase_order_calloff` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- quote
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `quote`;

CREATE TABLE `quote`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `quote_option_id` INTEGER NOT NULL,
    `employee_id` INTEGER NOT NULL,
    `status` enum('In-Progress','Accepted','Disabled') NOT NULL,
    `date_updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `quote_ibfk_1` (`quote_option_id`),
    INDEX `quote_ibfk_2` (`employee_id`),
    CONSTRAINT `quote_ibfk_1`
        FOREIGN KEY (`quote_option_id`)
        REFERENCES `quote_option` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT `quote_ibfk_2`
        FOREIGN KEY (`employee_id`)
        REFERENCES `employee` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- quote_history
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `quote_history`;

CREATE TABLE `quote_history`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `quote_id` INTEGER NOT NULL,
    `quote_option_id` INTEGER NOT NULL,
    `employee_id` INTEGER NOT NULL,
    `status` enum('In-Progress','Accepted','Disabled') NOT NULL,
    `date_updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `quote_history_ibfk_1` (`quote_id`),
    CONSTRAINT `quote_history_ibfk_1`
        FOREIGN KEY (`quote_id`)
        REFERENCES `quote` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- quote_option
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `quote_option`;

CREATE TABLE `quote_option`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `employee_id` INTEGER NOT NULL,
    `job_id` INTEGER NOT NULL,
    `date_updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `quote_option_ibfk_2` (`employee_id`),
    INDEX `quote_option_ibfk_1` (`job_id`),
    CONSTRAINT `quote_option_ibfk_1`
        FOREIGN KEY (`job_id`)
        REFERENCES `job` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT `quote_option_ibfk_2`
        FOREIGN KEY (`employee_id`)
        REFERENCES `employee` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- quote_work
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `quote_work`;

CREATE TABLE `quote_work`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `quote_id` INTEGER NOT NULL,
    `quote_work_option_id` INTEGER NOT NULL,
    `description` VARCHAR(64) NOT NULL,
    `pricing` DECIMAL(15,2) DEFAULT 0.00 NOT NULL,
    `date_updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `quote_work_ibfk_1` (`quote_id`),
    INDEX `quote_work_ibfk_2` (`quote_work_option_id`),
    CONSTRAINT `quote_work_ibfk_1`
        FOREIGN KEY (`quote_id`)
        REFERENCES `quote` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT `quote_work_ibfk_2`
        FOREIGN KEY (`quote_work_option_id`)
        REFERENCES `quote_work_option` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- quote_work_option
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `quote_work_option`;

CREATE TABLE `quote_work_option`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `quote_option_id` INTEGER NOT NULL,
    `work_option_id` INTEGER NOT NULL,
    `description` VARCHAR(64) NOT NULL,
    `pricing` DECIMAL(15,2) DEFAULT 0.00 NOT NULL,
    `date_updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `quote_work_option_ibfk_1` (`quote_option_id`),
    INDEX `quote_work_option_ibfk_2` (`work_option_id`),
    CONSTRAINT `quote_work_option_ibfk_1`
        FOREIGN KEY (`quote_option_id`)
        REFERENCES `quote_option` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT `quote_work_option_ibfk_2`
        FOREIGN KEY (`work_option_id`)
        REFERENCES `work_option` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- roles
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles`
(
    `user_id` INTEGER NOT NULL,
    `task_id` INTEGER NOT NULL,
    `access_allowed` TINYINT(1),
    PRIMARY KEY (`user_id`,`task_id`),
    INDEX `roles_ibfk_2` (`task_id`),
    CONSTRAINT `roles_ibfk_1`
        FOREIGN KEY (`user_id`)
        REFERENCES `user` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT `roles_ibfk_2`
        FOREIGN KEY (`task_id`)
        REFERENCES `task` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- sessions
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userId` INTEGER NOT NULL,
    `session_guid` VARCHAR(64) DEFAULT '' NOT NULL,
    `created_at` DATETIME NOT NULL,
    `accessed` DATETIME NOT NULL,
    `ip_address` VARCHAR(64) DEFAULT '' NOT NULL,
    `browser` VARCHAR(64) DEFAULT '' NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `sessions_FI_1` (`userId`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- settings
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `company_name` VARCHAR(32) NOT NULL,
    `shortname` VARCHAR(32) NOT NULL,
    `companyregno` VARCHAR(32) NOT NULL,
    `website` VARCHAR(128),
    `default_email` VARCHAR(128),
    `address1` VARCHAR(32) NOT NULL,
    `address2` VARCHAR(32),
    `city` VARCHAR(32),
    `county` VARCHAR(32),
    `postcode` VARCHAR(12) NOT NULL,
    `tel_no` VARCHAR(32) NOT NULL,
    `vat_rate` DECIMAL(15,2) DEFAULT 0.00 NOT NULL,
    `default_kpi_quote_rtnd_by` INTEGER,
    `default_credit_hard_limit` DECIMAL(15,2) DEFAULT 0.00 NOT NULL,
    `default_credit_soft_limit` DECIMAL(15,2) DEFAULT 0.00 NOT NULL,
    `date_updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- settings_history
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `settings_history`;

CREATE TABLE `settings_history`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `settings_id` INTEGER NOT NULL,
    `company_name` VARCHAR(32) NOT NULL,
    `shortname` VARCHAR(32) NOT NULL,
    `companyregno` VARCHAR(32) NOT NULL,
    `website` VARCHAR(128),
    `default_email` VARCHAR(128),
    `address1` VARCHAR(32) NOT NULL,
    `address2` VARCHAR(32),
    `city` VARCHAR(32),
    `county` VARCHAR(32),
    `postcode` VARCHAR(12) NOT NULL,
    `tel_no` VARCHAR(32) NOT NULL,
    `vat_rate` DECIMAL(15,2) DEFAULT 0.00 NOT NULL,
    `default_kpi_quote_rtnd_by` INTEGER,
    `default_credit_hard_limit` DECIMAL(15,2) DEFAULT 0.00 NOT NULL,
    `default_credit_soft_limit` DECIMAL(15,2) DEFAULT 0.00 NOT NULL,
    `date_updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `settings_history_ibfk_1` (`settings_id`),
    CONSTRAINT `settings_history_ibfk_1`
        FOREIGN KEY (`settings_id`)
        REFERENCES `settings` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- site
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `site`;

CREATE TABLE `site`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `customer_id` INTEGER NOT NULL,
    `name` VARCHAR(32) NOT NULL,
    `shortname` VARCHAR(32),
    `address1` VARCHAR(32) NOT NULL,
    `address2` VARCHAR(32),
    `city` VARCHAR(32),
    `county` VARCHAR(32),
    `postcode` VARCHAR(12) NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `site_ibfk_1` (`customer_id`),
    CONSTRAINT `site_ibfk_1`
        FOREIGN KEY (`customer_id`)
        REFERENCES `customer` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- site_contact
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `site_contact`;

CREATE TABLE `site_contact`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `site_id` INTEGER NOT NULL,
    `type` enum('Main','Security','Other1','Other2') NOT NULL,
    `first_name` VARCHAR(32),
    `last_name` VARCHAR(32),
    `tel_no` VARCHAR(32) NOT NULL,
    `email_address` VARCHAR(128),
    PRIMARY KEY (`id`),
    INDEX `site_contact_ibfk_1` (`site_id`),
    CONSTRAINT `site_contact_ibfk_1`
        FOREIGN KEY (`site_id`)
        REFERENCES `site` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- supplier
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `employee_id` INTEGER NOT NULL,
    `name` VARCHAR(32) NOT NULL,
    `shortname` VARCHAR(32) NOT NULL,
    `companyregno` VARCHAR(32) NOT NULL,
    `website` VARCHAR(128),
    `quote_email` VARCHAR(128),
    `experian_score` VARCHAR(32) NOT NULL,
    `credit_score` VARCHAR(32) NOT NULL,
    `credit_hard_limit` INTEGER NOT NULL,
    `credit_soft_limit` INTEGER NOT NULL,
    `credit_outstanding` INTEGER NOT NULL,
    `terms_id` INTEGER NOT NULL,
    `date_updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `supplier_ibfk_1` (`employee_id`),
    INDEX `supplier_ibfk_2` (`terms_id`),
    CONSTRAINT `supplier_ibfk_1`
        FOREIGN KEY (`employee_id`)
        REFERENCES `employee` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT `supplier_ibfk_2`
        FOREIGN KEY (`terms_id`)
        REFERENCES `terms` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- supplier_address
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `supplier_address`;

CREATE TABLE `supplier_address`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `supplier_id` INTEGER NOT NULL,
    `type` enum('Billing','Trading','Other1','Other2') NOT NULL,
    `address1` VARCHAR(32) NOT NULL,
    `address2` VARCHAR(32),
    `city` VARCHAR(32),
    `county` VARCHAR(32),
    `postcode` VARCHAR(12) NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `supplier_address_ibfk_1` (`supplier_id`),
    CONSTRAINT `supplier_address_ibfk_1`
        FOREIGN KEY (`supplier_id`)
        REFERENCES `supplier` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- supplier_contact
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `supplier_contact`;

CREATE TABLE `supplier_contact`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `supplier_id` INTEGER NOT NULL,
    `type` enum('Main','Accounts','Other1','Other2') NOT NULL,
    `first_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32) NOT NULL,
    `tel_no` VARCHAR(32) NOT NULL,
    `email_address` VARCHAR(128) NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `supplier_contact_ibfk_1` (`supplier_id`),
    CONSTRAINT `supplier_contact_ibfk_1`
        FOREIGN KEY (`supplier_id`)
        REFERENCES `supplier` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- supplier_history
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `supplier_history`;

CREATE TABLE `supplier_history`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `supplier_id` INTEGER NOT NULL,
    `employee_id` INTEGER NOT NULL,
    `name` VARCHAR(32) NOT NULL,
    `shortname` VARCHAR(32) NOT NULL,
    `companyregno` VARCHAR(32) NOT NULL,
    `website` VARCHAR(128),
    `quote_email` VARCHAR(128),
    `experian_score` VARCHAR(32) NOT NULL,
    `credit_score` VARCHAR(32) NOT NULL,
    `credit_hard_limit` INTEGER NOT NULL,
    `credit_soft_limit` INTEGER NOT NULL,
    `credit_outstanding` INTEGER NOT NULL,
    `terms_id` INTEGER NOT NULL,
    `date_updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `supplier_history_ibfk_1` (`supplier_id`),
    CONSTRAINT `supplier_history_ibfk_1`
        FOREIGN KEY (`supplier_id`)
        REFERENCES `supplier` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- task
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `task`;

CREATE TABLE `task`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `description` VARCHAR(32) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- team
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `team`;

CREATE TABLE `team`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `description` VARCHAR(32) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- terms
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `terms`;

CREATE TABLE `terms`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `description` VARCHAR(32) NOT NULL,
    `days` INTEGER,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- user
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(16),
    `first_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32) NOT NULL,
    `email_address` VARCHAR(255) NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE,
    `password` VARCHAR(64) NOT NULL,
    `userGUID` VARCHAR(255) DEFAULT '' NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- view_asset_allocation
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `view_asset_allocation`;

CREATE TABLE `view_asset_allocation`
(
    `id` INTEGER NOT NULL,
    `asset` VARCHAR(64),
    `asset_type` VARCHAR(64),
    `allocated_to` VARCHAR(66),
    `allocated_on` VARCHAR(19),
    `allocated_employee_id` INTEGER,
    `tracker_id` VARCHAR(64),
    `location` VARCHAR(32),
    `condition` VARCHAR(128),
    `by` VARCHAR(66),
    `date_updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- view_employees
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `view_employees`;

CREATE TABLE `view_employees`
(
    `Name` VARCHAR(66) NOT NULL,
    `Manager` VARCHAR(66),
    `Reports` VARCHAR(3),
    `Division` VARCHAR(32),
    `Team` VARCHAR(32),
    PRIMARY KEY (`Name`)
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- view_quote
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `view_quote`;

CREATE TABLE `view_quote`
(
    `site` VARCHAR(80) NOT NULL,
    `customer` VARCHAR(32),
    `status` enum('In-Progress','Accepted','Disabled'),
    `by` VARCHAR(66),
    `updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`site`)
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- view_roles
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `view_roles`;

CREATE TABLE `view_roles`
(
    `Name` VARCHAR(66) NOT NULL,
    `description` VARCHAR(32),
    `Access_Allowed` VARCHAR(3),
    PRIMARY KEY (`Name`)
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- work_option
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `work_option`;

CREATE TABLE `work_option`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `category_id` INTEGER NOT NULL,
    `code` VARCHAR(16) NOT NULL,
    `description` VARCHAR(64) NOT NULL,
    `default_pricing` DECIMAL(15,2) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `work_option_uq` (`code`),
    INDEX `work_option_ibfk_1` (`category_id`),
    CONSTRAINT `work_option_ibfk_1`
        FOREIGN KEY (`category_id`)
        REFERENCES `category` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

# This restores the fkey checks, after having unset them earlier
SET FOREIGN_KEY_CHECKS = 1;
