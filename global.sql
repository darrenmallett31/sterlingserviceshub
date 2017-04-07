


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
  `vat_rate` decimal(15,2) NOT NULL default 0.0,
  `default_kpi_quote_rtnd_by` int(11) DEFAULT NULL,
  `default_credit_hard_limit` decimal(15,2) NOT NULL default 0.0,
  `default_credit_soft_limit` decimal(15,2) NOT NULL default 0.0,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)  USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


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
  `vat_rate` decimal(15,2) NOT NULL default 0.0,
  `default_kpi_quote_rtnd_by` int(11) DEFAULT NULL,
  `default_credit_hard_limit` decimal(15,2) NOT NULL default 0.0,
  `default_credit_soft_limit` decimal(15,2) NOT NULL default 0.0,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)  USING BTREE,
  CONSTRAINT settings_history_ibfk_1 FOREIGN KEY (settings_id) REFERENCES settings (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;




DELIMITER $$
CREATE TRIGGER `update_settings` AFTER UPDATE ON `settings` FOR EACH ROW BEGIN
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
     END
$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER `update_asset` AFTER UPDATE ON `asset` FOR EACH ROW BEGIN
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
END
$$
DELIMITER ;

INSERT INTO settings (
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
    "Sterling Services",
    "Sterling",
    "STERL001",
    "http://www.sterling-services.co.uk/",
    "info@sterling-services.co.uk",
    "line 1",
    "line 2",
    "Somewhere",
    "A county",
    "A postcode",
    "0800 111 2222",
    17.50,
    5,
    10000.00,
    5000.00
);

CREATE TABLE `documentation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(256) NOT NULL,
  `header` text DEFAULT NULL,
  `main_body` text DEFAULT NULL,
  `footer` text DEFAULT NULL,
  `url_path` varchar(256) DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)  USING BTREE,
  CONSTRAINT documentation_ibfk_1 FOREIGN KEY (employee_id) REFERENCES employee (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO documentation (employee_id,name,description,url_path) VALUES (2,"Database Design", "The database design documentation", "./document_path/db design.doc");

CREATE TABLE `documentation_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documentation_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(256) NOT NULL,
  `header` text DEFAULT NULL,
  `main_body` text DEFAULT NULL,
  `footer` text DEFAULT NULL,
  `url_path` varchar(256) DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)  USING BTREE,
  CONSTRAINT documentation_history_ibfk_1 FOREIGN KEY (documentation_id) REFERENCES documentation (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DELIMITER $$
CREATE TRIGGER `update_documentation` AFTER UPDATE ON `documentation` FOR EACH ROW BEGIN
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
     END
$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER `insert_documentation` AFTER INSERT ON `documentation` FOR EACH ROW BEGIN
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
     END
$$
DELIMITER ;
