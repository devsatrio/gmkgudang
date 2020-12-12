-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 05, 2020 at 10:50 PM
-- Server version: 5.7.32-0ubuntu0.18.04.1
-- PHP Version: 7.3.20-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_gudang`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_barang` text COLLATE utf8mb4_unicode_ci,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci,
  `stok` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `kode_barang`, `nama`, `deskripsi`, `stok`, `harga`, `created_at`, `updated_at`) VALUES
(1, 'BB101', 'Bolak Balik Cewek Cowok L', 'PARKA', 40, 73000, '2020-11-21 04:22:45', NULL),
(2, 'FL101', 'FLEECE 55', 'FLEECE', 35, 73000, '2020-11-21 04:22:45', NULL),
(3, 'JP101', 'PARKA CEWEK', 'PARKA', 60, 73000, '2020-11-21 04:22:45', NULL),
(4, 'PS102', 'HOODIE SLETING', 'HOODIE', 75, 73000, '2020-11-21 04:22:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `barangkey`
--

CREATE TABLE `barangkey` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_barang` text COLLATE utf8mb4_unicode_ci,
  `key_barang` text COLLATE utf8mb4_unicode_ci,
  `skuinduk` text COLLATE utf8mb4_unicode_ci,
  `sku` text COLLATE utf8mb4_unicode_ci,
  `tgl_upload` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barangkey`
--

INSERT INTO `barangkey` (`id`, `kode_barang`, `key_barang`, `skuinduk`, `sku`, `tgl_upload`) VALUES
(1, 'JP101', 'jaket polos zipper hoodie m,l,xl,xxl hitam marun army pria wanita wame/Jaket Hoodie Polos/JaketPolos', ' Sleting Polos Murah Maroon XXL', ' Jaket Polos Zipper Murah', '2020-11-24'),
(2, 'JP101', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', ' Polos C XXXXL 01', ' Jaket Polos Grade C', '2020-11-24'),
(3, 'JP101', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', ' Polos C XXXL 02', ' Jaket Polos Grade C', '2020-11-24'),
(4, 'JP101', 'YANG LAGI HITS Kemeja Flanel Distro Cowok Lengan Panjang Warna Biru Dongker Garis Merah Seri', ' Kemeja Flannel XL', ' KEMEJA FLANEL', '2020-11-24'),
(5, 'BB101', 'Sweater Hoodie Humble/Sweater Wanita Humble/Sweater Pria Humble/Sweater Motif/Sweater Kantung Depan', ' ', ' KEMEJA FLANEL', '2020-11-24'),
(6, 'BB101', 'Jaket Parka Wanita Merah Navy / All Collor/Size L/Cewek Casual Outdoor Gunung Parasut Anti Air Keren', ' BBCE0208', ' BBCE', '2020-11-24'),
(7, 'BB101', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', ' Polos C XXL 04', ' Jaket Polos Grade C', '2020-11-24'),
(8, 'BB101', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', ' Polos C XXXXXL 04', ' Jaket Polos Grade C', '2020-11-24'),
(9, 'PS102', 'SWEATER SANTUY MURAH/SANTUY THE FOOT/SWEATER HOODIE/GROSIR JAKET PRIA WANITA/', ' Polos C XXXXXL 04', ' Jaket Polos Grade C', '2020-11-24'),
(10, 'PS178', 'Sweater wanita SO CUTE panas musim gugur berkerudung dingin versi korea/Jaket Wanita Korea Kekinian', ' Polos C XXXXXL 04', ' Jaket Polos Grade C', '2020-11-24');

-- --------------------------------------------------------

--
-- Table structure for table `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `id` int(11) NOT NULL,
  `kode` text,
  `jumlah` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `keterangan` text,
  `tanggal` date DEFAULT NULL,
  `total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang_keluar`
--

INSERT INTO `barang_keluar` (`id`, `kode`, `jumlah`, `harga`, `keterangan`, `tanggal`, `total`) VALUES
(2, 'PS102', 75, 70000, 'Test 1', '2020-11-26', 5250000),
(3, 'BB103', 10, 80000, 'Test 2', '2020-11-26', 800000);

-- --------------------------------------------------------

--
-- Table structure for table `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id` int(11) NOT NULL,
  `kode` text,
  `jumlah` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `keterangan` text,
  `tanggal` date DEFAULT NULL,
  `total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang_masuk`
--

INSERT INTO `barang_masuk` (`id`, `kode`, `jumlah`, `harga`, `keterangan`, `tanggal`, `total`) VALUES
(9, 'BB101', 10, 73000, 'Coba 1', '2020-11-25', 730000),
(10, 'FL101', 20, 73000, 'Coba 2', '2020-11-25', 1460000),
(11, 'PS102', 30, 1000, 'Coba 3', '2020-11-25', 30000),
(12, 'BB101', 10, 73000, 'Coba 1', '2020-11-26', 730000),
(13, 'FL101', 20, 73000, 'Coba 2', '2020-11-26', 1460000),
(14, 'PS102', 30, 1000, 'Coba 3', '2020-11-26', 30000);

-- --------------------------------------------------------

--
-- Table structure for table `barang_scan`
--

CREATE TABLE `barang_scan` (
  `id` int(11) NOT NULL,
  `tgl` varchar(50) NOT NULL DEFAULT '0',
  `noresi` varchar(100) NOT NULL DEFAULT '0',
  `skuinduk` varchar(300) NOT NULL DEFAULT '0',
  `sku` varchar(300) NOT NULL DEFAULT '0',
  `barang` varchar(300) NOT NULL DEFAULT '0',
  `jumlah` int(11) NOT NULL DEFAULT '0',
  `harga` int(11) NOT NULL DEFAULT '0',
  `total` int(11) NOT NULL DEFAULT '0',
  `stts` enum('terkirim','batal') NOT NULL DEFAULT 'terkirim'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang_scan`
--

INSERT INTO `barang_scan` (`id`, `tgl`, `noresi`, `skuinduk`, `sku`, `barang`, `jumlah`, `harga`, `total`, `stts`) VALUES
(1, '0', 'JP5256098046', ' Jaket Polos Zipper Murah', ' Sleting Polos Murah Maroon XXL', 'jaket polos zipper hoodie m,l,xl,xxl hitam marun army pria wanita wame/Jaket Hoodie Polos/JaketPolos', 1, 65000, 65000, 'batal'),
(2, '2020-11-29', 'JP2874769234', ' Jaket Polos Grade C', ' Polos C XXXXL 01', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', 1, 69900, 69900, 'terkirim'),
(3, '2020-11-29', 'JP2874769234', ' Jaket Polos Grade C', ' Polos C XXXL 02', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', 1, 69900, 69900, 'terkirim'),
(4, '2020-11-29', 'JP8260522081', ' BBCE', ' BBCE0208', 'Jaket Parka Wanita Merah Navy / All Collor/Size L/Cewek Casual Outdoor Gunung Parasut Anti Air Keren', 1, 85000, 85000, 'batal'),
(5, '2020-11-29', 'JP4782133963', ' Jaket Polos Grade C', ' Polos C XXL 04', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', 1, 69900, 69900, 'terkirim'),
(6, '2020-11-29', 'JP4782133963', ' Jaket Polos Grade C', ' Polos C XXXXXL 04', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', 1, 69900, 69900, 'terkirim'),
(7, '2020-11-29', 'NLIDAP1062807166', 'FL101', 'Ksiclab 10-01 XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 1, 50300, 50300, 'terkirim'),
(8, '2020-11-29', 'NLIDAP1062807166', 'FL101', 'Ksiclab 01-10 XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 1, 50300, 50300, 'terkirim');

-- --------------------------------------------------------

--
-- Table structure for table `barang_trx`
--

CREATE TABLE `barang_trx` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `noresi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `skuindex` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `barang` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `jenis` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `admin` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stts` enum('batal','sended') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sended',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barang_trx`
--

INSERT INTO `barang_trx` (`id`, `noresi`, `sku`, `skuindex`, `barang`, `tgl`, `jumlah`, `harga`, `total`, `jenis`, `admin`, `stts`, `created_at`, `updated_at`) VALUES
(15, 'JP2874769234', ' Polos C XXXL 02', 'JP101', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', '2020-11-24', 1, 69900, 69900, 'shopee', 'Sopo Nyono', 'batal', '2020-11-26 04:09:59', '2020-11-27 07:13:06'),
(16, 'JP4920767647', ' Kemeja Flannel XL', 'JP101', 'YANG LAGI HITS Kemeja Flanel Distro Cowok Lengan Panjang Warna Biru Dongker Garis Merah Seri', '2020-11-24', 1, 65000, 65000, 'shopee', 'Sopo Nyono', 'sended', '2020-11-26 04:09:59', '2020-11-26 04:09:59'),
(17, 'JP4920767647', ' ', 'BB101', 'Sweater Hoodie Humble/Sweater Wanita Humble/Sweater Pria Humble/Sweater Motif/Sweater Kantung Depan', '2020-11-24', 1, 47500, 47500, 'shopee', 'Sopo Nyono', 'sended', '2020-11-26 12:38:42', '2020-11-26 12:38:42'),
(18, 'JP8260522081', ' BBCE0208', 'BB101', 'Jaket Parka Wanita Merah Navy / All Collor/Size L/Cewek Casual Outdoor Gunung Parasut Anti Air Keren', '2020-11-24', 1, 85000, 85000, 'shopee', 'deva satrio damara', 'sended', '2020-11-26 12:38:42', '2020-11-26 12:38:42'),
(19, 'JP4782133963', ' Polos C XXL 04', 'JP101', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', '2020-11-26', 1, 69900, 69900, 'shopee', 'deva satrio damara', 'sended', '2020-11-26 12:48:01', '2020-11-26 12:48:01'),
(20, 'JP4782133963', ' Polos C XXXXXL 04', 'JP101', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', '2020-11-26', 1, 69900, 69900, 'shopee', 'Rifka', 'sended', '2020-11-26 12:48:01', '2020-11-26 12:48:01'),
(21, 'NLIDAP1062807408', 'Ksiclab 10-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-26', 1, 52800, 52800, 'lazada', 'Rifka', 'sended', '2020-11-26 14:24:56', '2020-11-26 14:24:56'),
(22, 'NLIDAP1062807457', 'Ksiclab 10-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-26', 1, 50300, 50300, 'lazada', 'Roni', 'sended', '2020-11-26 14:24:56', '2020-11-26 14:24:56'),
(23, 'NLIDAP1062807457', 'Ksiclab 01-10 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 50300, 50300, 'lazada', 'deva satrio damara', 'batal', '2020-11-27 01:44:41', '2020-11-27 06:58:53'),
(24, 'NLIDAP1062807168', 'Ksiclab 18-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 01:44:54', '2020-11-27 01:44:54'),
(25, 'NLIDAP1062807168', 'Ksiclab 01-18 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 01:45:11', '2020-11-27 01:45:11'),
(26, 'JP7626669494', ' Polos C XXXXXL 04', 'PS102', 'SWEATER SANTUY MURAH/SANTUY THE FOOT/SWEATER HOODIE/GROSIR JAKET PRIA WANITA/', '2020-11-27', 1, 47500, 47500, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 14:17:57', '2020-11-27 14:17:57'),
(27, 'test', 'a', 'b', 'PARKA CEWEK', '2020-12-05', 3, 73000, 219000, 'shopee', 'devasatrio', 'sended', '2020-12-05 15:34:59', '2020-12-05 15:34:59'),
(28, 'asdfsdfdeva', 'asdf', 'asdf', 'PARKA CEWEK', '2020-12-05', 3, 73000, 219000, 'shopee', 'devasatrio', 'sended', '2020-12-05 15:36:46', '2020-12-05 15:36:46'),
(29, 'coba', 'add', 'ddd', 'PARKA CEWEK', '2020-12-05', 3, 73000, 219000, 'shopee', 'devasatrio', 'sended', '2020-12-05 15:43:28', '2020-12-05 15:43:28'),
(30, 'asdfsdfdeva', 'asdf', 'asdf', 'PARKA CEWEK', '2020-12-05', 3, 73000, 219000, 'lazada', 'devasatrio', 'sended', '2020-12-05 15:44:38', '2020-12-05 15:44:38'),
(31, 'asdfsdfdeva', 'asdf', 'asdf', 'HOODIE SLETING', '2020-12-05', 9, 10000, 90000, 'shopee', 'devasatrio', 'sended', '2020-12-05 15:46:07', '2020-12-05 15:46:07'),
(32, 'asdfsadf', 'sasdf', 'sadf', 'Bolak Balik Cewek Cowok L', '2020-12-05', 8, 73000, 584000, 'lazada', 'devasatrio', 'sended', '2020-12-05 15:46:44', '2020-12-05 15:46:44'),
(33, 'asdfsadf', 'asdf', 'sadf', 'FLEECE 55', '2020-12-05', 5, 73000, 365000, 'shopee', 'devasatrio', 'sended', '2020-12-05 15:47:14', '2020-12-05 15:47:14'),
(34, 'asdfsdfdeva', 'sdf', 'asdf', 'PARKA CEWEK', '2020-12-05', 5, 73000, 365000, 'shopee', 'devasatrio', 'sended', '2020-12-05 15:49:28', '2020-12-05 15:49:28'),
(35, 'asdfsdfdeva', 'asdf', 'asdf', 'HOODIE SLETING', '2020-12-05', 5, 73000, 365000, 'shopee', 'devasatrio', 'sended', '2020-12-05 15:50:10', '2020-12-05 15:50:10');

-- --------------------------------------------------------

--
-- Table structure for table `barang_trx_manual`
--

CREATE TABLE `barang_trx_manual` (
  `id` bigint(20) NOT NULL,
  `pembuat` varchar(100) DEFAULT NULL,
  `barang` text,
  `jumlah` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `sku` varchar(150) DEFAULT NULL,
  `sku_induk` varchar(150) DEFAULT NULL,
  `resi` varchar(150) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL,
  `kode_barang` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_11_09_103844_create_barang_table', 2),
(5, '2020_11_09_103921_create_barangkey_table', 2),
(6, '2020_11_11_124047_create_temp_imports_table', 3),
(7, '2020_11_11_125036_create_barang_trxes_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temp_import`
--

CREATE TABLE `temp_import` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `noresi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `skuindex` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `barang` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `varian` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sts_kirim` enum('sudah','belum') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'belum',
  `sts_valid` enum('valid','belum') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'belum',
  `admin` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `jenis` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `temp_import`
--

INSERT INTO `temp_import` (`id`, `noresi`, `sku`, `skuindex`, `barang`, `varian`, `tgl`, `sts_kirim`, `sts_valid`, `admin`, `jumlah`, `harga`, `total`, `jenis`, `created_at`, `updated_at`) VALUES
(1, 'JP5256098046', ' Sleting Polos Murah Maroon XXL', ' Jaket Polos Zipper Murah', 'jaket polos zipper hoodie m,l,xl,xxl hitam marun army pria wanita wame/Jaket Hoodie Polos/JaketPolos', 'MAROON,XXL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 65000, 65000, 'shopee', '2020-11-24 06:28:58', '2020-11-25 01:30:17'),
(2, 'JP2874769234', ' Polos C XXXXL 01', ' Jaket Polos Grade C', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', 'Hitam,XXXXL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 69900, 69900, 'shopee', '2020-11-24 06:28:58', '2020-11-25 01:30:52'),
(3, 'JP2874769234', ' Polos C XXXL 02', ' Jaket Polos Grade C', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', 'Navy,XXXL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 69900, 69900, 'shopee', '2020-11-24 06:28:58', '2020-11-25 21:09:59'),
(4, 'JP4920767647', ' Kemeja Flannel XL', ' KEMEJA FLANEL', 'YANG LAGI HITS Kemeja Flanel Distro Cowok Lengan Panjang Warna Biru Dongker Garis Merah Seri', 'XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 65000, 65000, 'shopee', '2020-11-24 06:28:58', '2020-11-25 21:09:59'),
(5, 'JP4920767647', ' ', ' KEMEJA FLANEL', 'Sweater Hoodie Humble/Sweater Wanita Humble/Sweater Pria Humble/Sweater Motif/Sweater Kantung Depan', 'Hitam,L', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 47500, 47500, 'shopee', '2020-11-24 06:28:58', '2020-11-26 05:38:42'),
(6, 'JP8260522081', ' BBCE0208', ' BBCE', 'Jaket Parka Wanita Merah Navy / All Collor/Size L/Cewek Casual Outdoor Gunung Parasut Anti Air Keren', 'Navy - Turkish M/L', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 85000, 85000, 'shopee', '2020-11-24 06:28:58', '2020-11-26 05:38:42'),
(7, 'JP4782133963', ' Polos C XXL 04', ' Jaket Polos Grade C', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', 'Hijau botol,XXL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 69900, 69900, 'shopee', '2020-11-24 06:28:58', '2020-11-26 05:48:01'),
(8, 'JP4782133963', ' Polos C XXXXXL 04', ' Jaket Polos Grade C', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', 'Hijau botol,XXXXXL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 69900, 69900, 'shopee', '2020-11-24 06:28:58', '2020-11-26 05:48:01'),
(9, 'JP7626669494', ' Polos C XXXXXL 04', ' Jaket Polos Grade C', 'SWEATER SANTUY MURAH/SANTUY THE FOOT/SWEATER HOODIE/GROSIR JAKET PRIA WANITA/', 'Hitam', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 47500, 47500, 'shopee', '2020-11-24 06:28:58', '2020-11-27 07:17:57'),
(10, 'JP3171343188', ' Polos C XXXXXL 04', ' Jaket Polos Grade C', 'Sweater wanita SO CUTE panas musim gugur berkerudung dingin versi korea/Jaket Wanita Korea Kekinian', 'Kuning', '2020-11-24', 'belum', 'belum', 'deva satrio damara', 1, 47500, 47500, 'shopee', '2020-11-24 06:28:58', '2020-11-24 06:28:58'),
(136, 'NLIDAP1062165489', 'Ksiecnalb Kuning Hitam XL', 'FL101', 'Jaket Hoodie Korean Murah Ksienclab Tanpa Resleting', 'Jaket Hoodie Korean Murah Ksienclab Tanpa Resleting', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 55680, 55680, 'lazada', '2020-11-24 07:03:53', '2020-11-24 20:00:18'),
(137, 'NLIDAP1062389064', 'Ksiecnalb Kuning Hitam L', 'FL101', 'Jaket Hoodie Korean Murah Ksienclab Tanpa Resleting', 'Jaket Hoodie Korean Murah Ksienclab Tanpa Resleting', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 55680, 55680, 'lazada', '2020-11-24 07:03:53', '2020-11-24 20:00:18'),
(138, 'NLIDAP1062389019', 'Ksiclab 11-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 20:06:59'),
(139, 'NLIDAP1062807166', 'Ksiclab 10-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 50300, 50300, 'lazada', '2020-11-24 07:03:53', '2020-11-24 20:06:59'),
(140, 'NLIDAP1062807166', 'Ksiclab 01-10 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 50300, 50300, 'lazada', '2020-11-24 07:03:53', '2020-11-25 00:44:37'),
(141, 'NLIDAP1062807413', 'Ksiclab 01-00 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-25 00:44:37'),
(142, 'NLIDAP1062807413', 'Ksiclab 10-01 M', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-25 00:49:21'),
(143, 'NLIDAP1062807416', 'Ninja Polos 01 L', 'JN101', 'Jaket Zipper Ninja Pria Wanita Polos', 'Jaket Zipper Ninja Pria Wanita Polos', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 62400, 62400, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(144, 'NLIDAP1062807458', 'Ksiclab 18-01 M', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-25 00:49:21'),
(145, 'NLIDAP1062807458', 'Ksiclab 01-18 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-25 00:49:47'),
(146, 'NLIDAP1062807408', 'Ksiclab 01-10 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-25 00:49:47'),
(147, 'NLIDAP1062807408', 'Ksiclab 10-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-26 07:24:56'),
(148, 'NLIDAP1062807457', 'Ksiclab 10-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 50300, 50300, 'lazada', '2020-11-24 07:03:53', '2020-11-26 07:24:56'),
(149, 'NLIDAP1062807457', 'Ksiclab 01-10 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 50300, 50300, 'lazada', '2020-11-24 07:03:53', '2020-11-26 18:44:41'),
(150, 'NLIDAP1062807168', 'Ksiclab 18-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-26 18:44:54'),
(151, 'NLIDAP1062807168', 'Ksiclab 01-18 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-26 18:45:11'),
(152, 'NLIDAP1062807312', 'Parka Marun XL', 'JP102', 'Jaket Wanita Parka Cewek Premium size M L XXL', 'Jaket Wanita Parka Cewek Premium size M L XXL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 93000, 93000, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(153, 'NLIDAP1062807365', 'Parka Mustard XL', 'JP102', 'Jaket Wanita Parka Cewek Premium size M L XXL', 'Jaket Wanita Parka Cewek Premium size M L XXL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 93000, 93000, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(154, 'NLIDAP1062807455', 'Ksiclab 18-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(155, 'NLIDAP1062807455', 'Ksiclab 01-18 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(156, 'NLIDAP1062807273', 'Ksiclab 01-10 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(157, 'NLIDAP1062807411', 'Ksiclab 18-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(158, 'NLIDAP1062807411', 'Ksiclab 18-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(159, 'NLIDAP1062807232', 'Ksiclab 10-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(160, 'NLIDAP1062807169', 'Ninja Cewek Maroon L', 'JN101', 'Jaket Hoodie Ninja Resleting Dengan Penutup Mulut Premium size M L XL XXL', 'Jaket Hoodie Ninja Resleting Dengan Penutup Mulut Premium size M L XL XXL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 63272, 63272, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(161, 'NLIDAP1062807363', 'Ksiclab 01-00 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(162, 'NLIDAP1062807364', 'Ksiclab 01-18 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(163, 'NLIDAP1062807364', 'Ksiclab 18-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(164, 'NLIDAP1062807271', 'Ksiclab 11-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(165, 'NLIDAP1062807412', 'Ksiclab 18-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(166, 'NLIDAP1062807412', 'Ksiclab 18-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(167, 'NLIDAP1062807409', 'JAKET JEANS SANDWOSH HITAM XL', 'JE103', 'jaket pria /jaket jeans pria / jaket deim sandwosh pria /jaket cowok/Jaket Jeans Denim Regular pria', 'jaket pria /jaket jeans pria / jaket deim sandwosh pria /jaket cowok/Jaket Jeans Denim Regular pria', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 81764, 81764, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(168, 'NLIDAP1062807360', 'Ksiclab 01-00 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(169, 'NLIDAP1062807311', 'jaket zipper supreme girrafe navy XL', 'FL101', 'CartelGrosir.ID ZIPPER Supreme Girrafe Jaket Distro Sweater Hoody Pria Wanita Bahan Fleece Tebal', 'CartelGrosir.ID ZIPPER Supreme Girrafe Jaket Distro Sweater Hoody Pria Wanita Bahan Fleece Tebal', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 74880, 74880, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(170, 'NLIDAP1062807226', 'Ksiclab 01-18 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 50300, 50300, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(171, 'NLIDAP1062807226', 'Ksiclab 18-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 50300, 50300, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(172, 'NLIDAP1062807269', 'Ninja Cewek Navy XXL', 'JN103', 'Jaket Hoodie Ninja Resleting Dengan Penutup Mulut Premium size M L XL XXL', 'Jaket Hoodie Ninja Resleting Dengan Penutup Mulut Premium size M L XL XXL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 63272, 63272, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(173, 'NLIDAP1062807269', 'Ninja Cewek Navy XXL', 'JN103', 'Jaket Hoodie Ninja Resleting Dengan Penutup Mulut Premium size M L XL XXL', 'Jaket Hoodie Ninja Resleting Dengan Penutup Mulut Premium size M L XL XXL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 63272, 63272, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(174, 'NLIDAP1062807167', 'Ksiclab 01-00 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(175, 'NLIDAP1062807167', 'Ksiclab 18-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(176, 'NLIDAP1062807228', 'Ksiclab 01-11 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(177, 'NLIDAP1062807415', 'Ksiclab 10-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(178, 'NLIDAP1062807415', 'Ksiclab 10-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(179, 'NLIDAP1062807227', 'Ksiclab 10-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(180, 'NLIDAP1062807135', 'SWEATER DINOSAUR MARUN L', 'FE101', 'CartelGrosir.ID SWEATER DISTRO SWEATER PRIA JUMPER OBLONG COWOK JAKET PRIA MOTIF DINOSAUR', 'CartelGrosir.ID SWEATER DISTRO SWEATER PRIA JUMPER OBLONG COWOK JAKET PRIA MOTIF DINOSAUR', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 62752, 62752, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(181, 'NLIDAP1062807135', 'Celana chinos volcom/A ABU XL (32-33)', 'CC104', 'CartelGrosir.ID celana chino panjang,chino pria,chino combed,slimfit street', 'CartelGrosir.ID celana chino panjang,chino pria,chino combed,slimfit street', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 86108, 86108, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(182, 'NLIDAP1062807270', 'Ksiclab 01-00 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(183, 'NLIDAP1062807270', 'Ksiclab 01-00 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(184, 'NLIDAP1062807225', 'Ksiclab 10-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(185, 'NLIDAP1062807313', 'Ksiclab 18-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(186, 'NLIDAP1062807313', 'Ksiclab 18-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(187, 'NLIDAP1062807230', 'Hoodie Polos Navy 5XL', 'PS102', 'Jaket Hoodie Polos Pria Wanita Jumbo Murah XL - XXXXXL', 'Jaket Hoodie Polos Pria Wanita Jumbo Murah XL - XXXXXL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 67200, 67200, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(188, 'NLIDAP1062807229', 'Ksiclab 01-18 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(189, 'NLIDAP1062807229', 'Ksiclab 18-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(190, 'NLIDAP1062807414', 'Ksiclab 01-10 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(191, 'NLIDAP1062927951', 'Ksiclab 18-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(192, 'NLIDAP1062927951', 'Ksiclab 01-18 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(193, 'NLIDAP1062928214', 'jaket zipper salur hitam L', 'SA101', 'CartelGrosir.ID JAKET SWEATER MOTIF SALUR / JAKET MOTIF SALUR PRIA / JAKET STRIPE PRIA', 'CartelGrosir.ID JAKET SWEATER MOTIF SALUR / JAKET MOTIF SALUR PRIA / JAKET STRIPE PRIA', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 59010, 59010, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(194, 'NLIDAP1062928000', 'Ksiclab 01-18 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(195, 'NLIDAP1062928000', 'Ksiclab 18-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(196, 'NLIDAP1062928079', 'Ksiclab 01-11 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 50300, 50300, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(197, 'NLIDAP1062928079', 'Ksiclab 01-11 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 50300, 50300, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(198, 'NLIDAP1062928080', 'Ksiclab 01-18 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(199, 'NLIDAP1062928041', 'Ksiclab 01-11 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 50300, 50300, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(200, 'NLIDAP1062928040', 'Ninja Polos 01 XL', 'JN102', 'Jaket Zipper Ninja Pria Wanita Polos', 'Jaket Zipper Ninja Pria Wanita Polos', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 62400, 62400, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(201, 'NLIDAP1062928117', 'Ninja Polos 02 L', 'JN102', 'Jaket Zipper Ninja Pria Wanita Polos', 'Jaket Zipper Ninja Pria Wanita Polos', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 62400, 62400, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(202, 'NLIDAP1062928078', 'Ksiclab 00-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(203, 'NLIDAP1062928078', 'Ksiclab 01-00 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(204, 'NLIDAP1062928215', 'Ksiecnalb Mocca Hitam M', 'FL101', 'Jaket Hoodie Korean Murah Ksienclab Tanpa Resleting', 'Jaket Hoodie Korean Murah Ksienclab Tanpa Resleting', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 53720, 53720, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(205, 'NLIDAP1062928216', 'Hoodie Polos Hijau 5XL', 'PS102', 'Jaket Hoodie Polos Pria Wanita Jumbo Murah XL - XXXXXL', 'Jaket Hoodie Polos Pria Wanita Jumbo Murah XL - XXXXXL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 64700, 64700, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(206, 'NLIDAP1062928216', 'Hoodie Polos Maroon 5XL', 'PS102', 'Jaket Hoodie Polos Pria Wanita Jumbo Murah XL - XXXXXL', 'Jaket Hoodie Polos Pria Wanita Jumbo Murah XL - XXXXXL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 64700, 64700, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(207, 'NLIDAP1062928116', 'Ksiclab 01-18 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 51133, 51133, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(208, 'NLIDAP1062928116', 'Ksiclab 01-18 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 51133, 51133, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(209, 'NLIDAP1062928116', 'Ksiclab 18-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 51134, 51134, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(210, 'NLIDAP1062928213', 'Ksiclab 11-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telp` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gambar` text COLLATE utf8mb4_unicode_ci,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `level`, `email`, `telp`, `gambar`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'deva satrio damara', 'devasatrio', 'Super Admin', 'satrio@gmail.com', '0234890', '1591507920-love.png', NULL, '$2y$10$sQIyYXne5mnsZ3rEE6MNwOGweJXyWzCtFQZDWhgTNZSIjiYwvxuti', NULL, '2020-06-06 21:36:35', '2020-06-06 22:32:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barangkey`
--
ALTER TABLE `barangkey`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barang_scan`
--
ALTER TABLE `barang_scan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barang_trx`
--
ALTER TABLE `barang_trx`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barang_trx_manual`
--
ALTER TABLE `barang_trx_manual`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`(191));

--
-- Indexes for table `temp_import`
--
ALTER TABLE `temp_import`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `barangkey`
--
ALTER TABLE `barangkey`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `barang_scan`
--
ALTER TABLE `barang_scan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `barang_trx`
--
ALTER TABLE `barang_trx`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `barang_trx_manual`
--
ALTER TABLE `barang_trx_manual`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `temp_import`
--
ALTER TABLE `temp_import`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
