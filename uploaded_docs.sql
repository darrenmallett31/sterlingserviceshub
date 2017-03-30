

CREATE TABLE `uploaded_docs` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(32) NOT NULL,
  `job_id` varchar(32) NOT NULL,
  `doc_name` varchar(32) NOT NULL,
  `doc_type` text DEFAULT NULL,
  `doc_location` text DEFAULT NULL,
  `uploaded_by` text DEFAULT NULL,
  `date_uploaded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
