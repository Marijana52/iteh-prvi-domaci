-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2022 at 08:43 PM
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
-- Database: `gymspot`
--

-- --------------------------------------------------------

--
-- Table structure for table `gym`
--

CREATE TABLE `gym` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `city` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gym`
--

INSERT INTO `gym` (`id`, `userid`, `name`, `city`, `type`, `address`) VALUES
(1, 2, 'Muscle Gym', 'Belgrade', 'Personal Trainer Gym', 'Vidikovacki venac 27'),
(2, 1, 'Athletics Gym', 'Belgrade', 'Training Gym', 'Vidikovacki venac 102'),
(3, 4, 'Factory Gym', 'Beglrade', 'Crossfit', 'Kneza Viseslava 12'),
(4, 1, 'Green Fitness', 'Novi Sad', 'Aerobic Gym', 'Gocka 18'),
(5, 1, 'Spyder Gym', 'Kraljevo', '24 Hours Access Gym', 'Milutina Milankovica 65');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nationality` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `username`, `password`, `nationality`) VALUES
(1, 'mz20190344@student.fon.bg.ac.rs', 'marijana', 'marijana', 'Serbia'),
(2, 'markomarkovic@mail.com', 'marko', 'marko123', 'Serbia'),
(4, 'user1@gmail.com', 'useruser', 'useruser', 'United States');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gym`
--
ALTER TABLE `gym`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gym`
--
ALTER TABLE `gym`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `gym`
--
ALTER TABLE `gym`
  ADD CONSTRAINT `gym_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
