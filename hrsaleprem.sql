-- Adminer 4.8.1 MySQL 8.0.31 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

CREATE DATABASE `hrsaleprem` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hrsaleprem`;

DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `ci_sessions`;

DROP TABLE IF EXISTS `xin_advance_salaries`;
CREATE TABLE `xin_advance_salaries` (
  `advance_salary_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `month_year` varchar(255) NOT NULL,
  `advance_amount` varchar(255) NOT NULL,
  `one_time_deduct` varchar(50) NOT NULL,
  `monthly_installment` varchar(255) NOT NULL,
  `total_paid` varchar(255) NOT NULL,
  `reason` text NOT NULL,
  `status` int DEFAULT NULL,
  `is_deducted_from_salary` int DEFAULT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`advance_salary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_advance_salaries`;

DROP TABLE IF EXISTS `xin_announcements`;
CREATE TABLE `xin_announcements` (
  `announcement_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `start_date` varchar(200) NOT NULL,
  `end_date` varchar(200) NOT NULL,
  `company_id` int NOT NULL,
  `location_id` int NOT NULL,
  `department_id` int NOT NULL,
  `published_by` int NOT NULL,
  `summary` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_notify` int NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`announcement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_announcements`;
INSERT INTO `xin_announcements` (`announcement_id`, `title`, `start_date`, `end_date`, `company_id`, `location_id`, `department_id`, `published_by`, `summary`, `description`, `is_active`, `is_notify`, `created_at`) VALUES
(1,	'LIBUR AKHIR TAHUN',	'2023-01-27',	'2024-02-03',	1,	1,	4,	1,	'CASNCLKANC',	'KARENA CIP KJASBASKLNASKLCACJASJKCBAJKCBAJLBJLSBAJKFBKJSF',	0,	1,	'15-01-2023');

DROP TABLE IF EXISTS `xin_assets`;
CREATE TABLE `xin_assets` (
  `assets_id` int NOT NULL AUTO_INCREMENT,
  `assets_category_id` int NOT NULL,
  `company_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `company_asset_code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `purchase_date` varchar(255) NOT NULL,
  `invoice_number` varchar(255) NOT NULL,
  `manufacturer` varchar(255) NOT NULL,
  `serial_number` varchar(255) NOT NULL,
  `warranty_end_date` varchar(255) NOT NULL,
  `asset_note` text NOT NULL,
  `asset_image` varchar(255) NOT NULL,
  `is_working` int NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`assets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_assets`;
INSERT INTO `xin_assets` (`assets_id`, `assets_category_id`, `company_id`, `employee_id`, `company_asset_code`, `name`, `purchase_date`, `invoice_number`, `manufacturer`, `serial_number`, `warranty_end_date`, `asset_note`, `asset_image`, `is_working`, `created_at`) VALUES
(1,	1,	1,	7,	'LP20015',	'lapotop',	'2022-07-26',	'7890',	'china',	'567890876543',	'2023-08-27',	'xfgcjklsadiuGJDVhbadshbgDGUWhwldiojl;WDStyugsiHOJOK',	'',	1,	'27-07-2022 02:48:36');

DROP TABLE IF EXISTS `xin_assets_categories`;
CREATE TABLE `xin_assets_categories` (
  `assets_category_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`assets_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_assets_categories`;
INSERT INTO `xin_assets_categories` (`assets_category_id`, `company_id`, `category_name`, `created_at`) VALUES
(1,	1,	'Laptop',	'05-04-2018 03:03:31'),
(2,	0,	'LAPTOP',	'27-07-2022 02:49:07'),
(3,	0,	'MEJA',	'27-07-2022 02:49:16'),
(4,	0,	'KULKAS',	'27-07-2022 02:49:21'),
(5,	0,	'PRINTER',	'27-07-2022 02:49:29'),
(6,	0,	'LAPTOP',	'27-07-2022 02:49:54');

DROP TABLE IF EXISTS `xin_attendance_time`;
CREATE TABLE `xin_attendance_time` (
  `time_attendance_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `attendance_date` varchar(255) NOT NULL,
  `clock_in` varchar(255) NOT NULL,
  `clock_in_ip_address` varchar(255) NOT NULL,
  `clock_out` varchar(255) NOT NULL,
  `clock_out_ip_address` varchar(255) NOT NULL,
  `clock_in_out` varchar(255) NOT NULL,
  `clock_in_latitude` varchar(150) NOT NULL,
  `clock_in_longitude` varchar(150) NOT NULL,
  `clock_out_latitude` varchar(150) NOT NULL,
  `clock_out_longitude` varchar(150) NOT NULL,
  `time_late` varchar(255) NOT NULL,
  `early_leaving` varchar(255) NOT NULL,
  `overtime` varchar(255) NOT NULL,
  `total_work` varchar(255) NOT NULL,
  `total_rest` varchar(255) NOT NULL,
  `attendance_status` varchar(100) NOT NULL,
  PRIMARY KEY (`time_attendance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_attendance_time`;
INSERT INTO `xin_attendance_time` (`time_attendance_id`, `employee_id`, `attendance_date`, `clock_in`, `clock_in_ip_address`, `clock_out`, `clock_out_ip_address`, `clock_in_out`, `clock_in_latitude`, `clock_in_longitude`, `clock_out_latitude`, `clock_out_longitude`, `time_late`, `early_leaving`, `overtime`, `total_work`, `total_rest`, `attendance_status`) VALUES
(1,	5,	'2019-04-17',	'2019-04-17 10:36:38',	'::1',	'2019-04-17 10:37:36',	'::1',	'0',	'31.450726399999997',	'74.2940672',	'31.450726399999997',	'74.2940672',	'2019-04-17 10:36:38',	'2019-04-17 10:37:36',	'2019-04-17 10:37:36',	'0:0',	'',	'Present'),
(2,	7,	'2022-05-27',	'2022-05-27 08:23:21',	'100.100.20.1',	'',	'',	'1',	'1',	'1',	'',	'',	'2022-05-27 08:23:21',	'2022-05-27 08:23:21',	'2022-05-27 08:23:21',	'',	'',	'Present'),
(3,	7,	'2022-08-15',	'2022-08-15 23:02:00',	'',	'2022-08-15 18:02:00',	'',	'0',	'',	'',	'',	'',	'2022-08-15 23:02:00',	'2022-08-15 18:02:00',	'2022-08-15 18:02:00',	'5:0',	'',	'Present'),
(4,	7,	'2022-10-03',	'2022-10-03 08:00:00',	'',	'2022-10-03 05:00:00',	'',	'0',	'',	'',	'',	'',	'2022-10-03 08:00:00',	'2022-10-03 05:00:00',	'2022-10-03 05:00:00',	'3:0',	'',	'Present');

DROP TABLE IF EXISTS `xin_attendance_time_request`;
CREATE TABLE `xin_attendance_time_request` (
  `time_request_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `request_date` varchar(255) NOT NULL,
  `request_date_request` varchar(255) NOT NULL,
  `request_clock_in` varchar(200) NOT NULL,
  `request_clock_out` varchar(200) NOT NULL,
  `total_hours` varchar(255) NOT NULL,
  `project_no` varchar(200) NOT NULL,
  `purchase_no` varchar(200) DEFAULT NULL,
  `task_name` varchar(255) NOT NULL,
  `request_reason` text NOT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`time_request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `xin_attendance_time_request`;

DROP TABLE IF EXISTS `xin_award_type`;
CREATE TABLE `xin_award_type` (
  `award_type_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `award_type` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`award_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_award_type`;
INSERT INTO `xin_award_type` (`award_type_id`, `company_id`, `award_type`, `created_at`) VALUES
(1,	1,	'JUARA MAKAN KRUPUK',	'22-03-2018 01:33:57');

DROP TABLE IF EXISTS `xin_awards`;
CREATE TABLE `xin_awards` (
  `award_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `award_type_id` int NOT NULL,
  `gift_item` varchar(200) NOT NULL,
  `cash_price` varchar(200) NOT NULL,
  `award_photo` varchar(255) NOT NULL,
  `award_month_year` varchar(200) NOT NULL,
  `award_information` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`award_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_awards`;
INSERT INTO `xin_awards` (`award_id`, `company_id`, `employee_id`, `award_type_id`, `gift_item`, `cash_price`, `award_photo`, `award_month_year`, `award_information`, `description`, `created_at`) VALUES
(1,	1,	7,	1,	'',	'',	'',	'2022-10',	'',	'',	'2022-10-03');

DROP TABLE IF EXISTS `xin_chat_messages`;
CREATE TABLE `xin_chat_messages` (
  `message_id` int unsigned NOT NULL AUTO_INCREMENT,
  `from_id` varchar(40) NOT NULL DEFAULT '',
  `to_id` varchar(50) NOT NULL DEFAULT '',
  `message_frm` varchar(255) NOT NULL,
  `is_read` int NOT NULL DEFAULT '0',
  `message_content` longtext NOT NULL,
  `message_date` varchar(255) DEFAULT NULL,
  `recd` tinyint(1) NOT NULL DEFAULT '0',
  `message_type` varchar(255) NOT NULL DEFAULT '',
  `department_id` int NOT NULL,
  `location_id` int NOT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_chat_messages`;
INSERT INTO `xin_chat_messages` (`message_id`, `from_id`, `to_id`, `message_frm`, `is_read`, `message_content`, `message_date`, `recd`, `message_type`, `department_id`, `location_id`) VALUES
(1,	'1',	'5',	'5',	0,	'hi',	'2020-07-08 13:38:30',	0,	'',	0,	0),
(2,	'1',	'6',	'6',	1,	'Test',	'2020-07-08 13:41:43',	0,	'',	0,	0),
(3,	'1',	'6',	'6',	1,	'Kenapa',	'2020-07-08 13:41:51',	0,	'',	0,	0),
(4,	'6',	'1',	'1',	1,	'Hmm',	'2020-07-08 13:41:58',	0,	'',	0,	0),
(5,	'6',	'1',	'1',	1,	'Apa aja',	'2020-07-08 13:42:05',	0,	'',	0,	0),
(6,	'6',	'1',	'1',	1,	'Hmmmm',	'2020-07-08 13:42:11',	0,	'',	0,	0),
(7,	'1',	'6',	'6',	1,	'Test aja',	'2020-07-08 13:42:16',	0,	'',	0,	0),
(8,	'1',	'0',	'2',	0,	'haloo',	'2022-07-27 04:13:34',	0,	'',	2,	0);

DROP TABLE IF EXISTS `xin_clients`;
CREATE TABLE `xin_clients` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `client_username` varchar(255) NOT NULL,
  `client_password` varchar(255) NOT NULL,
  `client_profile` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `is_changed` int NOT NULL,
  `gender` varchar(200) NOT NULL,
  `website_url` varchar(255) NOT NULL,
  `address_1` mediumtext NOT NULL,
  `address_2` mediumtext NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `country` int NOT NULL,
  `is_active` int NOT NULL,
  `last_logout_date` varchar(255) NOT NULL,
  `last_login_date` varchar(255) NOT NULL,
  `last_login_ip` varchar(255) NOT NULL,
  `is_logged_in` int NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_clients`;
INSERT INTO `xin_clients` (`client_id`, `type`, `name`, `email`, `client_username`, `client_password`, `client_profile`, `contact_number`, `company_name`, `is_changed`, `gender`, `website_url`, `address_1`, `address_2`, `city`, `state`, `zipcode`, `country`, `is_active`, `last_logout_date`, `last_login_date`, `last_login_ip`, `is_logged_in`, `created_at`) VALUES
(1,	'',	'Shaleena',	'client1@hrsale.com',	'',	'$2y$12$wGATpsG6S/IAIwobUZMeDeYyxpirjXVaVLo79ta2PLlRJjBNIsfFa',	'',	'123456789',	'Shale Inc.',	0,	'',	'',	'Address Line 1',	'Address Line 2',	'City',	'State',	'11461',	190,	1,	'',	'20-03-2019 22:05:05',	'::1',	1,	'2019-03-20 22:05:02');

DROP TABLE IF EXISTS `xin_companies`;
CREATE TABLE `xin_companies` (
  `company_id` int NOT NULL AUTO_INCREMENT,
  `type_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `trading_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `registration_no` varchar(255) NOT NULL,
  `government_tax` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `website_url` varchar(255) NOT NULL,
  `address_1` mediumtext NOT NULL,
  `address_2` mediumtext NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `country` int NOT NULL,
  `is_active` int NOT NULL,
  `default_currency` varchar(200) DEFAULT NULL,
  `default_timezone` varchar(200) DEFAULT NULL,
  `added_by` int NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_companies`;
INSERT INTO `xin_companies` (`company_id`, `type_id`, `name`, `trading_name`, `username`, `password`, `registration_no`, `government_tax`, `email`, `logo`, `contact_number`, `website_url`, `address_1`, `address_2`, `city`, `state`, `zipcode`, `country`, `is_active`, `default_currency`, `default_timezone`, `added_by`, `created_at`) VALUES
(1,	1,	'PT. Radar Utama Nusantara Lapan',	'Test',	'test123',	'',	'',	'',	'info@runlapan.com',	'logo_1526958729.png',	'0123456789',	'https://www.runlapan.com',	'Test',	'Test2',	'Depok',	'Depok',	'16454',	101,	0,	'IDR - Rp',	'Asia/Jakarta',	1,	'22-05-2018');

DROP TABLE IF EXISTS `xin_company_documents`;
CREATE TABLE `xin_company_documents` (
  `document_id` int NOT NULL AUTO_INCREMENT,
  `document_type_id` int NOT NULL,
  `license_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `company_id` int NOT NULL,
  `expiry_date` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `license_number` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `license_notification` int NOT NULL,
  `added_by` int NOT NULL,
  `document` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_at` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_company_documents`;
INSERT INTO `xin_company_documents` (`document_id`, `document_type_id`, `license_name`, `company_id`, `expiry_date`, `license_number`, `license_notification`, `added_by`, `document`, `created_at`) VALUES
(1,	1,	'file e count',	1,	'2022-10-29',	'00258',	1,	1,	'official_documents_1665045772.docx',	'06-10-2022');

DROP TABLE IF EXISTS `xin_company_info`;
CREATE TABLE `xin_company_info` (
  `company_info_id` int NOT NULL AUTO_INCREMENT,
  `logo` varchar(255) NOT NULL,
  `logo_second` varchar(255) NOT NULL,
  `sign_in_logo` varchar(255) NOT NULL,
  `favicon` varchar(255) NOT NULL,
  `website_url` mediumtext NOT NULL,
  `starting_year` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_email` varchar(255) NOT NULL,
  `company_contact` varchar(255) NOT NULL,
  `contact_person` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address_1` mediumtext NOT NULL,
  `address_2` mediumtext NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `country` int NOT NULL,
  `updated_at` varchar(255) NOT NULL,
  PRIMARY KEY (`company_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_company_info`;
INSERT INTO `xin_company_info` (`company_info_id`, `logo`, `logo_second`, `sign_in_logo`, `favicon`, `website_url`, `starting_year`, `company_name`, `company_email`, `company_contact`, `contact_person`, `email`, `phone`, `address_1`, `address_2`, `city`, `state`, `zipcode`, `country`, `updated_at`) VALUES
(1,	'logo_1659517407.png',	'logo2_1520609223.png',	'signin_logo_1659517413.png',	'favicon_1673736535.png',	'',	'',	'PT AMX',	'',	'',	'Tri Hartofa',	'demo@google.com',	'085591210150',	'JL.RADAR AURI NO 80 JAKARTA TIMUR',	'JL PUTRI TUNGGAL NO 9 A DEPOK',	'JAKARTA',	'TIMUR',	'11461',	101,	'2017-05-20 12:05:53');

DROP TABLE IF EXISTS `xin_company_policy`;
CREATE TABLE `xin_company_policy` (
  `policy_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `added_by` int NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`policy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_company_policy`;
INSERT INTO `xin_company_policy` (`policy_id`, `company_id`, `title`, `description`, `attachment`, `added_by`, `created_at`) VALUES
(1,	1,	'Service',	'&lt;p&gt;Service&lt;/p&gt;',	NULL,	1,	'28-02-2018'),
(2,	1,	'LIBUR TAHUN BARU',	'',	'',	1,	'29-12-2022');

DROP TABLE IF EXISTS `xin_company_type`;
CREATE TABLE `xin_company_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_company_type`;
INSERT INTO `xin_company_type` (`type_id`, `name`, `created_at`) VALUES
(1,	'Corporation',	'');

DROP TABLE IF EXISTS `xin_contract_type`;
CREATE TABLE `xin_contract_type` (
  `contract_type_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`contract_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_contract_type`;
INSERT INTO `xin_contract_type` (`contract_type_id`, `company_id`, `name`, `created_at`) VALUES
(1,	1,	'Permanent',	'05-04-2018 06:10:32'),
(2,	0,	'PKWT',	'15-01-2023 05:52:01');

DROP TABLE IF EXISTS `xin_countries`;
CREATE TABLE `xin_countries` (
  `country_id` int NOT NULL AUTO_INCREMENT,
  `country_code` varchar(255) NOT NULL,
  `country_name` varchar(255) NOT NULL,
  `country_flag` varchar(255) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_countries`;
INSERT INTO `xin_countries` (`country_id`, `country_code`, `country_name`, `country_flag`) VALUES
(1,	'+93',	'Afghanistan',	'flag_1500831780.gif'),
(2,	'+355',	'Albania',	'flag_1500831815.gif'),
(3,	'DZ',	'Algeria',	''),
(4,	'DS',	'American Samoa',	''),
(5,	'AD',	'Andorra',	''),
(6,	'AO',	'Angola',	''),
(7,	'AI',	'Anguilla',	''),
(8,	'AQ',	'Antarctica',	''),
(9,	'AG',	'Antigua and Barbuda',	''),
(10,	'AR',	'Argentina',	''),
(11,	'AM',	'Armenia',	''),
(12,	'AW',	'Aruba',	''),
(13,	'AU',	'Australia',	''),
(14,	'AT',	'Austria',	''),
(15,	'AZ',	'Azerbaijan',	''),
(16,	'BS',	'Bahamas',	''),
(17,	'BH',	'Bahrain',	''),
(18,	'BD',	'Bangladesh',	''),
(19,	'BB',	'Barbados',	''),
(20,	'BY',	'Belarus',	''),
(21,	'BE',	'Belgium',	''),
(22,	'BZ',	'Belize',	''),
(23,	'BJ',	'Benin',	''),
(24,	'BM',	'Bermuda',	''),
(25,	'BT',	'Bhutan',	''),
(26,	'BO',	'Bolivia',	''),
(27,	'BA',	'Bosnia and Herzegovina',	''),
(28,	'BW',	'Botswana',	''),
(29,	'BV',	'Bouvet Island',	''),
(30,	'BR',	'Brazil',	''),
(31,	'IO',	'British Indian Ocean Territory',	''),
(32,	'BN',	'Brunei Darussalam',	''),
(33,	'BG',	'Bulgaria',	''),
(34,	'BF',	'Burkina Faso',	''),
(35,	'BI',	'Burundi',	''),
(36,	'KH',	'Cambodia',	''),
(37,	'CM',	'Cameroon',	''),
(38,	'CA',	'Canada',	''),
(39,	'CV',	'Cape Verde',	''),
(40,	'KY',	'Cayman Islands',	''),
(41,	'CF',	'Central African Republic',	''),
(42,	'TD',	'Chad',	''),
(43,	'CL',	'Chile',	''),
(44,	'CN',	'China',	''),
(45,	'CX',	'Christmas Island',	''),
(46,	'CC',	'Cocos (Keeling) Islands',	''),
(47,	'CO',	'Colombia',	''),
(48,	'KM',	'Comoros',	''),
(49,	'CG',	'Congo',	''),
(50,	'CK',	'Cook Islands',	''),
(51,	'CR',	'Costa Rica',	''),
(52,	'HR',	'Croatia (Hrvatska)',	''),
(53,	'CU',	'Cuba',	''),
(54,	'CY',	'Cyprus',	''),
(55,	'CZ',	'Czech Republic',	''),
(56,	'DK',	'Denmark',	''),
(57,	'DJ',	'Djibouti',	''),
(58,	'DM',	'Dominica',	''),
(59,	'DO',	'Dominican Republic',	''),
(60,	'TP',	'East Timor',	''),
(61,	'EC',	'Ecuador',	''),
(62,	'EG',	'Egypt',	''),
(63,	'SV',	'El Salvador',	''),
(64,	'GQ',	'Equatorial Guinea',	''),
(65,	'ER',	'Eritrea',	''),
(66,	'EE',	'Estonia',	''),
(67,	'ET',	'Ethiopia',	''),
(68,	'FK',	'Falkland Islands (Malvinas)',	''),
(69,	'FO',	'Faroe Islands',	''),
(70,	'FJ',	'Fiji',	''),
(71,	'FI',	'Finland',	''),
(72,	'FR',	'France',	''),
(73,	'FX',	'France, Metropolitan',	''),
(74,	'GF',	'French Guiana',	''),
(75,	'PF',	'French Polynesia',	''),
(76,	'TF',	'French Southern Territories',	''),
(77,	'GA',	'Gabon',	''),
(78,	'GM',	'Gambia',	''),
(79,	'GE',	'Georgia',	''),
(80,	'DE',	'Germany',	''),
(81,	'GH',	'Ghana',	''),
(82,	'GI',	'Gibraltar',	''),
(83,	'GK',	'Guernsey',	''),
(84,	'GR',	'Greece',	''),
(85,	'GL',	'Greenland',	''),
(86,	'GD',	'Grenada',	''),
(87,	'GP',	'Guadeloupe',	''),
(88,	'GU',	'Guam',	''),
(89,	'GT',	'Guatemala',	''),
(90,	'GN',	'Guinea',	''),
(91,	'GW',	'Guinea-Bissau',	''),
(92,	'GY',	'Guyana',	''),
(93,	'HT',	'Haiti',	''),
(94,	'HM',	'Heard and Mc Donald Islands',	''),
(95,	'HN',	'Honduras',	''),
(96,	'HK',	'Hong Kong',	''),
(97,	'HU',	'Hungary',	''),
(98,	'IS',	'Iceland',	''),
(99,	'IN',	'India',	''),
(100,	'IM',	'Isle of Man',	''),
(101,	'ID',	'Indonesia',	''),
(102,	'IR',	'Iran (Islamic Republic of)',	''),
(103,	'IQ',	'Iraq',	''),
(104,	'IE',	'Ireland',	''),
(105,	'IL',	'Israel',	''),
(106,	'IT',	'Italy',	''),
(107,	'CI',	'Ivory Coast',	''),
(108,	'JE',	'Jersey',	''),
(109,	'JM',	'Jamaica',	''),
(110,	'JP',	'Japan',	''),
(111,	'JO',	'Jordan',	''),
(112,	'KZ',	'Kazakhstan',	''),
(113,	'KE',	'Kenya',	''),
(114,	'KI',	'Kiribati',	''),
(115,	'KP',	'Korea, Democratic People\'s Republic of',	''),
(116,	'KR',	'Korea, Republic of',	''),
(117,	'XK',	'Kosovo',	''),
(118,	'KW',	'Kuwait',	''),
(119,	'KG',	'Kyrgyzstan',	''),
(120,	'LA',	'Lao People\'s Democratic Republic',	''),
(121,	'LV',	'Latvia',	''),
(122,	'LB',	'Lebanon',	''),
(123,	'LS',	'Lesotho',	''),
(124,	'LR',	'Liberia',	''),
(125,	'LY',	'Libyan Arab Jamahiriya',	''),
(126,	'LI',	'Liechtenstein',	''),
(127,	'LT',	'Lithuania',	''),
(128,	'LU',	'Luxembourg',	''),
(129,	'MO',	'Macau',	''),
(130,	'MK',	'Macedonia',	''),
(131,	'MG',	'Madagascar',	''),
(132,	'MW',	'Malawi',	''),
(133,	'MY',	'Malaysia',	''),
(134,	'MV',	'Maldives',	''),
(135,	'ML',	'Mali',	''),
(136,	'MT',	'Malta',	''),
(137,	'MH',	'Marshall Islands',	''),
(138,	'MQ',	'Martinique',	''),
(139,	'MR',	'Mauritania',	''),
(140,	'MU',	'Mauritius',	''),
(141,	'TY',	'Mayotte',	''),
(142,	'MX',	'Mexico',	''),
(143,	'FM',	'Micronesia, Federated States of',	''),
(144,	'MD',	'Moldova, Republic of',	''),
(145,	'MC',	'Monaco',	''),
(146,	'MN',	'Mongolia',	''),
(147,	'ME',	'Montenegro',	''),
(148,	'MS',	'Montserrat',	''),
(149,	'MA',	'Morocco',	''),
(150,	'MZ',	'Mozambique',	''),
(151,	'MM',	'Myanmar',	''),
(152,	'NA',	'Namibia',	''),
(153,	'NR',	'Nauru',	''),
(154,	'NP',	'Nepal',	''),
(155,	'NL',	'Netherlands',	''),
(156,	'AN',	'Netherlands Antilles',	''),
(157,	'NC',	'New Caledonia',	''),
(158,	'NZ',	'New Zealand',	''),
(159,	'NI',	'Nicaragua',	''),
(160,	'NE',	'Niger',	''),
(161,	'NG',	'Nigeria',	''),
(162,	'NU',	'Niue',	''),
(163,	'NF',	'Norfolk Island',	''),
(164,	'MP',	'Northern Mariana Islands',	''),
(165,	'NO',	'Norway',	''),
(166,	'OM',	'Oman',	''),
(167,	'PK',	'Pakistan',	''),
(168,	'PW',	'Palau',	''),
(169,	'PS',	'Palestine',	''),
(170,	'PA',	'Panama',	''),
(171,	'PG',	'Papua New Guinea',	''),
(172,	'PY',	'Paraguay',	''),
(173,	'PE',	'Peru',	''),
(174,	'PH',	'Philippines',	''),
(175,	'PN',	'Pitcairn',	''),
(176,	'PL',	'Poland',	''),
(177,	'PT',	'Portugal',	''),
(178,	'PR',	'Puerto Rico',	''),
(179,	'QA',	'Qatar',	''),
(180,	'RE',	'Reunion',	''),
(181,	'RO',	'Romania',	''),
(182,	'RU',	'Russian Federation',	''),
(183,	'RW',	'Rwanda',	''),
(184,	'KN',	'Saint Kitts and Nevis',	''),
(185,	'LC',	'Saint Lucia',	''),
(186,	'VC',	'Saint Vincent and the Grenadines',	''),
(187,	'WS',	'Samoa',	''),
(188,	'SM',	'San Marino',	''),
(189,	'ST',	'Sao Tome and Principe',	''),
(190,	'SA',	'Saudi Arabia',	''),
(191,	'SN',	'Senegal',	''),
(192,	'RS',	'Serbia',	''),
(193,	'SC',	'Seychelles',	''),
(194,	'SL',	'Sierra Leone',	''),
(195,	'SG',	'Singapore',	''),
(196,	'SK',	'Slovakia',	''),
(197,	'SI',	'Slovenia',	''),
(198,	'SB',	'Solomon Islands',	''),
(199,	'SO',	'Somalia',	''),
(200,	'ZA',	'South Africa',	''),
(201,	'GS',	'South Georgia South Sandwich Islands',	''),
(202,	'ES',	'Spain',	''),
(203,	'LK',	'Sri Lanka',	''),
(204,	'SH',	'St. Helena',	''),
(205,	'PM',	'St. Pierre and Miquelon',	''),
(206,	'SD',	'Sudan',	''),
(207,	'SR',	'Suriname',	''),
(208,	'SJ',	'Svalbard and Jan Mayen Islands',	''),
(209,	'SZ',	'Swaziland',	''),
(210,	'SE',	'Sweden',	''),
(211,	'CH',	'Switzerland',	''),
(212,	'SY',	'Syrian Arab Republic',	''),
(213,	'TW',	'Taiwan',	''),
(214,	'TJ',	'Tajikistan',	''),
(215,	'TZ',	'Tanzania, United Republic of',	''),
(216,	'TH',	'Thailand',	''),
(217,	'TG',	'Togo',	''),
(218,	'TK',	'Tokelau',	''),
(219,	'TO',	'Tonga',	''),
(220,	'TT',	'Trinidad and Tobago',	''),
(221,	'TN',	'Tunisia',	''),
(222,	'TR',	'Turkey',	''),
(223,	'TM',	'Turkmenistan',	''),
(224,	'TC',	'Turks and Caicos Islands',	''),
(225,	'TV',	'Tuvalu',	''),
(226,	'UG',	'Uganda',	''),
(227,	'UA',	'Ukraine',	''),
(228,	'AE',	'United Arab Emirates',	''),
(229,	'GB',	'United Kingdom',	''),
(230,	'US',	'United States',	''),
(231,	'UM',	'United States minor outlying islands',	''),
(232,	'UY',	'Uruguay',	''),
(233,	'UZ',	'Uzbekistan',	''),
(234,	'VU',	'Vanuatu',	''),
(235,	'VA',	'Vatican City State',	''),
(236,	'VE',	'Venezuela',	''),
(237,	'VN',	'Vietnam',	''),
(238,	'VG',	'Virgin Islands (British)',	''),
(239,	'VI',	'Virgin Islands (U.S.)',	''),
(240,	'WF',	'Wallis and Futuna Islands',	''),
(241,	'EH',	'Western Sahara',	''),
(242,	'YE',	'Yemen',	''),
(243,	'ZR',	'Zaire',	''),
(244,	'ZM',	'Zambia',	''),
(245,	'ZW',	'Zimbabwe',	'');

DROP TABLE IF EXISTS `xin_currencies`;
CREATE TABLE `xin_currencies` (
  `currency_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `symbol` varchar(255) NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_currencies`;
INSERT INTO `xin_currencies` (`currency_id`, `company_id`, `name`, `code`, `symbol`) VALUES
(2,	1,	'Indonesian Rupiah',	'IDR',	'Rp');

DROP TABLE IF EXISTS `xin_currency_converter`;
CREATE TABLE `xin_currency_converter` (
  `currency_converter_id` int NOT NULL AUTO_INCREMENT,
  `usd_currency` varchar(11) NOT NULL DEFAULT '1',
  `to_currency_title` varchar(200) NOT NULL,
  `to_currency_rate` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`currency_converter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_currency_converter`;
INSERT INTO `xin_currency_converter` (`currency_converter_id`, `usd_currency`, `to_currency_title`, `to_currency_rate`, `created_at`) VALUES
(1,	'1',	'MYR',	'4.11',	'17-08-2018 03:29:58');

DROP TABLE IF EXISTS `xin_database_backup`;
CREATE TABLE `xin_database_backup` (
  `backup_id` int NOT NULL AUTO_INCREMENT,
  `backup_file` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`backup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_database_backup`;

DROP TABLE IF EXISTS `xin_departments`;
CREATE TABLE `xin_departments` (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(200) NOT NULL,
  `company_id` int NOT NULL,
  `location_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `added_by` int NOT NULL,
  `created_at` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_departments`;
INSERT INTO `xin_departments` (`department_id`, `department_name`, `company_id`, `location_id`, `employee_id`, `added_by`, `created_at`, `status`) VALUES
(1,	'MD Office',	1,	1,	5,	0,	'06-03-2018',	1),
(2,	'Accounts and  Finances',	1,	1,	5,	1,	'17-03-2018',	1),
(3,	'Cabang Ps Minggu',	1,	1,	8,	1,	'2022-07-27 04:15:30',	1),
(4,	'HARTOFA',	1,	1,	7,	1,	'2022-12-29 08:09:02',	1),
(5,	'ENGGINERING',	1,	1,	5,	1,	'2022-12-29 08:09:26',	1);

DROP TABLE IF EXISTS `xin_designations`;
CREATE TABLE `xin_designations` (
  `designation_id` int NOT NULL AUTO_INCREMENT,
  `top_designation_id` int NOT NULL DEFAULT '0',
  `department_id` int NOT NULL,
  `sub_department_id` int NOT NULL,
  `company_id` int NOT NULL,
  `designation_name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `added_by` int NOT NULL,
  `created_at` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`designation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_designations`;
INSERT INTO `xin_designations` (`designation_id`, `top_designation_id`, `department_id`, `sub_department_id`, `company_id`, `designation_name`, `description`, `added_by`, `created_at`, `status`) VALUES
(9,	0,	1,	8,	1,	'Software Developer',	'',	1,	'06-03-2018',	1),
(10,	0,	2,	10,	1,	'Finance',	'',	1,	'18-03-2018',	1);

DROP TABLE IF EXISTS `xin_document_type`;
CREATE TABLE `xin_document_type` (
  `document_type_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `document_type` varchar(255) NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`document_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_document_type`;
INSERT INTO `xin_document_type` (`document_type_id`, `company_id`, `document_type`, `created_at`) VALUES
(1,	0,	'IJASAH',	'09-05-2018 12:34:55');

DROP TABLE IF EXISTS `xin_email_configuration`;
CREATE TABLE `xin_email_configuration` (
  `email_config_id` int NOT NULL AUTO_INCREMENT,
  `email_type` enum('phpmail','smtp','codeigniter') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `smtp_host` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `smtp_username` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `smtp_password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `smtp_port` int NOT NULL,
  `smtp_secure` enum('tls','ssl') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`email_config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

TRUNCATE `xin_email_configuration`;
INSERT INTO `xin_email_configuration` (`email_config_id`, `email_type`, `smtp_host`, `smtp_username`, `smtp_password`, `smtp_port`, `smtp_secure`) VALUES
(1,	'phpmail',	'smtp.gmail.com',	'demo@gmail.com',	'123456',	587,	'tls');

DROP TABLE IF EXISTS `xin_email_template`;
CREATE TABLE `xin_email_template` (
  `template_id` int NOT NULL AUTO_INCREMENT,
  `template_code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `status` tinyint NOT NULL,
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_email_template`;
INSERT INTO `xin_email_template` (`template_id`, `template_code`, `name`, `subject`, `message`, `status`) VALUES
(2,	'code1',	'Forgot Password',	'Forgot Password',	'                            <p><span xss=\"removed\">Hello,</span></p><p><span xss=\"removed\">There was recently a request for password for your {var site_name} account.</span></p><p><span xss=\"removed\">If this was a mistake, just ignore this email and nothing will happen.</span></p><p><span xss=\"removed\">To reset your password, visit the following link <a href=\"{var reset_url}admin/reset_password?change=true&email={var email}\">Reset Password</a></span></p><p><span xss=\"removed\">Regards,</span></p><p><span xss=\"removed\">The {var site_name} Team</span></p>',	1),
(3,	'code2',	'New Project',	'New Project',	'                                <p>Hi {var employee_name},</p><p>New project has been assigned to you.</p><p>Project Name: {var project_name}</p><p>Project Start Date: <span>{var project_start_date}</span></p><p><br><span>You can view the project by logging in to the portal using the link below.</span></p><p><span>{var site_url}admin/</span></p><p><span>Regards</span><br></p><p>The {var site_name} Team</p>',	1),
(5,	'code3',	'Leave Request ',	'A Leave Request from you',	'            <p>Dear Admin,</p><p>{var employee_name} wants a leave from you.</p><p>You can view this leave request by logging in to the portal using the link below.</p><p>{var site_url}admin/<br><br>Regards,</p><p>The {var site_name} Team</p>',	1),
(6,	'code4',	'Leave Approve',	'Your leave request has been approved',	'                <p>Hello,</p><p>Your leave request has been approved</p><p><span xss=\"removed\">Congratulations! </span>Your leave request from<font face=\"sans-serif, Arial, Verdana, Trebuchet MS\" color=\"#333333\"> </font>{var leave_start_date} to {var leave_end_date} has been approved by your company management.</p><p><span>You can view the leave by logging in to the portal using the link below.</span></p><p>{var site_url}admin/<br></p><p>Regards,<br>The {var site_name} Team</p>',	1),
(7,	'code5',	'Leave Reject',	'Your leave request has been Rejected',	'                <p>Hello,</p><p>Your leave request has been Rejected</p><p>Unfortunately! Your leave request from {var leave_start_date} to {var leave_end_date} has been Rejected by your company management.</p><p><span>You can view the leave by logging in to the portal using the link below.</span></p><p>{var site_url}admin/</p><p>Regards,</p><p>The {var site_name} Team</p>',	1),
(8,	'code6',	'Welcome Email ',	'Welcome Email ',	'            <p>Hello {var employee_name},</p><p>Welcome to {var site_name} .Thanks for joining {var site_name}. We listed your sign in details below, make sure you keep them safe.</p><p>Your Username: {var username}</p><p>Your Employee ID: {var employee_id}</p><p>Your Email Address: {var email}<br></p><p>Your Password: {var password}</p><p>Your Password: {var pincode}</p><p><span>You can logging in to the portal using the link below</span></p><p>{var site_url}admin/</p><br><p>Thank you,</p><p>The {var site_name} Team</p>',	1),
(9,	'code7',	'Transfer',	'New Transfer',	'        <p>Hello {var employee_name},</p><p>You have been transfered to another department and location.</p><p>You can view the transfer details by logging in to the portal using the link below.</p><p>{var site_url}admin/</p><p>Regards,</p><p>The {var site_name} Team</p>',	1),
(10,	'code8',	'Award',	'New Award Received',	'    <p>Hello {var employee_name},</p><p>You have been awarded {var award_name}.</p><p>You can view this award by logging in to the portal using the link below.</p><p><span xss=\"removed\">{var site_url}admin</span><span xss=\"removed\">/awards/</span><br></p><p>Regards,</p><p>The {var site_name} Team</p>',	1),
(14,	'code9',	'New Task',	'Task assigned',	'    <p>Hi {employee_name},</p><p>A new task <span>{var task_name}</span> has been assigned to [{project_name}]</p><p>You can view this task by logging in to the portal using the link below.</p><p>{var site_url}</p><p>Regards,</p><p>The {var site_name} Team</p>',	1),
(15,	'code10',	'New Inquiry',	'New Inquiry [#{var ticket_code}]',	'    <p xss=\"\\\\\\\\\" rgb(51,=\"\\\" font-family:=\"\\\" sans-serif,=\"\\\" arial,=\"\\\" verdana,=\"\\\\\" trebuchet=\"\\\\\\\\\"><span xss=\"\\\\\\\\\">Hi,</span><br></p><p xss=\"\\\\\\\\\" rgb(51,=\"\\\" font-family:=\"\\\" sans-serif,=\"\\\" arial,=\"\\\" verdana,=\"\\\\\" trebuchet=\"\\\\\\\\\"><span xss=\"\\\\\\\\\">Your received a new inquiry.</span></p><p xss=\"\\\\\\\\\" rgb(51,=\"\\\" font-family:=\"\\\" sans-serif,=\"\\\" arial,=\"\\\" verdana,=\"\\\\\" trebuchet=\"\\\\\\\\\"><span xss=\"\\\\\\\\\">Inquiry Code: #{var ticket_code}</span></p><p xss=\"\\\\\\\\\" rgb(51,=\"\\\" font-family:=\"\\\" sans-serif,=\"\\\" arial,=\"\\\" verdana,=\"\\\\\" trebuchet=\"\\\\\\\\\">Status : Open<br><br>Click on the below link to see the inquiry details and post additional comments.</p><p xss=\"\\\\\\\\\" rgb(51,=\"\\\" font-family:=\"\\\" sans-serif,=\"\\\" arial,=\"\\\" verdana,=\"\\\\\" trebuchet=\"\\\\\\\\\">{var site_url}admin/<br><br>Regards,</p><p xss=\"\\\\\\\\\" rgb(51,=\"\\\" font-family:=\"\\\" sans-serif,=\"\\\" arial,=\"\\\" verdana,=\"\\\\\" trebuchet=\"\\\\\\\\\">The {var site_name} Team</p>',	1),
(16,	'code11',	'Client Welcome Email',	'Welcome Email',	'        <p>Hello {var client_name},</p><p>Welcome to {var site_name}. Thanks for joining {var site_name}. We listed your sign in details below, make sure you keep them safe. You can login to your panel using email and password.</p><p>Your Username: {var username}</p><p><span xss=\"\\\\\\\\\">Your Email Address: {var email}</span></p><p>Your Password: {var password}<br></p><p>{var site_url}client/</p><p>Have fun!</p><p>The {var site_name} Team</p>',	1),
(17,	'code12',	'Password Changed Successfully',	'Password Changed Successfully',	'    <p>Hello,</p><p>Congratulations! Your password has been updated successfully.</p><p>Your new password is: {var password}</p><p>Your new pincode: {var pincode}<br></p><p>Thank you,<br>The {var site_name} Team<br></p>',	1);

DROP TABLE IF EXISTS `xin_employee_bankaccount`;
CREATE TABLE `xin_employee_bankaccount` (
  `bankaccount_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `is_primary` int NOT NULL,
  `account_title` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `bank_code` varchar(255) NOT NULL,
  `bank_branch` mediumtext NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`bankaccount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_employee_bankaccount`;

DROP TABLE IF EXISTS `xin_employee_complaints`;
CREATE TABLE `xin_employee_complaints` (
  `complaint_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `complaint_from` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `complaint_date` varchar(255) NOT NULL,
  `complaint_against` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `status` tinyint NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`complaint_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_employee_complaints`;

DROP TABLE IF EXISTS `xin_employee_contacts`;
CREATE TABLE `xin_employee_contacts` (
  `contact_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `relation` varchar(255) NOT NULL,
  `is_primary` int NOT NULL,
  `is_dependent` int NOT NULL,
  `contact_name` varchar(255) NOT NULL,
  `work_phone` varchar(255) NOT NULL,
  `work_phone_extension` varchar(255) NOT NULL,
  `mobile_phone` varchar(255) NOT NULL,
  `home_phone` varchar(255) NOT NULL,
  `work_email` varchar(255) NOT NULL,
  `personal_email` varchar(255) NOT NULL,
  `address_1` mediumtext NOT NULL,
  `address_2` mediumtext NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_employee_contacts`;

DROP TABLE IF EXISTS `xin_employee_contract`;
CREATE TABLE `xin_employee_contract` (
  `contract_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `contract_type_id` int NOT NULL,
  `from_date` varchar(255) NOT NULL,
  `designation_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `to_date` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`contract_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_employee_contract`;

DROP TABLE IF EXISTS `xin_employee_documents`;
CREATE TABLE `xin_employee_documents` (
  `document_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `document_type_id` int NOT NULL,
  `date_of_expiry` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `notification_email` varchar(255) NOT NULL,
  `is_alert` tinyint(1) NOT NULL,
  `description` mediumtext NOT NULL,
  `document_file` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_employee_documents`;

DROP TABLE IF EXISTS `xin_employee_exit`;
CREATE TABLE `xin_employee_exit` (
  `exit_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `exit_date` varchar(255) NOT NULL,
  `exit_type_id` int NOT NULL,
  `exit_interview` int NOT NULL,
  `is_inactivate_account` int NOT NULL,
  `reason` mediumtext NOT NULL,
  `added_by` int NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`exit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_employee_exit`;

DROP TABLE IF EXISTS `xin_employee_exit_type`;
CREATE TABLE `xin_employee_exit_type` (
  `exit_type_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`exit_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_employee_exit_type`;
INSERT INTO `xin_employee_exit_type` (`exit_type_id`, `company_id`, `type`, `created_at`) VALUES
(1,	1,	'Test',	'');

DROP TABLE IF EXISTS `xin_employee_immigration`;
CREATE TABLE `xin_employee_immigration` (
  `immigration_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `document_type_id` int NOT NULL,
  `document_number` varchar(255) NOT NULL,
  `document_file` varchar(255) NOT NULL,
  `issue_date` varchar(255) NOT NULL,
  `expiry_date` varchar(255) NOT NULL,
  `country_id` varchar(255) NOT NULL,
  `eligible_review_date` varchar(255) NOT NULL,
  `comments` mediumtext NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`immigration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_employee_immigration`;
INSERT INTO `xin_employee_immigration` (`immigration_id`, `employee_id`, `document_type_id`, `document_number`, `document_file`, `issue_date`, `expiry_date`, `country_id`, `eligible_review_date`, `comments`, `created_at`) VALUES
(1,	1,	1,	'11407855580',	'document_1660052001.jpg',	'2022-08-09',	'2023-08-09',	'101',	'2023-08-01',	'',	'09-08-2022 01:33:21');

DROP TABLE IF EXISTS `xin_employee_leave`;
CREATE TABLE `xin_employee_leave` (
  `leave_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `contract_id` int NOT NULL,
  `casual_leave` varchar(255) NOT NULL,
  `medical_leave` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`leave_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_employee_leave`;

DROP TABLE IF EXISTS `xin_employee_location`;
CREATE TABLE `xin_employee_location` (
  `office_location_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `location_id` int NOT NULL,
  `from_date` varchar(255) NOT NULL,
  `to_date` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`office_location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_employee_location`;

DROP TABLE IF EXISTS `xin_employee_promotions`;
CREATE TABLE `xin_employee_promotions` (
  `promotion_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `promotion_date` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `added_by` int NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`promotion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_employee_promotions`;

DROP TABLE IF EXISTS `xin_employee_qualification`;
CREATE TABLE `xin_employee_qualification` (
  `qualification_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `education_level_id` int NOT NULL,
  `from_year` varchar(255) NOT NULL,
  `language_id` int NOT NULL,
  `to_year` varchar(255) NOT NULL,
  `skill_id` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`qualification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_employee_qualification`;

DROP TABLE IF EXISTS `xin_employee_resignations`;
CREATE TABLE `xin_employee_resignations` (
  `resignation_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `designation_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `notice_date` varchar(255) NOT NULL,
  `resignation_date` varchar(255) NOT NULL,
  `reason` mediumtext NOT NULL,
  `added_by` int NOT NULL,
  `status` int NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`resignation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_employee_resignations`;

DROP TABLE IF EXISTS `xin_employee_security_level`;
CREATE TABLE `xin_employee_security_level` (
  `security_level_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `security_type` int NOT NULL,
  `date_of_clearance` varchar(200) NOT NULL,
  `expiry_date` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`security_level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `xin_employee_security_level`;

DROP TABLE IF EXISTS `xin_employee_shift`;
CREATE TABLE `xin_employee_shift` (
  `emp_shift_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `shift_id` int NOT NULL,
  `from_date` varchar(255) NOT NULL,
  `to_date` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`emp_shift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_employee_shift`;

DROP TABLE IF EXISTS `xin_employee_terminations`;
CREATE TABLE `xin_employee_terminations` (
  `termination_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `terminated_by` int NOT NULL,
  `termination_type_id` int NOT NULL,
  `termination_date` varchar(255) NOT NULL,
  `notice_date` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `status` tinyint NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`termination_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_employee_terminations`;

DROP TABLE IF EXISTS `xin_employee_transfer`;
CREATE TABLE `xin_employee_transfer` (
  `transfer_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `transfer_date` varchar(255) NOT NULL,
  `transfer_department` int NOT NULL,
  `transfer_location` int NOT NULL,
  `description` mediumtext NOT NULL,
  `status` tinyint NOT NULL,
  `added_by` int NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`transfer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_employee_transfer`;
INSERT INTO `xin_employee_transfer` (`transfer_id`, `company_id`, `employee_id`, `transfer_date`, `transfer_department`, `transfer_location`, `description`, `status`, `added_by`, `created_at`) VALUES
(1,	1,	7,	'2022-10-13',	2,	1,	'',	0,	1,	'05-10-2022');

DROP TABLE IF EXISTS `xin_employee_travels`;
CREATE TABLE `xin_employee_travels` (
  `travel_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `start_date` varchar(255) NOT NULL,
  `end_date` varchar(255) NOT NULL,
  `visit_purpose` varchar(255) NOT NULL,
  `visit_place` varchar(255) NOT NULL,
  `travel_mode` int DEFAULT NULL,
  `arrangement_type` int DEFAULT NULL,
  `expected_budget` varchar(255) NOT NULL,
  `actual_budget` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `status` tinyint NOT NULL,
  `added_by` int NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`travel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_employee_travels`;

DROP TABLE IF EXISTS `xin_employee_warnings`;
CREATE TABLE `xin_employee_warnings` (
  `warning_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `warning_to` int NOT NULL,
  `warning_by` int NOT NULL,
  `warning_date` varchar(255) NOT NULL,
  `warning_type_id` int NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `status` tinyint NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`warning_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_employee_warnings`;

DROP TABLE IF EXISTS `xin_employee_work_experience`;
CREATE TABLE `xin_employee_work_experience` (
  `work_experience_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `from_date` varchar(255) NOT NULL,
  `to_date` varchar(255) NOT NULL,
  `post` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`work_experience_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_employee_work_experience`;

DROP TABLE IF EXISTS `xin_employees`;
CREATE TABLE `xin_employees` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(200) NOT NULL,
  `office_shift_id` int NOT NULL,
  `reports_to` int NOT NULL DEFAULT '0',
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `pincode` int NOT NULL,
  `password` varchar(200) NOT NULL,
  `date_of_birth` varchar(200) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `e_status` int NOT NULL,
  `user_role_id` int NOT NULL,
  `department_id` int NOT NULL,
  `sub_department_id` int NOT NULL,
  `designation_id` int NOT NULL,
  `company_id` int DEFAULT NULL,
  `location_id` int NOT NULL,
  `view_companies_id` varchar(255) NOT NULL,
  `salary_template` varchar(255) NOT NULL,
  `hourly_grade_id` int NOT NULL,
  `monthly_grade_id` int NOT NULL,
  `date_of_joining` varchar(200) NOT NULL,
  `date_of_leaving` varchar(255) NOT NULL,
  `marital_status` varchar(255) NOT NULL,
  `salary` varchar(200) NOT NULL,
  `wages_type` int NOT NULL,
  `basic_salary` varchar(200) NOT NULL DEFAULT '0',
  `daily_wages` varchar(200) NOT NULL DEFAULT '0',
  `salary_ssempee` varchar(200) NOT NULL DEFAULT '0',
  `salary_ssempeer` varchar(200) DEFAULT '0',
  `salary_income_tax` varchar(200) NOT NULL DEFAULT '0',
  `salary_overtime` varchar(200) NOT NULL DEFAULT '0',
  `salary_commission` varchar(200) NOT NULL DEFAULT '0',
  `salary_claims` varchar(200) NOT NULL DEFAULT '0',
  `salary_paid_leave` varchar(200) NOT NULL DEFAULT '0',
  `salary_director_fees` varchar(200) NOT NULL DEFAULT '0',
  `salary_bonus` varchar(200) NOT NULL DEFAULT '0',
  `salary_advance_paid` varchar(200) NOT NULL DEFAULT '0',
  `address` mediumtext NOT NULL,
  `state` varchar(200) NOT NULL,
  `city` varchar(200) NOT NULL,
  `zipcode` varchar(200) NOT NULL,
  `profile_picture` mediumtext NOT NULL,
  `profile_background` mediumtext NOT NULL,
  `resume` mediumtext NOT NULL,
  `skype_id` varchar(200) NOT NULL,
  `contact_no` varchar(200) NOT NULL,
  `facebook_link` mediumtext NOT NULL,
  `twitter_link` mediumtext NOT NULL,
  `blogger_link` mediumtext NOT NULL,
  `linkdedin_link` mediumtext NOT NULL,
  `google_plus_link` mediumtext NOT NULL,
  `instagram_link` varchar(255) NOT NULL,
  `pinterest_link` varchar(255) NOT NULL,
  `youtube_link` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `last_login_date` varchar(255) NOT NULL,
  `last_logout_date` varchar(255) NOT NULL,
  `last_login_ip` varchar(255) NOT NULL,
  `is_logged_in` int NOT NULL,
  `online_status` int NOT NULL,
  `fixed_header` varchar(150) NOT NULL,
  `compact_sidebar` varchar(150) NOT NULL,
  `boxed_wrapper` varchar(150) NOT NULL,
  `leave_categories` varchar(255) NOT NULL DEFAULT '0',
  `ethnicity_type` int NOT NULL,
  `blood_group` varchar(50) DEFAULT NULL,
  `nationality_id` int NOT NULL,
  `citizenship_id` int NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_employees`;
INSERT INTO `xin_employees` (`user_id`, `employee_id`, `office_shift_id`, `reports_to`, `first_name`, `last_name`, `username`, `email`, `pincode`, `password`, `date_of_birth`, `gender`, `e_status`, `user_role_id`, `department_id`, `sub_department_id`, `designation_id`, `company_id`, `location_id`, `view_companies_id`, `salary_template`, `hourly_grade_id`, `monthly_grade_id`, `date_of_joining`, `date_of_leaving`, `marital_status`, `salary`, `wages_type`, `basic_salary`, `daily_wages`, `salary_ssempee`, `salary_ssempeer`, `salary_income_tax`, `salary_overtime`, `salary_commission`, `salary_claims`, `salary_paid_leave`, `salary_director_fees`, `salary_bonus`, `salary_advance_paid`, `address`, `state`, `city`, `zipcode`, `profile_picture`, `profile_background`, `resume`, `skype_id`, `contact_no`, `facebook_link`, `twitter_link`, `blogger_link`, `linkdedin_link`, `google_plus_link`, `instagram_link`, `pinterest_link`, `youtube_link`, `is_active`, `last_login_date`, `last_logout_date`, `last_login_ip`, `is_logged_in`, `online_status`, `fixed_header`, `compact_sidebar`, `boxed_wrapper`, `leave_categories`, `ethnicity_type`, `blood_group`, `nationality_id`, `citizenship_id`, `created_at`) VALUES
(1,	'fionagrace',	1,	0,	'Three',	'Hartova',	'superuser',	'hartofa@runlapan.com',	0,	'$2y$12$Nc76mfT1BNiFeUJbYgEJyuSghodXTSOviYiIMXHr/qnZtU.Q/xs/i',	'2018-03-28',	'Male',	0,	1,	2,	0,	10,	1,	1,	'0',	'monthly',	0,	0,	'2018-02-01',	'',	'Single',	'',	1,	'1000',	'0',	'8',	'17',	'10',	'0',	'1',	'2',	'3',	'0',	'0',	'0',	'Test Address',	'',	'',	'',	'profile_1660051913.jpg',	'profile_background_1519924152.jpg',	'',	'',	'12345678900',	'',	'',	'',	'',	'',	'',	'',	'',	1,	'16-01-2023 11:23:51',	'10-01-2023 19:04:09',	'110.138.92.118',	1,	1,	'fixed_layout_hrsale',	'',	'',	'0,1,2',	0,	NULL,	0,	0,	'2018-02-28 05:30:44'),
(5,	'jsmith12',	1,	0,	'Jhon',	'Smith',	'jhonsmith',	'jsmt12@hrsale.com',	0,	'$2y$12$zjBiQwIQG7vmgGeq935iqOCDiQVREZgA3VsN44YderDI5YoXKkWdi',	'2018-03-31',	'Male',	0,	2,	2,	10,	10,	1,	0,	'',	'monthly',	0,	0,	'2018-03-02',	'',	'Single',	'',	1,	'1000',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'jsmt12',	'',	'',	'',	'',	'',	'',	'',	'1232',	'',	'',	'',	'',	'',	'',	'',	'',	1,	'17-04-2019 08:42:32',	'26-03-2019 07:31:01',	'::1',	1,	1,	'',	'',	'',	'0,1,2',	0,	NULL,	0,	0,	'2018-03-18 01:10:04'),
(6,	'955153',	1,	5,	'Nur',	'Amelia',	'nur',	'husni.ghci@gmail.com',	980838,	'$2y$12$/ChXuKpERm41tmtbb6Wyx.Wnw90gnLaTEZJh19buliPkbt2HnEySW',	'2012-07-03',	'Male',	0,	1,	1,	0,	9,	1,	1,	'',	'',	0,	0,	'2020-07-08',	'',	'',	'',	0,	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'test',	'',	'',	'',	'',	'',	'',	'',	'0992992',	'',	'',	'',	'',	'',	'',	'',	'',	1,	'08-07-2020 17:41:22',	'',	'::1',	1,	0,	'',	'',	'',	'0,1',	0,	NULL,	0,	0,	'2020-07-08 10:40:49'),
(7,	'586352',	1,	5,	'Budi',	'Susilo',	'susilo',	'susilo2305@gmail.com',	875871,	'$2y$12$WuRtwxKI/SoOafQbzCxik.lgu1rk4bKlLsrD0kQdOFW2Bf2zgVoda',	'2002-05-22',	'Male',	0,	2,	2,	0,	10,	1,	1,	'',	'',	0,	0,	'2022-05-27',	'',	'',	'',	0,	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'Jl. Panjang',	'',	'',	'',	'',	'',	'',	'',	'081212121212',	'',	'',	'',	'',	'',	'',	'',	'',	1,	'27-05-2022 12:23:14',	'27-05-2022 13:18:35',	'100.100.20.1',	0,	0,	'',	'',	'',	'0',	0,	NULL,	0,	0,	'2022-05-27 05:21:43'),
(8,	'682516',	1,	7,	'lala',	'gila',	'sahdbjknlm,;.',	'airbuss700@gmail.com',	108634,	'$2y$12$ggfvUI3EZVxFErmhQPH6ue3X.7nlEHKWVi7fAeXQ1sWACMJmDMvMO',	'1989-07-24',	'Male',	0,	2,	2,	0,	10,	1,	1,	'',	'',	0,	0,	'2022-07-24',	'',	'',	'',	0,	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'hgascvbjkndlm;,as.d\\',	'',	'',	'',	'',	'',	'',	'',	'08121890497',	'',	'',	'',	'',	'',	'',	'',	'',	1,	'',	'',	'',	0,	0,	'',	'',	'',	'0,2',	0,	NULL,	0,	0,	'2022-07-24 02:23:26');

DROP TABLE IF EXISTS `xin_ethnicity_type`;
CREATE TABLE `xin_ethnicity_type` (
  `ethnicity_type_id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`ethnicity_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `xin_ethnicity_type`;
INSERT INTO `xin_ethnicity_type` (`ethnicity_type_id`, `type`, `created_at`) VALUES
(1,	'HUMAN',	'15-01-2023 05:54:02');

DROP TABLE IF EXISTS `xin_events`;
CREATE TABLE `xin_events` (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `employee_id` varchar(255) DEFAULT NULL,
  `event_title` varchar(255) NOT NULL,
  `event_date` varchar(255) NOT NULL,
  `event_time` varchar(255) NOT NULL,
  `event_note` mediumtext NOT NULL,
  `event_color` varchar(200) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_events`;
INSERT INTO `xin_events` (`event_id`, `company_id`, `employee_id`, `event_title`, `event_date`, `event_time`, `event_note`, `event_color`, `created_at`) VALUES
(1,	1,	'7',	'metting bulanan',	'2022-07-24',	'08:44',	'sanklgfchhvjbnkm',	'#ff007b',	'2022-07-24');

DROP TABLE IF EXISTS `xin_expense_type`;
CREATE TABLE `xin_expense_type` (
  `expense_type_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`expense_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_expense_type`;
INSERT INTO `xin_expense_type` (`expense_type_id`, `company_id`, `name`, `status`, `created_at`) VALUES
(1,	1,	'GAJI',	1,	'22-03-2018 01:17:42'),
(2,	1,	'OPERASIONAL',	1,	'22-03-2018 01:17:48');

DROP TABLE IF EXISTS `xin_expenses`;
CREATE TABLE `xin_expenses` (
  `expense_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `company_id` int NOT NULL,
  `expense_type_id` int NOT NULL,
  `billcopy_file` mediumtext NOT NULL,
  `amount` varchar(200) NOT NULL,
  `purchase_date` varchar(200) NOT NULL,
  `remarks` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `status_remarks` mediumtext NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`expense_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_expenses`;

DROP TABLE IF EXISTS `xin_file_manager`;
CREATE TABLE `xin_file_manager` (
  `file_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `department_id` int NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_size` varchar(255) NOT NULL,
  `file_extension` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_file_manager`;

DROP TABLE IF EXISTS `xin_file_manager_settings`;
CREATE TABLE `xin_file_manager_settings` (
  `setting_id` int NOT NULL AUTO_INCREMENT,
  `allowed_extensions` mediumtext NOT NULL,
  `maximum_file_size` varchar(255) NOT NULL,
  `is_enable_all_files` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_file_manager_settings`;
INSERT INTO `xin_file_manager_settings` (`setting_id`, `allowed_extensions`, `maximum_file_size`, `is_enable_all_files`, `updated_at`) VALUES
(1,	'gif,png,pdf,txt,doc,docx',	'10',	'yes',	'2023-01-15 05:50:40');

DROP TABLE IF EXISTS `xin_finance_bankcash`;
CREATE TABLE `xin_finance_bankcash` (
  `bankcash_id` int NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) NOT NULL,
  `account_balance` varchar(255) NOT NULL,
  `account_opening_balance` varchar(200) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `branch_code` varchar(255) NOT NULL,
  `bank_branch` text NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`bankcash_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_finance_bankcash`;
INSERT INTO `xin_finance_bankcash` (`bankcash_id`, `account_name`, `account_balance`, `account_opening_balance`, `account_number`, `branch_code`, `bank_branch`, `created_at`) VALUES
(1,	'AlRajhi Bank',	'9995000',	'10000000',	'123456789',	'00966',	'Riyadh Branch',	'23-06-2020 01:23:16'),
(2,	'DSFSGFDSA',	'1000000000',	'1000000000',	'166229666478',	'00254',	'GHSADLKJBKJBAffbviU GFILqf',	'07-08-2022 12:25:04');

DROP TABLE IF EXISTS `xin_finance_deposit`;
CREATE TABLE `xin_finance_deposit` (
  `deposit_id` int NOT NULL AUTO_INCREMENT,
  `account_type_id` int NOT NULL,
  `amount` varchar(255) NOT NULL,
  `deposit_date` varchar(255) NOT NULL,
  `category_id` int NOT NULL,
  `payer_id` int NOT NULL,
  `payment_method` int NOT NULL,
  `deposit_reference` varchar(255) NOT NULL,
  `deposit_file` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`deposit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_finance_deposit`;

DROP TABLE IF EXISTS `xin_finance_expense`;
CREATE TABLE `xin_finance_expense` (
  `expense_id` int NOT NULL AUTO_INCREMENT,
  `account_type_id` int NOT NULL,
  `amount` varchar(255) NOT NULL,
  `expense_date` varchar(255) NOT NULL,
  `category_id` int NOT NULL,
  `payee_id` int NOT NULL,
  `payment_method` int NOT NULL,
  `expense_reference` varchar(255) NOT NULL,
  `expense_file` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`expense_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_finance_expense`;

DROP TABLE IF EXISTS `xin_finance_payees`;
CREATE TABLE `xin_finance_payees` (
  `payee_id` int NOT NULL AUTO_INCREMENT,
  `payee_name` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`payee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_finance_payees`;

DROP TABLE IF EXISTS `xin_finance_payers`;
CREATE TABLE `xin_finance_payers` (
  `payer_id` int NOT NULL AUTO_INCREMENT,
  `payer_name` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`payer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_finance_payers`;

DROP TABLE IF EXISTS `xin_finance_transaction`;
CREATE TABLE `xin_finance_transaction` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `company_id` int NOT NULL,
  `transaction_date` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `amount` float NOT NULL,
  `transaction_type` varchar(100) NOT NULL,
  `dr_cr` enum('dr','cr') NOT NULL,
  `transaction_cat_id` int NOT NULL,
  `payer_payee_id` int NOT NULL,
  `payee_option` int DEFAULT NULL,
  `payment_method_id` int NOT NULL,
  `reference` varchar(100) NOT NULL,
  `invoice_id` int DEFAULT NULL,
  `client_id` int NOT NULL,
  `invoice_type` varchar(100) DEFAULT NULL,
  `attachment_file` varchar(100) DEFAULT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `xin_finance_transaction`;
INSERT INTO `xin_finance_transaction` (`transaction_id`, `account_id`, `company_id`, `transaction_date`, `description`, `amount`, `transaction_type`, `dr_cr`, `transaction_cat_id`, `payer_payee_id`, `payee_option`, `payment_method_id`, `reference`, `invoice_id`, `client_id`, `invoice_type`, `attachment_file`, `created_at`) VALUES
(1,	1,	0,	'2020-07-10',	'Payroll Payments',	1000,	'expense',	'cr',	0,	5,	NULL,	3,	'Payroll Payments',	1,	5,	NULL,	NULL,	'2020-07-10 06:04:31'),
(2,	1,	0,	'2022-05-26',	'Payroll Payments',	1000,	'expense',	'cr',	0,	5,	NULL,	3,	'Payroll Payments',	2,	5,	NULL,	NULL,	'2022-05-26 12:33:25'),
(3,	1,	0,	'2022-06-22',	'Payroll Payments',	1000,	'expense',	'cr',	0,	5,	NULL,	3,	'Payroll Payments',	3,	5,	NULL,	NULL,	'2022-06-22 14:07:45'),
(4,	1,	0,	'2022-07-24',	'Payroll Payments',	1000,	'expense',	'cr',	0,	5,	NULL,	3,	'Payroll Payments',	4,	5,	NULL,	NULL,	'2022-07-24 05:47:53'),
(5,	1,	0,	'2022-07-24',	'Payroll Payments',	1000,	'expense',	'cr',	0,	5,	NULL,	3,	'Payroll Payments',	5,	5,	NULL,	NULL,	'2022-07-24 16:21:28'),
(6,	0,	0,	'2022-08-07',	'Payroll Payments',	1000,	'expense',	'cr',	0,	5,	NULL,	3,	'Payroll Payments',	6,	5,	NULL,	NULL,	'2022-08-07 12:23:44'),
(7,	0,	0,	'2022-08-07',	'Payroll Payments',	1000,	'expense',	'cr',	0,	5,	NULL,	3,	'Payroll Payments',	7,	5,	NULL,	NULL,	'2022-08-07 12:23:46'),
(8,	0,	0,	'2022-08-14',	'Payroll Payments',	1000,	'expense',	'cr',	0,	5,	NULL,	3,	'Payroll Payments',	8,	5,	NULL,	NULL,	'2022-08-14 22:38:25'),
(9,	0,	0,	'2022-08-14',	'Payroll Payments',	1000,	'expense',	'cr',	0,	5,	NULL,	3,	'Payroll Payments',	9,	5,	NULL,	NULL,	'2022-08-14 23:11:54'),
(10,	0,	0,	'2022-10-03',	'Payroll Payments',	1000,	'expense',	'cr',	0,	5,	NULL,	3,	'Payroll Payments',	10,	5,	NULL,	NULL,	'2022-10-03 06:59:30'),
(11,	0,	0,	'2022-10-03',	'Award Payments',	0,	'expense',	'cr',	0,	7,	NULL,	3,	'Award Payments',	1,	7,	NULL,	NULL,	'2022-10-03 07:08:14'),
(12,	0,	0,	'2022-11-18',	'Payroll Payments',	1000,	'expense',	'cr',	0,	5,	NULL,	3,	'Payroll Payments',	11,	5,	NULL,	NULL,	'2022-11-18 10:02:52'),
(13,	0,	0,	'2022-12-09',	'Payroll Payments',	1000,	'expense',	'cr',	0,	5,	NULL,	3,	'Payroll Payments',	12,	5,	NULL,	NULL,	'2022-12-09 11:20:29');

DROP TABLE IF EXISTS `xin_finance_transactions`;
CREATE TABLE `xin_finance_transactions` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `account_type_id` int NOT NULL,
  `deposit_id` int NOT NULL,
  `expense_id` int NOT NULL,
  `transfer_id` int NOT NULL,
  `transaction_type` varchar(255) NOT NULL,
  `total_amount` varchar(255) NOT NULL,
  `transaction_debit` varchar(255) NOT NULL,
  `transaction_credit` varchar(255) NOT NULL,
  `transaction_date` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_finance_transactions`;

DROP TABLE IF EXISTS `xin_finance_transfer`;
CREATE TABLE `xin_finance_transfer` (
  `transfer_id` int NOT NULL AUTO_INCREMENT,
  `from_account_id` int NOT NULL,
  `to_account_id` int NOT NULL,
  `transfer_date` varchar(255) NOT NULL,
  `transfer_amount` varchar(255) NOT NULL,
  `payment_method` varchar(111) NOT NULL,
  `transfer_reference` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`transfer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_finance_transfer`;

DROP TABLE IF EXISTS `xin_goal_tracking`;
CREATE TABLE `xin_goal_tracking` (
  `tracking_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `tracking_type_id` int NOT NULL,
  `start_date` varchar(200) NOT NULL,
  `end_date` varchar(200) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `target_achiement` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `goal_progress` varchar(200) NOT NULL,
  `goal_status` int NOT NULL DEFAULT '0',
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`tracking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_goal_tracking`;

DROP TABLE IF EXISTS `xin_goal_tracking_type`;
CREATE TABLE `xin_goal_tracking_type` (
  `tracking_type_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`tracking_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_goal_tracking_type`;
INSERT INTO `xin_goal_tracking_type` (`tracking_type_id`, `company_id`, `type_name`, `created_at`) VALUES
(1,	1,	'Invoice Goal',	'30-12-2022 09:24:26'),
(4,	1,	'Event Goal',	'31-08-2018 01:29:47');

DROP TABLE IF EXISTS `xin_holidays`;
CREATE TABLE `xin_holidays` (
  `holiday_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `event_name` varchar(200) NOT NULL,
  `description` mediumtext NOT NULL,
  `start_date` varchar(200) NOT NULL,
  `end_date` varchar(200) NOT NULL,
  `is_publish` tinyint(1) NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`holiday_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_holidays`;

DROP TABLE IF EXISTS `xin_hourly_templates`;
CREATE TABLE `xin_hourly_templates` (
  `hourly_rate_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `hourly_grade` varchar(255) NOT NULL,
  `hourly_rate` varchar(255) NOT NULL,
  `added_by` int NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`hourly_rate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_hourly_templates`;

DROP TABLE IF EXISTS `xin_hrsale_invoices`;
CREATE TABLE `xin_hrsale_invoices` (
  `invoice_id` int NOT NULL AUTO_INCREMENT,
  `invoice_number` varchar(255) NOT NULL,
  `client_id` int NOT NULL,
  `project_id` int NOT NULL,
  `invoice_date` varchar(255) NOT NULL,
  `invoice_due_date` varchar(255) NOT NULL,
  `sub_total_amount` varchar(255) NOT NULL,
  `discount_type` varchar(11) NOT NULL,
  `discount_figure` varchar(255) NOT NULL,
  `total_tax` varchar(255) NOT NULL,
  `total_discount` varchar(255) NOT NULL,
  `grand_total` varchar(255) NOT NULL,
  `invoice_note` mediumtext NOT NULL,
  `name` varchar(200) NOT NULL DEFAULT 'null',
  `company_name` varchar(200) NOT NULL DEFAULT 'null',
  `client_profile` varchar(200) NOT NULL DEFAULT 'null',
  `email` varchar(200) NOT NULL DEFAULT 'null',
  `contact_number` varchar(200) NOT NULL DEFAULT 'null',
  `website_url` varchar(200) NOT NULL DEFAULT 'null',
  `address_1` text NOT NULL,
  `address_2` text NOT NULL,
  `city` varchar(200) NOT NULL DEFAULT 'null',
  `state` varchar(200) NOT NULL DEFAULT 'null',
  `zipcode` varchar(200) NOT NULL DEFAULT 'null',
  `countryid` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_hrsale_invoices`;

DROP TABLE IF EXISTS `xin_hrsale_invoices_items`;
CREATE TABLE `xin_hrsale_invoices_items` (
  `invoice_item_id` int NOT NULL AUTO_INCREMENT,
  `invoice_id` int NOT NULL,
  `project_id` int NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_tax_type` varchar(255) NOT NULL,
  `item_tax_rate` varchar(255) NOT NULL,
  `item_qty` varchar(255) NOT NULL,
  `item_unit_price` varchar(255) NOT NULL,
  `item_sub_total` varchar(255) NOT NULL,
  `sub_total_amount` varchar(255) NOT NULL,
  `total_tax` varchar(255) NOT NULL,
  `discount_type` int NOT NULL,
  `discount_figure` varchar(255) NOT NULL,
  `total_discount` varchar(255) NOT NULL,
  `grand_total` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`invoice_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_hrsale_invoices_items`;

DROP TABLE IF EXISTS `xin_hrsale_module_attributes`;
CREATE TABLE `xin_hrsale_module_attributes` (
  `custom_field_id` int NOT NULL AUTO_INCREMENT,
  `module_id` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `attribute_label` varchar(255) NOT NULL,
  `attribute_type` varchar(255) NOT NULL,
  `validation` int NOT NULL,
  `priority` int NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `xin_hrsale_module_attributes`;
INSERT INTO `xin_hrsale_module_attributes` (`custom_field_id`, `module_id`, `attribute`, `attribute_label`, `attribute_type`, `validation`, `priority`, `created_at`) VALUES
(1,	1,	'iskandar',	'nn',	'textarea',	1,	0,	'27-07-2022'),
(2,	4,	'dfghj',	'cv',	'text',	1,	0,	'27-07-2022'),
(3,	1,	'ISKANDAR',	'MERAH',	'text',	1,	0,	'15-08-2022');

DROP TABLE IF EXISTS `xin_hrsale_module_attributes_select_value`;
CREATE TABLE `xin_hrsale_module_attributes_select_value` (
  `attributes_select_value_id` int NOT NULL AUTO_INCREMENT,
  `custom_field_id` int NOT NULL,
  `select_label` varchar(255) NOT NULL,
  PRIMARY KEY (`attributes_select_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `xin_hrsale_module_attributes_select_value`;

DROP TABLE IF EXISTS `xin_hrsale_module_attributes_values`;
CREATE TABLE `xin_hrsale_module_attributes_values` (
  `attributes_value_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `module_attributes_id` int NOT NULL,
  `attribute_value` text NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`attributes_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `xin_hrsale_module_attributes_values`;
INSERT INTO `xin_hrsale_module_attributes_values` (`attributes_value_id`, `user_id`, `module_attributes_id`, `attribute_value`, `created_at`) VALUES
(1,	1,	2,	'cv',	'2022-08-03 01:43:12');

DROP TABLE IF EXISTS `xin_hrsale_notificaions`;
CREATE TABLE `xin_hrsale_notificaions` (
  `notificaion_id` int NOT NULL AUTO_INCREMENT,
  `module_name` varchar(255) NOT NULL,
  `module_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `is_notify` int NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`notificaion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_hrsale_notificaions`;
INSERT INTO `xin_hrsale_notificaions` (`notificaion_id`, `module_name`, `module_id`, `employee_id`, `is_notify`, `created_at`) VALUES
(1,	'asset',	1,	7,	1,	'27-07-2022 02:48:36'),
(2,	'tickets',	1,	8,	1,	'27-07-2022 02:51:18'),
(3,	'projects',	1,	8,	1,	'03-10-2022 06:55:37'),
(4,	'awards',	1,	7,	1,	'03-10-2022 07:08:14'),
(5,	'tasks',	1,	7,	1,	'15-01-2023 03:12:24');

DROP TABLE IF EXISTS `xin_hrsale_quotes`;
CREATE TABLE `xin_hrsale_quotes` (
  `quote_id` int NOT NULL AUTO_INCREMENT,
  `quote_number` varchar(255) NOT NULL,
  `project_id` int NOT NULL,
  `company_id` int NOT NULL,
  `quote_date` varchar(255) NOT NULL,
  `quote_due_date` varchar(255) NOT NULL,
  `client_id` int NOT NULL,
  `sub_total_amount` varchar(255) NOT NULL,
  `discount_type` varchar(11) NOT NULL,
  `discount_figure` varchar(255) NOT NULL,
  `total_tax` varchar(255) NOT NULL,
  `tax_type` varchar(100) NOT NULL,
  `tax_figure` varchar(255) NOT NULL,
  `total_discount` varchar(255) NOT NULL,
  `quote_type` varchar(100) NOT NULL,
  `grand_total` varchar(255) NOT NULL,
  `quote_note` mediumtext NOT NULL,
  `name` varchar(200) NOT NULL,
  `company_name` varchar(200) NOT NULL,
  `client_profile` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact_number` varchar(200) NOT NULL,
  `website_url` varchar(200) NOT NULL,
  `address_1` text NOT NULL,
  `address_2` text NOT NULL,
  `city` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL,
  `zipcode` varchar(200) NOT NULL,
  `countryid` int NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`quote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_hrsale_quotes`;

DROP TABLE IF EXISTS `xin_hrsale_quotes_items`;
CREATE TABLE `xin_hrsale_quotes_items` (
  `quote_item_id` int NOT NULL AUTO_INCREMENT,
  `quote_id` int NOT NULL,
  `project_id` int NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_tax_type` varchar(255) NOT NULL,
  `item_tax_rate` varchar(255) NOT NULL,
  `item_qty` varchar(255) NOT NULL,
  `item_unit_price` varchar(255) NOT NULL,
  `item_sub_total` varchar(255) NOT NULL,
  `sub_total_amount` varchar(255) NOT NULL,
  `total_tax` varchar(255) NOT NULL,
  `tax_type` int NOT NULL,
  `tax_figure` varchar(200) NOT NULL,
  `discount_type` int NOT NULL,
  `discount_figure` varchar(255) NOT NULL,
  `total_discount` varchar(255) NOT NULL,
  `grand_total` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`quote_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_hrsale_quotes_items`;

DROP TABLE IF EXISTS `xin_income_categories`;
CREATE TABLE `xin_income_categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_income_categories`;
INSERT INTO `xin_income_categories` (`category_id`, `name`, `status`, `created_at`) VALUES
(1,	'GAJI POKOK',	1,	'25-03-2018 09:36:20'),
(2,	'LEMBUR',	1,	'25-03-2018 09:36:28'),
(3,	'BONUS',	1,	'25-03-2018 09:36:32'),
(4,	'ISENTIF',	1,	'25-03-2018 09:36:53'),
(5,	'PROJECT',	1,	'25-03-2018 09:37:13'),
(6,	'Regular Income',	1,	'25-03-2018 09:37:17');

DROP TABLE IF EXISTS `xin_job_applications`;
CREATE TABLE `xin_job_applications` (
  `application_id` int NOT NULL AUTO_INCREMENT,
  `job_id` int NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  `message` mediumtext NOT NULL,
  `job_resume` mediumtext NOT NULL,
  `application_status` int NOT NULL DEFAULT '0',
  `application_remarks` mediumtext NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`application_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_job_applications`;

DROP TABLE IF EXISTS `xin_job_categories`;
CREATE TABLE `xin_job_categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `category_url` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_job_categories`;
INSERT INTO `xin_job_categories` (`category_id`, `category_name`, `category_url`, `created_at`) VALUES
(1,	'PHP',	'q7VJh5xWwr56ycN0mAou4266iOY8l1BbMd6H2D3rkFnjU9LgC',	'2018-04-15'),
(2,	'Android',	'q7VJh5xWwr56ycN0m34Aou4266iOY8l1BbMd6H2D3rkFnjU9LgC',	'2018-04-15'),
(3,	'WordPress',	'q2327VJh5xWwr56ycN0mAou4266iOY8l1BbMd6H2D3rkFnjU9LgC',	'2018-04-15'),
(4,	'Design',	'0oplfq7VJh5xWwr56ycN0mAou4266iOY8l1BbMd6H2D3rkFnjU9LgC',	'2018-04-15'),
(5,	'Developer',	'34e6zyr56ycN0mAou4266iOY8l1BbMd6H2D3rkFnjU9LgC',	'2018-04-15'),
(6,	'iOS',	'l1BbMd6H2D3rkFnjU9LgCq7VJh5xWwr56ycN0mAou4266iOY8',	'2018-04-15'),
(7,	'Mobile',	'l1BbMd6H2D3rkFnjU9LgCH2D3rkFnjU9BbMd6H2D3r',	'2018-04-15'),
(8,	'MySQL',	'2D3rkFnjU9LgCq7VJh5xWwl1BbMd6H2D3rkFnjU9LgCq7VJh5xWwr56ycN0mAou4266iOY8',	'2018-04-15'),
(9,	'JavaScript',	'gCq7VJh5xWwl1BbMd6H2D3rkFnjU9LgCq7VJh5xWwl1BbMd6H2D3rkFnjU9LgCq7VJh5xWwr56ycN0mAou4266iOY8',	'2018-04-15'),
(10,	'Software',	'zyr56ycN0mAou42634e6zyr56ycN0mAou4266iOY8l1BbMd6H2D3rkFnjU9LgC',	'2018-04-15'),
(11,	'Website Design',	'6iOY8l1BbMd6H2D3rkFnjU9LgCzyr56ycN0mAou42634e6zyr56ycN0mAou426',	'2018-04-15'),
(12,	'Programming',	'jU9LgCzyr56ycN0mAou4266iOY8l1BbMd6H2D3rkFn34e6zyr56ycN0mAou426',	'2018-04-15'),
(13,	'SEO',	'cN0mAou4266iOY8l1Bq2327VJh5xWwr56ybMd6H2D3rkFnjU9LgC',	'2018-04-15'),
(14,	'Java',	'VJh5xWwr56ybMd6H2DcN0mAou4266iOY8l1Bq23273rkFnjU9LgC',	'2018-04-15'),
(15,	'CSS',	'VJh5xWwr56ybMd6H2Dsdfkkj58234ksklEr6ybMd6H2D',	'2018-04-15'),
(16,	'HTML5',	'0349324k0434r23ksodfkpsodkfposakfkpww3MsH2Dei30ks',	'2018-04-15'),
(17,	'Web Development',	'sdfj0rkskfskdfj329FLE34LFMsH2Dei30ks0349324k0434',	'2018-04-15'),
(18,	'Web Design',	'MsH2Deiee30ks0349324k0434klEr6ybMd6234b5ksddif0k33',	'2018-04-15'),
(19,	'eCommerce',	'klEr6ybMd6234bMsH2Dei30ks0349324k04345ksddif0k33',	'2018-04-15'),
(20,	'Design',	'234bMsklEr6ybMd6H2Dssdk5yy98ooVJh5xWwr56y435gghhole93lfkkj58',	'2018-04-15'),
(21,	'Logo Design',	'k5yy98ooVJh5xWw45456y435gghhole93lfkkj58234bMsklEr6ybMd6H2D',	'2018-04-15'),
(22,	'Graphic Design',	'k5yy98ooVJh5xWwr56y435gghhole93lfkkj58234bMsklEr6ybMd6H2D',	'2018-04-15'),
(23,	'Video',	'k98ooVJh5xWwr56y435gghhole93lfkkj58234bMsklEr6ybMd6H2D',	'2018-04-15'),
(24,	'Animation',	'ole93lfkkj58234k98ooVJh5xWwr56ybMsklEr6ybMd6H2D',	'2018-04-15'),
(25,	'Adobe Photoshop',	'd6H2Dsdfkkj58234k98ooVJh5xWwr56ybMsklEr6ybMd6H2D',	'2018-04-15'),
(26,	'Illustration',	'xWwr56ybMd6H2DcN0mA3405kfVJh5ou4266iOY8l1Bq23273rkFnjU9LgC',	'2018-04-15'),
(27,	'Art',	'3405kfVJh5ou4266iOY8l1Bq23273rk3ok3xWwr56ybMd6H2DcN0mAFnjU9LgC',	'2018-04-15'),
(28,	'3D',	'Md6H2DcN0mAFnjU9LfVJh5ou4266iOY8l1Bq23273rk3ok3xWwr56ybgC',	'2018-04-15'),
(29,	'Adobe Illustrator',	'5ou4266iOY8l1Bq23273rkMd6H2DcN0mAFnjU9LfVJh3ok3xWwr56ybgCww',	'2018-04-15'),
(30,	'Drawing',	'6iOY8l1Bq23273rk0234KILR23492034ksfpd456yslfdsf5ou426',	'2018-04-15'),
(31,	'Web Design',	'3l34l432fo232l3223DhssdfRKLl5434lsdfl3l3sfs3lllblp23D',	'2018-04-15'),
(32,	'Cartoon',	'sdfowerewl567lflsdfl3l3sf3l34l432fo232l3223Dhs3lllblp23D',	'2018-04-15'),
(33,	'Graphics',	'3232l32hsfo23lllblp23D9LfVJkfo394s5ou42at5sd20cNsolof3llsblp23DcN',	'2018-04-15'),
(34,	'Fashion Design',	'9LfVJkfo394s5ou42at5sd203232l32hsfo23lllblp23DcNsolof3llsblp23DcN',	'2018-04-15'),
(35,	'WordPress',	'hsfo23lllblp23DcNsolof3llsblp23DcN9LfVJkfo394s5ou42',	'2018-04-15'),
(36,	'Editing',	'lof3llsblp23DcN9LfVJhsfo23lllblp23DcNsokfo394s5ou42',	'2018-04-15'),
(37,	'Writing',	'blp23DcNsokfo394slof3llsblp23DcN9LfVJh5ou42',	'2018-04-15'),
(38,	'T-Shirt Design',	'9LfVJh5ou42blp23DcNsdf329LfVJh5ou42bsokjfwpoek0mAFnjU',	'2018-04-15'),
(39,	'Display Advertising',	'9LfVJh5ou42bsokjfwpoek9LfVJh5ou42blp23DcN0mAFnjU',	'2018-04-15'),
(40,	'Email Marketing',	'DcN0mAFnjU9LfVJh5ou42bs66iOY8l1Bq23273rk3ok3xWwr56yMd6H2gC',	'2018-04-15'),
(41,	'Lead Generation',	'66iOY8l1Bq23273rk3ok3xWwr56yMd6H2DcN0mAFnjU9LfVJh5ou42bgC',	'2018-04-15'),
(42,	'Market & Customer Research',	'Aou42Eou42iOY800Ke3klAou42066iOY800fklAou42',	'2018-04-15'),
(43,	'Marketing Strategy',	'EKe3000fklAou4266iOY8l1kkadwlsdfk20323rlsKh4KadlLL',	'2018-04-15'),
(44,	'Public Relations',	'l1kkadwlsdfk20323rlsKh4KadlLLEKe3000fklAou4266iOY8',	'2018-04-15'),
(45,	'Telemarketing & Telesales',	'fklAou4266iOY8l1kkadwlsfBf329k3249owe923ksd324odLL2DcN0m',	'2018-04-15'),
(46,	'Other - Sales & Marketing',	'Bf329k3249owe923ksd324odfklAou4266iOY8l1kkadwlLL2DcN0m',	'2018-04-15'),
(47,	'SEM - Search Engine Marketing',	'Aou4266iOY8l1Bf329k3249owe923ksdkkadwlLL2DcN0m',	'2018-04-15'),
(48,	'SEO - Search Engine Optimization',	'rk0234KILR23492034ksfpd456y6iOY8l1Bq23273slfdsf5ou426',	'2018-04-15'),
(49,	'SMM - Social Media Marketing',	'2DcN0mAou4266iOY8l1BVJh5xWwr56ybMd6Hq23273rkFnjU9LgC',	'2018-04-15');

DROP TABLE IF EXISTS `xin_job_interviews`;
CREATE TABLE `xin_job_interviews` (
  `job_interview_id` int NOT NULL AUTO_INCREMENT,
  `job_id` int NOT NULL,
  `interviewers_id` varchar(255) NOT NULL,
  `interview_place` varchar(255) NOT NULL,
  `interview_date` varchar(255) NOT NULL,
  `interview_time` varchar(255) NOT NULL,
  `interviewees_id` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `added_by` int NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`job_interview_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_job_interviews`;

DROP TABLE IF EXISTS `xin_job_pages`;
CREATE TABLE `xin_job_pages` (
  `page_id` int NOT NULL AUTO_INCREMENT,
  `page_title` varchar(255) NOT NULL,
  `page_url` varchar(255) NOT NULL,
  `page_details` text NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_job_pages`;
INSERT INTO `xin_job_pages` (`page_id`, `page_title`, `page_url`, `page_details`, `created_at`) VALUES
(1,	'About Us',	'xl9wkRy7tqOehBo6YCDjFG2JTucpKI4gMNsn8Zdf',	'About Ussss',	'2018-04-15'),
(2,	'Communications',	'5uk4EUc3V9FYTbBQz7PWgKM6qCajfAipvhOJnZHl',	'Communications',	'2018-04-15'),
(3,	'Lending Licenses',	'5r6OCsUoHQFiRwI17W0eT38jbvpxEGuLhzgmt9lZ',	'Lending Licenses',	'2018-04-15'),
(4,	'Terms of Service',	'QrfbMOUWpdYNxjLFz8G1m6t3wi0X2RKEZVC9ySka',	'Terms of Service',	'2018-04-15'),
(5,	'Privacy Policy',	'rjHKhmsNezT2OJBAoQq0yU1tL5F34MCwgIiZEc7x',	'Privacy Policy',	'2018-04-15'),
(6,	'Support',	'gZbBVMxnfzYLlC2AOk609Q7yWpaSjmJHuRXosr58',	'Support',	'2018-04-15'),
(7,	'How It Works',	'l1BbMd6H2D3rkFnjU9LgCH2D3rkFnjU9BbMd6H2D3r',	'How It Works',	'2018-04-15'),
(8,	'Disclaimers',	'CTbzS9IrWkNU7VM3HGZYjp6iwmfyXDOQgtsP8FEc',	'Disclaimers',	'2018-04-15');

DROP TABLE IF EXISTS `xin_job_type`;
CREATE TABLE `xin_job_type` (
  `job_type_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `type_url` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`job_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_job_type`;
INSERT INTO `xin_job_type` (`job_type_id`, `company_id`, `type`, `type_url`, `created_at`) VALUES
(1,	1,	'Full Time',	'full-time',	'22-03-2018 02:18:48'),
(2,	1,	'Part Time',	'part-time',	'16-04-2018 06:29:45'),
(3,	1,	'Internship',	'internship',	'16-04-2018 06:30:06'),
(4,	1,	'Freelance',	'freelance',	'16-04-2018 06:30:21');

DROP TABLE IF EXISTS `xin_jobs`;
CREATE TABLE `xin_jobs` (
  `job_id` int NOT NULL AUTO_INCREMENT,
  `employer_id` int NOT NULL,
  `category_id` int NOT NULL,
  `company_id` int NOT NULL,
  `job_title` varchar(255) NOT NULL,
  `designation_id` int NOT NULL,
  `job_url` varchar(255) NOT NULL,
  `job_type` int NOT NULL,
  `category_url` varchar(255) NOT NULL,
  `is_featured` int NOT NULL,
  `type_url` varchar(255) NOT NULL,
  `job_vacancy` int NOT NULL,
  `gender` varchar(100) NOT NULL,
  `minimum_experience` varchar(255) NOT NULL,
  `date_of_closing` varchar(200) NOT NULL,
  `short_description` mediumtext NOT NULL,
  `long_description` mediumtext NOT NULL,
  `status` int NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_jobs`;

DROP TABLE IF EXISTS `xin_kpi_incidental`;
CREATE TABLE `xin_kpi_incidental` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `incidental_kpi` text NOT NULL,
  `targeted_date` varchar(200) NOT NULL,
  `status` int NOT NULL,
  `quarter` int NOT NULL,
  `result` varchar(200) NOT NULL,
  `feedback` text NOT NULL,
  `year_created` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL,
  `updated_at` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `xin_kpi_incidental`;

DROP TABLE IF EXISTS `xin_kpi_maingoals`;
CREATE TABLE `xin_kpi_maingoals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `main_kpi` varchar(255) NOT NULL,
  `year_created` varchar(200) NOT NULL,
  `status` varchar(100) NOT NULL,
  `approve_status` varchar(100) NOT NULL,
  `q1` varchar(100) NOT NULL,
  `q2` varchar(100) NOT NULL,
  `q3` varchar(100) NOT NULL,
  `q4` varchar(100) NOT NULL,
  `feedback` varchar(255) NOT NULL,
  `created_at` varchar(200) NOT NULL,
  `updated_at` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `xin_kpi_maingoals`;

DROP TABLE IF EXISTS `xin_kpi_variable`;
CREATE TABLE `xin_kpi_variable` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `variable_kpi` varchar(200) NOT NULL,
  `targeted_date` varchar(200) NOT NULL,
  `result` varchar(255) NOT NULL,
  `status` int NOT NULL,
  `approve_status` varchar(200) NOT NULL,
  `feedback` text NOT NULL,
  `quarter` varchar(200) NOT NULL,
  `year_created` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL,
  `updated_at` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `xin_kpi_variable`;

DROP TABLE IF EXISTS `xin_languages`;
CREATE TABLE `xin_languages` (
  `language_id` int NOT NULL AUTO_INCREMENT,
  `language_name` varchar(255) NOT NULL,
  `language_code` varchar(255) NOT NULL,
  `language_flag` varchar(255) NOT NULL,
  `is_active` int NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_languages`;
INSERT INTO `xin_languages` (`language_id`, `language_name`, `language_code`, `language_flag`, `is_active`, `created_at`) VALUES
(1,	'English',	'english',	'language_flag_1520564355.gif',	1,	''),
(4,	'Portuguese',	'portuguese',	'language_flag_1526420518.gif',	1,	'16-05-2018 12:41:57'),
(5,	'Vietnamese',	'vietnamese',	'language_flag_1526728529.gif',	1,	'19-05-2018 02:15:28'),
(6,	'Spanish',	'spanish',	'language_flag_1563906920.gif',	1,	'23-07-2019 11:35:20'),
(7,	'Svenska',	'swedish',	'language_flag_1564007195.gif',	1,	'25-07-2019 03:26:35'),
(8,	'Thailand',	'thailand',	'language_flag_1564007402.gif',	1,	'25-07-2019 03:30:02'),
(9,	'Indonesian',	'indonesian',	'language_flag_1564054894.gif',	1,	'25-07-2019 04:41:33'),
(10,	'Italiano',	'italian',	'language_flag_1564058198.gif',	1,	'25-07-2019 05:36:37'),
(11,	'Deutsch',	'dutch',	'language_flag_1564058280.gif',	1,	'25-07-2019 05:37:59'),
(12,	'Turkish',	'turkish',	'language_flag_1564058565.gif',	1,	'25-07-2019 05:42:44'),
(13,	'French',	'french',	'language_flag_1564058638.gif',	1,	'25-07-2019 05:43:58'),
(14,	'Russian',	'russian',	'language_flag_1564058661.gif',	1,	'25-07-2019 05:44:20'),
(15,	'Romanian',	'romanian',	'language_flag_1564058689.gif',	1,	'25-07-2019 05:44:49'),
(16,	'Irish',	'irish',	'language_flag_1564171301.gif',	1,	'27-07-2019 01:01:41'),
(17,	'Chinese',	'chinese',	'language_flag_1592785239.gif',	1,	'22-06-2020 03:20:38'),
(18,	'Japanese',	'japanese',	'language_flag_1592785267.gif',	1,	'22-06-2020 03:21:06'),
(19,	'Arabic',	'arabic',	'language_flag_1592785279.gif',	1,	'22-06-2020 03:21:19');

DROP TABLE IF EXISTS `xin_leads`;
CREATE TABLE `xin_leads` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `client_username` varchar(255) NOT NULL,
  `client_password` varchar(255) NOT NULL,
  `client_profile` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `is_changed` int NOT NULL,
  `gender` varchar(200) NOT NULL,
  `website_url` varchar(255) NOT NULL,
  `address_1` mediumtext NOT NULL,
  `address_2` mediumtext NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `country` int NOT NULL,
  `is_active` int NOT NULL,
  `last_logout_date` varchar(255) NOT NULL,
  `last_login_date` varchar(255) NOT NULL,
  `last_login_ip` varchar(255) NOT NULL,
  `is_logged_in` int NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_leads`;

DROP TABLE IF EXISTS `xin_leads_followup`;
CREATE TABLE `xin_leads_followup` (
  `leads_followup_id` int NOT NULL AUTO_INCREMENT,
  `lead_id` int NOT NULL,
  `next_followup` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`leads_followup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_leads_followup`;

DROP TABLE IF EXISTS `xin_leave_applications`;
CREATE TABLE `xin_leave_applications` (
  `leave_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `department_id` int NOT NULL,
  `leave_type_id` int NOT NULL,
  `from_date` varchar(200) NOT NULL,
  `to_date` varchar(200) NOT NULL,
  `applied_on` varchar(200) NOT NULL,
  `reason` mediumtext NOT NULL,
  `remarks` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_half_day` tinyint(1) DEFAULT NULL,
  `is_notify` int NOT NULL,
  `leave_attachment` varchar(255) DEFAULT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`leave_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_leave_applications`;

DROP TABLE IF EXISTS `xin_leave_type`;
CREATE TABLE `xin_leave_type` (
  `leave_type_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `type_name` varchar(200) NOT NULL,
  `days_per_year` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`leave_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_leave_type`;
INSERT INTO `xin_leave_type` (`leave_type_id`, `company_id`, `type_name`, `days_per_year`, `status`, `created_at`) VALUES
(1,	1,	'TAHUNAN',	'12',	1,	'19-03-2018 07:52:20'),
(2,	1,	'PRIBADI ',	'2',	1,	'19-03-2018 07:52:30');

DROP TABLE IF EXISTS `xin_make_payment`;
CREATE TABLE `xin_make_payment` (
  `make_payment_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `department_id` int NOT NULL,
  `company_id` int NOT NULL,
  `location_id` int NOT NULL,
  `designation_id` int NOT NULL,
  `payment_date` varchar(200) NOT NULL,
  `basic_salary` varchar(255) NOT NULL,
  `payment_amount` varchar(255) NOT NULL,
  `gross_salary` varchar(255) NOT NULL,
  `total_allowances` varchar(255) NOT NULL,
  `total_deductions` varchar(255) NOT NULL,
  `net_salary` varchar(255) NOT NULL,
  `house_rent_allowance` varchar(255) NOT NULL,
  `medical_allowance` varchar(255) NOT NULL,
  `travelling_allowance` varchar(255) NOT NULL,
  `dearness_allowance` varchar(255) NOT NULL,
  `provident_fund` varchar(255) NOT NULL,
  `tax_deduction` varchar(255) NOT NULL,
  `security_deposit` varchar(255) NOT NULL,
  `overtime_rate` varchar(255) NOT NULL,
  `is_advance_salary_deduct` int NOT NULL,
  `advance_salary_amount` varchar(255) NOT NULL,
  `is_payment` tinyint(1) NOT NULL,
  `payment_method` int NOT NULL,
  `hourly_rate` varchar(255) NOT NULL,
  `total_hours_work` varchar(255) NOT NULL,
  `comments` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`make_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_make_payment`;

DROP TABLE IF EXISTS `xin_meetings`;
CREATE TABLE `xin_meetings` (
  `meeting_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `employee_id` varchar(255) DEFAULT NULL,
  `meeting_title` varchar(255) NOT NULL,
  `meeting_date` varchar(255) NOT NULL,
  `meeting_time` varchar(255) NOT NULL,
  `meeting_room` varchar(255) NOT NULL,
  `meeting_note` mediumtext NOT NULL,
  `meeting_color` varchar(200) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`meeting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_meetings`;

DROP TABLE IF EXISTS `xin_office_location`;
CREATE TABLE `xin_office_location` (
  `location_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `location_head` int NOT NULL,
  `location_manager` int NOT NULL,
  `location_name` varchar(200) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `fax` varchar(255) NOT NULL,
  `address_1` mediumtext NOT NULL,
  `address_2` mediumtext NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `country` int NOT NULL,
  `added_by` int NOT NULL,
  `created_at` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_office_location`;
INSERT INTO `xin_office_location` (`location_id`, `company_id`, `location_head`, `location_manager`, `location_name`, `email`, `phone`, `fax`, `address_1`, `address_2`, `city`, `state`, `zipcode`, `country`, `added_by`, `created_at`, `status`) VALUES
(1,	1,	5,	0,	'Depok',	'info@runlapan.com',	'1234567890',	'1234567890',	'Address Line 1',	'Address Line 2',	'City',	'State',	'12345',	101,	1,	'28-02-2018',	1);

DROP TABLE IF EXISTS `xin_office_shift`;
CREATE TABLE `xin_office_shift` (
  `office_shift_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `shift_name` varchar(255) NOT NULL,
  `default_shift` int NOT NULL,
  `monday_in_time` varchar(222) NOT NULL,
  `monday_out_time` varchar(222) NOT NULL,
  `tuesday_in_time` varchar(222) NOT NULL,
  `tuesday_out_time` varchar(222) NOT NULL,
  `wednesday_in_time` varchar(222) NOT NULL,
  `wednesday_out_time` varchar(222) NOT NULL,
  `thursday_in_time` varchar(222) NOT NULL,
  `thursday_out_time` varchar(222) NOT NULL,
  `friday_in_time` varchar(222) NOT NULL,
  `friday_out_time` varchar(222) NOT NULL,
  `saturday_in_time` varchar(222) NOT NULL,
  `saturday_out_time` varchar(222) NOT NULL,
  `sunday_in_time` varchar(222) NOT NULL,
  `sunday_out_time` varchar(222) NOT NULL,
  `created_at` varchar(222) NOT NULL,
  PRIMARY KEY (`office_shift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_office_shift`;
INSERT INTO `xin_office_shift` (`office_shift_id`, `company_id`, `shift_name`, `default_shift`, `monday_in_time`, `monday_out_time`, `tuesday_in_time`, `tuesday_out_time`, `wednesday_in_time`, `wednesday_out_time`, `thursday_in_time`, `thursday_out_time`, `friday_in_time`, `friday_out_time`, `saturday_in_time`, `saturday_out_time`, `sunday_in_time`, `sunday_out_time`, `created_at`) VALUES
(1,	1,	'Morning Shift',	1,	'08:00',	'18:00',	'03:00',	'18:00',	'08:00',	'18:00',	'08:00',	'18:00',	'08:00',	'18:00',	'',	'',	'',	'',	'2018-02-28');

DROP TABLE IF EXISTS `xin_payment_method`;
CREATE TABLE `xin_payment_method` (
  `payment_method_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `method_name` varchar(255) NOT NULL,
  `payment_percentage` varchar(200) DEFAULT NULL,
  `account_number` varchar(200) DEFAULT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`payment_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_payment_method`;
INSERT INTO `xin_payment_method` (`payment_method_id`, `company_id`, `method_name`, `payment_percentage`, `account_number`, `created_at`) VALUES
(1,	1,	'Cash',	'30',	'',	'23-04-2018 05:13:52'),
(2,	1,	'Paypal',	'40',	'1',	'12-08-2018 02:18:50'),
(3,	1,	'Bank',	'30',	'1231232',	'12-08-2018 02:18:57');

DROP TABLE IF EXISTS `xin_payroll_custom_fields`;
CREATE TABLE `xin_payroll_custom_fields` (
  `payroll_custom_id` int NOT NULL AUTO_INCREMENT,
  `allow_custom_1` varchar(255) NOT NULL,
  `is_active_allow_1` int NOT NULL,
  `allow_custom_2` varchar(255) NOT NULL,
  `is_active_allow_2` int NOT NULL,
  `allow_custom_3` varchar(255) NOT NULL,
  `is_active_allow_3` int NOT NULL,
  `allow_custom_4` varchar(255) NOT NULL,
  `is_active_allow_4` int NOT NULL,
  `allow_custom_5` varchar(255) NOT NULL,
  `is_active_allow_5` int NOT NULL,
  `deduct_custom_1` varchar(255) NOT NULL,
  `is_active_deduct_1` int NOT NULL,
  `deduct_custom_2` varchar(255) NOT NULL,
  `is_active_deduct_2` int NOT NULL,
  `deduct_custom_3` varchar(255) NOT NULL,
  `is_active_deduct_3` int NOT NULL,
  `deduct_custom_4` varchar(255) NOT NULL,
  `is_active_deduct_4` int NOT NULL,
  `deduct_custom_5` varchar(255) NOT NULL,
  `is_active_deduct_5` int NOT NULL,
  PRIMARY KEY (`payroll_custom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_payroll_custom_fields`;

DROP TABLE IF EXISTS `xin_performance_appraisal`;
CREATE TABLE `xin_performance_appraisal` (
  `performance_appraisal_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `appraisal_year_month` varchar(255) NOT NULL,
  `customer_experience` int NOT NULL,
  `marketing` int NOT NULL,
  `management` int NOT NULL,
  `administration` int NOT NULL,
  `presentation_skill` int NOT NULL,
  `quality_of_work` int NOT NULL,
  `efficiency` int NOT NULL,
  `integrity` int NOT NULL,
  `professionalism` int NOT NULL,
  `team_work` int NOT NULL,
  `critical_thinking` int NOT NULL,
  `conflict_management` int NOT NULL,
  `attendance` int NOT NULL,
  `ability_to_meet_deadline` int NOT NULL,
  `remarks` mediumtext NOT NULL,
  `added_by` int NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`performance_appraisal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_performance_appraisal`;
INSERT INTO `xin_performance_appraisal` (`performance_appraisal_id`, `company_id`, `employee_id`, `appraisal_year_month`, `customer_experience`, `marketing`, `management`, `administration`, `presentation_skill`, `quality_of_work`, `efficiency`, `integrity`, `professionalism`, `team_work`, `critical_thinking`, `conflict_management`, `attendance`, `ability_to_meet_deadline`, `remarks`, `added_by`, `created_at`) VALUES
(1,	1,	7,	'2022-07',	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	'KEPADA YTH&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;HARTOFA AKBAR&lt;/p&gt;&lt;p&gt;DI TEMPAT&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Dalam kesempatan ini kami management Haus !, &lt;/p&gt;&lt;p&gt;mengucapkan terima kasih atas dedikasi dan kinerja karyawan kami an.:&lt;/p&gt;&lt;p&gt;Nama    : Hartofa Akbar&lt;/p&gt;&lt;p&gt;Jabatan &lt;/p&gt;',	1,	'22-06-2022'),
(2,	1,	7,	'2022-07',	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	'&lt;p&gt; PROMOSI KARYAWAN&lt;/p&gt;&lt;br&gt;&lt;p&gt;&lt;ul&gt;&lt;li&gt;Yang Bertanda tangan dibawah ini  &lt;/li&gt;&lt;li&gt;Nama  : Wahyudi &lt;/li&gt;&lt;li&gt;jabatan : Spv Hrd &lt;/li&gt;&lt;/ul&gt;&lt;p&gt;berdasarkan waktu dan penilaian kinerja karyawan An.Simpanse Gerai Tebet management Haus Indonesia Memutuskan untuk menaikan jabatan&lt;/p&gt;&lt;p&gt;sebagai Store Manager &lt;/p&gt;&lt;/p&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;',	1,	'27-07-2022');

DROP TABLE IF EXISTS `xin_performance_appraisal_options`;
CREATE TABLE `xin_performance_appraisal_options` (
  `performance_appraisal_options_id` int NOT NULL AUTO_INCREMENT,
  `appraisal_id` int NOT NULL,
  `appraisal_type` varchar(200) NOT NULL,
  `appraisal_option_id` int NOT NULL,
  `appraisal_option_value` int NOT NULL,
  PRIMARY KEY (`performance_appraisal_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `xin_performance_appraisal_options`;
INSERT INTO `xin_performance_appraisal_options` (`performance_appraisal_options_id`, `appraisal_id`, `appraisal_type`, `appraisal_option_id`, `appraisal_option_value`) VALUES
(1,	1,	'technical',	0,	2),
(2,	1,	'technical',	1,	2),
(3,	1,	'technical',	2,	2),
(4,	1,	'organizational',	0,	7),
(5,	1,	'organizational',	1,	7),
(6,	1,	'organizational',	2,	6),
(7,	2,	'technical',	0,	2),
(8,	2,	'technical',	1,	2),
(9,	2,	'technical',	2,	4),
(10,	2,	'organizational',	0,	6),
(11,	2,	'organizational',	1,	7),
(12,	2,	'organizational',	2,	8);

DROP TABLE IF EXISTS `xin_performance_indicator`;
CREATE TABLE `xin_performance_indicator` (
  `performance_indicator_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `designation_id` int NOT NULL,
  `customer_experience` int NOT NULL,
  `marketing` int NOT NULL,
  `management` int NOT NULL,
  `administration` int NOT NULL,
  `presentation_skill` int NOT NULL,
  `quality_of_work` int NOT NULL,
  `efficiency` int NOT NULL,
  `integrity` int NOT NULL,
  `professionalism` int NOT NULL,
  `team_work` int NOT NULL,
  `critical_thinking` int NOT NULL,
  `conflict_management` int NOT NULL,
  `attendance` int NOT NULL,
  `ability_to_meet_deadline` int NOT NULL,
  `added_by` int NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`performance_indicator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_performance_indicator`;

DROP TABLE IF EXISTS `xin_performance_indicator_options`;
CREATE TABLE `xin_performance_indicator_options` (
  `performance_indicator_options_id` int NOT NULL AUTO_INCREMENT,
  `indicator_id` int NOT NULL,
  `indicator_type` varchar(200) NOT NULL,
  `indicator_option_id` int NOT NULL,
  `indicator_option_value` int NOT NULL,
  PRIMARY KEY (`performance_indicator_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `xin_performance_indicator_options`;

DROP TABLE IF EXISTS `xin_project_variations`;
CREATE TABLE `xin_project_variations` (
  `variation_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `project_id` int NOT NULL,
  `created_by` int NOT NULL,
  `variation_name` varchar(255) NOT NULL,
  `variation_no` varchar(255) NOT NULL,
  `assigned_to` varchar(255) NOT NULL,
  `start_date` varchar(200) NOT NULL,
  `end_date` varchar(200) NOT NULL,
  `variation_hours` varchar(200) NOT NULL,
  `description` mediumtext NOT NULL,
  `variation_status` int NOT NULL,
  `client_approval` int NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`variation_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_project_variations`;

DROP TABLE IF EXISTS `xin_projects`;
CREATE TABLE `xin_projects` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `client_id` int NOT NULL,
  `start_date` varchar(255) NOT NULL,
  `end_date` varchar(255) NOT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `assigned_to` mediumtext NOT NULL,
  `priority` varchar(255) NOT NULL,
  `project_no` varchar(255) DEFAULT NULL,
  `phase_no` varchar(200) DEFAULT NULL,
  `purchase_no` varchar(200) DEFAULT NULL,
  `budget_hours` varchar(255) DEFAULT NULL,
  `summary` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `added_by` int NOT NULL,
  `project_progress` varchar(255) NOT NULL,
  `project_note` longtext NOT NULL,
  `status` tinyint NOT NULL,
  `is_notify` int NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_projects`;
INSERT INTO `xin_projects` (`project_id`, `title`, `client_id`, `start_date`, `end_date`, `company_id`, `assigned_to`, `priority`, `project_no`, `phase_no`, `purchase_no`, `budget_hours`, `summary`, `description`, `added_by`, `project_progress`, `project_note`, `status`, `is_notify`, `created_at`) VALUES
(1,	'pembangunan masjid ',	1,	'2022-10-03',	'2023-10-03',	'1',	'8',	'1',	'MJD',	'hajjaja',	'022254',	'10000000000',	'cepat',	'bangun masjid yang mana berfungsi utk kemaslahatan umat dan menciptakan hafiz hafiz quran',	1,	'0',	'',	0,	1,	'03-10-2022');

DROP TABLE IF EXISTS `xin_projects_attachment`;
CREATE TABLE `xin_projects_attachment` (
  `project_attachment_id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `upload_by` int NOT NULL,
  `file_title` varchar(255) NOT NULL,
  `file_description` mediumtext NOT NULL,
  `attachment_file` mediumtext NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`project_attachment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_projects_attachment`;

DROP TABLE IF EXISTS `xin_projects_bugs`;
CREATE TABLE `xin_projects_bugs` (
  `bug_id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `user_id` int NOT NULL,
  `attachment_file` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_projects_bugs`;

DROP TABLE IF EXISTS `xin_projects_discussion`;
CREATE TABLE `xin_projects_discussion` (
  `discussion_id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `user_id` int NOT NULL,
  `client_id` int NOT NULL,
  `attachment_file` varchar(255) NOT NULL,
  `message` mediumtext NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`discussion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_projects_discussion`;

DROP TABLE IF EXISTS `xin_projects_timelogs`;
CREATE TABLE `xin_projects_timelogs` (
  `timelogs_id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `company_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `start_time` varchar(255) NOT NULL,
  `end_time` varchar(255) NOT NULL,
  `start_date` varchar(255) NOT NULL,
  `end_date` varchar(255) NOT NULL,
  `total_hours` varchar(255) NOT NULL,
  `timelogs_memo` text NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`timelogs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `xin_projects_timelogs`;
INSERT INTO `xin_projects_timelogs` (`timelogs_id`, `project_id`, `company_id`, `employee_id`, `start_time`, `end_time`, `start_date`, `end_date`, `total_hours`, `timelogs_memo`, `created_at`) VALUES
(1,	1,	1,	8,	'06:56',	'09:56',	'2022-10-03',	'2023-10-03',	'8763:0',	'cepat',	'2022-10-03 06:56:40');

DROP TABLE IF EXISTS `xin_qualification_education_level`;
CREATE TABLE `xin_qualification_education_level` (
  `education_level_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`education_level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_qualification_education_level`;
INSERT INTO `xin_qualification_education_level` (`education_level_id`, `company_id`, `name`, `created_at`) VALUES
(1,	1,	'High School Diploma / GED',	'09-05-2018 03:11:59'),
(2,	0,	'SMA',	'15-01-2023 05:52:11');

DROP TABLE IF EXISTS `xin_qualification_language`;
CREATE TABLE `xin_qualification_language` (
  `language_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_qualification_language`;
INSERT INTO `xin_qualification_language` (`language_id`, `company_id`, `name`, `created_at`) VALUES
(1,	1,	'English',	'09-05-2018 03:12:03'),
(2,	0,	'ARAB',	'15-01-2023 05:52:25');

DROP TABLE IF EXISTS `xin_qualification_skill`;
CREATE TABLE `xin_qualification_skill` (
  `skill_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_qualification_skill`;
INSERT INTO `xin_qualification_skill` (`skill_id`, `company_id`, `name`, `created_at`) VALUES
(1,	1,	'jQuery',	'09-05-2018 03:12:08'),
(2,	0,	'MELOBBY SEPERTI BENTO',	'15-01-2023 05:52:44');

DROP TABLE IF EXISTS `xin_quoted_projects`;
CREATE TABLE `xin_quoted_projects` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `client_id` int NOT NULL,
  `estimate_date` varchar(255) NOT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `assigned_to` mediumtext NOT NULL,
  `priority` varchar(255) NOT NULL,
  `project_no` varchar(255) DEFAULT NULL,
  `phase_no` varchar(200) DEFAULT NULL,
  `estimate_hrs` varchar(255) DEFAULT NULL,
  `summary` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `added_by` int NOT NULL,
  `project_progress` varchar(255) NOT NULL,
  `project_note` longtext NOT NULL,
  `status` tinyint NOT NULL,
  `is_notify` int NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_quoted_projects`;

DROP TABLE IF EXISTS `xin_quoted_projects_attachment`;
CREATE TABLE `xin_quoted_projects_attachment` (
  `project_attachment_id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `upload_by` int NOT NULL,
  `file_title` varchar(255) NOT NULL,
  `file_description` mediumtext NOT NULL,
  `attachment_file` mediumtext NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`project_attachment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_quoted_projects_attachment`;

DROP TABLE IF EXISTS `xin_quoted_projects_discussion`;
CREATE TABLE `xin_quoted_projects_discussion` (
  `discussion_id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `user_id` int NOT NULL,
  `client_id` int NOT NULL,
  `attachment_file` varchar(255) NOT NULL,
  `message` mediumtext NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`discussion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_quoted_projects_discussion`;

DROP TABLE IF EXISTS `xin_quoted_projects_timelogs`;
CREATE TABLE `xin_quoted_projects_timelogs` (
  `timelogs_id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `company_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `start_time` varchar(255) NOT NULL,
  `end_time` varchar(255) NOT NULL,
  `start_date` varchar(255) NOT NULL,
  `end_date` varchar(255) NOT NULL,
  `total_hours` varchar(255) NOT NULL,
  `timelogs_memo` text NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`timelogs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `xin_quoted_projects_timelogs`;

DROP TABLE IF EXISTS `xin_recruitment_pages`;
CREATE TABLE `xin_recruitment_pages` (
  `page_id` int NOT NULL AUTO_INCREMENT,
  `page_title` varchar(255) NOT NULL,
  `page_details` mediumtext NOT NULL,
  `status` int NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_recruitment_pages`;
INSERT INTO `xin_recruitment_pages` (`page_id`, `page_title`, `page_details`, `status`, `created_at`) VALUES
(1,	'Pages',	'Nulla dignissim gravida\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ultricies dictum ex, nec ullamcorper orci luctus eget. Integer mauris arcu, pretium eget elit vel, posuere consectetur massa. Etiam non fermentum augue, vel posuere sapien. \n\nVivamus aliquet eros bibendum ipsum euismod, non interdum dui elementum. Morbi facilisis hendrerit nisi, a volutpat velit. Donec sed malesuada felis. Nulla facilisi. Vivamus a velit vel orci euismod maximus. Praesent ut blandit orci, eget suscipit lorem. Aenean dignissim, augue at porta suscipit, est enim euismod mi, a rhoncus mi lacus ac nibh. Ut pharetra ligula sed tortor congue, pellentesque ultricies augue tincidunt.',	1,	''),
(2,	'About Us',	'Nulla dignissim gravida\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ultricies dictum ex, nec ullamcorper orci luctus eget. Integer mauris arcu, pretium eget elit vel, posuere consectetur massa. Etiam non fermentum augue, vel posuere sapien. \n\nVivamus aliquet eros bibendum ipsum euismod, non interdum dui elementum. Morbi facilisis hendrerit nisi, a volutpat velit. Donec sed malesuada felis. Nulla facilisi. Vivamus a velit vel orci euismod maximus. Praesent ut blandit orci, eget suscipit lorem. Aenean dignissim, augue at porta suscipit, est enim euismod mi, a rhoncus mi lacus ac nibh. Ut pharetra ligula sed tortor congue, pellentesque ultricies augue tincidunt.',	1,	''),
(3,	'Career Services',	'Career Services',	1,	''),
(4,	'Success Stories',	'Success Stories',	1,	'');

DROP TABLE IF EXISTS `xin_recruitment_subpages`;
CREATE TABLE `xin_recruitment_subpages` (
  `subpages_id` int NOT NULL AUTO_INCREMENT,
  `page_id` int NOT NULL,
  `sub_page_title` varchar(255) NOT NULL,
  `sub_page_details` mediumtext NOT NULL,
  `status` int NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`subpages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_recruitment_subpages`;
INSERT INTO `xin_recruitment_subpages` (`subpages_id`, `page_id`, `sub_page_title`, `sub_page_details`, `status`, `created_at`) VALUES
(1,	1,	'Sub Menu 1',	'Nulla dignissim gravida\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ultricies dictum ex, nec ullamcorper orci luctus eget. Integer mauris arcu, pretium eget elit vel, posuere consectetur massa. Etiam non fermentum augue, vel posuere sapien. \r\n\r\nVivamus aliquet eros bibendum ipsum euismod, non interdum dui elementum. Morbi facilisis hendrerit nisi, a volutpat velit. Donec sed malesuada felis. Nulla facilisi. Vivamus a velit vel orci euismod maximus. Praesent ut blandit orci, eget suscipit lorem. Aenean dignissim, augue at porta suscipit, est enim euismod mi, a rhoncus mi lacus ac nibh. Ut pharetra ligula sed tortor congue, pellentesque ultricies augue tincidunt.',	1,	''),
(2,	1,	'Sub Menu 2',	'Nulla dignissim gravida\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ultricies dictum ex, nec ullamcorper orci luctus eget. Integer mauris arcu, pretium eget elit vel, posuere consectetur massa. Etiam non fermentum augue, vel posuere sapien. \r\n\r\nVivamus aliquet eros bibendum ipsum euismod, non interdum dui elementum. Morbi facilisis hendrerit nisi, a volutpat velit. Donec sed malesuada felis. Nulla facilisi. Vivamus a velit vel orci euismod maximus. Praesent ut blandit orci, eget suscipit lorem. Aenean dignissim, augue at porta suscipit, est enim euismod mi, a rhoncus mi lacus ac nibh. Ut pharetra ligula sed tortor congue, pellentesque ultricies augue tincidunt.',	1,	''),
(3,	1,	'Sub Menu 3',	'Nulla dignissim gravida\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ultricies dictum ex, nec ullamcorper orci luctus eget. Integer mauris arcu, pretium eget elit vel, posuere consectetur massa. Etiam non fermentum augue, vel posuere sapien. \r\n\r\nVivamus aliquet eros bibendum ipsum euismod, non interdum dui elementum. Morbi facilisis hendrerit nisi, a volutpat velit. Donec sed malesuada felis. Nulla facilisi. Vivamus a velit vel orci euismod maximus. Praesent ut blandit orci, eget suscipit lorem. Aenean dignissim, augue at porta suscipit, est enim euismod mi, a rhoncus mi lacus ac nibh. Ut pharetra ligula sed tortor congue, pellentesque ultricies augue tincidunt.',	1,	''),
(4,	1,	'Sub Menu 4',	'Nulla dignissim gravida\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ultricies dictum ex, nec ullamcorper orci luctus eget. Integer mauris arcu, pretium eget elit vel, posuere consectetur massa. Etiam non fermentum augue, vel posuere sapien. \r\n\r\nVivamus aliquet eros bibendum ipsum euismod, non interdum dui elementum. Morbi facilisis hendrerit nisi, a volutpat velit. Donec sed malesuada felis. Nulla facilisi. Vivamus a velit vel orci euismod maximus. Praesent ut blandit orci, eget suscipit lorem. Aenean dignissim, augue at porta suscipit, est enim euismod mi, a rhoncus mi lacus ac nibh. Ut pharetra ligula sed tortor congue, pellentesque ultricies augue tincidunt.',	1,	''),
(5,	1,	'Sub Menu 5',	'Nulla dignissim gravida\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ultricies dictum ex, nec ullamcorper orci luctus eget. Integer mauris arcu, pretium eget elit vel, posuere consectetur massa. Etiam non fermentum augue, vel posuere sapien. \r\n\r\nVivamus aliquet eros bibendum ipsum euismod, non interdum dui elementum. Morbi facilisis hendrerit nisi, a volutpat velit. Donec sed malesuada felis. Nulla facilisi. Vivamus a velit vel orci euismod maximus. Praesent ut blandit orci, eget suscipit lorem. Aenean dignissim, augue at porta suscipit, est enim euismod mi, a rhoncus mi lacus ac nibh. Ut pharetra ligula sed tortor congue, pellentesque ultricies augue tincidunt.',	1,	''),
(6,	1,	'Sub Menu 6',	'Nulla dignissim gravida\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ultricies dictum ex, nec ullamcorper orci luctus eget. Integer mauris arcu, pretium eget elit vel, posuere consectetur massa. Etiam non fermentum augue, vel posuere sapien. \r\n\r\nVivamus aliquet eros bibendum ipsum euismod, non interdum dui elementum. Morbi facilisis hendrerit nisi, a volutpat velit. Donec sed malesuada felis. Nulla facilisi. Vivamus a velit vel orci euismod maximus. Praesent ut blandit orci, eget suscipit lorem. Aenean dignissim, augue at porta suscipit, est enim euismod mi, a rhoncus mi lacus ac nibh. Ut pharetra ligula sed tortor congue, pellentesque ultricies augue tincidunt.',	1,	'');

DROP TABLE IF EXISTS `xin_salary_allowances`;
CREATE TABLE `xin_salary_allowances` (
  `allowance_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `is_allowance_taxable` int NOT NULL,
  `allowance_title` varchar(200) DEFAULT NULL,
  `allowance_amount` varchar(200) DEFAULT NULL,
  `created_at` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`allowance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_salary_allowances`;
INSERT INTO `xin_salary_allowances` (`allowance_id`, `employee_id`, `is_allowance_taxable`, `allowance_title`, `allowance_amount`, `created_at`) VALUES
(1,	1,	0,	'Cost of Living Allowance',	'100',	NULL),
(2,	1,	0,	'Housing Allowance',	'200',	NULL),
(3,	1,	0,	'Market Adjustment',	'200',	NULL),
(4,	1,	0,	'Meal Allowance',	'100',	NULL),
(5,	1,	0,	'Transportation Allowance',	'200',	NULL);

DROP TABLE IF EXISTS `xin_salary_bank_allocation`;
CREATE TABLE `xin_salary_bank_allocation` (
  `bank_allocation_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `payment_method_id` int NOT NULL,
  `pay_percent` varchar(200) NOT NULL,
  `acc_number` varchar(200) NOT NULL,
  PRIMARY KEY (`bank_allocation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_salary_bank_allocation`;

DROP TABLE IF EXISTS `xin_salary_commissions`;
CREATE TABLE `xin_salary_commissions` (
  `salary_commissions_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `commission_title` varchar(200) DEFAULT NULL,
  `commission_amount` varchar(200) DEFAULT NULL,
  `created_at` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`salary_commissions_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_salary_commissions`;

DROP TABLE IF EXISTS `xin_salary_loan_deductions`;
CREATE TABLE `xin_salary_loan_deductions` (
  `loan_deduction_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `loan_options` int NOT NULL,
  `loan_deduction_title` varchar(200) NOT NULL,
  `start_date` varchar(200) NOT NULL,
  `end_date` varchar(200) NOT NULL,
  `monthly_installment` varchar(200) NOT NULL,
  `loan_time` varchar(200) NOT NULL,
  `loan_deduction_amount` varchar(200) NOT NULL,
  `total_paid` varchar(200) NOT NULL,
  `reason` text NOT NULL,
  `status` int NOT NULL,
  `is_deducted_from_salary` int NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`loan_deduction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_salary_loan_deductions`;

DROP TABLE IF EXISTS `xin_salary_other_payments`;
CREATE TABLE `xin_salary_other_payments` (
  `other_payments_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `payments_title` varchar(200) DEFAULT NULL,
  `payments_amount` varchar(200) DEFAULT NULL,
  `created_at` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`other_payments_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_salary_other_payments`;

DROP TABLE IF EXISTS `xin_salary_overtime`;
CREATE TABLE `xin_salary_overtime` (
  `salary_overtime_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `overtime_type` varchar(200) NOT NULL,
  `no_of_days` varchar(100) NOT NULL DEFAULT '0',
  `overtime_hours` varchar(100) NOT NULL DEFAULT '0',
  `overtime_rate` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`salary_overtime_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_salary_overtime`;

DROP TABLE IF EXISTS `xin_salary_payslip_allowances`;
CREATE TABLE `xin_salary_payslip_allowances` (
  `payslip_allowances_id` int NOT NULL AUTO_INCREMENT,
  `payslip_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `allowance_title` varchar(200) NOT NULL,
  `allowance_amount` varchar(200) NOT NULL,
  `salary_month` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`payslip_allowances_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_salary_payslip_allowances`;

DROP TABLE IF EXISTS `xin_salary_payslip_commissions`;
CREATE TABLE `xin_salary_payslip_commissions` (
  `payslip_commissions_id` int NOT NULL AUTO_INCREMENT,
  `payslip_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `commission_title` varchar(200) NOT NULL,
  `commission_amount` varchar(200) NOT NULL,
  `salary_month` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`payslip_commissions_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_salary_payslip_commissions`;

DROP TABLE IF EXISTS `xin_salary_payslip_loan`;
CREATE TABLE `xin_salary_payslip_loan` (
  `payslip_loan_id` int NOT NULL AUTO_INCREMENT,
  `payslip_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `loan_title` varchar(200) NOT NULL,
  `loan_amount` varchar(200) NOT NULL,
  `salary_month` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`payslip_loan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_salary_payslip_loan`;

DROP TABLE IF EXISTS `xin_salary_payslip_other_payments`;
CREATE TABLE `xin_salary_payslip_other_payments` (
  `payslip_other_payment_id` int NOT NULL AUTO_INCREMENT,
  `payslip_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `payments_title` varchar(200) NOT NULL,
  `payments_amount` varchar(200) NOT NULL,
  `salary_month` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`payslip_other_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_salary_payslip_other_payments`;

DROP TABLE IF EXISTS `xin_salary_payslip_overtime`;
CREATE TABLE `xin_salary_payslip_overtime` (
  `payslip_overtime_id` int NOT NULL AUTO_INCREMENT,
  `payslip_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `overtime_title` varchar(200) NOT NULL,
  `overtime_salary_month` varchar(200) NOT NULL,
  `overtime_no_of_days` varchar(200) NOT NULL,
  `overtime_hours` varchar(200) NOT NULL,
  `overtime_rate` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`payslip_overtime_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_salary_payslip_overtime`;

DROP TABLE IF EXISTS `xin_salary_payslip_statutory_deductions`;
CREATE TABLE `xin_salary_payslip_statutory_deductions` (
  `payslip_deduction_id` int NOT NULL AUTO_INCREMENT,
  `payslip_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `deduction_title` varchar(200) NOT NULL,
  `deduction_amount` varchar(200) NOT NULL,
  `salary_month` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`payslip_deduction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_salary_payslip_statutory_deductions`;

DROP TABLE IF EXISTS `xin_salary_payslips`;
CREATE TABLE `xin_salary_payslips` (
  `payslip_id` int NOT NULL AUTO_INCREMENT,
  `payslip_key` varchar(200) NOT NULL,
  `employee_id` int NOT NULL,
  `department_id` int NOT NULL,
  `company_id` int NOT NULL,
  `location_id` int NOT NULL,
  `designation_id` int NOT NULL,
  `salary_month` varchar(200) NOT NULL,
  `wages_type` int NOT NULL,
  `payslip_type` varchar(50) NOT NULL,
  `basic_salary` varchar(200) NOT NULL,
  `daily_wages` varchar(200) NOT NULL,
  `is_half_monthly_payroll` tinyint(1) NOT NULL,
  `hours_worked` varchar(50) NOT NULL DEFAULT '0',
  `total_allowances` varchar(200) NOT NULL,
  `total_commissions` varchar(200) NOT NULL,
  `total_statutory_deductions` varchar(200) NOT NULL,
  `total_other_payments` varchar(200) NOT NULL,
  `total_loan` varchar(200) NOT NULL,
  `total_overtime` varchar(200) NOT NULL,
  `saudi_gosi_percent` varchar(200) NOT NULL,
  `saudi_gosi_amount` varchar(200) NOT NULL,
  `statutory_deductions` varchar(200) NOT NULL,
  `net_salary` varchar(200) NOT NULL,
  `grand_net_salary` varchar(200) NOT NULL,
  `other_payment` varchar(200) NOT NULL,
  `payment_method` int NOT NULL,
  `pay_comments` mediumtext NOT NULL,
  `is_payment` int NOT NULL,
  `year_to_date` varchar(200) NOT NULL,
  `status` int NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`payslip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_salary_payslips`;
INSERT INTO `xin_salary_payslips` (`payslip_id`, `payslip_key`, `employee_id`, `department_id`, `company_id`, `location_id`, `designation_id`, `salary_month`, `wages_type`, `payslip_type`, `basic_salary`, `daily_wages`, `is_half_monthly_payroll`, `hours_worked`, `total_allowances`, `total_commissions`, `total_statutory_deductions`, `total_other_payments`, `total_loan`, `total_overtime`, `saudi_gosi_percent`, `saudi_gosi_amount`, `statutory_deductions`, `net_salary`, `grand_net_salary`, `other_payment`, `payment_method`, `pay_comments`, `is_payment`, `year_to_date`, `status`, `created_at`) VALUES
(1,	'47dNXfhSQstnamVYxelI6zbM2Oc0JBGTZRwFApPW',	5,	2,	1,	0,	10,	'2020-07',	1,	'full_monthly',	'1000',	'',	0,	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'',	'1000.00',	'',	'',	0,	'',	1,	'10-07-2020',	2,	'10-07-2020 06:04:31'),
(2,	'xrVuWCwN4DOob3qk71npt9KT2GzFSJmUlsjEhR5a',	5,	2,	1,	0,	10,	'2022-05',	1,	'full_monthly',	'1000',	'',	0,	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'',	'',	'',	'1000.00',	'',	'',	0,	'',	1,	'26-05-2022',	0,	'26-05-2022 12:33:25'),
(3,	'ZDrUEKwTVfQHnB2zd1Ggj9akNqpA4bouF6eiCXcm',	5,	2,	1,	0,	10,	'2022-06',	1,	'full_monthly',	'1000',	'',	0,	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'',	'1000.00',	'',	'',	0,	'',	1,	'22-06-2022',	0,	'22-06-2022 02:07:45'),
(5,	'EMng9avLUR5XiQ8upFz01tHDr3TOd4VbjASNyowW',	5,	2,	1,	0,	10,	'2022-07',	1,	'full_monthly',	'1000',	'',	0,	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'',	'',	'',	'1000.00',	'',	'',	0,	'',	1,	'24-07-2022',	0,	'24-07-2022 04:21:28'),
(9,	'yoY5iC7lNE8XTI1vczBDbjLxrdUJKWqwVS2hsk6P',	5,	2,	1,	0,	10,	'2022-08',	1,	'full_monthly',	'1000',	'',	0,	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'',	'',	'',	'1000.00',	'',	'',	0,	'',	1,	'14-08-2022',	0,	'14-08-2022 11:11:54'),
(10,	'N7dGFanxAP2tDTKw5eo3IWhilbvf1ky0XQrB9O6c',	5,	2,	1,	0,	10,	'2022-10',	1,	'full_monthly',	'1000',	'',	0,	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'',	'',	'',	'1000.00',	'',	'',	0,	'',	1,	'03-10-2022',	2,	'03-10-2022 06:59:30'),
(11,	'2HKNokvija3uZpg71cCFdRMTzJUXGQLDO9VyYP5b',	5,	2,	1,	0,	10,	'2022-11',	1,	'full_monthly',	'1000',	'',	0,	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'',	'',	'',	'1000.00',	'',	'',	0,	'',	1,	'18-11-2022',	0,	'18-11-2022 10:02:52'),
(12,	'AdHNwspirYRmBKy6Ee5kSD3LGIZ2J70MtvOao8WT',	5,	2,	1,	0,	10,	'2022-12',	1,	'full_monthly',	'1000',	'',	0,	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'',	'',	'',	'1000.00',	'',	'',	0,	'',	1,	'09-12-2022',	0,	'09-12-2022 11:20:29');

DROP TABLE IF EXISTS `xin_salary_statutory_deductions`;
CREATE TABLE `xin_salary_statutory_deductions` (
  `statutory_deductions_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `statutory_options` int NOT NULL,
  `deduction_title` varchar(200) DEFAULT NULL,
  `deduction_amount` varchar(200) DEFAULT NULL,
  `created_at` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`statutory_deductions_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_salary_statutory_deductions`;

DROP TABLE IF EXISTS `xin_salary_templates`;
CREATE TABLE `xin_salary_templates` (
  `salary_template_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `salary_grades` varchar(255) NOT NULL,
  `basic_salary` varchar(255) NOT NULL,
  `overtime_rate` varchar(255) NOT NULL,
  `house_rent_allowance` varchar(255) NOT NULL,
  `medical_allowance` varchar(255) NOT NULL,
  `travelling_allowance` varchar(255) NOT NULL,
  `dearness_allowance` varchar(255) NOT NULL,
  `security_deposit` varchar(255) NOT NULL,
  `provident_fund` varchar(255) NOT NULL,
  `tax_deduction` varchar(255) NOT NULL,
  `gross_salary` varchar(255) NOT NULL,
  `total_allowance` varchar(255) NOT NULL,
  `total_deduction` varchar(255) NOT NULL,
  `net_salary` varchar(255) NOT NULL,
  `added_by` int NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`salary_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_salary_templates`;
INSERT INTO `xin_salary_templates` (`salary_template_id`, `company_id`, `salary_grades`, `basic_salary`, `overtime_rate`, `house_rent_allowance`, `medical_allowance`, `travelling_allowance`, `dearness_allowance`, `security_deposit`, `provident_fund`, `tax_deduction`, `gross_salary`, `total_allowance`, `total_deduction`, `net_salary`, `added_by`, `created_at`) VALUES
(1,	1,	'Monthly',	'2500',	'',	'50',	'60',	'70',	'80',	'40',	'20',	'30',	'2760',	'260',	'90',	'2670',	1,	'22-03-2018 01:40:06');

DROP TABLE IF EXISTS `xin_security_level`;
CREATE TABLE `xin_security_level` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_security_level`;

DROP TABLE IF EXISTS `xin_sub_departments`;
CREATE TABLE `xin_sub_departments` (
  `sub_department_id` int NOT NULL AUTO_INCREMENT,
  `department_id` int NOT NULL,
  `department_name` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`sub_department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_sub_departments`;
INSERT INTO `xin_sub_departments` (`sub_department_id`, `department_id`, `department_name`, `created_at`) VALUES
(8,	1,	'Manager',	'2019-02-15 00:22:13'),
(9,	1,	'Lead Manager',	'2019-02-15 00:22:21'),
(10,	2,	'Accountant',	'2019-02-15 00:22:26');

DROP TABLE IF EXISTS `xin_support_ticket_files`;
CREATE TABLE `xin_support_ticket_files` (
  `ticket_file_id` int NOT NULL AUTO_INCREMENT,
  `ticket_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `ticket_files` varchar(255) NOT NULL,
  `file_size` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`ticket_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_support_ticket_files`;

DROP TABLE IF EXISTS `xin_support_tickets`;
CREATE TABLE `xin_support_tickets` (
  `ticket_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `ticket_code` varchar(200) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `employee_id` int NOT NULL,
  `ticket_priority` varchar(255) NOT NULL,
  `department_id` int NOT NULL,
  `assigned_to` mediumtext NOT NULL,
  `message` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `ticket_remarks` mediumtext NOT NULL,
  `ticket_status` varchar(200) NOT NULL,
  `ticket_note` mediumtext NOT NULL,
  `is_notify` int NOT NULL,
  `ticket_image` varchar(255) NOT NULL,
  `end_date` varchar(255) NOT NULL,
  `created_by` int NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_support_tickets`;
INSERT INTO `xin_support_tickets` (`ticket_id`, `company_id`, `ticket_code`, `subject`, `employee_id`, `ticket_priority`, `department_id`, `assigned_to`, `message`, `description`, `ticket_remarks`, `ticket_status`, `ticket_note`, `is_notify`, `ticket_image`, `end_date`, `created_by`, `created_at`) VALUES
(1,	1,	'4NKAUP7',	'KOMPLAIN',	0,	'3',	2,	'',	'',	'JKCBKJWDBJB M,CAA XS.KJSBCJsbcjB/HBIOWEHFAEROPVVJ \\\\VOJFVPOWF',	'',	'1',	'',	1,	'0',	'2022-07-28',	1,	'27-07-2022 02:51:18');

DROP TABLE IF EXISTS `xin_support_tickets_employees`;
CREATE TABLE `xin_support_tickets_employees` (
  `tickets_employees_id` int NOT NULL AUTO_INCREMENT,
  `ticket_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `is_notify` int NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`tickets_employees_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `xin_support_tickets_employees`;
INSERT INTO `xin_support_tickets_employees` (`tickets_employees_id`, `ticket_id`, `employee_id`, `is_notify`, `created_at`) VALUES
(1,	1,	8,	1,	'27-07-2022 02:51:18');

DROP TABLE IF EXISTS `xin_system_setting`;
CREATE TABLE `xin_system_setting` (
  `setting_id` int NOT NULL AUTO_INCREMENT,
  `application_name` varchar(255) NOT NULL,
  `default_currency` varchar(255) NOT NULL,
  `default_currency_id` int NOT NULL,
  `default_currency_symbol` varchar(255) NOT NULL,
  `show_currency` varchar(255) NOT NULL,
  `currency_position` varchar(255) NOT NULL,
  `notification_position` varchar(255) NOT NULL,
  `notification_close_btn` varchar(255) NOT NULL,
  `notification_bar` varchar(255) NOT NULL,
  `enable_registration` varchar(255) NOT NULL,
  `login_with` varchar(255) NOT NULL,
  `date_format_xi` varchar(255) NOT NULL,
  `employee_manage_own_contact` varchar(255) NOT NULL,
  `employee_manage_own_profile` varchar(255) NOT NULL,
  `employee_manage_own_qualification` varchar(255) NOT NULL,
  `employee_manage_own_work_experience` varchar(255) NOT NULL,
  `employee_manage_own_document` varchar(255) NOT NULL,
  `employee_manage_own_picture` varchar(255) NOT NULL,
  `employee_manage_own_social` varchar(255) NOT NULL,
  `employee_manage_own_bank_account` varchar(255) NOT NULL,
  `enable_attendance` varchar(255) NOT NULL,
  `enable_clock_in_btn` varchar(255) NOT NULL,
  `enable_email_notification` varchar(255) NOT NULL,
  `payroll_include_day_summary` varchar(255) NOT NULL,
  `payroll_include_hour_summary` varchar(255) NOT NULL,
  `payroll_include_leave_summary` varchar(255) NOT NULL,
  `enable_job_application_candidates` varchar(255) NOT NULL,
  `job_logo` varchar(255) NOT NULL,
  `payroll_logo` varchar(255) NOT NULL,
  `is_payslip_password_generate` int NOT NULL,
  `payslip_password_format` varchar(255) NOT NULL,
  `enable_profile_background` varchar(255) NOT NULL,
  `enable_policy_link` varchar(255) NOT NULL,
  `enable_layout` varchar(255) NOT NULL,
  `job_application_format` mediumtext NOT NULL,
  `technical_competencies` text,
  `organizational_competencies` text,
  `performance_option` varchar(255) DEFAULT NULL,
  `project_email` varchar(255) NOT NULL,
  `holiday_email` varchar(255) NOT NULL,
  `leave_email` varchar(255) NOT NULL,
  `payslip_email` varchar(255) NOT NULL,
  `award_email` varchar(255) NOT NULL,
  `recruitment_email` varchar(255) NOT NULL,
  `announcement_email` varchar(255) NOT NULL,
  `training_email` varchar(255) NOT NULL,
  `task_email` varchar(255) NOT NULL,
  `compact_sidebar` varchar(255) NOT NULL,
  `fixed_header` varchar(255) NOT NULL,
  `fixed_sidebar` varchar(255) NOT NULL,
  `boxed_wrapper` varchar(255) NOT NULL,
  `layout_static` varchar(255) NOT NULL,
  `system_skin` varchar(255) NOT NULL,
  `animation_effect` varchar(255) NOT NULL,
  `animation_effect_modal` varchar(255) NOT NULL,
  `animation_effect_topmenu` varchar(255) NOT NULL,
  `footer_text` varchar(255) NOT NULL,
  `is_ssl_available` varchar(50) NOT NULL,
  `is_active_sub_departments` varchar(10) NOT NULL,
  `default_language` varchar(200) NOT NULL,
  `statutory_fixed` varchar(100) NOT NULL,
  `system_timezone` varchar(200) NOT NULL,
  `system_ip_address` varchar(255) NOT NULL,
  `system_ip_restriction` varchar(200) NOT NULL,
  `google_maps_api_key` mediumtext NOT NULL,
  `module_recruitment` varchar(100) NOT NULL,
  `module_travel` varchar(100) NOT NULL,
  `module_performance` varchar(100) NOT NULL,
  `module_payroll` varchar(10) NOT NULL,
  `module_files` varchar(100) NOT NULL,
  `module_awards` varchar(100) NOT NULL,
  `module_training` varchar(100) NOT NULL,
  `module_inquiry` varchar(100) NOT NULL,
  `module_language` varchar(100) NOT NULL,
  `module_orgchart` varchar(100) NOT NULL,
  `module_accounting` varchar(111) NOT NULL,
  `module_events` varchar(100) NOT NULL,
  `module_goal_tracking` varchar(100) NOT NULL,
  `module_assets` varchar(100) NOT NULL,
  `module_projects_tasks` varchar(100) NOT NULL,
  `module_chat_box` varchar(100) NOT NULL,
  `enable_page_rendered` varchar(255) NOT NULL,
  `enable_current_year` varchar(255) NOT NULL,
  `employee_login_id` varchar(200) NOT NULL,
  `paypal_email` varchar(100) NOT NULL,
  `paypal_sandbox` varchar(10) NOT NULL,
  `paypal_active` varchar(10) NOT NULL,
  `stripe_secret_key` varchar(200) NOT NULL,
  `stripe_publishable_key` varchar(200) NOT NULL,
  `stripe_active` varchar(10) NOT NULL,
  `online_payment_account` int NOT NULL,
  `is_half_monthly` tinyint(1) NOT NULL,
  `half_deduct_month` tinyint(1) NOT NULL,
  `invoice_terms_condition` text,
  `estimate_terms_condition` text,
  `show_projects` int NOT NULL DEFAULT '0',
  `show_tasks` int NOT NULL DEFAULT '0',
  `enable_saudi_gosi` int NOT NULL DEFAULT '0',
  `staff_dashboard` int DEFAULT NULL,
  `project_dashboard` int DEFAULT NULL,
  `enable_auth_background` varchar(11) NOT NULL,
  `hr_version` varchar(200) NOT NULL,
  `hr_release_date` varchar(100) NOT NULL,
  `updated_at` varchar(255) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_system_setting`;
INSERT INTO `xin_system_setting` (`setting_id`, `application_name`, `default_currency`, `default_currency_id`, `default_currency_symbol`, `show_currency`, `currency_position`, `notification_position`, `notification_close_btn`, `notification_bar`, `enable_registration`, `login_with`, `date_format_xi`, `employee_manage_own_contact`, `employee_manage_own_profile`, `employee_manage_own_qualification`, `employee_manage_own_work_experience`, `employee_manage_own_document`, `employee_manage_own_picture`, `employee_manage_own_social`, `employee_manage_own_bank_account`, `enable_attendance`, `enable_clock_in_btn`, `enable_email_notification`, `payroll_include_day_summary`, `payroll_include_hour_summary`, `payroll_include_leave_summary`, `enable_job_application_candidates`, `job_logo`, `payroll_logo`, `is_payslip_password_generate`, `payslip_password_format`, `enable_profile_background`, `enable_policy_link`, `enable_layout`, `job_application_format`, `technical_competencies`, `organizational_competencies`, `performance_option`, `project_email`, `holiday_email`, `leave_email`, `payslip_email`, `award_email`, `recruitment_email`, `announcement_email`, `training_email`, `task_email`, `compact_sidebar`, `fixed_header`, `fixed_sidebar`, `boxed_wrapper`, `layout_static`, `system_skin`, `animation_effect`, `animation_effect_modal`, `animation_effect_topmenu`, `footer_text`, `is_ssl_available`, `is_active_sub_departments`, `default_language`, `statutory_fixed`, `system_timezone`, `system_ip_address`, `system_ip_restriction`, `google_maps_api_key`, `module_recruitment`, `module_travel`, `module_performance`, `module_payroll`, `module_files`, `module_awards`, `module_training`, `module_inquiry`, `module_language`, `module_orgchart`, `module_accounting`, `module_events`, `module_goal_tracking`, `module_assets`, `module_projects_tasks`, `module_chat_box`, `enable_page_rendered`, `enable_current_year`, `employee_login_id`, `paypal_email`, `paypal_sandbox`, `paypal_active`, `stripe_secret_key`, `stripe_publishable_key`, `stripe_active`, `online_payment_account`, `is_half_monthly`, `half_deduct_month`, `invoice_terms_condition`, `estimate_terms_condition`, `show_projects`, `show_tasks`, `enable_saudi_gosi`, `staff_dashboard`, `project_dashboard`, `enable_auth_background`, `hr_version`, `hr_release_date`, `updated_at`) VALUES
(1,	'PT. RUN8',	'IDR - Rp',	1,	'IDR - Rp',	'symbol',	'Prefix',	'toast-top-center',	'true',	'true',	'no',	'username',	'M-d-Y',	'yes',	'yes',	'yes',	'yes',	'yes',	'yes',	'yes',	'yes',	'yes',	'',	'yes',	'yes',	'yes',	'yes',	'1',	'job_logo_1659517420.png',	'payroll_logo_1659517427.png',	0,	'employee_id',	'yes',	'yes',	'yes',	'doc,pdf,EXCEL',	'Customer Experience,Marketing,Administration',	'Professionalism,Integrity,Attendance',	'both',	'yes',	'yes',	'yes',	'yes',	'yes',	'yes',	'yes',	'yes',	'yes',	'sidebar_layout_hrsale',	'',	'fixed-sidebar',	'boxed_layout_hrsale',	'',	'skin-default',	'fadeInDown',	'tada',	'tada',	'company',	'yes',	'yes',	'indonesian',	'',	'Asia/Jakarta',	'::1',	'',	'AIzaSyB3gP8H3eypotNeoEtezbRiF_f8Zh_p4ck',	'true',	'true',	'yes',	'yes',	'true',	'true',	'true',	'true',	'true',	'true',	'true',	'true',	'true',	'true',	'true',	'true',	'',	'yes',	'username',	'demo@gmail.com',	'yes',	'yes',	'sk_test_2XEyr1hQFGByITfQjSwFqNtm',	'pk_test_zVFISCqeQPnniD0ywHBHikMd',	'yes',	0,	0,	1,	'',	'',	0,	0,	0,	NULL,	NULL,	'yes',	'1.0.3',	'2018-03-28',	'2018-03-28 04:27:32');

DROP TABLE IF EXISTS `xin_task_categories`;
CREATE TABLE `xin_task_categories` (
  `task_category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`task_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `xin_task_categories`;
INSERT INTO `xin_task_categories` (`task_category_id`, `category_name`, `created_at`) VALUES
(5,	'Modelling',	'17-12-2019 10:44:48'),
(6,	'Fabrication drawings',	'17-12-2019 10:44:55'),
(7,	'Erection drawings',	'17-12-2019 10:45:01'),
(8,	'As built drawings',	'17-12-2019 10:45:06'),
(9,	'R & D and RFI Related',	'17-12-2019 10:45:12'),
(10,	'Checking',	'17-12-2019 10:45:22');

DROP TABLE IF EXISTS `xin_tasks`;
CREATE TABLE `xin_tasks` (
  `task_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `project_id` int NOT NULL,
  `created_by` int NOT NULL,
  `task_name` varchar(255) NOT NULL,
  `assigned_to` varchar(255) NOT NULL,
  `start_date` varchar(200) NOT NULL,
  `end_date` varchar(200) NOT NULL,
  `task_hour` varchar(200) NOT NULL,
  `task_progress` varchar(200) NOT NULL,
  `description` mediumtext NOT NULL,
  `task_status` int NOT NULL,
  `task_note` mediumtext NOT NULL,
  `is_notify` int NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_tasks`;
INSERT INTO `xin_tasks` (`task_id`, `company_id`, `project_id`, `created_by`, `task_name`, `assigned_to`, `start_date`, `end_date`, `task_hour`, `task_progress`, `description`, `task_status`, `task_note`, `is_notify`, `created_at`) VALUES
(1,	1,	1,	1,	'BUAT KOPI',	'7',	'2023-01-16',	'2023-01-18',	'24 JAM',	'0',	'DBKJFKJSKFJSFKJDSBFKJBSKJDBFKJSDBFJKSBFKSBDKFJBSKJBFKSBJKSBKD',	0,	'',	1,	'2023-01-15 03:12:24');

DROP TABLE IF EXISTS `xin_tasks_attachment`;
CREATE TABLE `xin_tasks_attachment` (
  `task_attachment_id` int NOT NULL AUTO_INCREMENT,
  `task_id` int NOT NULL,
  `upload_by` int NOT NULL,
  `file_title` varchar(255) NOT NULL,
  `file_description` mediumtext NOT NULL,
  `attachment_file` mediumtext NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`task_attachment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_tasks_attachment`;

DROP TABLE IF EXISTS `xin_tasks_comments`;
CREATE TABLE `xin_tasks_comments` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `task_id` int NOT NULL,
  `user_id` int NOT NULL,
  `task_comments` mediumtext NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_tasks_comments`;

DROP TABLE IF EXISTS `xin_tax_types`;
CREATE TABLE `xin_tax_types` (
  `tax_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `rate` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`tax_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_tax_types`;
INSERT INTO `xin_tax_types` (`tax_id`, `name`, `rate`, `type`, `description`, `created_at`) VALUES
(1,	'No Tax',	'0',	'fixed',	'test',	'25-05-2018'),
(2,	'IVU',	'2',	'fixed',	'test',	'25-05-2018'),
(3,	'VAT',	'5',	'percentage',	'testttt',	'25-05-2018');

DROP TABLE IF EXISTS `xin_termination_type`;
CREATE TABLE `xin_termination_type` (
  `termination_type_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`termination_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_termination_type`;
INSERT INTO `xin_termination_type` (`termination_type_id`, `company_id`, `type`, `created_at`) VALUES
(1,	1,	'Voluntary Termination',	'22-03-2018 01:38:41');

DROP TABLE IF EXISTS `xin_theme_settings`;
CREATE TABLE `xin_theme_settings` (
  `theme_settings_id` int NOT NULL AUTO_INCREMENT,
  `fixed_layout` varchar(200) NOT NULL,
  `fixed_footer` varchar(200) NOT NULL,
  `boxed_layout` varchar(200) NOT NULL,
  `page_header` varchar(200) NOT NULL,
  `footer_layout` varchar(200) NOT NULL,
  `statistics_cards` varchar(200) NOT NULL,
  `animation_style` varchar(100) NOT NULL,
  `theme_option` varchar(100) NOT NULL,
  `dashboard_option` varchar(100) NOT NULL,
  `dashboard_calendar` varchar(100) NOT NULL,
  `login_page_options` varchar(100) NOT NULL,
  `sub_menu_icons` varchar(100) NOT NULL,
  `statistics_cards_background` varchar(200) NOT NULL,
  `employee_cards` varchar(200) NOT NULL,
  `card_border_color` varchar(200) NOT NULL,
  `compact_menu` varchar(200) NOT NULL,
  `flipped_menu` varchar(200) NOT NULL,
  `right_side_icons` varchar(200) NOT NULL,
  `bordered_menu` varchar(200) NOT NULL,
  `form_design` varchar(200) NOT NULL,
  `is_semi_dark` int NOT NULL,
  `semi_dark_color` varchar(200) NOT NULL,
  `top_nav_dark_color` varchar(200) NOT NULL,
  `menu_color_option` varchar(200) NOT NULL,
  `export_orgchart` varchar(100) NOT NULL,
  `export_file_title` mediumtext NOT NULL,
  `org_chart_layout` varchar(200) NOT NULL,
  `org_chart_zoom` varchar(100) NOT NULL,
  `org_chart_pan` varchar(100) NOT NULL,
  `login_page_text` text NOT NULL,
  PRIMARY KEY (`theme_settings_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_theme_settings`;
INSERT INTO `xin_theme_settings` (`theme_settings_id`, `fixed_layout`, `fixed_footer`, `boxed_layout`, `page_header`, `footer_layout`, `statistics_cards`, `animation_style`, `theme_option`, `dashboard_option`, `dashboard_calendar`, `login_page_options`, `sub_menu_icons`, `statistics_cards_background`, `employee_cards`, `card_border_color`, `compact_menu`, `flipped_menu`, `right_side_icons`, `bordered_menu`, `form_design`, `is_semi_dark`, `semi_dark_color`, `top_nav_dark_color`, `menu_color_option`, `export_orgchart`, `export_file_title`, `org_chart_layout`, `org_chart_zoom`, `org_chart_pan`, `login_page_text`) VALUES
(1,	'false',	'true',	'false',	'breadcrumb-transparent',	'footer-light',	'4',	'fadeInDown',	'template_1',	'dashboard_1',	'true',	'login_page_1',	'fa-check-circle-o',	'',	'',	'',	'true',	'false',	'false',	'false',	'basic_form',	1,	'bg-primary',	'bg-blue-grey',	'menu-dark',	'true',	'PERUSAHAN',	't2b',	'true',	'true',	'SELAMAT DATANG SELAMAT MENCOBA');

DROP TABLE IF EXISTS `xin_tickets_attachment`;
CREATE TABLE `xin_tickets_attachment` (
  `ticket_attachment_id` int NOT NULL AUTO_INCREMENT,
  `ticket_id` int NOT NULL,
  `upload_by` int NOT NULL,
  `file_title` varchar(255) NOT NULL,
  `file_description` mediumtext NOT NULL,
  `attachment_file` mediumtext NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`ticket_attachment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_tickets_attachment`;

DROP TABLE IF EXISTS `xin_tickets_comments`;
CREATE TABLE `xin_tickets_comments` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `ticket_id` int NOT NULL,
  `user_id` int NOT NULL,
  `ticket_comments` mediumtext NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_tickets_comments`;

DROP TABLE IF EXISTS `xin_trainers`;
CREATE TABLE `xin_trainers` (
  `trainer_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `designation_id` int NOT NULL,
  `expertise` mediumtext NOT NULL,
  `address` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`trainer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_trainers`;

DROP TABLE IF EXISTS `xin_training`;
CREATE TABLE `xin_training` (
  `training_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `employee_id` varchar(200) NOT NULL,
  `training_type_id` int NOT NULL,
  `trainer_option` int NOT NULL,
  `trainer_id` int NOT NULL,
  `start_date` varchar(200) NOT NULL,
  `finish_date` varchar(200) NOT NULL,
  `training_cost` varchar(200) NOT NULL,
  `training_status` int NOT NULL,
  `description` mediumtext NOT NULL,
  `performance` varchar(200) NOT NULL,
  `remarks` mediumtext NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`training_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_training`;

DROP TABLE IF EXISTS `xin_training_types`;
CREATE TABLE `xin_training_types` (
  `training_type_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`training_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_training_types`;
INSERT INTO `xin_training_types` (`training_type_id`, `company_id`, `type`, `created_at`, `status`) VALUES
(1,	1,	'Job Training',	'19-03-2018 06:45:47',	1),
(2,	1,	'Workshop',	'19-03-2018 06:45:51',	1);

DROP TABLE IF EXISTS `xin_travel_arrangement_type`;
CREATE TABLE `xin_travel_arrangement_type` (
  `arrangement_type_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`arrangement_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_travel_arrangement_type`;
INSERT INTO `xin_travel_arrangement_type` (`arrangement_type_id`, `company_id`, `type`, `status`, `created_at`) VALUES
(1,	1,	'DINAS ',	1,	'19-03-2018 08:45:17'),
(2,	1,	'CUTI',	1,	'19-03-2018 08:45:27');

DROP TABLE IF EXISTS `xin_user_roles`;
CREATE TABLE `xin_user_roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `role_name` varchar(200) NOT NULL,
  `role_access` varchar(200) NOT NULL,
  `role_resources` text NOT NULL,
  `created_at` varchar(200) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_user_roles`;
INSERT INTO `xin_user_roles` (`role_id`, `company_id`, `role_name`, `role_access`, `role_resources`, `created_at`) VALUES
(1,	1,	'Super Admin',	'1',	'0,103,13,13,201,202,203,372,373,393,393,394,395,396,422,351,421,88,23,23,204,205,206,231,400,22,445,465,12,14,14,207,208,209,232,15,15,210,211,212,233,16,16,213,214,215,234,406,407,408,17,17,216,217,218,235,18,18,219,220,221,236,19,19,222,223,224,237,20,20,225,226,227,238,21,21,228,229,230,239,2,3,3,240,241,242,4,4,243,244,245,249,5,5,246,247,248,6,6,250,251,252,11,11,254,255,256,257,9,9,258,259,260,96,442,24,25,25,262,263,264,265,26,26,266,267,268,97,98,98,269,270,271,272,99,99,273,274,275,276,27,28,28,397,423,10,10,253,261,29,29,381,30,30,277,278,279,310,401,401,402,403,31,7,7,280,281,282,2822,311,8,8,283,284,285,46,46,287,288,289,290,48,49,49,291,292,293,50,51,51,294,295,387,52,296,32,36,36,313,314,404,405,40,41,41,298,299,300,301,42,42,302,303,304,305,43,43,306,307,308,309,104,44,44,315,316,317,318,312,90,91,94,424,425,45,45,319,320,321,322,122,122,331,332,333,106,107,107,334,335,336,108,108,338,339,340,47,53,54,54,341,342,343,344,55,55,345,346,347,56,56,348,349,350,57,60,61,62,63,93,118,297,431,432,433,434,435,436,437,438,439,440,441,447,448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,464,71,286,72,72,352,353,354,73,74,75,75,355,356,357,76,76,358,359,360,77,77,361,362,363,78,37,37,391,79,80,80,364,365,366,81,81,367,368,369,82,83,84,85,86,87,119,119,323,324,325,326,410,411,412,413,414,420,415,416,417,418,419,121,121,120,328,329,330,426,427,428,429,430,89,89,370,371,95,92,443,444,446,110,111,112,113,114,115,116,117,409',	'28-02-2018'),
(2,	1,	'Employee',	'2',	'0,445,465,14,207,208,15,210,211,16,213,214,17,216,217,19,222,223,224,20,225,226,227,11,254,255,9,258,259,25,262,263,97,98,98,269,270,271,272,99,99,273,274,275,276,28,10,261,29,401,402,8,283,46,46,287,288,289,290,50,43,306,307,44,315,316,317,312,90,91,94,424,425,45,319,320,321,106,107,107,334,335,336,108,108,338,339,340,47,54,341,342,343,55,55,345,346,347,75,355,356,76,358,359,37,95,92,446',	'21-03-2018');

DROP TABLE IF EXISTS `xin_users`;
CREATE TABLE `xin_users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_role` varchar(30) NOT NULL DEFAULT 'administrator',
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_logo` varchar(255) NOT NULL,
  `user_type` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_photo` varchar(255) NOT NULL,
  `profile_background` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `address_1` text NOT NULL,
  `address_2` text NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `country` int NOT NULL,
  `last_login_date` varchar(255) NOT NULL,
  `last_login_ip` varchar(255) NOT NULL,
  `is_logged_in` int NOT NULL,
  `is_active` int NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_users`;
INSERT INTO `xin_users` (`user_id`, `user_role`, `first_name`, `last_name`, `company_name`, `company_logo`, `user_type`, `email`, `username`, `password`, `profile_photo`, `profile_background`, `contact_number`, `gender`, `address_1`, `address_2`, `city`, `state`, `zipcode`, `country`, `last_login_date`, `last_login_ip`, `is_logged_in`, `is_active`, `created_at`) VALUES
(1,	'administrator',	'Thomas',	'Fleming',	'PT. Internusa Bakti Nusantara',	'',	2,	'test1@test.com',	'admin',	'test123',	'user_1520720863.jpg',	'profile_background_1505458640.jpg',	'12333332',	'Male',	'Address Line 1',	'Address Line 2',	'City',	'State',	'12345',	230,	'15-04-2018 07:36:12',	'::1',	0,	1,	'14-09-2017 10:02:54'),
(2,	'administrator',	'Main',	'Office',	'ID Express',	'',	2,	'test@test.com',	'test',	'test123',	'user_1523821315.jpg',	'',	'1234567890',	'Male',	'Address Line 1',	'Address Line 2',	'City',	'State',	'11461',	190,	'23-04-2018 05:34:47',	'::1',	0,	1,	'15-04-2018 06:13:08'),
(4,	'administrator',	'Fiona',	'Grace',	'HRSALE',	'employer_1524025572.jpg',	1,	'employer@test.com',	'',	'test123',	'',	'',	'1234567890',	'Male',	'Address Line 1',	'Address Line 2',	'City',	'State',	'11461',	190,	'23-04-2018 05:34:54',	'::1',	0,	1,	'18-04-2018 07:26:12');

DROP TABLE IF EXISTS `xin_warning_type`;
CREATE TABLE `xin_warning_type` (
  `warning_type_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`warning_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

TRUNCATE `xin_warning_type`;
INSERT INTO `xin_warning_type` (`warning_type_id`, `company_id`, `type`, `created_at`) VALUES
(1,	1,	'SP 1',	'22-03-2018 01:38:02');

-- 2023-01-16 04:28:06
