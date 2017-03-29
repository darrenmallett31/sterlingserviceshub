

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `short_description` int(11) DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
