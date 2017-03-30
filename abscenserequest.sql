

CREATE TABLE `abscenserequest` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `start_date` varchar(32) NOT NUL,
  `finish_date` varchar(32) NOT NULL,
  `half_day` tinyint(1) NOT NULL,
  `submitted_date` varchar(64) NOT NULL,
  `submitted_time` varchar(64) NOT NULL,
  `authorised` tinyint(1) NOT NULL,
  `authorised_by` varchar(64) DEFAULT NULL,
  `submitted_date` varchar(64) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
