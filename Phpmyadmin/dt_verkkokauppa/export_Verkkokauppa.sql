-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 22, 2025 at 07:39 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4
-- this is exported data/file
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `verkkokauppa`
--

-- --------------------------------------------------------

--
-- Table structure for table `Asiakkaat`
--

CREATE TABLE `Asiakkaat` (
  `id` int(11) NOT NULL,
  `nimi` varchar(255) NOT NULL,
  `sähköposti` varchar(255) NOT NULL,
  `osoite` text DEFAULT NULL,
  `rekisteröitymis_pvm` date DEFAULT NULL,
  `saldo` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Asiakkaat`
--

INSERT INTO `Asiakkaat` (`id`, `nimi`, `sähköposti`, `osoite`, `rekisteröitymis_pvm`, `saldo`) VALUES
(1, 'Matti Meikäläinen', 'matti@example.com', 'Helsinki, Suomi', '2024-01-15', 6760.87),
(2, 'Anna Virtanen', 'anna@example.com', 'Espoo, Suomi', '2023-11-23', 29689.94),
(3, 'Jari Korhonen', 'jari@example.com', 'Tampere, Suomi', '2025-04-10', 28167.12),
(4, 'Paula Laine', 'paula@example.com', 'Turku, Suomi', '2025-05-01', 1765.79),
(5, 'Sami Nieminen', 'sami@example.com', 'Jyväskylä, Suomi', '2023-09-30', 24327.57),
(6, 'Laura Hiltunen', 'laura@example.com', 'Oulu, Suomi', '2022-07-18', 16340.49),
(7, 'Tomi Salminen', 'tomi@example.com', 'Kuopio, Suomi', '2024-02-25', 8719.74),
(8, 'Riikka Mäkelä', 'riikka@example.com', 'Vaasa, Suomi', '2025-05-19', 44577.25),
(9, 'Eero Kallio', 'eero@example.com', 'Rovaniemi, Suomi', '2024-10-10', 46727.02),
(10, 'Veera Lehtinen', 'veera@example.com', 'Lappeenranta, Suomi', '2023-12-05', 49903.36),
(11, 'William Taylor', 'william@example.com', 'Manchester, UK', '2025-05-22', 7204.28),
(12, 'Sophia Garcia', 'sophia@example.com', 'Madrid, Spain', '2023-07-15', 44371.53),
(13, 'James Anderson', 'james@example.com', 'Berlin, Germany', '2024-10-30', 244.82),
(14, 'Olivia White', 'olivia@example.com', 'Paris, France', '2022-12-05', 18109.52),
(15, 'Daniel Lee', 'daniel@example.com', 'Tokyo, Japan', '2023-03-18', 39813.12);

-- --------------------------------------------------------

--
-- Table structure for table `Kategoriat`
--

CREATE TABLE `Kategoriat` (
  `id` int(11) NOT NULL,
  `nimi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Kategoriat`
--

INSERT INTO `Kategoriat` (`id`, `nimi`) VALUES
(1, 'Elektroniikka'),
(2, 'Vaatteet'),
(3, 'Kirjat'),
(4, 'Urheilu'),
(5, 'Kodin tarvikkeet');

-- --------------------------------------------------------

--
-- Table structure for table `Maksutavat`
--

CREATE TABLE `Maksutavat` (
  `id` int(11) NOT NULL,
  `tapa` varchar(255) NOT NULL,
  `kuvaus` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Maksutavat`
--

INSERT INTO `Maksutavat` (`id`, `tapa`, `kuvaus`) VALUES
(1, 'Kortti', 'Luotto- tai pankkikortti'),
(2, 'PayPal', 'Online-maksu'),
(3, 'Tilisiirto', 'Suora pankkisiirto');

-- --------------------------------------------------------

--
-- Table structure for table `Tilauksen_rivit`
--

CREATE TABLE `Tilauksen_rivit` (
  `id` int(11) NOT NULL,
  `tilaus_id` int(11) NOT NULL,
  `tuote_id` int(11) NOT NULL,
  `määrä` int(11) NOT NULL,
  `yhteishinta` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Tilauksen_rivit`
--

INSERT INTO `Tilauksen_rivit` (`id`, `tilaus_id`, `tuote_id`, `määrä`, `yhteishinta`) VALUES
(1, 1, 1, 1, 599.99),
(2, 1, 5, 2, 25.98),
(3, 2, 2, 1, 1299.99),
(4, 3, 4, 1, 89.99),
(5, 3, 8, 1, 119.99),
(6, 4, 7, 1, 79.99),
(7, 5, 3, 3, 59.97),
(8, 6, 6, 1, 39.99),
(9, 7, 1, 1, 599.99),
(10, 8, 7, 2, 159.98);

-- --------------------------------------------------------

--
-- Table structure for table `Tilaukset`
--

CREATE TABLE `Tilaukset` (
  `id` int(11) NOT NULL,
  `asiakas_id` int(11) NOT NULL,
  `tilaus_pvm` date NOT NULL,
  `toimitus_status` enum('käsittelyssä','lähetetty','toimitettu') NOT NULL,
  `maksutapa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Tilaukset`
--

INSERT INTO `Tilaukset` (`id`, `asiakas_id`, `tilaus_pvm`, `toimitus_status`, `maksutapa_id`) VALUES
(1, 1, '2023-12-15', 'toimitettu', 1),
(2, 2, '2025-05-10', 'lähetetty', 2),
(3, 3, '2025-05-20', 'käsittelyssä', 3),
(4, 4, '2024-08-25', 'toimitettu', 1),
(5, 5, '2025-04-01', 'toimitettu', 2),
(6, 6, '2023-07-30', 'lähetetty', 3),
(7, 7, '2024-09-14', 'käsittelyssä', 1),
(8, 8, '2025-05-21', 'lähetetty', 2),
(9, 9, '2023-11-18', 'toimitettu', 3),
(10, 10, '2024-06-05', 'käsittelyssä', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Tuotteet`
--

CREATE TABLE `Tuotteet` (
  `id` int(11) NOT NULL,
  `nimi` varchar(255) NOT NULL,
  `hinta` decimal(10,2) NOT NULL,
  `kategoria_id` int(11) DEFAULT NULL,
  `varastotilanne` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Tuotteet`
--

INSERT INTO `Tuotteet` (`id`, `nimi`, `hinta`, `kategoria_id`, `varastotilanne`) VALUES
(1, 'Älypuhelin', 599.99, 1, 50),
(2, 'Kannettava tietokone', 1299.99, 1, 20),
(3, 'T-paita', 19.99, 2, 150),
(4, 'Juoksukengät', 89.99, 4, 45),
(5, 'Romaani', 12.99, 3, 70),
(6, 'Keittiön veitsisetti', 39.99, 5, 30),
(7, 'Bluetooth-kuulokkeet', 79.99, 1, 75),
(8, 'Urheilutakki', 119.99, 2, 40);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Asiakkaat`
--
ALTER TABLE `Asiakkaat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sähköposti` (`sähköposti`);

--
-- Indexes for table `Kategoriat`
--
ALTER TABLE `Kategoriat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Maksutavat`
--
ALTER TABLE `Maksutavat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Tilauksen_rivit`
--
ALTER TABLE `Tilauksen_rivit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tilaus_id` (`tilaus_id`),
  ADD KEY `tuote_id` (`tuote_id`);

--
-- Indexes for table `Tilaukset`
--
ALTER TABLE `Tilaukset`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asiakas_id` (`asiakas_id`),
  ADD KEY `maksutapa_id` (`maksutapa_id`);

--
-- Indexes for table `Tuotteet`
--
ALTER TABLE `Tuotteet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nimi` (`nimi`),
  ADD KEY `kategoria_id` (`kategoria_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Asiakkaat`
--
ALTER TABLE `Asiakkaat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `Kategoriat`
--
ALTER TABLE `Kategoriat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Maksutavat`
--
ALTER TABLE `Maksutavat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Tilauksen_rivit`
--
ALTER TABLE `Tilauksen_rivit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Tilaukset`
--
ALTER TABLE `Tilaukset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Tuotteet`
--
ALTER TABLE `Tuotteet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Tilauksen_rivit`
--
ALTER TABLE `Tilauksen_rivit`
  ADD CONSTRAINT `Tilauksen_rivit_ibfk_1` FOREIGN KEY (`tilaus_id`) REFERENCES `Tilaukset` (`id`),
  ADD CONSTRAINT `Tilauksen_rivit_ibfk_2` FOREIGN KEY (`tuote_id`) REFERENCES `Tuotteet` (`id`);

--
-- Constraints for table `Tilaukset`
--
ALTER TABLE `Tilaukset`
  ADD CONSTRAINT `Tilaukset_ibfk_1` FOREIGN KEY (`asiakas_id`) REFERENCES `Asiakkaat` (`id`),
  ADD CONSTRAINT `Tilaukset_ibfk_2` FOREIGN KEY (`maksutapa_id`) REFERENCES `Maksutavat` (`id`);

--
-- Constraints for table `Tuotteet`
--
ALTER TABLE `Tuotteet`
  ADD CONSTRAINT `Tuotteet_ibfk_1` FOREIGN KEY (`kategoria_id`) REFERENCES `Kategoriat` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
