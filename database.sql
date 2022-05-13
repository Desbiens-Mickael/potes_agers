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
  `image` varchar(45) DEFAULT NULL,
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
INSERT INTO `product` (`name`, `message`, `image`, `category_id`, `user_id`) VALUES
('Carotte', 'je donne carotte contre bon soins', 'carotte.jpeg', 1, 1),
('Tomate', 'je donne tomates contre bon soins', 'tomate.jpeg', 1, 1),
('Courgette', 'je donne courgettes contre bon soins', 'courgette.jpeg', 2, 1),
('Patate', 'je donne patates contre bon soins', 'patate.jpeg', 1, 1),
('Potimaron', 'je donne potimarons contre bon soins', 'potimaron.jpeg', 2, 1),
('Salade', 'je donne salades contre bon soins', 'salade.jpeg', 1, 1),
('Cerise', 'je donne cerises contre bon soins', 'cerise.jpeg', 2, 1),
('Poire', 'je donne poires contre bon soins', 'poire.jpeg', 2, 1),
('Fraise', 'je donne fraises contre bon soins', 'fraise.jpeg', 2, 1),
('Citron', 'je donne citrons contre bon soins', 'citron.jpeg', 2, 1),
('Figue', 'je donne figues contre bon soins', 'figue.jpeg', 2, 1),
('Prune', 'je donne prunes contre bon soins', 'prune.jpeg', 2, 1),
('Pomme', 'je donne pommes contre bon soins', 'pomme.jpeg', 2, 1);



INSERT INTO `user` (`name`, `address`, `email`) VALUES
('TOto', 'rue du test', 'toto.test@gmail.com');

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Légumes'),
(2, 'Fruits'),
(3, 'Conseils'),
(4, 'Potagers');

ALTER TABLE `product`
ADD CONSTRAINT fk_product_category FOREIGN KEY (category_id) REFERENCES category (id);

ALTER TABLE `product`
ADD CONSTRAINT fk_product_user FOREIGN KEY (user_id) REFERENCES user (id);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
