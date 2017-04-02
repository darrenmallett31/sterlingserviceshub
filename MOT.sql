

CREATE TABLE `MOT` (
  `id` int(11) NOT NULL,
  `asset_id` varchar(10) DEFAULT NULL,
  `due_date` varchar(10)  DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `employee_id` varchar(10) DEFAULT NULL,
  `booked_date` varchar(64) DEFAULT NULL,
  `booked_garage` varchar(64) DEFAULT NULL,

  `item_rate` int(11) DEFAULT NULL,
  `category` varchar(64) DEFAULT NULL,
  `supplier` varchar(64)  DEFAULT NULL,
  `supplier_prefix` varchar(64)  DEFAULT NULL,
  `supplier_nominal_code` varchar(64)  DEFAULT NULL,
  `item_name` varchar(64)  DEFAULT NULL,
  `sub_category` varchar(64)  DEFAULT NULL,
  `image1` LONGBLOB NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8
