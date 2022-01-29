-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: opium
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `tokenVersion` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_4ba6d0c734d53f8e1b2e24b6c5` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'berkasse','$2b$05$dI8zHNHCIEajpd3CgocojOFEMmtQBW9xYZ4TXRM6basp/vVNKg2JS',1),(4,'brahim','$2b$05$m3wZj5x8VZR0INkMimI/YuonAOBJ5dMQTAyt.9chQ6T6d6BpZTHpG',1),(5,'admin','$2b$05$kaRBMcd9OJhqrfw1FFc9E.WyjR0S2nfbqOxAgmw8pJCFeoAGPlMUm',1);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_elements`
--

DROP TABLE IF EXISTS `attribute_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL DEFAULT '0',
  `elementId` int DEFAULT NULL,
  `attributeId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_d5b348dfc104b610723ce16981d` (`attributeId`),
  KEY `FK_04cca6d7fa0b649ddec9d2c5191` (`elementId`),
  CONSTRAINT `FK_04cca6d7fa0b649ddec9d2c5191` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_d5b348dfc104b610723ce16981d` FOREIGN KEY (`attributeId`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_elements`
--

LOCK TABLES `attribute_elements` WRITE;
/*!40000 ALTER TABLE `attribute_elements` DISABLE KEYS */;
INSERT INTO `attribute_elements` VALUES (51,0,48,NULL),(52,0,50,NULL),(53,0,49,NULL),(54,0,28,NULL),(55,0,29,NULL),(56,0,31,19),(57,0,30,19),(58,0,32,19),(59,0,33,19),(60,0,35,19),(61,0,34,19),(62,0,37,20),(63,0,38,20),(64,0,40,20),(65,0,39,20),(66,0,36,20),(67,0,41,20),(68,0,46,NULL),(69,0,44,NULL),(70,0,45,NULL),(71,0,43,NULL),(72,0,42,NULL),(73,0,47,NULL),(74,0,51,22),(75,0,52,22),(76,0,55,22),(77,0,56,22),(78,0,48,22),(79,0,50,22),(80,0,49,22),(81,0,57,23),(82,0,59,23),(83,0,58,23),(84,0,61,23),(85,20,65,24),(86,30,66,24),(87,35,68,24),(88,25,67,24),(89,0,50,NULL),(90,0,48,NULL),(91,0,48,NULL),(92,0,50,NULL),(93,0,48,NULL),(94,0,48,NULL),(95,0,20,NULL),(96,0,29,18),(97,0,28,18),(98,0,24,18),(99,10,48,NULL),(100,0,20,NULL),(101,10,48,17),(102,0,20,17),(103,50,44,21),(104,20,46,21),(105,45,47,21),(106,12,43,21),(107,15,45,21),(108,60,42,21);
/*!40000 ALTER TABLE `attribute_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attributes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `min` int NOT NULL DEFAULT '0',
  `max` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (17,'Sauce test',1,1),(18,'Base',1,1),(19,'Garniture',0,2),(20,'Garniture Premium',0,2),(21,'Proteine',1,1),(22,'Sauces',0,1),(23,'Topping',0,4),(24,'Proteines/50g',0,4);
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `index` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (39,'Poke Bowl',NULL,NULL,1,1),(40,'Make your own',NULL,NULL,1,0),(41,'Toast',NULL,NULL,1,4),(42,'Smoothie Bowl',NULL,NULL,1,3),(44,'Buddah Bowl',NULL,NULL,1,2),(45,'Proteine Bowl',NULL,NULL,1,5),(46,'Smoothie',NULL,NULL,1,6);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_informations`
--

DROP TABLE IF EXISTS `client_informations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_informations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `adress` varchar(255) NOT NULL,
  `clientId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_9261348554a9900e56c40263f06` (`clientId`),
  CONSTRAINT `FK_d8bc2a58ac6180f0e72d47a24a6` FOREIGN KEY (`clientId`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_informations`
--

LOCK TABLES `client_informations` WRITE;
/*!40000 ALTER TABLE `client_informations` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_informations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `tokenVersion` int NOT NULL DEFAULT '0',
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_b48860677afe62cd96e1265948` (`email`),
  UNIQUE KEY `IDX_aa22377d7d3e794ae4cd39cd9e` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (20,'Soja Salee','/uploads/elements/1626909329881-s1.png',1),(21,'Sauce Sucree','/uploads/elements/1626909321097-s2.png',1),(22,'Pomme Fruit','/uploads/elements/1626909302466-s4.png',1),(23,'Avocado ','/uploads/elements/1626909292031-s7.png',1),(24,'Ponzu','/uploads/elements/1626909281186-s2.png',1),(25,'Spicy Mayo','/uploads/elements/1626909271072-s9.png',1),(26,'Sweet Chilli','/uploads/elements/1626734344271-sweetchil.png',1),(27,'Yaourt',NULL,1),(28,'Riz Basmati','/uploads/elements/1626909239996-1626648780899-smt2.png',1),(29,'Qunioa ','/uploads/elements/1626909229275-vv.png',1),(30,'Carrote','/uploads/elements/1626909216279-crt.png',1),(31,'Poivron','/uploads/elements/1626909204552-fl.png',1),(32,'Concombre','/uploads/elements/1626909196756-kh.png',1),(33,'Chou Rouge','/uploads/elements/1626909186512-prl.png',1),(34,'Tomate Cerise','/uploads/elements/1626909176622-tmt.png',1),(35,'Radis','/uploads/elements/1626909164042-rd.png',1),(36,'Edamame','/uploads/elements/1626907861969-vg.png',1),(37,'Wakame','/uploads/elements/1626909149420-cv.png',1),(38,'Avocat','/uploads/elements/1626909138880-avc.png',1),(39,'Mangue','/uploads/elements/1626909130507-mg.png',1),(40,'Ananas','/uploads/elements/1626909079029-an.png',1),(41,'Noix de cajou','/uploads/elements/1626909066073-ns.png',1),(42,'Saumon','/uploads/elements/1626909056979-smn.png',1),(43,'Thon','/uploads/elements/1626909046987-th.png',1),(44,'Tofu','/uploads/elements/1626909033955-bg.png',1),(45,'Poulet teryaki','/uploads/elements/1626909019703-trk.png',1),(46,'Gambas','/uploads/elements/1626909008023-crvt.png',1),(47,'Duo','/uploads/elements/1626908999462-vr.png',1),(48,'Soja salees','/uploads/elements/1626908985077-s1.png',1),(49,'Soja sucree','/uploads/elements/1626908975325-s2.png',1),(50,'Pomme fruit','/uploads/elements/1626908960925-s4.png',1),(51,'Poireau','/uploads/elements/1626908936429-s6.png',1),(52,'Avocado','/uploads/elements/1626908919739-s7.png',1),(53,'Ponzu','/uploads/elements/1626908909477-s2.png',1),(54,'Sésame','/uploads/elements/1626908896992-s8.png',1),(55,'Sésame','/uploads/elements/1626908885973-s8.png',1),(56,'Spicy mayo','/uploads/elements/1626908872279-s9.png',1),(57,'Mix de sésame','/uploads/elements/1626908744160-mix.png',1),(58,'Ciboule','/uploads/elements/1626908730421-gt.png',1),(59,'Graines de chia','/uploads/elements/1626908718070-bgt.png',1),(60,'Coriandre','/uploads/elements/1626908707500-frr.png',1),(61,'Coriandre','/uploads/elements/1626907674613-frr.png',1),(62,'Garniture',NULL,1),(63,'Edamame','/uploads/elements/1626907662799-vg.png',1),(64,'Ananas','/uploads/elements/1626907636103-an.png',1),(65,'Poulet',NULL,1),(66,'Viande hachée',NULL,1),(67,'Thon à l\'eau',NULL,1),(68,'Saumon',NULL,1);
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `main` tinyint NOT NULL DEFAULT '0',
  `productId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7af50639264735c79e918af6089` (`productId`),
  CONSTRAINT `FK_7af50639264735c79e918af6089` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (24,'/uploads/1625592893009-HF.png',1,NULL),(25,'/uploads/1626044359729-10707609.jpeg',1,NULL),(26,'/uploads/1626044374466-10707609.jpeg',1,NULL),(27,'/uploads/1626044707340-10707609.jpeg',1,NULL),(28,'/uploads/1626044721214-10707609.jpeg',1,NULL),(29,'/uploads/1626105020377-1625592742215-HF.png',1,NULL),(33,'/uploads/1626397817623-217377965_543782033476525_8724175102318223737_n.png',1,26),(34,'/uploads/1626397872013-217377965_543782033476525_8724175102318223737_n.png',1,27),(35,'/uploads/1626398126759-217377965_543782033476525_8724175102318223737_n.png',1,28),(36,'/uploads/1626398208797-217377965_543782033476525_8724175102318223737_n.png',1,29),(37,'/uploads/1626398275482-217377965_543782033476525_8724175102318223737_n.png',1,30),(38,'/uploads/1626644074937-BB.png',1,31),(39,'/uploads/1626644155647-BB.png',1,32),(40,'/uploads/1626644231738-BB.png',1,33),(41,'/uploads/1626644344115-BB.png',1,34),(42,'/uploads/1626646144092-smoob.png',1,35),(43,'/uploads/1626646256971-smoob.png',1,36),(44,'/uploads/1626646867126-smoob.png',1,37),(45,'/uploads/1626646940850-smoob.png',1,38),(46,'/uploads/1626647019592-smoob.png',1,39),(47,'/uploads/1626647272476-SMT.png',1,40),(48,'/uploads/1626647392101-smt2.png',1,41),(49,'/uploads/1626647475697-smt2.png',1,42),(50,'/uploads/1626647533465-smt2.png',1,43),(51,'/uploads/1626647577456-smt2.png',1,44),(52,'/uploads/1626648780899-smt2.png',1,45),(53,'/uploads/1626648840509-smt2.png',1,46),(54,'/uploads/1626648939840-smt2.png',1,47),(55,'/uploads/1626652456876-HF.png',1,48),(56,'/uploads/1626785822598-tst.png',1,49),(57,'/uploads/1626785910261-tst.png',1,50),(58,'/uploads/1626785997041-tst.png',1,51),(59,'/uploads/1626786035142-tst.png',1,52),(60,'/uploads/1626786067613-tst.png',1,53),(61,'/uploads/1626786159957-tst.png',1,54),(62,'/uploads/1626786190048-tst.png',1,55),(63,'/uploads/1626786257960-tst.png',1,56),(64,'/uploads/1626786293699-tst.png',1,57),(65,'/uploads/1626786824850-prtb.png',1,58),(66,'/uploads/1626786875656-prtb.png',1,59),(67,'/uploads/1626786901422-prtb.png',1,60),(68,'/uploads/1626786953552-prtb.png',1,61),(69,'/uploads/1626397709188-217377965_543782033476525_8724175102318223737_n.png',1,24),(70,'/uploads/1626397709188-217377965_543782033476525_8724175102318223737_n.png',1,65),(71,'/uploads/1626652456876-HF.png',1,66);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordered_attribute_elements`
--

DROP TABLE IF EXISTS `ordered_attribute_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordered_attribute_elements` (
  `id` varchar(36) NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `attributeElementId` int DEFAULT NULL,
  `orderedAttributeId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_0bb00bf7102df3523b4b4c5bddf` (`attributeElementId`),
  KEY `FK_678f0c3225f5680148e5a4036de` (`orderedAttributeId`),
  CONSTRAINT `FK_0bb00bf7102df3523b4b4c5bddf` FOREIGN KEY (`attributeElementId`) REFERENCES `attribute_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_678f0c3225f5680148e5a4036de` FOREIGN KEY (`orderedAttributeId`) REFERENCES `ordered_attributes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordered_attribute_elements`
--

LOCK TABLES `ordered_attribute_elements` WRITE;
/*!40000 ALTER TABLE `ordered_attribute_elements` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordered_attribute_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordered_attributes`
--

DROP TABLE IF EXISTS `ordered_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordered_attributes` (
  `id` varchar(36) NOT NULL,
  `title` varchar(255) NOT NULL,
  `attributeId` int DEFAULT NULL,
  `orderedProductId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_a56c8f21263bdd53e081cf0072f` (`attributeId`),
  KEY `FK_60c8d52fc6c8013db44c98ba00c` (`orderedProductId`),
  CONSTRAINT `FK_60c8d52fc6c8013db44c98ba00c` FOREIGN KEY (`orderedProductId`) REFERENCES `ordered_products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_a56c8f21263bdd53e081cf0072f` FOREIGN KEY (`attributeId`) REFERENCES `attributes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordered_attributes`
--

LOCK TABLES `ordered_attributes` WRITE;
/*!40000 ALTER TABLE `ordered_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordered_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordered_products`
--

DROP TABLE IF EXISTS `ordered_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordered_products` (
  `id` varchar(36) NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `with_attributes` tinyint NOT NULL DEFAULT '0',
  `quantity` int NOT NULL,
  `note` text NOT NULL,
  `productId` int DEFAULT NULL,
  `orderId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5dde35589229a035d27266666b2` (`productId`),
  KEY `FK_81c67bad7a0d7a00e86756baada` (`orderId`),
  CONSTRAINT `FK_5dde35589229a035d27266666b2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  CONSTRAINT `FK_81c67bad7a0d7a00e86756baada` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordered_products`
--

LOCK TABLES `ordered_products` WRITE;
/*!40000 ALTER TABLE `ordered_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordered_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total` int NOT NULL,
  `date` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `deliver_price` int NOT NULL DEFAULT '0',
  `is_delivery` tinyint NOT NULL DEFAULT '1',
  `pickup_time` varchar(255) DEFAULT NULL,
  `adress` varchar(255) DEFAULT NULL,
  `clientId` int DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  `treated` tinyint NOT NULL DEFAULT '0',
  `delivered` tinyint NOT NULL DEFAULT '0',
  `zoneId` varchar(36) DEFAULT NULL,
  `accepted` tinyint NOT NULL DEFAULT '0',
  `staffId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_76c47d954887f2da9672bc24c45` (`zoneId`),
  KEY `FK_117fdf5f7de7eb3c0b4169c3d2a` (`staffId`),
  KEY `FK_151b79a83ba240b0cb31b2302d1` (`clientId`),
  CONSTRAINT `FK_117fdf5f7de7eb3c0b4169c3d2a` FOREIGN KEY (`staffId`) REFERENCES `staffs` (`id`),
  CONSTRAINT `FK_1457f286d91f271313fded23e53` FOREIGN KEY (`clientId`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_76c47d954887f2da9672bc24c45` FOREIGN KEY (`zoneId`) REFERENCES `zone` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `categoryId` int DEFAULT NULL,
  `price` double NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `have_attribute` tinyint NOT NULL DEFAULT '0',
  `attribute_picutres` tinyint NOT NULL DEFAULT '0',
  `index` int NOT NULL DEFAULT '0',
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `FK_ff56834e735fa78a15d0cf21926` (`categoryId`),
  CONSTRAINT `FK_ff56834e735fa78a15d0cf21926` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (24,'SAUMON','Saumon marine, riz basmati parfume , avocat, chou rouge edamame, mangue, pickles d\'oignon, graines de sesame, graines de chia . sauce: pomme fruit',39,85,1,1,0,0,'2021-10-04 19:15:46.450461'),(26,'VEGAN','Tofu marine quinoa parfume, concombre, edamame radis, carotte, noix de cajou, wakame, graines de sesame, graines de chia, sauce avocado',39,75,1,0,0,1,'2021-10-04 19:15:46.450461'),(27,'DUO','saumon et thon rouge marine quinoa parfume, carotte, edamame avocat, chou rouge, wakame, graines de sesame, graines de chia, sauce ponzu',39,87,1,0,0,2,'2021-10-04 19:15:46.450461'),(28,'POULET TERAYKI','Poulet marine riz basmati parfume, carotte, edamame avocat, poivron pickles d\'oignon, graines de sesame, graines de chia, sauce poireau',39,80,1,0,0,3,'2021-10-04 19:15:46.450461'),(29,'GAMBAS','Gambas marinées riz basmati parfume, avocat, edamame concombre, ananas wakame, graines de sesame, graines de chia sauce sesame',39,115,1,0,0,4,'2021-10-04 19:15:46.450461'),(30,'THON ROUGE','Thon rouge marine, riz basmati parfume, avocat, wakame poivron, carotte, pickles d\'oignon, graines de sesame, graines de chia, sauce poireau',39,85,1,0,0,5,'2021-10-04 19:15:46.450461'),(31,'SAUMON ','Saumon grillé quinoa parfumé - épinards - poivron rouge carotte - betterave - avocat - citron - graines sésame - tournesol et courge - vinaigrette  bowl ',44,85,1,0,0,0,'2021-10-04 19:15:46.450461'),(32,'Vegan','Pois chiches sauté - riz basmati parfumé - patate douce - avocat chou rouge - épinards. graines sésame - tournesol et courge-sauce: green tahini ',44,70,1,0,0,0,'2021-10-04 19:15:46.450461'),(33,'Poulet','Poulet quinoa parfumé - champignon - carotte chou rouge - brocoli. graines: sésame -tournesol et courge - sauce: yaourt ',44,75,1,0,0,0,'2021-10-04 19:15:46.450461'),(34,'Couscous à l\'huile d\'argan','Poulet semoule complète - champignon - pois chiches carotte - potiron - navet - brocoli. coriandre - persil - ciboulette. sauce: huile d\'argan ',44,75,1,0,0,0,'2021-10-04 19:15:46.450461'),(35,'Açaï bowl ','banane surgelée - poudre Açaï topping : fruits de saison graines de chia baie de goji, pollen, peanut butter, granola, pétales de coco.',42,60,1,0,0,0,'2021-10-04 19:15:46.450461'),(36,'Açaï bowl','banane surgelée - poudre d\'açaï topping : fruits de saison graines de chia baie de goji, pollen, peanut butter, granola, pétales de coco.',42,60,1,0,0,0,'2021-10-04 19:15:46.450461'),(37,'Green bowl','banane surgelée - poudre de spiruline - miel topping . fruits de saison graines de chia baie de goji, pollen, peanut butter, granola, pétales de coco ',42,60,1,0,0,0,'2021-10-04 19:15:46.450461'),(38,'Chocolate bowl','Banane surgelée - poudre de 100%cacao - miel \ntopping : fruits de saison graines de chia baie de goji, pollen, peanut butter, granola, pétales de coco',42,60,1,0,0,0,'2021-10-04 19:15:46.450461'),(39,'Matcha bowl','Banane surgelée - poudre de green tea matcha toppng : fruits de saison graines de chia baie de goji, pollen, peanut butter, granola, pétales de coco ',42,60,1,0,0,0,'2021-10-04 19:15:46.450461'),(40,' Popeye','Orange - épinards - spiruline - concombre datte - miel.',46,35,1,0,0,0,'2021-10-04 19:15:46.450461'),(41,'Purple power','Açaï - myrtille - framboise - pomme granny orange, miel ',46,38,1,0,0,0,'2021-10-04 19:15:46.450461'),(42,'Citrus ','Orange - citron - gingembre - fraise - kiwi.',46,35,1,0,0,0,'2021-10-04 19:15:46.450461'),(43,'Hercule','Avocat - lait d\'amande - granola -baie de goji - datte- chia.',46,40,1,0,0,0,'2021-10-04 19:15:46.450461'),(44,'Speed rabbit','Orange - carotte - concombre - ananas',46,35,1,0,0,0,'2021-10-04 19:15:46.450461'),(45,'Bugs bunny','Orange - carotte - betterave - mangue.',46,35,1,0,0,0,'2021-10-04 19:15:46.450461'),(46,'Refresh','Orange - citron - framboise - menthe cannele - pomme granny',46,35,1,0,0,0,'2021-10-04 19:15:46.450461'),(47,'Matcha','Matcha orange - concombre- pomme granny gingembre - pousse d\'épinard - miel',46,38,1,0,0,0,'2021-10-04 19:15:46.450461'),(48,'Make your own','Make your own bowl , be creative be savage with your appetite ',40,0,1,1,0,0,'2021-10-04 19:15:46.450461'),(49,'Salmon toast','Pain de seigle toasté - champignon -écrasé d\'avocat - saumon fumé ',41,50,1,0,0,0,'2021-10-04 19:15:46.450461'),(50,'Spinach toast','Pain de seile toasté - épinards champignon - oeuf au plat ',41,45,1,0,0,0,'2021-10-04 19:15:46.450461'),(51,'Avocado toast','Pain de seigle toasté - avocat en fines lamelles oeuf au plat ',41,40,1,0,0,0,'2021-10-04 19:15:46.450461'),(52,'Vegan toast','Pain de seigle toasté - houmous de betterave pois chiches',41,40,1,0,0,0,'2021-10-04 19:15:46.450461'),(53,'Tomato toast','Pain de seigle toasté - écrasé d\'avocat- feta tomates cerises rouge et jaune - feuille de basilic. ',41,45,1,0,0,0,'2021-10-04 19:15:46.450461'),(54,'Peanut butter','Pain de seigle toasté - beurre de cacahuète fruits rouge chips de coco - miel - chips de coco',41,45,1,0,0,0,'2021-10-04 19:15:46.450461'),(55,'Amlou','Pain de seigle toasté - beurre d\'amande banane - chips de coco - graines de chia',41,40,1,0,0,0,'2021-10-04 19:15:46.450461'),(56,'Chocolate toast','Pain de seigle toasté - chocolat au lait d\'amande fruits rouge chips de coco - miel ',41,45,1,0,0,0,'2021-10-04 19:15:46.450461'),(57,'45','Pain de mie complet trempé au lait d\'amande oeuf topping fruits : rouge - miel ',41,45,1,0,0,0,'2021-10-04 19:15:46.450461'),(58,'Poulet ','Supreme de poulet 150g, riz basmati 150c, brocoli 60g proteine 38g, glucides 44g, fibres 2g, lipides 3g ',45,45,1,1,0,0,'2021-10-04 19:15:46.450461'),(59,'Viande hachée sans gras','Viande hachée sans gras ,50g, riz basmati 150g, brocoli 60g . proteine 37g, glucides 42g, fibres 2g, lipides 23g. ',45,60,1,0,0,0,'2021-10-04 19:15:46.450461'),(60,'Thon à l\'eau','Thon à l\'eau 85g, riz basmati 150g, brocoli 60g . proteine 28g, glucides 42g, fibres 2g, lipides 2g ',45,55,1,0,0,0,'2021-10-04 19:15:46.450461'),(61,'Saumon','Saumon , riz basmati 150c, brocoli 60g proteine 38g, glucides 44g, fibres 2g, lipides 3g',45,75,1,0,0,0,'2021-10-04 19:15:46.450461'),(65,'SAUMON','Saumon marine, riz basmati parfume , avocat, chou rouge edamame, mangue, pickles d\'oignon, graines de sesame, graines de chia . sauce: pomme fruit',39,85,1,0,0,0,'2021-10-04 19:15:46.450461'),(66,'Make your own','Make your own bowl , be creative be savage with your appetite ',40,0,1,1,0,0,'2021-10-04 19:39:27.804216');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_attributes_attributes`
--

DROP TABLE IF EXISTS `products_attributes_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_attributes_attributes` (
  `productsId` int NOT NULL,
  `attributesId` int NOT NULL,
  PRIMARY KEY (`productsId`,`attributesId`),
  KEY `IDX_fce36fa54495d98046d94f9925` (`productsId`),
  KEY `IDX_a3801a7c702341aab095b82dfc` (`attributesId`),
  CONSTRAINT `FK_a3801a7c702341aab095b82dfc1` FOREIGN KEY (`attributesId`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_fce36fa54495d98046d94f99253` FOREIGN KEY (`productsId`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_attributes_attributes`
--

LOCK TABLES `products_attributes_attributes` WRITE;
/*!40000 ALTER TABLE `products_attributes_attributes` DISABLE KEYS */;
INSERT INTO `products_attributes_attributes` VALUES (24,17),(48,18),(48,19),(48,20),(48,21),(48,22),(48,23),(58,24),(65,17),(66,18),(66,19),(66,20),(66,21),(66,22),(66,23);
/*!40000 ALTER TABLE `products_attributes_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `slider` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'/uploads/slides/1626984740401-slide.70aeb8a8.jpeg','/uploads/logos/1626984740402-logo.png','Healthy Bowl','Healthy Bowl');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staffs`
--

DROP TABLE IF EXISTS `staffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staffs` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_b8e8f265ec3a2c739ed716c40f` (`phone`),
  UNIQUE KEY `IDX_fc7b6dc314d349acb74a6124fe` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staffs`
--

LOCK TABLES `staffs` WRITE;
/*!40000 ALTER TABLE `staffs` DISABLE KEYS */;
/*!40000 ALTER TABLE `staffs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `tokenVersion` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_97672ac88f789774dd47f7c8be` (`email`),
  UNIQUE KEY `IDX_a000cca60bcf04454e72769949` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zone`
--

DROP TABLE IF EXISTS `zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zone` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone`
--

LOCK TABLES `zone` WRITE;
/*!40000 ALTER TABLE `zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `zone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-29  1:36:55
