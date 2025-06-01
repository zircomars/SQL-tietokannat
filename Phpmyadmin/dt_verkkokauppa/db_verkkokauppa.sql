-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 26, 2025 at 04:10 PM
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
(1, 'Matti Meikäläinen', 'matti@example.com', 'Suomi', '1965-06-05', 6760.87),
(2, 'Anna Virtanen', 'anna@example.com', 'Suomi', '1964-07-31', 29689.94),
(3, 'Jari Korhonen', 'jari@example.com', 'Suomi', '1975-08-18', 28167.12),
(4, 'Paula Laine', 'paula@example.com', 'Suomi', '1973-05-26', 1765.79),
(5, 'Sami Nieminen', 'sami@example.com', 'Suomi', '1989-02-08', 24327.57),
(6, 'Laura Hiltunen', 'laura@example.com', 'Suomi', '1954-05-05', 16340.49),
(7, 'Tomi Salminen', 'tomi@example.com', 'Suomi', '1973-05-21', 8719.74),
(8, 'Riikka Mäkelä', 'riikka@example.com', 'Suomi', '1992-11-25', 44577.25),
(9, 'Eero Kallio', 'eero@example.com', 'Suomi', '1973-05-07', 46727.02),
(10, 'Veera Lehtinen', 'veera@example.com', 'Suomi', '1997-01-12', 49903.36),
(11, 'William Taylor', 'william@example.com', 'UK', '1994-02-13', 7204.28),
(12, 'Sophia Garcia', 'sophia@example.com', 'Spain', '1968-07-03', 44371.53),
(13, 'James Anderson', 'james@example.com', 'Germany', '1969-02-27', 244.82),
(14, 'Olivia White', 'olivia@example.com', 'France', '1989-04-13', 18109.52),
(15, 'Daniel Lee', 'daniel@example.com', 'Japan', '1967-12-08', 39813.12),
(16, 'Nathan Reed', 'nathan@example.com', 'USA', '2008-11-25', 31193.00),
(17, 'Isabella Evans', 'isabella@example.com', 'New Zealand', '2022-03-28', 42631.48),
(18, 'Ethan Hall', 'ethan@example.com', 'Canada', '2004-06-21', 29261.16),
(19, 'Lily Adams', 'lily@example.com', 'Germany', '2014-07-25', 22278.64),
(20, 'Jackson Murphy', 'jackson@example.com', 'Australia', '2002-06-07', 9943.83),
(21, 'Olivia Mäkinen', 'olivia2@example.com', 'Suomi', '1999-04-15', 3456.67),
(22, 'Leon Shawn', 'leon@example.com', 'UK', '1998-05-13', 44132.84),
(23, 'Gilbert Tate', 'gilbert@example.com', 'Australia', '1996-03-04', 23634.87),
(105, 'Haruto Takahashi', 'haruto@example.com', 'Japan', '1992-07-15', 31267.45),
(106, 'Yuki Nakamura', 'yuki@example.com', 'Japan', '1985-03-22', 27560.88),
(107, 'Satoshi Yamamoto', 'satoshi@example.com', 'Japan', '1978-09-08', 18277.51),
(108, 'Jessica Carter', 'jessica@example.com', 'USA', '1990-06-14', 42387.92),
(109, 'Brandon Mitchell', 'brandon@example.com', 'USA', '1988-11-02', 19872.65),
(110, 'Rachel Cooper', 'rachel@example.com', 'USA', '1995-04-30', 36258.41),
(111, 'Oliver Bennett', 'oliver@example.com', 'New Zealand', '1993-02-19', 28735.67),
(112, 'Charlotte King', 'charlotte@example.com', 'New Zealand', '1986-08-25', 18623.40),
(113, 'Liam Scott', 'liam@example.com', 'New Zealand', '2001-12-03', 42205.19),
(114, 'Maximilian Hoffmann', 'maximilian@example.com', 'Germany', '1982-09-16', 14872.56),
(115, 'Hannah Schulz', 'hannah@example.com', 'Germany', '1996-07-07', 39981.32),
(116, 'Elias Wagner', 'elias@example.com', 'Germany', '1974-05-11', 25462.47),
(117, 'Noah Thompson', 'noah@example.com', 'Australia', '1995-09-21', 31720.89),
(118, 'Ava Robinson', 'ava@example.com', 'Australia', '1989-06-10', 18349.29),
(119, 'Daniel Harris', 'daniel2@example.com', 'UK', '1992-02-15', 22731.56),
(120, 'Grace Edwards', 'grace@example.com', 'UK', '2000-07-05', 31982.74),
(121, 'Alejandro Lopez', 'alejandro@example.com', 'Spain', '1984-11-30', 29381.44),
(122, 'Carla Torres', 'carla@example.com', 'Spain', '1997-04-18', 35829.17),
(123, 'Lucas Dupont', 'lucas@example.com', 'Belgium', '1986-03-22', 19282.50),
(124, 'Elise Verhoeven', 'elise@example.com', 'Belgium', '1991-08-14', 38916.38),
(125, 'Nathan Dewaele', 'nathan2@example.com', 'Belgium', '2005-12-09', 26382.71),
(126, 'Matti', '%example.com', 'UK', NULL, 18000.00),
(128, 'Nicole Colombi', 'nicole@example.com', 'Italy', NULL, 9999.12);

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
  `asiakas_id` int(11) DEFAULT NULL,
  `tilaus_pvm` date NOT NULL,
  `toimitus_status` varchar(50) DEFAULT NULL,
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
(10, 10, '2024-06-05', 'käsittelyssä', 1),
(101, 11, '2001-05-14', 'Toimitettu', 1),
(102, 12, '2003-09-21', 'Kadonnut', 2),
(103, 15, '2007-06-11', 'Toimitettu', 3),
(104, 16, '2010-08-05', 'Kadonnut', 1),
(105, 18, '2012-12-24', 'Toimitettu', 2),
(106, 20, '2015-03-17', 'Kadonnut', 3),
(107, 21, '2018-07-29', 'Toimitettu', 1),
(108, 22, '2019-04-22', 'Kadonnut', 2),
(109, 105, '2021-01-10', 'Kadonnut', 3),
(110, 106, '2022-06-03', 'Toimitettu', 1),
(111, 107, '2023-09-15', 'Kadonnut', 2),
(112, 108, '2024-02-28', 'Toimitettu', 3),
(113, 109, '2024-11-05', 'Kadonnut', 1),
(114, 110, '2025-03-19', 'Toimitettu', 2),
(115, 111, '2025-05-26', 'Kadonnut', 3),
(116, 1, '2025-05-30', 'toimitettu', 1),
(117, 1, '2025-06-02', 'lähetetty', 2),
(118, 1, '2025-06-10', 'käsittelyssä', 3),
(119, 2, '2025-05-15', 'toimitettu', 1),
(120, 2, '2025-06-05', 'lähetetty', 2),
(121, 3, '2025-05-25', 'käsittelyssä', 3),
(122, 3, '2025-06-01', 'toimitettu', 1),
(123, 3, '2025-06-08', 'lähetetty', 2),
(124, 105, '1998-07-23', 'toimitettu', 1),
(125, 105, '2002-11-14', 'lähetetty', 2),
(126, 106, '2015-03-07', 'käsittelyssä', 3),
(127, 106, '2008-05-19', 'toimitettu', 1),
(128, 107, '2011-09-28', 'lähetetty', 2),
(129, 107, '2020-04-12', 'toimitettu', 3),
(130, 108, '1996-06-30', 'käsittelyssä', 1),
(131, 108, '2017-01-05', 'lähetetty', 2),
(132, 109, '2003-12-17', 'toimitettu', 3),
(133, 109, '2018-08-21', 'käsittelyssä', 1),
(134, 110, '2006-02-09', 'lähetetty', 2),
(135, 110, '2023-10-29', 'toimitettu', 3),
(136, 111, '1999-04-25', 'lähetetty', 1),
(137, 111, '2014-07-13', 'käsittelyssä', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Tuotteet`
--

CREATE TABLE `Tuotteet` (
  `id` int(11) NOT NULL,
  `nimi` varchar(255) NOT NULL,
  `hinta` decimal(10,2) DEFAULT 0.00,
  `kategoria_id` int(11) DEFAULT NULL,
  `varastotilanne` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Tuotteet`
--

INSERT INTO `Tuotteet` (`id`, `nimi`, `hinta`, `kategoria_id`, `varastotilanne`) VALUES
(1, 'Älypuhelin', 659.99, 1, 50),
(2, 'Kannettava tietokone', 1429.99, 1, 20),
(3, 'T-paita', 19.99, 2, 150),
(4, 'Juoksukengät', 50.99, 4, 80),
(5, 'novelli', 12.99, 3, 80),
(6, 'Keittiön veitsisetti', 39.99, 5, 30),
(7, 'Bluetooth-kuulokkeet', 87.99, 1, 75),
(8, 'Urheilutakki', 119.99, 2, 40),
(9, 'Pelihiiri', 54.99, 1, 60),
(10, 'Tabletti', 439.99, 1, 35),
(11, 'Farkut', NULL, 2, 0),
(12, 'Juomapullo', 14.99, 4, 120),
(13, 'Novellikokoelma', 17.99, 3, 45),
(14, 'Grillipannu', 89.99, 5, 25),
(15, 'Langaton kaiutin', 142.99, 1, 50),
(16, 'Sadetakki', 79.99, 2, 55),
(17, 'Salikengät', 99.99, 4, 40),
(18, 'Kasviskokkikirja', 22.99, 3, 30),
(19, 'Älykello', NULL, 1, 45),
(20, 'Työtuoli', 249.99, NULL, 30),
(21, 'Sähköpyörä', NULL, 4, NULL),
(22, 'Käsipainosetti', 79.99, 4, 20),
(23, 'Led-lamppu', 9.99, NULL, 50),
(24, 'Kirjahylly', 189.99, 5, 12),
(25, 'Ulkoilu-reppu', NULL, 2, 25),
(26, 'Lautapeli', 39.99, NULL, NULL),
(27, 'Mikroaaltouuni', 10.99, NULL, 10),
(28, 'Lämpöpaita', 29.99, NULL, 3),
(29, 'Retro kahvikuppi', NULL, 3, 40),
(30, 'Langaton näppäimistö', 59.99, NULL, 25);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `Tuotteet`
--
ALTER TABLE `Tuotteet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

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
