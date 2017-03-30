

CREATE TABLE `timeentry` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(32) NOT NULL,
  `job_id` varchar(32) NOT NULL,
  `total_travel_time` varchar(32) NOT NULL,
  `total_time_onsite` varchar(32) NOT NULL,
  `time_start` varchar(128) DEFAULT NULL,
  `time_finished` varchar(128) DEFAULT NULL,
  `time_onsite` varchar(32) NOT NULL,
  `time_offsite` varchar(32) DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
