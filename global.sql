


CREATE TABLE `globalsettings` (
  `id` int(11) NOT NULL,
  `company_name` varchar(32) NOT NULL,
  `shortname` varchar(32) NOT NULL,
  `companyregno` varchar(32) NOT NULL,
  `website` varchar(128) DEFAULT NULL,
  `default_email` varchar(128) DEFAULT NULL,
  `address1` varchar(32) NOT NULL,
  `address2` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `county` varchar(32) DEFAULT NULL,
  `postcode` varchar(12) NOT NULL,
  `tel_number` varchar(12) NOT NULL,
  `default_kpi_quote_rtnd_by` int(11) DEFAULT NULL,
  `default_credit_hard_limit` int(11) NOT NULL,
  `default_credit_soft_limit` int(11) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
