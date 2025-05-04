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
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-04-10 10:14:57.123878'),(2,'auth','0001_initial','2025-04-10 10:14:57.538085'),(3,'admin','0001_initial','2025-04-10 10:14:57.623360'),(4,'admin','0002_logentry_remove_auto_add','2025-04-10 10:14:57.639206'),(5,'admin','0003_logentry_add_action_flag_choices','2025-04-10 10:14:57.651838'),(6,'contenttypes','0002_remove_content_type_name','2025-04-10 10:14:57.737372'),(7,'auth','0002_alter_permission_name_max_length','2025-04-10 10:14:57.773395'),(8,'auth','0003_alter_user_email_max_length','2025-04-10 10:14:57.795149'),(9,'auth','0004_alter_user_username_opts','2025-04-10 10:14:57.805728'),(10,'auth','0005_alter_user_last_login_null','2025-04-10 10:14:57.844502'),(11,'auth','0006_require_contenttypes_0002','2025-04-10 10:14:57.844502'),(12,'auth','0007_alter_validators_add_error_messages','2025-04-10 10:14:57.856597'),(13,'auth','0008_alter_user_username_max_length','2025-04-10 10:14:57.907085'),(14,'auth','0009_alter_user_last_name_max_length','2025-04-10 10:14:57.958584'),(15,'auth','0010_alter_group_name_max_length','2025-04-10 10:14:57.975427'),(16,'auth','0011_update_proxy_permissions','2025-04-10 10:14:57.978151'),(17,'auth','0012_alter_user_first_name_max_length','2025-04-10 10:14:58.036579'),(18,'lms','0001_initial','2025-04-10 10:14:58.584709'),(19,'sessions','0001_initial','2025-04-10 10:14:58.622872'),(20,'lms','0002_remove_quizresult_set_remove_quizresult_user_id_and_more','2025-04-21 05:17:26.358390'),(21,'lms','0003_quizresult_set_id','2025-04-21 05:17:26.375081'),(22,'lms','0004_quizresult_cluster_quizresult_percentage_and_more','2025-04-21 05:36:58.753178'),(23,'lms','0005_alter_quizresult_set_id_alter_quizresult_user','2025-04-21 05:54:59.381044'),(24,'lms','0006_alter_course_course_id_alter_course_title','2025-04-21 06:50:46.144302'),(25,'lms','0007_alter_module_module_id','2025-04-21 07:03:06.042738'),(26,'lms','0008_alter_quiz_quiz_id','2025-04-21 07:04:04.349638'),(27,'lms','0003_alter_quiz_total_questions','2025-04-22 03:29:25.799029'),(28,'lms','0009_merge_20250422_1128','2025-04-22 03:29:25.802977'),(29,'lms','0010_userprofile_full_name_userprofile_login_id_and_more','2025-04-22 16:49:17.926767');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
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
