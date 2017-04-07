

CREATE TABLE `MOT` (
  `id` int(11) NOT NULL,
  `asset_id` varchar(10) DEFAULT NULL,
  `MOT_due_date` varchar(10)  DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `employee_id` varchar(10) DEFAULT NULL,
  `supplier` varchar(64)  DEFAULT NULL,
  `booked_date` varchar(64) DEFAULT NULL,
  `booked_garage` varchar(64) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `notes` text  DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8
