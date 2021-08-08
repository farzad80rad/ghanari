-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: ghanari
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blocklists`
--

DROP TABLE IF EXISTS `blocklists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blocklists` (
  `blocker` varchar(20) NOT NULL,
  `blocked` varchar(20) NOT NULL,
  PRIMARY KEY (`blocker`,`blocked`),
  KEY `user2_idx` (`blocked`),
  CONSTRAINT `blocked_id` FOREIGN KEY (`blocked`) REFERENCES `user` (`userName`),
  CONSTRAINT `blocker_id` FOREIGN KEY (`blocker`) REFERENCES `user` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocklists`
--

LOCK TABLES `blocklists` WRITE;
/*!40000 ALTER TABLE `blocklists` DISABLE KEYS */;
INSERT INTO `blocklists` VALUES ('farzad80','cheetoz'),('cheetoz','farzad80');
/*!40000 ALTER TABLE `blocklists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commentlist`
--

DROP TABLE IF EXISTS `commentlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commentlist` (
  `source_voice` int NOT NULL,
  `comment_voice` int NOT NULL,
  PRIMARY KEY (`source_voice`,`comment_voice`),
  KEY `comment_voice_idx` (`comment_voice`),
  CONSTRAINT `comment_voice_id` FOREIGN KEY (`comment_voice`) REFERENCES `voice` (`id_voice`),
  CONSTRAINT `source_voice_id` FOREIGN KEY (`source_voice`) REFERENCES `voice` (`id_voice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentlist`
--

LOCK TABLES `commentlist` WRITE;
/*!40000 ALTER TABLE `commentlist` DISABLE KEYS */;
INSERT INTO `commentlist` VALUES (1,2),(1,3),(1,4),(9,4),(1,5),(1,6),(4,6),(1,7),(2,8),(3,8),(9,8),(10,8),(48,8),(6,10),(11,10),(47,10),(8,49),(46,50),(9,51),(8,52),(8,53),(10,55);
/*!40000 ALTER TABLE `commentlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followerslist`
--

DROP TABLE IF EXISTS `followerslist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followerslist` (
  `follower` varchar(20) NOT NULL,
  `followed` varchar(20) NOT NULL,
  PRIMARY KEY (`follower`,`followed`),
  KEY `followed_idx` (`followed`),
  CONSTRAINT `followed_id` FOREIGN KEY (`followed`) REFERENCES `user` (`userName`),
  CONSTRAINT `follower_id` FOREIGN KEY (`follower`) REFERENCES `user` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followerslist`
--

LOCK TABLES `followerslist` WRITE;
/*!40000 ALTER TABLE `followerslist` DISABLE KEYS */;
INSERT INTO `followerslist` VALUES ('farzad80','cheetoz'),('u','cheetoz'),('u','p1'),('u','p2'),('u','p3'),('u','uu'),('u','uuu');
/*!40000 ALTER TABLE `followerslist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hashtag`
--

DROP TABLE IF EXISTS `hashtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hashtag` (
  `hashTag_text` char(6) NOT NULL,
  PRIMARY KEY (`hashTag_text`),
  UNIQUE KEY `hashTag_text_UNIQUE` (`hashTag_text`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hashtag`
--

LOCK TABLES `hashtag` WRITE;
/*!40000 ALTER TABLE `hashtag` DISABLE KEYS */;
INSERT INTO `hashtag` VALUES ('#abcde'),('#dd123'),('#gotoh'),('#hawdi'),('#iamuu'),('#testt'),('#works');
/*!40000 ALTER TABLE `hashtag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hashtaglist`
--

DROP TABLE IF EXISTS `hashtaglist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hashtaglist` (
  `hashTag` char(6) NOT NULL,
  `voice` int NOT NULL,
  PRIMARY KEY (`hashTag`,`voice`),
  KEY `voice_idx` (`voice`),
  CONSTRAINT `hashTag_id` FOREIGN KEY (`hashTag`) REFERENCES `hashtag` (`hashTag_text`),
  CONSTRAINT `hashtag_voice_id` FOREIGN KEY (`voice`) REFERENCES `voice` (`id_voice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hashtaglist`
--

LOCK TABLES `hashtaglist` WRITE;
/*!40000 ALTER TABLE `hashtaglist` DISABLE KEYS */;
INSERT INTO `hashtaglist` VALUES ('#abcde',1),('#testt',36),('#dd123',37),('#gotoh',37),('#iamuu',42),('#works',43),('#hawdi',46),('#testt',54),('#testt',56);
/*!40000 ALTER TABLE `hashtaglist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likedlist`
--

DROP TABLE IF EXISTS `likedlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likedlist` (
  `user` varchar(20) NOT NULL,
  `liked_voice` int NOT NULL,
  PRIMARY KEY (`user`,`liked_voice`),
  KEY `liked_voice_idx` (`liked_voice`),
  CONSTRAINT `liked_user_id` FOREIGN KEY (`user`) REFERENCES `user` (`userName`),
  CONSTRAINT `liked_voice_id` FOREIGN KEY (`liked_voice`) REFERENCES `voice` (`id_voice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likedlist`
--

LOCK TABLES `likedlist` WRITE;
/*!40000 ALTER TABLE `likedlist` DISABLE KEYS */;
INSERT INTO `likedlist` VALUES ('farzad80',1),('u',1),('farzad80',3),('uuu',3),('cheetoz',5),('u',5),('u',7),('cheetoz',8),('farzad80',8),('mr.bin',8),('u',8),('u',10),('uuu',10),('u',36),('u',46),('u',49),('u',50);
/*!40000 ALTER TABLE `likedlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logings`
--

DROP TABLE IF EXISTS `logings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logings` (
  `id_login` int NOT NULL AUTO_INCREMENT,
  `user` varchar(20) NOT NULL,
  `date_login` datetime NOT NULL,
  PRIMARY KEY (`id_login`),
  UNIQUE KEY `id_login_UNIQUE` (`id_login`),
  KEY `user_idx` (`user`),
  CONSTRAINT `login_user_id` FOREIGN KEY (`user`) REFERENCES `user` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logings`
--

LOCK TABLES `logings` WRITE;
/*!40000 ALTER TABLE `logings` DISABLE KEYS */;
INSERT INTO `logings` VALUES (1,'farzad80','2021-05-26 20:16:59'),(2,'farzad80','2021-05-26 20:17:07'),(3,'farzad80','2021-05-26 20:17:11'),(4,'farzad80','2021-05-26 20:24:29'),(5,'farzad','2021-07-13 18:19:25'),(6,'u','2021-07-13 19:01:16'),(7,'uu','2021-07-13 19:03:38'),(8,'u','2021-07-13 19:04:56'),(9,'u','2021-07-13 19:05:29'),(10,'u','2021-07-13 19:06:48'),(11,'u','2021-07-13 19:08:09'),(12,'u','2021-07-13 19:08:16'),(13,'u','2021-07-13 19:08:35'),(14,'u','2021-07-13 19:10:39'),(15,'u','2021-07-13 19:15:41'),(16,'u','2021-07-13 19:16:09'),(17,'u','2021-07-13 19:21:24'),(18,'u','2021-07-13 19:22:07'),(19,'u','2021-07-13 19:23:17'),(20,'u','2021-07-13 19:24:16'),(21,'u','2021-07-13 19:24:47'),(22,'u','2021-07-13 19:26:48'),(23,'u','2021-07-13 19:28:18'),(24,'u','2021-07-13 19:30:51'),(25,'u','2021-07-13 19:31:09'),(26,'u','2021-07-13 19:32:02'),(27,'u','2021-07-13 19:32:30'),(28,'farzad','2021-07-13 19:34:19'),(29,'farzad','2021-07-13 19:34:49'),(30,'farzad','2021-07-13 19:35:50'),(31,'u','2021-07-13 19:35:58'),(32,'u','2021-07-13 19:37:15'),(33,'u','2021-07-13 19:38:44'),(34,'u','2021-07-13 19:39:23'),(35,'u','2021-07-13 19:39:48'),(36,'u','2021-07-13 19:40:19'),(37,'u','2021-07-13 19:40:40'),(38,'u','2021-07-13 19:41:34'),(39,'u','2021-07-13 19:42:01'),(40,'u','2021-07-13 19:42:26'),(41,'u','2021-07-13 19:43:13'),(42,'u','2021-07-13 19:43:33'),(43,'u','2021-07-13 19:45:58'),(44,'u','2021-07-13 19:46:31'),(45,'u','2021-07-13 19:47:07'),(46,'u','2021-07-13 19:47:41'),(47,'u','2021-07-13 19:48:27'),(48,'u','2021-07-13 19:50:24'),(49,'u','2021-07-13 19:51:12'),(50,'u','2021-07-13 19:51:30'),(51,'u','2021-07-13 19:51:49'),(52,'u','2021-07-13 19:53:04'),(53,'u','2021-07-13 19:53:19'),(54,'u','2021-07-13 19:58:30'),(55,'u','2021-07-13 20:01:08'),(56,'u','2021-07-13 20:01:11'),(57,'u','2021-07-13 20:01:52'),(58,'u','2021-07-13 20:02:00'),(59,'u','2021-07-13 20:02:32'),(60,'u','2021-07-13 20:03:00'),(61,'u','2021-07-13 20:04:35'),(62,'u','2021-07-13 20:05:02'),(63,'u','2021-07-13 20:11:33'),(64,'u','2021-07-13 20:12:48'),(65,'u','2021-07-13 20:13:31'),(66,'u','2021-07-13 20:14:08'),(67,'u','2021-07-13 20:14:36'),(68,'u','2021-07-13 20:19:32'),(69,'u','2021-07-13 20:23:49'),(70,'u','2021-07-13 20:48:53'),(71,'u','2021-07-13 20:49:50'),(72,'u','2021-07-13 20:57:51'),(73,'u','2021-07-13 20:58:35'),(74,'u','2021-07-13 21:01:04'),(75,'u','2021-07-13 21:01:55'),(76,'u','2021-07-13 21:10:13'),(77,'u','2021-07-13 21:12:50'),(78,'u','2021-07-13 21:15:48'),(79,'u','2021-07-13 21:19:46'),(80,'u','2021-07-13 21:21:11'),(81,'u','2021-07-13 21:25:00'),(82,'u','2021-07-13 21:26:41'),(83,'u','2021-07-13 21:27:16'),(84,'u','2021-07-13 21:28:36'),(85,'u','2021-07-13 21:39:41'),(86,'u','2021-07-13 21:41:33'),(87,'u','2021-07-13 21:43:50'),(88,'u','2021-07-13 21:47:18'),(89,'u','2021-07-13 21:51:53'),(90,'u','2021-07-13 21:54:57'),(91,'u','2021-07-13 21:55:43'),(92,'u','2021-07-13 22:03:30'),(93,'u','2021-07-13 22:08:14'),(94,'u','2021-07-13 22:36:29'),(95,'u','2021-07-13 22:43:57'),(96,'u','2021-07-13 22:46:16'),(97,'u','2021-07-13 22:47:26'),(98,'u','2021-07-13 23:00:49'),(99,'u','2021-07-13 23:01:46'),(100,'u','2021-07-13 23:13:33'),(101,'u','2021-07-13 23:25:32'),(102,'u','2021-07-13 23:25:59'),(103,'u','2021-07-13 23:26:15'),(104,'u','2021-07-13 23:26:26'),(105,'u','2021-07-13 23:26:59'),(106,'u','2021-07-13 23:28:45'),(107,'u','2021-07-13 23:29:13'),(108,'u','2021-07-13 23:30:18'),(109,'u','2021-07-13 23:31:54'),(110,'u','2021-07-13 23:52:45'),(111,'u','2021-07-13 23:55:41'),(112,'u','2021-07-14 00:00:24'),(113,'u','2021-07-14 00:02:45'),(114,'u','2021-07-14 00:03:50'),(115,'u','2021-07-14 00:05:04'),(116,'u','2021-07-14 00:05:49'),(117,'u','2021-07-14 00:07:03'),(118,'u','2021-07-14 00:08:24'),(119,'u','2021-07-14 00:09:19'),(120,'u','2021-07-14 00:11:25'),(121,'u','2021-07-14 00:12:30'),(122,'u','2021-07-14 00:13:22'),(123,'u','2021-07-14 00:14:43'),(124,'u','2021-07-14 00:15:19'),(125,'u','2021-07-14 00:16:38'),(126,'u','2021-07-14 00:17:30'),(127,'u','2021-07-14 00:19:03'),(128,'u','2021-07-14 00:22:52'),(129,'u','2021-07-14 00:25:06'),(130,'u','2021-07-14 00:26:11'),(131,'u','2021-07-14 00:27:25'),(132,'u','2021-07-14 00:30:13'),(133,'u','2021-07-14 00:35:30'),(134,'u','2021-07-14 00:36:35'),(135,'u','2021-07-14 00:39:08'),(136,'u','2021-07-14 00:41:18'),(137,'u','2021-07-14 00:48:11'),(138,'u','2021-07-14 00:48:45'),(139,'u','2021-07-14 00:51:20'),(140,'u','2021-07-14 00:53:28'),(141,'u','2021-07-14 00:53:46'),(142,'u','2021-07-14 00:55:11'),(143,'u','2021-07-14 00:57:19'),(144,'u','2021-07-14 01:00:04'),(145,'u','2021-07-14 01:00:41'),(146,'u','2021-07-14 01:04:30'),(147,'u','2021-07-14 01:05:38'),(148,'u','2021-07-14 08:18:30'),(149,'u','2021-07-14 08:30:37'),(150,'u','2021-07-14 08:31:54'),(151,'u','2021-07-14 08:34:21'),(152,'u','2021-07-14 08:34:54'),(153,'u','2021-07-14 08:35:48'),(154,'u','2021-07-14 08:38:16'),(155,'u','2021-07-14 08:41:30'),(156,'u','2021-07-14 08:42:34'),(157,'u','2021-07-14 08:43:33'),(158,'u','2021-07-14 08:46:04'),(159,'u','2021-07-14 09:03:54'),(160,'u','2021-07-14 09:12:15'),(161,'u','2021-07-14 09:14:45'),(162,'u','2021-07-14 09:16:15'),(163,'u','2021-07-14 09:19:17'),(164,'u','2021-07-14 09:25:37'),(165,'u','2021-07-14 09:32:49'),(166,'u','2021-07-14 09:37:52'),(167,'u','2021-07-14 09:41:48'),(168,'u','2021-07-14 09:43:23'),(169,'u','2021-07-14 09:44:42'),(170,'u','2021-07-14 09:51:00'),(171,'u','2021-07-14 09:55:56'),(172,'u','2021-07-14 09:59:20'),(173,'u','2021-07-14 10:05:55'),(174,'u','2021-07-14 10:06:42'),(175,'u','2021-07-14 10:12:37'),(176,'u','2021-07-14 10:13:39'),(177,'u','2021-07-14 10:28:50'),(178,'u','2021-07-14 10:32:02'),(179,'u','2021-07-14 10:37:44'),(180,'u','2021-07-14 10:38:44'),(181,'u','2021-07-14 10:41:47'),(182,'u','2021-07-14 10:45:47'),(183,'u','2021-07-14 10:46:54'),(184,'u','2021-07-14 10:49:01'),(185,'u','2021-07-14 10:51:42'),(186,'u','2021-07-14 10:53:06'),(187,'u','2021-07-14 10:55:53'),(188,'u','2021-07-14 10:57:37'),(189,'u','2021-07-14 10:58:25'),(190,'u','2021-07-14 11:00:06'),(191,'u','2021-07-14 11:06:32'),(192,'u','2021-07-14 11:07:06'),(193,'u','2021-07-14 11:09:28'),(194,'u','2021-07-14 11:12:06'),(195,'u','2021-07-14 11:14:38'),(196,'uu','2021-07-14 11:16:26'),(197,'uu','2021-07-14 11:16:33'),(198,'u','2021-07-14 11:17:06'),(199,'uu','2021-07-14 11:21:56'),(200,'u','2021-07-14 11:22:20'),(201,'uu','2021-07-14 11:23:59'),(202,'u','2021-07-14 11:24:14'),(203,'u','2021-07-14 11:29:11'),(204,'u','2021-07-14 11:30:59'),(205,'u','2021-07-14 11:33:54'),(206,'uu','2021-07-14 11:34:09'),(207,'uu','2021-07-14 11:35:16'),(208,'u','2021-07-14 11:35:50'),(209,'uu','2021-07-14 11:36:53'),(210,'uu','2021-07-14 11:40:55'),(211,'u','2021-07-14 11:41:06'),(212,'u','2021-07-14 11:43:57'),(213,'uu','2021-07-14 11:44:16'),(214,'u','2021-07-14 11:45:58'),(215,'u','2021-07-14 11:57:10'),(216,'uu','2021-07-14 11:57:27'),(217,'uuu','2021-07-14 11:58:45'),(218,'uuu','2021-07-14 11:58:52'),(219,'u','2021-07-14 11:59:16'),(220,'uuu','2021-07-14 11:59:42'),(221,'uuu','2021-07-14 12:01:30'),(222,'uuu','2021-07-14 12:01:59'),(223,'uuu','2021-07-14 12:04:06'),(224,'uuu','2021-07-14 12:05:31'),(225,'uuu','2021-07-14 12:07:18'),(226,'u','2021-07-14 12:09:58'),(227,'u','2021-07-14 12:18:58'),(228,'u','2021-07-14 12:20:06'),(229,'uuu','2021-07-14 12:28:43'),(230,'u','2021-07-14 12:28:55'),(231,'u','2021-07-14 12:51:23'),(232,'u','2021-07-14 12:51:47'),(233,'u','2021-07-14 14:10:36'),(234,'u','2021-07-14 19:47:26'),(235,'u','2021-07-14 20:36:25'),(236,'u','2021-07-14 20:42:11'),(237,'u','2021-07-14 20:53:17'),(238,'u','2021-07-14 21:06:33'),(239,'u','2021-07-14 21:09:33'),(240,'u','2021-07-14 21:30:17'),(241,'u','2021-07-14 21:34:14'),(242,'u','2021-07-14 21:38:45'),(243,'u','2021-07-14 21:40:13'),(244,'u','2021-07-14 22:07:15'),(245,'u','2021-07-14 22:11:19'),(246,'u','2021-07-14 22:13:13'),(247,'u','2021-07-14 22:13:48'),(248,'u','2021-07-14 22:14:19'),(249,'u','2021-07-14 22:38:34'),(250,'uuu','2021-07-14 22:39:12'),(251,'u','2021-07-14 22:46:38'),(252,'u','2021-07-16 15:20:42'),(253,'u','2021-07-16 15:53:19'),(254,'u','2021-07-16 16:12:48'),(255,'u','2021-07-16 16:15:34'),(256,'u','2021-07-16 16:18:59'),(257,'u','2021-07-16 16:20:10'),(258,'u','2021-07-16 17:41:42'),(259,'u','2021-07-16 17:43:08'),(260,'u','2021-07-16 17:45:27'),(261,'u','2021-07-16 17:47:30'),(262,'u','2021-07-16 17:47:50'),(263,'u','2021-07-16 17:51:12'),(264,'u','2021-07-16 17:51:56'),(265,'u','2021-07-16 17:58:15'),(266,'u','2021-07-16 18:01:28'),(267,'u','2021-07-16 18:25:15'),(268,'u','2021-07-16 18:44:45'),(269,'u','2021-07-16 18:46:17'),(270,'u','2021-07-16 18:47:22'),(271,'u','2021-07-16 19:50:19'),(272,'u','2021-07-16 19:51:22'),(273,'uu','2021-07-16 20:12:10'),(274,'u','2021-07-16 20:12:47'),(275,'u','2021-07-16 20:23:45'),(276,'u','2021-07-16 20:36:35');
/*!40000 ALTER TABLE `logings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id_message` int NOT NULL AUTO_INCREMENT,
  `sender` varchar(20) NOT NULL,
  `reciver` varchar(20) NOT NULL,
  `voice_contained` int DEFAULT NULL,
  `text` varchar(256) DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id_message`),
  UNIQUE KEY `id_message_UNIQUE` (`id_message`),
  KEY `sender_idx` (`sender`),
  KEY `reciver_idx` (`reciver`),
  KEY `voice_idx` (`voice_contained`),
  CONSTRAINT `message_reciver_id` FOREIGN KEY (`reciver`) REFERENCES `user` (`userName`),
  CONSTRAINT `message_sender_id` FOREIGN KEY (`sender`) REFERENCES `user` (`userName`),
  CONSTRAINT `voice_contained_id` FOREIGN KEY (`voice_contained`) REFERENCES `voice` (`id_voice`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'farzad80','mr.bin',NULL,'hi mr.bin','2021-05-27 14:10:56'),(2,'farzad80','mr.bin',NULL,'hi mr.bin','2021-05-27 14:11:01'),(3,'farzad80','cheetoz',1,NULL,'2021-05-27 15:42:18'),(4,'farzad80','cheetoz',5,NULL,'2021-05-27 15:43:31'),(5,'farzad80','cheetoz',NULL,'hi !','2021-05-27 15:48:23'),(6,'farzad80','mr.bin',NULL,'hi !','2021-05-27 15:49:39'),(7,'farzad80','cheetoz',6,NULL,'2021-05-27 16:10:17'),(8,'farzad80','mr.bin',6,NULL,'2021-05-27 16:49:20'),(9,'farzad80','mr.bin',6,NULL,'2021-05-27 16:49:22'),(10,'cheetoz','mr.bin',6,NULL,'2021-05-27 16:49:32'),(11,'farzad80','mr.bin',6,NULL,'2021-05-27 16:49:59'),(12,'p1','mr.bin',6,NULL,'2021-05-27 16:51:31'),(13,'p2','mr.bin',6,NULL,'2021-05-27 16:51:34'),(14,'p3','mr.bin',6,NULL,'2021-05-27 16:51:35'),(15,'p4','mr.bin',6,NULL,'2021-05-27 16:51:37'),(16,'p5','mr.bin',6,NULL,'2021-05-27 16:51:38'),(17,'p5','mr.bin',6,NULL,'2021-05-27 16:51:40'),(18,'p1','mr.bin',6,NULL,'2021-05-27 16:53:21'),(19,'cheetoz','mr.bin',6,NULL,'2021-05-27 17:03:33'),(20,'u','mr.bin',NULL,'hiiiiiii','2021-07-13 19:20:57'),(21,'u','mr.bin',NULL,'hiiiiiii','2021-07-13 19:20:59'),(22,'u','mr.bin',NULL,'hiiiiiii','2021-07-13 19:21:01'),(24,'u','p2',NULL,'hiiiiiii','2021-07-13 19:28:04'),(25,'u','p3',NULL,'hiiiiiii','2021-07-13 19:28:09'),(27,'farzad','u',NULL,'hiiiiiii','2021-07-13 19:35:36'),(28,'farzad','u',NULL,'hiiiiiii','2021-07-13 19:35:40'),(29,'mr.bin','u',NULL,'hiiii','2021-07-13 19:45:47'),(30,'mr.bin','u',NULL,'hiiii','2021-07-13 19:45:49'),(36,'u','uu',NULL,'sssssssss','2021-07-14 11:26:29'),(37,'u','u',NULL,'sssssssss','2021-07-14 11:28:47'),(38,'u','uu',NULL,'sssssssss','2021-07-14 11:28:52'),(39,'u','uu',NULL,'sdkfsdkflsdkjf','2021-07-14 11:31:06'),(40,'u','uu',NULL,'sdkfsdkflsdkjf','2021-07-14 11:33:59'),(41,'uu','u',NULL,'sdkfsdkflsdkjf','2021-07-14 11:35:43'),(42,'u','uu',NULL,'sdkfsdkflsdkjf','2021-07-14 11:36:45'),(43,'uu','u',NULL,'sdkfsdkflsdkjf','2021-07-14 11:38:55'),(44,'uu','u',NULL,'ddddddddddddddddddddddd','2021-07-14 11:41:00'),(45,'uuu','u',NULL,'hi','2021-07-14 11:59:10'),(46,'u','uuu',NULL,'hi','2021-07-14 11:59:22'),(52,'uuu','u',8,NULL,'2021-07-14 12:28:48'),(53,'u','farzad',10,NULL,'2021-07-14 12:31:34'),(54,'u','farzad',49,NULL,'2021-07-14 14:01:03'),(55,'u','farzad',49,NULL,'2021-07-14 21:34:02'),(56,'u','uuu',NULL,'hiiii','2021-07-14 22:39:01'),(57,'u','farzad',NULL,'test','2021-07-16 18:55:05'),(58,'u','uu',56,NULL,'2021-07-16 20:12:04'),(59,'uu','u',57,NULL,'2021-07-16 20:12:41'),(60,'u','uu',8,NULL,'2021-07-16 20:13:07'),(61,'u','u',8,NULL,'2021-07-16 20:13:10'),(62,'u','u',8,NULL,'2021-07-16 20:13:19');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signuplist`
--

DROP TABLE IF EXISTS `signuplist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `signuplist` (
  `userName` varchar(20) NOT NULL,
  `signupdate` date NOT NULL,
  PRIMARY KEY (`userName`),
  UNIQUE KEY `userName_UNIQUE` (`userName`),
  CONSTRAINT `userName` FOREIGN KEY (`userName`) REFERENCES `user` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signuplist`
--

LOCK TABLES `signuplist` WRITE;
/*!40000 ALTER TABLE `signuplist` DISABLE KEYS */;
INSERT INTO `signuplist` VALUES ('farzad','2021-07-13'),('u','2021-07-13'),('uu','2021-07-13'),('uuu','2021-07-14');
/*!40000 ALTER TABLE `signuplist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userName` varchar(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `second_name` varchar(45) NOT NULL,
  `join_date` date NOT NULL,
  `birth_date` date NOT NULL,
  `password` varchar(128) NOT NULL,
  `biagrophy` varchar(64) DEFAULT 'i''m using ghanari.',
  PRIMARY KEY (`userName`),
  UNIQUE KEY `userName_UNIQUE` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('cheetoz','cheetoz','namaki','2021-05-26','2001-03-21','0806bc4ea05d99333c84a134c3bd5b3b48ceeb9f2681493526c11d3f1f27b398','saltyyyyyyyy'),('farzad','farzad','farzad','2021-07-13','2020-10-10','011cde0f3f914d8e5dff73ae1fe1f03e267fcb6ca23d6a12c44755de50191af4',''),('farzad80','farzad','Radnia','2021-05-26','2001-03-21','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','i\'m using ghanari.'),('mr.bin','bin','what was lastname?','2021-05-26','2001-03-21','159df808c55504ab433e7e8292c029918bef7dd44bc8126cfccfe8b74df48bdc','i am mr.bin'),('p1','cheetoz','namaki','2021-05-27','2001-03-21','0806bc4ea05d99333c84a134c3bd5b3b48ceeb9f2681493526c11d3f1f27b398','saltyyyyyyyy'),('p10','cheetoz','namaki','2021-05-27','2001-03-21','','saltyyyyyyyy'),('p2','cheetoz','namaki','2021-05-27','2001-03-21','0806bc4ea05d99333c84a134c3bd5b3b48ceeb9f2681493526c11d3f1f27b398','saltyyyyyyyy'),('p3','cheetoz','namaki','2021-05-27','2001-03-21','0806bc4ea05d99333c84a134c3bd5b3b48ceeb9f2681493526c11d3f1f27b398','saltyyyyyyyy'),('p4','cheetoz','namaki','2021-05-27','2001-03-21','0806bc4ea05d99333c84a134c3bd5b3b48ceeb9f2681493526c11d3f1f27b398','saltyyyyyyyy'),('p5','cheetoz','namaki','2021-05-27','2001-03-21','0806bc4ea05d99333c84a134c3bd5b3b48ceeb9f2681493526c11d3f1f27b398','saltyyyyyyyy'),('u','f','s','2021-07-13','2021-07-22','148de9c5a7a44d19e56cd9ae1a554bf67847afb0c58f6e12fa29ac7ddfca9940','b'),('uu','ff','ss','2021-07-13','2021-07-30','d53315bea08cec50d2591fcaf3b32dc5d289cdc6c16b7e8bed8c8e3f7ceaa34e','bb'),('uuu','a','a','2021-07-14','2021-07-09','c4289629b08bc4d61411aaa6d6d4a0c3c5f8c1e848e282976e29b6bed5aeedc7','a');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `add_to_signups` AFTER INSERT ON `user` FOR EACH ROW BEGIN
insert into signuplist(userName,signupdate)
values(NEW.userName, NEW.join_date);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `voice`
--

DROP TABLE IF EXISTS `voice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voice` (
  `id_voice` int NOT NULL AUTO_INCREMENT,
  `sender` varchar(20) NOT NULL,
  `date` datetime NOT NULL,
  `content` varchar(256) NOT NULL,
  PRIMARY KEY (`id_voice`),
  UNIQUE KEY `id_voice_UNIQUE` (`id_voice`),
  KEY `sender_idx` (`sender`),
  CONSTRAINT `voice_sender_id` FOREIGN KEY (`sender`) REFERENCES `user` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voice`
--

LOCK TABLES `voice` WRITE;
/*!40000 ALTER TABLE `voice` DISABLE KEYS */;
INSERT INTO `voice` VALUES (1,'farzad80','2021-05-26 20:42:15','yahahahahahaaaaaaaaaaaaa...'),(2,'farzad80','2021-05-26 20:42:32','yahahahahahaaaaaaaaaaaaa...'),(3,'cheetoz','2021-05-26 22:04:59','kheresh kheresh...'),(4,'mr.bin','2021-05-27 08:53:28','bin bin bin bin...'),(5,'mr.bin','2021-05-27 09:08:50','bin 2...'),(6,'mr.bin','2021-05-27 09:08:54','bin 3...'),(7,'mr.bin','2021-05-27 09:08:56','bin 4...'),(8,'cheetoz','2021-05-27 09:09:20','crips? or crisp?...'),(9,'cheetoz','2021-05-27 09:09:55','cheetoz of mazmaz?...'),(10,'cheetoz','2021-05-27 09:09:59','cheetoz or mazmaz?...'),(11,'farzad80','2021-05-27 09:10:13','maz maz '),(12,'farzad80','2021-05-27 10:39:46','heeeeeeeeeeey'),(16,'farzad80','2021-07-09 19:11:14','eyy khodaaa'),(17,'farzad80','2021-07-09 19:13:25','eyy khodaaa'),(18,'farzad80','2021-07-09 19:16:14','eyy khodaaa'),(19,'farzad80','2021-07-09 19:16:20','eyy khodaaa'),(20,'farzad80','2021-07-09 19:21:28','eyy khodaaa'),(21,'farzad80','2021-07-09 19:27:58','test #testt sdl'),(22,'farzad80','2021-07-09 19:29:12','test #testt sdl'),(23,'farzad80','2021-07-09 19:33:24','test #testt sdl'),(28,'farzad80','2021-07-09 19:39:47','test #testt sdl'),(30,'farzad80','2021-07-09 19:42:36','test #testt sdl'),(31,'farzad80','2021-07-09 19:44:11','test #testt sdl'),(32,'farzad80','2021-07-09 19:45:47','test #testt sdl'),(33,'farzad80','2021-07-09 19:47:18','test #testt sdl'),(34,'farzad80','2021-07-09 19:48:30','test #testt sdl'),(36,'farzad80','2021-07-09 19:52:58','test #testt sdl'),(37,'farzad80','2021-07-09 19:56:29','test #gotoh  #dd123 sdl'),(38,'u','2021-07-14 00:10:10','tsssssssssssss'),(39,'u','2021-07-14 00:10:17','tsssssssssssss'),(40,'u','2021-07-14 00:10:38','tsssssssssssss'),(41,'u','2021-07-14 00:10:59','tsssssssssssss'),(42,'u','2021-07-14 10:29:32','test #iamuu'),(43,'u','2021-07-14 10:32:16','it #works'),(44,'u','2021-07-14 10:34:01','tsssss'),(45,'u','2021-07-14 10:37:49','tresdfgsd'),(46,'u','2021-07-14 10:42:01','test #hawdi'),(47,'u','2021-07-14 10:53:10','sdfasdfasdfsd'),(48,'u','2021-07-14 10:53:37','sdfsdfsdfsdfsdf'),(49,'u','2021-07-14 10:56:04','fffffffffffff'),(50,'uu','2021-07-14 11:24:08','sfsdfsdfsdfsd'),(51,'u','2021-07-14 22:07:36','test the modal'),(52,'u','2021-07-14 22:08:01','test the modal'),(53,'u','2021-07-14 22:09:14','second test'),(54,'u','2021-07-14 22:14:36','test modal #testt'),(55,'u','2021-07-16 16:07:54','WHY?'),(56,'u','2021-07-16 20:11:43','hi this is the last #testt'),(57,'uu','2021-07-16 20:12:30','this is 57');
/*!40000 ALTER TABLE `voice` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `add_to_voicelist` AFTER INSERT ON `voice` FOR EACH ROW BEGIN
	insert into voicelist(voice_id, date, sender)
    values(NEW.id_voice, NEW.date, NEW.sender);
    
    set @x = 1;
    loop_label:  LOOP
		IF  @x > length(NEW.content) THEN 
			LEAVE  loop_label;
		END  IF;
		if substr(NEW.content, @x , 6) like '#_____' then
			call add_hashtag(substr(NEW.content, @x , 6), NEW.id_voice );
        END IF;
		SET  @x = @x + 1;
		
	END LOOP;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `voicelist`
--

DROP TABLE IF EXISTS `voicelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voicelist` (
  `voice_id` int NOT NULL,
  `date` date NOT NULL,
  `sender` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`voice_id`),
  KEY `sender_idx` (`sender`),
  CONSTRAINT `sender` FOREIGN KEY (`sender`) REFERENCES `user` (`userName`),
  CONSTRAINT `voice_id` FOREIGN KEY (`voice_id`) REFERENCES `voice` (`id_voice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voicelist`
--

LOCK TABLES `voicelist` WRITE;
/*!40000 ALTER TABLE `voicelist` DISABLE KEYS */;
INSERT INTO `voicelist` VALUES (20,'2021-07-09','farzad80'),(21,'2021-07-09','farzad80'),(22,'2021-07-09','farzad80'),(23,'2021-07-09','farzad80'),(28,'2021-07-09','farzad80'),(30,'2021-07-09','farzad80'),(31,'2021-07-09','farzad80'),(32,'2021-07-09','farzad80'),(33,'2021-07-09','farzad80'),(34,'2021-07-09','farzad80'),(36,'2021-07-09','farzad80'),(37,'2021-07-09','farzad80'),(38,'2021-07-14','u'),(39,'2021-07-14','u'),(40,'2021-07-14','u'),(41,'2021-07-14','u'),(42,'2021-07-14','u'),(43,'2021-07-14','u'),(44,'2021-07-14','u'),(45,'2021-07-14','u'),(46,'2021-07-14','u'),(47,'2021-07-14','u'),(48,'2021-07-14','u'),(49,'2021-07-14','u'),(50,'2021-07-14','uu'),(51,'2021-07-14','u'),(52,'2021-07-14','u'),(53,'2021-07-14','u'),(54,'2021-07-14','u'),(55,'2021-07-16','u'),(56,'2021-07-16','u'),(57,'2021-07-16','uu');
/*!40000 ALTER TABLE `voicelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ghanari'
--

--
-- Dumping routines for database 'ghanari'
--
/*!50003 DROP FUNCTION IF EXISTS `get_current_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_current_user`() RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	declare currentUser varchar(20);
	select user into currentUser 
		from logings
		where id_login in (select max(id_login) from logings);
	RETURN currentUser;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_hashtag` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_hashtag`( IN new_hashtag char(6), IN voice_id int)
BEGIN

	insert ignore into hashtag(hashtag_text)
	select new_hashtag
	where new_hashtag like '#_____';

	insert ignore into hashtaglist(hashtag,voice)
	values(new_hashtag,voice_id);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `block_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `block_user`(IN blocked varchar(20))
BEGIN
	insert ignore into blocklists (blocker,blocked)
	values (get_current_user(),blocked);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `follow_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `follow_user`(IN followed varchar(20))
BEGIN
	insert ignore into followerslist(follower,followed)
	values (get_current_user(),followed);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_blocked_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_blocked_list`()
BEGIN
	select blocked
	from blocklists
	where blocker = get_current_user();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_comments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_comments`(
IN in_voice_id int
)
BEGIN
	select distinct v1.id_voice, v1.sender , v1.content , v1.date
	from commentlist join voice as v1 on v1.id_voice = comment_voice
		join voice as v2 on v2.id_voice = source_voice
	where get_current_user() not in (select blocked from blocklists where blocker = v2.sender or blocker = v1.sender )
		and v2.id_voice = in_voice_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_count_like_on_voice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_count_like_on_voice`(
IN wanted_voice_id int
)
BEGIN
select count(user)
from likedlist as ll 
join voice on ll.liked_voice = id_voice
where get_current_user() not in (select blocked from blocklists where blocker = (select sender from voice where id_voice = ll.liked_voice ))
	and ll.liked_voice = wanted_voice_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_followed_voices` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_followed_voices`()
BEGIN
	select distinct  id_voice, sender , content , date
	from voice
	where sender in (select followed from followerslist where follower = get_current_user())
		and sender not in (select blocker from blocklists where blocked = get_current_user())
	order by date desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_follow_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_follow_list`()
BEGIN
	select followed
	from followerslist
	where follower = get_current_user();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_messages_one_direction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_messages_one_direction`(IN current_user_name varchar(20), IN other_user_name varchar(20))
BEGIN
with blocked_by_user(user) as (select blocked from blocklists where blocker = other_user_name)
select message.sender as message_sender , voice.sender as voice_sender , voice_contained  , text, message.date 
from message left join voice on message.voice_contained = voice.id_voice
where voice.sender not in (select user from blocked_by_user)
    and reciver = other_user_name
    and message.sender = current_user_name
order by date desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_messages_two_direction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_messages_two_direction`(IN p2 varchar(20))
BEGIN
with blocked_by_user(user) as (select blocked from blocklists where blocker = p2)
select distinct message.id_message, message.sender as message_sender ,message.reciver, message.text , voice_contained , message.date 
from message left join voice on message.voice_contained = voice.id_voice
where voice.sender not in (select user from blocked_by_user)
    and ( reciver = p2 and message.sender = get_current_user())
    or (message.sender = p2 and reciver = get_current_user())
order by date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_self_voice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_self_voice`()
BEGIN
	select id_voice, sender, content,date
	from voice
	where sender = get_current_user()
	order by date desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_top_ratings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_top_ratings`(IN count int)
BEGIN
	with valid_voices(user_liked,voice_id) as
	(select user , liked_voice from likedlist as ll where (select distinct sender from voice where id_voice = ll.liked_voice ) not in 
		(select blocker from blocklists where blocked = get_current_user()))
	select voice.id_voice,  voice.sender , content as voice_content , count(valid_voices.user_liked) as count_liked , voice.date 
    from valid_voices join voice on voice.id_voice = valid_voices.voice_id
    where true
	group by valid_voices.voice_id
	order by count_liked desc
    limit count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_logins` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user_logins`(IN current_user_name varchar(20))
BEGIN
	select date_login
	from logings 
	where user = current_user_name
	order by date_login desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_voices` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user_voices`(IN sender_user_name varchar(20))
BEGIN
	select distinct id_voice, sender , content , date
	from voice
	where sender = sender_user_name
		and get_current_user() not in (select blocked from blocklists where blocker = sender_user_name )
	order by date desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_voices_by_hashtag` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_voices_by_hashtag`(IN hashtag_to_search char(6))
BEGIN
	select distinct id_voice, sender,content, date
	from hashtaglist join voice  on voice.id_voice = hashtaglist.voice
	where hashTag = hashtag_to_search and get_current_user() not in (select blocked from blocklists where blocker = sender )
	order by date desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `like_voice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `like_voice`( IN liked_voice_id int)
BEGIN
insert ignore into likedlist(user,liked_voice)
select get_current_user(), liked_voice_id
where  get_current_user() not in (select blocked from blocklists 
						where blocker = (select sender from voice where id_voice = liked_voice_id ) );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `login`(IN user_name varchar(20) , IN input_password varchar(128) )
BEGIN
insert ignore into logings(user,date_login)
select user.userName , sysdate()
from user
where user.userName = user_name and user.password = sha2(input_password,256);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `make_voice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `make_voice`(IN voice_content varchar(256), out voice_id int)
BEGIN
	insert into voice(sender,date,content)
	values( get_current_user() ,sysdate(), voice_content);
    
      -- for finding the voice_id
    select max(id_voice) into voice_id
    from voice
    where voice.sender = get_current_user();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_procedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_procedure`()
BEGIN
	select blocked
	from blocklists
	where blocker = get_current_user();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `send_text_message` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `send_text_message`(
IN reciver_username varchar(20),
IN content varchar(256))
BEGIN
	insert ignore into message(sender,reciver,text,date)
	select get_current_user(), reciver_username, content ,sysdate()
	where get_current_user() not in (select blocked from blocklists where blocker = reciver_username);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `send_voice_message` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `send_voice_message`(IN reciver_userName varchar(20) , IN contained_voice_id int)
BEGIN
	insert ignore into message(sender,reciver,text,voice_contained,date)
	select get_current_user(), reciver_userName ,null,contained_voice_id ,sysdate()
	where get_current_user() not in (select blocked from blocklists where blocker = reciver_userName)
		and get_current_user() not in
		(select blocked from blocklists where blocker = (select sender from voice where id_voice = contained_voice_id ));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_all_chats` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_all_chats`()
BEGIN
	select reciver from (select distinct sender , max(date) as last_message
	from message
	where reciver = get_current_user() or sender = get_current_user()
	group by sender
	order by last_message desc) as temp;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_all_senders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_all_senders`()
BEGIN
 select sender from (select distinct sender , max(date) as last_message
	from message
	where reciver = get_current_user()
	group by sender
	order by last_message desc) as temp;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `singup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `singup`(
IN user_name varchar(20),
IN firstname varchar(20),
IN secondname varchar(45),
IN birthday Date,
IN password_input varchar(128),
IN biagrophy_input varchar(64)
)
BEGIN
	insert ignore into user(userName,first_name,second_name,join_date,birth_date,password,biagrophy)
	values (user_name ,firstname , secondname ,current_date(), birthday ,SHA2(password_input ,256),biagrophy_input);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `submit_comment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `submit_comment`(IN source_voice_id int , IN content varchar(256))
BEGIN

	call ghanari.make_voice( content, @new_voice_id );
	insert into commentlist(comment_voice,source_voice)
	select v1.id_voice as source_voice , v2.id_voice as comment_voice
	from voice as v1, voice as v2 
	where v1.sender not in (select blocked from blocklists where blocker = v2.sender )
			and v1.id_voice = @new_voice_id and v2.id_voice = source_voice_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `unblock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `unblock`(IN unblocked_user_name varchar(20))
BEGIN
	delete from blocklists
	where blocker = get_current_user() and blocked = unblocked_user_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `unfollow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `unfollow`( unfollowed_user_name varchar(20))
BEGIN
	delete from followerslist
	where followed = unfollowed_user_name and follower = get_current_user();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `userlist_of_liked` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `userlist_of_liked`(IN likedVoice_id int)
BEGIN
select liked_voice,  user as username 
from likedlist
where liked_voice = likedVoice_id
	and get_current_user() not in (select blocked from blocklists where blocker = (select sender from voice where id_voice = likedVoice_id) or blocker = user) ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-16 20:45:27
