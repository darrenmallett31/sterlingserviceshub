

CREATE TABLE `documentation` (
  `id` int(11) NOT NULL,
  `doc_name` varchar(32) NOT NULL,
  `description` varchar(256) NOT NULL,
  `header` text DEFAULT NULL,
  `main_body` text DEFAULT NULL,
  `footer` text DEFAULT NULL,
  `modified_by` varchar(64) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
