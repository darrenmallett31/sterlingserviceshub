

CREATE TABLE `emailserver` (
  `id` int(11) NOT NULL,
  `smtp_server` varchar(12) NOT NULL,
  `account_name` varchar(12) NOT NULL,
  `email_account` int(11) DEFAULT NULL,
  `email_log_detail` int(11) NOT NULL,
  `sent_by` int(11) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
