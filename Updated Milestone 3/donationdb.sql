-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2025 at 08:18 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `donationdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `DonationID` bigint(20) UNSIGNED NOT NULL,
  `DonorID` bigint(20) UNSIGNED NOT NULL,
  `Amount` decimal(12,2) NOT NULL,
  `Date` date NOT NULL,
  `PaymentMode` varchar(255) DEFAULT NULL,
  `Purpose` varchar(255) DEFAULT NULL,
  `Verified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `donations`
--

INSERT INTO `donations` (`DonationID`, `DonorID`, `Amount`, `Date`, `PaymentMode`, `Purpose`, `Verified`, `created_at`, `updated_at`) VALUES
(5, 5, 10000.00, '2025-06-29', 'Easypaisa', 'Hospital Fund', 0, '2025-06-29 11:28:20', '2025-06-29 11:28:20'),
(6, 5, 0.00, '2025-06-29', 'UBL', 'Verified via TRX 2481872', 1, '2025-06-29 11:56:22', '2025-06-29 11:56:22'),
(7, 6, 2000.00, '2025-06-29', 'JazzCash', 'Verified via TRX 12442453', 1, '2025-06-29 11:57:47', '2025-06-29 11:57:47'),
(8, 6, 144900.00, '2025-06-29', 'JazzCash', 'Verified via TRX 2392929', 1, '2025-06-29 12:03:42', '2025-06-29 12:03:42'),
(9, 6, 1999.00, '2025-06-29', 'JazzCash', 'Verified via TRX 39282473', 1, '2025-06-29 12:04:55', '2025-06-29 12:04:55'),
(10, 6, 138281.00, '2025-06-29', 'Meezan', 'Verified via TRX 181717372', 1, '2025-06-29 12:08:27', '2025-06-29 12:08:27'),
(11, 6, 1500.00, '2025-06-29', 'JazzCash', 'Verified via TRX 184727', 1, '2025-06-29 12:11:49', '2025-06-29 12:11:49'),
(12, 5, 10000.00, '2025-06-30', 'UBL', 'Verified via TRX 1244244', 1, '2025-06-30 10:28:37', '2025-06-30 10:28:37'),
(13, 5, 15000.00, '2025-06-30', 'Easypaisa', 'Verified via TRX 103284', 1, '2025-06-30 10:59:09', '2025-06-30 10:59:09'),
(14, 5, 193247.00, '2025-07-02', 'UBL', 'Verified via TRX 2842717', 1, '2025-07-02 06:07:37', '2025-07-02 06:07:37'),
(15, 6, 49284.00, '2025-07-02', 'UBL', 'Verified via TRX 382827472', 1, '2025-07-02 06:12:28', '2025-07-02 06:12:28');

-- --------------------------------------------------------

--
-- Table structure for table `donation_proof_pending`
--

CREATE TABLE `donation_proof_pending` (
  `ProofID` bigint(20) UNSIGNED NOT NULL,
  `DonorID` bigint(20) UNSIGNED NOT NULL,
  `Method` varchar(255) NOT NULL,
  `Amount` decimal(12,2) NOT NULL,
  `TRXID` varchar(255) NOT NULL,
  `FilePath` varchar(255) NOT NULL,
  `Status` enum('Pending','Approved','Rejected') NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `donation_proof_pending`
--

INSERT INTO `donation_proof_pending` (`ProofID`, `DonorID`, `Method`, `Amount`, `TRXID`, `FilePath`, `Status`, `created_at`, `updated_at`) VALUES
(1, 5, 'UBL', 1500.00, '2481872', 'uploads/1751216164_WhatsApp Image 2025-06-28 at 4.47.01 PM (1).jpeg', 'Approved', '2025-06-29 11:56:04', '2025-06-29 11:56:04'),
(2, 6, 'JazzCash', 2000.00, '12442453', 'uploads/1751216255_Mango anthracnose.jpg', 'Approved', '2025-06-29 11:57:35', '2025-06-29 11:57:35'),
(3, 6, 'JazzCash', 144900.00, '2392929', 'uploads/1751216609_WhatsApp Image 2025-06-28 at 4.47.01 PM (1).jpeg', 'Approved', '2025-06-29 12:03:29', '2025-06-29 12:03:29'),
(4, 6, 'JazzCash', 1999.00, '39282473', 'uploads/1751216685_Mango anthracnose.jpg', 'Approved', '2025-06-29 12:04:45', '2025-06-29 12:04:45'),
(5, 6, 'Meezan', 138281.00, '181717372', 'uploads/1751216887_Mango anthracnose.jpg', 'Approved', '2025-06-29 12:08:07', '2025-06-29 12:08:07'),
(6, 6, 'JazzCash', 1500.00, '184727', 'uploads/1751217102_Mango anthracnose.jpg', 'Approved', '2025-06-29 12:11:42', '2025-06-29 12:11:42'),
(7, 5, 'UBL', 10000.00, '1244244', 'uploads/1751297271_WhatsApp Image 2025-06-28 at 4.47.01 PM (1).jpeg', 'Approved', '2025-06-30 10:27:52', '2025-06-30 10:27:52'),
(8, 5, 'Easypaisa', 15000.00, '103284', 'uploads/1751299116_Mango anthracnose.jpg', 'Approved', '2025-06-30 10:58:36', '2025-06-30 10:58:36'),
(9, 5, 'UBL', 193247.00, '2842717', 'uploads/1751454416_WhatsApp Image 2025-07-02 at 12.49.16 AM.jpeg', 'Approved', '2025-07-02 06:06:56', '2025-07-02 06:06:56'),
(10, 6, 'UBL', 49284.00, '382827472', 'uploads/1751454675_WhatsApp Image 2025-07-02 at 12.49.16 AM.jpeg', 'Approved', '2025-07-02 06:11:15', '2025-07-02 06:11:15'),
(11, 6, 'Easypaisa', 2332.00, '1232455', 'uploads/1751455272_WhatsApp Image 2025-07-02 at 12.49.16 AM.jpeg', 'Pending', '2025-07-02 06:21:12', '2025-07-02 06:21:12');

-- --------------------------------------------------------

--
-- Table structure for table `donors`
--

CREATE TABLE `donors` (
  `DonorID` bigint(20) UNSIGNED NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Type` varchar(255) NOT NULL,
  `Contact_Info` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `donors`
--

INSERT INTO `donors` (`DonorID`, `Name`, `Email`, `Type`, `Contact_Info`, `created_at`, `updated_at`) VALUES
(5, 'Nouman Khan', 'khannouman083@gmail.com', 'Individual', '03149469046', '2025-06-29 11:27:57', '2025-06-29 11:27:57'),
(6, 'Nomii Khan', 'khannomii083@gmail.com', 'Individual', '03149469046', '2025-06-29 11:57:00', '2025-06-29 11:57:00'),
(7, 'SkillifyZone', 'skillifyzonepk@gmail.com', 'Organization', '03149469046', '2025-06-30 10:33:13', '2025-06-30 10:33:13'),
(8, 'Tariq Jamil', '22pwcse2184@uetpeshawar.edu.pk', 'Individual', '03123456789', '2025-06-30 10:57:00', '2025-06-30 10:57:00'),
(9, 'Farhan Khan', 'fk2742535@gmail.com', 'Individual', '03400993598', '2025-06-30 11:00:49', '2025-06-30 11:00:49');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fundraising_events`
--

CREATE TABLE `fundraising_events` (
  `EventID` bigint(20) UNSIGNED NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Date` date NOT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `Target_Amount` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fundraising_events`
--

INSERT INTO `fundraising_events` (`EventID`, `Name`, `Date`, `Location`, `Target_Amount`, `created_at`, `updated_at`) VALUES
(1, 'Annual Charity Gala', '2024-02-15', 'Grand Hotel Ballroom', 50000.00, '2025-06-29 11:03:23', '2025-06-29 11:03:23'),
(2, 'Community Fun Run', '2024-03-10', 'Central Park', 15000.00, '2025-06-29 11:03:23', '2025-06-29 11:03:23'),
(3, 'Art Auction', '2024-04-20', 'Art Gallery Downtown', 25000.00, '2025-06-29 11:03:23', '2025-06-29 11:03:23');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_06_29_135046_create_donors_table', 1),
(5, '2025_06_29_135049_create_donations_table', 1),
(6, '2025_06_29_135054_create_fundraising_events_table', 1),
(7, '2025_06_29_135107_create_volunteer_distribute_table', 1),
(8, '2025_06_29_135110_create_volunteer_eventstaff_table', 1),
(9, '2025_06_29_143955_create_donation_proof_pending_table', 1),
(10, '2025_06_29_155245_add_completion_fields_to_volunteer_tables', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('IEGeDRf7844bo35FoLPa7hslX4BWVyZece94g8YN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiS0hsQTFDRTFtaVF2eUtoTXQ4V216UmpIdWd5OHhTQW1Fam9hb092aiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi92ZXJpZnktZG9uYXRpb25zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMToiYWRtaW5fZW1haWwiO3M6MjE6ImFkbWluQGRvbmF0aW9uYXBwLmNvbSI7fQ==', 1751454753),
('kw1G2UjO736BA4iamAgOESXExYocovM3xD5nfUrs', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidWJPVU5jZTB0ZG43R0xZNWJERURUVnJDaEVzck1PN2RiWFJud1FaUSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6ODoiZG9ub3JfaWQiO2k6NTt9', 1751452787),
('NHScZLKCIdd944ABU1WtT0fIFJID1Yem7kC3QuhG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiM1VSa1gyelowMkRlWjVBVU8xTlZ6S3B4dGJSTkNYZU1FYUg3OXd1MCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kb25vci9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjExOiJhZG1pbl9lbWFpbCI7czoyMToiYWRtaW5AZG9uYXRpb25hcHAuY29tIjtzOjg6ImRvbm9yX2lkIjtpOjY7fQ==', 1751454526),
('VrXuqAoNRmjBgvRohkHmnZ4NzXtYciu9FIxUSi41', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUDdCSDluQVo3V0VXemFHdUh1dHFIcWlld1BxVXVXc3cyd1hoakp4USI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi92ZXJpZnktZG9uYXRpb25zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMToiYWRtaW5fZW1haWwiO3M6MjE6ImFkbWluQGRvbmF0aW9uYXBwLmNvbSI7fQ==', 1751455318),
('XZvRuWdO8bj7fuk6vVE2F6c8718MUPUzROPidEOX', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVVBrS2Q0MmV3SUowaFlYMTF2WWZualF5MGNjNVBrTUxzWk5ocjJwUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1751466830);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin User', 'admin@donationapp.com', NULL, '$2y$12$RaLM6E1dUcv6Tvsd9II8vOcM8lPaTUX2n8CH335OhzQBXf2oNmrFa', NULL, '2025-06-29 11:03:23', '2025-06-29 11:03:23'),
(4, 'Admin', 'admin@donationsystem.com', '2025-07-02 12:03:47', '$2a$12$kpN8sBJqnRf9xDHR0LrveegLHXWSqiMDOvF0QDGRDVyp3zjdO.xZC', NULL, '2025-07-02 12:03:47', '2025-07-02 12:03:47');

-- --------------------------------------------------------

--
-- Table structure for table `volunteer_distribute`
--

CREATE TABLE `volunteer_distribute` (
  `VolunteerDistID` bigint(20) UNSIGNED NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `DonationID` bigint(20) UNSIGNED NOT NULL,
  `Amount_Distributed` decimal(12,2) NOT NULL,
  `Task_Status` varchar(255) NOT NULL,
  `Date_Assigned` date NOT NULL,
  `LoginID` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `volunteer_distribute`
--

INSERT INTO `volunteer_distribute` (`VolunteerDistID`, `Name`, `Email`, `DonationID`, `Amount_Distributed`, `Task_Status`, `Date_Assigned`, `LoginID`, `created_at`, `updated_at`) VALUES
(4, 'Nouman Khan', '22pwcse2107@uetpeshawar.edu.pk', 7, 1500.00, 'Assigned', '2025-06-30', 'DIS-594', '2025-06-30 10:30:55', '2025-06-30 10:36:20');

-- --------------------------------------------------------

--
-- Table structure for table `volunteer_eventstaff`
--

CREATE TABLE `volunteer_eventstaff` (
  `VolunteerEvtID` bigint(20) UNSIGNED NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `EventID` bigint(20) UNSIGNED NOT NULL,
  `Task_Description` varchar(255) NOT NULL,
  `Role` varchar(255) NOT NULL DEFAULT 'Event Staff',
  `Task_Status` varchar(255) NOT NULL,
  `Date_Assigned` date NOT NULL,
  `LoginID` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `volunteer_eventstaff`
--

INSERT INTO `volunteer_eventstaff` (`VolunteerEvtID`, `Name`, `Email`, `EventID`, `Task_Description`, `Role`, `Task_Status`, `Date_Assigned`, `LoginID`, `created_at`, `updated_at`) VALUES
(1, 'Lisa Anderson', 'lisa.anderson@email.com', 1, 'Event coordination and guest management', 'Event Coordinator', 'Assigned', '2024-02-01', 'EVT-123', '2025-06-29 11:03:23', '2025-06-29 11:03:23'),
(2, 'Robert Taylor', 'robert.taylor@email.com', 2, 'Technical support and photography', 'Technical Support', 'Completed', '2024-03-01', 'EVT-456', '2025-06-29 11:03:23', '2025-06-29 11:03:23'),
(3, 'Nomii Khan', 'khannomii083@gmail.com', 1, 'Set up chairs', 'Event Staff', 'Assigned', '2025-06-29', 'EVT-863', '2025-06-29 11:29:55', '2025-06-29 11:30:44'),
(4, 'Nouman Khan', 'khannouman083@gmail.com', 1, 'Manage Guests', 'Event Staff', 'Assigned', '2025-06-30', 'EVT-271', '2025-06-30 10:45:30', '2025-06-30 10:45:30'),
(5, 'Nouman Khan', 'khannomii083@gmail.com', 3, 'Set up chairs', 'Event Staff', 'Assigned', '2025-06-30', 'EVT-247', '2025-06-30 10:47:47', '2025-06-30 10:47:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`DonationID`),
  ADD KEY `donations_donorid_foreign` (`DonorID`);

--
-- Indexes for table `donation_proof_pending`
--
ALTER TABLE `donation_proof_pending`
  ADD PRIMARY KEY (`ProofID`),
  ADD UNIQUE KEY `donation_proof_pending_trxid_unique` (`TRXID`),
  ADD KEY `donation_proof_pending_donorid_foreign` (`DonorID`);

--
-- Indexes for table `donors`
--
ALTER TABLE `donors`
  ADD PRIMARY KEY (`DonorID`),
  ADD UNIQUE KEY `donors_email_unique` (`Email`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fundraising_events`
--
ALTER TABLE `fundraising_events`
  ADD PRIMARY KEY (`EventID`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `volunteer_distribute`
--
ALTER TABLE `volunteer_distribute`
  ADD PRIMARY KEY (`VolunteerDistID`),
  ADD UNIQUE KEY `volunteer_distribute_loginid_unique` (`LoginID`),
  ADD KEY `volunteer_distribute_donationid_foreign` (`DonationID`);

--
-- Indexes for table `volunteer_eventstaff`
--
ALTER TABLE `volunteer_eventstaff`
  ADD PRIMARY KEY (`VolunteerEvtID`),
  ADD UNIQUE KEY `volunteer_eventstaff_loginid_unique` (`LoginID`),
  ADD KEY `volunteer_eventstaff_eventid_foreign` (`EventID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `DonationID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `donation_proof_pending`
--
ALTER TABLE `donation_proof_pending`
  MODIFY `ProofID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `donors`
--
ALTER TABLE `donors`
  MODIFY `DonorID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fundraising_events`
--
ALTER TABLE `fundraising_events`
  MODIFY `EventID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `volunteer_distribute`
--
ALTER TABLE `volunteer_distribute`
  MODIFY `VolunteerDistID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `volunteer_eventstaff`
--
ALTER TABLE `volunteer_eventstaff`
  MODIFY `VolunteerEvtID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `donations`
--
ALTER TABLE `donations`
  ADD CONSTRAINT `donations_donorid_foreign` FOREIGN KEY (`DonorID`) REFERENCES `donors` (`DonorID`) ON DELETE CASCADE;

--
-- Constraints for table `donation_proof_pending`
--
ALTER TABLE `donation_proof_pending`
  ADD CONSTRAINT `donation_proof_pending_donorid_foreign` FOREIGN KEY (`DonorID`) REFERENCES `donors` (`DonorID`) ON DELETE CASCADE;

--
-- Constraints for table `volunteer_distribute`
--
ALTER TABLE `volunteer_distribute`
  ADD CONSTRAINT `volunteer_distribute_donationid_foreign` FOREIGN KEY (`DonationID`) REFERENCES `donations` (`DonationID`) ON DELETE CASCADE;

--
-- Constraints for table `volunteer_eventstaff`
--
ALTER TABLE `volunteer_eventstaff`
  ADD CONSTRAINT `volunteer_eventstaff_eventid_foreign` FOREIGN KEY (`EventID`) REFERENCES `fundraising_events` (`EventID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
