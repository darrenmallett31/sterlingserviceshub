CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(32) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `date_allocated` timestamp DEFAULT NULL,
  `review_date` timestamp DEFAULT NULL,
  `days_to_review` int(11) DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `make` varchar(32) DEFAULT NULL,
  `model` varchar(32) DEFAULT NULL,
  `serial_number` varchar(32) DEFAULT NULL,
  `internal_id` varchar(32) DEFAULT NULL,
  `in_service_date` varchar(32) DEFAULT NULL,
  `total_cost` varchar(32) DEFAULT NULL,
  `depreciation_years` varchar(32) DEFAULT NULL,
  `depreciation_rate` varchar(32) DEFAULT NULL,
  `depreciation_remaining_years` varchar(32) DEFAULT NULL,
  `depreciation_value` varchar(32) DEFAULT NULL,
  `book_value` varchar(32) DEFAULT NULL,
  `depreciation_value` varchar(32) DEFAULT NULL,
  `purchased_from` varchar(32) DEFAULT NULL,
  `purchase_date` varchar(32) DEFAULT NULL,
  `allocation_status` varchar(32) NOT NULL,
  `allocation_location` varchar(32) DEFAULT NULL,
  `modified_by` varchar(32) NOT NULL,
  `notes` text DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `asset_type` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `shortname` varchar(32) NOT NULL,
  `type` varchar(32) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `asset_history` (
  `id` int(11) NOT NULL,
  `date_created` timestamp NOT NULL,
  `due_date` timestamp NOT NULL,
  `employee_id` int(11) NOT NULL,
  `reviewd_by` varchar(64) NOT NULL,
  `condition` varchar(128) NOT NULL,
  `notes` text DEFAULT NULL,
  `location` varchar(64) DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
