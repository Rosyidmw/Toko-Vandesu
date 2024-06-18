-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2024 at 04:57 AM
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
-- Database: `toko_online`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama`) VALUES
(9, 'Jujutsu Kaisen'),
(10, 'Genshin Impact'),
(11, 'Demon Slayer'),
(12, 'Naruto: Shippūden');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `harga` double NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `ketersediaan_stok` enum('Habis','Tersedia') DEFAULT 'Tersedia'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `kategori_id`, `nama`, `harga`, `foto`, `detail`, `ketersediaan_stok`) VALUES
(16, 11, 'Zenitsu Special', 15000, 'eJkj7hhnfzGy5MAKgaPU.jpeg', 'Gantungan kunci Kimetsu No Yaiba ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(17, 11, 'Nezuko Special', 15000, 'WPx6YcvvdYOpNInrTues.jpeg', 'Gantungan kunci Kimetsu No Yaiba ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(18, 11, 'Tanjiro Special', 15000, '7odVI6wvjim0RB4xCNHT.jpeg', 'Gantungan kunci Kimetsu No Yaiba ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(19, 11, 'Inosuke Special', 15000, 'TiwPJdXJpFCgc08IOfW8.jpeg', 'Gantungan kunci Kimetsu No Yaiba ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(20, 11, 'Giyuu Special', 15000, 'b1NTmwCidkVgkwdVMTqB.jpeg', 'Gantungan kunci Kimetsu No Yaiba ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(21, 11, 'Inosuke', 15000, 'n2bEhAZI126TevlBmabj.jpeg', 'Gantungan kunci Kimetsu No Yaiba ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(22, 11, 'Obanai', 15000, 'CdqCDBjNs6B8E4SfmIJZ.jpeg', 'Gantungan kunci Kimetsu No Yaiba ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(23, 11, 'Mitsuri', 15000, '3Kb5x0htLfNBKyySXmvb.jpeg', 'Gantungan kunci Kimetsu No Yaiba ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(24, 11, 'Giyuu', 15000, 'ddC9cjDM6V7cpmkPa2j4.jpeg', 'Gantungan kunci Kimetsu No Yaiba ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(25, 11, 'Kochou', 15000, 'rBBll1ksNcT5TlUJFjf9.jpeg', 'Gantungan kunci Kimetsu No Yaiba ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(26, 11, 'Nezuko 2', 15000, 'TVXN5xBNff7LpAVTqTzQ.jpeg', 'Gantungan kunci Kimetsu No Yaiba ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(27, 11, 'Nezuko', 15000, 'wnrRnmnERnVR9uC1W29R.jpeg', 'Gantungan kunci Kimetsu No Yaiba ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(28, 11, 'Muzan Kibutsuji', 15000, 'G1Z68Oprw6ZgUxpyFlQE.jpeg', 'Gantungan kunci Kimetsu No Yaiba ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(29, 9, 'Yuji Special', 15000, 'tS6kXucSlf9mxVka7mwC.jpeg', 'Gantungan kunci Jujutsu Kaisen ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(31, 9, 'Sukuna Special', 15000, 'Iz6gV0ZKwczd5ZzFTUie.jpeg', 'Gantungan kunci Jujutsu Kaisen ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(32, 9, 'Megumi Special', 15000, 'HypUetJcYg9W4yn0UuSr.jpeg', 'Gantungan kunci Jujutsu Kaisen ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(33, 9, 'Gojo I', 15000, '69qUoK8rgPtI5EamPJwD.jpeg', 'Gantungan kunci Jujutsu Kaisen ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(34, 9, 'Toge Inumaki', 15000, 'WqN50WN3bsWFKQVUxBZg.jpeg', 'Gantungan kunci Jujutsu Kaisen ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(35, 9, 'Gojo II', 15000, 'IrPDYVmu1vJNMd4O4uJ4.jpeg', 'Gantungan kunci Jujutsu Kaisen ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Habis'),
(36, 9, 'Megumi I ', 15000, 'guYzOnN1kFwyJ8Ya135V.jpeg', 'Gantungan kunci Jujutsu Kaisen ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(37, 9, 'Gojo III', 15000, 'vD47jqkkAK2H5Gp7IzQv.jpeg', 'Gantungan kunci Jujutsu Kaisen ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(38, 9, 'Megumi II', 15000, '3fsiTMxHzsrLwspk5V2b.jpeg', 'Gantungan kunci Jujutsu Kaisen ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(39, 9, 'Gojo IV', 15000, 'hLhAOwOKOFyX3hH7CAAy.jpeg', 'Gantungan kunci Jujutsu Kaisen ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Habis'),
(40, 9, 'Panda I', 15000, 'ygbyrWBsrcIjLXDahiBA.jpeg', 'Gantungan kunci Jujutsu Kaisen ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(41, 9, 'Suguru', 15000, '1PTDqGJAX42FG3tkinvg.jpeg', 'Gantungan kunci Jujutsu Kaisen ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(42, 9, 'Toji Fushiguro', 15000, 'cIVLwKwT5YTGCtUPVxCE.jpeg', 'Gantungan kunci Jujutsu Kaisen ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(43, 10, 'Keqing ', 15000, 'hCAIvdGYoypvIHUWVUS6.jpeg', 'Gantungan kunci Genshin Impact ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(44, 10, 'Tartaglia', 15000, 'uquO0UohiP8x9sOiej5L.jpeg', 'Gantungan kunci Genshin Impact ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(45, 10, 'Kamisato Ayaka', 15000, 'Sju6iXO4NgTFEtTDnVep.jpeg', 'Gantungan kunci Genshin Impact ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(46, 10, 'Al Haitam Cute', 15000, 'gSdZPiM255ljT4mu8I6H.jpeg', 'Gantungan kunci Genshin Impact ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Habis'),
(47, 10, 'Cyno Cute', 15000, 'f6hXnQ1O8tXZGI8vvTwX.jpeg', 'Gantungan kunci Genshin Impact ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Habis'),
(48, 10, 'Qiqi', 15000, 'O6ubPZCE5LS5waannkmQ.jpeg', 'Gantungan kunci Genshin Impact ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(49, 10, 'Paimon', 15000, 'QP8s3j27J33M3m8dprSH.jpeg', 'Gantungan kunci Genshin Impact ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Habis'),
(50, 10, 'Tighnari', 15000, '8q0B1z5ruitV57KFSuRH.jpeg', 'Gantungan kunci Genshin Impact ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(51, 10, 'Eula', 15000, 'xktqYF3t3OT1Qs3vZXUL.jpeg', 'Gantungan kunci Genshin Impact ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Habis'),
(52, 10, 'Cyno', 15000, 'EV5pJO4Ld9VrBubYyOrf.jpeg', 'Gantungan kunci Genshin Impact ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(53, 10, 'Diluc', 15000, 'XSDEv4ZquyC9MG9L2bwq.jpeg', 'Gantungan kunci Genshin Impact ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(54, 10, 'Klee', 15000, '24MHE9ailTK3ehmoGgEV.jpeg', 'Gantungan kunci Genshin Impact ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Habis'),
(55, 10, 'Hu Tao Cute', 15000, 'UqBp9bgJEkaMT6PsK4k7.jpeg', 'Gantungan kunci Genshin Impact ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(56, 10, 'Hu Tao Kawai', 15000, 'GpC7M3aS6E7l7Wix1aXL.jpeg', 'Gantungan kunci Genshin Impact ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(57, 10, 'Ganyu Wedus', 15000, 'tOEDjtqmFCXOMOxLqVc3.jpeg', 'Gantungan kunci Genshin Impact ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(58, 10, 'Kamisato Ayato', 15000, 'gonkQRRaYobkQpNTOXIZ.jpeg', 'Gantungan kunci Genshin Impact ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Habis'),
(59, 10, 'Xiao', 15000, 'IQJPUuNCPujNECBZeBd2.jpeg', 'Gantungan kunci Genshin Impact ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(60, 10, 'Zhongli', 15000, 'GoYQHY1cgt02R5S5yO8A.jpeg', 'Gantungan kunci Genshin Impact ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(61, 10, 'Kaedehara Kazuha', 15000, '2EhBw5KbaDLBX1QAu8My.jpeg', 'Gantungan kunci Genshin Impact ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(62, 10, 'Yelan', 15000, 'OwMnTMn8B45LU0SFEN2i.jpeg', 'Gantungan kunci Genshin Impact ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(63, 10, 'Raiden Shogun', 15000, 'NfDWMMSJtmuiUARCHMjN.jpeg', 'Gantungan kunci Genshin Impact ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(64, 10, 'Al Haitam', 15000, 'gPDklNyEcVQxzb8CqB1y.jpeg', 'Gantungan kunci Genshin Impact ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(65, 10, 'Nahida', 15000, 'qliHl17LE3wQEzo26AV7.jpeg', 'Gantungan kunci Genshin Impact ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Habis'),
(66, 10, 'Shenhe', 15000, '8JmVGnUdO6yEbG2b1Zt0.jpeg', 'Gantungan kunci Genshin Impact ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(67, 10, 'Yae Miko', 15000, 'vbgc3TXwfyXWTfkR4OW9.jpeg', 'Gantungan kunci Genshin Impact ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(68, 10, 'Nilou', 15000, '9Q4G7gbQH03ehVpbTnSr.jpeg', 'Gantungan kunci Genshin Impact ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(69, 10, 'Yoimiya', 15000, 'YhloqbEc4S2mosJNsAcR.jpeg', 'Gantungan kunci Genshin Impact ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(70, 10, 'Scaramouche', 15000, 'qdR2cnI8oZKQEKIY8Fng.jpeg', 'Gantungan kunci Genshin Impact ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(71, 10, 'Hu Tao', 15000, 'wkf3oEUPtBhqa07huCPB.jpeg', 'Gantungan kunci Genshin Impact ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia'),
(72, 9, 'Gojo Special', 15000, 'Li8zyxnbGItVJdp7LTnZ.jpeg', 'Gantungan kunci Jujutsu Kaisen ini merupakan pilihan yang sempurna untuk para penggemar koleksi eksklusif Anda. Dibuat dengan spesifikasi tinggi, gantungan kunci ini memiliki tinggi sekitar 5.5 cm, lebar sekitar 4.6 cm, dan ketebalan sekitar 0.3 cm. Terbuat dari bahan akrilik bening tebal 3mm dengan teknologi cetak HD, gantungan kunci ini dilengkapi dengan cetakan UV anti air di kedua sisinya. Ideal sebagai hadiah spesial, koleksi pribadi, atau sebagai merchandise untuk penggemar setia.', 'Tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$63bVNmFjSz8xI2W41h9dbOdk.8VUIrRX/5vlpeTxWvY2hOJzFhZVu'),
(3, 'Hadziq', '$2a$12$/30jFPhKGhomoaqlKiHYBO4yW94TomwMsHbeZKYFuKAzBpDCfOjP6');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nama` (`nama`),
  ADD KEY `kategori_produk` (`kategori_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `kategori_produk` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
