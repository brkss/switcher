-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : sam. 29 jan. 2022 à 17:46
-- Version du serveur :  10.4.17-MariaDB
-- Version de PHP : 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `opium2`
--

-- --------------------------------------------------------

--
-- Structure de la table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `tokenVersion` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `tokenVersion`) VALUES
(1, 'admin', '$2b$05$yjGF/QvRPO/Dftr.ctN6q.WGehUc1bf7phaAuQHBOMVH.dEdWmSYm', 1);

-- --------------------------------------------------------

--
-- Structure de la table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `min` int(11) NOT NULL DEFAULT 0,
  `max` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `attributes`
--

INSERT INTO `attributes` (`id`, `title`, `min`, `max`) VALUES
(1, 'Toppings', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `attribute_elements`
--

CREATE TABLE `attribute_elements` (
  `id` int(11) NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `attributeId` int(11) DEFAULT NULL,
  `elementId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `attribute_elements`
--

INSERT INTO `attribute_elements` (`id`, `price`, `attributeId`, `elementId`) VALUES
(1, 10, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `index` int(11) NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `status`, `index`, `image`) VALUES
(1, 'Bowl', NULL, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `tokenVersion` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id`, `name`, `email`, `phone`, `password`, `tokenVersion`, `created_at`, `updated_at`) VALUES
(1, 'Client ', 'test123@test.com', '070707070707', '$2b$10$SgMnySg55spnzhyaLJcn/eooXrIj7kgqR8/05Lp591upInE3HfMpS', 0, '2022-01-26 19:04:38.926744', '2022-01-26 19:04:38.926744');

-- --------------------------------------------------------

--
-- Structure de la table `client_informations`
--

CREATE TABLE `client_informations` (
  `id` int(11) NOT NULL,
  `adress` varchar(255) NOT NULL,
  `clientId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `elements`
--

CREATE TABLE `elements` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `elements`
--

INSERT INTO `elements` (`id`, `title`, `image`, `status`) VALUES
(1, 'Apple', '/uploads/elements/1643220076266-1624118011624-sg_apple.png', 1);

-- --------------------------------------------------------

--
-- Structure de la table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `main` tinyint(4) NOT NULL DEFAULT 0,
  `productId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `images`
--

INSERT INTO `images` (`id`, `path`, `main`, `productId`) VALUES
(1, '/uploads/1643220050379-1626646144092-smoob.png', 1, 1),
(2, '/uploads/1643220144790-1633554455470-1626652456876-HF-4.png', 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `ordered_attributes`
--

CREATE TABLE `ordered_attributes` (
  `id` varchar(36) NOT NULL,
  `title` varchar(255) NOT NULL,
  `attributeId` int(11) DEFAULT NULL,
  `orderedProductId` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `ordered_attributes`
--

INSERT INTO `ordered_attributes` (`id`, `title`, `attributeId`, `orderedProductId`) VALUES
('3a84cc21-f513-409c-8826-7fa92f1702b7', 'Toppings', 1, '301b4a2f-197a-4fb4-8e60-ba6406e083ea'),
('8295102f-1fe9-48ab-bfeb-b28f347e33eb', 'Toppings', 1, '2ce97bc4-28c3-44a2-bcba-038278eda56d'),
('98144a29-a068-41e9-adf7-ebcb7e8c51ea', 'Toppings', 1, '3470b134-9ba2-493b-bdd0-c1bf2359e25c'),
('e836713c-cef2-4835-b3f9-91f5d492ef44', 'Toppings', 1, 'e68481cd-4c42-44e5-b7d3-768714423074');

-- --------------------------------------------------------

--
-- Structure de la table `ordered_attribute_elements`
--

CREATE TABLE `ordered_attribute_elements` (
  `id` varchar(36) NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `attributeElementId` int(11) DEFAULT NULL,
  `orderedAttributeId` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `ordered_attribute_elements`
--

INSERT INTO `ordered_attribute_elements` (`id`, `title`, `price`, `attributeElementId`, `orderedAttributeId`) VALUES
('7bdd4ce6-3274-4438-9c91-35bfde9054a3', 'Apple', 10, 1, '3a84cc21-f513-409c-8826-7fa92f1702b7'),
('8e03af69-53f4-4f15-b95c-5a295a73b9e7', 'Apple', 10, 1, 'e836713c-cef2-4835-b3f9-91f5d492ef44'),
('9e513727-fcdb-4e83-ae3a-30f2bba10c9e', 'Apple', 10, 1, '8295102f-1fe9-48ab-bfeb-b28f347e33eb'),
('ea18c528-4a12-4362-82eb-3d052a60a04b', 'Apple', 10, 1, '98144a29-a068-41e9-adf7-ebcb7e8c51ea');

-- --------------------------------------------------------

--
-- Structure de la table `ordered_products`
--

CREATE TABLE `ordered_products` (
  `id` varchar(36) NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `with_attributes` tinyint(4) NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL,
  `note` text NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `ordered_products`
--

INSERT INTO `ordered_products` (`id`, `title`, `price`, `with_attributes`, `quantity`, `note`, `productId`, `orderId`) VALUES
('2ce97bc4-28c3-44a2-bcba-038278eda56d', 'Bowl X', 100, 1, 1, '', 2, 3),
('301b4a2f-197a-4fb4-8e60-ba6406e083ea', 'Bowl X', 100, 1, 1, '', 2, 2),
('3470b134-9ba2-493b-bdd0-c1bf2359e25c', 'Bowl X', 100, 1, 1, '', 2, 5),
('7831e36d-59b9-4405-8f2d-f5a27eb092cc', 'Fruit Bowl', 87, 0, 1, '', 1, 6),
('7fc33b02-1ff0-4322-a653-0b9729e3cdf5', 'Fruit Bowl', 87, 0, 1, '', 1, 4),
('e68481cd-4c42-44e5-b7d3-768714423074', 'Bowl X', 100, 1, 1, '', 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `date` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `deliver_price` int(11) NOT NULL DEFAULT 0,
  `is_delivery` tinyint(4) NOT NULL DEFAULT 1,
  `pickup_time` varchar(255) DEFAULT NULL,
  `adress` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `accepted` tinyint(4) NOT NULL DEFAULT 0,
  `treated` tinyint(4) NOT NULL DEFAULT 0,
  `delivered` tinyint(4) NOT NULL DEFAULT 0,
  `zoneId` varchar(36) DEFAULT NULL,
  `staffId` varchar(36) DEFAULT NULL,
  `clientId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id`, `total`, `date`, `deliver_price`, `is_delivery`, `pickup_time`, `adress`, `status`, `accepted`, `treated`, `delivered`, `zoneId`, `staffId`, `clientId`) VALUES
(1, 100, '2022-01-26 19:07:24.405631', 10, 1, '', 'something !', 1, 1, 1, 0, 'bbad4bcf-fb2c-4a54-8d75-024810f6f3d3', 'e481192a-8f7e-4fe3-8adf-c24154d4b0bc', 1),
(2, 100, '2022-01-26 19:11:00.130492', 10, 1, '', 'something !', 1, 1, 1, 0, 'bbad4bcf-fb2c-4a54-8d75-024810f6f3d3', 'e481192a-8f7e-4fe3-8adf-c24154d4b0bc', 1),
(3, 100, '2022-01-26 19:12:40.817028', 10, 1, '', 'something !', 1, 1, 1, 0, 'bbad4bcf-fb2c-4a54-8d75-024810f6f3d3', 'e481192a-8f7e-4fe3-8adf-c24154d4b0bc', 1),
(4, 87, '2022-01-26 19:16:23.614285', 10, 1, '', 'Something !', 1, 1, 1, 0, 'bbad4bcf-fb2c-4a54-8d75-024810f6f3d3', 'e481192a-8f7e-4fe3-8adf-c24154d4b0bc', 1),
(5, 100, '2022-01-28 17:40:53.551243', 10, 1, '', 'hello ', 1, 1, 1, 0, 'bbad4bcf-fb2c-4a54-8d75-024810f6f3d3', 'e481192a-8f7e-4fe3-8adf-c24154d4b0bc', 1),
(6, 87, '2022-01-28 18:05:31.776811', 10, 1, '', 'Hay Mohammadi !', 0, 0, 0, 0, 'bbad4bcf-fb2c-4a54-8d75-024810f6f3d3', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` double NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `have_attribute` tinyint(4) NOT NULL DEFAULT 0,
  `attribute_picutres` tinyint(4) NOT NULL DEFAULT 0,
  `index` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `categoryId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `price`, `status`, `have_attribute`, `attribute_picutres`, `index`, `created_at`, `categoryId`) VALUES
(1, 'Fruit Bowl', NULL, 87, 1, 0, 0, 0, '2022-01-26 19:00:50.352290', 1),
(2, 'Bowl X', 'choose toppings !', 90, 1, 1, 1, 0, '2022-01-26 19:02:24.767534', 1);

-- --------------------------------------------------------

--
-- Structure de la table `products_attributes_attributes`
--

CREATE TABLE `products_attributes_attributes` (
  `productsId` int(11) NOT NULL,
  `attributesId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `products_attributes_attributes`
--

INSERT INTO `products_attributes_attributes` (`productsId`, `attributesId`) VALUES
(2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `slider` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `staffs`
--

CREATE TABLE `staffs` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `staffs`
--

INSERT INTO `staffs` (`id`, `name`, `phone`, `email`, `password`, `created_at`) VALUES
('e481192a-8f7e-4fe3-8adf-c24154d4b0bc', 'Staff 1', '067070707070', 'staff1@opium.com', '$2b$05$/QfrMCkR/ty2VVks/U3ELeYf6hxGcX1rscukhBuamM2WplAmYoyt6', '2022-01-28 18:03:47.913619');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `tokenVersion` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `zone`
--

CREATE TABLE `zone` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `zone`
--

INSERT INTO `zone` (`id`, `name`, `price`, `status`) VALUES
('bbad4bcf-fb2c-4a54-8d75-024810f6f3d3', 'Q1', 10, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_4ba6d0c734d53f8e1b2e24b6c5` (`username`);

--
-- Index pour la table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `attribute_elements`
--
ALTER TABLE `attribute_elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_d5b348dfc104b610723ce16981d` (`attributeId`),
  ADD KEY `FK_04cca6d7fa0b649ddec9d2c5191` (`elementId`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_b48860677afe62cd96e1265948` (`email`),
  ADD UNIQUE KEY `IDX_aa22377d7d3e794ae4cd39cd9e` (`phone`);

--
-- Index pour la table `client_informations`
--
ALTER TABLE `client_informations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_d8bc2a58ac6180f0e72d47a24a6` (`clientId`);

--
-- Index pour la table `elements`
--
ALTER TABLE `elements`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_7af50639264735c79e918af6089` (`productId`);

--
-- Index pour la table `ordered_attributes`
--
ALTER TABLE `ordered_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_a56c8f21263bdd53e081cf0072f` (`attributeId`),
  ADD KEY `FK_60c8d52fc6c8013db44c98ba00c` (`orderedProductId`);

--
-- Index pour la table `ordered_attribute_elements`
--
ALTER TABLE `ordered_attribute_elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_0bb00bf7102df3523b4b4c5bddf` (`attributeElementId`),
  ADD KEY `FK_678f0c3225f5680148e5a4036de` (`orderedAttributeId`);

--
-- Index pour la table `ordered_products`
--
ALTER TABLE `ordered_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_5dde35589229a035d27266666b2` (`productId`),
  ADD KEY `FK_81c67bad7a0d7a00e86756baada` (`orderId`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_76c47d954887f2da9672bc24c45` (`zoneId`),
  ADD KEY `FK_117fdf5f7de7eb3c0b4169c3d2a` (`staffId`),
  ADD KEY `FK_1457f286d91f271313fded23e53` (`clientId`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ff56834e735fa78a15d0cf21926` (`categoryId`);

--
-- Index pour la table `products_attributes_attributes`
--
ALTER TABLE `products_attributes_attributes`
  ADD PRIMARY KEY (`productsId`,`attributesId`),
  ADD KEY `IDX_fce36fa54495d98046d94f9925` (`productsId`),
  ADD KEY `IDX_a3801a7c702341aab095b82dfc` (`attributesId`);

--
-- Index pour la table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_b8e8f265ec3a2c739ed716c40f` (`phone`),
  ADD UNIQUE KEY `IDX_fc7b6dc314d349acb74a6124fe` (`email`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_97672ac88f789774dd47f7c8be` (`email`),
  ADD UNIQUE KEY `IDX_a000cca60bcf04454e72769949` (`phone`);

--
-- Index pour la table `zone`
--
ALTER TABLE `zone`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `attribute_elements`
--
ALTER TABLE `attribute_elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `client_informations`
--
ALTER TABLE `client_informations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `elements`
--
ALTER TABLE `elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `attribute_elements`
--
ALTER TABLE `attribute_elements`
  ADD CONSTRAINT `FK_04cca6d7fa0b649ddec9d2c5191` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_d5b348dfc104b610723ce16981d` FOREIGN KEY (`attributeId`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `client_informations`
--
ALTER TABLE `client_informations`
  ADD CONSTRAINT `FK_d8bc2a58ac6180f0e72d47a24a6` FOREIGN KEY (`clientId`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `FK_7af50639264735c79e918af6089` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `ordered_attributes`
--
ALTER TABLE `ordered_attributes`
  ADD CONSTRAINT `FK_60c8d52fc6c8013db44c98ba00c` FOREIGN KEY (`orderedProductId`) REFERENCES `ordered_products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_a56c8f21263bdd53e081cf0072f` FOREIGN KEY (`attributeId`) REFERENCES `attributes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `ordered_attribute_elements`
--
ALTER TABLE `ordered_attribute_elements`
  ADD CONSTRAINT `FK_0bb00bf7102df3523b4b4c5bddf` FOREIGN KEY (`attributeElementId`) REFERENCES `attribute_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_678f0c3225f5680148e5a4036de` FOREIGN KEY (`orderedAttributeId`) REFERENCES `ordered_attributes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `ordered_products`
--
ALTER TABLE `ordered_products`
  ADD CONSTRAINT `FK_5dde35589229a035d27266666b2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_81c67bad7a0d7a00e86756baada` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_117fdf5f7de7eb3c0b4169c3d2a` FOREIGN KEY (`staffId`) REFERENCES `staffs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_1457f286d91f271313fded23e53` FOREIGN KEY (`clientId`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_76c47d954887f2da9672bc24c45` FOREIGN KEY (`zoneId`) REFERENCES `zone` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_ff56834e735fa78a15d0cf21926` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `products_attributes_attributes`
--
ALTER TABLE `products_attributes_attributes`
  ADD CONSTRAINT `FK_a3801a7c702341aab095b82dfc1` FOREIGN KEY (`attributesId`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_fce36fa54495d98046d94f99253` FOREIGN KEY (`productsId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
