

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `job_id` varchar(32) NOT NUL,
  `action_details` varchar(32) NOT NULL,
  `completed_date` tinyint(1) NOT NULL,
  `completed_date` varchar(64) NOT NULL,
  `completed_time` varchar(64) NOT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
