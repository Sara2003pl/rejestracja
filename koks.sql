-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 14 Maj 2022, 11:03
-- Wersja serwera: 10.4.22-MariaDB
-- Wersja PHP: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `koks`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `passwordHash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`id`, `email`, `passwordHash`) VALUES
(1, 'andrzej@tfujstary.pl', '$argon2i$v=19$m=16,t=2,p=1$ejk0cXFwdmRVQjNOUExyVg$HIYIPn/4cCFD1zHizS3fTA'),
(2, 'andrzej@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$TFVKQUJVcnJFUGtsNGhRSg$+UsdsnsqWfymb+dbU4qakoul3fz2hjUyfyofEbOXts8'),
(3, 'stefan@duzysiuur.com', '$argon2i$v=19$m=65536,t=4,p=1$RUNNWkE5dWQzY3dNUHU3Zw$MyVixsy2X9D97Jg3A0JEP0xTgJC739632c+CyZPa8K4'),
(4, 'eeee@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$emJGd215L0lBaUxveTdyag$zdvQyLN9nA1MIMfADJkEcMIlULIqbh7HxcdxFa84Abw');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
