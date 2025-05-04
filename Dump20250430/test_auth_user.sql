-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$zE1NY2dLpvhIIpzPz9nY1t$eRfJTDU0aRZlfR2If/5XO8W/sHZj49hGpw4/ljAAdPs=','2025-04-29 05:36:46.213954',1,'superuser','','','superuser@test.com',1,1,'2025-04-10 10:16:27.073497'),(2,'pbkdf2_sha256$870000$RJwEtChAG0WkDIvIdoiL69$conDYNsPj+GazhoFynBru6LuQHPcMPtYhBslvsmdZY4=',NULL,0,'Noora','','','',0,1,'2025-04-14 07:26:18.876228'),(4,'pbkdf2_sha256$870000$J9YjzQ5G9IN4w9EqTyxt57$Rp5w+5lGGpr6yg4VEjIoNecxBFIV2yg66+vrupKNQMs=','2025-04-29 03:52:49.203255',0,'Azlida','','','',0,1,'2025-04-14 07:35:29.867002'),(5,'pbkdf2_sha256$870000$MdVRUpIy6dbu5NtyOpEz6c$AKNnm9Jk6Bfh6XVvBkw8tccInhQTxeR7w3iqQ3OhAU4=','2025-04-23 02:38:10.666955',0,'user1','','','user1@example.com',0,1,'2025-04-22 03:21:16.078121'),(6,'pbkdf2_sha256$870000$xmLrcbjU6ZJeKpMOwVDgYH$OcCVbJi5aP8eRTjOqwa+e9fcCUkwCKjL5DOfA5thh8Q=','2025-04-23 06:25:06.360850',0,'user2','','','',0,1,'2025-04-23 06:24:52.995847'),(7,'pbkdf2_sha256$870000$kP6Q8SDssfgyEBnvYE9nF8$42uWmkT/VCxJEdUynNQ3B0WsJPZZF+gLkHKnVaV1hjo=','2025-04-24 04:59:32.954776',0,'Alias','','','',0,1,'2025-04-23 18:01:54.881714'),(8,'pbkdf2_sha256$870000$1W99LtOkyle7nQa3avxc56$LjlO+tczv6+k3w7cLfuam8bBczrwSq3jzw0ZEX2jg2Q=','2025-04-24 05:40:57.331246',1,'bizuser1','','','bizuser1@hcl.com',1,1,'2025-04-24 05:16:23.086108'),(9,'pbkdf2_sha256$870000$rIGKeGh6SJ8odM8eRaLDsc$n3bzROdF4mdtoi1rDGzgX7lWe/crQsWRBiKLcETtsGU=','2025-04-24 05:48:14.348513',0,'bizuser2@gmail.com','','','',0,1,'2025-04-24 05:46:44.942803'),(10,'pbkdf2_sha256$870000$9olTlW9YzsERRBeglS3UaS$dSNk8nF7f+MCGckgd0Ci4d2X8145RgVWACNrU4wMouQ=','2025-04-30 03:23:40.153011',0,'user3','','','',0,1,'2025-04-24 06:13:55.155728'),(11,'pbkdf2_sha256$870000$3X0QiLTJLU0qqsa0A6yrtx$1ZJ5PegCS3WYmkM8z/3J0nsCkFPZYbd499teTEZDw5M=','2025-04-29 06:12:58.841458',0,'Test1234','','','',0,1,'2025-04-29 05:56:16.124265');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-30 13:57:25
