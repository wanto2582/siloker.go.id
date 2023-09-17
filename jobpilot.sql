-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 20 Agu 2023 pada 13.26
-- Versi server: 8.0.30
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jobpilot`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `abouts`
--

CREATE TABLE `abouts` (
  `id` bigint UNSIGNED NOT NULL,
  `about_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `about_sub_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `about_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `about_brand_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'frontend/assets/images/all-img/brand-1.png',
  `about_brand_logo1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'frontend/assets/images/all-img/brand-2.png',
  `about_brand_logo2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'frontend/assets/images/all-img/brand-3.png',
  `about_brand_logo3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'frontend/assets/images/all-img/brand-1.png',
  `about_brand_logo4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'frontend/assets/images/all-img/brand-2.png',
  `about_brand_logo5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'frontend/assets/images/all-img/brand-3.png',
  `about_banner_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'frontend/assets/images/banner/about-banner-1.jpg',
  `about_banner_img1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'frontend/assets/images/banner/about-banner-1.jpg',
  `about_banner_img2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'frontend/assets/images/banner/about-banner-1.jpg',
  `about_banner_img3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'frontend/assets/images/banner/about-banner-1.jpg',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'backend/image/default.png',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@mail.com', '2023-02-24 04:43:20', '$2y$10$PRdZOp4DEIoVijQLwb5N1uurbILuQ9jBjVb3MC1Yod3NiMYVKnyPy', 'backend/image/default.png', 'FxlX7lUQtFWqeLows53dGfss8XKESB9kstJaTEEHlD7VyLp6zEZHrZ7IFQ29', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(2, 'Admin', 'naker.tapsel@gmail.com', NULL, '$2y$10$S5KFx5HdBYdS37cVwPL59e0Ksf.vDmGYq24PkKF4WGg7iUaC9VuQm', 'uploads/user/1692517379_64e1c40323d9d.png', NULL, '2023-08-20 00:42:59', '2023-08-20 00:42:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin_searches`
--

CREATE TABLE `admin_searches` (
  `id` bigint UNSIGNED NOT NULL,
  `page_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `application_groups`
--

CREATE TABLE `application_groups` (
  `id` bigint UNSIGNED NOT NULL,
  `company_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` smallint NOT NULL DEFAULT '0',
  `is_deleteable` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `application_groups`
--

INSERT INTO `application_groups` (`id`, `company_id`, `name`, `order`, `is_deleteable`, `created_at`, `updated_at`) VALUES
(1, 1, 'No Group', 1, 0, '2023-08-20 05:41:11', '2023-08-20 05:41:11'),
(2, 1, 'All Applications', 1, 1, '2023-08-20 05:41:11', '2023-08-20 05:41:11'),
(3, 1, 'Shortlisted', 2, 1, '2023-08-20 05:41:11', '2023-08-20 05:41:11'),
(4, 1, 'Interview', 3, 1, '2023-08-20 05:41:11', '2023-08-20 05:41:11'),
(5, 1, 'Rejected', 4, 1, '2023-08-20 05:41:11', '2023-08-20 05:41:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `applied_jobs`
--

CREATE TABLE `applied_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `candidate_id` bigint UNSIGNED NOT NULL,
  `job_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `candidate_resume_id` bigint UNSIGNED NOT NULL,
  `cover_letter` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `application_group_id` bigint UNSIGNED NOT NULL,
  `order` smallint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `applied_jobs`
--

INSERT INTO `applied_jobs` (`id`, `candidate_id`, `job_id`, `created_at`, `updated_at`, `candidate_resume_id`, `cover_letter`, `application_group_id`, `order`) VALUES
(1, 1, 1, '2023-08-20 06:59:35', '2023-08-20 07:01:18', 1, 'asdasd', 3, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `benefits`
--

CREATE TABLE `benefits` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `benefits`
--

INSERT INTO `benefits` (`id`, `created_at`, `updated_at`) VALUES
(17, '2023-08-20 05:59:52', '2023-08-20 05:59:52'),
(18, '2023-08-20 06:00:05', '2023-08-20 06:00:05'),
(19, '2023-08-20 06:00:40', '2023-08-20 06:00:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `benefit_translations`
--

CREATE TABLE `benefit_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `benefit_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `benefit_translations`
--

INSERT INTO `benefit_translations` (`id`, `benefit_id`, `name`, `locale`, `created_at`, `updated_at`) VALUES
(17, 17, 'BPJS', 'id', '2023-08-20 05:59:52', '2023-08-20 05:59:52'),
(18, 17, 'BPJS', 'en', '2023-08-20 05:59:52', '2023-08-20 05:59:52'),
(19, 18, 'Asuransi', 'id', '2023-08-20 06:00:05', '2023-08-20 06:00:05'),
(20, 18, 'Assurance', 'en', '2023-08-20 06:00:05', '2023-08-20 06:00:05'),
(21, 19, 'Tunjangan Jabatan', 'id', '2023-08-20 06:00:40', '2023-08-20 06:00:40'),
(22, 19, 'Positional Allowance', 'en', '2023-08-20 06:00:40', '2023-08-20 06:00:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bookmark_candidate_company`
--

CREATE TABLE `bookmark_candidate_company` (
  `id` bigint UNSIGNED NOT NULL,
  `candidate_id` bigint UNSIGNED NOT NULL,
  `company_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bookmark_candidate_job`
--

CREATE TABLE `bookmark_candidate_job` (
  `id` bigint UNSIGNED NOT NULL,
  `candidate_id` bigint UNSIGNED NOT NULL,
  `job_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bookmark_company`
--

CREATE TABLE `bookmark_company` (
  `id` bigint UNSIGNED NOT NULL,
  `company_id` bigint UNSIGNED NOT NULL,
  `candidate_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bookmark_company_category`
--

CREATE TABLE `bookmark_company_category` (
  `id` bigint UNSIGNED NOT NULL,
  `bookmark_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `candidates`
--

CREATE TABLE `candidates` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `profession_id` bigint UNSIGNED DEFAULT NULL,
  `experience_id` bigint UNSIGNED DEFAULT NULL,
  `education_id` bigint UNSIGNED DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('male','female','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cv` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `marital_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_date` datetime DEFAULT NULL,
  `visibility` tinyint(1) NOT NULL DEFAULT '1',
  `cv_visibility` tinyint(1) NOT NULL DEFAULT '1',
  `received_job_alert` tinyint(1) NOT NULL DEFAULT '1',
  `profile_complete` int NOT NULL DEFAULT '100',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `neighborhood` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locality` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long` double DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `status` enum('available','not_available','available_in') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'available',
  `available_in` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `candidates`
--

INSERT INTO `candidates` (`id`, `user_id`, `role_id`, `profession_id`, `experience_id`, `education_id`, `title`, `gender`, `website`, `photo`, `cv`, `bio`, `marital_status`, `birth_date`, `visibility`, `cv_visibility`, `received_job_alert`, `profile_complete`, `created_at`, `updated_at`, `address`, `neighborhood`, `locality`, `place`, `district`, `postcode`, `region`, `country`, `long`, `lat`, `status`, `available_in`) VALUES
(1, 1, 2, 12, 3, 3, NULL, 'male', NULL, NULL, NULL, NULL, 'married', '1994-06-26 00:00:00', 1, 1, 1, 0, '2023-08-20 05:24:35', '2023-08-20 06:58:48', 'west-java-indonesia', '', '', 'undefined', 'undefined', '', 'West Java', 'Indonesia', 106.78051751106979, -6.850077654785543, 'available', '1970-01-01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `candidate_cv_views`
--

CREATE TABLE `candidate_cv_views` (
  `id` bigint UNSIGNED NOT NULL,
  `company_id` bigint UNSIGNED NOT NULL,
  `candidate_id` bigint UNSIGNED NOT NULL,
  `view_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `candidate_education`
--

CREATE TABLE `candidate_education` (
  `id` bigint UNSIGNED NOT NULL,
  `candidate_id` bigint UNSIGNED NOT NULL,
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `degree` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `candidate_education`
--

INSERT INTO `candidate_education` (`id`, `candidate_id`, `level`, `degree`, `year`, `notes`, `created_at`, `updated_at`) VALUES
(1, 1, 'Univ. Pakuan', 'S1', 2016, 'asdasd', '2023-08-20 06:59:14', '2023-08-20 06:59:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `candidate_experiences`
--

CREATE TABLE `candidate_experiences` (
  `id` bigint UNSIGNED NOT NULL,
  `candidate_id` bigint UNSIGNED NOT NULL,
  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` date NOT NULL,
  `end` date DEFAULT NULL,
  `responsibilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currently_working` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `candidate_experiences`
--

INSERT INTO `candidate_experiences` (`id`, `candidate_id`, `company`, `department`, `designation`, `start`, `end`, `responsibilities`, `created_at`, `updated_at`, `currently_working`) VALUES
(1, 1, 'PT. TOKO PANDAI NUSANTARA', 'Toko Pandai', 'Toko Pandai', '2023-08-01', NULL, 'asdasd', '2023-08-20 06:57:25', '2023-08-20 06:57:25', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `candidate_language`
--

CREATE TABLE `candidate_language` (
  `id` bigint UNSIGNED NOT NULL,
  `candidate_id` bigint UNSIGNED NOT NULL,
  `candidate_language_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `candidate_language`
--

INSERT INTO `candidate_language` (`id`, `candidate_id`, `candidate_language_id`, `created_at`, `updated_at`) VALUES
(1, 1, 63, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `candidate_languages`
--

CREATE TABLE `candidate_languages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `candidate_languages`
--

INSERT INTO `candidate_languages` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Abkhaz', 'abkhaz', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(2, 'Afar', 'afar', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(3, 'Afrikaans', 'afrikaans', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(4, 'Akan', 'akan', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(5, 'Albanian', 'albanian', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(6, 'Amharic', 'amharic', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(7, 'Arabic', 'arabic', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(8, 'Aragonese', 'aragonese', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(9, 'Armenian', 'armenian', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(10, 'Assamese', 'assamese', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(11, 'Avaric', 'avaric', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(12, 'Avestan', 'avestan', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(13, 'Aymara', 'aymara', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(14, 'Azerbaijani', 'azerbaijani', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(15, 'Bambara', 'bambara', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(16, 'Bashkir', 'bashkir', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(17, 'Basque', 'basque', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(18, 'Belarusian', 'belarusian', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(19, 'Bengali', 'bengali', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(20, 'Bihari', 'bihari', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(21, 'Bislama', 'bislama', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(22, 'Bosnian', 'bosnian', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(23, 'Breton', 'breton', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(24, 'Bulgarian', 'bulgarian', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(25, 'Burmese', 'burmese', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(26, 'Catalan; Valencian', 'catalan-valencian', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(27, 'Chamorro', 'chamorro', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(28, 'Chechen', 'chechen', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(29, 'Chichewa; Chewa; Nyanja', 'chichewa-chewa-nyanja', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(30, 'Chinese', 'chinese', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(31, 'Chuvash', 'chuvash', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(32, 'Cornish', 'cornish', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(33, 'Corsican', 'corsican', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(34, 'Cree', 'cree', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(35, 'Croatian', 'croatian', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(36, 'Czech', 'czech', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(37, 'Danish', 'danish', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(38, 'Divehi; Dhivehi; Maldivian;', 'divehi-dhivehi-maldivian', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(39, 'Dutch', 'dutch', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(40, 'Esperanto', 'esperanto', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(41, 'Estonian', 'estonian', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(42, 'Ewe', 'ewe', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(43, 'Faroese', 'faroese', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(44, 'Fijian', 'fijian', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(45, 'Finnish', 'finnish', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(46, 'French', 'french', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(47, 'Fula; Fulah; Pulaar; Pular', 'fula-fulah-pulaar-pular', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(48, 'Galician', 'galician', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(49, 'Georgian', 'georgian', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(50, 'German', 'german', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(51, 'Greek, Modern', 'greek-modern', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(52, 'Guaraní', 'guarani', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(53, 'Gujarati', 'gujarati', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(54, 'Haitian; Haitian Creole', 'haitian-haitian-creole', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(55, 'Hausa', 'hausa', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(56, 'Hebrew', 'hebrew', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(57, 'Hebrew', 'hebrew', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(58, 'Herero', 'herero', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(59, 'Hindi', 'hindi', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(60, 'Hiri Motu', 'hiri-motu', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(61, 'Hungarian', 'hungarian', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(62, 'Interlingua', 'interlingua', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(63, 'Indonesian', 'indonesian', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(64, 'Interlingue', 'interlingue', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(65, 'Irish', 'irish', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(66, 'Igbo', 'igbo', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(67, 'Inupiaq', 'inupiaq', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(68, 'Ido', 'ido', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(69, 'Icelandic', 'icelandic', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(70, 'Italian', 'italian', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(71, 'Inuktitut', 'inuktitut', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(72, 'Japanese', 'japanese', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(73, 'Javanese', 'javanese', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(74, 'Kalaallisut, Greenlandic', 'kalaallisut-greenlandic', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(75, 'Kannada', 'kannada', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(76, 'Kanuri', 'kanuri', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(77, 'Kashmiri', 'kashmiri', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(78, 'Kazakh', 'kazakh', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(79, 'Khmer', 'khmer', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(80, 'Kikuyu, Gikuyu', 'kikuyu-gikuyu', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(81, 'Kinyarwanda', 'kinyarwanda', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(82, 'Kirghiz, Kyrgyz', 'kirghiz-kyrgyz', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(83, 'Komi', 'komi', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(84, 'Kongo', 'kongo', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(85, 'Korean', 'korean', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(86, 'Kurdish', 'kurdish', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(87, 'Kwanyama, Kuanyama', 'kwanyama-kuanyama', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(88, 'Latin', 'latin', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(89, 'Luxembourgish, Letzeburgesch', 'luxembourgish-letzeburgesch', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(90, 'Luganda', 'luganda', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(91, 'Limburgish, Limburgan, Limburger', 'limburgish-limburgan-limburger', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(92, 'Lingala', 'lingala', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(93, 'Lao', 'lao', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(94, 'Lithuanian', 'lithuanian', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(95, 'Luba-Katanga', 'luba-katanga', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(96, 'Latvian', 'latvian', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(97, 'Manx', 'manx', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(98, 'Macedonian', 'macedonian', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(99, 'Malagasy', 'malagasy', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(100, 'Malay', 'malay', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(101, 'Malayalam', 'malayalam', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(102, 'Maltese', 'maltese', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(103, 'Māori', 'maori', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(104, 'Marathi (Marāṭhī)', 'marathi-marathi', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(105, 'Marshallese', 'marshallese', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(106, 'Mongolian', 'mongolian', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(107, 'Nauru', 'nauru', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(108, 'Navajo, Navaho', 'navajo-navaho', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(109, 'Norwegian Bokmål', 'norwegian-bokmal', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(110, 'North Ndebele', 'north-ndebele', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(111, 'Nepali', 'nepali', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(112, 'Ndonga', 'ndonga', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(113, 'Norwegian Nynorsk', 'norwegian-nynorsk', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(114, 'Norwegian', 'norwegian', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(115, 'Nuosu', 'nuosu', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(116, 'South Ndebele', 'south-ndebele', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(117, 'Occitan', 'occitan', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(118, 'Ojibwe, Ojibwa', 'ojibwe-ojibwa', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(119, 'Old Church Slavonic, Church Slavic, Church Slavonic, Old Bulgarian, Old Slavonic', 'old-church-slavonic-church-slavic-church-slavonic-old-bulgarian-old-slavonic', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(120, 'Oromo', 'oromo', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(121, 'Oriya', 'oriya', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(122, 'Ossetian, Ossetic', 'ossetian-ossetic', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(123, 'Panjabi, Punjabi', 'panjabi-punjabi', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(124, 'Pāli', 'pali', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(125, 'Persian', 'persian', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(126, 'Polish', 'polish', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(127, 'Pashto, Pushto', 'pashto-pushto', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(128, 'Portuguese', 'portuguese', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(129, 'Quechua', 'quechua', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(130, 'Romansh', 'romansh', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(131, 'Kirundi', 'kirundi', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(132, 'Romanian, Moldavian, Moldovan', 'romanian-moldavian-moldovan', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(133, 'Russian', 'russian', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(134, 'Sanskrit (Saṁskṛta)', 'sanskrit-saskta', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(135, 'Sardinian', 'sardinian', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(136, 'Sindhi', 'sindhi', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(137, 'Northern Sami', 'northern-sami', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(138, 'Samoan', 'samoan', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(139, 'Sango', 'sango', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(140, 'Serbian', 'serbian', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(141, 'Scottish Gaelic; Gaelic', 'scottish-gaelic-gaelic', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(142, 'Shona', 'shona', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(143, 'Sinhala, Sinhalese', 'sinhala-sinhalese', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(144, 'Slovak', 'slovak', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(145, 'Slovene', 'slovene', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(146, 'Somali', 'somali', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(147, 'Southern Sotho', 'southern-sotho', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(148, 'Spanish; Castilian', 'spanish-castilian', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(149, 'Sundanese', 'sundanese', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(150, 'Swahili', 'swahili', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(151, 'Swati', 'swati', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(152, 'Swedish', 'swedish', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(153, 'Tamil', 'tamil', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(154, 'Telugu', 'telugu', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(155, 'Tajik', 'tajik', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(156, 'Thai', 'thai', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(157, 'Tigrinya', 'tigrinya', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(158, 'Tibetan Standard, Tibetan, Central', 'tibetan-standard-tibetan-central', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(159, 'Turkmen', 'turkmen', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(160, 'Tagalog', 'tagalog', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(161, 'Tswana', 'tswana', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(162, 'Tonga (Tonga Islands)', 'tonga-tonga-islands', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(163, 'Turkish', 'turkish', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(164, 'Tsonga', 'tsonga', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(165, 'Tatar', 'tatar', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(166, 'Twi', 'twi', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(167, 'Tahitian', 'tahitian', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(168, 'Uighur, Uyghur', 'uighur-uyghur', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(169, 'Ukrainian', 'ukrainian', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(170, 'Urdu', 'urdu', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(171, 'Uzbek', 'uzbek', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(172, 'Venda', 'venda', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(173, 'Vietnamese', 'vietnamese', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(174, 'Volapük', 'volapuk', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(175, 'Walloon', 'walloon', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(176, 'Welsh', 'welsh', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(177, 'Wolof', 'wolof', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(178, 'Western Frisian', 'western-frisian', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(179, 'Xhosa', 'xhosa', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(180, 'Yiddish', 'yiddish', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(181, 'Yoruba', 'yoruba', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(182, 'Zhuang, Chuang', 'zhuang-chuang', '2023-02-24 04:43:21', '2023-02-24 04:43:21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `candidate_resumes`
--

CREATE TABLE `candidate_resumes` (
  `id` bigint UNSIGNED NOT NULL,
  `candidate_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `candidate_resumes`
--

INSERT INTO `candidate_resumes` (`id`, `candidate_id`, `name`, `file`, `created_at`, `updated_at`) VALUES
(1, 1, 'Cv Saya', 'uploads/file/candidates\\GDD7eYrsn6UUdX7xz3krWjsv6ROgNTHqF44nxtxC.pdf', '2023-08-20 05:36:55', '2023-08-20 05:36:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `candidate_skill`
--

CREATE TABLE `candidate_skill` (
  `id` bigint UNSIGNED NOT NULL,
  `candidate_id` bigint UNSIGNED NOT NULL,
  `skill_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `candidate_skill`
--

INSERT INTO `candidate_skill` (`id`, `candidate_id`, `skill_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 3, NULL, NULL),
(3, 1, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cities`
--

CREATE TABLE `cities` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` bigint UNSIGNED NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms`
--

CREATE TABLE `cms` (
  `id` bigint UNSIGNED NOT NULL,
  `about_brand_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_brand_logo1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_brand_logo2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_brand_logo3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_brand_logo4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_brand_logo5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_banner_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_banner_img1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_banner_img2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_banner_img3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mission_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `candidate_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employers_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_map` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `register_page_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_page_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_page_banner_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page403_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page404_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page500_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page503_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comingsoon_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_phone_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `footer_facebook_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_instagram_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_twitter_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_youtube_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privary_page` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `terms_page` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `refund_page` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `maintenance_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `cms`
--

INSERT INTO `cms` (`id`, `about_brand_logo`, `about_brand_logo1`, `about_brand_logo2`, `about_brand_logo3`, `about_brand_logo4`, `about_brand_logo5`, `about_banner_img`, `about_banner_img1`, `about_banner_img2`, `about_banner_img3`, `mission_image`, `candidate_image`, `employers_image`, `contact_map`, `register_page_image`, `login_page_image`, `home_page_banner_image`, `page403_image`, `page404_image`, `page500_image`, `page503_image`, `comingsoon_image`, `footer_phone_no`, `footer_address`, `footer_facebook_link`, `footer_instagram_link`, `footer_twitter_link`, `footer_youtube_link`, `privary_page`, `terms_page`, `refund_page`, `maintenance_image`, `created_at`, `updated_at`) VALUES
(1, 'frontend/assets/images/all-img/brand-1.png', 'frontend/assets/images/all-img/brand-2.png', 'frontend/assets/images/all-img/brand-1.png', 'frontend/assets/images/all-img/brand-2.png', 'frontend/assets/images/all-img/brand-1.png', 'frontend/assets/images/all-img/brand-2.png', 'frontend/assets/images/banner/about-banner-1.jpg', 'frontend/assets/images/banner/about-banner-2.jpg', 'frontend/assets/images/banner/about-banner-3.jpg', 'frontend/assets/images/banner/about-banner-4.jpg', 'frontend/assets/images/banner/about-banner-5.png', 'frontend/assets/images/all-img/cta-1.png', 'frontend/assets/images/all-img/cta-2.png', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3651.2278794778554!2d90.34898411536302!3d23.77489829375602!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c1e1938cc90b%3A0xbcfacb6b89117685!2sZakir%20Soft%20-%20Innovative%20Software%20%26%20Web%20Development%20Solutions!5e0!3m2!1sen!2sbd!4v1629355846404!5m2!1sen!2sbd\" width=\"100%\" height=\"536\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\"></iframe>', 'frontend/assets/images/all-img/auth-img.png', 'frontend/assets/images/all-img/auth-img.png', NULL, 'frontend/assets/images/banner/error-banner.png', 'frontend/assets/images/banner/error-banner.png', 'frontend/assets/images/banner/error-banner.png', 'frontend/assets/images/banner/error-banner.png', 'frontend/assets/images/all-img/coming-banner.png', '(021) 33445566', 'Setiabudi, Jakarta Selata, DKI JAKARTA', 'https://www.facebook.com/', 'https://www.instagram.com/', 'https://www.twitter.com/', 'https://www.youtube.com/', '<h2>01. Privacy Policy</h2><p>Praesent placerat dictum elementum. Nam pulvinar urna vel lectus maximus, eget faucibus turpis hendrerit. Sed iaculis molestie arcu, et accumsan nisi. Quisque molestie velit vitae ligula luctus bibendum. Duis sit amet eros mollis, viverra ipsum sed, convallis sapien. Donec justo erat, pulvinar vitae dui ut, finibus euismod enim. Donec velit tortor, mollis eu tortor euismod, gravida lacinia arcu.</p><ul><li>In ac turpis mi. Donec quis semper neque. Nulla cursus gravida interdum.</li><li>Curabitur luctus sapien augue, mattis faucibus nisl vehicula nec. Mauris at scelerisque lorem. Nullam tempus felis ipsum, sagittis malesuada nulla vulputate et.</li><li>Aenean vel metus leo. Vivamus nec neque a libero sodales aliquam a et dolor.</li><li>Vestibulum rhoncus sagittis dolor vel finibus.</li><li>Integer feugiat lacus ut efficitur mattis. Sed quis molestie velit.</li></ul><h2>02. Limitations</h2><p>Praesent placerat dictum elementum. Nam pulvinar urna vel lectus maximus, eget faucibus turpis hendrerit. Sed iaculis molestie arcu, et accumsan nisi. Quisque molestie velit vitae ligula luctus bibendum. Duis sit amet eros mollis, viverra ipsum sed, convallis sapien. Donec justo erat, pulvinar vitae dui ut, finibus euismod enim. Donec velit tortor, mollis eu tortor euismod, gravida lacinia arcu.</p><ul><li>In ac turpis mi. Donec quis semper neque. Nulla cursus gravida interdum.</li><li>Curabitur luctus sapien augue.</li><li>mattis faucibus nisl vehicula nec, Mauris at scelerisque lorem.</li><li>Nullam tempus felis ipsum, sagittis malesuada nulla vulputate et. Aenean vel metus leo.</li><li>Vivamus nec neque a libero sodales aliquam a et dolor.</li></ul><h2>03. Security</h2><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ex neque, elementum eu blandit in, ornare eu purus. Fusce eu rhoncus mi, quis ultrices lacus. Phasellus id pellentesque nulla. Cras erat nisi, mattis et efficitur et, iaculis a lacus. Fusce gravida augue quis leo facilisis.</p><h2>04. Privacy Policy</h2><p>Praesent non sem facilisis, hendrerit nisi vitae, volutpat quam. Aliquam metus mauris, semper eu eros vitae, blandit tristique metus. Vestibulum maximus nec justo sed maximus. Vivamus sit amet turpis sem. Integer vitae tortor ac ex scelerisque facilisis ac vitae urna. In hac habitasse platea dictumst. Maecenas imperdiet tortor arcu, nec tincidunt neque malesuada volutpat.</p><ul><li>In ac turpis mi. Donec quis semper neque. Nulla cursus gravida interdum.</li><li>Mauris at scelerisque lorem. Nullam tempus felis ipsum, sagittis malesuada nulla vulputate et.</li><li>Aenean vel metus leo.</li><li>Vestibulum rhoncus sagittis dolor vel finibus.</li><li>Integer feugiat lacus ut efficitur mattis. Sed quis molestie velit.</li></ul><p>Fusce rutrum mauris sit amet justo rutrum, ut sodales lorem ullamcorper. Aliquam vitae iaculis urna. Nulla vitae mi vel nisl viverra ullamcorper vel elementum est. Mauris vitae elit nec enim tincidunt aliquet. Donec ultrices nulla a enim pulvinar, quis pulvinar lacus consectetur. Donec dignissim, risus nec mollis efficitur, turpis erat blandit urna, eget elementum lacus lectus eget lorem.</p><p><br>&nbsp;</p>', '<h2>01. Terms &amp; Condition</h2><p>Praesent placerat dictum elementum. Nam pulvinar urna vel lectus maximus, eget faucibus turpis hendrerit. Sed iaculis molestie arcu, et accumsan nisi. Quisque molestie velit vitae ligula luctus bibendum. Duis sit amet eros mollis, viverra ipsum sed, convallis sapien. Donec justo erat, pulvinar vitae dui ut, finibus euismod enim. Donec velit tortor, mollis eu tortor euismod, gravida lacinia arcu.</p><ul><li>In ac turpis mi. Donec quis semper neque. Nulla cursus gravida interdum.</li><li>Curabitur luctus sapien augue, mattis faucibus nisl vehicula nec. Mauris at scelerisque lorem. Nullam tempus felis ipsum, sagittis malesuada nulla vulputate et.</li><li>Aenean vel metus leo. Vivamus nec neque a libero sodales aliquam a et dolor.</li><li>Vestibulum rhoncus sagittis dolor vel finibus.</li><li>Integer feugiat lacus ut efficitur mattis. Sed quis molestie velit.</li></ul><h2>02. Limitations</h2><p>Praesent placerat dictum elementum. Nam pulvinar urna vel lectus maximus, eget faucibus turpis hendrerit. Sed iaculis molestie arcu, et accumsan nisi. Quisque molestie velit vitae ligula luctus bibendum. Duis sit amet eros mollis, viverra ipsum sed, convallis sapien. Donec justo erat, pulvinar vitae dui ut, finibus euismod enim. Donec velit tortor, mollis eu tortor euismod, gravida lacinia arcu.</p><ul><li>In ac turpis mi. Donec quis semper neque. Nulla cursus gravida interdum.</li><li>Curabitur luctus sapien augue.</li><li>mattis faucibus nisl vehicula nec, Mauris at scelerisque lorem.</li><li>Nullam tempus felis ipsum, sagittis malesuada nulla vulputate et. Aenean vel metus leo.</li><li>Vivamus nec neque a libero sodales aliquam a et dolor.</li></ul><h2>03. Security</h2><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ex neque, elementum eu blandit in, ornare eu purus. Fusce eu rhoncus mi, quis ultrices lacus. Phasellus id pellentesque nulla. Cras erat nisi, mattis et efficitur et, iaculis a lacus. Fusce gravida augue quis leo facilisis.</p><h2>04. Privacy Policy</h2><p>Praesent non sem facilisis, hendrerit nisi vitae, volutpat quam. Aliquam metus mauris, semper eu eros vitae, blandit tristique metus. Vestibulum maximus nec justo sed maximus. Vivamus sit amet turpis sem. Integer vitae tortor ac ex scelerisque facilisis ac vitae urna. In hac habitasse platea dictumst. Maecenas imperdiet tortor arcu, nec tincidunt neque malesuada volutpat.</p><ul><li>In ac turpis mi. Donec quis semper neque. Nulla cursus gravida interdum.</li><li>Mauris at scelerisque lorem. Nullam tempus felis ipsum, sagittis malesuada nulla vulputate et.</li><li>Aenean vel metus leo.</li><li>Vestibulum rhoncus sagittis dolor vel finibus.</li><li>Integer feugiat lacus ut efficitur mattis. Sed quis molestie velit.</li></ul><p>Fusce rutrum mauris sit amet justo rutrum, ut sodales lorem ullamcorper. Aliquam vitae iaculis urna. Nulla vitae mi vel nisl viverra ullamcorper vel elementum est. Mauris vitae elit nec enim tincidunt aliquet. Donec ultrices nulla a enim pulvinar, quis pulvinar lacus consectetur. Donec dignissim, risus nec mollis efficitur, turpis erat blandit urna, eget elementum lacus lectus eget lorem.</p><p><br>&nbsp;</p>', NULL, 'frontend/assets/images/all-img/coming-banner.png', '2023-02-24 04:43:20', '2023-08-20 06:10:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_contents`
--

CREATE TABLE `cms_contents` (
  `id` bigint UNSIGNED NOT NULL,
  `page_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `translation_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `cms_contents`
--

INSERT INTO `cms_contents` (`id`, `page_slug`, `translation_code`, `text`, `created_at`, `updated_at`) VALUES
(1, 'terms_condition_page', 'en', '<h2>01. Terms &amp; Condition</h2><p>Praesent placerat dictum elementum. Nam pulvinar urna vel lectus maximus, eget faucibus turpis hendrerit. Sed iaculis molestie arcu, et accumsan nisi. Quisque molestie velit vitae ligula luctus bibendum. Duis sit amet eros mollis, viverra ipsum sed, convallis sapien. Donec justo erat, pulvinar vitae dui ut, finibus euismod enim. Donec velit tortor, mollis eu tortor euismod, gravida lacinia arcu.</p><ul><li>In ac turpis mi. Donec quis semper neque. Nulla cursus gravida interdum.</li><li>Curabitur luctus sapien augue, mattis faucibus nisl vehicula nec. Mauris at scelerisque lorem. Nullam tempus felis ipsum, sagittis malesuada nulla vulputate et.</li><li>Aenean vel metus leo. Vivamus nec neque a libero sodales aliquam a et dolor.</li><li>Vestibulum rhoncus sagittis dolor vel finibus.</li><li>Integer feugiat lacus ut efficitur mattis. Sed quis molestie velit.</li></ul><h2>02. Limitations</h2><p>Praesent placerat dictum elementum. Nam pulvinar urna vel lectus maximus, eget faucibus turpis hendrerit. Sed iaculis molestie arcu, et accumsan nisi. Quisque molestie velit vitae ligula luctus bibendum. Duis sit amet eros mollis, viverra ipsum sed, convallis sapien. Donec justo erat, pulvinar vitae dui ut, finibus euismod enim. Donec velit tortor, mollis eu tortor euismod, gravida lacinia arcu.</p><ul><li>In ac turpis mi. Donec quis semper neque. Nulla cursus gravida interdum.</li><li>Curabitur luctus sapien augue.</li><li>mattis faucibus nisl vehicula nec, Mauris at scelerisque lorem.</li><li>Nullam tempus felis ipsum, sagittis malesuada nulla vulputate et. Aenean vel metus leo.</li><li>Vivamus nec neque a libero sodales aliquam a et dolor.</li></ul><h2>03. Security</h2><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ex neque, elementum eu blandit in, ornare eu purus. Fusce eu rhoncus mi, quis ultrices lacus. Phasellus id pellentesque nulla. Cras erat nisi, mattis et efficitur et, iaculis a lacus. Fusce gravida augue quis leo facilisis.</p><h2>04. Privacy Policy</h2><p>Praesent non sem facilisis, hendrerit nisi vitae, volutpat quam. Aliquam metus mauris, semper eu eros vitae, blandit tristique metus. Vestibulum maximus nec justo sed maximus. Vivamus sit amet turpis sem. Integer vitae tortor ac ex scelerisque facilisis ac vitae urna. In hac habitasse platea dictumst. Maecenas imperdiet tortor arcu, nec tincidunt neque malesuada volutpat.</p><ul><li>In ac turpis mi. Donec quis semper neque. Nulla cursus gravida interdum.</li><li>Mauris at scelerisque lorem. Nullam tempus felis ipsum, sagittis malesuada nulla vulputate et.</li><li>Aenean vel metus leo.</li><li>Vestibulum rhoncus sagittis dolor vel finibus.</li><li>Integer feugiat lacus ut efficitur mattis. Sed quis molestie velit.</li></ul><p>Fusce rutrum mauris sit amet justo rutrum, ut sodales lorem ullamcorper. Aliquam vitae iaculis urna. Nulla vitae mi vel nisl viverra ullamcorper vel elementum est. Mauris vitae elit nec enim tincidunt aliquet. Donec ultrices nulla a enim pulvinar, quis pulvinar lacus consectetur. Donec dignissim, risus nec mollis efficitur, turpis erat blandit urna, eget elementum lacus lectus eget lorem.</p><p><br>&nbsp;</p>', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(2, 'privacy_page', 'en', '<h2>01. Privacy Policy</h2><p>Praesent placerat dictum elementum. Nam pulvinar urna vel lectus maximus, eget faucibus turpis hendrerit. Sed iaculis molestie arcu, et accumsan nisi. Quisque molestie velit vitae ligula luctus bibendum. Duis sit amet eros mollis, viverra ipsum sed, convallis sapien. Donec justo erat, pulvinar vitae dui ut, finibus euismod enim. Donec velit tortor, mollis eu tortor euismod, gravida lacinia arcu.</p><ul><li>In ac turpis mi. Donec quis semper neque. Nulla cursus gravida interdum.</li><li>Curabitur luctus sapien augue, mattis faucibus nisl vehicula nec. Mauris at scelerisque lorem. Nullam tempus felis ipsum, sagittis malesuada nulla vulputate et.</li><li>Aenean vel metus leo. Vivamus nec neque a libero sodales aliquam a et dolor.</li><li>Vestibulum rhoncus sagittis dolor vel finibus.</li><li>Integer feugiat lacus ut efficitur mattis. Sed quis molestie velit.</li></ul><h2>02. Limitations</h2><p>Praesent placerat dictum elementum. Nam pulvinar urna vel lectus maximus, eget faucibus turpis hendrerit. Sed iaculis molestie arcu, et accumsan nisi. Quisque molestie velit vitae ligula luctus bibendum. Duis sit amet eros mollis, viverra ipsum sed, convallis sapien. Donec justo erat, pulvinar vitae dui ut, finibus euismod enim. Donec velit tortor, mollis eu tortor euismod, gravida lacinia arcu.</p><ul><li>In ac turpis mi. Donec quis semper neque. Nulla cursus gravida interdum.</li><li>Curabitur luctus sapien augue.</li><li>mattis faucibus nisl vehicula nec, Mauris at scelerisque lorem.</li><li>Nullam tempus felis ipsum, sagittis malesuada nulla vulputate et. Aenean vel metus leo.</li><li>Vivamus nec neque a libero sodales aliquam a et dolor.</li></ul><h2>03. Security</h2><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ex neque, elementum eu blandit in, ornare eu purus. Fusce eu rhoncus mi, quis ultrices lacus. Phasellus id pellentesque nulla. Cras erat nisi, mattis et efficitur et, iaculis a lacus. Fusce gravida augue quis leo facilisis.</p><h2>04. Privacy Policy</h2><p>Praesent non sem facilisis, hendrerit nisi vitae, volutpat quam. Aliquam metus mauris, semper eu eros vitae, blandit tristique metus. Vestibulum maximus nec justo sed maximus. Vivamus sit amet turpis sem. Integer vitae tortor ac ex scelerisque facilisis ac vitae urna. In hac habitasse platea dictumst. Maecenas imperdiet tortor arcu, nec tincidunt neque malesuada volutpat.</p><ul><li>In ac turpis mi. Donec quis semper neque. Nulla cursus gravida interdum.</li><li>Mauris at scelerisque lorem. Nullam tempus felis ipsum, sagittis malesuada nulla vulputate et.</li><li>Aenean vel metus leo.</li><li>Vestibulum rhoncus sagittis dolor vel finibus.</li><li>Integer feugiat lacus ut efficitur mattis. Sed quis molestie velit.</li></ul><p>Fusce rutrum mauris sit amet justo rutrum, ut sodales lorem ullamcorper. Aliquam vitae iaculis urna. Nulla vitae mi vel nisl viverra ullamcorper vel elementum est. Mauris vitae elit nec enim tincidunt aliquet. Donec ultrices nulla a enim pulvinar, quis pulvinar lacus consectetur. Donec dignissim, risus nec mollis efficitur, turpis erat blandit urna, eget elementum lacus lectus eget lorem.</p><p><br>&nbsp;</p>', '2023-02-24 04:43:20', '2023-02-24 04:43:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `companies`
--

CREATE TABLE `companies` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `industry_type_id` bigint UNSIGNED NOT NULL,
  `organization_type_id` bigint UNSIGNED NOT NULL,
  `team_size_id` bigint UNSIGNED DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `establishment_date` date DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` tinyint(1) NOT NULL DEFAULT '1',
  `profile_completion` tinyint(1) NOT NULL DEFAULT '0',
  `bio` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `vision` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `total_views` bigint UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `neighborhood` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locality` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long` double DEFAULT NULL,
  `lat` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `companies`
--

INSERT INTO `companies` (`id`, `user_id`, `industry_type_id`, `organization_type_id`, `team_size_id`, `logo`, `banner`, `establishment_date`, `website`, `visibility`, `profile_completion`, `bio`, `vision`, `total_views`, `created_at`, `updated_at`, `address`, `neighborhood`, `locality`, `place`, `district`, `postcode`, `region`, `country`, `long`, `lat`) VALUES
(1, 2, 6, 3, 5, 'uploads/images/company/1692510127_64e1a7af93e05.jpg', 'uploads/images/company/1692510127_64e1a7af9479b.jpg', '2000-02-01', NULL, 1, 1, 'Ini adalah company', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>', 0, '2023-08-20 05:41:11', '2023-08-20 05:44:52', 'rawajati-indonesia', '', '', 'Special Capital Region of Jakarta', 'undefined', '', 'Rawajati', 'Indonesia', 106.85160255379743, -6.265122199105347);

-- --------------------------------------------------------

--
-- Struktur dari tabel `company_applied_job_rejected`
--

CREATE TABLE `company_applied_job_rejected` (
  `id` bigint UNSIGNED NOT NULL,
  `company_id` bigint UNSIGNED NOT NULL,
  `applied_job_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `company_applied_job_shortlist`
--

CREATE TABLE `company_applied_job_shortlist` (
  `id` bigint UNSIGNED NOT NULL,
  `company_id` bigint UNSIGNED NOT NULL,
  `applied_job_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `company_bookmark_categories`
--

CREATE TABLE `company_bookmark_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `company_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `contact_infos`
--

CREATE TABLE `contact_infos` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `contact_infos`
--

INSERT INTO `contact_infos` (`id`, `user_id`, `phone`, `secondary_phone`, `email`, `secondary_email`, `created_at`, `updated_at`) VALUES
(1, 1, '08551607171', NULL, 'deni.w4f@gmail.com', NULL, '2023-08-20 05:24:35', '2023-08-20 06:51:58'),
(2, 2, '08551607171', '', 'company@mail.com', '', '2023-08-20 05:41:11', '2023-08-20 05:44:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cookies`
--

CREATE TABLE `cookies` (
  `id` bigint UNSIGNED NOT NULL,
  `allow_cookies` tinyint(1) NOT NULL DEFAULT '1',
  `cookie_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'gdpr_cookie',
  `cookie_expiration` tinyint NOT NULL DEFAULT '30',
  `force_consent` tinyint(1) NOT NULL DEFAULT '0',
  `darkmode` tinyint(1) NOT NULL DEFAULT '0',
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `approve_button_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `decline_button_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `cookies`
--

INSERT INTO `cookies` (`id`, `allow_cookies`, `cookie_name`, `cookie_expiration`, `force_consent`, `darkmode`, `language`, `title`, `description`, `approve_button_text`, `decline_button_text`, `created_at`, `updated_at`) VALUES
(1, 1, 'gdpr_cookie', 30, 0, 0, 'en', 'We use cookies!', 'Hi, this website uses essential cookies to ensure its proper operation and tracking cookies to understand how you interact with it. The latter will be set only after consent. <button type=\"button\" data-cc=\"c-settings\" class=\"cc-link\">Let me choose</button>', 'Allow all Cookies', 'Reject all Cookies', '2023-02-24 04:43:20', '2023-02-24 04:43:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `countries`
--

CREATE TABLE `countries` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sortname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `countries`
--

INSERT INTO `countries` (`id`, `name`, `image`, `slug`, `icon`, `sortname`, `latitude`, `longitude`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Indonesia', 'backend/image/flags/flag-of-Indonesia.jpg', 'indonesia', 'flag-icon-id', 'ID', -5, 120, 1, '2023-02-24 04:43:20', '2023-08-20 06:07:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol_position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'left',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `symbol_position`, `created_at`, `updated_at`) VALUES
(1, 'United State Dollar', 'USD', '$', 'left', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(2, 'Rupiah', 'IDR', 'Rp', 'left', '2023-08-20 05:33:24', '2023-08-20 05:33:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `earnings`
--

CREATE TABLE `earnings` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_provider` enum('flutterwave','mollie','midtrans','paypal','paystack','razorpay','sslcommerz','stripe','instamojo','offline') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint UNSIGNED NOT NULL,
  `amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usd_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` enum('paid','unpaid') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `manual_payment_id` bigint UNSIGNED DEFAULT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_id` bigint UNSIGNED DEFAULT NULL,
  `payment_type` enum('subscription_based','per_job_based') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscription_based'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `earnings`
--

INSERT INTO `earnings` (`id`, `order_id`, `payment_provider`, `company_id`, `amount`, `currency_symbol`, `usd_amount`, `payment_status`, `created_at`, `updated_at`, `manual_payment_id`, `transaction_id`, `plan_id`, `payment_type`) VALUES
(1, '64e1a9a766ecc', 'offline', 1, '0', 'Rp', '0', 'paid', '2023-08-20 05:50:31', '2023-08-20 05:50:31', NULL, 'tr_64e1a9a766ece', 2, 'subscription_based'),
(2, '64e1b10929cfc', 'offline', 1, '50000', 'Rp', '3.27', 'paid', '2023-08-20 06:22:01', '2023-08-20 06:22:37', 1, 'tr_64e1b10929cff', 3, 'subscription_based');

-- --------------------------------------------------------

--
-- Struktur dari tabel `education`
--

CREATE TABLE `education` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `education`
--

INSERT INTO `education` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'High School', 'high-school', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(2, 'Intermediate', 'intermediate', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(3, 'Bachelor Degree', 'bachelor-degree', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(4, 'Master Degree', 'master-degree', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(5, 'Graduated', 'graduated', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(6, 'PhD', 'phd', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(7, 'Any', 'any', '2023-02-24 04:43:20', '2023-02-24 04:43:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `emails`
--

CREATE TABLE `emails` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `type`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(1, 'New User', 'new_user', 'Welcome {user_name}', '<p>Hi {user_name},</p><p>Welcome to {company_name}. It\'s great to have you here!</p><p>Have a great time!</p><p>Regards,<br>{company_name} team</p>', '2023-02-24 04:43:18', '2023-02-24 04:43:18'),
(2, 'Edited Job', 'new_edited_job_available', 'New Edited Job Available For Approval!', '<p>Hello <strong>{admin_name}</strong>,<br>A new edited job available for approval!</p>', '2023-02-24 04:43:18', '2023-02-24 04:43:18'),
(3, 'New Job Available', 'new_job_available', 'New Job Available For Approval!', '<p>Hello {admin_name},<br>A new job available for approval!</p>', '2023-02-24 04:43:18', '2023-02-24 04:43:18'),
(4, 'New Plan Purchase', 'new_plan_purchase', '{user_name} Has Purchased The {plan_label} Plan!', '<p>{user_name} Has Purchased The {plan_label} Plan!</p>', '2023-02-24 04:43:18', '2023-02-24 04:43:18'),
(5, 'New User Registered', 'new_user_registered', 'New {user_role} Registered!', '<p>Hello {admin_name},<br>A {user_role} Registered Recently!</p>', '2023-02-24 04:43:18', '2023-02-24 04:43:18'),
(6, 'Plan Purchase', 'plan_purchase', 'Plan Purchased', '<p>Hello {user_name}!<br>You purchase of {plan_type} has been successfully completed!<br>Regards</p>', '2023-02-24 04:43:18', '2023-02-24 04:43:18'),
(7, 'New Pending Candidate', 'new_pending_candidate', 'Candidate Created', '<p>Hello {user_name},<br><br>Your candidate profile has been created and is waiting for admin approval.<br><br>Please login with your credentials below to check status -<br>Your Email : {user_email}<br>Your Password : {user_password}<br><br>Regards</p>', '2023-02-24 04:43:18', '2023-02-24 04:43:18'),
(8, 'New Candidate', 'new_candidate', 'Candidate Created', '<p>Hello {user_name},<br><br>Your candidate profile has been created.<br><br>Please login with your credentials below to check status -<br>Your Email : {user_email}<br>Your Password : {user_password}<br><br>Regards</p>', '2023-02-24 04:43:18', '2023-02-24 04:43:18'),
(9, 'New Company Pending', 'new_company_pending', 'Company created and waiting for admin approval', '<p>Hello {user_name},<br><br>Your company profile has been created and is waiting for admin approval.<br><br>Please check back your account with the login information below -<br>Your Email : {user_email}<br>Your Password : {user_password}<br><br>Regards</p>', '2023-02-24 04:43:18', '2023-02-24 04:43:18'),
(10, 'New Company', 'new_company', 'Company Created', '<p>Hello {user_name},<br><br>Your company profile has been created. Please login with below information.<br><br>Please check back your account with the login information below -<br>Your Email : {user_email}<br>Your Password : {user_password}<br><br>Regards</p>', '2023-02-24 04:43:18', '2023-02-24 04:43:18'),
(11, 'Update Company Password', 'update_company_pass', '{account_type} Updated', '<p>Hello {user_name},<br><br>Your {account_type} profile password updated.<br><br>Your Email : {user_email}<br>Your password : {password}<br><br>Regards</p>', '2023-02-24 04:43:18', '2023-02-24 04:43:18'),
(12, 'Verify Subscription Notification', 'verify_subscription_notification', 'Verify Your Subscription', '<p>Please verify your subscription by clicking below link.<br>Regards</p>', '2023-02-24 04:43:18', '2023-02-24 04:43:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `experiences`
--

CREATE TABLE `experiences` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `experiences`
--

INSERT INTO `experiences` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Fresher', 'fresher', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(2, '1 Year', '1-year', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(3, '2 Years', '2-years', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(4, '3+ Years', '3-years', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(5, '5+ Years', '5-years', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(6, '8+ Years', '8-years', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(7, '10+ Years', '10-years', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(8, '15+ Years', '15-years', '2023-02-24 04:43:20', '2023-02-24 04:43:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint UNSIGNED NOT NULL,
  `faq_category_id` bigint UNSIGNED NOT NULL,
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `faq_categories`
--

CREATE TABLE `faq_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `faq_categories`
--

INSERT INTO `faq_categories` (`id`, `name`, `slug`, `icon`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Job', 'job', 'fas fa-briefcase', 0, '2023-02-24 04:43:20', '2023-02-24 04:43:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `industry_types`
--

CREATE TABLE `industry_types` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `industry_types`
--

INSERT INTO `industry_types` (`id`, `created_at`, `updated_at`) VALUES
(1, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(2, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(3, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(4, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(5, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(6, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(7, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(8, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(9, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(10, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(11, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(12, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(13, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(14, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(15, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(16, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(17, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(18, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(19, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(20, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(21, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(22, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(23, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(24, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(25, '2023-02-24 04:43:20', '2023-02-24 04:43:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `industry_type_translations`
--

CREATE TABLE `industry_type_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `industry_type_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `industry_type_translations`
--

INSERT INTO `industry_type_translations` (`id`, `industry_type_id`, `name`, `locale`, `created_at`, `updated_at`) VALUES
(1, 1, 'Agro Based Industry', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(2, 2, 'Archi/Enggr/Construction', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(3, 3, 'Automobile/Industrial Machine', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(4, 4, 'Bank/Mon-Bank Fin. Institute', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(5, 5, 'Electronics/Consumer Durables', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(6, 6, 'Energy/Power/Fuel', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(7, 7, 'Garments/Textile', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(8, 8, 'Govt./Semi-Govt./Autonomous', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(9, 9, 'Pharmaceuticals', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(10, 10, 'Hospital/Diagnostic Center', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(11, 11, 'Airline/Travel/Tourism', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(12, 12, 'Manufacturing (Light Industry)', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(13, 13, 'Manufacturing (Heavy Industry)', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(14, 14, 'Hotel/Restaurant', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(15, 15, 'Information Technology', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(16, 16, 'Logistics/Transportation', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(17, 17, 'Entertainment/Recreation', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(18, 18, 'Media/Advertising/Event Mgt.', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(19, 19, 'NGO/Development', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(20, 20, 'Real Estate/Development', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(21, 21, 'Wholesale/Retail/Export-Import', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(22, 22, 'Telecommunication', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(23, 23, 'Food & Beverage Industry', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(24, 24, 'Security Service', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(25, 25, 'Fire, Safety & Protection', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `company_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `experience_id` bigint UNSIGNED NOT NULL,
  `education_id` bigint UNSIGNED NOT NULL,
  `job_type_id` bigint UNSIGNED NOT NULL,
  `salary_type_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vacancies` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_salary` int DEFAULT '0',
  `max_salary` int DEFAULT '0',
  `deadline` date DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','active','expired') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `apply_on` enum('app','email','custom_url') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'app',
  `apply_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apply_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `featured_until` date DEFAULT NULL,
  `highlight` tinyint(1) NOT NULL DEFAULT '0',
  `highlight_until` date DEFAULT NULL,
  `is_remote` tinyint(1) NOT NULL DEFAULT '0',
  `total_views` bigint UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `neighborhood` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locality` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long` double DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `parent_job_id` bigint UNSIGNED DEFAULT NULL,
  `waiting_for_edit_approval` tinyint(1) NOT NULL DEFAULT '0',
  `salary_mode` enum('range','custom') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'range',
  `custom_salary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `jobs`
--

INSERT INTO `jobs` (`id`, `company_id`, `category_id`, `role_id`, `experience_id`, `education_id`, `job_type_id`, `salary_type_id`, `title`, `slug`, `vacancies`, `min_salary`, `max_salary`, `deadline`, `description`, `status`, `apply_on`, `apply_email`, `apply_url`, `featured`, `featured_until`, `highlight`, `highlight_until`, `is_remote`, `total_views`, `created_at`, `updated_at`, `address`, `neighborhood`, `locality`, `place`, `district`, `postcode`, `region`, `country`, `long`, `lat`, `parent_job_id`, `waiting_for_edit_approval`, `salary_mode`, `custom_salary`) VALUES
(1, 1, 5, 5, 1, 3, 1, 1, 'Admin', 'admin-1692511258-64e1ac1a060ed', '1', 4000000, 5000000, '2023-09-19', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>', 'active', 'app', NULL, NULL, 0, NULL, 0, NULL, 0, 0, '2023-08-20 05:56:40', '2023-08-20 06:00:58', 'undefined-indonesia', '', '', 'Special Capital Region of Jakarta', 'undefined', '', 'undefined', 'Indonesia', 106.81787109322613, -6.175474040190483, NULL, 0, 'range', 'Competitive'),
(2, 1, 9, 5, 1, 1, 1, 1, 'Marketing', 'marketing-1692513698-64e1b5a254aed', '1', 3500000, 4000000, '2023-11-18', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>', 'active', 'app', NULL, NULL, 0, NULL, 0, NULL, 0, 0, '2023-08-20 06:41:38', '2023-08-20 06:42:03', 'west-java-indonesia', '', '', 'Bogor', 'undefined', '', 'West Java', 'Indonesia', 106.80364894840751, -6.6035728062918055, NULL, 0, 'range', 'Competitive');

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_benefit`
--

CREATE TABLE `job_benefit` (
  `id` bigint UNSIGNED NOT NULL,
  `job_id` bigint UNSIGNED NOT NULL,
  `benefit_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `job_benefit`
--

INSERT INTO `job_benefit` (`id`, `job_id`, `benefit_id`, `created_at`, `updated_at`) VALUES
(3, 1, 17, NULL, NULL),
(4, 1, 19, NULL, NULL),
(5, 2, 17, NULL, NULL),
(6, 2, 18, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_categories`
--

CREATE TABLE `job_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `icon` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `job_categories`
--

INSERT INTO `job_categories` (`id`, `image`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'backend/image/default.png', 'fas fa-hammer', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(2, 'backend/image/default.png', 'fas fa-tshirt', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(3, 'backend/image/default.png', 'fas fa-pen', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(4, 'backend/image/default.png', 'fas fa-hospital', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(5, 'backend/image/default.png', 'fas fa-desktop', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(6, 'backend/image/default.png', 'fas fa-user-md', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(7, 'backend/image/default.png', 'fas fa-car', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(8, 'backend/image/default.png', 'fas fa-gavel', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(9, 'backend/image/default.png', 'fas fa-ellipsis-v', '2023-02-24 04:43:20', '2023-02-24 04:43:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_category_translations`
--

CREATE TABLE `job_category_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `job_category_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `job_category_translations`
--

INSERT INTO `job_category_translations` (`id`, `job_category_id`, `name`, `locale`, `created_at`, `updated_at`) VALUES
(1, 1, 'Engineer/Architects', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(2, 2, 'Garments/Textile', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(3, 3, 'Design/Creative', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(4, 4, 'Hospitality/ Travel/ Tourism', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(5, 5, 'IT & Telecommunication', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(6, 6, 'Medical/Pharma', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(7, 7, 'Driving/Motor Technician', 'en', '2023-02-24 04:43:20', '2023-08-20 06:05:23'),
(8, 8, 'Law/Legal', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(9, 9, 'Others', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(10, 3, 'Desain Kreatif', 'id', '2023-08-20 05:52:42', '2023-08-20 05:52:42'),
(11, 1, 'Arsitek', 'id', '2023-08-20 05:54:35', '2023-08-20 05:54:35'),
(12, 5, 'IT & Telekomunikasi', 'id', '2023-08-20 05:55:14', '2023-08-20 05:55:14'),
(13, 2, 'Garmen/Tekstil', 'id', '2023-08-20 06:02:46', '2023-08-20 06:02:46'),
(14, 4, 'Rumah Sakit/ Travel/ Turis', 'id', '2023-08-20 06:03:20', '2023-08-20 06:03:20'),
(15, 6, 'Medis', 'id', '2023-08-20 06:03:36', '2023-08-20 06:03:36'),
(16, 7, 'Kendaraan/Teknik', 'id', '2023-08-20 06:03:57', '2023-08-20 06:05:23'),
(17, 9, 'Lainnya', 'id', '2023-08-20 06:04:39', '2023-08-20 06:04:39'),
(18, 8, 'Hukum', 'id', '2023-08-20 06:04:56', '2023-08-20 06:04:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_roles`
--

CREATE TABLE `job_roles` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `job_roles`
--

INSERT INTO `job_roles` (`id`, `created_at`, `updated_at`) VALUES
(1, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(2, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(3, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(4, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(5, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(6, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(7, '2023-08-20 00:40:17', '2023-08-20 00:40:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_role_translations`
--

CREATE TABLE `job_role_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `job_role_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `job_role_translations`
--

INSERT INTO `job_role_translations` (`id`, `job_role_id`, `name`, `locale`, `created_at`, `updated_at`) VALUES
(1, 1, 'Team Leader', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(2, 2, 'Manager', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(3, 3, 'Assistant Manager', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(4, 4, 'Executive', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(5, 5, 'Administrator', 'en', '2023-02-24 04:43:20', '2023-08-20 05:54:11'),
(6, 6, 'Administrator', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(7, 1, 'Tim Leader', 'id', '2023-08-20 05:53:07', '2023-08-20 05:53:07'),
(8, 2, 'Manajer', 'id', '2023-08-20 05:53:23', '2023-08-20 05:53:23'),
(9, 3, 'Asisten Manager', 'id', '2023-08-20 05:53:36', '2023-08-20 05:53:36'),
(10, 4, 'Eksekutif', 'id', '2023-08-20 05:53:49', '2023-08-20 05:53:49'),
(11, 5, 'Administrasi', 'id', '2023-08-20 05:54:00', '2023-08-20 05:54:11'),
(12, 7, 'Programmer', 'id', '2023-08-20 00:40:17', '2023-08-20 00:40:17'),
(13, 7, 'Programmer', 'en', '2023-08-20 00:40:17', '2023-08-20 00:40:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_tag`
--

CREATE TABLE `job_tag` (
  `id` bigint UNSIGNED NOT NULL,
  `job_id` bigint UNSIGNED NOT NULL,
  `tag_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `job_tag`
--

INSERT INTO `job_tag` (`id`, `job_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 1, 19, NULL, NULL),
(2, 1, 20, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_types`
--

CREATE TABLE `job_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `job_types`
--

INSERT INTO `job_types` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Full Time', 'full-time', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(2, 'Part Time', 'part-time', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(3, 'Contractual', 'contractual', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(4, 'Intern', 'intern', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(5, 'Freelance', 'freelance', '2023-02-24 04:43:20', '2023-02-24 04:43:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `languages`
--

CREATE TABLE `languages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `direction` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `icon`, `direction`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 'flag-icon-gb', 'ltr', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(2, 'Indonesian', 'id', 'flag-icon-mc', 'ltr', '2023-08-20 05:12:44', '2023-08-20 05:12:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `manual_payments`
--

CREATE TABLE `manual_payments` (
  `id` bigint UNSIGNED NOT NULL,
  `type` enum('bank_payment','cash_payment','check_payment','custom_payment') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `manual_payments`
--

INSERT INTO `manual_payments` (`id`, `type`, `name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'bank_payment', 'BCA', '<p>BCA 8679994023</p><p>AN. PT Jobpilot</p>', 1, '2023-08-20 06:21:23', '2023-08-20 06:21:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2020_11_12_184107_create_permission_tables', 1),
(4, '2020_12_23_122556_create_contacts_table', 1),
(5, '2021_02_18_112239_create_admins_table', 1),
(6, '2021_07_14_154223_create_users_table', 1),
(7, '2021_08_23_115402_create_settings_table', 1),
(8, '2021_08_25_061331_create_languages_table', 1),
(9, '2021_12_14_142236_create_emails_table', 1),
(10, '2021_12_17_110211_create_testimonials_table', 1),
(11, '2021_12_19_152529_create_faq_categories_table', 1),
(12, '2021_12_21_105713_create_faqs_table', 1),
(13, '2022_01_25_131111_add_fields_to_settings_table', 1),
(14, '2022_01_26_091457_add_social_login_fields_to_users_table', 1),
(15, '2022_01_27_044638_create_experiences_table', 1),
(16, '2022_01_27_044649_create_education_table', 1),
(17, '2022_01_27_055733_create_job_types_table', 1),
(18, '2022_01_27_060057_create_salary_types_table', 1),
(19, '2022_01_27_081546_create_organization_types_table', 1),
(20, '2022_01_27_095019_create_team_sizes_table', 1),
(21, '2022_01_27_101204_create_nationalities_table', 1),
(22, '2022_01_27_121442_create_countries_table', 1),
(23, '2022_01_27_121452_create_states_table', 1),
(24, '2022_01_27_121453_create_cities_table', 1),
(25, '2022_01_28_030131_create_industry_types_table', 1),
(26, '2022_01_28_030802_create_professions_table', 1),
(27, '2022_01_28_033627_create_job_roles_table', 1),
(28, '2022_01_29_110746_create_companies_table', 1),
(29, '2022_01_29_120010_create_job_categories_table', 1),
(30, '2022_01_29_120020_create_candidates_table', 1),
(31, '2022_01_29_133751_create_jobs_table', 1),
(32, '2022_01_30_051177_create_post_categories_table', 1),
(33, '2022_01_30_051199_create_posts_table', 1),
(34, '2022_02_09_154506_create_company_bookmark_categories_table', 1),
(35, '2022_02_10_154506_create_bookmark_company_table', 1),
(36, '2022_02_10_160813_create_bookmark_candidate_job_table', 1),
(37, '2022_02_10_160821_create_bookmark_candidate_company_table', 1),
(38, '2022_02_10_161917_create_social_links_table', 1),
(39, '2022_02_10_162218_create_contact_infos_table', 1),
(40, '2022_02_19_141812_create_plans_table', 1),
(41, '2022_02_22_114329_create_post_comments_table', 1),
(42, '2022_02_22_183128_create_application_groups_table', 1),
(43, '2022_02_22_183129_create_applied_jobs_table', 1),
(44, '2022_03_01_213343_create_website_settings_table', 1),
(45, '2022_03_05_125615_create_currencies_table', 1),
(46, '2022_03_05_145248_create_abouts_table', 1),
(47, '2022_03_05_181737_create_our_missions_table', 1),
(48, '2022_03_08_110106_create_notifications_table', 1),
(49, '2022_03_10_110704_create_cms_table', 1),
(50, '2022_03_13_143318_create_payment_settings_table', 1),
(51, '2022_03_13_162626_create_user_plans_table', 1),
(52, '2022_03_13_193937_create_orders_table', 1),
(53, '2022_03_13_204812_create_earnings_table', 1),
(54, '2022_03_15_100012_create_terms_categories_table', 1),
(55, '2022_03_24_045305_create_seos_table', 1),
(56, '2022_03_26_130136_create_queue_jobs_table', 1),
(57, '2022_03_28_093629_add_socialite_column_to_users_table', 1),
(58, '2022_03_28_123603_create_theme_settings_table', 1),
(59, '2022_03_29_100616_create_timezones_table', 1),
(60, '2022_03_29_121851_create_admin_searches_table', 1),
(61, '2022_03_30_082959_create_cookies_table', 1),
(62, '2022_04_25_132657_create_setup_guides_table', 1),
(63, '2022_04_27_090501_create_bookmark_company_category_table', 1),
(64, '2022_04_30_041155_create_company_applied_job_rejected_table', 1),
(65, '2022_04_30_043011_create_company_applied_job_shortlist_table', 1),
(66, '2022_06_18_031525_add_full_address_to_candidates_table', 1),
(67, '2022_06_18_031525_add_full_address_to_companies_table', 1),
(68, '2022_06_18_031525_add_full_address_to_jobs_table', 1),
(69, '2022_06_27_050337_add_map_to_settings_table', 1),
(70, '2022_07_19_062856_create_manual_payments_table', 1),
(71, '2022_07_20_033046_add_manual_payment_id_to_earnings_table', 1),
(72, '2022_07_23_044852_add_transaction_id_to_earnings_table', 1),
(73, '2022_08_02_103529_create_candidate_resumes_table', 1),
(74, '2022_08_03_061932_add_fields_to_applied_jobs_table', 1),
(75, '2022_08_29_035902_add_employer_activation_field_to_settings_table', 1),
(76, '2022_08_29_063449_remove_some_columns_from_cms_table', 1),
(77, '2022_08_29_090125_create_cms_contents_table', 1),
(78, '2022_08_30_115827_remove_add_settings_table', 1),
(79, '2022_09_06_052408_create_skills_table', 1),
(80, '2022_09_06_052409_create_candidate_languages_table', 1),
(81, '2022_09_06_053034_create_candidate_skill_table', 1),
(82, '2022_09_06_053045_create_candidate_language_table', 1),
(83, '2022_10_16_063305_add_language_field_to_faqs_tables', 1),
(84, '2022_10_16_063328_add_language_field_to_testimonials_tables', 1),
(85, '2022_10_16_071227_add_available_status_fields_to_candidates_table', 1),
(86, '2022_10_16_100636_add_payperjob_field_to_settings_table', 1),
(87, '2022_10_17_024137_add_plan_id_field_to_earnings_table', 1),
(88, '2022_11_07_091932_add_candidate_account_auto_activation_to_settings_table', 1),
(89, '2022_11_09_040558_create_seo_page_contents_table', 1),
(90, '2022_11_11_085423_add_leaflet_map_field_to_settings_table', 1),
(91, '2022_11_12_060938_create_candidate_experiences_table', 1),
(92, '2022_11_12_091250_create_candidate_education_table', 1),
(93, '2022_11_15_095541_add_profile_limitaion_field_to_plans_table', 1),
(94, '2022_11_15_102325_add_profile_limitaion_field_to_user_plans_table', 1),
(95, '2022_11_17_083919_add_job_auto_approve_columns_to_settings', 1),
(96, '2022_11_17_090506_add_job_edited_columns_to_jobs', 1),
(97, '2022_11_18_032938_create_benefits_table', 1),
(98, '2022_11_18_032939_create_tags_table', 1),
(99, '2022_11_18_032940_create_job_benefit_table', 1),
(100, '2022_11_18_032941_create_job_tag_table', 1),
(101, '2022_11_23_104905_add_delete_columns_to_seos_table', 1),
(102, '2022_12_20_094532_change_salary_column_to_jobs_table', 1),
(103, '2022_12_20_102724_add_currency_switcher_field_to_settings_table', 1),
(104, '2022_12_23_104503_create_candidate_language_permission_table', 1),
(105, '2022_12_25_062232_add_highlight_features_job_duration_to_settings_table', 1),
(106, '2022_12_25_062645_add_highlight_featured_job_duration_field_to_jobs_table', 1),
(107, '2022_12_25_110928_create_benefit_permission_seeder_table', 1),
(108, '2022_12_26_082221_create_candidate_cv_views_table', 1),
(109, '2023_02_03_103051_add_currently_working_field_to_candidate_experiences_table', 1),
(110, '2023_02_06_112504_create_industry_type_translations_table', 1),
(111, '2023_02_07_034518_create_benefit_translations_table', 1),
(112, '2023_02_07_034909_create_profession_translations_table', 1),
(113, '2023_02_07_035108_create_skill_translations_table', 1),
(114, '2023_02_07_040101_create_job_role_translations_table', 1),
(115, '2023_02_07_095642_create_job_category_translations_table', 1),
(116, '2023_02_10_043825_add_fields_to_jobs_table', 1),
(117, '2023_02_10_053823_add_refund_page_column_to_cms_table', 1),
(118, '2023_02_13_093723_create_email_templates_table', 1),
(119, '2023_02_15_052022_remove_nationality_field_from_companies_table', 1),
(120, '2023_02_15_052100_remove_nationality_field_from_candidates_table', 1),
(121, '2023_02_16_085939_add_deadline_expiration_limit_to_settings_table', 1),
(122, '2023_02_17_022353_create_tags_crud_permission_table', 1),
(123, '2023_02_20_045609_create_tag_translations_table', 1),
(124, '2023_02_20_082840_add_show_popular_list_column_into_tags_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\Admin', 1),
(2, 'App\\Models\\Admin', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `nationalities`
--

CREATE TABLE `nationalities` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('0adcca36-3f74-456a-83d4-d2fb9fb0ecf7', 'App\\Notifications\\JobApprovalNotification', 'App\\Models\\User', 2, '{\"title\":\"Admin has approved your job. Your job is live now.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/jobs\\/marketing-1692513698-64e1b5a254aed\"}', NULL, '2023-08-20 06:42:03', '2023-08-20 06:42:03'),
('2d75cdb6-8d78-4465-89a6-28105165cbd8', 'App\\Notifications\\Website\\Company\\PaymentMarkPaidNotification', 'App\\Models\\User', 2, '{\"title\":\"Your payment has been marked as paid. You can now start working on your job.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/company\\/plans\"}', NULL, '2023-08-20 06:22:37', '2023-08-20 06:22:37'),
('48fb8fea-e0d6-47c0-bacf-4b4f6f7c0cdd', 'App\\Notifications\\Admin\\NewUserRegisteredNotification', 'App\\Models\\Admin', 1, '{\"title\":\"A Company registered recently\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/company\\/1\"}', '2023-08-20 06:22:14', '2023-08-20 05:41:11', '2023-08-20 06:22:14'),
('4fb275ed-e1b6-43b6-bb2b-0c842283af61', 'App\\Notifications\\Website\\Candidate\\ApplyJobNotification', 'App\\Models\\User', 2, '{\"title\":\"Deni Suryadi has applied your job\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/company\\/my-jobs\",\"title2\":\"You have applied the job of Company\",\"url2\":\"http:\\/\\/127.0.0.1:8000\\/company\\/my-jobs\"}', '2023-08-20 07:00:44', '2023-08-20 06:59:35', '2023-08-20 07:00:44'),
('5449567b-0d36-4303-8c9f-3a3979b221d9', 'App\\Notifications\\Admin\\NewJobAvailableNotification', 'App\\Models\\Admin', 1, '{\"title\":\"A new job is available for approval\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/job?title=Marketing\"}', '2023-08-20 00:38:52', '2023-08-20 06:41:38', '2023-08-20 00:38:52'),
('659450f2-1403-4501-a5df-a91d3337de84', 'App\\Notifications\\Admin\\NewUserRegisteredNotification', 'App\\Models\\Admin', 1, '{\"title\":\"A Candidate registered recently\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/candidate\\/1\"}', '2023-08-20 06:22:14', '2023-08-20 05:24:35', '2023-08-20 06:22:14'),
('727c417e-641c-4553-b877-99aaddb6db9a', 'App\\Notifications\\JobApprovalNotification', 'App\\Models\\User', 2, '{\"title\":\"Admin has approved your job. Your job is live now.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/jobs\\/admin-1692511000-64e1ab18d8f55\"}', NULL, '2023-08-20 05:57:24', '2023-08-20 05:57:24'),
('7be7cfe8-f4ab-4d0b-89b5-df2297c835dd', 'App\\Notifications\\Website\\Company\\JobCreatedNotification', 'App\\Models\\User', 2, '{\"title\":\"Job has been created and waiting for admin approval\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/jobs\\/marketing-1692513698-64e1b5a254aed\"}', NULL, '2023-08-20 06:41:38', '2023-08-20 06:41:38'),
('9441c2f0-3c7b-44a8-825c-83af414f93f4', 'App\\Notifications\\Website\\Company\\JobCreatedNotification', 'App\\Models\\User', 2, '{\"title\":\"Job has been created and waiting for admin approval\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/jobs\\/admin-1692511000-64e1ab18d8f55\"}', NULL, '2023-08-20 05:56:40', '2023-08-20 05:56:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_id` int NOT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `organization_types`
--

CREATE TABLE `organization_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `organization_types`
--

INSERT INTO `organization_types` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Government', 'government', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(2, 'Semi Government', 'semi-government', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(3, 'Public', 'public', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(4, 'Private', 'private', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(5, 'NGO', 'ngo', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(6, 'International Agencies', 'international-agencies', '2023-02-24 04:43:20', '2023-02-24 04:43:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `our_missions`
--

CREATE TABLE `our_missions` (
  `id` bigint UNSIGNED NOT NULL,
  `mission_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'frontend/assets/images/banner/about-banner-5.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment_settings`
--

CREATE TABLE `payment_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `paypal` tinyint(1) NOT NULL DEFAULT '1',
  `paypal_live_mode` tinyint(1) NOT NULL DEFAULT '0',
  `stripe` tinyint(1) NOT NULL DEFAULT '1',
  `razorpay` tinyint(1) NOT NULL DEFAULT '1',
  `paystack` tinyint(1) NOT NULL DEFAULT '1',
  `ssl_commerz` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `payment_settings`
--

INSERT INTO `payment_settings` (`id`, `paypal`, `paypal_live_mode`, `stripe`, `razorpay`, `paystack`, `ssl_commerz`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 1, 1, 1, 1, '2023-02-24 04:43:19', '2023-02-24 04:43:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `group_name`, `created_at`, `updated_at`) VALUES
(1, 'admin.create', 'admin', 'admin', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(2, 'admin.view', 'admin', 'admin', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(3, 'admin.edit', 'admin', 'admin', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(4, 'admin.delete', 'admin', 'admin', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(5, 'order.view', 'admin', 'order', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(6, 'order.download', 'admin', 'order', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(7, 'company.create', 'admin', 'company', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(8, 'company.view', 'admin', 'company', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(9, 'company.update', 'admin', 'company', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(10, 'company.delete', 'admin', 'company', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(11, 'map.create', 'admin', 'map', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(12, 'map.view', 'admin', 'map', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(13, 'map.update', 'admin', 'map', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(14, 'map.delete', 'admin', 'map', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(15, 'candidate.create', 'admin', 'candidate', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(16, 'candidate.view', 'admin', 'candidate', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(17, 'candidate.update', 'admin', 'candidate', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(18, 'candidate.delete', 'admin', 'candidate', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(19, 'job.create', 'admin', 'job', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(20, 'job.view', 'admin', 'job', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(21, 'job.update', 'admin', 'job', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(22, 'job.delete', 'admin', 'job', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(23, 'job_category.create', 'admin', 'job_category', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(24, 'job_category.view', 'admin', 'job_category', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(25, 'job_category.update', 'admin', 'job_category', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(26, 'job_category.delete', 'admin', 'job_category', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(27, 'job_role.view', 'admin', 'job_role', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(28, 'job_role.create', 'admin', 'job_role', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(29, 'job_role.update', 'admin', 'job_role', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(30, 'job_role.delete', 'admin', 'job_role', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(31, 'plan.create', 'admin', 'price_plan', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(32, 'plan.view', 'admin', 'price_plan', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(33, 'plan.update', 'admin', 'price_plan', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(34, 'plan.delete', 'admin', 'price_plan', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(35, 'industry_types.create', 'admin', 'attributes', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(36, 'industry_types.view', 'admin', 'attributes', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(37, 'industry_types.update', 'admin', 'attributes', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(38, 'industry_types.delete', 'admin', 'attributes', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(39, 'professions.create', 'admin', 'attributes', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(40, 'professions.view', 'admin', 'attributes', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(41, 'professions.update', 'admin', 'attributes', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(42, 'professions.delete', 'admin', 'attributes', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(43, 'skills.create', 'admin', 'attributes', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(44, 'skills.view', 'admin', 'attributes', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(45, 'skills.update', 'admin', 'attributes', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(46, 'skills.delete', 'admin', 'attributes', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(47, 'post.create', 'admin', 'blog', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(48, 'post.view', 'admin', 'blog', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(49, 'post.update', 'admin', 'blog', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(50, 'post.delete', 'admin', 'blog', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(51, 'country.create', 'admin', 'location', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(52, 'country.view', 'admin', 'location', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(53, 'country.update', 'admin', 'location', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(54, 'country.delete', 'admin', 'location', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(55, 'state.create', 'admin', 'location', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(56, 'state.view', 'admin', 'location', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(57, 'state.update', 'admin', 'location', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(58, 'state.delete', 'admin', 'location', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(59, 'city.create', 'admin', 'location', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(60, 'city.view', 'admin', 'location', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(61, 'city.update', 'admin', 'location', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(62, 'city.delete', 'admin', 'location', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(63, 'newsletter.view', 'admin', 'newsletter', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(64, 'newsletter.sendmail', 'admin', 'newsletter', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(65, 'newsletter.delete', 'admin', 'newsletter', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(66, 'contact.view', 'admin', 'contact', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(67, 'contact.delete', 'admin', 'contact', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(68, 'testimonial.create', 'admin', 'testimonial', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(69, 'testimonial.view', 'admin', 'testimonial', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(70, 'testimonial.update', 'admin', 'testimonial', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(71, 'testimonial.delete', 'admin', 'testimonial', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(72, 'faq.create', 'admin', 'faq', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(73, 'faq.view', 'admin', 'faq', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(74, 'faq.update', 'admin', 'faq', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(75, 'faq.delete', 'admin', 'faq', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(76, 'role.create', 'admin', 'role', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(77, 'role.view', 'admin', 'role', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(78, 'role.edit', 'admin', 'role', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(79, 'role.delete', 'admin', 'role', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(80, 'setting.view', 'admin', 'settings', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(81, 'setting.update', 'admin', 'settings', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(82, 'candidate-language.create', 'admin', 'candidate-language', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(83, 'candidate-language.view', 'admin', 'candidate-language', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(84, 'candidate-language.update', 'admin', 'candidate-language', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(85, 'candidate-language.delete', 'admin', 'candidate-language', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(86, 'benefits.create', 'admin', 'attributes', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(87, 'benefits.view', 'admin', 'attributes', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(88, 'benefits.update', 'admin', 'attributes', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(89, 'benefits.delete', 'admin', 'attributes', '2023-02-24 04:43:17', '2023-02-24 04:43:17'),
(90, 'tags.create', 'admin', 'attributes', '2023-02-24 04:43:18', '2023-02-24 04:43:18'),
(91, 'tags.view', 'admin', 'attributes', '2023-02-24 04:43:18', '2023-02-24 04:43:18'),
(92, 'tags.update', 'admin', 'attributes', '2023-02-24 04:43:18', '2023-02-24 04:43:18'),
(93, 'tags.delete', 'admin', 'attributes', '2023-02-24 04:43:19', '2023-02-24 04:43:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `plans`
--

CREATE TABLE `plans` (
  `id` bigint UNSIGNED NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `job_limit` int NOT NULL,
  `featured_job_limit` int NOT NULL,
  `highlight_job_limit` int NOT NULL,
  `candidate_cv_view_limit` int NOT NULL DEFAULT '0',
  `recommended` tinyint(1) NOT NULL DEFAULT '0',
  `frontend_show` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `candidate_cv_view_limitation` enum('unlimited','limited') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'limited'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `plans`
--

INSERT INTO `plans` (`id`, `label`, `description`, `price`, `job_limit`, `featured_job_limit`, `highlight_job_limit`, `candidate_cv_view_limit`, `recommended`, `frontend_show`, `created_at`, `updated_at`, `candidate_cv_view_limitation`) VALUES
(1, 'UMKM', 'Harga UMKM', 0.00, 5, 5, 5, 0, 0, 0, '2023-02-24 04:43:20', '2023-08-20 05:48:22', 'unlimited'),
(2, 'Standar', 'Harga standar', 0.00, 100, 100, 100, 0, 0, 1, '2023-08-20 05:49:18', '2023-08-20 05:49:18', 'unlimited'),
(3, 'Premium', 'Harga Premium', 50000.00, 1000, 1000, 1000, 0, 0, 1, '2023-08-20 05:50:19', '2023-08-20 05:50:19', 'unlimited');

-- --------------------------------------------------------

--
-- Struktur dari tabel `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `author_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('draft','published') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint UNSIGNED NOT NULL,
  `author_id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `professions`
--

CREATE TABLE `professions` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `professions`
--

INSERT INTO `professions` (`id`, `created_at`, `updated_at`) VALUES
(1, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(2, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(3, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(4, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(5, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(6, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(7, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(8, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(9, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(10, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(11, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(12, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(13, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(14, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(15, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(16, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(17, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(18, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(19, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(20, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(21, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(22, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(23, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(24, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(25, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(26, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(27, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(28, '2023-02-24 04:43:20', '2023-02-24 04:43:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `profession_translations`
--

CREATE TABLE `profession_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `profession_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `profession_translations`
--

INSERT INTO `profession_translations` (`id`, `profession_id`, `name`, `locale`, `created_at`, `updated_at`) VALUES
(1, 1, 'Physician', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(2, 2, 'Engineer', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(3, 3, 'Chef', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(4, 4, 'Lawyer', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(5, 5, 'Designer', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(6, 6, 'Labourer', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(7, 7, 'Dentist', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(8, 8, 'Accountant', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(9, 9, 'Dental Hygienist', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(10, 10, 'Actor', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(11, 11, 'Electrician', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(12, 12, 'Software Developer', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(13, 13, 'Pharmacist', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(14, 14, 'Technician', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(15, 15, 'Artist', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(16, 16, 'Teacher', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(17, 17, 'Journalist', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(18, 18, 'Cashier', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(19, 19, 'Secretary', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(20, 20, 'Scientist', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(21, 21, 'Soldier', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(22, 22, 'Gardener', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(23, 23, 'Farmer', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(24, 24, 'Librarian', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(25, 25, 'Driver', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(26, 26, 'Fishermen', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(27, 27, 'Police Officer ', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(28, 28, 'Tailor', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(29, 5, 'Desainer', 'id', '2023-08-20 06:53:29', '2023-08-20 06:53:29'),
(30, 8, 'Akunting', 'id', '2023-08-20 06:53:44', '2023-08-20 06:53:44'),
(31, 12, 'Software Developer', 'id', '2023-08-20 06:53:57', '2023-08-20 06:53:57'),
(32, 19, 'Sekretaris', 'id', '2023-08-20 06:54:19', '2023-08-20 06:54:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `queue_jobs`
--

CREATE TABLE `queue_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'admin', '2023-02-24 04:43:16', '2023-02-24 04:43:16'),
(2, 'Admin', 'admin', '2023-08-20 00:41:51', '2023-08-20 00:41:51'),
(3, 'Kadis', 'admin', '2023-08-20 00:49:07', '2023-08-20 00:49:07'),
(4, 'Kabid', 'admin', '2023-08-20 00:51:12', '2023-08-20 00:51:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(47, 2),
(48, 2),
(49, 2),
(50, 2),
(51, 2),
(52, 2),
(53, 2),
(54, 2),
(55, 2),
(56, 2),
(57, 2),
(58, 2),
(59, 2),
(60, 2),
(61, 2),
(62, 2),
(63, 2),
(64, 2),
(65, 2),
(66, 2),
(67, 2),
(68, 2),
(69, 2),
(70, 2),
(71, 2),
(72, 2),
(73, 2),
(74, 2),
(75, 2),
(82, 2),
(83, 2),
(84, 2),
(85, 2),
(86, 2),
(87, 2),
(88, 2),
(89, 2),
(90, 2),
(91, 2),
(92, 2),
(93, 2),
(2, 3),
(8, 3),
(12, 3),
(16, 3),
(20, 3),
(24, 3),
(48, 3),
(63, 3),
(64, 3),
(66, 3),
(68, 3),
(69, 3),
(2, 4),
(8, 4),
(12, 4),
(16, 4),
(20, 4),
(24, 4),
(27, 4),
(48, 4),
(63, 4),
(64, 4),
(66, 4),
(69, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `salary_types`
--

CREATE TABLE `salary_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `salary_types`
--

INSERT INTO `salary_types` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Monthly', 'monthly', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(2, 'Project Basis', 'project-basis', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(3, 'Hourly', 'hourly', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(4, 'Yearly', 'yearly', '2023-02-24 04:43:20', '2023-02-24 04:43:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `seos`
--

CREATE TABLE `seos` (
  `id` bigint UNSIGNED NOT NULL,
  `page_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `seos`
--

INSERT INTO `seos` (`id`, `page_slug`, `created_at`, `updated_at`) VALUES
(1, 'home', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(2, 'jobs', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(3, 'job-details', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(4, 'candidates', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(5, 'candidate-details', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(6, 'company', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(7, 'company-details', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(8, 'blog', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(9, 'post-details', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(10, 'pricing', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(11, 'login', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(12, 'register', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(13, 'about', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(14, 'contact', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(15, 'faq', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(16, 'terms-condition', '2023-02-24 04:43:20', '2023-02-24 04:43:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `seo_page_contents`
--

CREATE TABLE `seo_page_contents` (
  `id` bigint UNSIGNED NOT NULL,
  `page_id` bigint UNSIGNED NOT NULL,
  `language_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `seo_page_contents`
--

INSERT INTO `seo_page_contents` (`id`, `page_id`, `language_code`, `title`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Welcome To Jobpilot', 'Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.', 'frontend/assets/images/jobpilot.png', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(2, 2, 'en', 'Jobs', 'Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.', 'frontend/assets/images/jobpilot.png', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(3, 3, 'en', 'Job Details', 'Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.', 'frontend/assets/images/jobpilot.png', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(4, 4, 'en', 'Candidates', 'Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.', 'frontend/assets/images/jobpilot.png', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(5, 5, 'en', 'Candidate Details', 'Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.', 'frontend/assets/images/jobpilot.png', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(6, 6, 'en', 'Company', 'Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.', 'frontend/assets/images/jobpilot.png', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(7, 7, 'en', 'Company Details', 'Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.', 'frontend/assets/images/jobpilot.png', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(8, 8, 'en', 'Blog', 'Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.', 'frontend/assets/images/jobpilot.png', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(9, 9, 'en', 'Post Details', 'Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.', 'frontend/assets/images/jobpilot.png', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(10, 10, 'en', 'Pricing', 'Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.', 'frontend/assets/images/jobpilot.png', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(11, 11, 'en', 'Login', 'Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.', 'frontend/assets/images/jobpilot.png', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(12, 12, 'en', 'Register', 'Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.', 'frontend/assets/images/jobpilot.png', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(13, 13, 'en', 'About', 'Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.', 'frontend/assets/images/jobpilot.png', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(14, 14, 'en', 'Contact', 'Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.', 'frontend/assets/images/jobpilot.png', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(15, 15, 'en', 'FAQ', 'Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.', 'frontend/assets/images/jobpilot.png', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(16, 16, 'en', 'Terms Condition', 'Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.', 'frontend/assets/images/jobpilot.png', '2023-02-24 04:43:20', '2023-02-24 04:43:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dark_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `light_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_css` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `header_script` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body_script` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sidebar_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nav_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sidebar_txt_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nav_txt_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accent_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frontend_primary_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frontend_secondary_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `working_process_step1_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `working_process_step1_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `working_process_step2_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `working_process_step2_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `working_process_step3_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `working_process_step3_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `working_process_step4_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `working_process_step4_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `dark_mode` tinyint(1) NOT NULL DEFAULT '0',
  `google_analytics` tinyint(1) NOT NULL DEFAULT '0',
  `search_engine_indexing` tinyint(1) NOT NULL DEFAULT '1',
  `default_layout` tinyint(1) NOT NULL DEFAULT '1',
  `default_plan` int UNSIGNED NOT NULL DEFAULT '1',
  `job_limit` int UNSIGNED NOT NULL DEFAULT '1',
  `featured_job_limit` int UNSIGNED NOT NULL DEFAULT '1',
  `highlight_job_limit` int UNSIGNED NOT NULL DEFAULT '1',
  `timezone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'UTC',
  `language_changing` tinyint(1) NOT NULL DEFAULT '1',
  `email_verification` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `default_map` enum('google-map','map-box','leaflet') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'leaflet',
  `google_map_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_box_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_long` double DEFAULT NULL,
  `default_lat` double DEFAULT NULL,
  `app_country_type` enum('single_base','multiple_base') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'multiple_base',
  `app_country` bigint UNSIGNED DEFAULT NULL,
  `employer_auto_activation` tinyint(1) NOT NULL DEFAULT '1',
  `per_job_active` tinyint(1) NOT NULL DEFAULT '1',
  `per_job_price` double(8,2) DEFAULT '100.00',
  `highlight_job_price` double(8,2) DEFAULT '50.00',
  `featured_job_price` double(8,2) DEFAULT '50.00',
  `candidate_account_auto_activation` tinyint(1) NOT NULL DEFAULT '1',
  `job_auto_approved` tinyint(1) NOT NULL DEFAULT '0',
  `edited_job_auto_approved` tinyint(1) NOT NULL DEFAULT '1',
  `currency_switcher` tinyint(1) NOT NULL DEFAULT '1',
  `highlight_job_days` int DEFAULT '0',
  `featured_job_days` int DEFAULT '0',
  `job_deadline_expiration_limit` int NOT NULL DEFAULT '30'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `settings`
--

INSERT INTO `settings` (`id`, `email`, `dark_logo`, `light_logo`, `favicon_image`, `header_css`, `header_script`, `body_script`, `sidebar_color`, `nav_color`, `sidebar_txt_color`, `nav_txt_color`, `main_color`, `accent_color`, `frontend_primary_color`, `frontend_secondary_color`, `working_process_step1_title`, `working_process_step1_description`, `working_process_step2_title`, `working_process_step2_description`, `working_process_step3_title`, `working_process_step3_description`, `working_process_step4_title`, `working_process_step4_description`, `dark_mode`, `google_analytics`, `search_engine_indexing`, `default_layout`, `default_plan`, `job_limit`, `featured_job_limit`, `highlight_job_limit`, `timezone`, `language_changing`, `email_verification`, `created_at`, `updated_at`, `default_map`, `google_map_key`, `map_box_key`, `default_long`, `default_lat`, `app_country_type`, `app_country`, `employer_auto_activation`, `per_job_active`, `per_job_price`, `highlight_job_price`, `featured_job_price`, `candidate_account_auto_activation`, `job_auto_approved`, `edited_job_auto_approved`, `currency_switcher`, `highlight_job_days`, `featured_job_days`, `job_deadline_expiration_limit`) VALUES
(1, 'deynastore@gmail.com', 'frontend/assets/images/logo/logo.png', 'frontend/assets/images/logo/logowhite.png', 'frontend/assets/images/logo/fav.png', NULL, NULL, NULL, '#092433', '#0A243E', '#C1D6F0', '#C1D6F0', '#0A65CC', '#487CB8', '#0A65CC', '#487CB8', 'Create Account', 'Aliquam facilisis egestas sapien, nec tempor leo tristique at.', 'Upload Cv Resume', 'Curabitur sit amet maximus ligula. Nam a nulla ante. Nam sodales', 'Find Suitable Job', 'Curabitur sit amet maximus ligula. Nam a nulla ante. Nam sodales', 'Apply Job', 'Curabitur sit amet maximus ligula. Nam a nulla ante. Nam sodales', 0, 0, 1, 1, 1, 1, 1, 1, 'UTC', 1, 0, '2023-02-24 04:43:19', '2023-08-20 00:46:08', 'leaflet', NULL, NULL, 106.830891, -6.186021, 'multiple_base', NULL, 1, 1, 100.00, 50.00, 50.00, 1, 0, 1, 1, 0, 0, 90);

-- --------------------------------------------------------

--
-- Struktur dari tabel `setup_guides`
--

CREATE TABLE `setup_guides` (
  `id` bigint UNSIGNED NOT NULL,
  `task_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `setup_guides`
--

INSERT INTO `setup_guides` (`id`, `task_name`, `title`, `description`, `action_route`, `action_label`, `status`, `created_at`, `updated_at`) VALUES
(1, 'app_setting', 'App Information ', 'Add your app logo, name, description, owner and other information.', 'settings.general', 'Add App Information', 1, '2023-02-24 04:43:20', '2023-08-20 06:23:15'),
(2, 'smtp_setting', 'SMTP Configuration', 'Add your app logo, name, description, owner and other information.', 'settings.email', 'Add Mail Configuration', 1, '2023-02-24 04:43:20', '2023-08-20 06:37:13'),
(3, 'payment_setting', 'Enable Payment Method', 'Enable to payment methods to receive payments from your customer.', 'settings.payment', 'Add Payment', 1, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(4, 'theme_setting', 'Customize Theme', 'Customize your theme to make your app look more attractive.', 'settings.theme', 'Customize Your App Now', 1, '2023-02-24 04:43:20', '2023-02-24 04:43:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `skills`
--

CREATE TABLE `skills` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `skills`
--

INSERT INTO `skills` (`id`, `created_at`, `updated_at`) VALUES
(1, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(2, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(3, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(4, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(5, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(6, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(7, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(8, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(9, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(10, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(11, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(12, '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(13, '2023-08-20 06:55:40', '2023-08-20 06:55:40'),
(14, '2023-08-20 06:55:48', '2023-08-20 06:55:48');

-- --------------------------------------------------------

--
-- Struktur dari tabel `skill_translations`
--

CREATE TABLE `skill_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `skill_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `skill_translations`
--

INSERT INTO `skill_translations` (`id`, `skill_id`, `name`, `locale`, `created_at`, `updated_at`) VALUES
(1, 1, 'html', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(2, 2, 'css', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(3, 3, 'javascript', 'en', '2023-02-24 04:43:20', '2023-08-20 06:55:06'),
(4, 4, 'php', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(5, 5, 'laravel', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(6, 6, 'mysql', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(7, 7, 'vuejs', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(8, 8, 'reactjs', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(9, 9, 'nodejs', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(10, 10, 'expressjs', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(11, 11, 'python', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(12, 12, 'django', 'en', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(13, 1, 'html', 'id', '2023-08-20 06:54:48', '2023-08-20 06:54:48'),
(14, 2, 'css', 'id', '2023-08-20 06:54:55', '2023-08-20 06:54:55'),
(15, 3, 'javascript', 'id', '2023-08-20 06:55:06', '2023-08-20 06:55:06'),
(16, 4, 'php', 'id', '2023-08-20 06:55:14', '2023-08-20 06:55:14'),
(17, 5, 'laravel', 'id', '2023-08-20 06:55:26', '2023-08-20 06:55:26'),
(18, 13, 'Ms. Office', 'id', '2023-08-20 06:55:40', '2023-08-20 06:55:40'),
(19, 13, 'Ms. Office', 'en', '2023-08-20 06:55:40', '2023-08-20 06:55:40'),
(20, 14, 'Photoshop', 'id', '2023-08-20 06:55:48', '2023-08-20 06:55:48'),
(21, 14, 'Photoshop', 'en', '2023-08-20 06:55:48', '2023-08-20 06:55:48');

-- --------------------------------------------------------

--
-- Struktur dari tabel `social_links`
--

CREATE TABLE `social_links` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `social_media` enum('facebook','twitter','instagram','youtube','linkedin','pinterest','reddit','github','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `social_links`
--

INSERT INTO `social_links` (`id`, `user_id`, `social_media`, `url`, `created_at`, `updated_at`) VALUES
(1, 1, 'linkedin', 'https://www.linkedin.com/in/denisuryadi26/', '2023-08-20 06:58:48', '2023-08-20 06:58:48');

-- --------------------------------------------------------

--
-- Struktur dari tabel `states`
--

CREATE TABLE `states` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` bigint UNSIGNED NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tags`
--

CREATE TABLE `tags` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `show_popular_list` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `tags`
--

INSERT INTO `tags` (`id`, `created_at`, `updated_at`, `show_popular_list`) VALUES
(1, '2023-02-24 04:43:21', '2023-02-24 04:43:21', 0),
(2, '2023-02-24 04:43:21', '2023-02-24 04:43:21', 0),
(3, '2023-02-24 04:43:21', '2023-02-24 04:43:21', 0),
(4, '2023-02-24 04:43:21', '2023-02-24 04:43:21', 0),
(5, '2023-02-24 04:43:21', '2023-02-24 04:43:21', 0),
(6, '2023-02-24 04:43:21', '2023-02-24 04:43:21', 0),
(7, '2023-02-24 04:43:21', '2023-02-24 04:43:21', 0),
(8, '2023-02-24 04:43:21', '2023-02-24 04:43:21', 0),
(9, '2023-02-24 04:43:21', '2023-02-24 04:43:21', 0),
(10, '2023-02-24 04:43:21', '2023-02-24 04:43:21', 0),
(11, '2023-02-24 04:43:21', '2023-02-24 04:43:21', 0),
(12, '2023-02-24 04:43:21', '2023-02-24 04:43:21', 0),
(13, '2023-02-24 04:43:21', '2023-02-24 04:43:21', 0),
(14, '2023-02-24 04:43:21', '2023-02-24 04:43:21', 0),
(15, '2023-02-24 04:43:21', '2023-02-24 04:43:21', 0),
(16, '2023-02-24 04:43:21', '2023-02-24 04:43:21', 0),
(17, '2023-02-24 04:43:21', '2023-02-24 04:43:21', 0),
(18, '2023-02-24 04:43:21', '2023-02-24 04:43:21', 0),
(19, '2023-08-20 05:56:40', '2023-08-20 07:03:36', 1),
(20, '2023-08-20 05:56:40', '2023-08-20 07:03:34', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tag_translations`
--

CREATE TABLE `tag_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `tag_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `tag_translations`
--

INSERT INTO `tag_translations` (`id`, `tag_id`, `name`, `locale`, `created_at`, `updated_at`) VALUES
(1, 1, 'php', 'en', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(2, 2, 'laravel', 'en', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(3, 3, 'mysql', 'en', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(4, 4, 'job', 'en', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(5, 5, 'frontend', 'en', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(6, 6, 'backend', 'en', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(7, 7, 'bootstrap', 'en', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(8, 8, 'team', 'en', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(9, 9, 'testing', 'en', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(10, 10, 'database', 'en', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(11, 11, 'jobs', 'en', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(12, 12, 'remote', 'en', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(13, 13, 'others', 'en', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(14, 14, 'seeker', 'en', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(15, 15, 'candidate', 'en', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(16, 16, 'company', 'en', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(17, 17, 'technology', 'en', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(18, 18, 'work', 'en', '2023-02-24 04:43:21', '2023-02-24 04:43:21'),
(19, 19, 'Admin', 'id', '2023-08-20 05:56:40', '2023-08-20 05:56:40'),
(20, 19, 'Admin', 'en', '2023-08-20 05:56:40', '2023-08-20 05:56:40'),
(21, 20, 'IT', 'id', '2023-08-20 05:56:40', '2023-08-20 05:56:40'),
(22, 20, 'IT', 'en', '2023-08-20 05:56:40', '2023-08-20 05:56:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `team_sizes`
--

CREATE TABLE `team_sizes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `team_sizes`
--

INSERT INTO `team_sizes` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Only Me', 'only-me', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(2, '10 Members', '10-members', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(3, '10-20 Members', '10-20-members', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(4, '20-50 Members', '20-50-members', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(5, '50-100 Members', '50-100-members', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(6, '100-200 Members', '100-200-members', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(7, '200-500 Members', '200-500-members', '2023-02-24 04:43:20', '2023-02-24 04:43:20'),
(8, '500+ Members', '500-members', '2023-02-24 04:43:20', '2023-02-24 04:43:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `terms_categories`
--

CREATE TABLE `terms_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stars` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `theme_settings`
--

CREATE TABLE `theme_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `timezones`
--

CREATE TABLE `timezones` (
  `id` bigint UNSIGNED NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `timezones`
--

INSERT INTO `timezones` (`id`, `value`) VALUES
(1, 'Africa/Abidjan'),
(2, 'Africa/Accra'),
(3, 'Africa/Addis_Ababa'),
(4, 'Africa/Algiers'),
(5, 'Africa/Asmara'),
(6, 'Africa/Bamako'),
(7, 'Africa/Bangui'),
(8, 'Africa/Banjul'),
(9, 'Africa/Bissau'),
(10, 'Africa/Blantyre'),
(11, 'Africa/Brazzaville'),
(12, 'Africa/Bujumbura'),
(13, 'Africa/Cairo'),
(14, 'Africa/Casablanca'),
(15, 'Africa/Ceuta'),
(16, 'Africa/Conakry'),
(17, 'Africa/Dakar'),
(18, 'Africa/Dar_es_Salaam'),
(19, 'Africa/Djibouti'),
(20, 'Africa/Douala'),
(21, 'Africa/El_Aaiun'),
(22, 'Africa/Freetown'),
(23, 'Africa/Gaborone'),
(24, 'Africa/Harare'),
(25, 'Africa/Johannesburg'),
(26, 'Africa/Juba'),
(27, 'Africa/Kampala'),
(28, 'Africa/Khartoum'),
(29, 'Africa/Kigali'),
(30, 'Africa/Kinshasa'),
(31, 'Africa/Lagos'),
(32, 'Africa/Libreville'),
(33, 'Africa/Lome'),
(34, 'Africa/Luanda'),
(35, 'Africa/Lubumbashi'),
(36, 'Africa/Lusaka'),
(37, 'Africa/Malabo'),
(38, 'Africa/Maputo'),
(39, 'Africa/Maseru'),
(40, 'Africa/Mbabane'),
(41, 'Africa/Mogadishu'),
(42, 'Africa/Monrovia'),
(43, 'Africa/Nairobi'),
(44, 'Africa/Ndjamena'),
(45, 'Africa/Niamey'),
(46, 'Africa/Nouakchott'),
(47, 'Africa/Ouagadougou'),
(48, 'Africa/Porto-Novo'),
(49, 'Africa/Sao_Tome'),
(50, 'Africa/Tripoli'),
(51, 'Africa/Tunis'),
(52, 'Africa/Windhoek'),
(53, 'America/Adak'),
(54, 'America/Anchorage'),
(55, 'America/Anguilla'),
(56, 'America/Antigua'),
(57, 'America/Araguaina'),
(58, 'America/Argentina/Buenos_Aires'),
(59, 'America/Argentina/Catamarca'),
(60, 'America/Argentina/Cordoba'),
(61, 'America/Argentina/Jujuy'),
(62, 'America/Argentina/La_Rioja'),
(63, 'America/Argentina/Mendoza'),
(64, 'America/Argentina/Rio_Gallegos'),
(65, 'America/Argentina/Salta'),
(66, 'America/Argentina/San_Juan'),
(67, 'America/Argentina/San_Luis'),
(68, 'America/Argentina/Tucuman'),
(69, 'America/Argentina/Ushuaia'),
(70, 'America/Aruba'),
(71, 'America/Asuncion'),
(72, 'America/Atikokan'),
(73, 'America/Bahia'),
(74, 'America/Bahia_Banderas'),
(75, 'America/Barbados'),
(76, 'America/Belem'),
(77, 'America/Belize'),
(78, 'America/Blanc-Sablon'),
(79, 'America/Boa_Vista'),
(80, 'America/Bogota'),
(81, 'America/Boise'),
(82, 'America/Cambridge_Bay'),
(83, 'America/Campo_Grande'),
(84, 'America/Cancun'),
(85, 'America/Caracas'),
(86, 'America/Cayenne'),
(87, 'America/Cayman'),
(88, 'America/Chicago'),
(89, 'America/Chihuahua'),
(90, 'America/Ciudad_Juarez'),
(91, 'America/Costa_Rica'),
(92, 'America/Creston'),
(93, 'America/Cuiaba'),
(94, 'America/Curacao'),
(95, 'America/Danmarkshavn'),
(96, 'America/Dawson'),
(97, 'America/Dawson_Creek'),
(98, 'America/Denver'),
(99, 'America/Detroit'),
(100, 'America/Dominica'),
(101, 'America/Edmonton'),
(102, 'America/Eirunepe'),
(103, 'America/El_Salvador'),
(104, 'America/Fort_Nelson'),
(105, 'America/Fortaleza'),
(106, 'America/Glace_Bay'),
(107, 'America/Goose_Bay'),
(108, 'America/Grand_Turk'),
(109, 'America/Grenada'),
(110, 'America/Guadeloupe'),
(111, 'America/Guatemala'),
(112, 'America/Guayaquil'),
(113, 'America/Guyana'),
(114, 'America/Halifax'),
(115, 'America/Havana'),
(116, 'America/Hermosillo'),
(117, 'America/Indiana/Indianapolis'),
(118, 'America/Indiana/Knox'),
(119, 'America/Indiana/Marengo'),
(120, 'America/Indiana/Petersburg'),
(121, 'America/Indiana/Tell_City'),
(122, 'America/Indiana/Vevay'),
(123, 'America/Indiana/Vincennes'),
(124, 'America/Indiana/Winamac'),
(125, 'America/Inuvik'),
(126, 'America/Iqaluit'),
(127, 'America/Jamaica'),
(128, 'America/Juneau'),
(129, 'America/Kentucky/Louisville'),
(130, 'America/Kentucky/Monticello'),
(131, 'America/Kralendijk'),
(132, 'America/La_Paz'),
(133, 'America/Lima'),
(134, 'America/Los_Angeles'),
(135, 'America/Lower_Princes'),
(136, 'America/Maceio'),
(137, 'America/Managua'),
(138, 'America/Manaus'),
(139, 'America/Marigot'),
(140, 'America/Martinique'),
(141, 'America/Matamoros'),
(142, 'America/Mazatlan'),
(143, 'America/Menominee'),
(144, 'America/Merida'),
(145, 'America/Metlakatla'),
(146, 'America/Mexico_City'),
(147, 'America/Miquelon'),
(148, 'America/Moncton'),
(149, 'America/Monterrey'),
(150, 'America/Montevideo'),
(151, 'America/Montserrat'),
(152, 'America/Nassau'),
(153, 'America/New_York'),
(154, 'America/Nome'),
(155, 'America/Noronha'),
(156, 'America/North_Dakota/Beulah'),
(157, 'America/North_Dakota/Center'),
(158, 'America/North_Dakota/New_Salem'),
(159, 'America/Nuuk'),
(160, 'America/Ojinaga'),
(161, 'America/Panama'),
(162, 'America/Paramaribo'),
(163, 'America/Phoenix'),
(164, 'America/Port-au-Prince'),
(165, 'America/Port_of_Spain'),
(166, 'America/Porto_Velho'),
(167, 'America/Puerto_Rico'),
(168, 'America/Punta_Arenas'),
(169, 'America/Rankin_Inlet'),
(170, 'America/Recife'),
(171, 'America/Regina'),
(172, 'America/Resolute'),
(173, 'America/Rio_Branco'),
(174, 'America/Santarem'),
(175, 'America/Santiago'),
(176, 'America/Santo_Domingo'),
(177, 'America/Sao_Paulo'),
(178, 'America/Scoresbysund'),
(179, 'America/Sitka'),
(180, 'America/St_Barthelemy'),
(181, 'America/St_Johns'),
(182, 'America/St_Kitts'),
(183, 'America/St_Lucia'),
(184, 'America/St_Thomas'),
(185, 'America/St_Vincent'),
(186, 'America/Swift_Current'),
(187, 'America/Tegucigalpa'),
(188, 'America/Thule'),
(189, 'America/Tijuana'),
(190, 'America/Toronto'),
(191, 'America/Tortola'),
(192, 'America/Vancouver'),
(193, 'America/Whitehorse'),
(194, 'America/Winnipeg'),
(195, 'America/Yakutat'),
(196, 'America/Yellowknife'),
(197, 'Antarctica/Casey'),
(198, 'Antarctica/Davis'),
(199, 'Antarctica/DumontDUrville'),
(200, 'Antarctica/Macquarie'),
(201, 'Antarctica/Mawson'),
(202, 'Antarctica/McMurdo'),
(203, 'Antarctica/Palmer'),
(204, 'Antarctica/Rothera'),
(205, 'Antarctica/Syowa'),
(206, 'Antarctica/Troll'),
(207, 'Antarctica/Vostok'),
(208, 'Arctic/Longyearbyen'),
(209, 'Asia/Aden'),
(210, 'Asia/Almaty'),
(211, 'Asia/Amman'),
(212, 'Asia/Anadyr'),
(213, 'Asia/Aqtau'),
(214, 'Asia/Aqtobe'),
(215, 'Asia/Ashgabat'),
(216, 'Asia/Atyrau'),
(217, 'Asia/Baghdad'),
(218, 'Asia/Bahrain'),
(219, 'Asia/Baku'),
(220, 'Asia/Bangkok'),
(221, 'Asia/Barnaul'),
(222, 'Asia/Beirut'),
(223, 'Asia/Bishkek'),
(224, 'Asia/Brunei'),
(225, 'Asia/Chita'),
(226, 'Asia/Choibalsan'),
(227, 'Asia/Colombo'),
(228, 'Asia/Damascus'),
(229, 'Asia/Dhaka'),
(230, 'Asia/Dili'),
(231, 'Asia/Dubai'),
(232, 'Asia/Dushanbe'),
(233, 'Asia/Famagusta'),
(234, 'Asia/Gaza'),
(235, 'Asia/Hebron'),
(236, 'Asia/Ho_Chi_Minh'),
(237, 'Asia/Hong_Kong'),
(238, 'Asia/Hovd'),
(239, 'Asia/Irkutsk'),
(240, 'Asia/Jakarta'),
(241, 'Asia/Jayapura'),
(242, 'Asia/Jerusalem'),
(243, 'Asia/Kabul'),
(244, 'Asia/Kamchatka'),
(245, 'Asia/Karachi'),
(246, 'Asia/Kathmandu'),
(247, 'Asia/Khandyga'),
(248, 'Asia/Kolkata'),
(249, 'Asia/Krasnoyarsk'),
(250, 'Asia/Kuala_Lumpur'),
(251, 'Asia/Kuching'),
(252, 'Asia/Kuwait'),
(253, 'Asia/Macau'),
(254, 'Asia/Magadan'),
(255, 'Asia/Makassar'),
(256, 'Asia/Manila'),
(257, 'Asia/Muscat'),
(258, 'Asia/Nicosia'),
(259, 'Asia/Novokuznetsk'),
(260, 'Asia/Novosibirsk'),
(261, 'Asia/Omsk'),
(262, 'Asia/Oral'),
(263, 'Asia/Phnom_Penh'),
(264, 'Asia/Pontianak'),
(265, 'Asia/Pyongyang'),
(266, 'Asia/Qatar'),
(267, 'Asia/Qostanay'),
(268, 'Asia/Qyzylorda'),
(269, 'Asia/Riyadh'),
(270, 'Asia/Sakhalin'),
(271, 'Asia/Samarkand'),
(272, 'Asia/Seoul'),
(273, 'Asia/Shanghai'),
(274, 'Asia/Singapore'),
(275, 'Asia/Srednekolymsk'),
(276, 'Asia/Taipei'),
(277, 'Asia/Tashkent'),
(278, 'Asia/Tbilisi'),
(279, 'Asia/Tehran'),
(280, 'Asia/Thimphu'),
(281, 'Asia/Tokyo'),
(282, 'Asia/Tomsk'),
(283, 'Asia/Ulaanbaatar'),
(284, 'Asia/Urumqi'),
(285, 'Asia/Ust-Nera'),
(286, 'Asia/Vientiane'),
(287, 'Asia/Vladivostok'),
(288, 'Asia/Yakutsk'),
(289, 'Asia/Yangon'),
(290, 'Asia/Yekaterinburg'),
(291, 'Asia/Yerevan'),
(292, 'Atlantic/Azores'),
(293, 'Atlantic/Bermuda'),
(294, 'Atlantic/Canary'),
(295, 'Atlantic/Cape_Verde'),
(296, 'Atlantic/Faroe'),
(297, 'Atlantic/Madeira'),
(298, 'Atlantic/Reykjavik'),
(299, 'Atlantic/South_Georgia'),
(300, 'Atlantic/St_Helena'),
(301, 'Atlantic/Stanley'),
(302, 'Australia/Adelaide'),
(303, 'Australia/Brisbane'),
(304, 'Australia/Broken_Hill'),
(305, 'Australia/Darwin'),
(306, 'Australia/Eucla'),
(307, 'Australia/Hobart'),
(308, 'Australia/Lindeman'),
(309, 'Australia/Lord_Howe'),
(310, 'Australia/Melbourne'),
(311, 'Australia/Perth'),
(312, 'Australia/Sydney'),
(313, 'Europe/Amsterdam'),
(314, 'Europe/Andorra'),
(315, 'Europe/Astrakhan'),
(316, 'Europe/Athens'),
(317, 'Europe/Belgrade'),
(318, 'Europe/Berlin'),
(319, 'Europe/Bratislava'),
(320, 'Europe/Brussels'),
(321, 'Europe/Bucharest'),
(322, 'Europe/Budapest'),
(323, 'Europe/Busingen'),
(324, 'Europe/Chisinau'),
(325, 'Europe/Copenhagen'),
(326, 'Europe/Dublin'),
(327, 'Europe/Gibraltar'),
(328, 'Europe/Guernsey'),
(329, 'Europe/Helsinki'),
(330, 'Europe/Isle_of_Man'),
(331, 'Europe/Istanbul'),
(332, 'Europe/Jersey'),
(333, 'Europe/Kaliningrad'),
(334, 'Europe/Kirov'),
(335, 'Europe/Kyiv'),
(336, 'Europe/Lisbon'),
(337, 'Europe/Ljubljana'),
(338, 'Europe/London'),
(339, 'Europe/Luxembourg'),
(340, 'Europe/Madrid'),
(341, 'Europe/Malta'),
(342, 'Europe/Mariehamn'),
(343, 'Europe/Minsk'),
(344, 'Europe/Monaco'),
(345, 'Europe/Moscow'),
(346, 'Europe/Oslo'),
(347, 'Europe/Paris'),
(348, 'Europe/Podgorica'),
(349, 'Europe/Prague'),
(350, 'Europe/Riga'),
(351, 'Europe/Rome'),
(352, 'Europe/Samara'),
(353, 'Europe/San_Marino'),
(354, 'Europe/Sarajevo'),
(355, 'Europe/Saratov'),
(356, 'Europe/Simferopol'),
(357, 'Europe/Skopje'),
(358, 'Europe/Sofia'),
(359, 'Europe/Stockholm'),
(360, 'Europe/Tallinn'),
(361, 'Europe/Tirane'),
(362, 'Europe/Ulyanovsk'),
(363, 'Europe/Vaduz'),
(364, 'Europe/Vatican'),
(365, 'Europe/Vienna'),
(366, 'Europe/Vilnius'),
(367, 'Europe/Volgograd'),
(368, 'Europe/Warsaw'),
(369, 'Europe/Zagreb'),
(370, 'Europe/Zurich'),
(371, 'Indian/Antananarivo'),
(372, 'Indian/Chagos'),
(373, 'Indian/Christmas'),
(374, 'Indian/Cocos'),
(375, 'Indian/Comoro'),
(376, 'Indian/Kerguelen'),
(377, 'Indian/Mahe'),
(378, 'Indian/Maldives'),
(379, 'Indian/Mauritius'),
(380, 'Indian/Mayotte'),
(381, 'Indian/Reunion'),
(382, 'Pacific/Apia'),
(383, 'Pacific/Auckland'),
(384, 'Pacific/Bougainville'),
(385, 'Pacific/Chatham'),
(386, 'Pacific/Chuuk'),
(387, 'Pacific/Easter'),
(388, 'Pacific/Efate'),
(389, 'Pacific/Fakaofo'),
(390, 'Pacific/Fiji'),
(391, 'Pacific/Funafuti'),
(392, 'Pacific/Galapagos'),
(393, 'Pacific/Gambier'),
(394, 'Pacific/Guadalcanal'),
(395, 'Pacific/Guam'),
(396, 'Pacific/Honolulu'),
(397, 'Pacific/Kanton'),
(398, 'Pacific/Kiritimati'),
(399, 'Pacific/Kosrae'),
(400, 'Pacific/Kwajalein'),
(401, 'Pacific/Majuro'),
(402, 'Pacific/Marquesas'),
(403, 'Pacific/Midway'),
(404, 'Pacific/Nauru'),
(405, 'Pacific/Niue'),
(406, 'Pacific/Norfolk'),
(407, 'Pacific/Noumea'),
(408, 'Pacific/Pago_Pago'),
(409, 'Pacific/Palau'),
(410, 'Pacific/Pitcairn'),
(411, 'Pacific/Pohnpei'),
(412, 'Pacific/Port_Moresby'),
(413, 'Pacific/Rarotonga'),
(414, 'Pacific/Saipan'),
(415, 'Pacific/Tahiti'),
(416, 'Pacific/Tarawa'),
(417, 'Pacific/Tongatapu'),
(418, 'Pacific/Wake'),
(419, 'Pacific/Wallis'),
(420, 'UTC');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'backend/image/default.png',
  `role` enum('company','candidate') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'candidate',
  `recent_activities_alert` tinyint(1) NOT NULL DEFAULT '1',
  `job_expired_alert` tinyint(1) NOT NULL DEFAULT '1',
  `new_job_alert` tinyint(1) NOT NULL DEFAULT '1',
  `shortlisted_alert` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_demo_field` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `auth_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'email',
  `google_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `email_verified_at`, `image`, `role`, `recent_activities_alert`, `job_expired_alert`, `new_job_alert`, `shortlisted_alert`, `status`, `is_demo_field`, `remember_token`, `created_at`, `updated_at`, `auth_type`, `google_id`, `facebook_id`, `provider`, `provider_id`) VALUES
(1, 'Deni Suryadi', 'candidate', 'deni.w4f@gmail.com', '$2y$10$F9XTQoRUdIaoT4sz4Cb2uOvaHsYmJKTSzpPIhy60EedQ.myyE7QMq', NULL, 'backend/image/default.png', 'candidate', 0, 0, 0, 0, 1, 0, NULL, '2023-08-20 05:24:35', '2023-08-20 06:58:10', 'email', NULL, NULL, NULL, NULL),
(2, 'Company', 'company', 'company@mail.com', '$2y$10$Vz4Ex7yCZU85j7JrLoj5herPut3ZLqfte9tcaTbo3iLUBwEo4y41G', NULL, 'backend/image/default.png', 'company', 1, 1, 1, 1, 1, 0, NULL, '2023-08-20 05:41:11', '2023-08-20 05:41:11', 'email', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_plans`
--

CREATE TABLE `user_plans` (
  `id` bigint UNSIGNED NOT NULL,
  `company_id` bigint UNSIGNED NOT NULL,
  `plan_id` bigint UNSIGNED NOT NULL,
  `job_limit` bigint UNSIGNED NOT NULL DEFAULT '1',
  `featured_job_limit` bigint UNSIGNED NOT NULL DEFAULT '0',
  `highlight_job_limit` bigint UNSIGNED NOT NULL DEFAULT '0',
  `candidate_cv_view_limit` bigint UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `candidate_cv_view_limitation` enum('unlimited','limited') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'limited'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `user_plans`
--

INSERT INTO `user_plans` (`id`, `company_id`, `plan_id`, `job_limit`, `featured_job_limit`, `highlight_job_limit`, `candidate_cv_view_limit`, `created_at`, `updated_at`, `candidate_cv_view_limitation`) VALUES
(1, 1, 3, 1098, 1100, 1100, 0, '2023-08-20 05:50:31', '2023-08-20 06:41:38', 'unlimited');

-- --------------------------------------------------------

--
-- Struktur dari tabel `website_settings`
--

CREATE TABLE `website_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `map_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `facebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `instagram` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `twitter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `youtube` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `live_job` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `companies` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `candidates` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `website_settings`
--

INSERT INTO `website_settings` (`id`, `phone`, `address`, `map_address`, `facebook`, `instagram`, `twitter`, `youtube`, `title`, `sub_title`, `description`, `live_job`, `companies`, `candidates`, `created_at`, `updated_at`) VALUES
(1, '(021) 33445566', '6391 Elgin St. Celina, Delaware 10299, New York, United States of America', 'Zakir Soft Map', 'https://www.facebook.com/zakirsoft', 'https://www.instagram.com/zakirsoft', 'https://www.twitter.com/zakirsoft', 'https://www.youtube.com/zakirsoft', 'Who we are', 'We’re highly skilled and professionals team.', 'Praesent non sem facilisis, hendrerit nisi vitae, volutpat quam. Aliquam metus mauris, semper eu eros vitae, blandit tristique metus. Vestibulum maximus nec justo sed maximus.', '175,324', '97,354', '3,847,154', '2023-02-24 04:43:20', '2023-02-24 04:43:20');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `abouts`
--
ALTER TABLE `abouts`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `admins_email_unique` (`email`) USING BTREE;

--
-- Indeks untuk tabel `admin_searches`
--
ALTER TABLE `admin_searches`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `application_groups`
--
ALTER TABLE `application_groups`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `application_groups_company_id_foreign` (`company_id`) USING BTREE;

--
-- Indeks untuk tabel `applied_jobs`
--
ALTER TABLE `applied_jobs`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `applied_jobs_candidate_id_foreign` (`candidate_id`) USING BTREE,
  ADD KEY `applied_jobs_job_id_foreign` (`job_id`) USING BTREE,
  ADD KEY `applied_jobs_candidate_resume_id_foreign` (`candidate_resume_id`) USING BTREE,
  ADD KEY `applied_jobs_application_group_id_foreign` (`application_group_id`) USING BTREE;

--
-- Indeks untuk tabel `benefits`
--
ALTER TABLE `benefits`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `benefit_translations`
--
ALTER TABLE `benefit_translations`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `benefit_translations_benefit_id_foreign` (`benefit_id`) USING BTREE;

--
-- Indeks untuk tabel `bookmark_candidate_company`
--
ALTER TABLE `bookmark_candidate_company`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `bookmark_candidate_company_candidate_id_foreign` (`candidate_id`) USING BTREE,
  ADD KEY `bookmark_candidate_company_company_id_foreign` (`company_id`) USING BTREE;

--
-- Indeks untuk tabel `bookmark_candidate_job`
--
ALTER TABLE `bookmark_candidate_job`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `bookmark_candidate_job_candidate_id_foreign` (`candidate_id`) USING BTREE,
  ADD KEY `bookmark_candidate_job_job_id_foreign` (`job_id`) USING BTREE;

--
-- Indeks untuk tabel `bookmark_company`
--
ALTER TABLE `bookmark_company`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `bookmark_company_company_id_foreign` (`company_id`) USING BTREE,
  ADD KEY `bookmark_company_candidate_id_foreign` (`candidate_id`) USING BTREE,
  ADD KEY `bookmark_company_category_id_foreign` (`category_id`) USING BTREE;

--
-- Indeks untuk tabel `bookmark_company_category`
--
ALTER TABLE `bookmark_company_category`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `bookmark_company_category_bookmark_id_foreign` (`bookmark_id`) USING BTREE,
  ADD KEY `bookmark_company_category_category_id_foreign` (`category_id`) USING BTREE;

--
-- Indeks untuk tabel `candidates`
--
ALTER TABLE `candidates`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `candidates_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `candidates_role_id_foreign` (`role_id`) USING BTREE,
  ADD KEY `candidates_profession_id_foreign` (`profession_id`) USING BTREE,
  ADD KEY `candidates_experience_id_foreign` (`experience_id`) USING BTREE,
  ADD KEY `candidates_education_id_foreign` (`education_id`) USING BTREE;

--
-- Indeks untuk tabel `candidate_cv_views`
--
ALTER TABLE `candidate_cv_views`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `candidate_cv_views_company_id_foreign` (`company_id`) USING BTREE,
  ADD KEY `candidate_cv_views_candidate_id_foreign` (`candidate_id`) USING BTREE;

--
-- Indeks untuk tabel `candidate_education`
--
ALTER TABLE `candidate_education`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `candidate_education_candidate_id_foreign` (`candidate_id`) USING BTREE;

--
-- Indeks untuk tabel `candidate_experiences`
--
ALTER TABLE `candidate_experiences`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `candidate_experiences_candidate_id_foreign` (`candidate_id`) USING BTREE;

--
-- Indeks untuk tabel `candidate_language`
--
ALTER TABLE `candidate_language`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `candidate_language_candidate_id_foreign` (`candidate_id`) USING BTREE,
  ADD KEY `candidate_language_candidate_language_id_foreign` (`candidate_language_id`) USING BTREE;

--
-- Indeks untuk tabel `candidate_languages`
--
ALTER TABLE `candidate_languages`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `candidate_resumes`
--
ALTER TABLE `candidate_resumes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `candidate_resumes_candidate_id_foreign` (`candidate_id`) USING BTREE;

--
-- Indeks untuk tabel `candidate_skill`
--
ALTER TABLE `candidate_skill`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `candidate_skill_candidate_id_foreign` (`candidate_id`) USING BTREE,
  ADD KEY `candidate_skill_skill_id_foreign` (`skill_id`) USING BTREE;

--
-- Indeks untuk tabel `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `cities_state_id_foreign` (`state_id`) USING BTREE;

--
-- Indeks untuk tabel `cms`
--
ALTER TABLE `cms`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `cms_contents`
--
ALTER TABLE `cms_contents`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `companies_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `companies_industry_type_id_foreign` (`industry_type_id`) USING BTREE,
  ADD KEY `companies_organization_type_id_foreign` (`organization_type_id`) USING BTREE,
  ADD KEY `companies_team_size_id_foreign` (`team_size_id`) USING BTREE;

--
-- Indeks untuk tabel `company_applied_job_rejected`
--
ALTER TABLE `company_applied_job_rejected`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `company_applied_job_rejected_company_id_foreign` (`company_id`) USING BTREE,
  ADD KEY `company_applied_job_rejected_applied_job_id_foreign` (`applied_job_id`) USING BTREE;

--
-- Indeks untuk tabel `company_applied_job_shortlist`
--
ALTER TABLE `company_applied_job_shortlist`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `company_applied_job_shortlist_company_id_foreign` (`company_id`) USING BTREE,
  ADD KEY `company_applied_job_shortlist_applied_job_id_foreign` (`applied_job_id`) USING BTREE;

--
-- Indeks untuk tabel `company_bookmark_categories`
--
ALTER TABLE `company_bookmark_categories`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `company_bookmark_categories_company_id_foreign` (`company_id`) USING BTREE;

--
-- Indeks untuk tabel `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `contact_infos`
--
ALTER TABLE `contact_infos`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `contact_infos_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indeks untuk tabel `cookies`
--
ALTER TABLE `cookies`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `earnings`
--
ALTER TABLE `earnings`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `earnings_company_id_foreign` (`company_id`) USING BTREE,
  ADD KEY `earnings_manual_payment_id_foreign` (`manual_payment_id`) USING BTREE,
  ADD KEY `earnings_plan_id_foreign` (`plan_id`) USING BTREE;

--
-- Indeks untuk tabel `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `emails_email_unique` (`email`) USING BTREE;

--
-- Indeks untuk tabel `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `experiences`
--
ALTER TABLE `experiences`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`) USING BTREE;

--
-- Indeks untuk tabel `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `faqs_faq_category_id_foreign` (`faq_category_id`) USING BTREE;

--
-- Indeks untuk tabel `faq_categories`
--
ALTER TABLE `faq_categories`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `faq_categories_name_unique` (`name`) USING BTREE,
  ADD UNIQUE KEY `faq_categories_slug_unique` (`slug`) USING BTREE;

--
-- Indeks untuk tabel `industry_types`
--
ALTER TABLE `industry_types`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `industry_type_translations`
--
ALTER TABLE `industry_type_translations`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `industry_type_translations_industry_type_id_foreign` (`industry_type_id`) USING BTREE;

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `jobs_company_id_foreign` (`company_id`) USING BTREE,
  ADD KEY `jobs_category_id_foreign` (`category_id`) USING BTREE,
  ADD KEY `jobs_role_id_foreign` (`role_id`) USING BTREE,
  ADD KEY `jobs_experience_id_foreign` (`experience_id`) USING BTREE,
  ADD KEY `jobs_education_id_foreign` (`education_id`) USING BTREE,
  ADD KEY `jobs_job_type_id_foreign` (`job_type_id`) USING BTREE,
  ADD KEY `jobs_salary_type_id_foreign` (`salary_type_id`) USING BTREE;

--
-- Indeks untuk tabel `job_benefit`
--
ALTER TABLE `job_benefit`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `job_benefit_job_id_foreign` (`job_id`) USING BTREE,
  ADD KEY `job_benefit_benefit_id_foreign` (`benefit_id`) USING BTREE;

--
-- Indeks untuk tabel `job_categories`
--
ALTER TABLE `job_categories`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `job_category_translations`
--
ALTER TABLE `job_category_translations`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `job_category_translations_job_category_id_foreign` (`job_category_id`) USING BTREE;

--
-- Indeks untuk tabel `job_roles`
--
ALTER TABLE `job_roles`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `job_role_translations`
--
ALTER TABLE `job_role_translations`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `job_role_translations_job_role_id_foreign` (`job_role_id`) USING BTREE;

--
-- Indeks untuk tabel `job_tag`
--
ALTER TABLE `job_tag`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `job_tag_job_id_foreign` (`job_id`) USING BTREE,
  ADD KEY `job_tag_tag_id_foreign` (`tag_id`) USING BTREE;

--
-- Indeks untuk tabel `job_types`
--
ALTER TABLE `job_types`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `languages_name_unique` (`name`) USING BTREE,
  ADD UNIQUE KEY `languages_code_unique` (`code`) USING BTREE,
  ADD UNIQUE KEY `languages_icon_unique` (`icon`) USING BTREE;

--
-- Indeks untuk tabel `manual_payments`
--
ALTER TABLE `manual_payments`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`) USING BTREE,
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE;

--
-- Indeks untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`) USING BTREE,
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE;

--
-- Indeks untuk tabel `nationalities`
--
ALTER TABLE `nationalities`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`) USING BTREE;

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `organization_types`
--
ALTER TABLE `organization_types`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `our_missions`
--
ALTER TABLE `our_missions`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`) USING BTREE;

--
-- Indeks untuk tabel `payment_settings`
--
ALTER TABLE `payment_settings`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `plans_label_unique` (`label`) USING BTREE;

--
-- Indeks untuk tabel `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `posts_category_id_foreign` (`category_id`) USING BTREE,
  ADD KEY `posts_author_id_foreign` (`author_id`) USING BTREE;

--
-- Indeks untuk tabel `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `post_comments_author_id_foreign` (`author_id`) USING BTREE,
  ADD KEY `post_comments_post_id_foreign` (`post_id`) USING BTREE;

--
-- Indeks untuk tabel `professions`
--
ALTER TABLE `professions`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `profession_translations`
--
ALTER TABLE `profession_translations`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `profession_translations_profession_id_foreign` (`profession_id`) USING BTREE;

--
-- Indeks untuk tabel `queue_jobs`
--
ALTER TABLE `queue_jobs`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `queue_jobs_queue_index` (`queue`) USING BTREE;

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`) USING BTREE,
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`) USING BTREE;

--
-- Indeks untuk tabel `salary_types`
--
ALTER TABLE `salary_types`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `seos`
--
ALTER TABLE `seos`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `seo_page_contents`
--
ALTER TABLE `seo_page_contents`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `seo_page_contents_page_id_foreign` (`page_id`) USING BTREE;

--
-- Indeks untuk tabel `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `settings_app_country_foreign` (`app_country`) USING BTREE;

--
-- Indeks untuk tabel `setup_guides`
--
ALTER TABLE `setup_guides`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `skill_translations`
--
ALTER TABLE `skill_translations`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `skill_translations_skill_id_foreign` (`skill_id`) USING BTREE;

--
-- Indeks untuk tabel `social_links`
--
ALTER TABLE `social_links`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `social_links_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indeks untuk tabel `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `states_country_id_foreign` (`country_id`) USING BTREE;

--
-- Indeks untuk tabel `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `tag_translations`
--
ALTER TABLE `tag_translations`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `tag_translations_tag_id_foreign` (`tag_id`) USING BTREE;

--
-- Indeks untuk tabel `team_sizes`
--
ALTER TABLE `team_sizes`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `terms_categories`
--
ALTER TABLE `terms_categories`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `theme_settings`
--
ALTER TABLE `theme_settings`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `timezones`
--
ALTER TABLE `timezones`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `users_email_unique` (`email`) USING BTREE;

--
-- Indeks untuk tabel `user_plans`
--
ALTER TABLE `user_plans`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_plans_company_id_foreign` (`company_id`) USING BTREE,
  ADD KEY `user_plans_plan_id_foreign` (`plan_id`) USING BTREE;

--
-- Indeks untuk tabel `website_settings`
--
ALTER TABLE `website_settings`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `abouts`
--
ALTER TABLE `abouts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `admin_searches`
--
ALTER TABLE `admin_searches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `application_groups`
--
ALTER TABLE `application_groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `applied_jobs`
--
ALTER TABLE `applied_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `benefits`
--
ALTER TABLE `benefits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `benefit_translations`
--
ALTER TABLE `benefit_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `bookmark_candidate_company`
--
ALTER TABLE `bookmark_candidate_company`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bookmark_candidate_job`
--
ALTER TABLE `bookmark_candidate_job`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bookmark_company`
--
ALTER TABLE `bookmark_company`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bookmark_company_category`
--
ALTER TABLE `bookmark_company_category`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `candidates`
--
ALTER TABLE `candidates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `candidate_cv_views`
--
ALTER TABLE `candidate_cv_views`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `candidate_education`
--
ALTER TABLE `candidate_education`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `candidate_experiences`
--
ALTER TABLE `candidate_experiences`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `candidate_language`
--
ALTER TABLE `candidate_language`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `candidate_languages`
--
ALTER TABLE `candidate_languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT untuk tabel `candidate_resumes`
--
ALTER TABLE `candidate_resumes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `candidate_skill`
--
ALTER TABLE `candidate_skill`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `cms`
--
ALTER TABLE `cms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `cms_contents`
--
ALTER TABLE `cms_contents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `company_applied_job_rejected`
--
ALTER TABLE `company_applied_job_rejected`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `company_applied_job_shortlist`
--
ALTER TABLE `company_applied_job_shortlist`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `company_bookmark_categories`
--
ALTER TABLE `company_bookmark_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `contact_infos`
--
ALTER TABLE `contact_infos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `cookies`
--
ALTER TABLE `cookies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `earnings`
--
ALTER TABLE `earnings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `education`
--
ALTER TABLE `education`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `emails`
--
ALTER TABLE `emails`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `experiences`
--
ALTER TABLE `experiences`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `faq_categories`
--
ALTER TABLE `faq_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `industry_types`
--
ALTER TABLE `industry_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `industry_type_translations`
--
ALTER TABLE `industry_type_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `job_benefit`
--
ALTER TABLE `job_benefit`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `job_categories`
--
ALTER TABLE `job_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `job_category_translations`
--
ALTER TABLE `job_category_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `job_roles`
--
ALTER TABLE `job_roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `job_role_translations`
--
ALTER TABLE `job_role_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `job_tag`
--
ALTER TABLE `job_tag`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `job_types`
--
ALTER TABLE `job_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `manual_payments`
--
ALTER TABLE `manual_payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT untuk tabel `nationalities`
--
ALTER TABLE `nationalities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `organization_types`
--
ALTER TABLE `organization_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `our_missions`
--
ALTER TABLE `our_missions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `payment_settings`
--
ALTER TABLE `payment_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT untuk tabel `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `professions`
--
ALTER TABLE `professions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `profession_translations`
--
ALTER TABLE `profession_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `queue_jobs`
--
ALTER TABLE `queue_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `salary_types`
--
ALTER TABLE `salary_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `seos`
--
ALTER TABLE `seos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `seo_page_contents`
--
ALTER TABLE `seo_page_contents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `setup_guides`
--
ALTER TABLE `setup_guides`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `skills`
--
ALTER TABLE `skills`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `skill_translations`
--
ALTER TABLE `skill_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `social_links`
--
ALTER TABLE `social_links`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `tag_translations`
--
ALTER TABLE `tag_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `team_sizes`
--
ALTER TABLE `team_sizes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `terms_categories`
--
ALTER TABLE `terms_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `theme_settings`
--
ALTER TABLE `theme_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `timezones`
--
ALTER TABLE `timezones`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=421;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `user_plans`
--
ALTER TABLE `user_plans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `website_settings`
--
ALTER TABLE `website_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `application_groups`
--
ALTER TABLE `application_groups`
  ADD CONSTRAINT `application_groups_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `applied_jobs`
--
ALTER TABLE `applied_jobs`
  ADD CONSTRAINT `applied_jobs_application_group_id_foreign` FOREIGN KEY (`application_group_id`) REFERENCES `application_groups` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `applied_jobs_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `applied_jobs_candidate_resume_id_foreign` FOREIGN KEY (`candidate_resume_id`) REFERENCES `candidate_resumes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `applied_jobs_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `benefit_translations`
--
ALTER TABLE `benefit_translations`
  ADD CONSTRAINT `benefit_translations_benefit_id_foreign` FOREIGN KEY (`benefit_id`) REFERENCES `benefits` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `bookmark_candidate_company`
--
ALTER TABLE `bookmark_candidate_company`
  ADD CONSTRAINT `bookmark_candidate_company_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `bookmark_candidate_company_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `bookmark_candidate_job`
--
ALTER TABLE `bookmark_candidate_job`
  ADD CONSTRAINT `bookmark_candidate_job_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `bookmark_candidate_job_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `bookmark_company`
--
ALTER TABLE `bookmark_company`
  ADD CONSTRAINT `bookmark_company_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `bookmark_company_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `company_bookmark_categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `bookmark_company_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `bookmark_company_category`
--
ALTER TABLE `bookmark_company_category`
  ADD CONSTRAINT `bookmark_company_category_bookmark_id_foreign` FOREIGN KEY (`bookmark_id`) REFERENCES `bookmark_company` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `bookmark_company_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `company_bookmark_categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `candidates`
--
ALTER TABLE `candidates`
  ADD CONSTRAINT `candidates_education_id_foreign` FOREIGN KEY (`education_id`) REFERENCES `education` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `candidates_experience_id_foreign` FOREIGN KEY (`experience_id`) REFERENCES `experiences` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `candidates_profession_id_foreign` FOREIGN KEY (`profession_id`) REFERENCES `professions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `candidates_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `job_roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `candidates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `candidate_cv_views`
--
ALTER TABLE `candidate_cv_views`
  ADD CONSTRAINT `candidate_cv_views_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `candidate_cv_views_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `candidate_education`
--
ALTER TABLE `candidate_education`
  ADD CONSTRAINT `candidate_education_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `candidate_experiences`
--
ALTER TABLE `candidate_experiences`
  ADD CONSTRAINT `candidate_experiences_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `candidate_language`
--
ALTER TABLE `candidate_language`
  ADD CONSTRAINT `candidate_language_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `candidate_language_candidate_language_id_foreign` FOREIGN KEY (`candidate_language_id`) REFERENCES `candidate_languages` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `candidate_resumes`
--
ALTER TABLE `candidate_resumes`
  ADD CONSTRAINT `candidate_resumes_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `candidate_skill`
--
ALTER TABLE `candidate_skill`
  ADD CONSTRAINT `candidate_skill_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `candidate_skill_skill_id_foreign` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_industry_type_id_foreign` FOREIGN KEY (`industry_type_id`) REFERENCES `industry_types` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `companies_organization_type_id_foreign` FOREIGN KEY (`organization_type_id`) REFERENCES `organization_types` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `companies_team_size_id_foreign` FOREIGN KEY (`team_size_id`) REFERENCES `team_sizes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `companies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `company_applied_job_rejected`
--
ALTER TABLE `company_applied_job_rejected`
  ADD CONSTRAINT `company_applied_job_rejected_applied_job_id_foreign` FOREIGN KEY (`applied_job_id`) REFERENCES `applied_jobs` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `company_applied_job_rejected_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `company_applied_job_shortlist`
--
ALTER TABLE `company_applied_job_shortlist`
  ADD CONSTRAINT `company_applied_job_shortlist_applied_job_id_foreign` FOREIGN KEY (`applied_job_id`) REFERENCES `applied_jobs` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `company_applied_job_shortlist_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `company_bookmark_categories`
--
ALTER TABLE `company_bookmark_categories`
  ADD CONSTRAINT `company_bookmark_categories_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `contact_infos`
--
ALTER TABLE `contact_infos`
  ADD CONSTRAINT `contact_infos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `earnings`
--
ALTER TABLE `earnings`
  ADD CONSTRAINT `earnings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `earnings_manual_payment_id_foreign` FOREIGN KEY (`manual_payment_id`) REFERENCES `manual_payments` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `earnings_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `faqs`
--
ALTER TABLE `faqs`
  ADD CONSTRAINT `faqs_faq_category_id_foreign` FOREIGN KEY (`faq_category_id`) REFERENCES `faq_categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `industry_type_translations`
--
ALTER TABLE `industry_type_translations`
  ADD CONSTRAINT `industry_type_translations_industry_type_id_foreign` FOREIGN KEY (`industry_type_id`) REFERENCES `industry_types` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `jobs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `job_categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `jobs_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `jobs_education_id_foreign` FOREIGN KEY (`education_id`) REFERENCES `education` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `jobs_experience_id_foreign` FOREIGN KEY (`experience_id`) REFERENCES `experiences` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `jobs_job_type_id_foreign` FOREIGN KEY (`job_type_id`) REFERENCES `job_types` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `jobs_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `job_roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `jobs_salary_type_id_foreign` FOREIGN KEY (`salary_type_id`) REFERENCES `salary_types` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `job_benefit`
--
ALTER TABLE `job_benefit`
  ADD CONSTRAINT `job_benefit_benefit_id_foreign` FOREIGN KEY (`benefit_id`) REFERENCES `benefits` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `job_benefit_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `job_category_translations`
--
ALTER TABLE `job_category_translations`
  ADD CONSTRAINT `job_category_translations_job_category_id_foreign` FOREIGN KEY (`job_category_id`) REFERENCES `job_categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `job_role_translations`
--
ALTER TABLE `job_role_translations`
  ADD CONSTRAINT `job_role_translations_job_role_id_foreign` FOREIGN KEY (`job_role_id`) REFERENCES `job_roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `job_tag`
--
ALTER TABLE `job_tag`
  ADD CONSTRAINT `job_tag_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `job_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `post_categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `profession_translations`
--
ALTER TABLE `profession_translations`
  ADD CONSTRAINT `profession_translations_profession_id_foreign` FOREIGN KEY (`profession_id`) REFERENCES `professions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `seo_page_contents`
--
ALTER TABLE `seo_page_contents`
  ADD CONSTRAINT `seo_page_contents_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `seos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `settings`
--
ALTER TABLE `settings`
  ADD CONSTRAINT `settings_app_country_foreign` FOREIGN KEY (`app_country`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `skill_translations`
--
ALTER TABLE `skill_translations`
  ADD CONSTRAINT `skill_translations_skill_id_foreign` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `social_links`
--
ALTER TABLE `social_links`
  ADD CONSTRAINT `social_links_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `states`
--
ALTER TABLE `states`
  ADD CONSTRAINT `states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `tag_translations`
--
ALTER TABLE `tag_translations`
  ADD CONSTRAINT `tag_translations_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ketidakleluasaan untuk tabel `user_plans`
--
ALTER TABLE `user_plans`
  ADD CONSTRAINT `user_plans_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `user_plans_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
