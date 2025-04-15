-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2025 at 04:42 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_akademik`
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
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `nidn` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` text DEFAULT NULL,
  `no_hp` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`id`, `user_id`, `nidn`, `nama`, `alamat`, `no_hp`, `created_at`, `updated_at`) VALUES
(2, 10, '9876543210', 'Prof. Indah Lestari', 'Jl. Melati No. 5, Medan', '082345678901', '2025-04-11 08:19:12', '2025-04-11 08:19:12'),
(3, 11, '1234567890', 'Dr. Budi Santoso', 'Jl. Mawar No. 10, Jakarta', '081234567890', '2025-04-11 09:02:37', '2025-04-11 09:02:37'),
(5, 29, '1234987222', 'Prof. Ahmad Subakti', 'Jalan Merdeka', '989898888', '2025-04-13 00:38:39', '2025-04-13 00:38:39'),
(6, 30, '1234567891', 'Dr. Siti Aminah', 'Jl. Melati No. 21, Bandung', '081234567891', '2025-04-13 06:43:34', '2025-04-13 06:43:34'),
(7, 31, '1234567892', 'Dr. Agus Prasetyo', 'Jl. Kenanga No. 5, Surabaya', '081234567892', '2025-04-13 06:43:52', '2025-04-13 06:43:52'),
(8, 32, '1234567893', 'Dr. Lina Marlina', 'Jl. Anggrek No. 12, Medan', '081234567893', '2025-04-13 06:44:01', '2025-04-13 06:44:01'),
(9, 33, '1234567896', 'Bambang , M.Kom', 'Jl. Mawar Putih No. 7, Makassar', '081234567896', '2025-04-13 06:44:57', '2025-04-13 06:46:22'),
(10, 34, '1234567897', 'Nani Susanti, S.Kom', 'Jl. Bougenville No. 8, Palembang', '081234567897', '2025-04-13 06:45:02', '2025-04-13 06:45:02'),
(11, 35, '1234567898', 'Joko Widodo, M.Kom', 'Jl. Flamboyan No. 6, Balikpapan', '081234567898', '2025-04-13 06:45:07', '2025-04-13 06:45:07'),
(12, 36, '12345678999', 'Dewi Sartika, S.Kom', 'Jl. Cempaka No. 20, Malang', '081234567899', '2025-04-13 06:45:14', '2025-04-14 00:24:34'),
(13, 37, '12321232121', 'Bayu, S.Kom, M.Kom', 'Jalan Pahlawan', '0876545667', '2025-04-13 06:49:39', '2025-04-13 06:49:39'),
(15, 41, '12321232122', 'Ali , S.Kom', 'Jalan Medan Amplas', '0875665566', '2025-04-14 06:48:51', '2025-04-14 06:49:05');

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
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `nim` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_hp` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `user_id`, `nim`, `nama`, `alamat`, `no_hp`, `created_at`, `updated_at`) VALUES
(3, 6, '1234567814019', 'Steve Jone', 'Jl. Merdeka', '081234567890', '2025-04-11 03:57:49', '2025-04-13 07:19:05'),
(4, 7, '1234567814020', 'Gilbert', 'Jl. Merdeka Walk', '0812345678220', '2025-04-11 04:08:01', '2025-04-12 23:23:57'),
(6, 12, '1234567814021', 'KevinZong', 'Jl. City', '0812345999911', '2025-04-11 22:55:46', '2025-04-11 22:55:46'),
(9, 15, '1234567814022', 'Alicia Putri', 'Jl. Melati No. 5', '0812345999922', '2025-04-12 23:12:59', '2025-04-12 23:12:59'),
(10, 16, '1234567814023', 'Rizky Hadi', 'Jl. Kenanga No. 9', '0812345999933', '2025-04-12 23:13:17', '2025-04-12 23:13:17'),
(11, 17, '1234567814024', 'Siti Aminah', 'Jl. Mawar Indah', '0812345999944', '2025-04-12 23:13:29', '2025-04-12 23:13:29'),
(12, 18, '1234567814025', 'Dewi Anggraini', 'Jl. Anggrek Lestari', '0812345999955', '2025-04-12 23:13:41', '2025-04-12 23:13:41'),
(13, 19, '1234567814026', 'Afonso', 'Jalan Mabes', '08656562', '2025-04-12 23:14:39', '2025-04-12 23:24:21'),
(14, 20, '1234567814027', 'Budi Santoso', 'Jl. Merdeka No. 45', '0822345999956', '2025-04-12 23:26:13', '2025-04-12 23:26:13'),
(15, 21, '1234567814028', 'Andi Putra', 'Jl. Palem No. 29', '0842345999958', '2025-04-12 23:26:25', '2025-04-12 23:26:25'),
(16, 22, '1234567814029', 'Rina Oktaviani', 'Jl. Kenanga No. 15', '0852345999959', '2025-04-12 23:26:35', '2025-04-12 23:26:35'),
(17, 23, '1234567814030', 'Fajar Pratama', 'Jl. Semangka No. 12', '0862345999960', '2025-04-12 23:26:43', '2025-04-12 23:26:43'),
(18, 24, '1234567814031', 'Diana Sari', 'Jl. Mawar No. 10', '0872345999961', '2025-04-12 23:26:51', '2025-04-12 23:26:51'),
(19, 25, '1234567814032', 'Rafael Wijaya', 'Jl. Cempaka No. 7', '0882345999962', '2025-04-12 23:27:00', '2025-04-12 23:27:00'),
(20, 26, '1234567814033', 'Aulia Salsabila', 'Jl. Suka Maju No. 4', '0892345999963', '2025-04-12 23:27:09', '2025-04-12 23:27:09'),
(21, 27, '1234567814034', 'Fiki Pramudya', 'Jl. Pemuda No. 21', '0902345999964', '2025-04-12 23:27:15', '2025-04-13 08:22:00'),
(24, 43, '223303035422', 'Nelly', 'Jalan Kapten Musli', '09765767333', '2025-04-14 07:46:24', '2025-04-14 08:00:22');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa_mata_kuliah`
--

CREATE TABLE `mahasiswa_mata_kuliah` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mahasiswa_id` bigint(20) UNSIGNED NOT NULL,
  `mata_kuliah_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mahasiswa_mata_kuliah`
--

INSERT INTO `mahasiswa_mata_kuliah` (`id`, `mahasiswa_id`, `mata_kuliah_id`, `created_at`, `updated_at`) VALUES
(4, 4, 1, NULL, NULL),
(7, 6, 1, NULL, NULL),
(8, 6, 2, NULL, NULL),
(9, 6, 4, NULL, NULL),
(10, 6, 5, NULL, NULL),
(22, 4, 4, NULL, NULL),
(31, 4, 10, NULL, NULL),
(32, 11, 10, NULL, NULL),
(33, 4, 2, NULL, NULL),
(34, 6, 6, NULL, NULL),
(35, 3, 1, NULL, NULL),
(36, 3, 6, NULL, NULL),
(37, 3, 2, NULL, NULL),
(38, 3, 11, NULL, NULL),
(39, 3, 10, NULL, NULL),
(42, 9, 1, NULL, NULL),
(43, 9, 4, NULL, NULL),
(44, 10, 7, NULL, NULL),
(45, 3, 12, NULL, NULL),
(47, 13, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_matakuliah` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `sks` tinyint(3) UNSIGNED NOT NULL,
  `semester` tinyint(3) UNSIGNED NOT NULL,
  `dosen_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`id`, `kode_matakuliah`, `nama`, `sks`, `semester`, `dosen_id`, `created_at`, `updated_at`) VALUES
(1, 'IF101', 'Algoritma dan Pemrograman', 4, 6, 5, '2025-04-11 08:59:47', '2025-04-13 00:46:35'),
(2, 'IF202', 'Web Development', 3, 2, 2, '2025-04-11 09:04:20', '2025-04-13 21:50:24'),
(4, 'IF103', 'Machine Learning', 1, 3, 3, '2025-04-13 00:42:10', '2025-04-13 00:45:04'),
(5, 'IF104', 'Deep Learning', 7, 7, 5, '2025-04-13 06:27:42', '2025-04-13 06:39:37'),
(6, 'IF105', 'Data Structure', 4, 5, 11, '2025-04-13 06:47:30', '2025-04-13 21:49:33'),
(7, 'IF106', 'Jaringan Komputer', 2, 5, 12, '2025-04-13 06:48:13', '2025-04-13 07:19:18'),
(10, 'IF107', 'Full Stack', 2, 2, 8, '2025-04-13 21:49:19', '2025-04-13 21:49:19'),
(11, 'IF108', 'Software Development', 4, 4, 9, '2025-04-14 06:49:58', '2025-04-14 06:49:58');

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
(4, '2025_04_11_080445_create_mahasiswas_table', 2),
(5, '2025_04_11_090350_add_plain_password_to_users_table', 3),
(6, '2025_04_11_093737_create_personal_access_tokens_table', 4),
(7, '2025_04_11_133301_create_dosens_table', 5),
(8, '2025_04_11_152941_create_mata_kuliahs_table', 6);

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(105, 'App\\Models\\User', 42, 'api-token', 'a1c3677848dfa6d5d30971bbb67b0a25fac27bc809bb7f7c2a46a26f71058c1d', '[\"*\"]', '2025-04-14 07:40:08', NULL, '2025-04-14 07:34:53', '2025-04-14 07:40:08'),
(106, 'App\\Models\\User', 12, 'api-token', '5f6d49c715a3eddb45ab457b7172db50f5c9e95cc0d53baf98bb48b5b7b1de5f', '[\"*\"]', '2025-04-14 07:43:34', NULL, '2025-04-14 07:40:44', '2025-04-14 07:43:34'),
(109, 'App\\Models\\User', 1, 'api-token', '1d3ad8addef3fe9f9f608385693dc7b92256482657ab2cca56c7b6b2b013a560', '[\"*\"]', '2025-04-14 08:01:46', NULL, '2025-04-14 08:00:01', '2025-04-14 08:01:46');

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
('Ai4XAjOUh9IeO50xcjQxN1S51XlhuiGjjy3Y7hNL', NULL, '127.0.0.1', 'insomnia/11.0.2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaXpiajAwa25ReU5raDlIbld5ZHNrMXhXeWpvaFRkS1BGc2tqdlA3bCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1744447744),
('fORVWGdDCpuTVnNQD6j5W6sRnn7hQCTuNUJZBXhF', NULL, '127.0.0.1', 'insomnia/11.0.2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGpDZlc2S003UWxUN1BNRWZCYlQyMHFvQzJhS1BoVGxYUlNaTzI0RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1744365865),
('UlmMh1ryRu54SUzlIXsOzaebCvQIeWNUGXiuBHiC', NULL, '127.0.0.1', 'PostmanRuntime/7.40.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMVg0dTZ4Ylo0U0paaUlnR0s5eW1ac0laOGxDaHZLN3YxeFA0cXFrQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1744365877),
('wuPhGOLdQX84HGKdOCvkVRJL5kkOLLLFdnov9R6I', NULL, '127.0.0.1', 'PostmanRuntime/7.43.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTWJXcm9WNVlSRnpVelBTeG0wQm9RR2lQeDBYYTMwcnJsSWZZVEF0TCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1744447688);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `role` enum('admin','mahasiswa','dosen') NOT NULL DEFAULT 'mahasiswa',
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `plain_password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `role`, `password`, `remember_token`, `created_at`, `updated_at`, `plain_password`) VALUES
(1, 'Super Admin', 'devbert7@gmail.com', NULL, 'admin', '$2y$12$5f5QQWYaga2F422TlQH/meF6sjsKmX57hV/T26GewgEfNRrYOHbl6', NULL, '2025-04-11 01:01:43', '2025-04-11 01:01:43', NULL),
(6, 'Steve Jone', 'steve12@gmail.com', NULL, 'mahasiswa', '$2y$12$3NnLBSzbtvQF/webMrI43eeViUHSsJumcSmFZ7xQRZuJE4sL8qBaa', NULL, '2025-04-11 03:57:49', '2025-04-13 07:19:05', 'z4muJA38'),
(7, 'Gilbert', 'gilbert@gmail.com', NULL, 'mahasiswa', '$2y$12$x46U8Ozz4bwJ3osbJhAHI.NoeoQXNGspKiWHd5W.Vdl0sPUtd0wTu', NULL, '2025-04-11 04:08:01', '2025-04-14 00:16:51', 'gHIAkD1s'),
(10, 'Prof. Indah Lestari', 'indah.lestari@example.com', NULL, 'dosen', '$2y$12$Eeyd/5q24xDDoRbmhbWzvOIXkXrChrPXXht8vx6XfDluS.uYiFTga', NULL, '2025-04-11 08:19:12', '2025-04-11 08:19:12', 'CS0VrNcg'),
(11, 'Dr. Budi Santoso', 'budi.santoso@example.com', NULL, 'dosen', '$2y$12$JH3ei1tJJZMR2Jxn9dmCU.YhGnJKCKWm6IJmVGIVu/wnSdRs1sNJC', NULL, '2025-04-11 09:02:37', '2025-04-11 09:02:37', 'oCvcd2Mc'),
(12, 'KevinZong', 'kevin@gmail.com', NULL, 'mahasiswa', '$2y$12$4r/hGntHnuXm85JnzSQf9OASL6PGdnHBGxLEtF1AES05a6Ts3YMBa', NULL, '2025-04-11 22:55:46', '2025-04-11 22:55:46', 'cVQia9Qf'),
(15, 'Alicia Putri', 'alicia.putri@gmail.com', NULL, 'mahasiswa', '$2y$12$f5BMnKafb7ea3XL1wGouzu6uKb8V45Jl38NbPgrEy/QA/EP4QeBwe', NULL, '2025-04-12 23:12:59', '2025-04-12 23:12:59', 'dY86USZv'),
(16, 'Rizky Hadi', 'rizkyhadi@email.com', NULL, 'mahasiswa', '$2y$12$QBHCNqcnI1qrW5YExQg/HuhPl22E64FFul6Ia0N2nKQF1uMQKB2ti', NULL, '2025-04-12 23:13:17', '2025-04-12 23:13:17', 'fcgWtfrQ'),
(17, 'Siti Aminah', 'sitiaminah@yahoo.com', NULL, 'mahasiswa', '$2y$12$3tiuYj/9rdWoHVTT8STLzea9jlijUTIfw0EM2dSnPjVfBqitW4Kai', NULL, '2025-04-12 23:13:29', '2025-04-12 23:13:29', '2tGPo2lL'),
(18, 'Dewi Anggraini', 'dewi.anggraini@mail.com', NULL, 'mahasiswa', '$2y$12$OyBjxGG8iIvYBw8krkEQTejhYH8Ha4gLDhmUaqj/T.EMWR5jMD3iS', NULL, '2025-04-12 23:13:41', '2025-04-12 23:13:41', 'mELIFV4h'),
(19, 'Afonso', 'afonso@yahoo.co.id', NULL, 'mahasiswa', '$2y$12$mGNE26unckGI.JfeVM7sIOTgcwrtkM.w8/xmNa2Lm9wEyx266O4bK', NULL, '2025-04-12 23:14:39', '2025-04-12 23:14:39', '3bL5g0H8'),
(20, 'Budi Santoso', 'budi.santoso@mail.com', NULL, 'mahasiswa', '$2y$12$FNC7Yjtr0bxJewYMcJugM.WWeAoG3Fy/CJqQ10HAZqgyUId7eUlfm', NULL, '2025-04-12 23:26:13', '2025-04-12 23:26:13', 'gJ1GZtGO'),
(21, 'Andi Putra', 'andi.putra@mail.com', NULL, 'mahasiswa', '$2y$12$GQwBL5bEloS7OkcH78geSO5C1cPVhQE/LHM7U/WuIFRyjLnzAqMnu', NULL, '2025-04-12 23:26:25', '2025-04-12 23:26:25', 'G6kyl4VN'),
(22, 'Rina Oktaviani', 'rina.oktaviani@mail.com', NULL, 'mahasiswa', '$2y$12$V0k7ogxVgMH.uqbYF3ap..s6nV0XQlmf7ncDS10nWFz/o.Y68tENS', NULL, '2025-04-12 23:26:35', '2025-04-12 23:26:35', 'mq3ZJkIV'),
(23, 'Fajar Pratama', 'fajar.pratama@mail.com', NULL, 'mahasiswa', '$2y$12$vhIAXJ5fUi2tqO0F9Oj65OEdDkiJEe9.wDrdLdu/1wsYHDXPPvnhK', NULL, '2025-04-12 23:26:43', '2025-04-12 23:26:43', 'T7OwAVPx'),
(24, 'Diana Sari', 'diana.sari@mail.com', NULL, 'mahasiswa', '$2y$12$OGdJlVCyQz4kJQF3osgoxeb4czCG4WgtY0XDyLxfKOL9l.G3J4.ye', NULL, '2025-04-12 23:26:51', '2025-04-12 23:26:51', '2uP4rc8F'),
(25, 'Rafael Wijaya', 'rafael.wijaya@mail.com', NULL, 'mahasiswa', '$2y$12$f4vWcKMBS0JG6Syt42Qji.UCxBacQITNiyP7F8od0ipdXg4ovVEQi', NULL, '2025-04-12 23:27:00', '2025-04-12 23:27:00', 'q5ykqdIt'),
(26, 'Aulia Salsabila', 'aulia.salsabila@mail.com', NULL, 'mahasiswa', '$2y$12$dqBzG5rX.y/1fA93t2ZOx./VqVzpw2bfjDpYnJu9RTDAU1edBv3SS', NULL, '2025-04-12 23:27:09', '2025-04-12 23:27:09', 'lW7qwqhT'),
(27, 'Fiki Pramudya', 'fiki.pramudya@mail.com', NULL, 'mahasiswa', '$2y$12$iTkZKA09wlB7Qhftk77Erev4dHCgLzSr/irzic0L60Ce2TpRIc4.y', NULL, '2025-04-12 23:27:15', '2025-04-13 08:22:00', 'YQsja60a'),
(29, 'Prof. Ahmad Subakti', 'ahmad@gmail.com', NULL, 'dosen', '$2y$12$CI4U7tvuG8GYjTXhgX0eU.Lr1JiY71B8FL4i4uVG5HrWtt.EP3UXS', NULL, '2025-04-13 00:38:39', '2025-04-13 00:38:39', '9Aa4QQfa'),
(30, 'Dr. Siti Aminah', 'siti.aminah@example.com', NULL, 'dosen', '$2y$12$kXhM32b.UjiX8fL7OAKK5OgtUmf.imCOec8MW9/S/WfqotGPu7Ite', NULL, '2025-04-13 06:43:34', '2025-04-13 06:43:34', '915zypgn'),
(31, 'Dr. Agus Prasetyo', 'agus.prasetyo@example.com', NULL, 'dosen', '$2y$12$QTww2bapQ1FryTOvcXOMkuFh9figBIG3QmUjzbEJbQfQWu3ezj8n2', NULL, '2025-04-13 06:43:52', '2025-04-13 06:43:52', 'Jua6IwM7'),
(32, 'Dr. Lina Marlina', 'lina.marlina@example.com', NULL, 'dosen', '$2y$12$skyk/Kyn1/pvUXvl5RjB9evy2Q1ySwrB.YL/fUZn2dWZZLrNtXZ4u', NULL, '2025-04-13 06:44:01', '2025-04-13 06:44:01', 'j2K1dLZg'),
(33, 'Bambang , M.Kom', 'bambang.hermanto@example.com', NULL, 'dosen', '$2y$12$BDj7pBpyYB3UmKo3BZyfyeoSMpD5rEIB7/Oph6qULjkIbrpnsmcui', NULL, '2025-04-13 06:44:57', '2025-04-13 06:46:22', 'MvVt5FTU'),
(34, 'Nani Susanti, S.Kom', 'nani.susanti@example.com', NULL, 'dosen', '$2y$12$82HXjcUYAAzHiRqSmcROuuENQcTt8NJOJobIdEhxSnT33JHbm6k9u', NULL, '2025-04-13 06:45:02', '2025-04-13 06:45:02', 'ziGqUgyH'),
(35, 'Joko Widodo, M.Kom', 'joko.widodo@example.com', NULL, 'dosen', '$2y$12$5a9k3sBw.8z/rL2meMkpqOcNAEJxKhUpaHbCgMfeLSVEUTPbRsw/m', NULL, '2025-04-13 06:45:07', '2025-04-13 06:45:07', 'nMlaKYpw'),
(36, 'Dewi Sartika, S.Kom', 'dewi.sartika@example.com', NULL, 'dosen', '$2y$12$1MBniisaos5SzuYeDuNxWeXcXItRUfkXhkRwXZXjTfQE8eHJT1vau', NULL, '2025-04-13 06:45:14', '2025-04-13 06:45:14', '2UGyF1ox'),
(37, 'Bayu, S.Kom, M.Kom', 'bayu@gmail.com', NULL, 'dosen', '$2y$12$S.PvOi7L1SSP/7iz314Ar.ri0AuLk2uOh4GlarJVakNw7Mw3p27fC', NULL, '2025-04-13 06:49:39', '2025-04-13 06:49:39', 'oXyDVWcv'),
(41, 'Ali , S.Kom', 'ali@gmail.com', NULL, 'dosen', '$2y$12$d9qT.AarGcYoLrsVSHd3CuZV2fKBd/nuSmusUr.Hsm6MHp9yX3yxG', NULL, '2025-04-14 06:48:51', '2025-04-14 06:48:51', 'iIolszcu'),
(42, 'Super Admin 2', 'khowilbert@gmail.com', NULL, 'admin', '$2y$12$B9.9l3ajAgRoB4uuZuNFFeIFbAE/lWYZ.K6osev3aPKII.WmVGM9i', NULL, '2025-04-14 07:30:04', '2025-04-14 07:30:04', NULL),
(43, 'Nelly', 'fajar@yahoo.com', NULL, 'mahasiswa', '$2y$12$YiCPr5XAbXs8fGDM3FzHsuJOTfKmx8Y5oj7cFT9gfiPNJO5SmaJ9O', NULL, '2025-04-14 07:46:24', '2025-04-14 08:00:22', 'WgmZNqXJ');

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
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dosen_nidn_unique` (`nidn`),
  ADD KEY `dosen_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mahasiswa_nim_unique` (`nim`),
  ADD KEY `mahasiswa_user_id_foreign` (`user_id`);

--
-- Indexes for table `mahasiswa_mata_kuliah`
--
ALTER TABLE `mahasiswa_mata_kuliah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mata_kuliah_kode_matakuliah_unique` (`kode_matakuliah`),
  ADD KEY `mata_kuliah_dosen_id_foreign` (`dosen_id`);

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
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dosen`
--
ALTER TABLE `dosen`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `mahasiswa_mata_kuliah`
--
ALTER TABLE `mahasiswa_mata_kuliah`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `dosen_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD CONSTRAINT `mata_kuliah_dosen_id_foreign` FOREIGN KEY (`dosen_id`) REFERENCES `dosen` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
