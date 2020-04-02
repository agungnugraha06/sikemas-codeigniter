-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 06, 2020 at 03:15 AM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sikemas`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nama_admin` varchar(100) NOT NULL,
  `jk` varchar(1) NOT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tanggal_lahir` varchar(10) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nama_admin`, `jk`, `tempat_lahir`, `tanggal_lahir`, `username`, `password`) VALUES
(1, 'Agung Nugraha', 'L', 'JAKARTA', '06-01-2001', 'admin', '21232f297a57a5a743894a0e4a801fc3'),
(2, 'Melia Wagestu', 'P', 'CIAMIS', '09-05-2001', 'melia', '7ca5f6cf2c5f7b06ff7cbe975ad99e05'),
(3, 'Anisa Rahmawati', 'P', 'CIAMIS', '06-03-2020', 'anisa', '40cc8f68f52757aff1ad39a006bfbf11');

-- --------------------------------------------------------

--
-- Table structure for table `agama`
--

CREATE TABLE `agama` (
  `id_agama` varchar(10) NOT NULL,
  `nama_agama` varchar(30) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agama`
--

INSERT INTO `agama` (`id_agama`, `nama_agama`, `status`) VALUES
('A1', 'Islam', 1),
('A2', 'Kristen', 1),
('A3', 'Katholik', 1),
('A4', 'HIndu', 1),
('A5', 'KOng Hucu', 1);

-- --------------------------------------------------------

--
-- Table structure for table `penduduk`
--

CREATE TABLE `penduduk` (
  `nik` varchar(100) NOT NULL,
  `nama` varchar(150) DEFAULT NULL,
  `tempat_lahir` varchar(50) DEFAULT NULL,
  `tanggal_lahir` varchar(10) DEFAULT NULL,
  `jk` enum('L','P') DEFAULT NULL,
  `id_agama` varchar(30) DEFAULT NULL,
  `username` varchar(20) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penduduk`
--

INSERT INTO `penduduk` (`nik`, `nama`, `tempat_lahir`, `tanggal_lahir`, `jk`, `id_agama`, `username`, `password`) VALUES
('123139191', 'Rendy Ramdhani', 'Ciamis', '07-04-2001', 'L', 'A1', 'rendy', '88ad32a14f7f7964d03dad411ffcc59b'),
('1234567', 'Angga Wahyuda', 'Ciamis', '22-03-2001', 'L', 'A1', 'angga', 'c6b5cef6327916d6260a80de98184581'),
('14215241521', 'Rizki Fajar', 'Zimbabwe', '22-02-2000', 'P', 'A1', 'rizki', '3e089c076bf1ec3a8332280ee35c28d4');

-- --------------------------------------------------------

--
-- Table structure for table `pengaduan`
--

CREATE TABLE `pengaduan` (
  `id_pengaduan` int(30) NOT NULL,
  `nik` varchar(30) DEFAULT NULL,
  `pengaduan` text,
  `tanggal` varchar(10) NOT NULL,
  `file` text NOT NULL,
  `status` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengaduan`
--

INSERT INTO `pengaduan` (`id_pengaduan`, `nik`, `pengaduan`, `tanggal`, `file`, `status`, `id_admin`) VALUES
(11, '1234567', 'Tolong untuk ditindak lanjuti, dengan seksama bahwa di jalan desa karang sari jalanan sudah tidak selaknya dipakai. mohon kerja samanya \r\nTerima Kasih:)', '11-02-2020', 'lt5a954d70cd9dd.jpg', 0, 1),
(12, '123139191', 'aaa', '13-02-2020', '1.png', 0, 3),
(13, '14215241521', 'xxxx', '13-02-2020', '2.png', 1, 3),
(14, '14215241521', 'ada pencurian di sekitar daerah padaherang', '19-02-2020', 'votak.jpg', 1, 1),
(15, '1234567', 'adasdasdasd', '02-03-2020', '0d45b6eeea4efcf470f682b5b898ad2a.jpg', 1, 1),
(16, '1234567', 'anjayy lo bang', '04-03-2020', '0ea8dd0f7bfb7b8249a034956f6ed88b.jpg', 0, 1),
(17, '14215241521', 'aasssssswwwwww', '05-03-2020', 'aba901c31aa1a3415d84dc4dc0bc2059.jpg', 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `agama`
--
ALTER TABLE `agama`
  ADD PRIMARY KEY (`id_agama`);

--
-- Indexes for table `penduduk`
--
ALTER TABLE `penduduk`
  ADD PRIMARY KEY (`nik`),
  ADD KEY `penduduk` (`id_agama`);

--
-- Indexes for table `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`id_pengaduan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `pengaduan`
--
ALTER TABLE `pengaduan`
  MODIFY `id_pengaduan` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
