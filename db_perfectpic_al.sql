-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 14. Mai 2023 um 16:09
-- Server-Version: 10.4.25-MariaDB
-- PHP-Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `db_perfectpic_al`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_kunde_al`
--

CREATE TABLE `tbl_kunde_al` (
  `k_kid_al` int(11) NOT NULL,
  `k_vorname` text NOT NULL,
  `k_nachname` text NOT NULL,
  `k_passwort` text NOT NULL,
  `k_e-mail` text NOT NULL,
  `k_telefonnummer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tbl_kunde_al`
--

INSERT INTO `tbl_kunde_al` (`k_kid_al`, `k_vorname`, `k_nachname`, `k_passwort`, `k_e-mail`, `k_telefonnummer`) VALUES
(1, 'Niko', 'Müller', '8fh36fG936h', 'nikomüller@gmail.com', '06605678456'),
(2, 'Max', 'Mustermann', 'uwr82hefh2832', 'maxmustermann@gmail.com', '06649057483'),
(3, 'Jonas', 'Weber', 'r38rhGHS38ßr', 'jonasweber@gmail.com', '06769204638');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_leistung`
--

CREATE TABLE `tbl_leistung` (
  `l_lid_al` int(11) NOT NULL,
  `l_titel` text NOT NULL,
  `l_kurzbeschreibung` text NOT NULL,
  `l_detailbeschreibung` text NOT NULL,
  `l_kosten_pro_stunde` double NOT NULL,
  `l_druckaufschlag` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tbl_leistung`
--

INSERT INTO `tbl_leistung` (`l_lid_al`, `l_titel`, `l_kurzbeschreibung`, `l_detailbeschreibung`, `l_kosten_pro_stunde`, `l_druckaufschlag`) VALUES
(1, 'Hochzeiten', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Euismod lacinia at quis risus sed vulputate.', 'Tortor pretium viverra suspendisse potenti nullam. Mauris in aliquam sem fringilla ut morbi tincidunt augue. Quisque sagittis purus sit amet volutpat. At varius vel pharetra vel. Ullamcorper eget nulla facilisi etiam dignissim. Feugiat sed lectus vestibulum mattis ullamcorper velit sed. Nunc faucibus a pellentesque sit. Aenean pharetra magna ac placerat. Enim diam vulputate ut pharetra sit amet aliquam id diam. ', 4.99, 3.99),
(2, 'Familienfeiern', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Euismod lacinia at quis risus sed vulputate.', 'Tortor pretium viverra suspendisse potenti nullam. Mauris in aliquam sem fringilla ut morbi tincidunt augue. Quisque sagittis purus sit amet volutpat. At varius vel pharetra vel. Ullamcorper eget nulla facilisi etiam dignissim. Feugiat sed lectus vestibulum mattis ullamcorper velit sed. Nunc faucibus a pellentesque sit. Aenean pharetra magna ac placerat. Enim diam vulputate ut pharetra sit amet aliquam id diam. ', 8.99, 5.99),
(3, 'Portraits', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Euismod lacinia at quis risus sed vulputate.', 'Tortor pretium viverra suspendisse potenti nullam. Mauris in aliquam sem fringilla ut morbi tincidunt augue. Quisque sagittis purus sit amet volutpat. At varius vel pharetra vel. Ullamcorper eget nulla facilisi etiam dignissim. Feugiat sed lectus vestibulum mattis ullamcorper velit sed. Nunc faucibus a pellentesque sit. Aenean pharetra magna ac placerat. Enim diam vulputate ut pharetra sit amet aliquam id diam. ', 10.99, 6.99);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_termin_al`
--

CREATE TABLE `tbl_termin_al` (
  `t_kid_al` int(11) NOT NULL,
  `t_lid_al` int(11) NOT NULL,
  `t_zeitpunkt` datetime NOT NULL,
  `t_ungefähre_Fotoanzahl` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tbl_termin_al`
--

INSERT INTO `tbl_termin_al` (`t_kid_al`, `t_lid_al`, `t_zeitpunkt`, `t_ungefähre_Fotoanzahl`) VALUES
(1, 2, '2023-11-03 11:15:00', 20),
(2, 1, '2023-05-23 09:30:00', 34),
(3, 3, '2023-01-27 17:39:00', 16);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `tbl_kunde_al`
--
ALTER TABLE `tbl_kunde_al`
  ADD PRIMARY KEY (`k_kid_al`),
  ADD UNIQUE KEY `E-Mail` (`k_e-mail`) USING HASH;

--
-- Indizes für die Tabelle `tbl_leistung`
--
ALTER TABLE `tbl_leistung`
  ADD PRIMARY KEY (`l_lid_al`);

--
-- Indizes für die Tabelle `tbl_termin_al`
--
ALTER TABLE `tbl_termin_al`
  ADD PRIMARY KEY (`t_kid_al`,`t_lid_al`,`t_zeitpunkt`),
  ADD KEY `t_lid_al` (`t_lid_al`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `tbl_termin_al`
--
ALTER TABLE `tbl_termin_al`
  ADD CONSTRAINT `tbl_termin_al_ibfk_1` FOREIGN KEY (`t_kid_al`) REFERENCES `tbl_kunde_al` (`k_kid_al`),
  ADD CONSTRAINT `tbl_termin_al_ibfk_2` FOREIGN KEY (`t_lid_al`) REFERENCES `tbl_leistung` (`l_lid_al`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
