-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Jeu 26 Octobre 2017 à 13:53
-- Version du serveur :  5.7.19-0ubuntu0.16.04.1
-- Version de PHP :  7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `simple-mvc`
--

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int AUTO_INCREMENT NOT NULL,
  `name` varchar(80) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int AUTO_INCREMENT NOT NULL,
  `name` varchar(80) NOT NULL,
  `message` varchar(255) NOT NULL,
  `category_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int AUTO_INCREMENT NOT NULL,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `item`
--
INSERT INTO `product` (`name`, `message`, `category_id`, `user_id`) VALUES
('carotte', 'je donne carotte contre bon soins', 1, 1);

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'aliment'),
(2, 'conseil'),
(3, 'jardin');

ALTER TABLE `product`
ADD CONSTRAINT fk_product_category FOREIGN KEY (category_id) REFERENCES category (id);

ALTER TABLE `product`
ADD CONSTRAINT fk_product_user FOREIGN KEY (user_id) REFERENCES user (id);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
