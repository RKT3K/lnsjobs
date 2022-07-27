-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 02, 2021 at 11:33 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `joblab`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `email_verified_at`, `image`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin@site.com', 'admin', NULL, '5ff1c3531ed3f1609679699.jpg', '$2y$10$2qcOUKrDIUqyyCklvHp7IO8fGNcJ1gAXtxouTn1isZPHu6H8CfHPq', NULL, '2021-05-07 07:54:06');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `employer_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_status` tinyint(1) NOT NULL DEFAULT 0,
  `click_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Enable : 1, Disable : 2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Enable : 1, Disable : 2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `employer_id` int(10) UNSIGNED NOT NULL,
  `method_code` int(10) UNSIGNED NOT NULL,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `method_currency` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `final_amo` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_amo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_wallet` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `try` int(10) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel',
  `from_api` tinyint(1) NOT NULL DEFAULT 0,
  `admin_feedback` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `educational_qualifications`
--

CREATE TABLE `educational_qualifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `level_of_education_id` int(11) NOT NULL,
  `institute` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passing_year` int(11) NOT NULL,
  `degree_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_logs`
--

CREATE TABLE `email_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `employer_id` int(11) DEFAULT NULL,
  `mail_sender` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_to` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_sms_templates`
--

CREATE TABLE `email_sms_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subj` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shortcodes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_status` tinyint(1) NOT NULL DEFAULT 1,
  `sms_status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_sms_templates`
--

INSERT INTO `email_sms_templates` (`id`, `act`, `name`, `subj`, `email_body`, `sms_body`, `shortcodes`, `email_status`, `sms_status`, `created_at`, `updated_at`) VALUES
(1, 'PASS_RESET_CODE', 'Password Reset', 'Password Reset', '<div>We have received a request to reset the password for your account on <b>{{time}} .<br></b></div><div>Requested From IP: <b>{{ip}}</b> using <b>{{browser}}</b> on <b>{{operating_system}} </b>.</div><div><br></div><br><div><div><div>Your account recovery code is:&nbsp;&nbsp; <font size=\"6\"><b>{{code}}</b></font></div><div><br></div></div></div><div><br></div><div><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><br>', 'Your account recovery code is: {{code}}', ' {\"code\":\"Password Reset Code\",\"ip\":\"IP of User\",\"browser\":\"Browser of User\",\"operating_system\":\"Operating System of User\",\"time\":\"Request Time\"}', 1, 1, '2019-09-24 23:04:05', '2021-01-06 00:49:06'),
(2, 'PASS_RESET_DONE', 'Password Reset Confirmation', 'You have Reset your password', '<div><p>\r\n    You have successfully reset your password.</p><p>You changed from&nbsp; IP: <b>{{ip}}</b> using <b>{{browser}}</b> on <b>{{operating_system}}&nbsp;</b> on <b>{{time}}</b></p><p><b><br></b></p><p><font color=\"#FF0000\"><b>If you did not changed that, Please contact with us as soon as possible.</b></font><br></p></div>', 'Your password has been changed successfully', '{\"ip\":\"IP of User\",\"browser\":\"Browser of User\",\"operating_system\":\"Operating System of User\",\"time\":\"Request Time\"}', 1, 1, '2019-09-24 23:04:05', '2020-03-07 10:23:47'),
(3, 'EVER_CODE', 'Email Verification', 'Please verify your email address', '<div><br></div><div>Thanks For join with us. <br></div><div>Please use below code to verify your email address.<br></div><div><br></div><div>Your email verification code is:<font size=\"6\"><b> {{code}}</b></font></div>', 'Your email verification code is: {{code}}', '{\"code\":\"Verification code\"}', 1, 1, '2019-09-24 23:04:05', '2021-01-03 23:35:10'),
(4, 'SVER_CODE', 'SMS Verification ', 'Please verify your phone', 'Your phone verification code is: {{code}}', 'Your phone verification code is: {{code}}', '{\"code\":\"Verification code\"}', 0, 1, '2019-09-24 23:04:05', '2020-03-08 01:28:52'),
(5, '2FA_ENABLE', 'Google Two Factor - Enable', 'Google Two Factor Authentication is now  Enabled for Your Account', '<div>You just enabled Google Two Factor Authentication for Your Account.</div><div><br></div><div>Enabled at <b>{{time}} </b>From IP: <b>{{ip}}</b> using <b>{{browser}}</b> on <b>{{operating_system}} </b>.</div>', 'Your verification code is: {{code}}', '{\"ip\":\"IP of User\",\"browser\":\"Browser of User\",\"operating_system\":\"Operating System of User\",\"time\":\"Request Time\"}', 1, 1, '2019-09-24 23:04:05', '2020-03-08 01:42:59'),
(6, '2FA_DISABLE', 'Google Two Factor Disable', 'Google Two Factor Authentication is now  Disabled for Your Account', '<div>You just Disabled Google Two Factor Authentication for Your Account.</div><div><br></div><div>Disabled at <b>{{time}} </b>From IP: <b>{{ip}}</b> using <b>{{browser}}</b> on <b>{{operating_system}} </b>.</div>', 'Google two factor verification is disabled', '{\"ip\":\"IP of User\",\"browser\":\"Browser of User\",\"operating_system\":\"Operating System of User\",\"time\":\"Request Time\"}', 1, 1, '2019-09-24 23:04:05', '2020-03-08 01:43:46'),
(16, 'ADMIN_SUPPORT_REPLY', 'Support Ticket Reply ', 'Reply Support Ticket', '<div><p><span style=\"font-size: 11pt;\" data-mce-style=\"font-size: 11pt;\"><strong>A member from our support team has replied to the following ticket:</strong></span></p><p><b><span style=\"font-size: 11pt;\" data-mce-style=\"font-size: 11pt;\"><strong><br></strong></span></b></p><p><b>[Ticket#{{ticket_id}}] {{ticket_subject}}<br><br>Click here to reply:&nbsp; {{link}}</b></p><p>----------------------------------------------</p><p>Here is the reply : <br></p><p> {{reply}}<br></p></div><div><br></div>', '{{subject}}\r\n\r\n{{reply}}\r\n\r\n\r\nClick here to reply:  {{link}}', '{\"ticket_id\":\"Support Ticket ID\", \"ticket_subject\":\"Subject Of Support Ticket\", \"reply\":\"Reply from Staff/Admin\",\"link\":\"Ticket URL For relpy\"}', 1, 1, '2020-06-08 18:00:00', '2020-05-04 02:24:40'),
(206, 'DEPOSIT_COMPLETE', 'Automated Deposit - Successful', 'Deposit Completed Successfully', '<div>Your deposit of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} </b>has been completed Successfully.<b><br></b></div><div><b><br></b></div><div><b>Details of your Deposit :<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#000000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}} <br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><font size=\"5\"><b><br></b></font></div><div><font size=\"5\">Your current Balance is <b>{{post_balance}} {{currency}}</b></font></div><div><br></div><div><br><br><br></div>', '{{amount}} {{currrency}} Deposit successfully by {{gateway_name}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\", \"post_balance\":\"Users Balance After this operation\"}', 1, 1, '2020-06-24 18:00:00', '2020-11-17 03:10:00'),
(207, 'DEPOSIT_REQUEST', 'Manual Deposit - User Requested', 'Deposit Request Submitted Successfully', '<div>Your deposit request of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} </b>submitted successfully<b> .<br></b></div><div><b><br></b></div><div><b>Details of your Deposit :<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}} <br></div><div>Pay via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><br></div>', '{{amount}} Deposit requested by {{method}}. Charge: {{charge}} . Trx: {{trx}}\r\n', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\"}', 1, 1, '2020-05-31 18:00:00', '2020-06-01 18:00:00'),
(208, 'DEPOSIT_APPROVE', 'Manual Deposit - Admin Approved', 'Your Deposit is Approved', '<div>Your deposit request of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} </b>is Approved .<b><br></b></div><div><b><br></b></div><div><b>Details of your Deposit :<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}} <br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><font size=\"5\"><b><br></b></font></div><div><font size=\"5\">Your current Balance is <b>{{post_balance}} {{currency}}</b></font></div><div><br></div><div><br><br></div>', 'Admin Approve Your {{amount}} {{gateway_currency}} payment request by {{gateway_name}} transaction : {{transaction}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\", \"post_balance\":\"Users Balance After this operation\"}', 1, 1, '2020-06-16 18:00:00', '2020-06-14 18:00:00'),
(209, 'DEPOSIT_REJECT', 'Manual Deposit - Admin Rejected', 'Your Deposit Request is Rejected', '<div>Your deposit request of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} has been rejected</b>.<b><br></b></div><br><div>Transaction Number was : {{trx}}</div><div><br></div><div>if you have any query, feel free to contact us.<br></div><br><div><br><br></div>\r\n\r\n\r\n\r\n{{rejection_message}}', 'Admin Rejected Your {{amount}} {{gateway_currency}} payment request by {{gateway_name}}\r\n\r\n{{rejection_message}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\",\"rejection_message\":\"Rejection message\"}', 1, 1, '2020-06-09 18:00:00', '2020-06-14 18:00:00'),
(210, 'WITHDRAW_REQUEST', 'Withdraw  - User Requested', 'Withdraw Request Submitted Successfully', '<div>Your withdraw request of <b>{{amount}} {{currency}}</b>&nbsp; via&nbsp; <b>{{method_name}} </b>has been submitted Successfully.<b><br></b></div><div><b><br></b></div><div><b>Details of your withdraw:<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>You will get: {{method_amount}} {{method_currency}} <br></div><div>Via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><font size=\"4\" color=\"#FF0000\"><b><br></b></font></div><div><font size=\"4\" color=\"#FF0000\"><b>This may take {{delay}} to process the payment.</b></font><br></div><div><font size=\"5\"><b><br></b></font></div><div><font size=\"5\"><b><br></b></font></div><div><font size=\"5\">Your current Balance is <b>{{post_balance}} {{currency}}</b></font></div><div><br></div><div><br><br><br><br></div>', '{{amount}} {{currency}} withdraw requested by {{method_name}}. You will get {{method_amount}} {{method_currency}} in {{delay}}. Trx: {{trx}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\", \"post_balance\":\"Users Balance After this operation\", \"delay\":\"Delay time for processing\"}', 1, 1, '2020-06-07 18:00:00', '2021-05-08 06:49:06'),
(211, 'WITHDRAW_REJECT', 'Withdraw - Admin Rejected', 'Withdraw Request has been Rejected and your money is refunded to your account', '<div>Your withdraw request of <b>{{amount}} {{currency}}</b>&nbsp; via&nbsp; <b>{{method_name}} </b>has been Rejected.<b><br></b></div><div><b><br></b></div><div><b>Details of your withdraw:<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>You should get: {{method_amount}} {{method_currency}} <br></div><div>Via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><br></div><div>----</div><div><font size=\"3\"><br></font></div><div><font size=\"3\"> {{amount}} {{currency}} has been <b>refunded </b>to your account and your current Balance is <b>{{post_balance}}</b><b> {{currency}}</b></font></div><div><br></div><div>-----</div><div><br></div><div><font size=\"4\">Details of Rejection :</font></div><div><font size=\"4\"><b>{{admin_details}}</b></font></div><div><br></div><div><br><br><br><br><br><br></div>', 'Admin Rejected Your {{amount}} {{currency}} withdraw request. Your Main Balance {{main_balance}}  {{method}} , Transaction {{transaction}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\", \"post_balance\":\"Users Balance After this operation\", \"admin_details\":\"Details Provided By Admin\"}', 1, 1, '2020-06-09 18:00:00', '2020-06-14 18:00:00'),
(212, 'WITHDRAW_APPROVE', 'Withdraw - Admin  Approved', 'Withdraw Request has been Processed and your money is sent', '<div>Your withdraw request of <b>{{amount}} {{currency}}</b>&nbsp; via&nbsp; <b>{{method_name}} </b>has been Processed Successfully.<b><br></b></div><div><b><br></b></div><div><b>Details of your withdraw:<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>You will get: {{method_amount}} {{method_currency}} <br></div><div>Via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div>-----</div><div><br></div><div><font size=\"4\">Details of Processed Payment :</font></div><div><font size=\"4\"><b>{{admin_details}}</b></font></div><div><br></div><div><br><br><br><br><br></div>', 'Admin Approve Your {{amount}} {{currency}} withdraw request by {{method}}. Transaction {{transaction}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\", \"admin_details\":\"Details Provided By Admin\"}', 1, 1, '2020-06-10 18:00:00', '2020-06-06 18:00:00'),
(215, 'BAL_ADD', 'Balance Add by Admin', 'Your Account has been Credited', '<div>{{amount}} {{currency}} has been added to your account .</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div>Your Current Balance is : <font size=\"3\"><b>{{post_balance}}&nbsp; {{currency}}&nbsp;</b></font>', '{{amount}} {{currency}} credited in your account. Your Current Balance {{remaining_balance}} {{currency}} . Transaction: #{{trx}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By Admin\",\"currency\":\"Site Currency\", \"post_balance\":\"Users Balance After this operation\"}', 1, 1, '2019-09-14 19:14:22', '2021-01-06 00:46:18'),
(216, 'BAL_SUB', 'Balance Subtracted by Admin', 'Your Account has been Debited', '<div>{{amount}} {{currency}} has been subtracted from your account .</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div>Your Current Balance is : <font size=\"3\"><b>{{post_balance}}&nbsp; {{currency}}</b></font>', '{{amount}} {{currency}} debited from your account. Your Current Balance {{remaining_balance}} {{currency}} . Transaction: #{{trx}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By Admin\",\"currency\":\"Site Currency\", \"post_balance\":\"Users Balance After this operation\"}', 1, 1, '2019-09-14 19:14:22', '2019-11-10 09:07:12'),
(217, 'JOB_APPLICATION_RECIVED', 'Job application recived', 'Job application recived', '<div>{{company_name}} {{job_title}} has been subtracted from your account ', '<div>{{company_name}} {{job_title}} has been subtracted from your account ', '{\"company_name\":\"Company Name\",\"job_title\":\"Job Title\"}', 1, 1, NULL, NULL),
(218, 'JOB_APPLICATION_CANCELLED', 'Job applicatioin canceled', 'Job application canceled', '<div>{{company_name}} {{job_title}} has been subtracted from your account ', '{{company_name}} {{job_title}} ', '{\"company_name\":\"Company Name\",\"job_title\":\"Job Title\"}', 1, 1, NULL, NULL),
(219, 'PLAN_EXPIRED', 'Plan Expired', 'plan expired', '<div>{{plan_name}} {{order_number}} has been subtracted from your account ', '{{plan_name}} {{order_number}} ', '{\"plan_name\":\"Plan Name\",\"order_number\":\"Order Number\"}', 1, 1, NULL, NULL),
(220, 'JOB_LIMIT_OVER', 'Job limit over', 'job limit over', '<div>{{plan_name}} {{order_number}} has been subtracted from your account ', '{{plan_name}} {{order_number}} ', '{\"plan_name\":\"Plan Name\",\"order_number\":\"Order Number\"}', 1, 1, NULL, NULL),
(221, 'CONTACT_WITH_COMPANY', 'Contact with compnay', 'Contact with compnay', NULL, NULL, '{\"name\" : \"Candidate Name\",\"email\": \"Candidate Email\", \"message\": \"Message\"}', 1, 1, NULL, NULL),
(222, 'CONTACT_WITH_CANDIDATE', 'Contact with candidate', 'Contact with candiate', NULL, NULL, '{\"name\" : \"Employer Name\",\"email\": \"Employer  Email\", \"message\": \"Message\"}', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employers`
--

CREATE TABLE `employers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `industry_id` int(11) DEFAULT NULL,
  `number_of_employees_id` int(11) DEFAULT NULL,
  `company_name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ceo_name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `country_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `socialMedia` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_post_count` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'banned : 0, active : 1',
  `ev` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Email Unverified : 0, Email Verified : 1',
  `sv` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'SMS Unverified : 0, SMS Verified : 1',
  `ver_code` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Stores verification Code',
  `ver_code_send_at` datetime NOT NULL COMMENT 'Verification send time',
  `ts` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0: 2fa off, 1: 2fa on',
  `tv` tinyint(4) NOT NULL DEFAULT 1 COMMENT '2fa unverified : 0 , 2fa verified : 1',
  `tsc` tinyint(4) DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employer_password_resets`
--

CREATE TABLE `employer_password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employment_histories`
--

CREATE TABLE `employment_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `currently_work` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'yes : 1',
  `responsibilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_or_degrees`
--

CREATE TABLE `exam_or_degrees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Enable : 1, Disable : 2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `extensions`
--

CREATE TABLE `extensions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `script` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shortcode` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'object',
  `support` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'help section',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extensions`
--

INSERT INTO `extensions` (`id`, `act`, `name`, `description`, `image`, `script`, `shortcode`, `support`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'tawk-chat', 'Tawk.to', 'Key location is shown bellow', 'tawky_big.png', '<script>\r\n                        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n                        (function(){\r\n                        var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\n                        s1.async=true;\r\n                        s1.src=\"https://embed.tawk.to/{{app_key}}\";\r\n                        s1.charset=\"UTF-8\";\r\n                        s1.setAttribute(\"crossorigin\",\"*\");\r\n                        s0.parentNode.insertBefore(s1,s0);\r\n                        })();\r\n                    </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'twak.png', 0, NULL, '2019-10-18 23:16:05', '2021-05-18 05:37:12'),
(2, 'google-recaptcha2', 'Google Recaptcha 2', 'Key location is shown bellow', 'recaptcha3.png', '\r\n<script src=\"https://www.google.com/recaptcha/api.js\"></script>\r\n<div class=\"g-recaptcha\" data-sitekey=\"{{sitekey}}\" data-callback=\"verifyCaptcha\"></div>\r\n<div id=\"g-recaptcha-error\"></div>', '{\"sitekey\":{\"title\":\"Site Key\",\"value\":\"-----\"}}', 'recaptcha.png', 0, NULL, '2019-10-18 23:16:05', '2021-09-02 02:46:20'),
(3, 'custom-captcha', 'Custom Captcha', 'Just Put Any Random String', 'customcaptcha.png', NULL, '{\"random_key\":{\"title\":\"Random String\",\"value\":\"SecureString\"}}', 'na', 1, NULL, '2019-10-18 23:16:05', '2021-08-24 09:14:26'),
(4, 'google-analytics', 'Google Analytics', 'Key location is shown bellow', 'google_analytics.png', '<script async src=\"https://www.googletagmanager.com/gtag/js?id={{app_key}}\"></script>\r\n                <script>\r\n                  window.dataLayer = window.dataLayer || [];\r\n                  function gtag(){dataLayer.push(arguments);}\r\n                  gtag(\"js\", new Date());\r\n                \r\n                  gtag(\"config\", \"{{app_key}}\");\r\n                </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'ganalytics.png', 0, NULL, NULL, '2021-05-04 10:19:12'),
(5, 'fb-comment', 'Facebook Comment ', 'Key location is shown bellow', 'Facebook.png', '<div id=\"fb-root\"></div><script async defer crossorigin=\"anonymous\" src=\"https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v4.0&appId={{app_key}}&autoLogAppEvents=1\"></script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"----\"}}', 'fb_com.PNG', 0, NULL, NULL, '2021-05-12 05:16:54');

-- --------------------------------------------------------

--
-- Table structure for table `favorite_items`
--

CREATE TABLE `favorite_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `frontends`
--

CREATE TABLE `frontends` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data_keys` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_values` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontends`
--

INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `created_at`, `updated_at`) VALUES
(1, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"JobLab\",\"Job post platform\",\"job search platform\",\"employe hire platform\"],\"description\":\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit\",\"social_title\":\"JobLab - Job Portal Platform\",\"social_description\":\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit ff\",\"image\":\"613090dc406451630572764.png\"}', '2020-07-04 23:42:52', '2021-09-02 02:52:44'),
(24, 'about.content', '{\"has_image\":\"1\",\"heading\":\"Latest News\",\"sub_heading\":\"Register New Account\",\"description\":\"fdg sdfgsdf g ggg\",\"about_icon\":\"<i class=\\\"las la-address-card\\\"><\\/i>\",\"background_image\":\"60951a84abd141620384388.png\",\"about_image\":\"5f9914e907ace1603867881.jpg\"}', '2020-10-28 00:51:20', '2021-05-07 10:16:28'),
(25, 'blog.content', '{\"heading\":\"Latest News\",\"sub_heading\":\"Hic tenetur nihil ex. Doloremque ipsa velit, ea molestias expedita sed voluptatem ex voluptatibus temporibus sequi. sddd\"}', '2020-10-28 00:51:34', '2020-10-28 00:52:52'),
(26, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Deleniti, animi est ipsum excepturi ab modi minus.\",\"description_nic\":\"<p class=\\\"mt-4\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(86,86,86);font-family:Roboto, sans-serif;font-size:16px;background-color:rgb(250,250,251);\\\">dolor sit amet consectetur adipisicing elit. Consequatur incidunt beatae culpa temporibus officiis quidem! Illo inventore quam vitae unde, non ab porro quibusdam beatae nam. Error, in! Quidem ipsa nemo, quisquam et commodi reiciendis adipisci ipsum unde labore eveniet quasi exercitationem ducimus quas vel aut sapiente delectus ea eos quaerat ratione! Harum aliquam ea voluptates ipsam, consectetur doloribus totam illo expedita aut, iusto illum nesciunt odio eius impedit sequi tempore inventore? Similique qui, itaque autem provident earum nam dolore esse perferendis, consequatur architecto doloremque maiores? Vitae omnis consequuntur aliquam animi excepturi quae doloremque numquam suscipit nesciunt, dicta maiores sit.<\\/p><p class=\\\"mt-4\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(86,86,86);font-family:Roboto, sans-serif;font-size:16px;background-color:rgb(250,250,251);\\\">dolor sit amet consectetur adipisicing elit. Consequatur incidunt beatae culpa temporibus officiis quidem! Illo inventore quam vitae unde, non ab porro quibusdam beatae nam. Error, in! Quidem ipsa nemo, quisquam et commodi reiciendis adipisci ipsum unde labore eveniet quasi exercitationem ducimus quas vel aut sapiente delectus ea eos quaerat ratione! Harum aliquam ea voluptates ipsam, consectetur doloribus totam illo expedita aut, iusto illum nesciunt odio eius impedit sequi tempore inventore? Similique qui, itaque autem provident earum nam dolore esse perferendis, consequatur architecto doloremque maiores? Vitae omnis consequuntur aliquam animi excepturi quae doloremque numquam suscipit nesciunt, dicta maiores sit.<\\/p><p class=\\\"mt-4\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(86,86,86);font-family:Roboto, sans-serif;font-size:16px;background-color:rgb(250,250,251);\\\">dolor sit amet consectetur adipisicing elit. Consequatur incidunt beatae culpa temporibus officiis quidem! Illo inventore quam vitae unde, non ab porro quibusdam beatae nam. Error, in! Quidem ipsa nemo, quisquam et commodi reiciendis adipisci ipsum unde labore eveniet quasi exercitationem ducimus quas vel aut sapiente delectus ea eos quaerat ratione! Harum aliquam ea voluptates ipsam, consectetur doloribus totam illo expedita aut, iusto illum nesciunt odio eius impedit sequi tempore inventore? Similique qui, itaque autem provident earum nam dolore esse perferendis, consequatur architecto doloremque maiores? Vitae omnis consequuntur aliquam animi excepturi quae doloremque numquam suscipit nesciunt, dicta maiores sit.<\\/p><blockquote style=\\\"margin-top:1.25rem;margin-bottom:1.25rem;background-color:rgb(22,199,154);padding:1.875rem;color:rgb(255,255,255);font-size:1.125rem;font-style:italic;font-family:Roboto, sans-serif;\\\"><p style=\\\"margin-right:0px;margin-left:0px;\\\">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Perferendis veniam ratione aspernatur quos aut, itaque id, ut suscipit corporis incidunt distinctio in. Non voluptas corporis, nostrum optio id vero consequuntur iusto illum nesciunt odio eius impedit sequi.<\\/p><\\/blockquote><p class=\\\"mt-4\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(86,86,86);font-family:Roboto, sans-serif;font-size:16px;background-color:rgb(250,250,251);\\\">dolor sit amet consectetur adipisicing elit. Consequatur incidunt beatae culpa temporibus officiis quidem! Illo inventore quam vitae unde, non ab porro quibusdam beatae nam. Error, in! Quidem ipsa nemo, quisquam et commodi reiciendis adipisci ipsum unde labore eveniet quasi exercitationem ducimus quas vel aut sapiente delectus ea eos quaerat ratione! Harum aliquam ea voluptates ipsam, consectetur doloribus totam illo expedita aut, iusto illum nesciunt odio eius impedit sequi tempore inventore? Similique qui, itaque autem provident earum nam dolore esse perferendis, consequatur architecto doloremque maiores? Vitae omnis consequuntur aliquam animi excepturi quae doloremque numquam suscipit nesciunt, dicta maiores sit.<\\/p>\",\"blog_image\":\"610fa3bc09c071628414908.jpg\"}', '2020-10-28 00:57:19', '2021-08-08 08:58:28'),
(27, 'contact_us.content', '{\"title\":\"Auctor gravida vestibulu\",\"email_address\":\"demo@gmail.com\",\"contact_details\":\"Shyamoli Ring Road, Bangladesh\",\"contact_number\":\"123 455554544\",\"latitude\":\"34\",\"longitude\":\"43\"}', '2020-10-28 00:59:19', '2021-08-26 06:13:27'),
(28, 'counter.content', '{\"heading\":\"Latest News\",\"sub_heading\":\"Register New Account\"}', '2020-10-28 01:04:02', '2020-10-28 01:04:02'),
(30, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Suscipit nemo modi recusandae culpa iure voluptatum fugit.\",\"description_nic\":\"<p class=\\\"mt-4\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(86,86,86);font-family:Roboto, sans-serif;font-size:16px;background-color:rgb(250,250,251);\\\">Dolor sit amet consectetur adipisicing elit. Consequatur incidunt beatae culpa temporibus officiis quidem! Illo inventore quam vitae unde, non ab porro quibusdam beatae nam. Error, in! Quidem ipsa nemo, quisquam et commodi reiciendis adipisci ipsum unde labore eveniet quasi exercitationem ducimus quas vel aut sapiente delectus ea eos quaerat ratione! Harum aliquam ea voluptates ipsam, consectetur doloribus totam illo expedita aut, iusto illum nesciunt odio eius impedit sequi tempore inventore? Similique qui, itaque autem provident earum nam dolore esse perferendis, consequatur architecto doloremque maiores? Vitae omnis consequuntur aliquam animi excepturi quae doloremque numquam suscipit nesciunt, dicta maiores sit.<\\/p><p class=\\\"mt-4\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(86,86,86);font-family:Roboto, sans-serif;font-size:16px;background-color:rgb(250,250,251);\\\">Dolor sit amet consectetur adipisicing elit. Consequatur incidunt beatae culpa temporibus officiis quidem! Illo inventore quam vitae unde, non ab porro quibusdam beatae nam. Error, in! Quidem ipsa nemo, quisquam et commodi reiciendis adipisci ipsum unde labore eveniet quasi exercitationem ducimus quas vel aut sapiente delectus ea eos quaerat ratione! Harum aliquam ea voluptates ipsam, consectetur doloribus totam illo expedita aut, iusto illum nesciunt odio eius impedit sequi tempore inventore? Similique qui, itaque autem provident earum nam dolore esse perferendis, consequatur architecto doloremque maiores? Vitae omnis consequuntur aliquam animi excepturi quae doloremque numquam suscipit nesciunt, dicta maiores sit.<\\/p><p class=\\\"mt-4\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(86,86,86);font-family:Roboto, sans-serif;font-size:16px;background-color:rgb(250,250,251);\\\">Dolor sit amet consectetur adipisicing elit. Consequatur incidunt beatae culpa temporibus officiis quidem! Illo inventore quam vitae unde, non ab porro quibusdam beatae nam. Error, in! Quidem ipsa nemo, quisquam et commodi reiciendis adipisci ipsum unde labore eveniet quasi exercitationem ducimus quas vel aut sapiente delectus ea eos quaerat ratione! Harum aliquam ea voluptates ipsam, consectetur doloribus totam illo expedita aut, iusto illum nesciunt odio eius impedit sequi tempore inventore? Similique qui, itaque autem provident earum nam dolore esse perferendis, consequatur architecto doloremque maiores? Vitae omnis consequuntur aliquam animi excepturi quae doloremque numquam suscipit nesciunt, dicta maiores sit.<\\/p><blockquote style=\\\"margin-top:1.25rem;margin-bottom:1.25rem;background-color:rgb(22,199,154);padding:1.875rem;color:rgb(255,255,255);font-size:1.125rem;font-style:italic;font-family:Roboto, sans-serif;\\\"><p style=\\\"margin-right:0px;margin-left:0px;\\\">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Perferendis veniam ratione aspernatur quos aut, itaque id, ut suscipit corporis incidunt distinctio in. Non voluptas corporis, nostrum optio id vero consequuntur iusto illum nesciunt odio eius impedit sequi.<\\/p><\\/blockquote><p class=\\\"mt-4\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(86,86,86);font-family:Roboto, sans-serif;font-size:16px;background-color:rgb(250,250,251);\\\">Dolor sit amet consectetur adipisicing elit. Consequatur incidunt beatae culpa temporibus officiis quidem! Illo inventore quam vitae unde, non ab porro quibusdam beatae nam. Error, in! Quidem ipsa nemo, quisquam et commodi reiciendis adipisci ipsum unde labore eveniet quasi exercitationem ducimus quas vel aut sapiente delectus ea eos quaerat ratione! Harum aliquam ea voluptates ipsam, consectetur doloribus totam illo expedita aut, iusto illum nesciunt odio eius impedit sequi tempore inventore? Similique qui, itaque autem provident earum nam dolore esse perferendis, consequatur architecto doloremque maiores? Vitae omn<\\/p>\",\"blog_image\":\"610fa400b3e331628414976.jpg\"}', '2020-10-31 00:39:05', '2021-08-08 08:59:36'),
(31, 'social_icon.element', '{\"title\":\"Facebook\",\"social_icon\":\"<i class=\\\"lab la-facebook-f\\\"><\\/i>\",\"url\":\"https:\\/\\/www.google.com\\/\"}', '2020-11-12 04:07:30', '2021-08-08 08:35:47'),
(33, 'feature.content', '{\"has_image\":\"1\",\"heading\":\"How Joblab help you to build your carrer in future.\",\"sub_heading\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi mollitia saepe eos facere numquam ut, minima animi distinctio at maiores veritatis perferendis magni.\",\"background_image\":\"610f83644ebec1628406628.jpg\"}', '2021-01-03 23:40:54', '2021-08-08 06:40:28'),
(34, 'feature.element', '{\"title\":\"Salary Tools\",\"description\":\"Maiores, eaque eos. Vero voluptas amet asda aliquid voluptatibus quae maiores quidem magni.\",\"feature_icon\":\"<i class=\\\"las la-toolbox\\\"><\\/i>\"}', '2021-01-03 23:41:02', '2021-08-08 06:40:59'),
(35, 'service.element', '{\"trx_type\":\"withdraw\",\"service_icon\":\"<i class=\\\"las la-highlighter\\\"><\\/i>\",\"title\":\"asdfasdf\",\"description\":\"asdfasdfasdfasdf\"}', '2021-03-06 01:12:10', '2021-03-06 01:12:10'),
(36, 'service.content', '{\"trx_type\":\"withdraw\",\"heading\":\"asdf fffff\",\"sub_heading\":\"asdf asdfasdf\"}', '2021-03-06 01:27:34', '2021-03-06 02:19:39'),
(39, 'banner.content', '{\"has_image\":\"1\",\"heading\":\"Right job find the right talent. All in one place.\",\"background_image\":\"610f826b8a5b31628406379.jpg\"}', '2021-05-02 06:09:30', '2021-08-08 06:38:20'),
(41, 'cookie.data', '{\"link\":\"#\",\"description\":\"<font color=\\\"#ffffff\\\" face=\\\"Exo, sans-serif\\\"><span style=\\\"font-size: 18px;\\\">We may use cookies or any other tracking technologies when you visit our website, including any other media form, mobile website, or mobile application related or connected to help customize the Site and improve your experience.<\\/span><\\/font><br>\",\"status\":1}', '2020-07-04 23:42:52', '2021-06-06 09:43:37'),
(42, 'policy_pages.element', '{\"title\":\"Privacy Policy\",\"details\":\"<div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">How do we protect your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Do we disclose any information to outside parties?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Children\'s Online Privacy Protection Act Compliance<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Changes to our Privacy Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">How long we retain your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">What we don\\u2019t do with your data<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\"}', '2021-06-09 08:50:42', '2021-06-09 08:50:42'),
(43, 'policy_pages.element', '{\"title\":\"Terms of Service\",\"details\":\"<div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We claim all authority to dismiss, end, or handicap any help with or without cause per administrator discretion. This is a Complete independent facilitating, on the off chance that you misuse our ticket or Livechat or emotionally supportive network by submitting solicitations or protests we will impair your record. The solitary time you should reach us about the seaward facilitating is if there is an issue with the worker. We have not many substance limitations and everything is as per laws and guidelines. Try not to join on the off chance that you intend to do anything contrary to the guidelines, we do check these things and we will know, don\'t burn through our own and your time by joining on the off chance that you figure you will have the option to sneak by us and break the terms.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><ul class=\\\"font-18\\\" style=\\\"padding-left:15px;list-style-type:disc;font-size:18px;\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Configuration requests - If you have a fully managed dedicated server with us then we offer custom PHP\\/MySQL configurations, firewalls for dedicated IPs, DNS, and httpd configurations.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Software requests - Cpanel Extension Installation will be granted as long as it does not interfere with the security, stability, and performance of other users on the server.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Emergency Support - We do not provide emergency support \\/ Phone Support \\/ LiveChat Support. Support may take some hours sometimes.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Webmaster help - We do not offer any support for webmaster related issues and difficulty including coding, &amp; installs, Error solving. if there is an issue where a library or configuration of the server then we can help you if it\'s possible from our end.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Backups - We keep backups but we are not responsible for data loss, you are fully responsible for all backups.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">We Don\'t support any child porn or such material.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">No spam-related sites or material, such as email lists, mass mail programs, and scripts, etc.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">No harassing material that may cause people to retaliate against you.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">No phishing pages.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">You may not run any exploitation script from the server. reason can be terminated immediately.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">If Anyone attempting to hack or exploit the server by using your script or hosting, we will terminate your account to keep safe other users.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Malicious Botnets are strictly forbidden.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Spam, mass mailing, or email marketing in any way are strictly forbidden here.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Malicious hacking materials, trojans, viruses, &amp; malicious bots running or for download are forbidden.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Resource and cronjob abuse is forbidden and will result in suspension or termination.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Php\\/CGI proxies are strictly forbidden.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">CGI-IRC is strictly forbidden.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">No fake or disposal mailers, mass mailing, mail bombers, SMS bombers, etc.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">NO CREDIT OR REFUND will be granted for interruptions of service, due to User Agreement violations.<\\/li><\\/ul><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Terms &amp; Conditions for Users<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">Before getting to this site, you are consenting to be limited by these site Terms and Conditions of Use, every single appropriate law, and guidelines, and concur that you are answerable for consistency with any material neighborhood laws. If you disagree with any of these terms, you are restricted from utilizing or getting to this site.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Support<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">Whenever you have downloaded our item, you may get in touch with us for help through email and we will give a valiant effort to determine your issue. We will attempt to answer using the Email for more modest bug fixes, after which we will refresh the center bundle. Content help is offered to confirmed clients by Tickets as it were. Backing demands made by email and Livechat.<\\/p><p class=\\\"my-3 font-18 font-weight-bold\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">On the off chance that your help requires extra adjustment of the System, at that point, you have two alternatives:<\\/p><ul class=\\\"font-18\\\" style=\\\"padding-left:15px;list-style-type:disc;font-size:18px;\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Hang tight for additional update discharge.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Or on the other hand, enlist a specialist (We offer customization for extra charges).<\\/li><\\/ul><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Ownership<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">You may not guarantee scholarly or selective possession of any of our items, altered or unmodified. All items are property, we created them. Our items are given \\\"with no guarantees\\\" without guarantee of any sort, either communicated or suggested. On no occasion will our juridical individual be subject to any harms including, however not restricted to, immediate, roundabout, extraordinary, accidental, or significant harms or different misfortunes emerging out of the utilization of or powerlessness to utilize our items.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Warranty<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t offer any guarantee or assurance of these Services in any way. When our Services have been modified we can\'t ensure they will work with all outsider plugins, modules, or internet browsers. Program similarity ought to be tried against the show formats on the demo worker. If you don\'t mind guarantee that the programs you use will work with the component, as we can not ensure that our systems will work with all program mixes.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Unauthorized\\/Illegal Usage<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">You may not utilize our things for any illicit or unapproved reason or may you, in the utilization of the stage, disregard any laws in your locale (counting yet not restricted to copyright laws) just as the laws of your nation and International law. Specifically, it is disallowed to utilize the things on our foundation for pages that advance: brutality, illegal intimidation, hard sexual entertainment, bigotry, obscenity content or warez programming joins.<br \\/><br \\/>You can\'t imitate, copy, duplicate, sell, exchange or adventure any of our segment, utilization of the offered on our things, or admittance to the administration without the express composed consent by us or item proprietor.<br \\/><br \\/>Our Members are liable for all substance posted on the discussion and demo and movement that happens under your record.<br \\/><br \\/>We hold the chance of hindering your participation account quickly if we will think about a particularly not allowed conduct.<br \\/><br \\/>If you make a record on our site, you are liable for keeping up the security of your record, and you are completely answerable for all exercises that happen under the record and some other activities taken regarding the record. You should quickly inform us, of any unapproved employments of your record or some other penetrates of security.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Fiverr, Seoclerks Sellers Or Affiliates<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We do NOT ensure full SEO campaign conveyance within 24 hours. We make no assurance for conveyance time by any means. We give our best assessment to orders during the putting in of requests, anyway, these are gauges. We won\'t be considered liable for loss of assets, negative surveys or you being prohibited for late conveyance. If you are selling on a site that requires time touchy outcomes, utilize Our SEO Services at your own risk.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Payment\\/Refund Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">No refund or cash back will be made. After a deposit has been finished, it is extremely unlikely to invert it. You should utilize your equilibrium on requests our administrations, Hosting, SEO campaign. You concur that once you complete a deposit, you won\'t document a debate or a chargeback against us in any way, shape, or form.<br \\/><br \\/>If you document a debate or chargeback against us after a deposit, we claim all authority to end every single future request, prohibit you from our site. False action, for example, utilizing unapproved or taken charge cards will prompt the end of your record. There are no special cases.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Free Balance \\/ Coupon Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We offer numerous approaches to get FREE Balance, Coupons and Deposit offers yet we generally reserve the privilege to audit it and deduct it from your record offset with any explanation we may it is a sort of misuse. If we choose to deduct a few or all of free Balance from your record balance, and your record balance becomes negative, at that point the record will naturally be suspended. If your record is suspended because of a negative Balance you can request to make a custom payment to settle your equilibrium to actuate your record.<\\/p><\\/div>\"}', '2021-06-09 08:51:18', '2021-06-09 08:51:18'),
(44, 'feature.element', '{\"title\":\"Quick Apply\",\"description\":\"Maiores, eaque eos. Vero voluptas amet asda aliquid voluptatibus quae maiores quidem magni\",\"feature_icon\":\"<i class=\\\"las la-toolbox\\\"><\\/i>\"}', '2021-08-08 06:41:27', '2021-08-08 06:41:27'),
(45, 'feature.element', '{\"title\":\"Job Alert Email\",\"description\":\"Maiores, eaque eos. Vero voluptas amet asda aliquid voluptatibus quae maiores quidem magni\",\"feature_icon\":\"<i class=\\\"las la-toolbox\\\"><\\/i>\"}', '2021-08-08 06:41:52', '2021-08-08 06:41:52'),
(46, 'feature.element', '{\"title\":\"Job Alert Vero\",\"description\":\"Maiores, eaque eos. Vero voluptas amet asda aliquid voluptatibus quae maiores quidem magni.\",\"feature_icon\":\"<i class=\\\"las la-toolbox\\\"><\\/i>\"}', '2021-08-08 06:42:41', '2021-08-08 06:42:41'),
(47, 'cta.content', '{\"has_image\":\"1\",\"heading\":\"Over 20,000+ Talented People Registered in Our Job Portal\",\"btn_name\":\"Registration Now\",\"btn_url\":\"#\",\"cta_image\":\"612b28dbd857d1630218459.png\"}', '2021-08-08 06:53:59', '2021-08-29 05:57:40'),
(48, 'package.content', '{\"heading\":\"Awesome package who want to post job\'s posts\",\"sub_heading\":\"Dolor sit amet consectetur adipisicing elit. Soluta possimus officia nulla dolore expedita quod ratne tempora tempore atque cum unde ipsum, animi maxime est ex. Ullam minima adipisci quo ratne tempora.\"}', '2021-08-08 06:58:53', '2021-08-08 06:58:53'),
(49, 'brand.content', '{\"heading\":\"More than 2,000 companies use Joblab.\"}', '2021-08-08 07:03:06', '2021-08-08 07:03:06'),
(50, 'brand.element', '{\"has_image\":[\"1\"],\"brand_image\":\"610f88c1c79ad1628408001.png\"}', '2021-08-08 07:03:21', '2021-08-08 07:03:21'),
(51, 'brand.element', '{\"has_image\":[\"1\"],\"brand_image\":\"610f88d3353a01628408019.png\"}', '2021-08-08 07:03:39', '2021-08-08 07:03:39'),
(52, 'brand.element', '{\"has_image\":[\"1\"],\"brand_image\":\"610f88d7a16931628408023.png\"}', '2021-08-08 07:03:43', '2021-08-08 07:03:43'),
(53, 'brand.element', '{\"has_image\":[\"1\"],\"brand_image\":\"610f88de5a6e51628408030.png\"}', '2021-08-08 07:03:50', '2021-08-08 07:03:50'),
(54, 'brand.element', '{\"has_image\":[\"1\"],\"brand_image\":\"610f88e19f71f1628408033.png\"}', '2021-08-08 07:03:53', '2021-08-08 07:03:53'),
(55, 'brand.element', '{\"has_image\":[\"1\"],\"brand_image\":\"610f88e4d63e01628408036.png\"}', '2021-08-08 07:03:56', '2021-08-08 07:03:56'),
(56, 'brand.element', '{\"has_image\":[\"1\"],\"brand_image\":\"610f88e82e33e1628408040.png\"}', '2021-08-08 07:04:00', '2021-08-08 07:04:00'),
(57, 'brand.element', '{\"has_image\":[\"1\"],\"brand_image\":\"610f88ec140721628408044.png\"}', '2021-08-08 07:04:04', '2021-08-08 07:04:04'),
(58, 'footer.content', '{\"title\":\"Dolor sit amet, consectetur adipisicing elit. Dignissimos asperiores aspernatur modi consequuntur ipsum alias ratione repellendus est, iure repudiandae.\",\"job_post\":\"30k\",\"candidate\":\"20k\"}', '2021-08-08 08:31:51', '2021-08-26 05:59:40'),
(59, 'social_icon.element', '{\"title\":\"Twitter\",\"social_icon\":\"<i class=\\\"lab la-twitter\\\"><\\/i>\",\"url\":\"https:\\/\\/twitter.com\\/\"}', '2021-08-08 08:36:24', '2021-08-08 08:36:24'),
(60, 'social_icon.element', '{\"title\":\"Instagram\",\"social_icon\":\"<i class=\\\"lab la-instagram\\\"><\\/i>\",\"url\":\"https:\\/\\/twitter.com\\/\"}', '2021-08-08 08:37:12', '2021-08-08 08:37:53'),
(61, 'social_icon.element', '{\"title\":\"Pinterest\",\"social_icon\":\"<i class=\\\"lab la-pinterest-p\\\"><\\/i>\",\"url\":\"https:\\/\\/twitter.com\\/\"}', '2021-08-08 08:37:42', '2021-08-08 08:38:00'),
(62, 'social_icon.element', '{\"title\":\"Youtube\",\"social_icon\":\"<i class=\\\"lab la-youtube\\\"><\\/i>\",\"url\":\"Youtube\"}', '2021-08-08 08:38:23', '2021-08-08 08:38:23'),
(63, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Consequatur incidunt beatae culpa temporibus officiis quidem! Illo inventore quam vitae unde\",\"description_nic\":\"<p class=\\\"mt-4\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(86,86,86);font-family:Roboto, sans-serif;font-size:16px;background-color:rgb(250,250,251);\\\">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Consequatur incidunt beatae culpa temporibus officiis quidem! Illo inventore quam vitae unde, non ab porro quibusdam beatae nam. Error, in! Quidem ipsa nemo, quisquam et commodi reiciendis adipisci ipsum unde labore eveniet quasi exercitationem ducimus quas vel aut sapiente delectus ea eos quaerat ratione! Harum aliquam ea voluptates ipsam, consectetur doloribus totam illo expedita aut, iusto illum nesciunt odio eius impedit sequi tempore inventore? Similique qui, itaque autem provident earum nam dolore esse perferendis, consequatur architecto doloremque maiores? Vitae omnis consequuntur aliquam animi excepturi quae doloremque numquam suscipit nesciunt, dicta maiores sit.<\\/p><p class=\\\"mt-4\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(86,86,86);font-family:Roboto, sans-serif;font-size:16px;background-color:rgb(250,250,251);\\\">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Consequatur incidunt beatae culpa temporibus officiis quidem! Illo inventore quam vitae unde, non ab porro quibusdam beatae nam. Error, in! Quidem ipsa nemo, quisquam et commodi reiciendis adipisci ipsum unde labore eveniet quasi exercitationem ducimus quas vel aut sapiente delectus ea eos quaerat ratione! Harum aliquam ea voluptates ipsam, consectetur doloribus totam illo expedita aut, iusto illum nesciunt odio eius impedit sequi tempore inventore? Similique qui, itaque autem provident earum nam dolore esse perferendis, consequatur architecto doloremque maiores? Vitae omnis consequuntur aliquam animi excepturi quae doloremque numquam suscipit nesciunt, dicta maiores sit.<\\/p><p class=\\\"mt-4\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(86,86,86);font-family:Roboto, sans-serif;font-size:16px;background-color:rgb(250,250,251);\\\">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Consequatur incidunt beatae culpa temporibus officiis quidem! Illo inventore quam vitae unde, non ab porro quibusdam beatae nam. Error, in! Quidem ipsa nemo, quisquam et commodi reiciendis adipisci ipsum unde labore eveniet quasi exercitationem ducimus quas vel aut sapiente delectus ea eos quaerat ratione! Harum aliquam ea voluptates ipsam, consectetur doloribus totam illo expedita aut, iusto illum nesciunt odio eius impedit sequi tempore inventore? Similique qui, itaque autem provident earum nam dolore esse perferendis, consequatur architecto doloremque maiores? Vitae omnis consequuntur aliquam animi excepturi quae doloremque numquam suscipit nesciunt, dicta maiores sit.<\\/p><blockquote style=\\\"margin-top:1.25rem;margin-bottom:1.25rem;background-color:rgb(22,199,154);padding:1.875rem;color:rgb(255,255,255);font-size:1.125rem;font-style:italic;font-family:Roboto, sans-serif;\\\"><p style=\\\"margin-right:0px;margin-left:0px;\\\">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Perferendis veniam ratione aspernatur quos aut, itaque id, ut suscipit corporis incidunt distinctio in. Non voluptas corporis, nostrum optio id vero consequuntur iusto illum nesciunt odio eius impedit sequi.<\\/p><\\/blockquote><p class=\\\"mt-4\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(86,86,86);font-family:Roboto, sans-serif;font-size:16px;background-color:rgb(250,250,251);\\\">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Consequatur incidunt beatae culpa temporibus officiis quidem! Illo inventore quam vitae unde, non ab porro quibusdam beatae nam. Error, in! Quidem ipsa nemo, quisquam et commodi reiciendis adipisci ipsum unde labore eveniet quasi exercitationem ducimus quas vel aut sapiente delectus ea eos quaerat ratione! Harum aliquam ea voluptates ipsam, consectetur doloribus totam illo expedita aut, iusto illum nesciunt odio eius impedit sequi tempore inventore? Similique qui, itaque autem provident earum nam dolore esse perferendis, consequatur architecto doloremque maiores? Vitae omn<\\/p>\",\"blog_image\":\"610fa4594353b1628415065.jpg\"}', '2021-08-08 09:01:05', '2021-08-08 09:01:05'),
(64, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Dolor sit amet consectetur adipisicing elit. Consequatur incidunt beatae culpa\",\"description_nic\":\"<p class=\\\"mt-4\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(86,86,86);font-family:Roboto, sans-serif;font-size:16px;background-color:rgb(250,250,251);\\\">Dolor sit amet consectetur adipisicing elit. Consequatur incidunt beatae culpa temporibus officiis quidem! Illo inventore quam vitae unde, non ab porro quibusdam beatae nam. Error, in! Quidem ipsa nemo, quisquam et commodi reiciendis adipisci ipsum unde labore eveniet quasi exercitationem ducimus quas vel aut sapiente delectus ea eos quaerat ratione! Harum aliquam ea voluptates ipsam, consectetur doloribus totam illo expedita aut, iusto illum nesciunt odio eius impedit sequi tempore inventore? Similique qui, itaque autem provident earum nam dolore esse perferendis, consequatur architecto doloremque maiores? Vitae omnis consequuntur aliquam animi excepturi quae doloremque numquam suscipit nesciunt, dicta maiores sit.<\\/p><p class=\\\"mt-4\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(86,86,86);font-family:Roboto, sans-serif;font-size:16px;background-color:rgb(250,250,251);\\\">Dolor sit amet consectetur adipisicing elit. Consequatur incidunt beatae culpa temporibus officiis quidem! Illo inventore quam vitae unde, non ab porro quibusdam beatae nam. Error, in! Quidem ipsa nemo, quisquam et commodi reiciendis adipisci ipsum unde labore eveniet quasi exercitationem ducimus quas vel aut sapiente delectus ea eos quaerat ratione! Harum aliquam ea voluptates ipsam, consectetur doloribus totam illo expedita aut, iusto illum nesciunt odio eius impedit sequi tempore inventore? Similique qui, itaque autem provident earum nam dolore esse perferendis, consequatur architecto doloremque maiores? Vitae omnis consequuntur aliquam animi excepturi quae doloremque numquam suscipit nesciunt, dicta maiores sit.<\\/p><p class=\\\"mt-4\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(86,86,86);font-family:Roboto, sans-serif;font-size:16px;background-color:rgb(250,250,251);\\\">Dolor sit amet consectetur adipisicing elit. Consequatur incidunt beatae culpa temporibus officiis quidem! Illo inventore quam vitae unde, non ab porro quibusdam beatae nam. Error, in! Quidem ipsa nemo, quisquam et commodi reiciendis adipisci ipsum unde labore eveniet quasi exercitationem ducimus quas vel aut sapiente delectus ea eos quaerat ratione! Harum aliquam ea voluptates ipsam, consectetur doloribus totam illo expedita aut, iusto illum nesciunt odio eius impedit sequi tempore inventore? Similique qui, itaque autem provident earum nam dolore esse perferendis, consequatur architecto doloremque maiores? Vitae omnis consequuntur aliquam animi excepturi quae doloremque numquam suscipit nesciunt, dicta maiores sit.<\\/p><blockquote style=\\\"margin-top:1.25rem;margin-bottom:1.25rem;background-color:rgb(22,199,154);padding:1.875rem;color:rgb(255,255,255);font-size:1.125rem;font-style:italic;font-family:Roboto, sans-serif;\\\"><p style=\\\"margin-right:0px;margin-left:0px;\\\">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Perferendis veniam ratione aspernatur quos aut, itaque id, ut suscipit corporis incidunt distinctio in. Non voluptas corporis, nostrum optio id vero consequuntur iusto illum nesciunt odio eius impedit sequi.<\\/p><\\/blockquote><p class=\\\"mt-4\\\" style=\\\"margin-right:0px;margin-left:0px;color:rgb(86,86,86);font-family:Roboto, sans-serif;font-size:16px;background-color:rgb(250,250,251);\\\">Dolor sit amet consectetur adipisicing elit. Consequatur incidunt beatae culpa temporibus officiis quidem! Illo inventore quam vitae unde, non ab porro quibusdam beatae nam. Error, in! Quidem ipsa nemo, quisquam et commodi reiciendis adipisci ipsum unde labore eveniet quasi exercitationem ducimus quas vel aut sapiente delectus ea eos quaerat ratione! Harum aliquam ea voluptates ipsam, consectetur doloribus totam illo expedita aut, iusto illum nesciunt odio eius impedit sequi tempore inventore? Similique qui, itaque autem provident earum nam dolore esse perferendis, consequatur architecto doloremque maiores? Vitae omn<\\/p>\",\"blog_image\":\"610fa48865d6a1628415112.jpg\"}', '2021-08-08 09:01:52', '2021-08-08 09:01:52'),
(65, 'breadcrumb.content', '{\"has_image\":\"1\",\"background_image\":\"61124d73cde5c1628589427.jpg\"}', '2021-08-10 09:27:07', '2021-08-10 09:27:08'),
(66, 'auth.content', '{\"has_image\":\"1\",\"background_image\":\"611a58427a2651629116482.jpg\"}', '2021-08-16 11:51:22', '2021-08-16 11:51:22'),
(67, 'latest_job.content', '{\"heading\":\"Latest Job\"}', '2021-08-19 07:55:35', '2021-08-19 07:55:35'),
(68, 'feature_job.content', '{\"heading\":\"Feature Job\"}', '2021-08-19 07:55:47', '2021-08-19 07:55:47'),
(69, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Consequatur incidunt beatae culpa temporibus officiis quidem!\",\"description_nic\":\"<p class=\\\"mt-4\\\" style=\\\"color:rgb(86,86,86);font-size:16px;margin-right:0px;margin-left:0px;font-family:Roboto, Bangla550, sans-serif;background-color:rgb(250,250,251);\\\">dolor sit amet consectetur adipisicing elit. Consequatur incidunt beatae culpa temporibus officiis quidem! Illo inventore quam vitae unde, non ab porro quibusdam beatae nam. Error, in! Quidem ipsa nemo, quisquam et commodi reiciendis adipisci ipsum unde labore eveniet quasi exercitationem ducimus quas vel aut sapiente delectus ea eos quaerat ratione! Harum aliquam ea voluptates ipsam, consectetur doloribus totam illo expedita aut, iusto illum nesciunt odio eius impedit sequi tempore inventore? Similique qui, itaque autem provident earum nam dolore esse perferendis, consequatur architecto doloremque maiores? Vitae omnis consequuntur aliquam animi excepturi quae doloremque numquam suscipit nesciunt, dicta maiores sit.<\\/p><p class=\\\"mt-4\\\" style=\\\"color:rgb(86,86,86);font-size:16px;margin-right:0px;margin-left:0px;font-family:Roboto, Bangla550, sans-serif;background-color:rgb(250,250,251);\\\">dolor sit amet consectetur adipisicing elit. Consequatur incidunt beatae culpa temporibus officiis quidem! Illo inventore quam vitae unde, non ab porro quibusdam beatae nam. Error, in! Quidem ipsa nemo, quisquam et commodi reiciendis adipisci ipsum unde labore eveniet quasi exercitationem ducimus quas vel aut sapiente delectus ea eos quaerat ratione! Harum aliquam ea voluptates ipsam, consectetur doloribus totam illo expedita aut, iusto illum nesciunt odio eius impedit sequi tempore inventore? Similique qui, itaque autem provident earum nam dolore esse perferendis, consequatur architecto doloremque maiores? Vitae omnis consequuntur aliquam animi excepturi quae doloremque numquam suscipit nesciunt, dicta maiores sit.<\\/p><p class=\\\"mt-4\\\" style=\\\"color:rgb(86,86,86);font-size:16px;margin-right:0px;margin-left:0px;font-family:Roboto, Bangla550, sans-serif;background-color:rgb(250,250,251);\\\">dolor sit amet consectetur adipisicing elit. Consequatur incidunt beatae culpa temporibus officiis quidem! Illo inventore quam vitae unde, non ab porro quibusdam beatae nam. Error, in! Quidem ipsa nemo, quisquam et commodi reiciendis adipisci ipsum unde labore eveniet quasi exercitationem ducimus quas vel aut sapiente delectus ea eos quaerat ratione! Harum aliquam ea voluptates ipsam, consectetur doloribus totam illo expedita aut, iusto illum nesciunt odio eius impedit sequi tempore inventore? Similique qui, itaque autem provident earum nam dolore esse perferendis, consequatur architecto doloremque maiores? Vitae omnis consequuntur aliquam animi excepturi quae doloremque numquam suscipit nesciunt, dicta maiores sit.<\\/p><blockquote style=\\\"margin-top:1.25rem;margin-bottom:1.25rem;background-color:rgb(22,199,154);padding:1.875rem;color:rgb(255,255,255);font-size:1.125rem;font-style:italic;font-family:Roboto, Bangla550, sans-serif;\\\"><p style=\\\"margin-right:0px;margin-left:0px;\\\">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Perferendis veniam ratione aspernatur quos aut, itaque id, ut suscipit corporis incidunt distinctio in. Non voluptas corporis, nostrum optio id vero consequuntur iusto illum nesciunt odio eius impedit sequi.<\\/p><\\/blockquote><p class=\\\"mt-4\\\" style=\\\"color:rgb(86,86,86);font-size:16px;margin-right:0px;margin-left:0px;font-family:Roboto, Bangla550, sans-serif;background-color:rgb(250,250,251);\\\">dolor sit amet consectetur adipisicing elit. Consequatur incidunt beatae culpa temporibus officiis quidem! Illo inventore quam vitae unde, non ab porro quibusdam beatae nam. Error, in! Quidem ipsa nemo, quisquam et commodi reiciendis adipisci ipsum unde labore eveniet quasi exercitationem ducimus quas vel aut sapiente delectus ea eos quaerat ratione! Harum aliquam ea voluptates ipsam, consectetur doloribus totam illo expedita aut, iusto illum nesciunt odio eius impedit sequi tempore inventore? Similique qui, itaque autem provident earum nam dolore esse perferendis, consequatur architecto doloremque maiores? Vitae omnis consequuntur aliquam animi excepturi quae doloremque numquam suscipit nesciunt, dicta maiores sit.<\\/p>\",\"blog_image\":\"61221c997e0a91629625497.jpg\"}', '2021-08-22 09:14:57', '2021-08-22 09:14:57');
INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `created_at`, `updated_at`) VALUES
(70, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Consequatur incidunt beatae culpa temporibus officiis quidem\",\"description_nic\":\"<p class=\\\"mt-4\\\" style=\\\"color:rgb(86,86,86);font-size:16px;margin-right:0px;margin-left:0px;font-family:Roboto, Bangla550, sans-serif;background-color:rgb(250,250,251);\\\">dolor sit amet consectetur adipisicing elit. Consequatur incidunt beatae culpa temporibus officiis quidem! Illo inventore quam vitae unde, non ab porro quibusdam beatae nam. Error, in! Quidem ipsa nemo, quisquam et commodi reiciendis adipisci ipsum unde labore eveniet quasi exercitationem ducimus quas vel aut sapiente delectus ea eos quaerat ratione! Harum aliquam ea voluptates ipsam, consectetur doloribus totam illo expedita aut, iusto illum nesciunt odio eius impedit sequi tempore inventore? Similique qui, itaque autem provident earum nam dolore esse perferendis, consequatur architecto doloremque maiores? Vitae omnis consequuntur aliquam animi excepturi quae doloremque numquam suscipit nesciunt, dicta maiores sit.<\\/p><p class=\\\"mt-4\\\" style=\\\"color:rgb(86,86,86);font-size:16px;margin-right:0px;margin-left:0px;font-family:Roboto, Bangla550, sans-serif;background-color:rgb(250,250,251);\\\">dolor sit amet consectetur adipisicing elit. Consequatur incidunt beatae culpa temporibus officiis quidem! Illo inventore quam vitae unde, non ab porro quibusdam beatae nam. Error, in! Quidem ipsa nemo, quisquam et commodi reiciendis adipisci ipsum unde labore eveniet quasi exercitationem ducimus quas vel aut sapiente delectus ea eos quaerat ratione! Harum aliquam ea voluptates ipsam, consectetur doloribus totam illo expedita aut, iusto illum nesciunt odio eius impedit sequi tempore inventore? Similique qui, itaque autem provident earum nam dolore esse perferendis, consequatur architecto doloremque maiores? Vitae omnis consequuntur aliquam animi excepturi quae doloremque numquam suscipit nesciunt, dicta maiores sit.<\\/p><p class=\\\"mt-4\\\" style=\\\"color:rgb(86,86,86);font-size:16px;margin-right:0px;margin-left:0px;font-family:Roboto, Bangla550, sans-serif;background-color:rgb(250,250,251);\\\">dolor sit amet consectetur adipisicing elit. Consequatur incidunt beatae culpa temporibus officiis quidem! Illo inventore quam vitae unde, non ab porro quibusdam beatae nam. Error, in! Quidem ipsa nemo, quisquam et commodi reiciendis adipisci ipsum unde labore eveniet quasi exercitationem ducimus quas vel aut sapiente delectus ea eos quaerat ratione! Harum aliquam ea voluptates ipsam, consectetur doloribus totam illo expedita aut, iusto illum nesciunt odio eius impedit sequi tempore inventore? Similique qui, itaque autem provident earum nam dolore esse perferendis, consequatur architecto doloremque maiores? Vitae omnis consequuntur aliquam animi excepturi quae doloremque numquam suscipit nesciunt, dicta maiores sit.<\\/p><blockquote style=\\\"margin-top:1.25rem;margin-bottom:1.25rem;background-color:rgb(22,199,154);padding:1.875rem;color:rgb(255,255,255);font-size:1.125rem;font-style:italic;font-family:Roboto, Bangla550, sans-serif;\\\"><p style=\\\"margin-right:0px;margin-left:0px;\\\">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Perferendis veniam ratione aspernatur quos aut, itaque id, ut suscipit corporis incidunt distinctio in. Non voluptas corporis, nostrum optio id vero consequuntur iusto illum nesciunt odio eius impedit sequi.<\\/p><\\/blockquote><p class=\\\"mt-4\\\" style=\\\"color:rgb(86,86,86);font-size:16px;margin-right:0px;margin-left:0px;font-family:Roboto, Bangla550, sans-serif;background-color:rgb(250,250,251);\\\">dolor sit amet consectetur adipisicing elit. Consequatur incidunt beatae culpa temporibus officiis quidem! Illo inventore quam vitae unde, non ab porro quibusdam beatae nam. Error, in! Quidem ipsa nemo, quisquam et commodi reiciendis adipisci ipsum unde labore eveniet quasi exercitationem ducimus quas vel aut sapiente delectus ea eos quaerat ratione! Harum aliquam ea voluptates ipsam, consectetur doloribus totam illo expedita aut, iusto illum nesciunt odio eius impedit sequi tempore inventore? Similique qui, itaque autem provident earum nam dolore esse perferendis, consequatur architecto doloremque maiores? Vitae omnis consequuntur aliquam animi excepturi quae doloremque numquam suscipit nesciunt, dicta maiores sit.<\\/p>\",\"blog_image\":\"61221cada0a081629625517.jpg\"}', '2021-08-22 09:15:17', '2021-08-22 09:15:17'),
(71, 'faq.content', '{\"heading\":\"Frequently Asked Questions\",\"sub_heading\":\"Dolor sit amet consectetur adipisicing elit. Ad voluptatum fuga eius expedita, nulla quos blanditiis nobis laboriosam. Natus cum eum fuga praesentium.\"}', '2021-08-29 05:46:05', '2021-08-29 05:46:05'),
(72, 'faq.element', '{\"title\":\"Doloremque perspiciatis harum voluptatibus\",\"answer\":\"dolor sit amet consectetur adipisicing elit. Doloremque perspiciatis harum voluptatibus natus alias nesciunt eius similique tenetur corporis fuga eligendi in enim quisquam dolor voluptates nihil obcaecati pariatur commodi facilis, officiis nobis porro eum architecto! Delectus ut voluptatibus voluptatem, aliquam tenetur et facilis, quia veritatis temporibus, ex magni soluta\"}', '2021-08-29 05:46:26', '2021-08-29 05:46:26'),
(73, 'faq.element', '{\"title\":\"Doloremque perspiciatis harum voluptatibus\",\"answer\":\"ipsum dolor sit amet consectetur adipisicing elit. Doloremque perspiciatis harum voluptatibus natus alias nesciunt eius similique tenetur corporis fuga eligendi in enim quisquam dolor voluptates nihil obcaecati pariatur commodi facilis, officiis nobis porro eum architecto! Delectus ut voluptatibus voluptatem, aliquam tenetur et facilis, quia veritatis temporibus, ex magni soluta\"}', '2021-08-29 05:46:36', '2021-08-29 05:46:36'),
(74, 'faq.element', '{\"title\":\"Obcaecati pariatur commodi facilis, officiis\",\"answer\":\"ipsum dolor sit amet consectetur adipisicing elit. Doloremque perspiciatis harum voluptatibus natus alias nesciunt eius similique tenetur corporis fuga eligendi in enim quisquam dolor voluptates nihil obcaecati pariatur commodi facilis, officiis nobis porro eum architecto! Delectus ut voluptatibus voluptatem, aliquam tenetur et facilis, quia veritatis temporibus, ex magni solut\"}', '2021-08-29 05:47:03', '2021-08-29 05:47:12'),
(75, 'faq.element', '{\"title\":\"Doloremque perspiciatis harum voluptatibus.\",\"answer\":\"dolor sit amet consectetur adipisicing elit. Doloremque perspiciatis harum voluptatibus natus alias nesciunt eius similique tenetur corporis fuga eligendi in enim quisquam dolor voluptates nihil obcaecati pariatur commodi facilis, officiis nobis porro eum architecto! Delectus ut voluptatibus voluptatem, aliquam tenetur et facilis, quia veritatis temporibus, ex magni soluta\"}', '2021-08-29 05:47:42', '2021-08-29 05:47:50');

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` int(10) DEFAULT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NULL',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `gateway_parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supported_currencies` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `crypto` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: fiat currency, 1: crypto currency',
  `extra` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `input_form` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `code`, `name`, `alias`, `image`, `status`, `gateway_parameters`, `supported_currencies`, `crypto`, `extra`, `description`, `input_form`, `created_at`, `updated_at`) VALUES
(1, 101, 'Paypal', 'Paypal', '5f6f1bd8678601601117144.jpg', 1, '{\"paypal_email\":{\"title\":\"PayPal Email\",\"global\":true,\"value\":\"sb-owud61543012@business.example.com\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:04:38'),
(2, 102, 'Perfect Money', 'PerfectMoney', '5f6f1d2a742211601117482.jpg', 1, '{\"passphrase\":{\"title\":\"ALTERNATE PASSPHRASE\",\"global\":true,\"value\":\"hR26aw02Q1eEeUPSIfuwNypXX\"},\"wallet_id\":{\"title\":\"PM Wallet\",\"global\":false,\"value\":\"\"}}', '{\"USD\":\"$\",\"EUR\":\"\\u20ac\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:35:33'),
(3, 103, 'Stripe Hosted', 'Stripe', '5f6f1d4bc69e71601117515.jpg', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:48:36'),
(4, 104, 'Skrill', 'Skrill', '5f6f1d41257181601117505.jpg', 1, '{\"pay_to_email\":{\"title\":\"Skrill Email\",\"global\":true,\"value\":\"merchant@skrill.com\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"---\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"MAD\":\"MAD\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"SAR\":\"SAR\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TND\":\"TND\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\",\"COP\":\"COP\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:30:16'),
(5, 105, 'PayTM', 'Paytm', '5f6f1d1d3ec731601117469.jpg', 1, '{\"MID\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"DIY12386817555501617\"},\"merchant_key\":{\"title\":\"Merchant Key\",\"global\":true,\"value\":\"bKMfNxPPf_QdZppa\"},\"WEBSITE\":{\"title\":\"Paytm Website\",\"global\":true,\"value\":\"DIYtestingweb\"},\"INDUSTRY_TYPE_ID\":{\"title\":\"Industry Type\",\"global\":true,\"value\":\"Retail\"},\"CHANNEL_ID\":{\"title\":\"CHANNEL ID\",\"global\":true,\"value\":\"WEB\"},\"transaction_url\":{\"title\":\"Transaction URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/oltp-web\\/processTransaction\"},\"transaction_status_url\":{\"title\":\"Transaction STATUS URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/paytmchecksum\\/paytmCallback.jsp\"}}', '{\"AUD\":\"AUD\",\"ARS\":\"ARS\",\"BDT\":\"BDT\",\"BRL\":\"BRL\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"GEL\":\"GEL\",\"GHS\":\"GHS\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"NGN\":\"NGN\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"UGX\":\"UGX\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"GBP\":\"GBP\",\"USD\":\"USD\",\"VND\":\"VND\",\"XOF\":\"XOF\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 03:00:44'),
(6, 106, 'Payeer', 'Payeer', '5f6f1bc61518b1601117126.jpg', 0, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"866989763\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"7575\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"RUB\":\"RUB\"}', 0, '{\"status\":{\"title\": \"Status URL\",\"value\":\"ipn.Payeer\"}}', NULL, NULL, '2019-09-14 13:14:22', '2020-12-28 01:26:58'),
(7, 107, 'PayStack', 'Paystack', '5f7096563dfb71601214038.jpg', 1, '{\"public_key\":{\"title\":\"Public key\",\"global\":true,\"value\":\"pk_test_cd330608eb47970889bca397ced55c1dd5ad3783\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"sk_test_8a0b1f199362d7acc9c390bff72c4e81f74e2ac3\"}}', '{\"USD\":\"USD\",\"NGN\":\"NGN\"}', 0, '{\"callback\":{\"title\": \"Callback URL\",\"value\":\"ipn.Paystack\"},\"webhook\":{\"title\": \"Webhook URL\",\"value\":\"ipn.Paystack\"}}\r\n', NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:49:51'),
(8, 108, 'VoguePay', 'Voguepay', '5f6f1d5951a111601117529.jpg', 1, '{\"merchant_id\":{\"title\":\"MERCHANT ID\",\"global\":true,\"value\":\"demo\"}}', '{\"USD\":\"USD\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:22:38'),
(9, 109, 'Flutterwave', 'Flutterwave', '5f6f1b9e4bb961601117086.jpg', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"----------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"-----------------------\"},\"encryption_key\":{\"title\":\"Encryption Key\",\"global\":true,\"value\":\"------------------\"}}', '{\"BIF\":\"BIF\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CVE\":\"CVE\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"GHS\":\"GHS\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"KES\":\"KES\",\"LRD\":\"LRD\",\"MWK\":\"MWK\",\"MZN\":\"MZN\",\"NGN\":\"NGN\",\"RWF\":\"RWF\",\"SLL\":\"SLL\",\"STD\":\"STD\",\"TZS\":\"TZS\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"XAF\":\"XAF\",\"XOF\":\"XOF\",\"ZMK\":\"ZMK\",\"ZMW\":\"ZMW\",\"ZWD\":\"ZWD\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-06-05 11:37:45'),
(10, 110, 'RazorPay', 'Razorpay', '5f6f1d3672dd61601117494.jpg', 1, '{\"key_id\":{\"title\":\"Key Id\",\"global\":true,\"value\":\"rzp_test_kiOtejPbRZU90E\"},\"key_secret\":{\"title\":\"Key Secret \",\"global\":true,\"value\":\"osRDebzEqbsE1kbyQJ4y0re7\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:51:32'),
(11, 111, 'Stripe Storefront', 'StripeJs', '5f7096a31ed9a1601214115.jpg', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:53:10'),
(12, 112, 'Instamojo', 'Instamojo', '5f6f1babbdbb31601117099.jpg', 1, '{\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"test_2241633c3bc44a3de84a3b33969\"},\"auth_token\":{\"title\":\"Auth Token\",\"global\":true,\"value\":\"test_279f083f7bebefd35217feef22d\"},\"salt\":{\"title\":\"Salt\",\"global\":true,\"value\":\"19d38908eeff4f58b2ddda2c6d86ca25\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:56:20'),
(13, 501, 'Blockchain', 'Blockchain', '5f6f1b2b20c6f1601116971.jpg', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"55529946-05ca-48ff-8710-f279d86b1cc5\"},\"xpub_code\":{\"title\":\"XPUB CODE\",\"global\":true,\"value\":\"xpub6CKQ3xxWyBoFAF83izZCSFUorptEU9AF8TezhtWeMU5oefjX3sFSBw62Lr9iHXPkXmDQJJiHZeTRtD9Vzt8grAYRhvbz4nEvBu3QKELVzFK\"}}', '{\"BTC\":\"BTC\"}', 1, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:25:00'),
(14, 502, 'Block.io', 'Blockio', '5f6f19432bedf1601116483.jpg', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":false,\"value\":\"1658-8015-2e5e-9afb\"},\"api_pin\":{\"title\":\"API PIN\",\"global\":true,\"value\":\"75757575\"}}', '{\"BTC\":\"BTC\",\"LTC\":\"LTC\"}', 1, '{\"cron\":{\"title\": \"Cron URL\",\"value\":\"ipn.Blockio\"}}', NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:31:09'),
(15, 503, 'CoinPayments', 'Coinpayments', '5f6f1b6c02ecd1601117036.jpg', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"---------------\"},\"private_key\":{\"title\":\"Private Key\",\"global\":true,\"value\":\"------------\"},\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"93a1e014c4ad60a7980b4a7239673cb4\"}}', '{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT\":\"Tether USD (Omni Layer)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XCP\":\"Counterparty\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}', 1, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:07:14'),
(16, 504, 'CoinPayments Fiat', 'CoinpaymentsFiat', '5f6f1b94e9b2b1601117076.jpg', 1, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"6515561\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:07:44'),
(17, 505, 'Coingate', 'Coingate', '5f6f1b5fe18ee1601117023.jpg', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"6354mwVCEw5kHzRJ6thbGo-N\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:49:30'),
(18, 506, 'Coinbase Commerce', 'CoinbaseCommerce', '5f6f1b4c774af1601117004.jpg', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"c47cd7df-d8e8-424b-a20a\"},\"secret\":{\"title\":\"Webhook Shared Secret\",\"global\":true,\"value\":\"55871878-2c32-4f64-ab66\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"JPY\":\"JPY\",\"GBP\":\"GBP\",\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CNY\":\"CNY\",\"SEK\":\"SEK\",\"NZD\":\"NZD\",\"MXN\":\"MXN\",\"SGD\":\"SGD\",\"HKD\":\"HKD\",\"NOK\":\"NOK\",\"KRW\":\"KRW\",\"TRY\":\"TRY\",\"RUB\":\"RUB\",\"INR\":\"INR\",\"BRL\":\"BRL\",\"ZAR\":\"ZAR\",\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AWG\":\"AWG\",\"AZN\":\"AZN\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CDF\":\"CDF\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHS\":\"GHS\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MYR\":\"MYR\",\"MZN\":\"MZN\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NPR\":\"NPR\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDG\":\"SDG\",\"SHP\":\"SHP\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SRD\":\"SRD\",\"SSP\":\"SSP\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMT\":\"TMT\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZMW\":\"ZMW\",\"ZWL\":\"ZWL\"}\r\n\r\n', 0, '{\"endpoint\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.CoinbaseCommerce\"}}', NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:02:47'),
(24, 113, 'Paypal Express', 'PaypalSdk', '5f6f1bec255c61601117164.jpg', 1, '{\"clientId\":{\"title\":\"Paypal Client ID\",\"global\":true,\"value\":\"Ae0-tixtSV7DvLwIh3Bmu7JvHrjh5EfGdXr_cEklKAVjjezRZ747BxKILiBdzlKKyp-W8W_T7CKH1Ken\"},\"clientSecret\":{\"title\":\"Client Secret\",\"global\":true,\"value\":\"EOhbvHZgFNO21soQJT1L9Q00M3rK6PIEsdiTgXRBt2gtGtxwRer5JvKnVUGNU5oE63fFnjnYY7hq3HBA\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-20 23:01:08'),
(25, 114, 'Stripe Checkout', 'StripeV3', '5f709684736321601214084.jpg', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"},\"end_point\":{\"title\":\"End Point Secret\",\"global\":true,\"value\":\"whsec_lUmit1gtxwKTveLnSe88xCSDdnPOt8g5\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, '{\"webhook\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.StripeV3\"}}', NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:58:38'),
(27, 115, 'Mollie', 'Mollie', '5f6f1bb765ab11601117111.jpg', 1, '{\"mollie_email\":{\"title\":\"Mollie Email \",\"global\":true,\"value\":\"vi@gmail.com\"},\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"test_cucfwKTWfft9s337qsVfn5CC4vNkrn\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:44:45'),
(30, 116, 'Cashmaal', 'Cashmaal', '60d1a0b7c98311624350903.png', 1, '{\"web_id\":{\"title\":\"Web Id\",\"global\":true,\"value\":\"3748\"},\"ipn_key\":{\"title\":\"IPN Key\",\"global\":true,\"value\":\"546254628759524554647987\"}}', '{\"PKR\":\"PKR\",\"USD\":\"USD\"}', 0, '{\"webhook\":{\"title\": \"IPN URL\",\"value\":\"ipn.Cashmaal\"}}', NULL, NULL, NULL, '2021-06-22 08:05:04'),
(36, 119, 'Mercado Pago', 'MercadoPago', '60f2ad85a82951626516869.png', 1, '{\"access_token\":{\"title\":\"Access Token\",\"global\":true,\"value\":\"3Vee5S2F\"}}', '{\"USD\":\"USD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"AUD\":\"AUD\",\"NZD\":\"NZD\"}', 0, NULL, NULL, NULL, NULL, '2021-07-17 09:44:29');

-- --------------------------------------------------------

--
-- Table structure for table `gateway_currencies`
--

CREATE TABLE `gateway_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method_code` int(10) DEFAULT NULL,
  `gateway_alias` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `max_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `percent_charge` decimal(5,2) NOT NULL DEFAULT 0.00,
  `fixed_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_parameter` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sitename` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cur_text` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency text',
  `cur_sym` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency symbol',
  `email_from` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_template` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_api` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_color` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_color` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_config` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'email configuration',
  `sms_config` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email verification, 0 - dont check, 1 - check',
  `en` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email notification, 0 - dont send, 1 - send',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'sms verication, 0 - dont check, 1 - check',
  `sn` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'sms notification, 0 - dont send, 1 - send',
  `force_ssl` tinyint(1) NOT NULL DEFAULT 0,
  `secure_password` tinyint(1) NOT NULL DEFAULT 0,
  `agree` tinyint(1) NOT NULL DEFAULT 0,
  `registration` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Off	, 1: On',
  `active_template` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sys_version` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_cron_run` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `sitename`, `cur_text`, `cur_sym`, `email_from`, `email_template`, `sms_api`, `base_color`, `secondary_color`, `mail_config`, `sms_config`, `ev`, `en`, `sv`, `sn`, `force_ssl`, `secure_password`, `agree`, `registration`, `active_template`, `sys_version`, `last_cron_run`, `created_at`, `updated_at`) VALUES
(1, 'JobLab', 'USD', '$', 'do-not-reply@viserlab.com', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello {{fullname}} ({{username}})</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">{{message}}</td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Website Name</a> . All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'hi {{name}}, {{message}}', '16c79a', '14233c', '{\"name\":\"php\"}', '{\"clickatell_api_key\":\"----------------------------\",\"infobip_username\":\"--------------\",\"infobip_password\":\"----------------------\",\"message_bird_api_key\":\"-------------------\",\"nexmo_api_key\":\"----------------------\",\"nexmo_api_secret\":\"----------------------\",\"sms_broadcast_username\":\"----------------------\",\"sms_broadcast_password\":\"-----------------------------\",\"account_sid\":\"-----------------------\",\"auth_token\":\"---------------------------\",\"from\":\"----------------------\",\"text_magic_username\":\"-----------------------\",\"apiv2_key\":\"-------------------------------\",\"name\":\"textMagic\"}', 0, 1, 0, 0, 0, 0, 1, 1, 'basic', NULL, '2021-08-28 11:45:17', NULL, '2021-09-02 02:53:35');

-- --------------------------------------------------------

--
-- Table structure for table `industries`
--

CREATE TABLE `industries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Enable : 1, Disable : 2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `featured` tinyint(4) NOT NULL DEFAULT 0,
  `employer_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `shift_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `job_experience_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary_type` tinyint(1) DEFAULT 0 COMMENT 'negotiation : 1, Rang : 2',
  `salary_from` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `salary_to` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `salary_period` tinyint(1) NOT NULL DEFAULT 0,
  `vacancy` int(11) NOT NULL DEFAULT 0,
  `deadline` date DEFAULT NULL,
  `gender` tinyint(4) NOT NULL DEFAULT 0,
  `age` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `responsibilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requirements` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'pending : 0, Approved : 1, Cancel : 2, Expired : 3',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_applies`
--

CREATE TABLE `job_applies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '\r\nPending : 0 Approved : 1\r\nrejected: 2\r\n',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_experiences`
--

CREATE TABLE `job_experiences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Enable : 1, Disable : 2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_shifts`
--

CREATE TABLE `job_shifts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Enable : 1, Disable : 2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_skills`
--

CREATE TABLE `job_skills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Enable : 1, Disable : 2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_types`
--

CREATE TABLE `job_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Enable : 1, Disable : 2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_align` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: left to right text align, 1: right to left text align',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: not default language, 1: default language',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `icon`, `text_align`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', '5f15968db08911595250317.png', 0, 0, '2020-07-06 03:47:55', '2021-05-18 05:37:23'),
(5, 'Hindi', 'hn', NULL, 0, 0, '2020-12-29 02:20:07', '2020-12-29 02:20:16'),
(9, 'Bangla', 'bn', NULL, 0, 0, '2021-03-14 04:37:41', '2021-05-12 05:34:06');

-- --------------------------------------------------------

--
-- Table structure for table `level_of_education`
--

CREATE TABLE `level_of_education` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Enable : 1, Disable : 2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `city_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_06_14_061757_create_support_tickets_table', 3),
(5, '2020_06_14_061837_create_support_messages_table', 3),
(6, '2020_06_14_061904_create_support_attachments_table', 3),
(7, '2020_06_14_062359_create_admins_table', 3),
(8, '2020_06_14_064604_create_transactions_table', 4),
(9, '2020_06_14_065247_create_general_settings_table', 5),
(12, '2014_10_12_100000_create_password_resets_table', 6),
(13, '2020_06_14_060541_create_user_logins_table', 6),
(14, '2020_06_14_071708_create_admin_password_resets_table', 7),
(15, '2020_09_14_053026_create_countries_table', 8),
(16, '2021_03_15_084721_create_admin_notifications_table', 9),
(17, '2016_06_01_000001_create_oauth_auth_codes_table', 10),
(18, '2016_06_01_000002_create_oauth_access_tokens_table', 10),
(19, '2016_06_01_000003_create_oauth_refresh_tokens_table', 10),
(20, '2016_06_01_000004_create_oauth_clients_table', 10),
(21, '2016_06_01_000005_create_oauth_personal_access_clients_table', 10),
(22, '2021_05_08_103925_create_sms_gateways_table', 11),
(23, '2019_12_14_000001_create_personal_access_tokens_table', 12),
(24, '2021_05_23_111859_create_email_logs_table', 13),
(25, '2021_08_09_144120_create_job_types_table', 14),
(26, '2021_08_09_151336_create_cities_table', 15),
(27, '2021_08_09_151403_create_locations_table', 15),
(28, '2021_08_09_163843_create_job_shifts_table', 16),
(29, '2021_08_09_173038_create_job_skills_table', 17),
(30, '2021_08_09_175235_create_categories_table', 18),
(31, '2021_08_10_105428_create_job_experiences_table', 19),
(32, '2021_08_10_111450_create_degree_manages_table', 20),
(33, '2021_08_10_142200_create_employers_table', 21),
(34, '2021_08_10_165423_create_employer_password_resets_table', 22),
(35, '2021_08_11_115604_create_industries_table', 23),
(36, '2021_08_11_123142_create_number_of_employesses_table', 24),
(37, '2021_08_11_123455_create_number_of_employees_table', 25),
(38, '2021_08_11_153116_create_jobs_table', 26),
(39, '2021_08_11_161554_create_services_table', 27),
(40, '2021_08_11_161927_create_plans_table', 28),
(41, '2021_08_14_115501_create_orders_table', 29),
(42, '2021_08_17_123036_create_educational_qualifications_table', 30),
(44, '2021_08_17_123113_create_employment_histories_table', 31),
(45, '2021_08_17_151830_create_level_of_education_table', 32),
(46, '2021_08_17_151908_create_exam_or_degrees_table', 32),
(47, '2021_08_19_104653_create_salary_periods_table', 33),
(48, '2021_08_19_180323_create_favorite_items_table', 34),
(49, '2021_08_23_125340_create_job_applies_table', 35);

-- --------------------------------------------------------

--
-- Table structure for table `number_of_employees`
--

CREATE TABLE `number_of_employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employees` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Enable : 1, Disable : 2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `plan_id` int(11) NOT NULL,
  `employer_id` int(11) NOT NULL,
  `order_number` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(28,8) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Unpaid : 0, Paid : 1 Expired : 2\r\n',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tempname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'template name',
  `secs` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `tempname`, `secs`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'HOME', 'home', 'templates.basic.', '[\"latest_job\",\"feature\",\"feature_job\",\"cta\",\"package\",\"brand\",\"blog\"]', 1, '2020-07-11 06:23:58', '2021-08-28 06:00:04'),
(2, 'About', 'about-us', 'templates.basic.', '[\"cta\",\"package\",\"brand\"]', 0, '2020-07-11 06:35:35', '2021-08-22 09:13:06'),
(4, 'Job', 'job', 'templates.basic.', NULL, 1, '2020-10-22 01:14:43', '2020-10-22 01:14:43'),
(5, 'Company', 'companies', 'templates.basic.', '[\"faq\"]', 1, '2020-10-22 01:14:53', '2021-08-29 05:42:32'),
(12, 'Blog', 'blog', 'templates.basic.', '[\"brand\"]', 0, '2021-08-21 13:10:08', '2021-08-29 05:51:34'),
(13, 'Contact', 'contact', 'templates.basic.', NULL, 0, '2021-08-28 06:38:29', '2021-08-28 06:38:29');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `services` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `job_post` int(11) DEFAULT 0,
  `duration` int(11) NOT NULL,
  `icon` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Enable : 1, Disable : 2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_periods`
--

CREATE TABLE `salary_periods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Enable : 1 , Disable : 2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '"Enable : 1, Disable : 2"',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_attachments`
--

CREATE TABLE `support_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_message_id` int(10) UNSIGNED NOT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_messages`
--

CREATE TABLE `support_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supportticket_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `employer_id` int(11) DEFAULT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0: Open, 1: Answered, 2: Replied, 3: Closed',
  `priority` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = Low, 2 = medium, 3 = heigh',
  `last_reply` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employer_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `post_balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trx_type` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cv` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'contains full address',
  `designation` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skill` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `socialMedia` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `national_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `gender` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Male : 1 Female : 2',
  `married` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Devorced : 1, Married : 2, Separated : 3, Single : 4',
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: banned, 1: active',
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: email unverified, 1: email verified',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: sms unverified, 1: sms verified',
  `ver_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'stores verification code',
  `ver_code_send_at` datetime DEFAULT NULL COMMENT 'verification send time',
  `ts` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: 2fa off, 1: 2fa on',
  `tv` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: 2fa unverified, 1: 2fa verified',
  `tsc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `employer_id` int(11) DEFAULT NULL,
  `user_ip` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`,`username`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cities_city_unique` (`name`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `educational_qualifications`
--
ALTER TABLE `educational_qualifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_logs`
--
ALTER TABLE `email_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_sms_templates`
--
ALTER TABLE `email_sms_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employers`
--
ALTER TABLE `employers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fax` (`fax`),
  ADD UNIQUE KEY `username` (`username`,`email`,`mobile`);

--
-- Indexes for table `employer_password_resets`
--
ALTER TABLE `employer_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employment_histories`
--
ALTER TABLE `employment_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_or_degrees`
--
ALTER TABLE `exam_or_degrees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extensions`
--
ALTER TABLE `extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorite_items`
--
ALTER TABLE `favorite_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontends`
--
ALTER TABLE `frontends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `industries`
--
ALTER TABLE `industries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `industries_name_unique` (`name`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_applies`
--
ALTER TABLE `job_applies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_experiences`
--
ALTER TABLE `job_experiences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `job_shifts`
--
ALTER TABLE `job_shifts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `job_shifts_name_unique` (`name`);

--
-- Indexes for table `job_skills`
--
ALTER TABLE `job_skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_types`
--
ALTER TABLE `job_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `job_types_name_unique` (`name`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level_of_education`
--
ALTER TABLE `level_of_education`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `number_of_employees`
--
ALTER TABLE `number_of_employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `number_of_employees_employees_unique` (`employees`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plans_name_unique` (`name`);

--
-- Indexes for table `salary_periods`
--
ALTER TABLE `salary_periods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_attachments`
--
ALTER TABLE `support_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_messages`
--
ALTER TABLE `support_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `educational_qualifications`
--
ALTER TABLE `educational_qualifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_logs`
--
ALTER TABLE `email_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_sms_templates`
--
ALTER TABLE `email_sms_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

--
-- AUTO_INCREMENT for table `employers`
--
ALTER TABLE `employers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employer_password_resets`
--
ALTER TABLE `employer_password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employment_histories`
--
ALTER TABLE `employment_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_or_degrees`
--
ALTER TABLE `exam_or_degrees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extensions`
--
ALTER TABLE `extensions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `favorite_items`
--
ALTER TABLE `favorite_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frontends`
--
ALTER TABLE `frontends`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `industries`
--
ALTER TABLE `industries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_applies`
--
ALTER TABLE `job_applies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_experiences`
--
ALTER TABLE `job_experiences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_shifts`
--
ALTER TABLE `job_shifts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_skills`
--
ALTER TABLE `job_skills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_types`
--
ALTER TABLE `job_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `level_of_education`
--
ALTER TABLE `level_of_education`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `number_of_employees`
--
ALTER TABLE `number_of_employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_periods`
--
ALTER TABLE `salary_periods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_attachments`
--
ALTER TABLE `support_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_messages`
--
ALTER TABLE `support_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
