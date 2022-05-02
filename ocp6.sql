-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 25 fév. 2022 à 15:55
-- Version du serveur : 8.0.27
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ocp6`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(4, 'Grab'),
(5, 'Slide');

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `trick_id` int NOT NULL,
  `user_id` int NOT NULL,
  `content_comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `update_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_9474526CB281BE2E` (`trick_id`),
  KEY `IDX_9474526CA76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id`, `trick_id`, `user_id`, `content_comment`, `create_at`, `update_at`) VALUES
(1, 1, 1, 'Commentaire test Grab', '2022-01-28 17:30:57', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `picture`
--

DROP TABLE IF EXISTS `picture`;
CREATE TABLE IF NOT EXISTS `picture` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `trick`
--

DROP TABLE IF EXISTS `trick`;
CREATE TABLE IF NOT EXISTS `trick` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D8F0A91EA76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `trick`
--

INSERT INTO `trick` (`id`, `user_id`, `name`, `description`, `create_at`, `update_at`) VALUES
(1, 1, 'Grab', 'Tenir la planche', '2022-01-22 13:58:40', '2022-01-22 13:58:40'),
(2, 2, 'salto', 'ça tourne', '2022-02-01 20:25:36', '2022-02-01 20:25:36'),
(3, 1, 'Grind', 'oaoikzkjdamozikjd', '2022-02-07 19:18:35', '2022-02-07 19:18:35'),
(4, 1, 'Tail Grab', 'apzikdjap', '2022-02-07 19:32:31', '2022-02-07 19:32:31'),
(5, 1, 'Frontflip', 'aozdijazp', '2022-02-07 19:49:18', '2022-02-07 19:49:18');

-- --------------------------------------------------------

--
-- Structure de la table `trick_category`
--

DROP TABLE IF EXISTS `trick_category`;
CREATE TABLE IF NOT EXISTS `trick_category` (
  `trick_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`trick_id`,`category_id`),
  KEY `IDX_639F9D7EB281BE2E` (`trick_id`),
  KEY `IDX_639F9D7E12469DE2` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `trick_category`
--

INSERT INTO `trick_category` (`trick_id`, `category_id`) VALUES
(4, 4),
(5, 4);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_at` datetime NOT NULL,
  `profile_picture_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_picture_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`),
  KEY `IDX_8D93D649D60322AC` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `role_id`, `name`, `email`, `create_at`, `profile_picture_name`, `profile_picture_path`, `roles`, `password`, `is_verified`) VALUES
(1, NULL, 'Jordan Deyme', 'jordan.deyme.perso@hotmail.fr', '2022-01-28 17:29:46', NULL, NULL, '[]', '$2y$13$z3UJciNTPAmsO7.mBfKM/umWZ2ytlYdUENNPH.DkcPqIehuRUffUO', 0),
(2, NULL, 'Usertest', 'test@test.fr', '2022-01-31 19:37:08', 'C:\\wamp2022\\tmp\\php9211.tmp', NULL, '[]', '$2y$13$zWtqM9B6etU3jyNJIXzeeufGaeag6E.8oN/Au9/NrM7W4l3bQGVwe', 0),
(3, NULL, 'Test N°13', 'test13@test.fr', '2022-02-23 18:07:22', '20201107173521-f2a34634.jpg', NULL, '[]', '$2y$13$FD1xm.7KolMawJVnmrPJQuy7V/yaL/IyyfBD69QBAd8A6xJB0FVIy', 0),
(4, NULL, 'Test14', 'test14@test.fr', '2022-02-23 18:15:25', 'i.pdf', NULL, '[]', '$2y$13$lm1ykhRhme9y6coBq/GoquMFV62.9M1PAhdYu9G5GTDE6gZPZFuQy', 0),
(5, NULL, 'Test15', 'test15@', '2022-02-23 18:18:35', 'CP_94265971.pdf', NULL, '[]', '$2y$13$alROppdTHlsK3TD9i27N8.8o3fDvHKOJTW7mpN46NzEpPA5eRSJCC', 0),
(6, NULL, 'test21', 'test21@test.fr', '2022-02-23 18:54:23', 'icone 2.pdf', NULL, '[]', '$2y$13$QnyxypITUxb0PhlTDSoQUOuzgyFtqrdsnKbNuC92nTsJQYe1FhPGa', 0),
(7, NULL, 'test22', 'test22', '2022-02-23 18:57:09', 'i.pdf', NULL, '[]', '$2y$13$3ZAqvLiXd2DIfK7JDAm1U.ynHIYJJygT9TVHdmWaQfcuZi3c5CDI2', 0);

-- --------------------------------------------------------

--
-- Structure de la table `video`
--

DROP TABLE IF EXISTS `video`;
CREATE TABLE IF NOT EXISTS `video` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_video` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_video` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_9474526CB281BE2E` FOREIGN KEY (`trick_id`) REFERENCES `trick` (`id`);

--
-- Contraintes pour la table `trick`
--
ALTER TABLE `trick`
  ADD CONSTRAINT `FK_D8F0A91EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `trick_category`
--
ALTER TABLE `trick_category`
  ADD CONSTRAINT `FK_639F9D7E12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_639F9D7EB281BE2E` FOREIGN KEY (`trick_id`) REFERENCES `trick` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_8D93D649D60322AC` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
