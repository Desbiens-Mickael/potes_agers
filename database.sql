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
  `postal_code` int NOT NULL,
  `email` varchar(100) NOT NULL,
  `tel` varchar(20) DEFAULT NULL,
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

INSERT INTO `user` (`name`, `address`, `postal_code`, `email`, `tel`, `password`)
VALUES ('Paul', '28 rue du Général de Gaulle', 59251, 'paul@free.fr', '01-02-03-04-05', '0000' ),
       ('Toto', '10 rue du Général de Gaulle', 59251, 'toto@free.fr', '06-00-23-58-33', '0000' ),
       ('Mike', '22 rue du Général de Gaulle', 59251, 'desb@free.fr', '03-00-00-00-33', '0000' );

INSERT INTO `product` (`name`, `message`, `image`, `category_id`, `user_id`) VALUES
('Potager à partager', 'je prête potager contre bon soins', 'potager1.jpeg', 4, 1),
('Prêt de potager', 'je prête potager contre bon soins', 'potager2.jpeg', 4, 2),
('Potager disponible', 'je prête potager contre bon soins', 'potager3.jpeg', 4, 3),
('Préparer son sol', 'je conseille contre bon soins', 'sol1.jpeg', 3, 3),
('Compost', 'je conseille contre bon soins', 'compost1.jpeg', 3, 3),
('Choisir son semis', 'je conseille contre bon soins', 'semis1.jpeg', 3, 2),
('Zéro pesticide', 'je conseille contre bon soins', 'zeropesticide1.jpeg', 3, 1),
('Désherber facilement', 'je conseille contre bon soins', 'desherber1.jpeg', 3, 1),
('Carottes en trop', 'je donne carotte contre bon soins', 'carotte1.jpeg', 1, 2),
('Tomates à donner', 'je donne tomates contre bon soins', 'tomate1.jpeg', 1, 2),
('Radis délicieux', 'je donne radis contre bon soins', 'radis1.jpeg', 1, 3),
('Courgettes à récupérer', 'je donne courgettes contre bon soins', 'courgette1.jpeg', 1, 1),
('Pomme de terre', 'je donne patates contre bon soins', 'pomme-de-terre1.jpeg', 1, 1),
('Potimaron à partager', 'je donne potimarons contre bon soins', 'potimaron1.jpeg', 1, 1),
('Laitue à venir chercher', 'je donne salades contre bon soins', 'laitue1.jpeg', 1, 1),
('Cerises en trop', 'je donne cerises contre bon soins', 'cerise1.jpeg', 2, 1),
('Poires bien mures', 'je donne poires contre bon soins', 'poire1.jpeg', 2, 1),
('Fraises à partager', 'je donne fraises contre bon soins', 'fraise1.jpeg', 2, 1),
('Citrons trop bons', 'je donne citrons contre bon soins', 'citron1.jpeg', 2, 1),
('Figues à donner', 'je donne figues contre bon soins', 'figue1.jpeg', 2, 1),
('Prunes délicieuses', 'je donne prunes contre bon soins', 'prune1.jpeg', 2, 1),
('Pommes à partager', 'je donne pommes contre bon soins', 'pomme1.jpeg', 2, 1);


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
