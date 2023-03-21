-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Mar 09, 2023 alle 11:58
-- Versione del server: 10.4.21-MariaDB
-- Versione PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `verifica-9-3`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `animale`
--

CREATE TABLE `animale` (
  `codice` int(11) NOT NULL,
  `descrizione` varchar(128) NOT NULL,
  `razza` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `animale`
--

INSERT INTO `animale` (`codice`, `descrizione`, `razza`) VALUES
(7, 'Cane', 'Labrador');

-- --------------------------------------------------------

--
-- Struttura della tabella `appartenenza`
--

CREATE TABLE `appartenenza` (
  `proprietario` int(11) NOT NULL,
  `animale` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `mostra_animali`
--

CREATE TABLE `mostra_animali` (
  `codice` int(11) NOT NULL,
  `indirizzo` varchar(64) NOT NULL,
  `num_animali` int(11) DEFAULT NULL CHECK (`num_animali` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `mostra_animali`
--

INSERT INTO `mostra_animali` (`codice`, `indirizzo`, `num_animali`) VALUES
(1, 'Via Castello 10', 12);

-- --------------------------------------------------------

--
-- Struttura della tabella `partecipazione`
--

CREATE TABLE `partecipazione` (
  `animale` int(11) NOT NULL,
  `mostra_animali` int(11) NOT NULL,
  `tempo` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `partecipazione`
--

INSERT INTO `partecipazione` (`animale`, `mostra_animali`, `tempo`) VALUES
(1, 1, '2018-02-23');

-- --------------------------------------------------------

--
-- Struttura della tabella `proprietario`
--

CREATE TABLE `proprietario` (
  `codice` int(11) NOT NULL,
  `nome` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `proprietario`
--

INSERT INTO `proprietario` (`codice`, `nome`) VALUES
(1, 'Giacomo'),
(2, 'Alessio'),
(3, 'Beppe'),
(4, 'Giacomo'),
(5, 'Alessio'),
(6, 'Beppe');

-- --------------------------------------------------------

--
-- Struttura della tabella `telefono_mostra`
--

CREATE TABLE `telefono_mostra` (
  `mostra_animali` int(11) NOT NULL,
  `telefono` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `telefono_proprietario`
--

CREATE TABLE `telefono_proprietario` (
  `proprietario` int(11) NOT NULL,
  `telefono` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `tempo`
--

CREATE TABLE `tempo` (
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `tempo`
--

INSERT INTO `tempo` (`data`) VALUES
('2018-02-23');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `animale`
--
ALTER TABLE `animale`
  ADD PRIMARY KEY (`codice`);

--
-- Indici per le tabelle `mostra_animali`
--
ALTER TABLE `mostra_animali`
  ADD PRIMARY KEY (`codice`);

--
-- Indici per le tabelle `partecipazione`
--
ALTER TABLE `partecipazione`
  ADD PRIMARY KEY (`animale`,`mostra_animali`,`tempo`);

--
-- Indici per le tabelle `proprietario`
--
ALTER TABLE `proprietario`
  ADD PRIMARY KEY (`codice`);

--
-- Indici per le tabelle `telefono_mostra`
--
ALTER TABLE `telefono_mostra`
  ADD PRIMARY KEY (`mostra_animali`,`telefono`);

--
-- Indici per le tabelle `telefono_proprietario`
--
ALTER TABLE `telefono_proprietario`
  ADD PRIMARY KEY (`proprietario`,`telefono`);

--
-- Indici per le tabelle `tempo`
--
ALTER TABLE `tempo`
  ADD PRIMARY KEY (`data`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `animale`
--
ALTER TABLE `animale`
  MODIFY `codice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `mostra_animali`
--
ALTER TABLE `mostra_animali`
  MODIFY `codice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `proprietario`
--
ALTER TABLE `proprietario`
  MODIFY `codice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
