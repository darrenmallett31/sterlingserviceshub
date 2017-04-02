

CREATE TABLE `rams` (
  `id` int(11) NOT NULL,
  `job_id` varchar(32) NOT NULL,
  `jobs_detail_1` text DEFAULT NULL,
  `jobs_detail_2` text DEFAULT NULL,
  `jobs_detail_3` text DEFAULT NULL,
  `jobs_detail_4` text DEFAULT NULL,
  `jobs_detail_5` text DEFAULT NULL,
  `jobs_detail_6` text DEFAULT NULL,
  `additional_detail_1` text DEFAULT NULL,
  `additional_detail_2` text DEFAULT NULL,
  `additional_detail_3` text DEFAULT NULL,
  `additional_detail_4` text DEFAULT NULL,
  `additional_detail_5` text DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
