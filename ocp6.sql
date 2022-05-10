-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 10 mai 2022 à 05:43
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
  `name` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(4, 'Grab'),
(5, 'Slide'),
(6, 'Rotation'),
(7, 'Flip'),
(8, 'Rotation désaxée'),
(9, 'One foot'),
(10, 'Old school');

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `trick_id` int NOT NULL,
  `user_id` int NOT NULL,
  `content_comment` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `update_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_9474526CB281BE2E` (`trick_id`),
  KEY `IDX_9474526CA76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id`, `trick_id`, `user_id`, `content_comment`, `create_at`, `update_at`) VALUES
(11, 38, 1, 'Cette figure semble facile mais ce n\'est pas du tout le cas!!!', '2022-05-07 15:44:33', NULL),
(12, 38, 1, 'Et voilà un second commentaire', '2022-05-07 16:23:51', NULL),
(13, 38, 1, 'Ce n\'est pas le second mais le deuxième! Mais du coup celui-ci est le troisième', '2022-05-07 16:24:35', NULL),
(14, 38, 1, 'Et de quatre, il faut dépasser les 10 donc on lâche rien!', '2022-05-07 16:24:59', NULL),
(15, 38, 1, 'La moitié du chemin est faite !!', '2022-05-07 16:25:23', NULL),
(16, 38, 1, 'C\'est là que ça commence à devenir long', '2022-05-07 16:25:40', NULL),
(17, 38, 1, 'là c\'est pas mal pénible aussi', '2022-05-07 16:25:55', NULL),
(18, 38, 1, 'Mais on se rapproche du but', '2022-05-07 16:26:16', NULL),
(19, 38, 1, 'L\'avant-avant dernier (puisqu\'il en faut 11 pour valider la pagination par 10', '2022-05-07 16:26:56', NULL),
(20, 38, 1, 'Le dixième est ici !', '2022-05-07 16:27:30', NULL),
(21, 38, 1, 'Je suis tout seul sur la page suivante!', '2022-05-07 16:27:54', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_at` datetime NOT NULL,
  `profile_picture_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_picture_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `picture`
--

DROP TABLE IF EXISTS `picture`;
CREATE TABLE IF NOT EXISTS `picture` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trick_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_16DB4F89B281BE2E` (`trick_id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `picture`
--

INSERT INTO `picture` (`id`, `name`, `trick_id`) VALUES
(101, 'Tail Grab_1.jpeg', 32),
(102, 'Tail Grab_2.jpg', 32),
(103, 'Tail Grab_3.jpg', 32),
(104, 'Tail Grab_4.jpg', 32),
(105, 'Tail Grab_5.jpg', 32),
(106, 'Tail Grab_6.jpg', 32),
(107, 'Tail Grab_7.jpg', 32),
(108, 'Mute Grab_1.jpg', 33),
(109, 'Mute Grab_2.jpg', 33),
(110, 'Mute Grab_3.jpg', 33),
(111, 'Mute Grab_4.jpg', 33),
(112, 'Mute Grab_5.jpg', 33),
(113, 'Mute Grab_6.jpg', 33),
(114, 'Mute Grab_7.jpg', 33),
(120, 'Back Flip_1.jpg', 35),
(121, 'Back Flip_2.jpg', 35),
(122, 'Back Flip_3.jpg', 35),
(123, 'Back Flip_4.webp', 35),
(124, 'Back Flip_5.jpg', 35),
(130, 'One foot indy_1.jpg', 37),
(131, 'One foot indy_2.jpg', 37),
(132, 'One foot indy_3.jpg', 37),
(133, 'One foot indy_4.jpg', 37),
(134, 'One foot indy_5.jpg', 37),
(135, 'Front Flip_1.jpg', 34),
(136, 'Front Flip_2.jpg', 34),
(137, 'Front Flip_3.jpg', 34),
(138, 'Front Flip_4.jpg', 34),
(139, 'Front Flip_5.jpg', 34),
(140, 'Mute Slide_1.jpg', 38),
(141, 'Mute Slide_2.jpg', 38),
(142, 'Mute Slide_3.jpg', 38),
(143, 'Mute Slide_4.jpg', 38),
(158, 'One foot jump_1.jpg', 36),
(159, 'One foot jump_2.jpg', 36),
(160, 'One foot jump_3.jpg', 36),
(161, 'One foot jump_4.jpg', 36),
(162, 'One foot jump_5.jpg', 36);

-- --------------------------------------------------------

--
-- Structure de la table `reset_password_request`
--

DROP TABLE IF EXISTS `reset_password_request`;
CREATE TABLE IF NOT EXISTS `reset_password_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `selector` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_7CE748AA76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reset_password_request`
--

INSERT INTO `reset_password_request` (`id`, `user_id`, `selector`, `hashed_token`, `requested_at`, `expires_at`) VALUES
(1, 1, 'fj7ajWm6czy8yR9FJTFC', 'AETXbzQVHmuO4bpwTRiJGz58hrPOtimu9IkX54s+iHk=', '2022-03-19 13:30:30', '2022-03-19 14:30:30'),
(2, 1, 'xLjXGrvcmFrpLYzwREH9', 'NpJlFJ426TO9m7k/Xgl/frmuz+zU8FZrKSv7wGbcndk=', '2022-03-20 12:01:45', '2022-03-20 13:01:45'),
(3, 1, 'eghkfDSkvvE0qnoDtTjH', 'sd5g/GVYJT//FXGFQxxFvjF2tjH1geFEw01rzjjjZCA=', '2022-03-20 13:17:09', '2022-03-20 14:17:09');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_role` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D8F0A91EA76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `trick`
--

INSERT INTO `trick` (`id`, `user_id`, `name`, `description`, `create_at`, `update_at`, `slug`) VALUES
(32, 1, 'Tail Grab', 'Les origines du snowboard sont difficiles à déterminer avec certitude. On peut en retrouver les prémices dans les années 1920. Dès cette époque, il semble que, indépendamment de toute invention ou commercialisation, de nombreuses personnes se soient amusées à glisser sur la neige debout sur une planche. C\'est beaucoup plus tard qu\'auront lieu les premiers dépôts de brevets et les batailles juridiques qui permettent aujourd\'hui à Jake Burton d\'affirmer qu\'il est l\'inventeur du snowboard. Pourtant de nombreuses personnes revendiquent, à tort ou à raison, un rôle déterminant dans sa création, ou même sa paternité. Et s\'ils sont en effet nombreux à avoir joué un rôle dans l\'histoire de ce nouveau sport de glisse, il est difficile de mesurer l\'importance de l\'apport de chacun. En outre de nombreux pionniers ont développé des innovations identiques chacun de leurs côtés.\r\n\r\nL\'histoire du snowboard c\'est l\'histoire de deux pratiques ancestrales qui doivent leur improbable rencontre à la modernité. Le ski était un moyen de transport scandinave dont l’origine remonte à la nuit des temps. Le surf est à l\'origine une pratique sportive d\'Hawaii qui représente un élément important et constitutif de la vie et de l\'organisation de la communauté de l\'île. Son origine remonte au moins au xve siècle. Dans la deuxième moitié du xixe siècle, le ski est devenu un sport. Un demi-siècle plus tard il allait rencontrer le surf et entraîner l\'engrenage apparemment inéluctable de la création du snowboard. Pendant la lente maturation du snowboard, le surf va donner naissance à un autre avatar : le skateboard. Bien que créé beaucoup plus tard (1950 contre 1920), ce sport se développera plus vite, notamment grâce à sa simplicité de fabrication. Le snowboard, plus complexe et plus cher sera plus long à être mis au point et à s\'imposer. Il aura donc l\'occasion de s\'inspirer de son cadet. Mais rappelons bien que si le skateboard a pu influencer le snowboard, il est plus jeune d\'une trentaine d\'années et ne peut donc en aucun cas en être considéré comme l\'ancêtre. Leurs seuls rapports de filiation sont avec leur ancêtre commun : le surf.\r\n\r\nPour citer les personnes ayant joué un rôle dans l\'apparition, le développement et la popularisation du snowboard, on peut commencer par le nageur olympique américain d\'origine hawaïenne Duke Kahanamoku responsable de la promotion du Surf dans le monde dès les années 1910, sans lui on aurait probablement pas essayé en 1920 de glisser sur la neige debout sur des fûts de bois dans cette position étrange. On peut ensuite citer M.J. Burchett, Tom Sims, Sherman Poppen, Dimitrije Milovich, l\'équipe de Flite Snowboards, Jake Burton Carpenter, Mark Anolik, Regis Roland, Serge Dupraz, Jean Philippe Garcia (le Gourou du Freestyle), Maurice Lejeune (le fondateur de l\'ISF), Gerard Rougier (le fondateur de l\'AFS), Remi Forsans le fondateur du World Snowboard Day, Ken Achenback (Camp of Champions) et bien d\'autres.\r\n\r\nIl a fallu quelques années pour que le snowboard atteigne une véritable reconnaissance, notamment par les stations de sports d\'hiver qui l\'ont pendant un temps interdit.\r\n\r\nLe snowboard est devenu un sport olympique en 1998.', '2022-05-07 15:22:10', '2022-05-07 15:22:10', 'tail_grab'),
(33, 1, 'Mute Grab', 'Les origines du snowboard sont difficiles à déterminer avec certitude. On peut en retrouver les prémices dans les années 1920. Dès cette époque, il semble que, indépendamment de toute invention ou commercialisation, de nombreuses personnes se soient amusées à glisser sur la neige debout sur une planche. C\'est beaucoup plus tard qu\'auront lieu les premiers dépôts de brevets et les batailles juridiques qui permettent aujourd\'hui à Jake Burton d\'affirmer qu\'il est l\'inventeur du snowboard. Pourtant de nombreuses personnes revendiquent, à tort ou à raison, un rôle déterminant dans sa création, ou même sa paternité. Et s\'ils sont en effet nombreux à avoir joué un rôle dans l\'histoire de ce nouveau sport de glisse, il est difficile de mesurer l\'importance de l\'apport de chacun. En outre de nombreux pionniers ont développé des innovations identiques chacun de leurs côtés.\r\n\r\nL\'histoire du snowboard c\'est l\'histoire de deux pratiques ancestrales qui doivent leur improbable rencontre à la modernité. Le ski était un moyen de transport scandinave dont l’origine remonte à la nuit des temps. Le surf est à l\'origine une pratique sportive d\'Hawaii qui représente un élément important et constitutif de la vie et de l\'organisation de la communauté de l\'île. Son origine remonte au moins au xve siècle. Dans la deuxième moitié du xixe siècle, le ski est devenu un sport. Un demi-siècle plus tard il allait rencontrer le surf et entraîner l\'engrenage apparemment inéluctable de la création du snowboard. Pendant la lente maturation du snowboard, le surf va donner naissance à un autre avatar : le skateboard. Bien que créé beaucoup plus tard (1950 contre 1920), ce sport se développera plus vite, notamment grâce à sa simplicité de fabrication. Le snowboard, plus complexe et plus cher sera plus long à être mis au point et à s\'imposer. Il aura donc l\'occasion de s\'inspirer de son cadet. Mais rappelons bien que si le skateboard a pu influencer le snowboard, il est plus jeune d\'une trentaine d\'années et ne peut donc en aucun cas en être considéré comme l\'ancêtre. Leurs seuls rapports de filiation sont avec leur ancêtre commun : le surf.\r\n\r\nPour citer les personnes ayant joué un rôle dans l\'apparition, le développement et la popularisation du snowboard, on peut commencer par le nageur olympique américain d\'origine hawaïenne Duke Kahanamoku responsable de la promotion du Surf dans le monde dès les années 1910, sans lui on aurait probablement pas essayé en 1920 de glisser sur la neige debout sur des fûts de bois dans cette position étrange. On peut ensuite citer M.J. Burchett, Tom Sims, Sherman Poppen, Dimitrije Milovich, l\'équipe de Flite Snowboards, Jake Burton Carpenter, Mark Anolik, Regis Roland, Serge Dupraz, Jean Philippe Garcia (le Gourou du Freestyle), Maurice Lejeune (le fondateur de l\'ISF), Gerard Rougier (le fondateur de l\'AFS), Remi Forsans le fondateur du World Snowboard Day, Ken Achenback (Camp of Champions) et bien d\'autres.\r\n\r\nIl a fallu quelques années pour que le snowboard atteigne une véritable reconnaissance, notamment par les stations de sports d\'hiver qui l\'ont pendant un temps interdit.\r\n\r\nLe snowboard est devenu un sport olympique en 1998.', '2022-05-07 15:24:04', '2022-05-07 15:24:04', 'mute_grab'),
(34, 1, 'Front Flip', 'Les origines du snowboard sont difficiles à déterminer avec certitude. On peut en retrouver les prémices dans les années 1920. Dès cette époque, il semble que, indépendamment de toute invention ou commercialisation, de nombreuses personnes se soient amusées à glisser sur la neige debout sur une planche. C\'est beaucoup plus tard qu\'auront lieu les premiers dépôts de brevets et les batailles juridiques qui permettent aujourd\'hui à Jake Burton d\'affirmer qu\'il est l\'inventeur du snowboard. Pourtant de nombreuses personnes revendiquent, à tort ou à raison, un rôle déterminant dans sa création, ou même sa paternité. Et s\'ils sont en effet nombreux à avoir joué un rôle dans l\'histoire de ce nouveau sport de glisse, il est difficile de mesurer l\'importance de l\'apport de chacun. En outre de nombreux pionniers ont développé des innovations identiques chacun de leurs côtés.\r\n\r\nL\'histoire du snowboard c\'est l\'histoire de deux pratiques ancestrales qui doivent leur improbable rencontre à la modernité. Le ski était un moyen de transport scandinave dont l’origine remonte à la nuit des temps. Le surf est à l\'origine une pratique sportive d\'Hawaii qui représente un élément important et constitutif de la vie et de l\'organisation de la communauté de l\'île. Son origine remonte au moins au xve siècle. Dans la deuxième moitié du xixe siècle, le ski est devenu un sport. Un demi-siècle plus tard il allait rencontrer le surf et entraîner l\'engrenage apparemment inéluctable de la création du snowboard. Pendant la lente maturation du snowboard, le surf va donner naissance à un autre avatar : le skateboard. Bien que créé beaucoup plus tard (1950 contre 1920), ce sport se développera plus vite, notamment grâce à sa simplicité de fabrication. Le snowboard, plus complexe et plus cher sera plus long à être mis au point et à s\'imposer. Il aura donc l\'occasion de s\'inspirer de son cadet. Mais rappelons bien que si le skateboard a pu influencer le snowboard, il est plus jeune d\'une trentaine d\'années et ne peut donc en aucun cas en être considéré comme l\'ancêtre. Leurs seuls rapports de filiation sont avec leur ancêtre commun : le surf.\r\n\r\nPour citer les personnes ayant joué un rôle dans l\'apparition, le développement et la popularisation du snowboard, on peut commencer par le nageur olympique américain d\'origine hawaïenne Duke Kahanamoku responsable de la promotion du Surf dans le monde dès les années 1910, sans lui on aurait probablement pas essayé en 1920 de glisser sur la neige debout sur des fûts de bois dans cette position étrange. On peut ensuite citer M.J. Burchett, Tom Sims, Sherman Poppen, Dimitrije Milovich, l\'équipe de Flite Snowboards, Jake Burton Carpenter, Mark Anolik, Regis Roland, Serge Dupraz, Jean Philippe Garcia (le Gourou du Freestyle), Maurice Lejeune (le fondateur de l\'ISF), Gerard Rougier (le fondateur de l\'AFS), Remi Forsans le fondateur du World Snowboard Day, Ken Achenback (Camp of Champions) et bien d\'autres.\r\n\r\nIl a fallu quelques années pour que le snowboard atteigne une véritable reconnaissance, notamment par les stations de sports d\'hiver qui l\'ont pendant un temps interdit.\r\n\r\nLe snowboard est devenu un sport olympique en 1998.', '2022-05-07 15:25:34', '2022-05-07 15:25:34', 'front_flip'),
(35, 1, 'Back Flip', 'Les origines du snowboard sont difficiles à déterminer avec certitude. On peut en retrouver les prémices dans les années 1920. Dès cette époque, il semble que, indépendamment de toute invention ou commercialisation, de nombreuses personnes se soient amusées à glisser sur la neige debout sur une planche. C\'est beaucoup plus tard qu\'auront lieu les premiers dépôts de brevets et les batailles juridiques qui permettent aujourd\'hui à Jake Burton d\'affirmer qu\'il est l\'inventeur du snowboard. Pourtant de nombreuses personnes revendiquent, à tort ou à raison, un rôle déterminant dans sa création, ou même sa paternité. Et s\'ils sont en effet nombreux à avoir joué un rôle dans l\'histoire de ce nouveau sport de glisse, il est difficile de mesurer l\'importance de l\'apport de chacun. En outre de nombreux pionniers ont développé des innovations identiques chacun de leurs côtés.\r\n\r\nL\'histoire du snowboard c\'est l\'histoire de deux pratiques ancestrales qui doivent leur improbable rencontre à la modernité. Le ski était un moyen de transport scandinave dont l’origine remonte à la nuit des temps. Le surf est à l\'origine une pratique sportive d\'Hawaii qui représente un élément important et constitutif de la vie et de l\'organisation de la communauté de l\'île. Son origine remonte au moins au xve siècle. Dans la deuxième moitié du xixe siècle, le ski est devenu un sport. Un demi-siècle plus tard il allait rencontrer le surf et entraîner l\'engrenage apparemment inéluctable de la création du snowboard. Pendant la lente maturation du snowboard, le surf va donner naissance à un autre avatar : le skateboard. Bien que créé beaucoup plus tard (1950 contre 1920), ce sport se développera plus vite, notamment grâce à sa simplicité de fabrication. Le snowboard, plus complexe et plus cher sera plus long à être mis au point et à s\'imposer. Il aura donc l\'occasion de s\'inspirer de son cadet. Mais rappelons bien que si le skateboard a pu influencer le snowboard, il est plus jeune d\'une trentaine d\'années et ne peut donc en aucun cas en être considéré comme l\'ancêtre. Leurs seuls rapports de filiation sont avec leur ancêtre commun : le surf.\r\n\r\nPour citer les personnes ayant joué un rôle dans l\'apparition, le développement et la popularisation du snowboard, on peut commencer par le nageur olympique américain d\'origine hawaïenne Duke Kahanamoku responsable de la promotion du Surf dans le monde dès les années 1910, sans lui on aurait probablement pas essayé en 1920 de glisser sur la neige debout sur des fûts de bois dans cette position étrange. On peut ensuite citer M.J. Burchett, Tom Sims, Sherman Poppen, Dimitrije Milovich, l\'équipe de Flite Snowboards, Jake Burton Carpenter, Mark Anolik, Regis Roland, Serge Dupraz, Jean Philippe Garcia (le Gourou du Freestyle), Maurice Lejeune (le fondateur de l\'ISF), Gerard Rougier (le fondateur de l\'AFS), Remi Forsans le fondateur du World Snowboard Day, Ken Achenback (Camp of Champions) et bien d\'autres.\r\n\r\nIl a fallu quelques années pour que le snowboard atteigne une véritable reconnaissance, notamment par les stations de sports d\'hiver qui l\'ont pendant un temps interdit.\r\n\r\nLe snowboard est devenu un sport olympique en 1998.', '2022-05-07 15:26:53', '2022-05-07 15:26:53', 'back_flip'),
(36, 1, 'One foot jump', 'Les origines du snowboard sont difficiles à déterminer avec certitude. On peut en retrouver les prémices dans les années 1920. Dès cette époque, il semble que, indépendamment de toute invention ou commercialisation, de nombreuses personnes se soient amusées à glisser sur la neige debout sur une planche. C\'est beaucoup plus tard qu\'auront lieu les premiers dépôts de brevets et les batailles juridiques qui permettent aujourd\'hui à Jake Burton d\'affirmer qu\'il est l\'inventeur du snowboard. Pourtant de nombreuses personnes revendiquent, à tort ou à raison, un rôle déterminant dans sa création, ou même sa paternité. Et s\'ils sont en effet nombreux à avoir joué un rôle dans l\'histoire de ce nouveau sport de glisse, il est difficile de mesurer l\'importance de l\'apport de chacun. En outre de nombreux pionniers ont développé des innovations identiques chacun de leurs côtés.\r\n\r\nL\'histoire du snowboard c\'est l\'histoire de deux pratiques ancestrales qui doivent leur improbable rencontre à la modernité. Le ski était un moyen de transport scandinave dont l’origine remonte à la nuit des temps. Le surf est à l\'origine une pratique sportive d\'Hawaii qui représente un élément important et constitutif de la vie et de l\'organisation de la communauté de l\'île. Son origine remonte au moins au xve siècle. Dans la deuxième moitié du xixe siècle, le ski est devenu un sport. Un demi-siècle plus tard il allait rencontrer le surf et entraîner l\'engrenage apparemment inéluctable de la création du snowboard. Pendant la lente maturation du snowboard, le surf va donner naissance à un autre avatar : le skateboard. Bien que créé beaucoup plus tard (1950 contre 1920), ce sport se développera plus vite, notamment grâce à sa simplicité de fabrication. Le snowboard, plus complexe et plus cher sera plus long à être mis au point et à s\'imposer. Il aura donc l\'occasion de s\'inspirer de son cadet. Mais rappelons bien que si le skateboard a pu influencer le snowboard, il est plus jeune d\'une trentaine d\'années et ne peut donc en aucun cas en être considéré comme l\'ancêtre. Leurs seuls rapports de filiation sont avec leur ancêtre commun : le surf.\r\n\r\nPour citer les personnes ayant joué un rôle dans l\'apparition, le développement et la popularisation du snowboard, on peut commencer par le nageur olympique américain d\'origine hawaïenne Duke Kahanamoku responsable de la promotion du Surf dans le monde dès les années 1910, sans lui on aurait probablement pas essayé en 1920 de glisser sur la neige debout sur des fûts de bois dans cette position étrange. On peut ensuite citer M.J. Burchett, Tom Sims, Sherman Poppen, Dimitrije Milovich, l\'équipe de Flite Snowboards, Jake Burton Carpenter, Mark Anolik, Regis Roland, Serge Dupraz, Jean Philippe Garcia (le Gourou du Freestyle), Maurice Lejeune (le fondateur de l\'ISF), Gerard Rougier (le fondateur de l\'AFS), Remi Forsans le fondateur du World Snowboard Day, Ken Achenback (Camp of Champions) et bien d\'autres.\r\n\r\nIl a fallu quelques années pour que le snowboard atteigne une véritable reconnaissance, notamment par les stations de sports d\'hiver qui l\'ont pendant un temps interdit.\r\n\r\nLe snowboard est devenu un sport olympique en 1998.', '2022-05-07 15:29:48', '2022-05-07 15:29:48', 'one_foot_jump'),
(37, 1, 'One foot indy', 'Les origines du snowboard sont difficiles à déterminer avec certitude. On peut en retrouver les prémices dans les années 1920. Dès cette époque, il semble que, indépendamment de toute invention ou commercialisation, de nombreuses personnes se soient amusées à glisser sur la neige debout sur une planche. C\'est beaucoup plus tard qu\'auront lieu les premiers dépôts de brevets et les batailles juridiques qui permettent aujourd\'hui à Jake Burton d\'affirmer qu\'il est l\'inventeur du snowboard. Pourtant de nombreuses personnes revendiquent, à tort ou à raison, un rôle déterminant dans sa création, ou même sa paternité. Et s\'ils sont en effet nombreux à avoir joué un rôle dans l\'histoire de ce nouveau sport de glisse, il est difficile de mesurer l\'importance de l\'apport de chacun. En outre de nombreux pionniers ont développé des innovations identiques chacun de leurs côtés.\r\n\r\nL\'histoire du snowboard c\'est l\'histoire de deux pratiques ancestrales qui doivent leur improbable rencontre à la modernité. Le ski était un moyen de transport scandinave dont l’origine remonte à la nuit des temps. Le surf est à l\'origine une pratique sportive d\'Hawaii qui représente un élément important et constitutif de la vie et de l\'organisation de la communauté de l\'île. Son origine remonte au moins au xve siècle. Dans la deuxième moitié du xixe siècle, le ski est devenu un sport. Un demi-siècle plus tard il allait rencontrer le surf et entraîner l\'engrenage apparemment inéluctable de la création du snowboard. Pendant la lente maturation du snowboard, le surf va donner naissance à un autre avatar : le skateboard. Bien que créé beaucoup plus tard (1950 contre 1920), ce sport se développera plus vite, notamment grâce à sa simplicité de fabrication. Le snowboard, plus complexe et plus cher sera plus long à être mis au point et à s\'imposer. Il aura donc l\'occasion de s\'inspirer de son cadet. Mais rappelons bien que si le skateboard a pu influencer le snowboard, il est plus jeune d\'une trentaine d\'années et ne peut donc en aucun cas en être considéré comme l\'ancêtre. Leurs seuls rapports de filiation sont avec leur ancêtre commun : le surf.\r\n\r\nPour citer les personnes ayant joué un rôle dans l\'apparition, le développement et la popularisation du snowboard, on peut commencer par le nageur olympique américain d\'origine hawaïenne Duke Kahanamoku responsable de la promotion du Surf dans le monde dès les années 1910, sans lui on aurait probablement pas essayé en 1920 de glisser sur la neige debout sur des fûts de bois dans cette position étrange. On peut ensuite citer M.J. Burchett, Tom Sims, Sherman Poppen, Dimitrije Milovich, l\'équipe de Flite Snowboards, Jake Burton Carpenter, Mark Anolik, Regis Roland, Serge Dupraz, Jean Philippe Garcia (le Gourou du Freestyle), Maurice Lejeune (le fondateur de l\'ISF), Gerard Rougier (le fondateur de l\'AFS), Remi Forsans le fondateur du World Snowboard Day, Ken Achenback (Camp of Champions) et bien d\'autres.\r\n\r\nIl a fallu quelques années pour que le snowboard atteigne une véritable reconnaissance, notamment par les stations de sports d\'hiver qui l\'ont pendant un temps interdit.\r\n\r\nLe snowboard est devenu un sport olympique en 1998.', '2022-05-07 15:31:38', '2022-05-07 15:31:38', 'one_foot_indy'),
(38, 1, 'Board Slide', 'Les origines du snowboard sont difficiles à déterminer avec certitude. On peut en retrouver les prémices dans les années 1920. Dès cette époque, il semble que, indépendamment de toute invention ou commercialisation, de nombreuses personnes se soient amusées à glisser sur la neige debout sur une planche. C\'est beaucoup plus tard qu\'auront lieu les premiers dépôts de brevets et les batailles juridiques qui permettent aujourd\'hui à Jake Burton d\'affirmer qu\'il est l\'inventeur du snowboard. Pourtant de nombreuses personnes revendiquent, à tort ou à raison, un rôle déterminant dans sa création, ou même sa paternité. Et s\'ils sont en effet nombreux à avoir joué un rôle dans l\'histoire de ce nouveau sport de glisse, il est difficile de mesurer l\'importance de l\'apport de chacun. En outre de nombreux pionniers ont développé des innovations identiques chacun de leurs côtés.\r\n\r\nL\'histoire du snowboard c\'est l\'histoire de deux pratiques ancestrales qui doivent leur improbable rencontre à la modernité. Le ski était un moyen de transport scandinave dont l’origine remonte à la nuit des temps. Le surf est à l\'origine une pratique sportive d\'Hawaii qui représente un élément important et constitutif de la vie et de l\'organisation de la communauté de l\'île. Son origine remonte au moins au xve siècle. Dans la deuxième moitié du xixe siècle, le ski est devenu un sport. Un demi-siècle plus tard il allait rencontrer le surf et entraîner l\'engrenage apparemment inéluctable de la création du snowboard. Pendant la lente maturation du snowboard, le surf va donner naissance à un autre avatar : le skateboard. Bien que créé beaucoup plus tard (1950 contre 1920), ce sport se développera plus vite, notamment grâce à sa simplicité de fabrication. Le snowboard, plus complexe et plus cher sera plus long à être mis au point et à s\'imposer. Il aura donc l\'occasion de s\'inspirer de son cadet. Mais rappelons bien que si le skateboard a pu influencer le snowboard, il est plus jeune d\'une trentaine d\'années et ne peut donc en aucun cas en être considéré comme l\'ancêtre. Leurs seuls rapports de filiation sont avec leur ancêtre commun : le surf.\r\n\r\nPour citer les personnes ayant joué un rôle dans l\'apparition, le développement et la popularisation du snowboard, on peut commencer par le nageur olympique américain d\'origine hawaïenne Duke Kahanamoku responsable de la promotion du Surf dans le monde dès les années 1910, sans lui on aurait probablement pas essayé en 1920 de glisser sur la neige debout sur des fûts de bois dans cette position étrange. On peut ensuite citer M.J. Burchett, Tom Sims, Sherman Poppen, Dimitrije Milovich, l\'équipe de Flite Snowboards, Jake Burton Carpenter, Mark Anolik, Regis Roland, Serge Dupraz, Jean Philippe Garcia (le Gourou du Freestyle), Maurice Lejeune (le fondateur de l\'ISF), Gerard Rougier (le fondateur de l\'AFS), Remi Forsans le fondateur du World Snowboard Day, Ken Achenback (Camp of Champions) et bien d\'autres.\r\n\r\nIl a fallu quelques années pour que le snowboard atteigne une véritable reconnaissance, notamment par les stations de sports d\'hiver qui l\'ont pendant un temps interdit.\r\n\r\nLe snowboard est devenu un sport olympique en 1998.', '2022-05-07 15:34:02', '2022-05-07 15:34:02', 'board_Slide');

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
(32, 4),
(33, 4),
(34, 6),
(34, 7),
(35, 6),
(35, 7),
(36, 7),
(36, 9),
(37, 4),
(37, 9),
(38, 5);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int DEFAULT NULL,
  `name` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_at` datetime NOT NULL,
  `profile_picture_name` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_picture_path` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `trick_id` int DEFAULT NULL,
  `name` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7CC7DA2CB281BE2E` (`trick_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `video`
--

INSERT INTO `video` (`id`, `trick_id`, `name`, `path`) VALUES
(15, 32, 'Tail Grad', 'https://www.youtube.com/embed/Qq-YoXwNQY'),
(16, 33, 'Comment attraper Indy, Melon, Mute et Stalefish sur un snowboard (régulier)', 'https://www.youtube.com/embed/51sQRIK-TEI'),
(17, 34, 'How To Tamedog Front Flip', 'https://www.youtube.com/embed/eGJ8keB1-JM'),
(18, 35, 'Comment faire un BackFlip en snowboard', 'https://www.youtube.com/embed/SlhGVnFPTDE'),
(19, 36, 'Snowboard Trick Tips', 'https://www.youtube.com/embed/4IVdWdvsrVA'),
(20, 37, 'How to One-foot indy', 'https://www.youtube.com/embed/LWUfrwCofuA'),
(21, 38, 'SNOWBOARD : Comment faire un boardslide', 'https://www.youtube.com/embed/12OHPNTeoRs');

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
-- Contraintes pour la table `picture`
--
ALTER TABLE `picture`
  ADD CONSTRAINT `FK_16DB4F89B281BE2E` FOREIGN KEY (`trick_id`) REFERENCES `trick` (`id`);

--
-- Contraintes pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

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

--
-- Contraintes pour la table `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `FK_7CC7DA2CB281BE2E` FOREIGN KEY (`trick_id`) REFERENCES `trick` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
