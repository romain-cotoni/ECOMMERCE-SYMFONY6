-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 31 mars 2022 à 19:15
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ecommerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `postal` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pays` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D4E6F81A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `address`
--

INSERT INTO `address` (`id`, `user_id`, `name`, `firstname`, `lastname`, `company`, `address`, `postal`, `city`, `pays`, `phone`) VALUES
(5, 9, 'Maison-John', 'john', 'doe', 'aaaaa', '34 rue general 2 goals', '06000', 'Nice', 'FR', '0652844506'),
(6, 9, 'Maison-john-2', 'John', 'Doe', 'john-doe-production', 'rue du centre', '06660', 'Jolie-Ville-Sur-Mer', 'FR', '0652844505'),
(7, 9, 'Maison-john-3', 'john', 'doe', NULL, '45 rue de la plage', '06300', 'Belle-ville', 'FR', '06 52 84 45 08'),
(9, 8, 'maison', 'john', 'Doe', NULL, '27 rue de l\'église', '06300', 'Nice', 'FR', '06 67 90 49 85');

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `price` double DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `name`, `price`, `image`, `slug`, `description`) VALUES
(1, 't-shirt blanc', 1000, '7818feb7759dfd0ef5df33f83b69a3ef32e7f992.webp', 't-shirt-blanc', 'Un jolie t-shirt blanc pour homme ou femme.'),
(2, 't-shirt noir', 1500, '40b27a38c8b2d943fe78d8b5dddb38380538e36c.webp', 't-shirt-noir', 'Un t-shirt noir à manche longue.'),
(3, 'pantalon blanc', 2000, '913d96d411c7e765c8d8d372a5d39a134a81b533.jpg', 'pantalon-blanc', 'Un pantalon blanc pour cet été.'),
(4, 'pantalon noir', 2500, 'f98ace03fb156fbba73e2fdc2a93e17713caa8de.jpg', 'pantalon-noir', 'Un pantalon noir de qualité.'),
(5, 'jupe blanche', 3000, '9796e3996c9e9040c134c148f45d42dfd63d4c0a.webp', 'jupe-blanche', 'Une jupe blanche pour le printemps.'),
(6, 'jupe noire', 3500, 'be90d3b1091c5ce6f8ef73120eec498d70316bdc.webp', 'jupe-noire', 'Une jupe noire sexy.'),
(7, 'chemise blanche', 4000, 'bc3406c7d3a93c4bd29f9faf0c1074fd0eafcbc7.jpg', 'chemise-blanche', 'Une chemise blanche pour le travail.'),
(8, 'chemise noire', 4500, '765cb85ebc5bf6468731c2f6226e246d562d49a3.jpg', 'chemise-noire', 'Une chemise noire pour les soirées.'),
(9, 'chemise noire femme', 2500, '1cc979f8cc750fc204af175dd080ad1a8e273b64.jpg', 'chemise-noire-femme', 'Une chemise noire pour l\'été.'),
(10, 'chemise verte femme', 3500, 'e4900e622abbd16c86f966a9ab8a54a7959db002.jpg', 'chemise-verte-femme', 'Une jolie chemise verte pour l\'été.'),
(11, 'chemise bleue', 4500, 'a0d28547a91a8e67258d71c061d5b5c4c1ef0281.webp', 'chemise-bleue', 'Une belle chemise bleue.'),
(12, 'chemise rose', 5500, 'b1881c1f5e9e4eda286178cdc7ab3d79826cefb0.jpg', 'chemise-rose', 'Une chemise rose pour le printemps.');

-- --------------------------------------------------------

--
-- Structure de la table `article_category`
--

DROP TABLE IF EXISTS `article_category`;
CREATE TABLE IF NOT EXISTS `article_category` (
  `article_id` int(5) NOT NULL,
  `category_id` int(5) NOT NULL,
  PRIMARY KEY (`article_id`,`category_id`),
  KEY `IDX_53A4EDAA7294869C` (`article_id`),
  KEY `IDX_53A4EDAA12469DE2` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `article_category`
--

INSERT INTO `article_category` (`article_id`, `category_id`) VALUES
(1, 3),
(1, 4),
(1, 6),
(2, 3),
(2, 4),
(2, 6),
(3, 3),
(3, 5),
(4, 3),
(4, 5),
(5, 4),
(5, 8),
(6, 4),
(6, 8),
(7, 3),
(7, 7),
(8, 3),
(8, 7),
(9, 2),
(9, 4),
(9, 7),
(10, 2),
(10, 4),
(10, 7),
(11, 3),
(11, 7),
(12, 2),
(12, 3),
(12, 7);

-- --------------------------------------------------------

--
-- Structure de la table `carrier`
--

DROP TABLE IF EXISTS `carrier`;
CREATE TABLE IF NOT EXISTS `carrier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `carrier`
--

INSERT INTO `carrier` (`id`, `name`, `description`, `price`) VALUES
(1, 'Colissimaux', 'Un transporteur souvent en grève qui perd vos colis.', 990),
(2, 'Vroomvroompost', 'Plus rapide mais plus cher.', 1500);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'hiver'),
(2, 'été'),
(3, 'homme'),
(4, 'femme'),
(5, 'pantalon'),
(6, 't-shirt'),
(7, 'chemise'),
(8, 'jupe');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220220152452', '2022-02-20 15:26:39', 300),
('DoctrineMigrations\\Version20220227141156', '2022-02-27 14:12:30', 308),
('DoctrineMigrations\\Version20220311174829', '2022-03-11 19:02:35', 34),
('DoctrineMigrations\\Version20220311185629', '2022-03-11 19:02:35', 77),
('DoctrineMigrations\\Version20220313114645', '2022-03-13 11:47:20', 247),
('DoctrineMigrations\\Version20220313124626', '2022-03-13 12:46:32', 66),
('DoctrineMigrations\\Version20220313130221', '2022-03-13 13:02:28', 275),
('DoctrineMigrations\\Version20220313155718', '2022-03-13 15:57:24', 120);

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `carrier_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `carrier_price` double NOT NULL,
  `delivery` longtext COLLATE utf8_unicode_ci NOT NULL,
  `is_paid` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F5299398A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`id`, `user_id`, `created_at`, `carrier_name`, `carrier_price`, `delivery`, `is_paid`) VALUES
(3, 8, '2022-03-13 17:57:43', 'Colissimaux', 990, 'Romain Cotoni<br/>0652844507<br/>27 rue Barberis<br/>Bat B<br/>27 rue Barberis Nice<br/>FR', 0),
(4, 9, '2022-03-13 20:41:25', 'Colissimaux', 990, 'john doe<br/>0652844506<br/>aaaaa<br/>34 rue general 2 goals<br/>06000 Nice<br/>FR', 0),
(5, 8, '2022-03-13 20:42:04', 'Colissimaux', 990, 'aaaa aaaa<br/>aaaaa<br/>aa<br/>aaaaaa<br/>aaaa aaaa<br/>AF', 0),
(6, 9, '2022-03-13 20:42:52', 'Colissimaux', 990, 'john doe<br/>0652844506<br/>aaaaa<br/>34 rue general 2 goals<br/>06000 Nice<br/>FR', 0),
(7, 8, '2022-03-17 19:08:29', 'Vroomvroompost', 1500, 'Romain Cotoni<br/>0652844507<br/>27 rue Barberis<br/>Bat B<br/>27 rue Barberis Nice<br/>FR', 0),
(8, 8, '2022-03-26 20:43:28', 'Colissimaux', 990, 'Romain Cotoni<br/>0652844507<br/>27 rue Barberis<br/>Bat B<br/>27 rue Barberis Nice<br/>FR', 0),
(9, 8, '2022-03-26 20:54:47', 'Vroomvroompost', 1500, 'aaaa aaaa<br/>aaaaa<br/>aa<br/>aaaaaa<br/>aaaa aaaa<br/>AF', 0),
(10, 8, '2022-03-26 21:02:50', 'Vroomvroompost', 1500, 'aaaa aaaa<br/>aaaaa<br/>aa<br/>aaaaaa<br/>aaaa aaaa<br/>AF', 0),
(11, 8, '2022-03-26 21:10:06', 'Colissimaux', 990, 'Romain Cotoni<br/>0652844507<br/>27 rue Barberis<br/>Bat B<br/>27 rue Barberis Nice<br/>FR', 0),
(12, 8, '2022-03-26 21:15:23', 'Colissimaux', 990, 'aaaa aaaa<br/>aaaaa<br/>aa<br/>aaaaaa<br/>aaaa aaaa<br/>AF', 0),
(13, 8, '2022-03-26 21:17:57', 'Colissimaux', 990, 'aaaa aaaa<br/>aaaaa<br/>aa<br/>aaaaaa<br/>aaaa aaaa<br/>AF', 0),
(14, 8, '2022-03-26 22:03:18', 'Vroomvroompost', 1500, 'aaaa aaaa<br/>aaaaa<br/>aa<br/>aaaaaa<br/>aaaa aaaa<br/>AF', 0),
(15, 8, '2022-03-26 22:05:03', 'Vroomvroompost', 1500, 'aaaa aaaa<br/>aaaaa<br/>aa<br/>aaaaaa<br/>aaaa aaaa<br/>AF', 0),
(16, 8, '2022-03-26 22:05:36', 'Vroomvroompost', 1500, 'aaaa aaaa<br/>aaaaa<br/>aa<br/>aaaaaa<br/>aaaa aaaa<br/>AF', 0),
(17, 8, '2022-03-26 22:06:16', 'Vroomvroompost', 1500, 'aaaa aaaa<br/>aaaaa<br/>aa<br/>aaaaaa<br/>aaaa aaaa<br/>AF', 0),
(18, 8, '2022-03-26 22:07:23', 'Vroomvroompost', 1500, 'aaaa aaaa<br/>aaaaa<br/>aa<br/>aaaaaa<br/>aaaa aaaa<br/>AF', 0),
(19, 8, '2022-03-26 22:08:24', 'Vroomvroompost', 1500, 'aaaa aaaa<br/>aaaaa<br/>aa<br/>aaaaaa<br/>aaaa aaaa<br/>AF', 0),
(20, 8, '2022-03-26 22:09:14', 'Vroomvroompost', 1500, 'aaaa aaaa<br/>aaaaa<br/>aa<br/>aaaaaa<br/>aaaa aaaa<br/>AF', 0),
(21, 8, '2022-03-26 22:10:04', 'Vroomvroompost', 1500, 'aaaa aaaa<br/>aaaaa<br/>aa<br/>aaaaaa<br/>aaaa aaaa<br/>AF', 0),
(22, 8, '2022-03-26 22:10:14', 'Vroomvroompost', 1500, 'aaaa aaaa<br/>aaaaa<br/>aa<br/>aaaaaa<br/>aaaa aaaa<br/>AF', 0),
(23, 8, '2022-03-27 00:14:36', 'Colissimaux', 990, 'John Doe<br/>06 06 06 06 06<br/>rue de la Gargouille<br/>06000 Nice<br/>FR', 0),
(24, 8, '2022-03-27 00:15:06', 'Colissimaux', 990, 'John Doe<br/>06 06 06 06 06<br/>rue de la Gargouille<br/>06000 Nice<br/>FR', 0),
(25, 8, '2022-03-27 00:15:26', 'Colissimaux', 990, 'John Doe<br/>06 06 06 06 06<br/>rue de la Gargouille<br/>06000 Nice<br/>FR', 0),
(26, 8, '2022-03-27 00:15:54', 'Colissimaux', 990, 'John Doe<br/>06 06 06 06 06<br/>rue de la Gargouille<br/>06000 Nice<br/>FR', 0),
(27, 8, '2022-03-27 00:16:14', 'Colissimaux', 990, 'John Doe<br/>06 06 06 06 06<br/>rue de la Gargouille<br/>06000 Nice<br/>FR', 0),
(28, 8, '2022-03-27 00:16:28', 'Colissimaux', 990, 'John Doe<br/>06 06 06 06 06<br/>rue de la Gargouille<br/>06000 Nice<br/>FR', 0),
(29, 8, '2022-03-27 00:16:52', 'Colissimaux', 990, 'John Doe<br/>06 06 06 06 06<br/>rue de la Gargouille<br/>06000 Nice<br/>FR', 0),
(30, 8, '2022-03-27 00:17:50', 'Colissimaux', 990, 'John Doe<br/>06 06 06 06 06<br/>rue de la Gargouille<br/>06000 Nice<br/>FR', 0),
(31, 8, '2022-03-27 00:19:04', 'Colissimaux', 990, 'John Doe<br/>06 06 06 06 06<br/>rue de la Gargouille<br/>06000 Nice<br/>FR', 0),
(32, 8, '2022-03-27 00:19:21', 'Vroomvroompost', 1500, 'John Doe<br/>06 06 06 06 06<br/>rue de la Gargouille<br/>06000 Nice<br/>FR', 0),
(33, 8, '2022-03-27 00:24:56', 'Colissimaux', 990, 'John Doe<br/>06 06 06 06 06<br/>rue de la Gargouille<br/>06000 Nice<br/>FR', 0),
(34, 8, '2022-03-27 00:25:02', 'Colissimaux', 990, 'John Doe<br/>06 06 06 06 06<br/>rue de la Gargouille<br/>06000 Nice<br/>FR', 0),
(35, 8, '2022-03-27 00:25:35', 'Colissimaux', 990, 'John Doe<br/>06 06 06 06 06<br/>rue de la Gargouille<br/>06000 Nice<br/>FR', 0),
(36, 8, '2022-03-27 00:25:50', 'Colissimaux', 990, 'John Doe<br/>06 06 06 06 06<br/>rue de la Gargouille<br/>06000 Nice<br/>FR', 0),
(37, 8, '2022-03-27 00:27:12', 'Colissimaux', 990, 'John Doe<br/>06 06 06 06 06<br/>rue de la Gargouille<br/>06000 Nice<br/>FR', 0),
(38, 8, '2022-03-27 00:28:18', 'Colissimaux', 990, 'John Doe<br/>06 06 06 06 06<br/>rue de la Gargouille<br/>06000 Nice<br/>FR', 0),
(39, 8, '2022-03-27 00:28:42', 'Colissimaux', 990, 'John Doe<br/>06 06 06 06 06<br/>rue de la Gargouille<br/>06000 Nice<br/>FR', 0),
(40, 8, '2022-03-27 00:29:01', 'Colissimaux', 990, 'John Doe<br/>06 06 06 06 06<br/>rue de la Gargouille<br/>06000 Nice<br/>FR', 0),
(41, 8, '2022-03-27 00:29:28', 'Colissimaux', 990, 'John Doe<br/>06 06 06 06 06<br/>rue de la Gargouille<br/>06000 Nice<br/>FR', 0),
(42, 8, '2022-03-27 00:29:33', 'Colissimaux', 990, 'John Doe<br/>06 06 06 06 06<br/>rue de la Gargouille<br/>06000 Nice<br/>FR', 0),
(43, 8, '2022-03-27 00:30:07', 'Colissimaux', 990, 'John Doe<br/>06 06 06 06 06<br/>rue de la Gargouille<br/>06000 Nice<br/>FR', 0),
(44, 8, '2022-03-27 00:30:36', 'Vroomvroompost', 1500, 'Romain Cotoni<br/>0652844507<br/>27 rue Barbéris<br/>06300 Nice<br/>FR', 0),
(45, 8, '2022-03-27 00:30:57', 'Colissimaux', 990, 'John Doe<br/>06 06 06 06 06<br/>rue de la Gargouille<br/>06000 Nice<br/>FR', 0),
(46, 8, '2022-03-27 00:46:50', 'Vroomvroompost', 1500, 'Romain Cotoni<br/>0652844507<br/>27 rue Barbéris<br/>06300 Nice<br/>FR', 0),
(47, 8, '2022-03-27 12:21:08', 'Colissimaux', 990, 'Jane Doe<br/>911 567 876<br/>Doe Society<br/>45 rue du Tournesol<br/>45000 Bonjour-Ville<br/>AU', 0),
(48, 8, '2022-03-27 13:24:35', 'Colissimaux', 990, 'john Doe<br/>06 67 90 49 85<br/>27 rue de l\'église<br/>06300 Nice<br/>FR', 0),
(49, 8, '2022-03-27 13:49:13', 'Vroomvroompost', 1500, 'john Doe<br/>06 67 90 49 85<br/>27 rue de l\'église<br/>06300 Nice<br/>FR', 0),
(50, 8, '2022-03-27 13:49:23', 'Vroomvroompost', 1500, 'john Doe<br/>06 67 90 49 85<br/>27 rue de l\'église<br/>06300 Nice<br/>FR', 0),
(51, 8, '2022-03-27 13:50:19', 'Vroomvroompost', 1500, 'john Doe<br/>06 67 90 49 85<br/>27 rue de l\'église<br/>06300 Nice<br/>FR', 0);

-- --------------------------------------------------------

--
-- Structure de la table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `my_order_id` int(11) NOT NULL,
  `article` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_845CA2C1BFCDF877` (`my_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `order_details`
--

INSERT INTO `order_details` (`id`, `my_order_id`, `article`, `quantity`, `price`, `total`) VALUES
(4, 3, 't-shirt blanc', 1, 1000, 1000),
(5, 3, 'chemise blanche', 2, 4000, 8000),
(6, 5, 't-shirt blanc', 1, 1000, 1000),
(7, 5, 'chemise blanche', 2, 4000, 8000),
(8, 7, 't-shirt blanc', 2, 1000, 2000),
(9, 7, 'pantalon blanc', 1, 2000, 2000),
(10, 8, 't-shirt blanc', 2, 1000, 2000),
(11, 8, 'pantalon blanc', 1, 2000, 2000),
(12, 9, 't-shirt blanc', 2, 1000, 2000),
(13, 9, 'pantalon blanc', 1, 2000, 2000),
(14, 9, 'chemise bleue', 2, 4500, 9000),
(15, 10, 't-shirt blanc', 2, 1000, 2000),
(16, 10, 'pantalon blanc', 1, 2000, 2000),
(17, 10, 'chemise bleue', 2, 4500, 9000),
(18, 11, 't-shirt blanc', 2, 1000, 2000),
(19, 11, 'pantalon blanc', 1, 2000, 2000),
(20, 11, 'chemise bleue', 2, 4500, 9000),
(21, 12, 't-shirt blanc', 2, 1000, 2000),
(22, 12, 'pantalon blanc', 1, 2000, 2000),
(23, 12, 'chemise bleue', 2, 4500, 9000),
(24, 13, 't-shirt blanc', 2, 1000, 2000),
(25, 13, 'pantalon blanc', 1, 2000, 2000),
(26, 13, 'chemise bleue', 2, 4500, 9000),
(27, 14, 't-shirt blanc', 2, 1000, 2000),
(28, 14, 'pantalon blanc', 1, 2000, 2000),
(29, 14, 'chemise rose', 1, 5500, 5500),
(30, 15, 't-shirt blanc', 2, 1000, 2000),
(31, 15, 'pantalon blanc', 1, 2000, 2000),
(32, 15, 'chemise rose', 1, 5500, 5500),
(33, 16, 't-shirt blanc', 2, 1000, 2000),
(34, 16, 'pantalon blanc', 1, 2000, 2000),
(35, 16, 'chemise rose', 1, 5500, 5500),
(36, 17, 't-shirt blanc', 2, 1000, 2000),
(37, 17, 'pantalon blanc', 1, 2000, 2000),
(38, 17, 'chemise rose', 1, 5500, 5500),
(39, 18, 't-shirt blanc', 2, 1000, 2000),
(40, 18, 'pantalon blanc', 1, 2000, 2000),
(41, 18, 'chemise rose', 1, 5500, 5500),
(42, 19, 't-shirt blanc', 2, 1000, 2000),
(43, 19, 'pantalon blanc', 1, 2000, 2000),
(44, 19, 'chemise rose', 1, 5500, 5500),
(45, 20, 't-shirt blanc', 2, 1000, 2000),
(46, 20, 'pantalon blanc', 1, 2000, 2000),
(47, 20, 'chemise rose', 1, 5500, 5500),
(48, 21, 't-shirt blanc', 2, 1000, 2000),
(49, 21, 'pantalon blanc', 1, 2000, 2000),
(50, 21, 'chemise rose', 1, 5500, 5500),
(51, 22, 't-shirt blanc', 2, 1000, 2000),
(52, 22, 'pantalon blanc', 1, 2000, 2000),
(53, 22, 'chemise rose', 1, 5500, 5500),
(54, 23, 't-shirt blanc', 2, 1000, 2000),
(55, 23, 't-shirt noir', 1, 1500, 1500),
(56, 24, 't-shirt blanc', 2, 1000, 2000),
(57, 24, 't-shirt noir', 1, 1500, 1500),
(58, 25, 't-shirt blanc', 2, 1000, 2000),
(59, 25, 't-shirt noir', 1, 1500, 1500),
(60, 26, 't-shirt blanc', 2, 1000, 2000),
(61, 26, 't-shirt noir', 1, 1500, 1500),
(62, 27, 't-shirt blanc', 2, 1000, 2000),
(63, 27, 't-shirt noir', 1, 1500, 1500),
(64, 28, 't-shirt blanc', 2, 1000, 2000),
(65, 28, 't-shirt noir', 1, 1500, 1500),
(66, 29, 't-shirt blanc', 2, 1000, 2000),
(67, 29, 't-shirt noir', 1, 1500, 1500),
(68, 30, 't-shirt blanc', 2, 1000, 2000),
(69, 30, 't-shirt noir', 1, 1500, 1500),
(70, 30, 'jupe noire', 1, 3500, 3500),
(71, 30, 'chemise bleue', 1, 4500, 4500),
(72, 31, 't-shirt blanc', 2, 1000, 2000),
(73, 31, 't-shirt noir', 1, 1500, 1500),
(74, 31, 'jupe noire', 1, 3500, 3500),
(75, 31, 'chemise bleue', 1, 4500, 4500),
(76, 32, 't-shirt blanc', 1, 1000, 1000),
(77, 32, 'jupe blanche', 5, 3000, 15000),
(78, 33, 't-shirt blanc', 2, 1000, 2000),
(79, 33, 't-shirt noir', 1, 1500, 1500),
(80, 33, 'jupe noire', 1, 3500, 3500),
(81, 33, 'chemise bleue', 1, 4500, 4500),
(82, 34, 't-shirt blanc', 2, 1000, 2000),
(83, 34, 't-shirt noir', 1, 1500, 1500),
(84, 34, 'jupe noire', 1, 3500, 3500),
(85, 34, 'chemise bleue', 1, 4500, 4500),
(86, 35, 't-shirt blanc', 2, 1000, 2000),
(87, 35, 't-shirt noir', 1, 1500, 1500),
(88, 35, 'jupe noire', 1, 3500, 3500),
(89, 35, 'chemise bleue', 1, 4500, 4500),
(90, 36, 't-shirt blanc', 2, 1000, 2000),
(91, 36, 't-shirt noir', 1, 1500, 1500),
(92, 36, 'jupe noire', 1, 3500, 3500),
(93, 36, 'chemise bleue', 1, 4500, 4500),
(94, 37, 't-shirt blanc', 2, 1000, 2000),
(95, 37, 't-shirt noir', 1, 1500, 1500),
(96, 37, 'jupe noire', 1, 3500, 3500),
(97, 37, 'chemise bleue', 1, 4500, 4500),
(98, 38, 't-shirt blanc', 2, 1000, 2000),
(99, 38, 't-shirt noir', 1, 1500, 1500),
(100, 38, 'jupe noire', 1, 3500, 3500),
(101, 38, 'chemise bleue', 1, 4500, 4500),
(102, 39, 't-shirt blanc', 2, 1000, 2000),
(103, 39, 't-shirt noir', 1, 1500, 1500),
(104, 39, 'jupe noire', 1, 3500, 3500),
(105, 39, 'chemise bleue', 1, 4500, 4500),
(106, 40, 't-shirt blanc', 2, 1000, 2000),
(107, 40, 't-shirt noir', 1, 1500, 1500),
(108, 40, 'jupe noire', 1, 3500, 3500),
(109, 40, 'chemise bleue', 1, 4500, 4500),
(110, 41, 't-shirt blanc', 2, 1000, 2000),
(111, 41, 't-shirt noir', 1, 1500, 1500),
(112, 41, 'jupe noire', 1, 3500, 3500),
(113, 41, 'chemise bleue', 1, 4500, 4500),
(114, 42, 't-shirt blanc', 2, 1000, 2000),
(115, 42, 't-shirt noir', 1, 1500, 1500),
(116, 42, 'jupe noire', 1, 3500, 3500),
(117, 42, 'chemise bleue', 1, 4500, 4500),
(118, 43, 't-shirt blanc', 2, 1000, 2000),
(119, 43, 't-shirt noir', 1, 1500, 1500),
(120, 43, 'jupe noire', 1, 3500, 3500),
(121, 43, 'chemise bleue', 1, 4500, 4500),
(122, 44, 't-shirt blanc', 1, 1000, 1000),
(123, 44, 'jupe blanche', 5, 3000, 15000),
(124, 45, 't-shirt blanc', 2, 1000, 2000),
(125, 45, 't-shirt noir', 1, 1500, 1500),
(126, 45, 'jupe noire', 1, 3500, 3500),
(127, 45, 'chemise bleue', 1, 4500, 4500),
(128, 46, 't-shirt blanc', 1, 1000, 1000),
(129, 46, 'jupe blanche', 5, 3000, 15000),
(130, 47, 'pantalon blanc', 1, 2000, 2000),
(131, 47, 'chemise bleue', 2, 4500, 9000),
(132, 48, 'pantalon blanc', 1, 2000, 2000),
(133, 48, 'chemise bleue', 2, 4500, 9000),
(134, 49, 't-shirt noir', 2, 1500, 3000),
(135, 50, 't-shirt noir', 2, 1500, 3000),
(136, 51, 't-shirt noir', 2, 1500, 3000);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`) VALUES
(8, 'romain.cotoni@gmail.com', '[]', '$2y$13$8jh5tqSlkB1sWNoX5UjLgOzZAkTFnH.kTQMmhBaqMQpo12SSdot1e', 'romain', 'cotoni'),
(9, 'john.doe@gmail.com', '[]', '$2y$13$ZW7qIiHeELc2.aGdqlbyp.Xqdhy4iQyhADo2cMQdTDbT3zNPIIeGW', 'john', 'doe'),
(12, 'jane.doe@mail.com', '[]', '$2y$13$pZZbXwgZZnLhpnU/EPeITeAuziZSYc8GufFphdg6rqOP7/tcwVVKO', 'jane', 'doe');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK_D4E6F81A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `article_category`
--
ALTER TABLE `article_category`
  ADD CONSTRAINT `FK_53A4EDAA12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_53A4EDAA7294869C` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `FK_845CA2C1BFCDF877` FOREIGN KEY (`my_order_id`) REFERENCES `order` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
