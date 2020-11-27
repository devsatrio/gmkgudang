-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.38-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for db_gudang
DROP DATABASE IF EXISTS `db_gudang`;
CREATE DATABASE IF NOT EXISTS `db_gudang` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_gudang`;

-- Dumping structure for table db_gudang.barang_trx
DROP TABLE IF EXISTS `barang_trx`;
CREATE TABLE IF NOT EXISTS `barang_trx` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_gudang.barang_trx: ~11 rows (approximately)
DELETE FROM `barang_trx`;
/*!40000 ALTER TABLE `barang_trx` DISABLE KEYS */;
INSERT INTO `barang_trx` (`id`, `noresi`, `sku`, `skuindex`, `barang`, `tgl`, `jumlah`, `harga`, `total`, `jenis`, `admin`, `stts`, `created_at`, `updated_at`) VALUES
	(15, 'JP2874769234', ' Polos C XXXL 02', 'JP101', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', '2020-11-24', 1, 69900, 69900, 'shopee', 'Sopo Nyono', 'sended', '2020-11-26 11:09:59', '2020-11-26 11:09:59'),
	(16, 'JP4920767647', ' Kemeja Flannel XL', 'JP101', 'YANG LAGI HITS Kemeja Flanel Distro Cowok Lengan Panjang Warna Biru Dongker Garis Merah Seri', '2020-11-24', 1, 65000, 65000, 'shopee', 'Sopo Nyono', 'sended', '2020-11-26 11:09:59', '2020-11-26 11:09:59'),
	(17, 'JP4920767647', ' ', 'BB101', 'Sweater Hoodie Humble/Sweater Wanita Humble/Sweater Pria Humble/Sweater Motif/Sweater Kantung Depan', '2020-11-24', 1, 47500, 47500, 'shopee', 'Sopo Nyono', 'sended', '2020-11-26 19:38:42', '2020-11-26 19:38:42'),
	(18, 'JP8260522081', ' BBCE0208', 'BB101', 'Jaket Parka Wanita Merah Navy / All Collor/Size L/Cewek Casual Outdoor Gunung Parasut Anti Air Keren', '2020-11-24', 1, 85000, 85000, 'shopee', 'deva satrio damara', 'sended', '2020-11-26 19:38:42', '2020-11-26 19:38:42'),
	(19, 'JP4782133963', ' Polos C XXL 04', 'JP101', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', '2020-11-26', 1, 69900, 69900, 'shopee', 'deva satrio damara', 'sended', '2020-11-26 19:48:01', '2020-11-26 19:48:01'),
	(20, 'JP4782133963', ' Polos C XXXXXL 04', 'JP101', 'HOODIE POLOS JUMBO/HOODIE POLOS M L XL XXL XXXL XXXXL XXXXXL/HOODIE POLOS PRIA JUMBO/HOODIE BIG SIZE', '2020-11-26', 1, 69900, 69900, 'shopee', 'Rifka', 'sended', '2020-11-26 19:48:01', '2020-11-26 19:48:01'),
	(21, 'NLIDAP1062807408', 'Ksiclab 10-01 XL', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-26', 1, 52800, 52800, 'lazada', 'Rifka', 'sended', '2020-11-26 21:24:56', '2020-11-26 21:24:56'),
	(22, 'NLIDAP1062807457', 'Ksiclab 10-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-26', 1, 50300, 50300, 'lazada', 'Roni', 'sended', '2020-11-26 21:24:56', '2020-11-26 21:24:56'),
	(23, 'NLIDAP1062807457', 'Ksiclab 01-10 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 50300, 50300, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 08:44:41', '2020-11-27 08:44:41'),
	(24, 'NLIDAP1062807168', 'Ksiclab 18-01 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 08:44:54', '2020-11-27 08:44:54'),
	(25, 'NLIDAP1062807168', 'Ksiclab 01-18 L', 'FL101', 'Jaket Hoodie Tanpa Resleting Motif Ksiecnalb Pria Wanita Premium Siza M L XL', '2020-11-27', 1, 52800, 52800, 'lazada', 'deva satrio damara', 'sended', '2020-11-27 08:45:11', '2020-11-27 08:45:11');
/*!40000 ALTER TABLE `barang_trx` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
