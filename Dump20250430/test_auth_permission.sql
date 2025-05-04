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
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add batch',7,'add_batch'),(26,'Can change batch',7,'change_batch'),(27,'Can delete batch',7,'delete_batch'),(28,'Can view batch',7,'view_batch'),(29,'Can add category',8,'add_category'),(30,'Can change category',8,'change_category'),(31,'Can delete category',8,'delete_category'),(32,'Can view category',8,'view_category'),(33,'Can add language',9,'add_language'),(34,'Can change language',9,'change_language'),(35,'Can delete language',9,'delete_language'),(36,'Can view language',9,'view_language'),(37,'Can add person',10,'add_person'),(38,'Can change person',10,'change_person'),(39,'Can delete person',10,'delete_person'),(40,'Can view person',10,'view_person'),(41,'Can add question bank',11,'add_questionbank'),(42,'Can change question bank',11,'change_questionbank'),(43,'Can delete question bank',11,'delete_questionbank'),(44,'Can view question bank',11,'view_questionbank'),(45,'Can add quiz question',12,'add_quizquestion'),(46,'Can change quiz question',12,'change_quizquestion'),(47,'Can delete quiz question',12,'delete_quizquestion'),(48,'Can view quiz question',12,'view_quizquestion'),(49,'Can add stem',13,'add_stem'),(50,'Can change stem',13,'change_stem'),(51,'Can delete stem',13,'delete_stem'),(52,'Can view stem',13,'view_stem'),(53,'Can add course',14,'add_course'),(54,'Can change course',14,'change_course'),(55,'Can delete course',14,'delete_course'),(56,'Can view course',14,'view_course'),(57,'Can add module',15,'add_module'),(58,'Can change module',15,'change_module'),(59,'Can delete module',15,'delete_module'),(60,'Can view module',15,'view_module'),(61,'Can add quiz',16,'add_quiz'),(62,'Can change quiz',16,'change_quiz'),(63,'Can delete quiz',16,'delete_quiz'),(64,'Can view quiz',16,'view_quiz'),(65,'Can add quiz set',17,'add_quizset'),(66,'Can change quiz set',17,'change_quizset'),(67,'Can delete quiz set',17,'delete_quizset'),(68,'Can view quiz set',17,'view_quizset'),(69,'Can add quiz result',18,'add_quizresult'),(70,'Can change quiz result',18,'change_quizresult'),(71,'Can delete quiz result',18,'delete_quizresult'),(72,'Can view quiz result',18,'view_quizresult'),(73,'Can add user profile',19,'add_userprofile'),(74,'Can change user profile',19,'change_userprofile'),(75,'Can delete user profile',19,'delete_userprofile'),(76,'Can view user profile',19,'view_userprofile'),(77,'Can add performance',20,'add_performance'),(78,'Can change performance',20,'change_performance'),(79,'Can delete performance',20,'delete_performance'),(80,'Can view performance',20,'view_performance');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-30 13:57:26
