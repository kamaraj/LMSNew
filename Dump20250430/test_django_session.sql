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
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('5bmuawjnbhovd3f6hfeph2alrec0xvwp','.eJxVjDsOwjAQRO_iGll2_Kekzxms9e6CAyiR4qRC3B0spYBuNO_NvESGfat5b7zmicRZaCVOv2UBfPDcCd1hvi0Sl3lbpyK7Ig_a5LgQPy-H-3dQodW-1h5MQuONI7IhUgoQEnpUxg0uuhBYc_wG8EYPBOiZLWtlC18ZrRPvD_FMN-U:1u9c6B:K16NzL4vZg7AbL2d-irpUVOSQXdIRMc9BKwL4F3Jp5I','2025-05-13 03:57:35.050666'),('9skl6sqcgv039h81l96zg2cnk3pei7ae','.eJxVjMsOwiAQRf-FtSGFMjxcuvcbyMwAUjU0Ke3K-O_apAvd3nPOfYmI21rj1vMSpyTOAsTpdyPkR247SHdst1ny3NZlIrkr8qBdXueUn5fD_Tuo2Ou3pqAxB2eDQRU0s_bZFjsSQ_HBDpCYPBeXlDVkPKIqY8mggwNSBmAQ7w_wJDfs:1u7Q02:sJo4gVifi8VCes_zdButVLU9XkmbAPOvX5gA_SvbKz0','2025-05-07 02:38:10.666955'),('k8qqolqrogqykc1xoecoirqh6pvrf89i','.eJxVjDsOwjAQBe_iGln4F28o6XMGy7tr4wCypTipEHeHSCmgfTPzXiLEbS1h62kJM4uLAHH63TDSI9Ud8D3WW5PU6rrMKHdFHrTLqXF6Xg_376DEXr61H2lgcJkyZpcVMBp20RA5sHA25LXx6ClrBFKjAvRJD-xsslab7JJ4fwAFEzhQ:1u7pET:5Q2O0o7ehMvtqbAqP7U8DWjTDbSAYBiHWr6gYL8UTCo','2025-05-08 05:34:45.334249'),('o73sc5tf40ngjw1kbp73wjm5hsac20rm','.eJxVjDsOwjAQRO_iGll2_Kekzxms9e6CAyiR4qRC3B0spYBuNO_NvESGfat5b7zmicRZaCVOv2UBfPDcCd1hvi0Sl3lbpyK7Ig_a5LgQPy-H-3dQodW-1h5MQuONI7IhUgoQEnpUxg0uuhBYc_wG8EYPBOiZLWtlC18ZrRPvD_FMN-U:1u9y2u:9rw_PF8G0v3MIIhXLEW7euhWW9vRWL0kR-sARBkQw40','2025-05-14 03:23:40.206550'),('owfa3nszxwi68clkex0yxibrxukbm2uw','e30:1u9eDC:dwuG9yfKbeuJnmwz5Hs6brQxg4S0nmjNzwVCL5xcCg4','2025-05-13 06:12:58.818528'),('rgwk90dicpb105nb3g2z9ohxe4kszwg6','.eJxVjEEOwiAQRe_C2hAGaCku3fcMhGEGqRqalHZlvLtt0oVu33v_v0WI21rC1ngJE4mrABCXX4gxPbkehh6x3meZ5rouE8ojkadtcpyJX7ez_TsosZV9bbwlsKR1ZAKHKlOPmlPs2KBlrxE8Z4V6UJ1RO4SUNWTXm0QuDZ7F5wsZFjiF:1u9dxX:CeEh3yk0T7qfDfokPTXEwoopxNOhBTr6illja1jDj1o','2025-05-13 05:56:47.644327');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
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
