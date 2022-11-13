-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Nov 13. 23:40
-- Kiszolgáló verziója: 10.4.25-MariaDB
-- PHP verzió: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `restaurant`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `drinks`
--

CREATE TABLE `drinks` (
  `drinkID` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `price` smallint(6) NOT NULL,
  `imagePath` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `drinks`
--

INSERT INTO `drinks` (`drinkID`, `name`, `price`, `imagePath`) VALUES
(3, 'Kóla', 300, 'http://localhost:7777/images/cola.jpg'),
(4, 'Ásványvíz', 200, 'http://localhost:7777/images/water.jpg'),
(5, 'Kávé', 200, 'http://localhost:7777/images/coffee.jpg'),
(6, 'Tea', 200, 'http://localhost:7777/images/tea.jpg'),
(7, 'Világos sör', 250, 'http://localhost:7777/images/beer.jpg'),
(8, 'Narancslé', 250, 'http://localhost:7777/images/orangejuice.jpg'),
(9, 'Bor', 400, 'http://localhost:7777/images/wine.jpg');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `meals`
--

CREATE TABLE `meals` (
  `mealID` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `price` smallint(6) NOT NULL,
  `allergens` varchar(255) COLLATE utf8_hungarian_ci DEFAULT '',
  `mealType` enum('Leves','Főétel','Desszert') COLLATE utf8_hungarian_ci DEFAULT NULL,
  `imagePath` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `availability` varchar(12) COLLATE utf8_hungarian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `meals`
--

INSERT INTO `meals` (`mealID`, `name`, `price`, `allergens`, `mealType`, `imagePath`, `availability`) VALUES
(1, 'Gulyás leves', 500, 'alma körte répa', 'Leves', 'http://localhost:7777/images/gulyas.jpg', '10:00-16:00'),
(4, 'Húsleves', 1000, '', 'Leves', 'http://localhost:7777/images/husleves.jpg', '9:00-14:00'),
(5, 'Céklaleves', 850, '', 'Leves', 'http://localhost:7777/images/ceklaleves.jpg', '10:00-24:00'),
(6, 'Gombaleves', 950, 'tejszín', 'Leves', 'http://localhost:7777/images/gombaleves.jpg', '8:30-23:00'),
(7, 'Zöldségleves', 870, '', 'Leves', 'http://localhost:7777/images/zoldsegleves.jpg', '10:00-16:00'),
(8, 'Tejszínes garnélaleves', 1000, 'tejszín, garnéla', 'Leves', 'http://localhost:7777/images/tejszinesgarnela.jpg', '10:00-15:30'),
(9, 'Bolognai spagetti', 1350, 'paradicsom, tojás', 'Főétel', 'http://localhost:7777/images/bolognai.jpg', '10:00-17:00'),
(10, 'Sonkás pizza', 1400, 'paradicsom', 'Főétel', 'http://localhost:7777/images/sonkaspizza.jpg', '8:30-24:00'),
(11, 'Steak sült burgonyával', 2000, '', 'Főétel', 'http://localhost:7777/images/steakkrumplival.jpg', '12:00-14:00'),
(12, 'Tükörtojás', 1240, 'tojás', 'Főétel', 'http://localhost:7777/images/tukortojas.jpg', '7:30-12:00'),
(13, 'Marhapörkölt', 1400, '', 'Főétel', 'http://localhost:7777/images/marhaporkolt.jpg', '11:00-15:00'),
(14, 'Hamburger', 1350, '', 'Főétel', 'http://localhost:7777/images/hamburger.jpg', '8:30-24:00'),
(15, 'Fagyikehely', 250, 'tej', 'Desszert', 'http://localhost:7777/images/fagyi.jpg', '7:30-24:00'),
(16, 'Amerikai palacsinta', 400, '', 'Desszert', 'http://localhost:7777/images/amerikaipalacsinta.jpg', '7:30-24:00'),
(17, 'Csokis keksz', 150, 'tej', 'Desszert', 'http://localhost:7777/images/csokiskeksz.jpg', '7:30-24:00'),
(18, 'Csokiszelet', 200, 'tej', 'Desszert', 'http://localhost:7777/images/csokiszelet.jpg', '7:30-24:00'),
(19, 'Epres sajttorta', 250, 'tej', 'Desszert', 'http://localhost:7777/images/epressajttorta.jpg', '7:30-24:00');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `drinks`
--
ALTER TABLE `drinks`
  ADD PRIMARY KEY (`drinkID`);

--
-- A tábla indexei `meals`
--
ALTER TABLE `meals`
  ADD PRIMARY KEY (`mealID`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `drinks`
--
ALTER TABLE `drinks`
  MODIFY `drinkID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT a táblához `meals`
--
ALTER TABLE `meals`
  MODIFY `mealID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
