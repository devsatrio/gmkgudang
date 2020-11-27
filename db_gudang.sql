-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 27, 2020 at 09:38 PM
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
(1, 'BB101', 'Bolak Balik Cewek Cowok L', 'PARKA', 324, 73000, '2020-11-21 04:22:45', '2020-11-27 04:58:09'),
(2, 'FL101', 'FLEECE 55', 'FLEECE', -67, 73000, '2020-11-21 04:22:45', '2020-11-27 04:51:01'),
(3, 'JP101', 'PARKA CEWEK', 'PARKA', 60, 73000, '2020-11-21 04:22:45', '2020-11-27 04:36:09'),
(4, 'PS102', 'HOODIE SLETING', 'HOODIE', 74, 73000, '2020-11-21 04:22:45', '2020-11-27 04:51:01'),
(5, 'B0101', 'Boomber 7075', NULL, 9, 65000, '2020-11-27 06:24:14', '2020-11-27 06:28:49'),
(6, 'OS101', 'One Set', 'Setelan', 18, 50000, '2020-11-27 06:31:25', '2020-11-27 06:34:31');

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
(10, 'PS178', 'Sweater wanita SO CUTE panas musim gugur berkerudung dingin versi korea/Jaket Wanita Korea Kekinian', ' Polos C XXXXXL 04', ' Jaket Polos Grade C', '2020-11-24'),
(11, 'FL101', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', ' Polos C XXXL 02', ' Jaket Polos Grade C', '2020-11-27'),
(12, 'FL101', 'YANG LAGI HITS Kemeja Flanel Distro Cowok Lengan Panjang Warna Biru Dongker Garis Merah Seri', ' Kemeja Flannel XL', ' KEMEJA FLANEL', '2020-11-27'),
(13, 'BB101', 'Sweater Hoodie Humble/Sweater Wanita Humble/Sweater Pria Humble/Sweater Motif/Sweater Kantung Depan', ' ', ' KEMEJA FLANEL', '2020-11-27'),
(14, 'FL101', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', ' Polos C XXXL 02', ' Jaket Polos Grade C', '2020-11-27'),
(15, 'FL101', 'YANG LAGI HITS Kemeja Flanel Distro Cowok Lengan Panjang Warna Biru Dongker Garis Merah Seri', ' Kemeja Flannel XL', ' KEMEJA FLANEL', '2020-11-27'),
(16, 'BB101', 'Sweater Hoodie Humble/Sweater Wanita Humble/Sweater Pria Humble/Sweater Motif/Sweater Kantung Depan', ' ', ' KEMEJA FLANEL', '2020-11-27'),
(17, 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', ' PRKCE03XL', ' PRKCE', '2020-11-27'),
(18, 'FL101', '(BISA COD) SWEATER MR FASHION - HOODIE LETTER / SWEATER TALI | MISTER HOODIE SWEATER UNISEX TERMURAH', ' MR 04', ' MR hoodie', '2020-11-27'),
(19, 'PS102', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', ' MR 04', ' MR hoodie', '2020-11-27'),
(20, 'PS102', '( BAYAR DITEMPAT ) KEMEJA FLANNEL LENGAN PANJANG PALING HITS / HEM KOTAK - KOTAK BAHAN FLANNEL MURAH', ' MR 04', ' MR hoodie', '2020-11-27'),
(21, 'BB101', 'CELANA PENDEK KOLOR RIP / CHINO MELAR PINGGANG KERUT / COTTON TWILL DIAMOND / HITAM MOCCA GREY CREAM', ' Cream M', ' Chino pendek', '2020-11-27'),
(22, 'BB101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', ' PRKCE03XL', ' PRKCE', '2020-11-27'),
(23, 'FL101', 'Jaket Parasut Wanita Lumino/jaket parasut/jaket running/2 lapis bukan 1 lapis', ' Lumino mustard biru putih', ' Jaket Lumino V1', '2020-11-27'),
(24, 'BB101', 'Jaket parka / parka cowo / jaket parka cowo / parka pria / parka murah / jaket parka murah / parka 2', ' ', ' PRKCE', '2020-11-27'),
(25, 'BB101', 'JAKET FLEECE Ninja Maroon Murah Diskon / sweater pria', ' ', ' Jaket Polos Zipper Murah', '2020-11-27'),
(26, 'FL101', 'Jaket pria IKC 002 distro Bandung hoodie dua warna keren grosir pakaian pria H0D7/Sweater Kekinian', ' ', ' PRKCE', '2020-11-27'),
(27, NULL, NULL, NULL, ' Kemeja Polos', '2020-11-27'),
(28, NULL, NULL, NULL, ' Kemeja Polos', '2020-11-27'),
(29, NULL, NULL, NULL, ' Jaket Hoodie Ksiecnalb', '2020-11-27'),
(30, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(31, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(32, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(33, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(34, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(35, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(36, NULL, NULL, NULL, ' jaket polos', '2020-11-27'),
(37, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(38, NULL, NULL, NULL, ' Jaket Hoodie Ksiecnalb', '2020-11-27'),
(39, NULL, NULL, NULL, ' Jaket Hoodie Ksiecnalb', '2020-11-27'),
(40, NULL, NULL, NULL, ' Hoodie Polos BIg Size Jumbo', '2020-11-27'),
(41, NULL, NULL, NULL, ' washer jeans', '2020-11-27'),
(42, NULL, NULL, NULL, ' washer jeans', '2020-11-27'),
(43, NULL, NULL, NULL, ' FninXLTebal', '2020-11-27'),
(44, NULL, NULL, NULL, ' FninXLTebal', '2020-11-27'),
(45, NULL, NULL, NULL, ' clossed', '2020-11-27'),
(46, NULL, NULL, NULL, ' clossed', '2020-11-27'),
(47, NULL, NULL, NULL, ' clossed', '2020-11-27'),
(48, NULL, NULL, NULL, ' clossed', '2020-11-27'),
(49, NULL, NULL, NULL, ' Jaket Lumino V1', '2020-11-27'),
(50, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(51, NULL, NULL, NULL, ' Jaket Polos Zipper Murah', '2020-11-27'),
(52, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(53, NULL, NULL, NULL, ' Kemeja Polos', '2020-11-27'),
(54, NULL, NULL, NULL, ' Kemeja Polos', '2020-11-27'),
(55, NULL, NULL, NULL, ' Jaket Hoodie Ksiecnalb', '2020-11-27'),
(56, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(57, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(58, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(59, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(60, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(61, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(62, NULL, NULL, NULL, ' jaket polos', '2020-11-27'),
(63, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(64, NULL, NULL, NULL, ' Jaket Hoodie Ksiecnalb', '2020-11-27'),
(65, NULL, NULL, NULL, ' Jaket Hoodie Ksiecnalb', '2020-11-27'),
(66, NULL, NULL, NULL, ' Hoodie Polos BIg Size Jumbo', '2020-11-27'),
(67, NULL, NULL, NULL, ' washer jeans', '2020-11-27'),
(68, NULL, NULL, NULL, ' washer jeans', '2020-11-27'),
(69, NULL, NULL, NULL, ' FninXLTebal', '2020-11-27'),
(70, NULL, NULL, NULL, ' FninXLTebal', '2020-11-27'),
(71, NULL, NULL, NULL, ' clossed', '2020-11-27'),
(72, NULL, NULL, NULL, ' clossed', '2020-11-27'),
(73, NULL, NULL, NULL, ' clossed', '2020-11-27'),
(74, NULL, NULL, NULL, ' clossed', '2020-11-27'),
(75, NULL, NULL, NULL, ' Jaket Lumino V1', '2020-11-27'),
(76, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(77, NULL, NULL, NULL, ' Jaket Polos Zipper Murah', '2020-11-27'),
(78, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(79, NULL, NULL, NULL, ' Kemeja Polos', '2020-11-27'),
(80, NULL, NULL, NULL, ' Kemeja Polos', '2020-11-27'),
(81, NULL, NULL, NULL, ' Jaket Hoodie Ksiecnalb', '2020-11-27'),
(82, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(83, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(84, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(85, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(86, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(87, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(88, NULL, NULL, NULL, ' jaket polos', '2020-11-27'),
(89, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(90, NULL, NULL, NULL, ' MR hoodie', '2020-11-27'),
(91, NULL, NULL, NULL, ' MR hoodie', '2020-11-27'),
(92, NULL, NULL, NULL, ' MR hoodie', '2020-11-27'),
(93, NULL, NULL, NULL, ' Chino pendek', '2020-11-27'),
(94, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(95, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(96, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(97, NULL, NULL, NULL, ' Jaket Hoodie Ksiecnalb', '2020-11-27'),
(98, NULL, NULL, NULL, ' Jaket Hoodie Ksiecnalb', '2020-11-27'),
(99, NULL, NULL, NULL, ' Hoodie Polos BIg Size Jumbo', '2020-11-27'),
(100, NULL, NULL, NULL, ' washer jeans', '2020-11-27'),
(101, NULL, NULL, NULL, ' washer jeans', '2020-11-27'),
(102, NULL, NULL, NULL, ' washer jeans', '2020-11-27'),
(103, NULL, NULL, NULL, ' FninXLTebal', '2020-11-27'),
(104, NULL, NULL, NULL, ' FninXLTebal', '2020-11-27'),
(105, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(106, NULL, NULL, NULL, ' clossed', '2020-11-27'),
(107, NULL, NULL, NULL, ' clossed', '2020-11-27'),
(108, NULL, NULL, NULL, ' clossed', '2020-11-27'),
(109, NULL, NULL, NULL, ' clossed', '2020-11-27'),
(110, NULL, NULL, NULL, ' Jaket Lumino V1', '2020-11-27'),
(111, NULL, NULL, NULL, ' Jaket Polos Grade C', '2020-11-27'),
(112, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(113, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(114, NULL, NULL, NULL, ' Jaket Polos Zipper Murah', '2020-11-27'),
(115, NULL, NULL, NULL, ' Jaket Polos Zipper Murah', '2020-11-27'),
(116, NULL, NULL, NULL, ' Jaket Polos Zipper Murah', '2020-11-27'),
(117, NULL, NULL, NULL, ' Jaket Polos Zipper Murah', '2020-11-27'),
(118, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(119, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(120, NULL, NULL, NULL, ' Jaket Polos Zipper Murah', '2020-11-27'),
(121, NULL, NULL, NULL, ' Chino pendek', '2020-11-27'),
(122, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(123, NULL, NULL, NULL, ' Kemeja Polos', '2020-11-27'),
(124, NULL, NULL, NULL, ' Kemeja Polos', '2020-11-27'),
(125, NULL, NULL, NULL, ' Kemeja Polos', '2020-11-27'),
(126, NULL, NULL, NULL, ' Jaket Hoodie Ksiecnalb', '2020-11-27'),
(127, NULL, NULL, NULL, ' Jaket Hoodie Ksiecnalb', '2020-11-27'),
(128, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(129, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(130, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(131, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(132, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(133, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(134, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(135, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(136, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(137, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(138, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(139, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(140, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(141, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(142, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(143, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(144, NULL, NULL, NULL, ' PRKCE', '2020-11-27'),
(145, NULL, NULL, NULL, ' jaket polos', '2020-11-27');

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
(1, 'BB101', 5, 73000, 'Pindah Barang Gudang A', '2020-11-27', 365000),
(2, 'B0101', 2, 65000, 'Pindah Gudang A', '2020-11-27', 130000);

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
(1, 'BB101', 5, 73000, 'Pindah Barang Ke Gudang B', '2020-11-27', 365000),
(2, 'JP101', 4, 73000, NULL, '2020-11-27', 292000),
(3, 'BB101', 39, 73000, NULL, '2020-11-27', 2847000),
(4, 'BB101', 37, 73000, NULL, '2020-11-27', 2701000),
(5, 'BB101', 24, 73000, NULL, '2020-11-27', 1752000),
(6, 'BB101', 53, 73000, NULL, '2020-11-27', 3869000),
(7, 'BB101', 6, 73000, NULL, '2020-11-27', 438000),
(8, 'BB101', 25, 73000, NULL, '2020-11-27', 1825000),
(9, 'BB101', 48, 73000, NULL, '2020-11-27', 3504000),
(10, 'FL 101', 48, 73000, NULL, '2020-11-27', 3504000),
(11, 'FL 101', 26, 73000, NULL, '2020-11-27', 1898000),
(12, 'FL 101', 24, 73000, NULL, '2020-11-27', 1752000),
(13, 'FL 101', 24, 73000, NULL, '2020-11-27', 1752000),
(14, 'PS102', 24, 73000, NULL, '2020-11-27', 1752000),
(15, 'FL101', 10, 73000, NULL, '2020-11-27', 730000),
(16, 'PS102', 12, 73000, NULL, '2020-11-27', 876000),
(17, 'BB101', 11, 73000, NULL, '2020-11-27', 803000),
(18, 'B0101', 1, 65000, 'Pindah Gudang B', '2020-11-27', 65000),
(19, 'OS101', 10, 50000, 'Barang Baru', '2020-11-27', 500000),
(20, 'OS101', 8, 51000, 'Pembelian', '2020-11-27', 408000);

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
(15, 'JP2874769234', ' Polos C XXXL 02', 'JP101', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', '2020-11-24', 1, 69900, 69900, 'shopee', 'Sopo Nyono', 'sended', '2020-11-26 04:09:59', '2020-11-26 04:09:59'),
(16, 'JP4920767647', ' Kemeja Flannel XL', 'JP101', 'YANG LAGI HITS Kemeja Flanel Distro Cowok Lengan Panjang Warna Biru Dongker Garis Merah Seri', '2020-11-24', 1, 65000, 65000, 'shopee', 'Sopo Nyono', 'sended', '2020-11-26 04:09:59', '2020-11-26 04:09:59'),
(17, 'JP4920767647', ' ', 'BB101', 'Sweater Hoodie Humble/Sweater Wanita Humble/Sweater Pria Humble/Sweater Motif/Sweater Kantung Depan', '2020-11-24', 1, 47500, 47500, 'shopee', 'Sopo Nyono', 'sended', '2020-11-26 12:38:42', '2020-11-26 12:38:42'),
(18, 'JP8260522081', ' BBCE0208', 'BB101', 'Jaket Parka Wanita Merah Navy / All Collor/Size L/Cewek Casual Outdoor Gunung Parasut Anti Air Keren', '2020-11-24', 1, 85000, 85000, 'shopee', 'deva satrio damara', 'sended', '2020-11-26 12:38:42', '2020-11-26 12:38:42'),
(19, 'JP4782133963', ' Polos C XXL 04', 'JP101', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', '2020-11-26', 1, 69900, 69900, 'shopee', 'deva satrio damara', 'sended', '2020-11-26 12:48:01', '2020-11-26 12:48:01'),
(20, 'JP4782133963', ' Polos C XXXXXL 04', 'JP101', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', '2020-11-26', 1, 69900, 69900, 'shopee', 'Rifka', 'sended', '2020-11-26 12:48:01', '2020-11-26 12:48:01'),
(21, 'NLIDAP1062807408', 'Ksiclab 10-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-26', 1, 52800, 52800, 'lazada', 'Rifka', 'sended', '2020-11-26 14:24:56', '2020-11-26 14:24:56'),
(22, 'NLIDAP1062807457', 'Ksiclab 10-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-26', 1, 50300, 50300, 'lazada', 'Roni', 'sended', '2020-11-26 14:24:56', '2020-11-26 14:24:56'),
(23, 'NLIDAP1062807457', 'Ksiclab 01-10 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 50300, 50300, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 01:44:41', '2020-11-27 01:44:41'),
(24, 'NLIDAP1062807168', 'Ksiclab 18-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 01:44:54', '2020-11-27 01:44:54'),
(25, 'NLIDAP1062807168', 'Ksiclab 01-18 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 01:45:11', '2020-11-27 01:45:11'),
(26, 'JP2874769234', ' Polos C XXXL 02', 'JP101', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', '2020-11-27', 1, 69900, 69900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:23:31', '2020-11-27 12:23:31'),
(27, 'JP4920767647', ' Kemeja Flannel XL', 'JP101', 'YANG LAGI HITS Kemeja Flanel Distro Cowok Lengan Panjang Warna Biru Dongker Garis Merah Seri', '2020-11-27', 1, 65000, 65000, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:23:31', '2020-11-27 12:23:31'),
(28, 'JP4920767647', ' ', 'BB101', 'Sweater Hoodie Humble/Sweater Wanita Humble/Sweater Pria Humble/Sweater Motif/Sweater Kantung Depan', '2020-11-27', 1, 47500, 47500, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:23:31', '2020-11-27 12:23:31'),
(29, 'JP8260522081', ' BBCE0208', 'BB101', 'Jaket Parka Wanita Merah Navy / All Collor/Size L/Cewek Casual Outdoor Gunung Parasut Anti Air Keren', '2020-11-27', 1, 85000, 85000, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:23:31', '2020-11-27 12:23:31'),
(30, 'JP4782133963', ' Polos C XXL 04', 'JP101', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', '2020-11-27', 1, 69900, 69900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:23:31', '2020-11-27 12:23:31'),
(31, 'JP4782133963', ' Polos C XXXXXL 04', 'JP101', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', '2020-11-27', 1, 69900, 69900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:23:31', '2020-11-27 12:23:31'),
(32, 'JP7626669494', ' Polos C XXXXXL 04', 'PS102', 'SWEATER SANTUY MURAH/SANTUY THE FOOT/SWEATER HOODIE/GROSIR JAKET PRIA WANITA/', '2020-11-27', 1, 47500, 47500, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:23:31', '2020-11-27 12:23:31'),
(33, 'JP3171343188', ' Polos C XXXXXL 04', 'PS178', 'Sweater wanita SO CUTE panas musim gugur berkerudung dingin versi korea/Jaket Wanita Korea Kekinian', '2020-11-27', 1, 47500, 47500, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:23:31', '2020-11-27 12:23:31'),
(34, 'JP0430231724', ' Polos C XXXL 04', 'JP101', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', '2020-11-27', 1, 69900, 69900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:23:31', '2020-11-27 12:23:31'),
(35, 'JP4473482748', ' Sleting Polos Murah Navy M', 'JP101', 'jaket polos zipper hoodie m,l,xl,xxl hitam marun army pria wanita wame/Jaket Hoodie Polos/JaketPolos', '2020-11-27', 1, 60000, 60000, 'shopee', 'Shoope', 'sended', '2020-11-27 12:23:31', '2020-11-27 12:23:31'),
(36, 'JP4473482748', ' Sleting Polos Murah Navy XXL', 'JP101', 'jaket polos zipper hoodie m,l,xl,xxl hitam marun army pria wanita wame/Jaket Hoodie Polos/JaketPolos', '2020-11-27', 1, 65000, 65000, 'shopee', 'Shoope', 'sended', '2020-11-27 12:23:31', '2020-11-27 12:23:31'),
(37, 'JP4173673950', ' ', 'BB101', 'Sweater Hoodie Humble/Sweater Wanita Humble/Sweater Pria Humble/Sweater Motif/Sweater Kantung Depan', '2020-11-27', 1, 47500, 47500, 'shopee', 'Shoope', 'sended', '2020-11-27 12:23:31', '2020-11-27 12:23:31'),
(38, 'JP6835326952', ' Sleting Polos Murah Navy XL', 'JP101', 'jaket polos zipper hoodie m,l,xl,xxl hitam marun army pria wanita wame/Jaket Hoodie Polos/JaketPolos', '2020-11-27', 1, 65000, 65000, 'shopee', 'Shoope', 'sended', '2020-11-27 12:23:31', '2020-11-27 12:23:31'),
(39, 'JP0245921902', ' PRKCE10XXL', 'PS102', 'SWEATER SANTUY MURAH/SANTUY THE FOOT/SWEATER HOODIE/GROSIR JAKET PRIA WANITA/', '2020-11-27', 1, 47500, 47500, 'shopee', 'Shoope', 'sended', '2020-11-27 12:23:31', '2020-11-27 12:23:31'),
(40, 'JP0430231724', ' Polos C XXXL 04', 'JP101', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', '2020-11-27', 1, 69900, 69900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:23:31', '2020-11-27 12:23:31'),
(41, 'JP4473482748', ' Sleting Polos Murah Navy M', 'JP101', 'jaket polos zipper hoodie m,l,xl,xxl hitam marun army pria wanita wame/Jaket Hoodie Polos/JaketPolos', '2020-11-27', 1, 60000, 60000, 'shopee', 'Shoope', 'sended', '2020-11-27 12:23:31', '2020-11-27 12:23:31'),
(42, 'JP4473482748', ' Sleting Polos Murah Navy XXL', 'JP101', 'jaket polos zipper hoodie m,l,xl,xxl hitam marun army pria wanita wame/Jaket Hoodie Polos/JaketPolos', '2020-11-27', 1, 65000, 65000, 'shopee', 'Shoope', 'sended', '2020-11-27 12:23:31', '2020-11-27 12:23:31'),
(43, 'JP4173673950', ' ', 'BB101', 'Sweater Hoodie Humble/Sweater Wanita Humble/Sweater Pria Humble/Sweater Motif/Sweater Kantung Depan', '2020-11-27', 1, 47500, 47500, 'shopee', 'Shoope', 'sended', '2020-11-27 12:23:31', '2020-11-27 12:23:31'),
(44, 'JP6835326952', ' Sleting Polos Murah Navy XL', 'JP101', 'jaket polos zipper hoodie m,l,xl,xxl hitam marun army pria wanita wame/Jaket Hoodie Polos/JaketPolos', '2020-11-27', 1, 65000, 65000, 'shopee', 'Shoope', 'sended', '2020-11-27 12:23:31', '2020-11-27 12:23:31'),
(45, 'JP0245921902', ' PRKCE10XXL', 'PS102', 'SWEATER SANTUY MURAH/SANTUY THE FOOT/SWEATER HOODIE/GROSIR JAKET PRIA WANITA/', '2020-11-27', 1, 47500, 47500, 'shopee', 'Shoope', 'sended', '2020-11-27 12:23:31', '2020-11-27 12:23:31'),
(46, 'JP8693393385', ' PRKCE03XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(47, 'JP8693393385', ' MR 04', 'FL101', '(BISA COD) SWEATER MR FASHION - HOODIE LETTER / SWEATER TALI | MISTER HOODIE SWEATER UNISEX TERMURAH', '2020-11-27', 1, 67900, 67900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(48, 'JP9641943485', ' MR 04', 'PS102', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', '2020-11-27', 1, 60900, 60900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(49, 'JP9641943485', ' MR 04', 'PS102', '( BAYAR DITEMPAT ) KEMEJA FLANNEL LENGAN PANJANG PALING HITS / HEM KOTAK - KOTAK BAHAN FLANNEL MURAH', '2020-11-27', 1, 65000, 65000, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(50, 'JP3527747581', ' Cream M', 'BB101', 'CELANA PENDEK KOLOR RIP / CHINO MELAR PINGGANG KERUT / COTTON TWILL DIAMOND / HITAM MOCCA GREY CREAM', '2020-11-27', 1, 59900, 59900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(51, 'JP8739730516', ' PRKCE03XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(52, 'JP4535396395', ' PRKCE10XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(53, 'JP7725283927', ' wash HITAM XXL', 'PS102', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', '2020-11-27', 2, 60900, 121800, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(54, 'JP6395365013', ' PRKCE tosca gelap XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(55, 'JP1187444257', ' PRKCE03XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(56, 'JP3755433849', ' PRKCE03L', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(57, 'JP6835326952', ' Mocca L', 'BB101', 'CELANA PENDEK KOLOR RIP / CHINO MELAR PINGGANG KERUT / COTTON TWILL DIAMOND / HITAM MOCCA GREY CREAM', '2020-11-27', 1, 59900, 59900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(58, 'JP9496688545', ' PRKCE10XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(59, 'JP7431307494', ' Kmj polos 02 L', 'PS102', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', '2020-11-27', 1, 45900, 45900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(60, 'JP3899357418', ' Ksiecnalb XL 00', 'PS102', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', '2020-11-27', 1, 45900, 45900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(61, 'JP0733706742', ' PRKCE10XXL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(62, 'JP0661697227', ' PRKCE10XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(63, 'JP8890596350', ' PRKCE10XL', 'PS102', '( BAYAR DITEMPAT ) KEMEJA FLANNEL LENGAN PANJANG PALING HITS / HEM KOTAK - KOTAK BAHAN FLANNEL MURAH', '2020-11-27', 1, 65000, 65000, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(64, 'JP8890596350', ' PRKCE10XL', 'PS102', '( BAYAR DITEMPAT ) KEMEJA FLANNEL LENGAN PANJANG PALING HITS / HEM KOTAK - KOTAK BAHAN FLANNEL MURAH', '2020-11-27', 1, 65000, 65000, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(65, 'JP1689275688', ' PRKCE11XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(66, 'JP3686415487', ' ', 'PS102', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', '2020-11-27', 1, 45900, 45900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(67, 'JP3686415487', ' ', 'PS102', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', '2020-11-27', 1, 45900, 45900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(68, 'JP4991772307', ' PRKCE03XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(69, 'JP8029542407', ' PRKCE03XL', 'PS102', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', '2020-11-27', 1, 45900, 45900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(70, 'JP4222435612', ' PRKCE04 M', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(71, 'JP8693393385', ' PRKCE03XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(72, 'JP8693393385', ' MR 04', 'FL101', '(BISA COD) SWEATER MR FASHION - HOODIE LETTER / SWEATER TALI | MISTER HOODIE SWEATER UNISEX TERMURAH', '2020-11-27', 1, 67900, 67900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(73, 'JP9641943485', ' MR 04', 'PS102', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', '2020-11-27', 1, 60900, 60900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(74, 'JP9641943485', ' MR 04', 'PS102', '( BAYAR DITEMPAT ) KEMEJA FLANNEL LENGAN PANJANG PALING HITS / HEM KOTAK - KOTAK BAHAN FLANNEL MURAH', '2020-11-27', 1, 65000, 65000, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(75, 'JP3527747581', ' Cream M', 'BB101', 'CELANA PENDEK KOLOR RIP / CHINO MELAR PINGGANG KERUT / COTTON TWILL DIAMOND / HITAM MOCCA GREY CREAM', '2020-11-27', 1, 59900, 59900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(76, 'JP8739730516', ' PRKCE03XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(77, 'JP4535396395', ' PRKCE10XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(78, 'JP7725283927', ' wash HITAM XXL', 'PS102', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', '2020-11-27', 2, 60900, 121800, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(79, 'JP6395365013', ' PRKCE tosca gelap XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(80, 'JP1187444257', ' PRKCE03XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(81, 'JP3755433849', ' PRKCE03L', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(82, 'JP6835326952', ' Mocca L', 'BB101', 'CELANA PENDEK KOLOR RIP / CHINO MELAR PINGGANG KERUT / COTTON TWILL DIAMOND / HITAM MOCCA GREY CREAM', '2020-11-27', 1, 59900, 59900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(83, 'JP9496688545', ' PRKCE10XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(84, 'JP7431307494', ' Kmj polos 02 L', 'PS102', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', '2020-11-27', 1, 45900, 45900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(85, 'JP3899357418', ' Ksiecnalb XL 00', 'PS102', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', '2020-11-27', 1, 45900, 45900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(86, 'JP0733706742', ' PRKCE10XXL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(87, 'JP0661697227', ' PRKCE10XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(88, 'JP8890596350', ' PRKCE10XL', 'PS102', '( BAYAR DITEMPAT ) KEMEJA FLANNEL LENGAN PANJANG PALING HITS / HEM KOTAK - KOTAK BAHAN FLANNEL MURAH', '2020-11-27', 1, 65000, 65000, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(89, 'JP8890596350', ' PRKCE10XL', 'PS102', '( BAYAR DITEMPAT ) KEMEJA FLANNEL LENGAN PANJANG PALING HITS / HEM KOTAK - KOTAK BAHAN FLANNEL MURAH', '2020-11-27', 1, 65000, 65000, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(90, 'JP1689275688', ' PRKCE11XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(91, 'JP3686415487', ' ', 'PS102', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', '2020-11-27', 1, 45900, 45900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(92, 'JP3686415487', ' ', 'PS102', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', '2020-11-27', 1, 45900, 45900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(93, 'JP4991772307', ' PRKCE03XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(94, 'JP8029542407', ' PRKCE03XL', 'PS102', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', '2020-11-27', 1, 45900, 45900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(95, 'JP4222435612', ' PRKCE04 M', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'Shoope', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(96, 'JP8693393385', ' PRKCE03XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(97, 'JP8693393385', ' MR 04', 'FL101', '(BISA COD) SWEATER MR FASHION - HOODIE LETTER / SWEATER TALI | MISTER HOODIE SWEATER UNISEX TERMURAH', '2020-11-27', 1, 67900, 67900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(98, 'JP9641943485', ' MR 04', 'PS102', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', '2020-11-27', 1, 60900, 60900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(99, 'JP9641943485', ' MR 04', 'PS102', '( BAYAR DITEMPAT ) KEMEJA FLANNEL LENGAN PANJANG PALING HITS / HEM KOTAK - KOTAK BAHAN FLANNEL MURAH', '2020-11-27', 1, 65000, 65000, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(100, 'JP3527747581', ' Cream M', 'BB101', 'CELANA PENDEK KOLOR RIP / CHINO MELAR PINGGANG KERUT / COTTON TWILL DIAMOND / HITAM MOCCA GREY CREAM', '2020-11-27', 1, 59900, 59900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(101, 'JP8739730516', ' PRKCE03XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(102, 'JP4535396395', ' PRKCE10XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(103, 'JP7725283927', ' wash HITAM XXL', 'PS102', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', '2020-11-27', 2, 60900, 121800, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(104, 'JP6395365013', ' PRKCE tosca gelap XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(105, 'JP0430231724', ' Polos C XXXL 04', 'JP101', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', '2020-11-27', 1, 69900, 69900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(106, 'JP1187444257', ' PRKCE03XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(107, 'JP4473482748', ' Sleting Polos Murah Navy M', 'JP101', 'jaket polos zipper hoodie m,l,xl,xxl hitam marun army pria wanita wame/Jaket Hoodie Polos/JaketPolos', '2020-11-27', 1, 60000, 60000, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(108, 'JP4473482748', ' Sleting Polos Murah Navy XXL', 'JP101', 'jaket polos zipper hoodie m,l,xl,xxl hitam marun army pria wanita wame/Jaket Hoodie Polos/JaketPolos', '2020-11-27', 1, 65000, 65000, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(109, 'JP4173673950', ' ', 'BB101', 'Sweater Hoodie Humble/Sweater Wanita Humble/Sweater Pria Humble/Sweater Motif/Sweater Kantung Depan', '2020-11-27', 1, 47500, 47500, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(110, 'JP3755433849', ' PRKCE03L', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(111, 'JP6835326952', ' Sleting Polos Murah Navy XL', 'JP101', 'jaket polos zipper hoodie m,l,xl,xxl hitam marun army pria wanita wame/Jaket Hoodie Polos/JaketPolos', '2020-11-27', 1, 65000, 65000, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(112, 'JP6835326952', ' Mocca L', 'BB101', 'CELANA PENDEK KOLOR RIP / CHINO MELAR PINGGANG KERUT / COTTON TWILL DIAMOND / HITAM MOCCA GREY CREAM', '2020-11-27', 1, 59900, 59900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(113, 'JP9496688545', ' PRKCE10XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(114, 'JP7431307494', ' Kmj polos 02 L', 'PS102', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', '2020-11-27', 1, 45900, 45900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(115, 'JP3899357418', ' Ksiecnalb XL 00', 'PS102', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', '2020-11-27', 1, 45900, 45900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(116, 'JP0733706742', ' PRKCE10XXL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(117, 'JP0245921902', ' PRKCE10XXL', 'PS102', 'SWEATER SANTUY MURAH/SANTUY THE FOOT/SWEATER HOODIE/GROSIR JAKET PRIA WANITA/', '2020-11-27', 1, 47500, 47500, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(118, 'JP0661697227', ' PRKCE10XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(119, 'JP8890596350', ' PRKCE10XL', 'PS102', '( BAYAR DITEMPAT ) KEMEJA FLANNEL LENGAN PANJANG PALING HITS / HEM KOTAK - KOTAK BAHAN FLANNEL MURAH', '2020-11-27', 1, 65000, 65000, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(120, 'JP8890596350', ' PRKCE10XL', 'PS102', '( BAYAR DITEMPAT ) KEMEJA FLANNEL LENGAN PANJANG PALING HITS / HEM KOTAK - KOTAK BAHAN FLANNEL MURAH', '2020-11-27', 1, 65000, 65000, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(121, 'JP1689275688', ' PRKCE11XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(122, 'JP3686415487', ' ', 'PS102', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', '2020-11-27', 1, 45900, 45900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(123, 'JP3686415487', ' ', 'PS102', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', '2020-11-27', 1, 45900, 45900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(124, 'JP4991772307', ' PRKCE03XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(125, 'JP8029542407', ' PRKCE03XL', 'PS102', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', '2020-11-27', 1, 45900, 45900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(126, 'JP4222435612', ' PRKCE04 M', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 12:35:19', '2020-11-27 12:35:19'),
(127, 'JP2141965006', ' Fnin02XL versi tebal', 'BB101', 'JAKET FLEECE Ninja Maroon Murah Diskon / sweater pria', '2020-11-27', 1, 75000, 75000, 'shopee', 'Shoope', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(128, 'JP1803546093', ' Lumino mustard biru putih', 'FL101', 'Jaket Parasut Wanita Lumino/jaket parasut/jaket running/2 lapis bukan 1 lapis', '2020-11-27', 1, 57000, 57000, 'shopee', 'Shoope', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(129, 'JP1187444257', ' ', 'BB101', 'Jaket parka / parka cowo / jaket parka cowo / parka pria / parka murah / jaket parka murah / parka 2', '2020-11-27', 1, 110000, 110000, 'shopee', 'Shoope', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(130, 'JP3755433849', ' ', 'BB101', 'JAKET FLEECE Ninja Maroon Murah Diskon / sweater pria', '2020-11-27', 1, 75000, 75000, 'shopee', 'Shoope', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(131, 'JP0539507011', ' ', 'FL101', 'Jaket pria IKC 002 distro Bandung hoodie dua warna keren grosir pakaian pria H0D7/Sweater Kekinian', '2020-11-27', 1, 75000, 75000, 'shopee', 'Shoope', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(132, 'JP5039030019', ' PRKCE10XXL', 'BB101', 'JAKET FLEECE Ninja Maroon Murah Diskon / sweater pria', '2020-11-27', 2, 75000, 150000, 'shopee', 'Shoope', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(133, 'JP1689275688', ' ', 'FL101', 'Jaket pria IKC 002 distro Bandung hoodie dua warna keren grosir pakaian pria H0D7/Sweater Kekinian', '2020-11-27', 1, 75000, 75000, 'shopee', 'Shoope', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(134, 'JP1689275688', ' ', 'FL101', 'Jaket pria IKC 002 distro Bandung hoodie dua warna keren grosir pakaian pria H0D7/Sweater Kekinian', '2020-11-27', 1, 75000, 75000, 'shopee', 'Shoope', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(135, 'JP2141965006', ' Fnin02XL versi tebal', 'BB101', 'JAKET FLEECE Ninja Maroon Murah Diskon / sweater pria', '2020-11-27', 1, 75000, 75000, 'shopee', 'Shoope', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(136, 'JP1803546093', ' Lumino mustard biru putih', 'FL101', 'Jaket Parasut Wanita Lumino/jaket parasut/jaket running/2 lapis bukan 1 lapis', '2020-11-27', 1, 57000, 57000, 'shopee', 'Shoope', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(137, 'JP1187444257', ' ', 'BB101', 'Jaket parka / parka cowo / jaket parka cowo / parka pria / parka murah / jaket parka murah / parka 2', '2020-11-27', 1, 110000, 110000, 'shopee', 'Shoope', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(138, 'JP3755433849', ' ', 'BB101', 'JAKET FLEECE Ninja Maroon Murah Diskon / sweater pria', '2020-11-27', 1, 75000, 75000, 'shopee', 'Shoope', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(139, 'JP0539507011', ' ', 'FL101', 'Jaket pria IKC 002 distro Bandung hoodie dua warna keren grosir pakaian pria H0D7/Sweater Kekinian', '2020-11-27', 1, 75000, 75000, 'shopee', 'Shoope', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(140, 'JP5039030019', ' PRKCE10XXL', 'BB101', 'JAKET FLEECE Ninja Maroon Murah Diskon / sweater pria', '2020-11-27', 2, 75000, 150000, 'shopee', 'Shoope', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(141, 'JP1689275688', ' ', 'FL101', 'Jaket pria IKC 002 distro Bandung hoodie dua warna keren grosir pakaian pria H0D7/Sweater Kekinian', '2020-11-27', 1, 75000, 75000, 'shopee', 'Shoope', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(142, 'JP1689275688', ' ', 'FL101', 'Jaket pria IKC 002 distro Bandung hoodie dua warna keren grosir pakaian pria H0D7/Sweater Kekinian', '2020-11-27', 1, 75000, 75000, 'shopee', 'Shoope', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(143, 'JP2141965006', ' Fnin02XL versi tebal', 'BB101', 'JAKET FLEECE Ninja Maroon Murah Diskon / sweater pria', '2020-11-27', 1, 75000, 75000, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(144, 'JP1803546093', ' Lumino mustard biru putih', 'FL101', 'Jaket Parasut Wanita Lumino/jaket parasut/jaket running/2 lapis bukan 1 lapis', '2020-11-27', 1, 57000, 57000, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(145, 'JP1187444257', ' ', 'BB101', 'Jaket parka / parka cowo / jaket parka cowo / parka pria / parka murah / jaket parka murah / parka 2', '2020-11-27', 1, 110000, 110000, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(146, 'JP3755433849', ' ', 'BB101', 'JAKET FLEECE Ninja Maroon Murah Diskon / sweater pria', '2020-11-27', 1, 75000, 75000, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(147, 'JP0539507011', ' ', 'FL101', 'Jaket pria IKC 002 distro Bandung hoodie dua warna keren grosir pakaian pria H0D7/Sweater Kekinian', '2020-11-27', 1, 75000, 75000, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(148, 'JP5039030019', ' PRKCE10XXL', 'BB101', 'JAKET FLEECE Ninja Maroon Murah Diskon / sweater pria', '2020-11-27', 2, 75000, 150000, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(149, 'JP1689275688', ' ', 'FL101', 'Jaket pria IKC 002 distro Bandung hoodie dua warna keren grosir pakaian pria H0D7/Sweater Kekinian', '2020-11-27', 1, 75000, 75000, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(150, 'JP1689275688', ' ', 'FL101', 'Jaket pria IKC 002 distro Bandung hoodie dua warna keren grosir pakaian pria H0D7/Sweater Kekinian', '2020-11-27', 1, 75000, 75000, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(151, 'JP8693393385', ' PRKCE03XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(152, 'JP8693393385', ' MR 04', 'FL101', '(BISA COD) SWEATER MR FASHION - HOODIE LETTER / SWEATER TALI | MISTER HOODIE SWEATER UNISEX TERMURAH', '2020-11-27', 1, 67900, 67900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(153, 'JP9641943485', ' MR 04', 'PS102', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', '2020-11-27', 1, 60900, 60900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(154, 'JP9641943485', ' MR 04', 'PS102', '( BAYAR DITEMPAT ) KEMEJA FLANNEL LENGAN PANJANG PALING HITS / HEM KOTAK - KOTAK BAHAN FLANNEL MURAH', '2020-11-27', 1, 65000, 65000, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(155, 'JP3527747581', ' Cream M', 'BB101', 'CELANA PENDEK KOLOR RIP / CHINO MELAR PINGGANG KERUT / COTTON TWILL DIAMOND / HITAM MOCCA GREY CREAM', '2020-11-27', 1, 59900, 59900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(156, 'JP8739730516', ' PRKCE03XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(157, 'JP4535396395', ' PRKCE10XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(158, 'JP7725283927', ' wash HITAM XXL', 'PS102', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', '2020-11-27', 2, 60900, 121800, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(159, 'JP2141965006', ' Fnin02XL versi tebal', 'BB101', 'JAKET FLEECE Ninja Maroon Murah Diskon / sweater pria', '2020-11-27', 1, 75000, 75000, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(160, 'JP6395365013', ' PRKCE tosca gelap XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(161, 'JP1803546093', ' Lumino mustard biru putih', 'FL101', 'Jaket Parasut Wanita Lumino/jaket parasut/jaket running/2 lapis bukan 1 lapis', '2020-11-27', 1, 57000, 57000, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(162, 'JP0430231724', ' Polos C XXXL 04', 'JP101', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', '2020-11-27', 1, 69900, 69900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(163, 'JP1187444257', ' PRKCE03XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(164, 'JP1187444257', ' ', 'BB101', 'Jaket parka / parka cowo / jaket parka cowo / parka pria / parka murah / jaket parka murah / parka 2', '2020-11-27', 1, 110000, 110000, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(165, 'JP4473482748', ' Sleting Polos Murah Navy M', 'JP101', 'jaket polos zipper hoodie m,l,xl,xxl hitam marun army pria wanita wame/Jaket Hoodie Polos/JaketPolos', '2020-11-27', 1, 60000, 60000, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(166, 'JP4473482748', ' Sleting Polos Murah Navy XXL', 'JP101', 'jaket polos zipper hoodie m,l,xl,xxl hitam marun army pria wanita wame/Jaket Hoodie Polos/JaketPolos', '2020-11-27', 1, 65000, 65000, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(167, 'JP4173673950', ' ', 'BB101', 'Sweater Hoodie Humble/Sweater Wanita Humble/Sweater Pria Humble/Sweater Motif/Sweater Kantung Depan', '2020-11-27', 1, 47500, 47500, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(168, 'JP3755433849', ' ', 'BB101', 'JAKET FLEECE Ninja Maroon Murah Diskon / sweater pria', '2020-11-27', 1, 75000, 75000, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(169, 'JP3755433849', ' PRKCE03L', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(170, 'JP0539507011', ' ', 'FL101', 'Jaket pria IKC 002 distro Bandung hoodie dua warna keren grosir pakaian pria H0D7/Sweater Kekinian', '2020-11-27', 1, 75000, 75000, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(171, 'JP6835326952', ' Sleting Polos Murah Navy XL', 'JP101', 'jaket polos zipper hoodie m,l,xl,xxl hitam marun army pria wanita wame/Jaket Hoodie Polos/JaketPolos', '2020-11-27', 1, 65000, 65000, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(172, 'JP6835326952', ' Mocca L', 'BB101', 'CELANA PENDEK KOLOR RIP / CHINO MELAR PINGGANG KERUT / COTTON TWILL DIAMOND / HITAM MOCCA GREY CREAM', '2020-11-27', 1, 59900, 59900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(173, 'JP9496688545', ' PRKCE10XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(174, 'JP7431307494', ' Kmj polos 02 L', 'PS102', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', '2020-11-27', 1, 45900, 45900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(175, 'JP3899357418', ' Ksiecnalb XL 00', 'PS102', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', '2020-11-27', 1, 45900, 45900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(176, 'JP0733706742', ' PRKCE10XXL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(177, 'JP5039030019', ' PRKCE10XXL', 'BB101', 'JAKET FLEECE Ninja Maroon Murah Diskon / sweater pria', '2020-11-27', 2, 75000, 150000, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(178, 'JP0245921902', ' PRKCE10XXL', 'PS102', 'SWEATER SANTUY MURAH/SANTUY THE FOOT/SWEATER HOODIE/GROSIR JAKET PRIA WANITA/', '2020-11-27', 1, 47500, 47500, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(179, 'JP0661697227', ' PRKCE10XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(180, 'JP8890596350', ' PRKCE10XL', 'PS102', '( BAYAR DITEMPAT ) KEMEJA FLANNEL LENGAN PANJANG PALING HITS / HEM KOTAK - KOTAK BAHAN FLANNEL MURAH', '2020-11-27', 1, 65000, 65000, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(181, 'JP8890596350', ' PRKCE10XL', 'PS102', '( BAYAR DITEMPAT ) KEMEJA FLANNEL LENGAN PANJANG PALING HITS / HEM KOTAK - KOTAK BAHAN FLANNEL MURAH', '2020-11-27', 1, 65000, 65000, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(182, 'JP1689275688', ' PRKCE11XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(183, 'JP1689275688', ' ', 'FL101', 'Jaket pria IKC 002 distro Bandung hoodie dua warna keren grosir pakaian pria H0D7/Sweater Kekinian', '2020-11-27', 1, 75000, 75000, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(184, 'JP1689275688', ' ', 'FL101', 'Jaket pria IKC 002 distro Bandung hoodie dua warna keren grosir pakaian pria H0D7/Sweater Kekinian', '2020-11-27', 1, 75000, 75000, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(185, 'JP3686415487', ' ', 'PS102', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', '2020-11-27', 1, 45900, 45900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(186, 'JP3686415487', ' ', 'PS102', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', '2020-11-27', 1, 45900, 45900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(187, 'JP4991772307', ' PRKCE03XL', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(188, 'JP8029542407', ' PRKCE03XL', 'PS102', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', '2020-11-27', 1, 45900, 45900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(189, 'JP4222435612', ' PRKCE04 M', 'FL101', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', '2020-11-27', 1, 98900, 98900, 'shopee', 'deva satrio damara', 'sended', '2020-11-27 13:14:58', '2020-11-27 13:14:58'),
(190, 'NLIDAP1062807408', 'Ksiclab 10-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(191, 'NLIDAP1062807457', 'Ksiclab 10-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 50300, 50300, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(192, 'NLIDAP1062807457', 'Ksiclab 01-10 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 50300, 50300, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(193, 'NLIDAP1062807168', 'Ksiclab 18-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(194, 'NLIDAP1062807168', 'Ksiclab 01-18 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(195, 'NLIDAP1062807455', 'Ksiclab 18-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(196, 'NLIDAP1062807455', 'Ksiclab 01-18 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(197, 'NLIDAP1062807273', 'Ksiclab 01-10 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(198, 'NLIDAP1062807411', 'Ksiclab 18-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(199, 'NLIDAP1062807411', 'Ksiclab 18-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(200, 'NLIDAP1062807232', 'Ksiclab 10-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(201, 'NLIDAP1062807363', 'Ksiclab 01-00 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(202, 'NLIDAP1062807364', 'Ksiclab 01-18 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(203, 'NLIDAP1062807364', 'Ksiclab 18-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(204, 'NLIDAP1062807271', 'Ksiclab 11-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(205, 'NLIDAP1062807412', 'Ksiclab 18-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(206, 'NLIDAP1062807412', 'Ksiclab 18-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(207, 'NLIDAP1062807360', 'Ksiclab 01-00 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(208, 'NLIDAP1062807311', 'jaket zipper supreme girrafe navy XL', 'FL101', 'CartelGrosir.ID ZIPPER Supreme Girrafe Jaket Distro Sweater Hoody Pria Wanita Bahan Fleece Tebal', '2020-11-27', 1, 74880, 74880, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(209, 'NLIDAP1062807226', 'Ksiclab 01-18 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 50300, 50300, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(210, 'NLIDAP1062807226', 'Ksiclab 18-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 50300, 50300, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(211, 'NLIDAP1062807167', 'Ksiclab 01-00 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(212, 'NLIDAP1062807167', 'Ksiclab 18-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(213, 'NLIDAP1062807228', 'Ksiclab 01-11 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52');
INSERT INTO `barang_trx` (`id`, `noresi`, `sku`, `skuindex`, `barang`, `tgl`, `jumlah`, `harga`, `total`, `jenis`, `admin`, `stts`, `created_at`, `updated_at`) VALUES
(214, 'NLIDAP1062807415', 'Ksiclab 10-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(215, 'NLIDAP1062807415', 'Ksiclab 10-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(216, 'NLIDAP1062807227', 'Ksiclab 10-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(217, 'NLIDAP1062807270', 'Ksiclab 01-00 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(218, 'NLIDAP1062807270', 'Ksiclab 01-00 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(219, 'NLIDAP1062807225', 'Ksiclab 10-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(220, 'NLIDAP1062807313', 'Ksiclab 18-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(221, 'NLIDAP1062807313', 'Ksiclab 18-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(222, 'NLIDAP1062807230', 'Hoodie Polos Navy 5XL', 'PS102', 'Jaket Hoodie Polos Pria Wanita Jumbo Murah XL - XXXXXL', '2020-11-27', 1, 67200, 67200, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(223, 'NLIDAP1062807229', 'Ksiclab 01-18 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(224, 'NLIDAP1062807229', 'Ksiclab 18-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(225, 'NLIDAP1062807414', 'Ksiclab 01-10 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(226, 'NLIDAP1062927951', 'Ksiclab 18-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(227, 'NLIDAP1062927951', 'Ksiclab 01-18 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(228, 'NLIDAP1062928000', 'Ksiclab 01-18 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(229, 'NLIDAP1062928000', 'Ksiclab 18-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(230, 'NLIDAP1062928079', 'Ksiclab 01-11 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 50300, 50300, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(231, 'NLIDAP1062928079', 'Ksiclab 01-11 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 50300, 50300, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(232, 'NLIDAP1062928080', 'Ksiclab 01-18 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(233, 'NLIDAP1062928041', 'Ksiclab 01-11 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 50300, 50300, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(234, 'NLIDAP1062928078', 'Ksiclab 00-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(235, 'NLIDAP1062928078', 'Ksiclab 01-00 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(236, 'NLIDAP1062928215', 'Ksiecnalb Mocca Hitam M', 'FL101', 'Jaket Hoodie Korean Murah Ksienclab Tanpa Resleting', '2020-11-27', 1, 53720, 53720, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(237, 'NLIDAP1062928216', 'Hoodie Polos Hijau 5XL', 'PS102', 'Jaket Hoodie Polos Pria Wanita Jumbo Murah XL - XXXXXL', '2020-11-27', 1, 64700, 64700, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(238, 'NLIDAP1062928216', 'Hoodie Polos Maroon 5XL', 'PS102', 'Jaket Hoodie Polos Pria Wanita Jumbo Murah XL - XXXXXL', '2020-11-27', 1, 64700, 64700, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(239, 'NLIDAP1062928116', 'Ksiclab 01-18 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 51133, 51133, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(240, 'NLIDAP1062928116', 'Ksiclab 01-18 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 51133, 51133, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(241, 'NLIDAP1062928116', 'Ksiclab 18-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 51134, 51134, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52'),
(242, 'NLIDAP1062928213', 'Ksiclab 11-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 13:37:52', '2020-11-27 13:37:52');

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
(3, 'JP2874769234', ' Polos C XXXL 02', ' Jaket Polos Grade C', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', 'Navy,XXXL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 69900, 69900, 'shopee', '2020-11-24 06:28:58', '2020-11-27 05:23:31'),
(4, 'JP4920767647', ' Kemeja Flannel XL', ' KEMEJA FLANEL', 'YANG LAGI HITS Kemeja Flanel Distro Cowok Lengan Panjang Warna Biru Dongker Garis Merah Seri', 'XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 65000, 65000, 'shopee', '2020-11-24 06:28:58', '2020-11-27 05:23:31'),
(5, 'JP4920767647', ' ', ' KEMEJA FLANEL', 'Sweater Hoodie Humble/Sweater Wanita Humble/Sweater Pria Humble/Sweater Motif/Sweater Kantung Depan', 'Hitam,L', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 47500, 47500, 'shopee', '2020-11-24 06:28:58', '2020-11-27 05:23:31'),
(6, 'JP8260522081', ' BBCE0208', ' BBCE', 'Jaket Parka Wanita Merah Navy / All Collor/Size L/Cewek Casual Outdoor Gunung Parasut Anti Air Keren', 'Navy - Turkish M/L', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 85000, 85000, 'shopee', '2020-11-24 06:28:58', '2020-11-27 05:23:31'),
(7, 'JP4782133963', ' Polos C XXL 04', ' Jaket Polos Grade C', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', 'Hijau botol,XXL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 69900, 69900, 'shopee', '2020-11-24 06:28:58', '2020-11-27 05:23:31'),
(8, 'JP4782133963', ' Polos C XXXXXL 04', ' Jaket Polos Grade C', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', 'Hijau botol,XXXXXL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 69900, 69900, 'shopee', '2020-11-24 06:28:58', '2020-11-27 05:23:31'),
(9, 'JP7626669494', ' Polos C XXXXXL 04', ' Jaket Polos Grade C', 'SWEATER SANTUY MURAH/SANTUY THE FOOT/SWEATER HOODIE/GROSIR JAKET PRIA WANITA/', 'Hitam', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 47500, 47500, 'shopee', '2020-11-24 06:28:58', '2020-11-27 05:23:31'),
(10, 'JP3171343188', ' Polos C XXXXXL 04', ' Jaket Polos Grade C', 'Sweater wanita SO CUTE panas musim gugur berkerudung dingin versi korea/Jaket Wanita Korea Kekinian', 'Kuning', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 47500, 47500, 'shopee', '2020-11-24 06:28:58', '2020-11-27 05:23:31'),
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
(147, 'NLIDAP1062807408', 'Ksiclab 10-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(148, 'NLIDAP1062807457', 'Ksiclab 10-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 50300, 50300, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(149, 'NLIDAP1062807457', 'Ksiclab 01-10 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 50300, 50300, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(150, 'NLIDAP1062807168', 'Ksiclab 18-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(151, 'NLIDAP1062807168', 'Ksiclab 01-18 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(152, 'NLIDAP1062807312', 'Parka Marun XL', 'JP102', 'Jaket Wanita Parka Cewek Premium size M L XXL', 'Jaket Wanita Parka Cewek Premium size M L XXL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 93000, 93000, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(153, 'NLIDAP1062807365', 'Parka Mustard XL', 'JP102', 'Jaket Wanita Parka Cewek Premium size M L XXL', 'Jaket Wanita Parka Cewek Premium size M L XXL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 93000, 93000, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(154, 'NLIDAP1062807455', 'Ksiclab 18-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(155, 'NLIDAP1062807455', 'Ksiclab 01-18 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(156, 'NLIDAP1062807273', 'Ksiclab 01-10 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(157, 'NLIDAP1062807411', 'Ksiclab 18-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(158, 'NLIDAP1062807411', 'Ksiclab 18-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(159, 'NLIDAP1062807232', 'Ksiclab 10-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(160, 'NLIDAP1062807169', 'Ninja Cewek Maroon L', 'JN101', 'Jaket Hoodie Ninja Resleting Dengan Penutup Mulut Premium size M L XL XXL', 'Jaket Hoodie Ninja Resleting Dengan Penutup Mulut Premium size M L XL XXL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 63272, 63272, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(161, 'NLIDAP1062807363', 'Ksiclab 01-00 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(162, 'NLIDAP1062807364', 'Ksiclab 01-18 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(163, 'NLIDAP1062807364', 'Ksiclab 18-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(164, 'NLIDAP1062807271', 'Ksiclab 11-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(165, 'NLIDAP1062807412', 'Ksiclab 18-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(166, 'NLIDAP1062807412', 'Ksiclab 18-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(167, 'NLIDAP1062807409', 'JAKET JEANS SANDWOSH HITAM XL', 'JE103', 'jaket pria /jaket jeans pria / jaket deim sandwosh pria /jaket cowok/Jaket Jeans Denim Regular pria', 'jaket pria /jaket jeans pria / jaket deim sandwosh pria /jaket cowok/Jaket Jeans Denim Regular pria', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 81764, 81764, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(168, 'NLIDAP1062807360', 'Ksiclab 01-00 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(169, 'NLIDAP1062807311', 'jaket zipper supreme girrafe navy XL', 'FL101', 'CartelGrosir.ID ZIPPER Supreme Girrafe Jaket Distro Sweater Hoody Pria Wanita Bahan Fleece Tebal', 'CartelGrosir.ID ZIPPER Supreme Girrafe Jaket Distro Sweater Hoody Pria Wanita Bahan Fleece Tebal', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 74880, 74880, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(170, 'NLIDAP1062807226', 'Ksiclab 01-18 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 50300, 50300, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(171, 'NLIDAP1062807226', 'Ksiclab 18-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 50300, 50300, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(172, 'NLIDAP1062807269', 'Ninja Cewek Navy XXL', 'JN103', 'Jaket Hoodie Ninja Resleting Dengan Penutup Mulut Premium size M L XL XXL', 'Jaket Hoodie Ninja Resleting Dengan Penutup Mulut Premium size M L XL XXL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 63272, 63272, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(173, 'NLIDAP1062807269', 'Ninja Cewek Navy XXL', 'JN103', 'Jaket Hoodie Ninja Resleting Dengan Penutup Mulut Premium size M L XL XXL', 'Jaket Hoodie Ninja Resleting Dengan Penutup Mulut Premium size M L XL XXL', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 63272, 63272, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(174, 'NLIDAP1062807167', 'Ksiclab 01-00 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(175, 'NLIDAP1062807167', 'Ksiclab 18-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(176, 'NLIDAP1062807228', 'Ksiclab 01-11 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(177, 'NLIDAP1062807415', 'Ksiclab 10-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(178, 'NLIDAP1062807415', 'Ksiclab 10-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(179, 'NLIDAP1062807227', 'Ksiclab 10-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(180, 'NLIDAP1062807135', 'SWEATER DINOSAUR MARUN L', 'FE101', 'CartelGrosir.ID SWEATER DISTRO SWEATER PRIA JUMPER OBLONG COWOK JAKET PRIA MOTIF DINOSAUR', 'CartelGrosir.ID SWEATER DISTRO SWEATER PRIA JUMPER OBLONG COWOK JAKET PRIA MOTIF DINOSAUR', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 62752, 62752, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(181, 'NLIDAP1062807135', 'Celana chinos volcom/A ABU XL (32-33)', 'CC104', 'CartelGrosir.ID celana chino panjang,chino pria,chino combed,slimfit street', 'CartelGrosir.ID celana chino panjang,chino pria,chino combed,slimfit street', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 86108, 86108, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(182, 'NLIDAP1062807270', 'Ksiclab 01-00 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(183, 'NLIDAP1062807270', 'Ksiclab 01-00 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(184, 'NLIDAP1062807225', 'Ksiclab 10-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(185, 'NLIDAP1062807313', 'Ksiclab 18-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(186, 'NLIDAP1062807313', 'Ksiclab 18-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(187, 'NLIDAP1062807230', 'Hoodie Polos Navy 5XL', 'PS102', 'Jaket Hoodie Polos Pria Wanita Jumbo Murah XL - XXXXXL', 'Jaket Hoodie Polos Pria Wanita Jumbo Murah XL - XXXXXL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 67200, 67200, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(188, 'NLIDAP1062807229', 'Ksiclab 01-18 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(189, 'NLIDAP1062807229', 'Ksiclab 18-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(190, 'NLIDAP1062807414', 'Ksiclab 01-10 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(191, 'NLIDAP1062927951', 'Ksiclab 18-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(192, 'NLIDAP1062927951', 'Ksiclab 01-18 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(193, 'NLIDAP1062928214', 'jaket zipper salur hitam L', 'SA101', 'CartelGrosir.ID JAKET SWEATER MOTIF SALUR / JAKET MOTIF SALUR PRIA / JAKET STRIPE PRIA', 'CartelGrosir.ID JAKET SWEATER MOTIF SALUR / JAKET MOTIF SALUR PRIA / JAKET STRIPE PRIA', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 59010, 59010, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(194, 'NLIDAP1062928000', 'Ksiclab 01-18 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(195, 'NLIDAP1062928000', 'Ksiclab 18-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(196, 'NLIDAP1062928079', 'Ksiclab 01-11 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 50300, 50300, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(197, 'NLIDAP1062928079', 'Ksiclab 01-11 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 50300, 50300, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(198, 'NLIDAP1062928080', 'Ksiclab 01-18 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(199, 'NLIDAP1062928041', 'Ksiclab 01-11 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 50300, 50300, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(200, 'NLIDAP1062928040', 'Ninja Polos 01 XL', 'JN102', 'Jaket Zipper Ninja Pria Wanita Polos', 'Jaket Zipper Ninja Pria Wanita Polos', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 62400, 62400, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(201, 'NLIDAP1062928117', 'Ninja Polos 02 L', 'JN102', 'Jaket Zipper Ninja Pria Wanita Polos', 'Jaket Zipper Ninja Pria Wanita Polos', '2020-11-24', 'belum', 'valid', 'deva satrio damara', 1, 62400, 62400, 'lazada', '2020-11-24 07:03:53', '2020-11-24 07:03:53'),
(202, 'NLIDAP1062928078', 'Ksiclab 00-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(203, 'NLIDAP1062928078', 'Ksiclab 01-00 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(204, 'NLIDAP1062928215', 'Ksiecnalb Mocca Hitam M', 'FL101', 'Jaket Hoodie Korean Murah Ksienclab Tanpa Resleting', 'Jaket Hoodie Korean Murah Ksienclab Tanpa Resleting', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 53720, 53720, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(205, 'NLIDAP1062928216', 'Hoodie Polos Hijau 5XL', 'PS102', 'Jaket Hoodie Polos Pria Wanita Jumbo Murah XL - XXXXXL', 'Jaket Hoodie Polos Pria Wanita Jumbo Murah XL - XXXXXL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 64700, 64700, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(206, 'NLIDAP1062928216', 'Hoodie Polos Maroon 5XL', 'PS102', 'Jaket Hoodie Polos Pria Wanita Jumbo Murah XL - XXXXXL', 'Jaket Hoodie Polos Pria Wanita Jumbo Murah XL - XXXXXL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 64700, 64700, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(207, 'NLIDAP1062928116', 'Ksiclab 01-18 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 51133, 51133, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(208, 'NLIDAP1062928116', 'Ksiclab 01-18 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 51133, 51133, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(209, 'NLIDAP1062928116', 'Ksiclab 18-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 51134, 51134, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(210, 'NLIDAP1062928213', 'Ksiclab 11-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-24', 'sudah', 'valid', 'deva satrio damara', 1, 52800, 52800, 'lazada', '2020-11-24 07:03:53', '2020-11-27 06:37:52'),
(211, 'JP8693393385', ' PRKCE03XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Maroon,Size XL', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 98900, 98900, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:35:19'),
(212, 'JP8693393385', ' MR 04', ' MR hoodie', '(BISA COD) SWEATER MR FASHION - HOODIE LETTER / SWEATER TALI | MISTER HOODIE SWEATER UNISEX TERMURAH', 'Hijau botol', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 67900, 67900, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:35:19'),
(213, 'JP9641943485', ' MR 04', ' MR hoodie', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', 'Hitam,XL fit XXL', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 60900, 60900, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:35:19'),
(214, 'JP9641943485', ' MR 04', ' MR hoodie', '( BAYAR DITEMPAT ) KEMEJA FLANNEL LENGAN PANJANG PALING HITS / HEM KOTAK - KOTAK BAHAN FLANNEL MURAH', '01,L', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 65000, 65000, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:35:19'),
(215, 'JP3527747581', ' Cream M', ' Chino pendek', 'CELANA PENDEK KOLOR RIP / CHINO MELAR PINGGANG KERUT / COTTON TWILL DIAMOND / HITAM MOCCA GREY CREAM', 'Cream,M (29-30)', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 59900, 59900, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:35:19'),
(216, 'JP8739730516', ' PRKCE03XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Maroon,Size XL', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 98900, 98900, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:35:19'),
(217, 'JP8739730516', ' ', ' PRKCE', 'Jaket Parasut V3 Dua Lapis Bukan Satu Lapis/Parasut Lumino/Parasut Milkita Kekinian', 'Maroon-Abu', '2020-11-27', 'belum', 'belum', 'Shoope', 1, 85000, 85000, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:19:11'),
(218, 'JP4535396395', ' PRKCE10XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Mocca,Size XL', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 98900, 98900, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:35:19'),
(219, 'JP3991028414', ' Ksiecnalb XL 11', ' Jaket Hoodie Ksiecnalb', 'Jaket Hoodie Purpose World Tour Staff Justin Bieber Jake L1G1T/Hoodie Pria Kekinian/Jaket Korea', 'Kuning,XL', '2020-11-27', 'belum', 'belum', 'Shoope', 1, 67700, 67700, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:19:11'),
(220, 'JP1140824541', ' Ksiecnalb M 00', ' Jaket Hoodie Ksiecnalb', 'Jaket Hoodie Purpose World Tour Staff Justin Bieber Jake L1G1T/Hoodie Pria Kekinian/Jaket Korea', 'Putih,M', '2020-11-27', 'belum', 'belum', 'Shoope', 1, 67700, 67700, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:19:11'),
(221, 'JP3447365890', ' Hoodie Polos XXXXXL 02', ' Hoodie Polos BIg Size Jumbo', 'Sweater polos unisex zipper cewek cowok big size all size XL XXL XXXL jumper/jaket jumbo cewek cowok', 'Navy,XXXXXL', '2020-11-27', 'belum', 'belum', 'Shoope', 1, 95000, 95000, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:19:11'),
(222, 'JP1798615289', ' wash HITAM XXL', ' washer jeans', 'JEANS SNOW JAKET DENIM SANDWASH BLACK PRIA WANITA PREMIUM QUALITY', 'Hitam,XXL', '2020-11-27', 'belum', 'belum', 'Shoope', 1, 93750, 93750, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:19:11'),
(223, 'JP7725283927', ' wash HITAM XXL', ' washer jeans', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', 'Hitam,XL fit XXL', '2020-11-27', 'sudah', 'valid', 'Shoope', 2, 60900, 121800, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:35:19'),
(224, 'JP0578971888', ' wash HITAM L', ' washer jeans', 'JEANS SNOW JAKET DENIM SANDWASH BLACK PRIA WANITA PREMIUM QUALITY', 'Hitam,L', '2020-11-27', 'belum', 'belum', 'Shoope', 1, 93750, 93750, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:19:11'),
(225, 'JP7946074439', ' Fnin02XL versi tebal', ' FninXLTebal', 'Jaket Ninja Jumbo Cotton Tebal  size L fit XL Premium Hitam Navy Maroon/Alan Walker/Jaket Polos', 'Navy', '2020-11-27', 'belum', 'belum', 'Shoope', 1, 65000, 65000, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:19:11'),
(226, 'JP2141965006', ' Fnin02XL versi tebal', ' FninXLTebal', 'JAKET FLEECE Ninja Maroon Murah Diskon / sweater pria', 'Hitam,XXL', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 75000, 75000, 'shopee', '2020-11-27 05:19:11', '2020-11-27 06:14:58'),
(227, 'JP6395365013', ' PRKCE tosca gelap XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Dark Blue Tosca,Size XL', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 98900, 98900, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:35:19'),
(228, 'JP9815921707', ' hd Closed 01', ' clossed', '(BISA COD) JAKET SWEATER HOODIE CLOSED  Undisclosed Society Hitam Navy Maroon Putih All size Unisex', 'Hitam', '2020-11-27', 'belum', 'belum', 'Shoope', 1, 67900, 67900, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:19:11'),
(229, 'JP8743942271', ' hd Closed 01', ' clossed', 'KEMEJA POLOS LENGAN PANJANG // KEMEJA FORMAL // KEMEJA PRIA // FASHION LEBARAN // HEM PRIA M L XL', 'Navy,L', '2020-11-27', 'belum', 'belum', 'Shoope', 1, 58900, 58900, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:19:11'),
(230, 'JP7085274177', ' hd Closed 01', ' clossed', 'Kaos Polos Hitam Navy Maroon Hijau Premium', 'Warna acak,XXL', '2020-11-27', 'belum', 'belum', 'Shoope', 4, 28900, 115600, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:19:11'),
(231, 'JP4241280860', ' hd Closed 01', ' clossed', 'Kaos Polos Hitam Navy Maroon Hijau Premium', 'Warna acak,XXL', '2020-11-27', 'belum', 'belum', 'Shoope', 4, 28900, 115600, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:19:11'),
(232, 'JP1803546093', ' Lumino mustard biru putih', ' Jaket Lumino V1', 'Jaket Parasut Wanita Lumino/jaket parasut/jaket running/2 lapis bukan 1 lapis', 'Pink', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 57000, 57000, 'shopee', '2020-11-27 05:19:11', '2020-11-27 06:14:58'),
(233, 'JP0430231724', ' Polos C XXXL 04', ' Jaket Polos Grade C', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', 'Hijau botol,XXXL', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 69900, 69900, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:23:31'),
(234, 'JP1187444257', ' PRKCE03XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Maroon,Size XL', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 98900, 98900, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:35:19'),
(235, 'JP1187444257', ' ', ' PRKCE', 'Jaket parka / parka cowo / jaket parka cowo / parka pria / parka murah / jaket parka murah / parka 2', 'Maroon-Hitam', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 110000, 110000, 'shopee', '2020-11-27 05:19:11', '2020-11-27 06:14:58'),
(236, 'JP4473482748', ' Sleting Polos Murah Navy M', ' Jaket Polos Zipper Murah', 'jaket polos zipper hoodie m,l,xl,xxl hitam marun army pria wanita wame/Jaket Hoodie Polos/JaketPolos', 'NAVY,M', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 60000, 60000, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:23:31'),
(237, 'JP4473482748', ' Sleting Polos Murah Navy XXL', ' Jaket Polos Zipper Murah', 'jaket polos zipper hoodie m,l,xl,xxl hitam marun army pria wanita wame/Jaket Hoodie Polos/JaketPolos', 'NAVY,XXL', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 65000, 65000, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:23:31'),
(238, 'JP4173673950', ' ', ' Jaket Polos Zipper Murah', 'Sweater Hoodie Humble/Sweater Wanita Humble/Sweater Pria Humble/Sweater Motif/Sweater Kantung Depan', 'Coklat Susu,L', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 47500, 47500, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:23:31'),
(239, 'JP3755433849', ' ', ' Jaket Polos Zipper Murah', 'JAKET FLEECE Ninja Maroon Murah Diskon / sweater pria', 'Hitam,XL', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 75000, 75000, 'shopee', '2020-11-27 05:19:11', '2020-11-27 06:14:58'),
(240, 'JP3755433849', ' PRKCE03L', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Maroon,Size L', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 98900, 98900, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:35:19'),
(241, 'JP0539507011', ' ', ' PRKCE', 'Jaket pria IKC 002 distro Bandung hoodie dua warna keren grosir pakaian pria H0D7/Sweater Kekinian', 'Maroon Hitam', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 75000, 75000, 'shopee', '2020-11-27 05:19:11', '2020-11-27 06:14:58'),
(242, 'JP6835326952', ' Sleting Polos Murah Navy XL', ' Jaket Polos Zipper Murah', 'jaket polos zipper hoodie m,l,xl,xxl hitam marun army pria wanita wame/Jaket Hoodie Polos/JaketPolos', 'NAVY,XL', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 65000, 65000, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:23:31'),
(243, 'JP6835326952', ' Mocca L', ' Chino pendek', 'CELANA PENDEK KOLOR RIP / CHINO MELAR PINGGANG KERUT / COTTON TWILL DIAMOND / HITAM MOCCA GREY CREAM', 'Mocca,L (30-31)', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 59900, 59900, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:35:19'),
(244, 'JP9496688545', ' PRKCE10XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Mocca,Size XL', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 98900, 98900, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:35:19'),
(245, 'JP7431307494', ' Kmj polos 01 L', ' Kemeja Polos', 'Kemeja Polos Hitam Navy Maroon Putih/Kemeja Pria Polos/Grosir Kemeja/Kemeja Polos Murah/Kemeja laki', 'Hitam,L', '2020-11-27', 'belum', 'belum', 'Shoope', 1, 45000, 45000, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:19:11'),
(246, 'JP7431307494', ' Kmj polos 02 L', ' Kemeja Polos', 'Kemeja Polos Hitam Navy Maroon Putih/Kemeja Pria Polos/Grosir Kemeja/Kemeja Polos Murah/Kemeja laki', 'Navy,L', '2020-11-27', 'belum', 'belum', 'Shoope', 1, 45000, 45000, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:19:11'),
(247, 'JP7431307494', ' Kmj polos 02 L', ' Kemeja Polos', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', 'Hitam,M fit L', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 45900, 45900, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:35:19'),
(248, 'JP7118263006', ' Ksiecnalb XL 00', ' Jaket Hoodie Ksiecnalb', 'Jaket Hoodie Purpose World Tour Staff Justin Bieber Jake L1G1T/Hoodie Pria Kekinian/Jaket Korea', 'Putih,XL', '2020-11-27', 'belum', 'belum', 'Shoope', 1, 67700, 67700, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:19:11'),
(249, 'JP3899357418', ' Ksiecnalb XL 00', ' Jaket Hoodie Ksiecnalb', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', 'Hijau botol,M fit L', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 45900, 45900, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:35:19'),
(250, 'JP0733706742', ' PRKCE10XXL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Mocca,Size XXL', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 98900, 98900, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:35:19'),
(251, 'JP5039030019', ' PRKCE10XXL', ' PRKCE', 'JAKET FLEECE Ninja Maroon Murah Diskon / sweater pria', 'Hitam,XXL', '2020-11-27', 'sudah', 'valid', 'Shoope', 2, 75000, 150000, 'shopee', '2020-11-27 05:19:11', '2020-11-27 06:14:58'),
(252, 'JP0245921902', ' PRKCE10XXL', ' PRKCE', 'SWEATER SANTUY MURAH/SANTUY THE FOOT/SWEATER HOODIE/GROSIR JAKET PRIA WANITA/', 'Mocca', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 47500, 47500, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:23:31'),
(253, 'JP3820111733', ' PRKCE10XXL', ' PRKCE', '(14 Varian Model) Jaket Jeans Level Up Printing / Jeans Motif Tidak Bergambar/ Sandwash/ Ordin Jeans', 'Ordin Hitam,M', '2020-11-27', 'belum', 'belum', 'Shoope', 1, 115500, 115500, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:19:11'),
(254, 'JP0661697227', ' PRKCE10XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Mocca,Size XL', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 98900, 98900, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:35:19'),
(255, 'JP8890596350', ' PRKCE10XL', ' PRKCE', 'KEMEJA POLOS LENGAN PANJANG // KEMEJA FORMAL // KEMEJA PRIA // FASHION LEBARAN // HEM PRIA M L XL', 'Navy,M', '2020-11-27', 'belum', 'belum', 'Shoope', 1, 58900, 58900, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:19:11'),
(256, 'JP8890596350', ' PRKCE10XL', ' PRKCE', '( BAYAR DITEMPAT ) KEMEJA FLANNEL LENGAN PANJANG PALING HITS / HEM KOTAK - KOTAK BAHAN FLANNEL MURAH', '01,M', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 65000, 65000, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:35:19'),
(257, 'JP8890596350', ' PRKCE10XL', ' PRKCE', '( BAYAR DITEMPAT ) KEMEJA FLANNEL LENGAN PANJANG PALING HITS / HEM KOTAK - KOTAK BAHAN FLANNEL MURAH', '03,M', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 65000, 65000, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:35:19'),
(258, 'JP0562426540', ' PRKCE10XL', ' PRKCE', 'Jaket Hoodie JUMBO BIG SIZE/Sweater Hoodie Polos Wanita/M Fit XXXXXL/Hitam Navy Maron Hijau Abu Muda', 'Hitam,XXXL', '2020-11-27', 'belum', 'belum', 'Shoope', 1, 69900, 69900, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:19:11'),
(259, 'JP1689275688', ' PRKCE11XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Mustard,Size XL', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 98900, 98900, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:35:19'),
(260, 'JP1689275688', ' ', ' PRKCE', 'Jaket pria IKC 002 distro Bandung hoodie dua warna keren grosir pakaian pria H0D7/Sweater Kekinian', 'Mocca Hitam', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 75000, 75000, 'shopee', '2020-11-27 05:19:11', '2020-11-27 06:14:58'),
(261, 'JP1689275688', ' ', ' PRKCE', 'Jaket pria IKC 002 distro Bandung hoodie dua warna keren grosir pakaian pria H0D7/Sweater Kekinian', 'Hitam Mocca', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 75000, 75000, 'shopee', '2020-11-27 05:19:11', '2020-11-27 06:14:58'),
(262, 'JP3686415487', ' ', ' PRKCE', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', 'Mocca,M fit L', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 45900, 45900, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:35:19'),
(263, 'JP3686415487', ' ', ' PRKCE', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', 'Abu abu,M fit L', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 45900, 45900, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:35:19'),
(264, 'JP4991772307', ' PRKCE03XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Maroon,Size XL', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 98900, 98900, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:35:19'),
(265, 'JP8029542407', ' PRKCE03XL', ' PRKCE', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', 'Mocca,M fit L', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 45900, 45900, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:35:19'),
(266, 'JP4222435612', ' PRKCE04 M', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'hijau army,Size M', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 98900, 98900, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:35:19'),
(267, 'JP5623349637', ' Jaket Polos Hitam XXL', ' jaket polos', 'Jaket Polos Zipper Wanita Pria / Big Size / SIze S M L Xl Xxl Xxxl Xxxxl / Bahan Fleece / Premium', 'Hitam,XXL', '2020-11-27', 'belum', 'belum', 'Shoope', 1, 65000, 65000, 'shopee', '2020-11-27 05:19:11', '2020-11-27 05:19:11'),
(268, 'JP8693393385', ' PRKCE03XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Maroon,Size XL', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 98900, 98900, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:35:19'),
(269, 'JP8693393385', ' MR 04', ' MR hoodie', '(BISA COD) SWEATER MR FASHION - HOODIE LETTER / SWEATER TALI | MISTER HOODIE SWEATER UNISEX TERMURAH', 'Hijau botol', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 67900, 67900, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:35:19'),
(270, 'JP9641943485', ' MR 04', ' MR hoodie', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', 'Hitam,XL fit XXL', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 60900, 60900, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:35:19'),
(271, 'JP9641943485', ' MR 04', ' MR hoodie', '( BAYAR DITEMPAT ) KEMEJA FLANNEL LENGAN PANJANG PALING HITS / HEM KOTAK - KOTAK BAHAN FLANNEL MURAH', '01,L', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 65000, 65000, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:35:19'),
(272, 'JP3527747581', ' Cream M', ' Chino pendek', 'CELANA PENDEK KOLOR RIP / CHINO MELAR PINGGANG KERUT / COTTON TWILL DIAMOND / HITAM MOCCA GREY CREAM', 'Cream,M (29-30)', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 59900, 59900, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:35:19'),
(273, 'JP8739730516', ' PRKCE03XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Maroon,Size XL', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 98900, 98900, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:35:19'),
(274, 'JP8739730516', ' ', ' PRKCE', 'Jaket Parasut V3 Dua Lapis Bukan Satu Lapis/Parasut Lumino/Parasut Milkita Kekinian', 'Maroon-Abu', '2020-11-27', 'belum', 'belum', 'Shoope', 1, 85000, 85000, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:21:16'),
(275, 'JP4535396395', ' PRKCE10XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Mocca,Size XL', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 98900, 98900, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:35:19'),
(276, 'JP3991028414', ' Ksiecnalb XL 11', ' Jaket Hoodie Ksiecnalb', 'Jaket Hoodie Purpose World Tour Staff Justin Bieber Jake L1G1T/Hoodie Pria Kekinian/Jaket Korea', 'Kuning,XL', '2020-11-27', 'belum', 'belum', 'Shoope', 1, 67700, 67700, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:21:16'),
(277, 'JP1140824541', ' Ksiecnalb M 00', ' Jaket Hoodie Ksiecnalb', 'Jaket Hoodie Purpose World Tour Staff Justin Bieber Jake L1G1T/Hoodie Pria Kekinian/Jaket Korea', 'Putih,M', '2020-11-27', 'belum', 'belum', 'Shoope', 1, 67700, 67700, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:21:16'),
(278, 'JP3447365890', ' Hoodie Polos XXXXXL 02', ' Hoodie Polos BIg Size Jumbo', 'Sweater polos unisex zipper cewek cowok big size all size XL XXL XXXL jumper/jaket jumbo cewek cowok', 'Navy,XXXXXL', '2020-11-27', 'belum', 'belum', 'Shoope', 1, 95000, 95000, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:21:16'),
(279, 'JP1798615289', ' wash HITAM XXL', ' washer jeans', 'JEANS SNOW JAKET DENIM SANDWASH BLACK PRIA WANITA PREMIUM QUALITY', 'Hitam,XXL', '2020-11-27', 'belum', 'belum', 'Shoope', 1, 93750, 93750, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:21:16'),
(280, 'JP7725283927', ' wash HITAM XXL', ' washer jeans', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', 'Hitam,XL fit XXL', '2020-11-27', 'sudah', 'valid', 'Shoope', 2, 60900, 121800, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:35:19'),
(281, 'JP0578971888', ' wash HITAM L', ' washer jeans', 'JEANS SNOW JAKET DENIM SANDWASH BLACK PRIA WANITA PREMIUM QUALITY', 'Hitam,L', '2020-11-27', 'belum', 'belum', 'Shoope', 1, 93750, 93750, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:21:16'),
(282, 'JP7946074439', ' Fnin02XL versi tebal', ' FninXLTebal', 'Jaket Ninja Jumbo Cotton Tebal  size L fit XL Premium Hitam Navy Maroon/Alan Walker/Jaket Polos', 'Navy', '2020-11-27', 'belum', 'belum', 'Shoope', 1, 65000, 65000, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:21:16'),
(283, 'JP2141965006', ' Fnin02XL versi tebal', ' FninXLTebal', 'JAKET FLEECE Ninja Maroon Murah Diskon / sweater pria', 'Hitam,XXL', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 75000, 75000, 'shopee', '2020-11-27 05:21:16', '2020-11-27 06:14:58'),
(284, 'JP6395365013', ' PRKCE tosca gelap XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Dark Blue Tosca,Size XL', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 98900, 98900, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:35:19'),
(285, 'JP9815921707', ' hd Closed 01', ' clossed', '(BISA COD) JAKET SWEATER HOODIE CLOSED  Undisclosed Society Hitam Navy Maroon Putih All size Unisex', 'Hitam', '2020-11-27', 'belum', 'belum', 'Shoope', 1, 67900, 67900, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:21:16'),
(286, 'JP8743942271', ' hd Closed 01', ' clossed', 'KEMEJA POLOS LENGAN PANJANG // KEMEJA FORMAL // KEMEJA PRIA // FASHION LEBARAN // HEM PRIA M L XL', 'Navy,L', '2020-11-27', 'belum', 'belum', 'Shoope', 1, 58900, 58900, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:21:16'),
(287, 'JP7085274177', ' hd Closed 01', ' clossed', 'Kaos Polos Hitam Navy Maroon Hijau Premium', 'Warna acak,XXL', '2020-11-27', 'belum', 'belum', 'Shoope', 4, 28900, 115600, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:21:16'),
(288, 'JP4241280860', ' hd Closed 01', ' clossed', 'Kaos Polos Hitam Navy Maroon Hijau Premium', 'Warna acak,XXL', '2020-11-27', 'belum', 'belum', 'Shoope', 4, 28900, 115600, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:21:16'),
(289, 'JP1803546093', ' Lumino mustard biru putih', ' Jaket Lumino V1', 'Jaket Parasut Wanita Lumino/jaket parasut/jaket running/2 lapis bukan 1 lapis', 'Pink', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 57000, 57000, 'shopee', '2020-11-27 05:21:16', '2020-11-27 06:14:58');
INSERT INTO `temp_import` (`id`, `noresi`, `sku`, `skuindex`, `barang`, `varian`, `tgl`, `sts_kirim`, `sts_valid`, `admin`, `jumlah`, `harga`, `total`, `jenis`, `created_at`, `updated_at`) VALUES
(290, 'JP0430231724', ' Polos C XXXL 04', ' Jaket Polos Grade C', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', 'Hijau botol,XXXL', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 69900, 69900, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:23:31'),
(291, 'JP1187444257', ' PRKCE03XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Maroon,Size XL', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 98900, 98900, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:35:19'),
(292, 'JP1187444257', ' ', ' PRKCE', 'Jaket parka / parka cowo / jaket parka cowo / parka pria / parka murah / jaket parka murah / parka 2', 'Maroon-Hitam', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 110000, 110000, 'shopee', '2020-11-27 05:21:16', '2020-11-27 06:14:58'),
(293, 'JP4473482748', ' Sleting Polos Murah Navy M', ' Jaket Polos Zipper Murah', 'jaket polos zipper hoodie m,l,xl,xxl hitam marun army pria wanita wame/Jaket Hoodie Polos/JaketPolos', 'NAVY,M', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 60000, 60000, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:23:31'),
(294, 'JP4473482748', ' Sleting Polos Murah Navy XXL', ' Jaket Polos Zipper Murah', 'jaket polos zipper hoodie m,l,xl,xxl hitam marun army pria wanita wame/Jaket Hoodie Polos/JaketPolos', 'NAVY,XXL', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 65000, 65000, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:23:31'),
(295, 'JP4173673950', ' ', ' Jaket Polos Zipper Murah', 'Sweater Hoodie Humble/Sweater Wanita Humble/Sweater Pria Humble/Sweater Motif/Sweater Kantung Depan', 'Coklat Susu,L', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 47500, 47500, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:23:31'),
(296, 'JP3755433849', ' ', ' Jaket Polos Zipper Murah', 'JAKET FLEECE Ninja Maroon Murah Diskon / sweater pria', 'Hitam,XL', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 75000, 75000, 'shopee', '2020-11-27 05:21:16', '2020-11-27 06:14:58'),
(297, 'JP3755433849', ' PRKCE03L', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Maroon,Size L', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 98900, 98900, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:35:19'),
(298, 'JP0539507011', ' ', ' PRKCE', 'Jaket pria IKC 002 distro Bandung hoodie dua warna keren grosir pakaian pria H0D7/Sweater Kekinian', 'Maroon Hitam', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 75000, 75000, 'shopee', '2020-11-27 05:21:16', '2020-11-27 06:14:58'),
(299, 'JP6835326952', ' Sleting Polos Murah Navy XL', ' Jaket Polos Zipper Murah', 'jaket polos zipper hoodie m,l,xl,xxl hitam marun army pria wanita wame/Jaket Hoodie Polos/JaketPolos', 'NAVY,XL', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 65000, 65000, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:23:31'),
(300, 'JP6835326952', ' Mocca L', ' Chino pendek', 'CELANA PENDEK KOLOR RIP / CHINO MELAR PINGGANG KERUT / COTTON TWILL DIAMOND / HITAM MOCCA GREY CREAM', 'Mocca,L (30-31)', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 59900, 59900, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:35:19'),
(301, 'JP9496688545', ' PRKCE10XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Mocca,Size XL', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 98900, 98900, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:35:19'),
(302, 'JP7431307494', ' Kmj polos 01 L', ' Kemeja Polos', 'Kemeja Polos Hitam Navy Maroon Putih/Kemeja Pria Polos/Grosir Kemeja/Kemeja Polos Murah/Kemeja laki', 'Hitam,L', '2020-11-27', 'belum', 'belum', 'Shoope', 1, 45000, 45000, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:21:16'),
(303, 'JP7431307494', ' Kmj polos 02 L', ' Kemeja Polos', 'Kemeja Polos Hitam Navy Maroon Putih/Kemeja Pria Polos/Grosir Kemeja/Kemeja Polos Murah/Kemeja laki', 'Navy,L', '2020-11-27', 'belum', 'belum', 'Shoope', 1, 45000, 45000, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:21:16'),
(304, 'JP7431307494', ' Kmj polos 02 L', ' Kemeja Polos', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', 'Hitam,M fit L', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 45900, 45900, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:35:19'),
(305, 'JP7118263006', ' Ksiecnalb XL 00', ' Jaket Hoodie Ksiecnalb', 'Jaket Hoodie Purpose World Tour Staff Justin Bieber Jake L1G1T/Hoodie Pria Kekinian/Jaket Korea', 'Putih,XL', '2020-11-27', 'belum', 'belum', 'Shoope', 1, 67700, 67700, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:21:16'),
(306, 'JP3899357418', ' Ksiecnalb XL 00', ' Jaket Hoodie Ksiecnalb', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', 'Hijau botol,M fit L', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 45900, 45900, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:35:19'),
(307, 'JP0733706742', ' PRKCE10XXL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Mocca,Size XXL', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 98900, 98900, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:35:19'),
(308, 'JP5039030019', ' PRKCE10XXL', ' PRKCE', 'JAKET FLEECE Ninja Maroon Murah Diskon / sweater pria', 'Hitam,XXL', '2020-11-27', 'sudah', 'valid', 'Shoope', 2, 75000, 150000, 'shopee', '2020-11-27 05:21:16', '2020-11-27 06:14:58'),
(309, 'JP0245921902', ' PRKCE10XXL', ' PRKCE', 'SWEATER SANTUY MURAH/SANTUY THE FOOT/SWEATER HOODIE/GROSIR JAKET PRIA WANITA/', 'Mocca', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 47500, 47500, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:23:31'),
(310, 'JP3820111733', ' PRKCE10XXL', ' PRKCE', '(14 Varian Model) Jaket Jeans Level Up Printing / Jeans Motif Tidak Bergambar/ Sandwash/ Ordin Jeans', 'Ordin Hitam,M', '2020-11-27', 'belum', 'belum', 'Shoope', 1, 115500, 115500, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:21:16'),
(311, 'JP0661697227', ' PRKCE10XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Mocca,Size XL', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 98900, 98900, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:35:19'),
(312, 'JP8890596350', ' PRKCE10XL', ' PRKCE', 'KEMEJA POLOS LENGAN PANJANG // KEMEJA FORMAL // KEMEJA PRIA // FASHION LEBARAN // HEM PRIA M L XL', 'Navy,M', '2020-11-27', 'belum', 'belum', 'Shoope', 1, 58900, 58900, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:21:16'),
(313, 'JP8890596350', ' PRKCE10XL', ' PRKCE', '( BAYAR DITEMPAT ) KEMEJA FLANNEL LENGAN PANJANG PALING HITS / HEM KOTAK - KOTAK BAHAN FLANNEL MURAH', '01,M', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 65000, 65000, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:35:19'),
(314, 'JP8890596350', ' PRKCE10XL', ' PRKCE', '( BAYAR DITEMPAT ) KEMEJA FLANNEL LENGAN PANJANG PALING HITS / HEM KOTAK - KOTAK BAHAN FLANNEL MURAH', '03,M', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 65000, 65000, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:35:19'),
(315, 'JP0562426540', ' PRKCE10XL', ' PRKCE', 'Jaket Hoodie JUMBO BIG SIZE/Sweater Hoodie Polos Wanita/M Fit XXXXXL/Hitam Navy Maron Hijau Abu Muda', 'Hitam,XXXL', '2020-11-27', 'belum', 'belum', 'Shoope', 1, 69900, 69900, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:21:16'),
(316, 'JP1689275688', ' PRKCE11XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Mustard,Size XL', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 98900, 98900, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:35:19'),
(317, 'JP1689275688', ' ', ' PRKCE', 'Jaket pria IKC 002 distro Bandung hoodie dua warna keren grosir pakaian pria H0D7/Sweater Kekinian', 'Mocca Hitam', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 75000, 75000, 'shopee', '2020-11-27 05:21:16', '2020-11-27 06:14:58'),
(318, 'JP1689275688', ' ', ' PRKCE', 'Jaket pria IKC 002 distro Bandung hoodie dua warna keren grosir pakaian pria H0D7/Sweater Kekinian', 'Hitam Mocca', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 75000, 75000, 'shopee', '2020-11-27 05:21:16', '2020-11-27 06:14:58'),
(319, 'JP3686415487', ' ', ' PRKCE', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', 'Mocca,M fit L', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 45900, 45900, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:35:19'),
(320, 'JP3686415487', ' ', ' PRKCE', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', 'Abu abu,M fit L', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 45900, 45900, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:35:19'),
(321, 'JP4991772307', ' PRKCE03XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Maroon,Size XL', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 98900, 98900, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:35:19'),
(322, 'JP8029542407', ' PRKCE03XL', ' PRKCE', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', 'Mocca,M fit L', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 45900, 45900, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:35:19'),
(323, 'JP4222435612', ' PRKCE04 M', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'hijau army,Size M', '2020-11-27', 'sudah', 'valid', 'Shoope', 1, 98900, 98900, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:35:19'),
(324, 'JP5623349637', ' Jaket Polos Hitam XXL', ' jaket polos', 'Jaket Polos Zipper Wanita Pria / Big Size / SIze S M L Xl Xxl Xxxl Xxxxl / Bahan Fleece / Premium', 'Hitam,XXL', '2020-11-27', 'belum', 'belum', 'Shoope', 1, 65000, 65000, 'shopee', '2020-11-27 05:21:16', '2020-11-27 05:21:16'),
(325, 'JP8693393385', ' PRKCE03XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Maroon,Size XL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 98900, 98900, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:35:19'),
(326, 'JP8693393385', ' MR 04', ' MR hoodie', '(BISA COD) SWEATER MR FASHION - HOODIE LETTER / SWEATER TALI | MISTER HOODIE SWEATER UNISEX TERMURAH', 'Hijau botol', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 67900, 67900, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:35:19'),
(327, 'JP9641943485', ' MR 04', ' MR hoodie', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', 'Hitam,XL fit XXL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 60900, 60900, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:35:19'),
(328, 'JP9641943485', ' MR 04', ' MR hoodie', '( BAYAR DITEMPAT ) KEMEJA FLANNEL LENGAN PANJANG PALING HITS / HEM KOTAK - KOTAK BAHAN FLANNEL MURAH', '01,L', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 65000, 65000, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:35:19'),
(329, 'JP3527747581', ' Cream M', ' Chino pendek', 'CELANA PENDEK KOLOR RIP / CHINO MELAR PINGGANG KERUT / COTTON TWILL DIAMOND / HITAM MOCCA GREY CREAM', 'Cream,M (29-30)', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 59900, 59900, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:35:19'),
(330, 'JP8739730516', ' PRKCE03XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Maroon,Size XL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 98900, 98900, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:35:19'),
(331, 'JP8739730516', ' ', ' PRKCE', 'Jaket Parasut V3 Dua Lapis Bukan Satu Lapis/Parasut Lumino/Parasut Milkita Kekinian', 'Maroon-Abu', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 1, 85000, 85000, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:31:16'),
(332, 'JP4535396395', ' PRKCE10XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Mocca,Size XL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 98900, 98900, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:35:19'),
(333, 'JP3991028414', ' Ksiecnalb XL 11', ' Jaket Hoodie Ksiecnalb', 'Jaket Hoodie Purpose World Tour Staff Justin Bieber Jake L1G1T/Hoodie Pria Kekinian/Jaket Korea', 'Kuning,XL', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 1, 67700, 67700, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:31:16'),
(334, 'JP1140824541', ' Ksiecnalb M 00', ' Jaket Hoodie Ksiecnalb', 'Jaket Hoodie Purpose World Tour Staff Justin Bieber Jake L1G1T/Hoodie Pria Kekinian/Jaket Korea', 'Putih,M', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 1, 67700, 67700, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:31:16'),
(335, 'JP3447365890', ' Hoodie Polos XXXXXL 02', ' Hoodie Polos BIg Size Jumbo', 'Sweater polos unisex zipper cewek cowok big size all size XL XXL XXXL jumper/jaket jumbo cewek cowok', 'Navy,XXXXXL', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 1, 95000, 95000, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:31:16'),
(336, 'JP1798615289', ' wash HITAM XXL', ' washer jeans', 'JEANS SNOW JAKET DENIM SANDWASH BLACK PRIA WANITA PREMIUM QUALITY', 'Hitam,XXL', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 1, 93750, 93750, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:31:16'),
(337, 'JP7725283927', ' wash HITAM XXL', ' washer jeans', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', 'Hitam,XL fit XXL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 2, 60900, 121800, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:35:19'),
(338, 'JP0578971888', ' wash HITAM L', ' washer jeans', 'JEANS SNOW JAKET DENIM SANDWASH BLACK PRIA WANITA PREMIUM QUALITY', 'Hitam,L', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 1, 93750, 93750, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:31:16'),
(339, 'JP7946074439', ' Fnin02XL versi tebal', ' FninXLTebal', 'Jaket Ninja Jumbo Cotton Tebal  size L fit XL Premium Hitam Navy Maroon/Alan Walker/Jaket Polos', 'Navy', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 1, 65000, 65000, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:31:16'),
(340, 'JP2141965006', ' Fnin02XL versi tebal', ' FninXLTebal', 'JAKET FLEECE Ninja Maroon Murah Diskon / sweater pria', 'Hitam,XXL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 75000, 75000, 'shopee', '2020-11-27 05:31:16', '2020-11-27 06:14:58'),
(341, 'JP6395365013', ' PRKCE tosca gelap XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Dark Blue Tosca,Size XL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 98900, 98900, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:35:19'),
(342, 'JP9815921707', ' hd Closed 01', ' clossed', '(BISA COD) JAKET SWEATER HOODIE CLOSED  Undisclosed Society Hitam Navy Maroon Putih All size Unisex', 'Hitam', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 1, 67900, 67900, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:31:16'),
(343, 'JP8743942271', ' hd Closed 01', ' clossed', 'KEMEJA POLOS LENGAN PANJANG // KEMEJA FORMAL // KEMEJA PRIA // FASHION LEBARAN // HEM PRIA M L XL', 'Navy,L', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 1, 58900, 58900, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:31:16'),
(344, 'JP7085274177', ' hd Closed 01', ' clossed', 'Kaos Polos Hitam Navy Maroon Hijau Premium', 'Warna acak,XXL', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 4, 28900, 115600, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:31:16'),
(345, 'JP4241280860', ' hd Closed 01', ' clossed', 'Kaos Polos Hitam Navy Maroon Hijau Premium', 'Warna acak,XXL', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 4, 28900, 115600, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:31:16'),
(346, 'JP1803546093', ' Lumino mustard biru putih', ' Jaket Lumino V1', 'Jaket Parasut Wanita Lumino/jaket parasut/jaket running/2 lapis bukan 1 lapis', 'Pink', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 57000, 57000, 'shopee', '2020-11-27 05:31:16', '2020-11-27 06:14:58'),
(347, 'JP0430231724', ' Polos C XXXL 04', ' Jaket Polos Grade C', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', 'Hijau botol,XXXL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 69900, 69900, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:35:19'),
(348, 'JP1187444257', ' PRKCE03XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Maroon,Size XL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 98900, 98900, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:35:19'),
(349, 'JP1187444257', ' ', ' PRKCE', 'Jaket parka / parka cowo / jaket parka cowo / parka pria / parka murah / jaket parka murah / parka 2', 'Maroon-Hitam', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 110000, 110000, 'shopee', '2020-11-27 05:31:16', '2020-11-27 06:14:58'),
(350, 'JP4473482748', ' Sleting Polos Murah Navy M', ' Jaket Polos Zipper Murah', 'jaket polos zipper hoodie m,l,xl,xxl hitam marun army pria wanita wame/Jaket Hoodie Polos/JaketPolos', 'NAVY,M', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 60000, 60000, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:35:19'),
(351, 'JP4473482748', ' Sleting Polos Murah Navy XXL', ' Jaket Polos Zipper Murah', 'jaket polos zipper hoodie m,l,xl,xxl hitam marun army pria wanita wame/Jaket Hoodie Polos/JaketPolos', 'NAVY,XXL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 65000, 65000, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:35:19'),
(352, 'JP4173673950', ' ', ' Jaket Polos Zipper Murah', 'Sweater Hoodie Humble/Sweater Wanita Humble/Sweater Pria Humble/Sweater Motif/Sweater Kantung Depan', 'Coklat Susu,L', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 47500, 47500, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:35:19'),
(353, 'JP3755433849', ' ', ' Jaket Polos Zipper Murah', 'JAKET FLEECE Ninja Maroon Murah Diskon / sweater pria', 'Hitam,XL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 75000, 75000, 'shopee', '2020-11-27 05:31:16', '2020-11-27 06:14:58'),
(354, 'JP3755433849', ' PRKCE03L', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Maroon,Size L', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 98900, 98900, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:35:19'),
(355, 'JP0539507011', ' ', ' PRKCE', 'Jaket pria IKC 002 distro Bandung hoodie dua warna keren grosir pakaian pria H0D7/Sweater Kekinian', 'Maroon Hitam', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 75000, 75000, 'shopee', '2020-11-27 05:31:16', '2020-11-27 06:14:58'),
(356, 'JP6835326952', ' Sleting Polos Murah Navy XL', ' Jaket Polos Zipper Murah', 'jaket polos zipper hoodie m,l,xl,xxl hitam marun army pria wanita wame/Jaket Hoodie Polos/JaketPolos', 'NAVY,XL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 65000, 65000, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:35:19'),
(357, 'JP6835326952', ' Mocca L', ' Chino pendek', 'CELANA PENDEK KOLOR RIP / CHINO MELAR PINGGANG KERUT / COTTON TWILL DIAMOND / HITAM MOCCA GREY CREAM', 'Mocca,L (30-31)', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 59900, 59900, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:35:19'),
(358, 'JP9496688545', ' PRKCE10XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Mocca,Size XL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 98900, 98900, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:35:19'),
(359, 'JP7431307494', ' Kmj polos 01 L', ' Kemeja Polos', 'Kemeja Polos Hitam Navy Maroon Putih/Kemeja Pria Polos/Grosir Kemeja/Kemeja Polos Murah/Kemeja laki', 'Hitam,L', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 1, 45000, 45000, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:31:16'),
(360, 'JP7431307494', ' Kmj polos 02 L', ' Kemeja Polos', 'Kemeja Polos Hitam Navy Maroon Putih/Kemeja Pria Polos/Grosir Kemeja/Kemeja Polos Murah/Kemeja laki', 'Navy,L', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 1, 45000, 45000, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:31:16'),
(361, 'JP7431307494', ' Kmj polos 02 L', ' Kemeja Polos', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', 'Hitam,M fit L', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 45900, 45900, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:35:19'),
(362, 'JP7118263006', ' Ksiecnalb XL 00', ' Jaket Hoodie Ksiecnalb', 'Jaket Hoodie Purpose World Tour Staff Justin Bieber Jake L1G1T/Hoodie Pria Kekinian/Jaket Korea', 'Putih,XL', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 1, 67700, 67700, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:31:16'),
(363, 'JP3899357418', ' Ksiecnalb XL 00', ' Jaket Hoodie Ksiecnalb', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', 'Hijau botol,M fit L', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 45900, 45900, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:35:19'),
(364, 'JP0733706742', ' PRKCE10XXL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Mocca,Size XXL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 98900, 98900, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:35:19'),
(365, 'JP5039030019', ' PRKCE10XXL', ' PRKCE', 'JAKET FLEECE Ninja Maroon Murah Diskon / sweater pria', 'Hitam,XXL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 2, 75000, 150000, 'shopee', '2020-11-27 05:31:16', '2020-11-27 06:14:58'),
(366, 'JP0245921902', ' PRKCE10XXL', ' PRKCE', 'SWEATER SANTUY MURAH/SANTUY THE FOOT/SWEATER HOODIE/GROSIR JAKET PRIA WANITA/', 'Mocca', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 47500, 47500, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:35:19'),
(367, 'JP3820111733', ' PRKCE10XXL', ' PRKCE', '(14 Varian Model) Jaket Jeans Level Up Printing / Jeans Motif Tidak Bergambar/ Sandwash/ Ordin Jeans', 'Ordin Hitam,M', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 1, 115500, 115500, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:31:16'),
(368, 'JP0661697227', ' PRKCE10XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Mocca,Size XL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 98900, 98900, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:35:19'),
(369, 'JP8890596350', ' PRKCE10XL', ' PRKCE', 'KEMEJA POLOS LENGAN PANJANG // KEMEJA FORMAL // KEMEJA PRIA // FASHION LEBARAN // HEM PRIA M L XL', 'Navy,M', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 1, 58900, 58900, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:31:16'),
(370, 'JP8890596350', ' PRKCE10XL', ' PRKCE', '( BAYAR DITEMPAT ) KEMEJA FLANNEL LENGAN PANJANG PALING HITS / HEM KOTAK - KOTAK BAHAN FLANNEL MURAH', '01,M', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 65000, 65000, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:35:19'),
(371, 'JP8890596350', ' PRKCE10XL', ' PRKCE', '( BAYAR DITEMPAT ) KEMEJA FLANNEL LENGAN PANJANG PALING HITS / HEM KOTAK - KOTAK BAHAN FLANNEL MURAH', '03,M', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 65000, 65000, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:35:19'),
(372, 'JP0562426540', ' PRKCE10XL', ' PRKCE', 'Jaket Hoodie JUMBO BIG SIZE/Sweater Hoodie Polos Wanita/M Fit XXXXXL/Hitam Navy Maron Hijau Abu Muda', 'Hitam,XXXL', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 1, 69900, 69900, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:31:16'),
(373, 'JP1689275688', ' PRKCE11XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Mustard,Size XL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 98900, 98900, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:35:19'),
(374, 'JP1689275688', ' ', ' PRKCE', 'Jaket pria IKC 002 distro Bandung hoodie dua warna keren grosir pakaian pria H0D7/Sweater Kekinian', 'Mocca Hitam', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 75000, 75000, 'shopee', '2020-11-27 05:31:16', '2020-11-27 06:14:58'),
(375, 'JP1689275688', ' ', ' PRKCE', 'Jaket pria IKC 002 distro Bandung hoodie dua warna keren grosir pakaian pria H0D7/Sweater Kekinian', 'Hitam Mocca', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 75000, 75000, 'shopee', '2020-11-27 05:31:16', '2020-11-27 06:14:58'),
(376, 'JP3686415487', ' ', ' PRKCE', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', 'Mocca,M fit L', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 45900, 45900, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:35:19'),
(377, 'JP3686415487', ' ', ' PRKCE', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', 'Abu abu,M fit L', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 45900, 45900, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:35:19'),
(378, 'JP4991772307', ' PRKCE03XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Maroon,Size XL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 98900, 98900, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:35:19'),
(379, 'JP8029542407', ' PRKCE03XL', ' PRKCE', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', 'Mocca,M fit L', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 45900, 45900, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:35:19'),
(380, 'JP4222435612', ' PRKCE04 M', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'hijau army,Size M', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 98900, 98900, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:35:19'),
(381, 'JP5623349637', ' Jaket Polos Hitam XXL', ' jaket polos', 'Jaket Polos Zipper Wanita Pria / Big Size / SIze S M L Xl Xxl Xxxl Xxxxl / Bahan Fleece / Premium', 'Hitam,XXL', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 1, 65000, 65000, 'shopee', '2020-11-27 05:31:16', '2020-11-27 05:31:16'),
(382, 'JP8693393385', ' PRKCE03XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Maroon,Size XL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 98900, 98900, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(383, 'JP8693393385', ' MR 04', ' MR hoodie', '(BISA COD) SWEATER MR FASHION - HOODIE LETTER / SWEATER TALI | MISTER HOODIE SWEATER UNISEX TERMURAH', 'Hijau botol', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 67900, 67900, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(384, 'JP9641943485', ' MR 04', ' MR hoodie', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', 'Hitam,XL fit XXL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 60900, 60900, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(385, 'JP9641943485', ' MR 04', ' MR hoodie', '( BAYAR DITEMPAT ) KEMEJA FLANNEL LENGAN PANJANG PALING HITS / HEM KOTAK - KOTAK BAHAN FLANNEL MURAH', '01,L', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 65000, 65000, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(386, 'JP3527747581', ' Cream M', ' Chino pendek', 'CELANA PENDEK KOLOR RIP / CHINO MELAR PINGGANG KERUT / COTTON TWILL DIAMOND / HITAM MOCCA GREY CREAM', 'Cream,M (29-30)', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 59900, 59900, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(387, 'JP8739730516', ' PRKCE03XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Maroon,Size XL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 98900, 98900, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(388, 'JP8739730516', ' ', ' PRKCE', 'Jaket Parasut V3 Dua Lapis Bukan Satu Lapis/Parasut Lumino/Parasut Milkita Kekinian', 'Maroon-Abu', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 1, 85000, 85000, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:13:04'),
(389, 'JP4535396395', ' PRKCE10XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Mocca,Size XL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 98900, 98900, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(390, 'JP3991028414', ' Ksiecnalb XL 11', ' Jaket Hoodie Ksiecnalb', 'Jaket Hoodie Purpose World Tour Staff Justin Bieber Jake L1G1T/Hoodie Pria Kekinian/Jaket Korea', 'Kuning,XL', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 1, 67700, 67700, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:13:04'),
(391, 'JP1140824541', ' Ksiecnalb M 00', ' Jaket Hoodie Ksiecnalb', 'Jaket Hoodie Purpose World Tour Staff Justin Bieber Jake L1G1T/Hoodie Pria Kekinian/Jaket Korea', 'Putih,M', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 1, 67700, 67700, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:13:04'),
(392, 'JP3447365890', ' Hoodie Polos XXXXXL 02', ' Hoodie Polos BIg Size Jumbo', 'Sweater polos unisex zipper cewek cowok big size all size XL XXL XXXL jumper/jaket jumbo cewek cowok', 'Navy,XXXXXL', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 1, 95000, 95000, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:13:04'),
(393, 'JP1798615289', ' wash HITAM XXL', ' washer jeans', 'JEANS SNOW JAKET DENIM SANDWASH BLACK PRIA WANITA PREMIUM QUALITY', 'Hitam,XXL', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 1, 93750, 93750, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:13:04'),
(394, 'JP7725283927', ' wash HITAM XXL', ' washer jeans', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', 'Hitam,XL fit XXL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 2, 60900, 121800, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(395, 'JP0578971888', ' wash HITAM L', ' washer jeans', 'JEANS SNOW JAKET DENIM SANDWASH BLACK PRIA WANITA PREMIUM QUALITY', 'Hitam,L', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 1, 93750, 93750, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:13:04'),
(396, 'JP7946074439', ' Fnin02XL versi tebal', ' FninXLTebal', 'Jaket Ninja Jumbo Cotton Tebal  size L fit XL Premium Hitam Navy Maroon/Alan Walker/Jaket Polos', 'Navy', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 1, 65000, 65000, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:13:04'),
(397, 'JP2141965006', ' Fnin02XL versi tebal', ' FninXLTebal', 'JAKET FLEECE Ninja Maroon Murah Diskon / sweater pria', 'Hitam,XXL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 75000, 75000, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(398, 'JP6395365013', ' PRKCE tosca gelap XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Dark Blue Tosca,Size XL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 98900, 98900, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(399, 'JP9815921707', ' hd Closed 01', ' clossed', '(BISA COD) JAKET SWEATER HOODIE CLOSED  Undisclosed Society Hitam Navy Maroon Putih All size Unisex', 'Hitam', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 1, 67900, 67900, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:13:04'),
(400, 'JP8743942271', ' hd Closed 01', ' clossed', 'KEMEJA POLOS LENGAN PANJANG // KEMEJA FORMAL // KEMEJA PRIA // FASHION LEBARAN // HEM PRIA M L XL', 'Navy,L', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 1, 58900, 58900, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:13:04'),
(401, 'JP7085274177', ' hd Closed 01', ' clossed', 'Kaos Polos Hitam Navy Maroon Hijau Premium', 'Warna acak,XXL', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 4, 28900, 115600, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:13:04'),
(402, 'JP4241280860', ' hd Closed 01', ' clossed', 'Kaos Polos Hitam Navy Maroon Hijau Premium', 'Warna acak,XXL', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 4, 28900, 115600, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:13:04'),
(403, 'JP1803546093', ' Lumino mustard biru putih', ' Jaket Lumino V1', 'Jaket Parasut Wanita Lumino/jaket parasut/jaket running/2 lapis bukan 1 lapis', 'Pink', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 57000, 57000, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(404, 'JP0430231724', ' Polos C XXXL 04', ' Jaket Polos Grade C', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', 'Hijau botol,XXXL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 69900, 69900, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(405, 'JP1187444257', ' PRKCE03XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Maroon,Size XL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 98900, 98900, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(406, 'JP1187444257', ' ', ' PRKCE', 'Jaket parka / parka cowo / jaket parka cowo / parka pria / parka murah / jaket parka murah / parka 2', 'Maroon-Hitam', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 110000, 110000, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(407, 'JP4473482748', ' Sleting Polos Murah Navy M', ' Jaket Polos Zipper Murah', 'jaket polos zipper hoodie m,l,xl,xxl hitam marun army pria wanita wame/Jaket Hoodie Polos/JaketPolos', 'NAVY,M', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 60000, 60000, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(408, 'JP4473482748', ' Sleting Polos Murah Navy XXL', ' Jaket Polos Zipper Murah', 'jaket polos zipper hoodie m,l,xl,xxl hitam marun army pria wanita wame/Jaket Hoodie Polos/JaketPolos', 'NAVY,XXL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 65000, 65000, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(409, 'JP4173673950', ' ', ' Jaket Polos Zipper Murah', 'Sweater Hoodie Humble/Sweater Wanita Humble/Sweater Pria Humble/Sweater Motif/Sweater Kantung Depan', 'Coklat Susu,L', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 47500, 47500, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(410, 'JP3755433849', ' ', ' Jaket Polos Zipper Murah', 'JAKET FLEECE Ninja Maroon Murah Diskon / sweater pria', 'Hitam,XL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 75000, 75000, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(411, 'JP3755433849', ' PRKCE03L', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Maroon,Size L', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 98900, 98900, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(412, 'JP0539507011', ' ', ' PRKCE', 'Jaket pria IKC 002 distro Bandung hoodie dua warna keren grosir pakaian pria H0D7/Sweater Kekinian', 'Maroon Hitam', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 75000, 75000, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(413, 'JP6835326952', ' Sleting Polos Murah Navy XL', ' Jaket Polos Zipper Murah', 'jaket polos zipper hoodie m,l,xl,xxl hitam marun army pria wanita wame/Jaket Hoodie Polos/JaketPolos', 'NAVY,XL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 65000, 65000, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(414, 'JP6835326952', ' Mocca L', ' Chino pendek', 'CELANA PENDEK KOLOR RIP / CHINO MELAR PINGGANG KERUT / COTTON TWILL DIAMOND / HITAM MOCCA GREY CREAM', 'Mocca,L (30-31)', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 59900, 59900, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(415, 'JP9496688545', ' PRKCE10XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Mocca,Size XL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 98900, 98900, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(416, 'JP7431307494', ' Kmj polos 01 L', ' Kemeja Polos', 'Kemeja Polos Hitam Navy Maroon Putih/Kemeja Pria Polos/Grosir Kemeja/Kemeja Polos Murah/Kemeja laki', 'Hitam,L', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 1, 45000, 45000, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:13:04'),
(417, 'JP7431307494', ' Kmj polos 02 L', ' Kemeja Polos', 'Kemeja Polos Hitam Navy Maroon Putih/Kemeja Pria Polos/Grosir Kemeja/Kemeja Polos Murah/Kemeja laki', 'Navy,L', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 1, 45000, 45000, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:13:04'),
(418, 'JP7431307494', ' Kmj polos 02 L', ' Kemeja Polos', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', 'Hitam,M fit L', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 45900, 45900, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(419, 'JP7118263006', ' Ksiecnalb XL 00', ' Jaket Hoodie Ksiecnalb', 'Jaket Hoodie Purpose World Tour Staff Justin Bieber Jake L1G1T/Hoodie Pria Kekinian/Jaket Korea', 'Putih,XL', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 1, 67700, 67700, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:13:04'),
(420, 'JP3899357418', ' Ksiecnalb XL 00', ' Jaket Hoodie Ksiecnalb', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', 'Hijau botol,M fit L', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 45900, 45900, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(421, 'JP0733706742', ' PRKCE10XXL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Mocca,Size XXL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 98900, 98900, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(422, 'JP5039030019', ' PRKCE10XXL', ' PRKCE', 'JAKET FLEECE Ninja Maroon Murah Diskon / sweater pria', 'Hitam,XXL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 2, 75000, 150000, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(423, 'JP0245921902', ' PRKCE10XXL', ' PRKCE', 'SWEATER SANTUY MURAH/SANTUY THE FOOT/SWEATER HOODIE/GROSIR JAKET PRIA WANITA/', 'Mocca', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 47500, 47500, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(424, 'JP3820111733', ' PRKCE10XXL', ' PRKCE', '(14 Varian Model) Jaket Jeans Level Up Printing / Jeans Motif Tidak Bergambar/ Sandwash/ Ordin Jeans', 'Ordin Hitam,M', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 1, 115500, 115500, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:13:04'),
(425, 'JP0661697227', ' PRKCE10XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Mocca,Size XL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 98900, 98900, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(426, 'JP8890596350', ' PRKCE10XL', ' PRKCE', 'KEMEJA POLOS LENGAN PANJANG // KEMEJA FORMAL // KEMEJA PRIA // FASHION LEBARAN // HEM PRIA M L XL', 'Navy,M', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 1, 58900, 58900, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:13:04'),
(427, 'JP8890596350', ' PRKCE10XL', ' PRKCE', '( BAYAR DITEMPAT ) KEMEJA FLANNEL LENGAN PANJANG PALING HITS / HEM KOTAK - KOTAK BAHAN FLANNEL MURAH', '01,M', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 65000, 65000, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(428, 'JP8890596350', ' PRKCE10XL', ' PRKCE', '( BAYAR DITEMPAT ) KEMEJA FLANNEL LENGAN PANJANG PALING HITS / HEM KOTAK - KOTAK BAHAN FLANNEL MURAH', '03,M', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 65000, 65000, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(429, 'JP0562426540', ' PRKCE10XL', ' PRKCE', 'Jaket Hoodie JUMBO BIG SIZE/Sweater Hoodie Polos Wanita/M Fit XXXXXL/Hitam Navy Maron Hijau Abu Muda', 'Hitam,XXXL', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 1, 69900, 69900, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:13:04'),
(430, 'JP1689275688', ' PRKCE11XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Mustard,Size XL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 98900, 98900, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(431, 'JP1689275688', ' ', ' PRKCE', 'Jaket pria IKC 002 distro Bandung hoodie dua warna keren grosir pakaian pria H0D7/Sweater Kekinian', 'Mocca Hitam', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 75000, 75000, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(432, 'JP1689275688', ' ', ' PRKCE', 'Jaket pria IKC 002 distro Bandung hoodie dua warna keren grosir pakaian pria H0D7/Sweater Kekinian', 'Hitam Mocca', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 75000, 75000, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(433, 'JP3686415487', ' ', ' PRKCE', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', 'Mocca,M fit L', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 45900, 45900, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(434, 'JP3686415487', ' ', ' PRKCE', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', 'Abu abu,M fit L', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 45900, 45900, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(435, 'JP4991772307', ' PRKCE03XL', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'Maroon,Size XL', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 98900, 98900, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(436, 'JP8029542407', ' PRKCE03XL', ' PRKCE', 'Sweater Murah | Natural | Jaket Polos Dengan Hoodie Tanpa Resleting Hitam Navy Maroon | Grosir Jaket', 'Mocca,M fit L', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 45900, 45900, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(437, 'JP4222435612', ' PRKCE04 M', ' PRKCE', 'JAKET PARKA WANITA BIG SIZE BAGIAN HOODIE BISA DILEPAS DAN BOLAK BALIK', 'hijau army,Size M', '2020-11-27', 'sudah', 'valid', 'deva satrio damara', 1, 98900, 98900, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:14:58'),
(438, 'JP5623349637', ' Jaket Polos Hitam XXL', ' jaket polos', 'Jaket Polos Zipper Wanita Pria / Big Size / SIze S M L Xl Xxl Xxxl Xxxxl / Bahan Fleece / Premium', 'Hitam,XXL', '2020-11-27', 'belum', 'belum', 'deva satrio damara', 1, 65000, 65000, 'shopee', '2020-11-27 06:13:04', '2020-11-27 06:13:04');

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
(1, 'deva satrio damara', 'devasatrio', 'Super Admin', 'satrio@gmail.com', '0234890', '1591507920-love.png', NULL, '$2y$10$sQIyYXne5mnsZ3rEE6MNwOGweJXyWzCtFQZDWhgTNZSIjiYwvxuti', NULL, '2020-06-06 21:36:35', '2020-06-06 22:32:00'),
(2, 'Shoope', 'Shoope', 'Admin', 'joy.it.official@gmail.com', '12345678', '1606478672-logowakatobi-removebg-preview-(1).png', NULL, '$2y$10$t9ZS/CZM0DYdsoL2gUoMuO0JqpsN0Qq8NzFqIYRN8bPCHocqvPduu', NULL, NULL, NULL);

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
-- Indexes for table `barang_trx`
--
ALTER TABLE `barang_trx`
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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `barangkey`
--
ALTER TABLE `barangkey`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;
--
-- AUTO_INCREMENT for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `barang_trx`
--
ALTER TABLE `barang_trx`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=439;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
