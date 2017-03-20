--
-- Table structure for table `purchaseorder`
--

CREATE TABLE `purchaseorder` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `quote_id` int(11) NOT NULL,
  `customer_purchase_order_number` varchar(64) NOT NULL,
  `category_po_type` enum('Accomodation','Labour','Materials','Plant','Waste','Trasnport','Other') NOT NULL,
  `supplier_budget` int(6) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `date_updated` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `purchaseorder` (`id`, `supplier_id`, `job_id`, `quote_id`, `customer_purchase_order_number`, `category_po_type`, `supplier_budget`, `description`, `date_updated`) VALUES
(1, 1, 1, 1, 'CITY-12344', 'Accomodation', NULL, 'This is the accomodation PO', '2017-03-14 12:11:53'),
(2, 2, 1, 1, 'CITY-12345', 'Materials', '1000', 'Order for some ladyboys', '2017-03-14 12:15:03'),
(3, 3, 3, 3, 'CERT928382', 'Plant', NULL, 'i gonna get me a tractor', '2017-03-14 12:15:03');


--
-- Table structure for table `purchaseordercalloff`
--
Need delivery option table



CREATE TABLE `purchaseordercalloff` (
  `id` int(11) NOT NULL,
  `po_id` int(11) NOT NULL,
  `delivery_contact` varchar(32) DEFAULT NULL,
  `contact_tel_no` int(24) DEFAULT NULL,
  `delivery_or_collection` enum('Delivery', 'Collection') NOT NULL,
  `pay_by` enum('Account','Credit Card','BACS') NOT NULL,
  `notes` text DEFAULT NULL,
  `delivery_options` text DEFAULT NULL,
  `delivery_pickup_date` datetime DEFAULT NULL,
  `total_net_cost` int(6) DEFAULT NULL,
  `vat_rate` int(6) DEFAULT NULL,
  `vat_amount` int(6) DEFAULT NULL,
  `total_inc_vat` int(6) DEFAULT NULL,
  `po_sent` tinyint(2) NOT NULL,
  `po_sent_date` timestamp DEFAULT CURRENT_TIMESTAMP,
  `date_created` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `purchaseordercalloff` (`id`, `po_id`, `delivery_contact`, `contact_tel_no`, `delivery_or_collection`, `pay_by`, `notes`, `delivery_options`, `delivery_pickup_date`, `total_net_cost`, `vat_rate`, `vat_amount`, `total_inc_vat`, `po_sent`, `po_sent_date`, `date_created`) VALUES
(1, 1, 'Steve Bates', '01132 793232', 'Delivery', 'Account', 'These are some notes', 'Not too sure how this should be handled', '2017-03-10 12:11:53', 100, 20, 20, 120, 1 ,'2017-03-10 12:11:53', '2017-03-15 12:11:53'),
(2, 1, 'Billy Bigballs', '01977 674042', 'Pickup', 'Cash', 'New notes here', 'Not too sure how this should be handled', '2017-03-10 12:11:53', 600, 20, 120, 720, 1 ,'2017-03-10 12:11:53', '2017-03-15 14:1:00'),
(3, 1, 'Graham Watson', '01925 829838', 'Delivery', 'BACS', 'More notes', 'Not too sure how this should be handled', '2017-03-10 12:11:53', 1000, 20, 200, 1200, 1 ,'2017-03-09 17:11:53', '2017-03-15 18:07:22');

--
-- Table structure for table `purchaseorderlineitem`
--

CREATE TABLE `purchaseorderlineitem` (
  `id` int(11) NOT NULL,
  `po_calloff_id` int(11) NOT NULL,
  `cost_code` varchar(32) NOT NULL,
  `product_code` varchar(32) NOT NULL,
  `qty` int(5) NOT NULL,
  `rate` int(5) NOT NULL,
  `line_item_cost` int(5) NOT NULL,
  `description` varchar(32) NOT NULL,
  `days` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `purchaseorderlineitem` (`id`, `po_calloff_id`, `cost_code`, `product_code`, `qty`, `rate`, `line_item_cost`, `description`, `days`) VALUES
(1, 1, 'HOT99', 'red2', 4, 20, 80, 'These are bags of sand', 5),
(2, 1, 'ACR77', 'cna3', 2, 35, 70, 'long ladders', 1),
(3, 1, 'NON43', 'yt4', 15, 10, 1500, 'new lorry', 4);
