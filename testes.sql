-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 03-Ago-2022 às 08:44
-- Versão do servidor: 5.7.36
-- versão do PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `testes`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `coment`
--

DROP TABLE IF EXISTS `coment`;
CREATE TABLE IF NOT EXISTS `coment` (
  `textCom` varchar(255) NOT NULL,
  `statusCom` int(11) NOT NULL,
  `insertDate` varchar(20) NOT NULL,
  `modDate` varchar(20) DEFAULT NULL,
  `fkUserCom` int(11) NOT NULL,
  `fkPostCom` int(11) NOT NULL,
  `comID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`comID`),
  KEY `fkUserCom` (`fkUserCom`),
  KEY `fkPostCom` (`fkPostCom`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fav`
--

DROP TABLE IF EXISTS `fav`;
CREATE TABLE IF NOT EXISTS `fav` (
  `fkFavPos` int(11) NOT NULL,
  `fkFavUse` int(11) NOT NULL,
  `statusFav` int(11) NOT NULL,
  `favID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`favID`),
  KEY `fkFavUse` (`fkFavUse`),
  KEY `fkFavPos` (`fkFavPos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `gen`
--

DROP TABLE IF EXISTS `gen`;
CREATE TABLE IF NOT EXISTS `gen` (
  `nome` varchar(50) NOT NULL,
  `statusGen` int(11) NOT NULL,
  `genID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`genID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `genpos`
--

DROP TABLE IF EXISTS `genpos`;
CREATE TABLE IF NOT EXISTS `genpos` (
  `fkPos` int(11) NOT NULL,
  `fkGen` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `genPos` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`genPos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `img`
--

DROP TABLE IF EXISTS `img`;
CREATE TABLE IF NOT EXISTS `img` (
  `pathImg` varchar(255) NOT NULL,
  `statusImg` int(11) NOT NULL,
  `insertDate` varchar(20) NOT NULL,
  `modDate` varchar(20) DEFAULT NULL,
  `imgID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`imgID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `img`
--

INSERT INTO `img` (`pathImg`, `statusImg`, `insertDate`, `modDate`, `imgID`) VALUES
('caminho teste', 1, '18/05/2022', '', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `liv`
--

DROP TABLE IF EXISTS `liv`;
CREATE TABLE IF NOT EXISTS `liv` (
  `nome` varchar(255) NOT NULL,
  `statusLiv` int(11) NOT NULL,
  `pathLiv` varchar(255) NOT NULL,
  `insertDate` varchar(20) NOT NULL,
  `modDate` varchar(20) DEFAULT NULL,
  `fkGen` int(11) NOT NULL,
  `livID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`livID`),
  KEY `fkGen` (`fkGen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `posimg`
--

DROP TABLE IF EXISTS `posimg`;
CREATE TABLE IF NOT EXISTS `posimg` (
  `fkPost` int(11) NOT NULL,
  `fkImg` int(11) NOT NULL,
  `posImgID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`posImgID`),
  KEY `fkPost` (`fkPost`),
  KEY `fkImg` (`fkImg`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `titulo` varchar(100) NOT NULL,
  `texto` varchar(255) NOT NULL,
  `statusPost` int(11) NOT NULL,
  `insertDate` varchar(20) NOT NULL,
  `modDate` varchar(20) DEFAULT NULL,
  `fkUser` int(11) NOT NULL,
  `fkLiv` int(11) NOT NULL,
  `curtir` int(11) DEFAULT NULL,
  `postID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`postID`),
  KEY `fkUser` (`fkUser`),
  KEY `fkLiv` (`fkLiv`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuar`
--

DROP TABLE IF EXISTS `usuar`;
CREATE TABLE IF NOT EXISTS `usuar` (
  `email` varchar(50) NOT NULL,
  `senha` varchar(25) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `nomePlum` varchar(50) DEFAULT NULL,
  `statusUser` int(11) NOT NULL,
  `insertDate` varchar(20) NOT NULL,
  `modDate` varchar(20) DEFAULT NULL,
  `fkImg` int(11) NOT NULL,
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`userID`),
  KEY `fkImg` (`fkImg`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuar`
--

INSERT INTO `usuar` (`email`, `senha`, `nome`, `nomePlum`, `statusUser`, `insertDate`, `modDate`, `fkImg`, `userID`) VALUES
('gel.giacomini@gmail.com', '1234', 'Leandro', '', 1, '18/05/2022', '', 1, 3),
('email1@gmail.com', '123', 'Rho Aias', 'ingwaz', 2, '27/07/2022', '27/07/2022', 1, 4),
('email2@gmail.com', '123', 'Sai Ettwaz', 'Yois', 2, '27/07/2022', '', 1, 5),
('email3@gmail.com', '123', 'Samuel', '', 1, '27/07/2022', '', 1, 6),
('email4@gmail.com', '123', 'Murilo', '', 3, '27/07/2022', '', 1, 7),
('email5@gmail.com', '123', 'Kerollyn', '', 3, '27/07/2022', '', 1, 8),
('email6@gmail.com', '123', 'Leonardo', '', 3, '27/07/2022', '', 1, 9),
('email7@gmail.com', '123', 'Kailany', '', 3, '27/07/2022', '', 1, 10),
('email9@gmail.com', '123', 'Etos', '', 1, '27/07/2022', '', 1, 12),
('teste@gmail.com', '123', 'Mer', '', 1, '30/07/2022', '', 1, 13);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `coment`
--
ALTER TABLE `coment`
  ADD CONSTRAINT `coment_ibfk_1` FOREIGN KEY (`fkUserCom`) REFERENCES `usuar` (`userID`),
  ADD CONSTRAINT `coment_ibfk_2` FOREIGN KEY (`fkPostCom`) REFERENCES `post` (`postID`);

--
-- Limitadores para a tabela `fav`
--
ALTER TABLE `fav`
  ADD CONSTRAINT `fav_ibfk_1` FOREIGN KEY (`fkFavUse`) REFERENCES `usuar` (`userID`),
  ADD CONSTRAINT `fav_ibfk_2` FOREIGN KEY (`fkFavPos`) REFERENCES `post` (`postID`);

--
-- Limitadores para a tabela `liv`
--
ALTER TABLE `liv`
  ADD CONSTRAINT `liv_ibfk_1` FOREIGN KEY (`fkGen`) REFERENCES `gen` (`genID`);

--
-- Limitadores para a tabela `posimg`
--
ALTER TABLE `posimg`
  ADD CONSTRAINT `posimg_ibfk_1` FOREIGN KEY (`fkPost`) REFERENCES `post` (`postID`),
  ADD CONSTRAINT `posimg_ibfk_2` FOREIGN KEY (`fkImg`) REFERENCES `img` (`imgID`);

--
-- Limitadores para a tabela `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`fkUser`) REFERENCES `usuar` (`userID`),
  ADD CONSTRAINT `post_ibfk_2` FOREIGN KEY (`fkLiv`) REFERENCES `liv` (`livID`);

--
-- Limitadores para a tabela `usuar`
--
ALTER TABLE `usuar`
  ADD CONSTRAINT `usuar_ibfk_1` FOREIGN KEY (`fkImg`) REFERENCES `img` (`imgID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
