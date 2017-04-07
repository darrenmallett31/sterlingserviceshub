

CREATE TABLE `asset_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `days_to_review` int(11) NOT NULL DEFAULT 0,
  `type` varchar(64) NOT NULL,
  PRIMARY KEY (id)  USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

--

CREATE TABLE `asset_history` (
  `asset_id` int(11) NOT NULL,
  `date_created` timestamp NOT NULL,
  `due_date` timestamp NOT NULL,
  `employee_id` int(11) NOT NULL,
  `reviewed_by` varchar(64) NOT NULL,
  `condition` varchar(128) NOT NULL,
  `notes` text DEFAULT NULL,
  `location` varchar(64) DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


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
  `allocation_status` tinyint(1),
  `location` varchar(32) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `condition` varchar(128) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)  USING BTREE,
  CONSTRAINT asset_ibfk_1 FOREIGN KEY (asset_type_id) REFERENCES asset_type (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT asset_ibfk_2 FOREIGN KEY (employee_id) REFERENCES employee (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

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
  `allocation_status` tinyint(1),
  `location` varchar(32) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `condition` varchar(128) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)  USING BTREE,
  CONSTRAINT asset_history_ibfk_1 FOREIGN KEY (asset_id) REFERENCES asset (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;





DELIMITER $$
CREATE TRIGGER `insert_asset` AFTER INSERT ON `asset` FOR EACH ROW BEGIN
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
     END
$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER `update_asset` AFTER UPDATE ON `asset` FOR EACH ROW BEGIN
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
     END
$$
DELIMITER ;
