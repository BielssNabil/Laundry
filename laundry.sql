-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2023 at 09:02 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_detail_transaksi`
--

CREATE TABLE `tb_detail_transaksi` (
  `id` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `qty` int(20) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_detail_transaksi`
--

INSERT INTO `tb_detail_transaksi` (`id`, `id_transaksi`, `id_paket`, `qty`, `keterangan`) VALUES
(4, 1, 1, 4, 'done'),
(9, 11, 0, 20, 'done'),
(10, 14, 0, 30, 'done'),
(11, 15, 0, 20, 'done'),
(12, 16, 0, 5, 'done'),
(13, 17, 0, 10, 'done');

-- --------------------------------------------------------

--
-- Table structure for table `tb_member`
--

CREATE TABLE `tb_member` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `tlp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_member`
--

INSERT INTO `tb_member` (`id`, `nama`, `alamat`, `jenis_kelamin`, `tlp`) VALUES
(4, 'Dava', 'Citeureup, Cimahi', 'L', '0899990889293'),
(5, 'Satya', 'Cimahi', 'L', '089463232131'),
(6, 'Pramana', 'Wisma 2 Pusdikpom', 'L', '083438242423'),
(7, 'Zihan', 'Kp. Ciburial, Padalarang', 'P', '083439354343');

-- --------------------------------------------------------

--
-- Table structure for table `tb_outlet`
--

CREATE TABLE `tb_outlet` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `tlp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_outlet`
--

INSERT INTO `tb_outlet` (`id`, `nama`, `alamat`, `tlp`) VALUES
(1, 'OUTLET 1', 'JL. Anggrek Bandung', '080997799777'),
(4, 'OUTLET 3', 'Pusdikpom Kodiklatad', '0892702802480'),
(5, 'OUTLET 2', 'Padalarang, Kabupaten Bandung Barat', '028924248282'),
(6, 'OUTLET 4', 'Buah Batu', '083863826382'),
(7, 'OUTLET 5', 'Cimahi', '08998432424');

-- --------------------------------------------------------

--
-- Table structure for table `tb_paket`
--

CREATE TABLE `tb_paket` (
  `id` int(11) NOT NULL,
  `id_outlet` int(11) NOT NULL,
  `jenis` enum('kiloan','selimut','bed_cover','kaos','lain') NOT NULL,
  `nama_paket` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_paket`
--

INSERT INTO `tb_paket` (`id`, `id_outlet`, `jenis`, `nama_paket`, `harga`) VALUES
(5, 4, 'kaos', 'Paket Kaos', 7000),
(6, 5, 'bed_cover', 'Paket Nyenyak', 20000),
(7, 1, 'kiloan', 'Paket Kiloan', 5000),
(8, 5, 'kaos', 'Paket Kaos', 5000),
(9, 0, 'selimut', '', 0),
(10, 4, 'selimut', 'Paket Selimut', 10000),
(11, 7, 'selimut', 'Paket Bed Cover', 12000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id` int(11) NOT NULL,
  `id_outlet` int(11) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `kode_invoice` varchar(100) NOT NULL,
  `id_member` int(11) NOT NULL,
  `tgl` datetime NOT NULL,
  `batas_waktu` datetime NOT NULL,
  `tgl_bayar` datetime NOT NULL,
  `biaya_tambahan` int(11) NOT NULL,
  `diskon` double NOT NULL,
  `pajak` int(11) NOT NULL,
  `status` enum('baru','proses','selesai','diambil') NOT NULL,
  `dibayar` enum('dibayar','belum_dibayar') NOT NULL,
  `qty` double NOT NULL,
  `keterangan` text NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_transaksi`
--

INSERT INTO `tb_transaksi` (`id`, `id_outlet`, `id_paket`, `kode_invoice`, `id_member`, `tgl`, `batas_waktu`, `tgl_bayar`, `biaya_tambahan`, `diskon`, `pajak`, `status`, `dibayar`, `qty`, `keterangan`, `id_user`) VALUES
(14, 4, 3, 'INV18022023135340', 1, '2023-02-18 13:53:53', '2023-02-24 13:53:53', '0000-00-00 00:00:00', 5000, 0, 0, 'diambil', 'dibayar', 30, '', 1),
(16, 4, 5, 'INV17032023155822', 5, '2023-03-17 15:58:43', '2023-03-23 15:58:43', '0000-00-00 00:00:00', 50000, 0, 0, 'diambil', 'dibayar', 5, '', 1),
(17, 5, 6, 'INV18032023001105', 4, '2023-03-18 00:11:23', '2023-03-24 00:11:23', '0000-00-00 00:00:00', 10000, 0, 0, 'diambil', 'dibayar', 10, '', 1),
(18, 5, 6, 'INV18032023020646', 4, '2023-03-18 02:07:37', '2023-03-24 02:07:37', '0000-00-00 00:00:00', 50000, 0, 0, 'baru', 'belum_dibayar', 5, '', 1),
(19, 5, 0, 'INV18032023085755', 6, '2023-03-18 08:58:15', '2023-03-24 08:58:15', '0000-00-00 00:00:00', 10000, 0, 0, 'baru', 'belum_dibayar', 10, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` text NOT NULL,
  `id_outlet` int(11) NOT NULL,
  `role` enum('admin','kasir','owner') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `username`, `password`, `id_outlet`, `role`) VALUES
(1, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 5, 'admin'),
(2, 'kasir', 'kasir', 'c7911af3adbd12a035b289556d96470a', 1, 'kasir'),
(3, 'owner', 'owner', '72122ce96bfec66e2396d2e25225d70a', 4, 'owner'),
(5, 'Nabil', 'nabil', '070aa66550916626673f492bdbdb655f', 4, 'kasir');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_detail_transaksi`
--
ALTER TABLE `tb_detail_transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_member`
--
ALTER TABLE `tb_member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_outlet`
--
ALTER TABLE `tb_outlet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_paket`
--
ALTER TABLE `tb_paket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_outlet` (`id_outlet`),
  ADD KEY `id_paket` (`id_paket`),
  ADD KEY `id_member` (`id_member`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_detail_transaksi`
--
ALTER TABLE `tb_detail_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tb_member`
--
ALTER TABLE `tb_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_outlet`
--
ALTER TABLE `tb_outlet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_paket`
--
ALTER TABLE `tb_paket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD CONSTRAINT `tb_transaksi_ibfk_1` FOREIGN KEY (`id_outlet`) REFERENCES `tb_outlet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
