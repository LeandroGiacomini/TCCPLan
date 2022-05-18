-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 18-Maio-2022 às 12:33
-- Versão do servidor: 5.6.51
-- versão do PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `liber`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `coment`
--

CREATE TABLE `coment` (
  `textCom` varchar(255) NOT NULL,
  `statusCom` int(11) NOT NULL,
  `insertDate` varchar(20) NOT NULL,
  `modDate` varchar(20) DEFAULT NULL,
  `fkUserCom` int(11) NOT NULL,
  `fkPostCom` int(11) NOT NULL,
  `comID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fav`
--

CREATE TABLE `fav` (
  `fkFavPos` int(11) NOT NULL,
  `fkFavUse` int(11) NOT NULL,
  `statusFav` int(11) NOT NULL,
  `favID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `gen`
--

CREATE TABLE `gen` (
  `nome` varchar(50) NOT NULL,
  `statusGen` int(11) NOT NULL,
  `genID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `genpos`
--

CREATE TABLE `genpos` (
  `fkPos` int(11) NOT NULL,
  `fkGen` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `genPos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `img`
--

CREATE TABLE `img` (
  `pathImg` varchar(255) NOT NULL,
  `statusImg` int(11) NOT NULL,
  `insertDate` varchar(20) NOT NULL,
  `modDate` varchar(20) DEFAULT NULL,
  `imgID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `img`
--

INSERT INTO `img` (`pathImg`, `statusImg`, `insertDate`, `modDate`, `imgID`) VALUES
('caminho teste', 1, '18/05/2022', '', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `liv`
--

CREATE TABLE `liv` (
  `nome` varchar(255) NOT NULL,
  `statusLiv` int(11) NOT NULL,
  `pathLiv` varchar(255) NOT NULL,
  `insertDate` varchar(20) NOT NULL,
  `modDate` varchar(20) DEFAULT NULL,
  `fkGen` int(11) NOT NULL,
  `livID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `posimg`
--

CREATE TABLE `posimg` (
  `fkPost` int(11) NOT NULL,
  `fkImg` int(11) NOT NULL,
  `posImgID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `post`
--

CREATE TABLE `post` (
  `titulo` varchar(100) NOT NULL,
  `texto` varchar(255) NOT NULL,
  `statusPost` int(11) NOT NULL,
  `insertDate` varchar(20) NOT NULL,
  `modDate` varchar(20) DEFAULT NULL,
  `fkUser` int(11) NOT NULL,
  `fkLiv` int(11) NOT NULL,
  `curtir` int(11) DEFAULT NULL,
  `postID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuar`
--

CREATE TABLE `usuar` (
  `email` varchar(50) NOT NULL,
  `senha` varchar(25) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `nomePlum` varchar(50) DEFAULT NULL,
  `statusUser` int(11) NOT NULL,
  `insertDate` varchar(20) NOT NULL,
  `modDate` varchar(20) DEFAULT NULL,
  `fkImg` int(11) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuar`
--

INSERT INTO `usuar` (`email`, `senha`, `nome`, `nomePlum`, `statusUser`, `insertDate`, `modDate`, `fkImg`, `userID`) VALUES
('gel.giacomini@gmail.com', '1234', 'Leandro', '', 1, '18/05/2022', '', 1, 3);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `coment`
--
ALTER TABLE `coment`
  ADD PRIMARY KEY (`comID`),
  ADD KEY `fkUserCom` (`fkUserCom`),
  ADD KEY `fkPostCom` (`fkPostCom`);

--
-- Índices para tabela `fav`
--
ALTER TABLE `fav`
  ADD PRIMARY KEY (`favID`),
  ADD KEY `fkFavUse` (`fkFavUse`),
  ADD KEY `fkFavPos` (`fkFavPos`);

--
-- Índices para tabela `gen`
--
ALTER TABLE `gen`
  ADD PRIMARY KEY (`genID`);

--
-- Índices para tabela `genpos`
--
ALTER TABLE `genpos`
  ADD PRIMARY KEY (`genPos`);

--
-- Índices para tabela `img`
--
ALTER TABLE `img`
  ADD PRIMARY KEY (`imgID`);

--
-- Índices para tabela `liv`
--
ALTER TABLE `liv`
  ADD PRIMARY KEY (`livID`),
  ADD KEY `fkGen` (`fkGen`);

--
-- Índices para tabela `posimg`
--
ALTER TABLE `posimg`
  ADD PRIMARY KEY (`posImgID`),
  ADD KEY `fkPost` (`fkPost`),
  ADD KEY `fkImg` (`fkImg`);

--
-- Índices para tabela `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`postID`),
  ADD KEY `fkUser` (`fkUser`),
  ADD KEY `fkLiv` (`fkLiv`);

--
-- Índices para tabela `usuar`
--
ALTER TABLE `usuar`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `fkImg` (`fkImg`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `coment`
--
ALTER TABLE `coment`
  MODIFY `comID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fav`
--
ALTER TABLE `fav`
  MODIFY `favID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `gen`
--
ALTER TABLE `gen`
  MODIFY `genID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `genpos`
--
ALTER TABLE `genpos`
  MODIFY `genPos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `img`
--
ALTER TABLE `img`
  MODIFY `imgID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `liv`
--
ALTER TABLE `liv`
  MODIFY `livID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `posimg`
--
ALTER TABLE `posimg`
  MODIFY `posImgID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `post`
--
ALTER TABLE `post`
  MODIFY `postID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuar`
--
ALTER TABLE `usuar`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
