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
-- Table structure for table `lms_quiz`
--

DROP TABLE IF EXISTS `lms_quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lms_quiz` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quiz_id` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `total_questions` int NOT NULL,
  `difficulty` varchar(50) NOT NULL,
  `module_id` bigint DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lms_quiz_module_id_d75cef7d_fk_lms_module_id` (`module_id`),
  CONSTRAINT `lms_quiz_module_id_d75cef7d_fk_lms_module_id` FOREIGN KEY (`module_id`) REFERENCES `lms_module` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lms_quiz`
--

LOCK TABLES `lms_quiz` WRITE;
/*!40000 ALTER TABLE `lms_quiz` DISABLE KEYS */;
INSERT INTO `lms_quiz` VALUES (1,'','BM101',20,'',1,'2025-04-21 05:19:20.813492','2025-04-21 05:19:20.813492'),(4,'','PB100',20,'',6,'2025-04-21 07:04:13.370249','2025-04-21 07:04:13.370249'),(5,'','Quiz BM101',20,'',1,'2025-04-24 06:19:48.447924','2025-04-24 06:19:48.447924'),(6,'','Quiz PB100',20,'',6,'2025-04-24 06:29:07.883477','2025-04-24 06:29:07.884477');
/*!40000 ALTER TABLE `lms_quiz` ENABLE KEYS */;
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
