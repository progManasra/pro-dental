-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: prodental
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Current Database: `prodental`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `prodental` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `prodental`;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doctor_id` int DEFAULT NULL,
  `patient_id` int DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `status` enum('BOOKED','COMPLETED','NO_SHOW','CANCELLED') NOT NULL DEFAULT 'BOOKED',
  `duration_minutes` int NOT NULL DEFAULT '30',
  `reason` varchar(255) DEFAULT NULL,
  `doctor_note` text,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `appointments_ibfk_1` (`doctor_id`),
  KEY `appointments_ibfk_2` (`patient_id`),
  CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (1,2,3,'2026-02-07 19:58:13','BOOKED',30,NULL,NULL,'2026-02-07 22:25:22'),(2,2,3,'2026-02-08 09:00:00','BOOKED',30,'Checkup',NULL,'2026-02-07 22:26:46'),(3,2,3,'2026-02-08 10:20:00','NO_SHOW',30,'Checkup','333','2026-02-07 23:58:53'),(4,2,3,'2026-02-08 11:40:00','NO_SHOW',30,'Checkup','www','2026-02-07 22:54:50'),(5,2,3,'2026-02-08 11:40:00','CANCELLED',30,'Checkup',NULL,'2026-02-07 22:27:11'),(6,2,3,'2026-02-08 12:20:00','COMPLETED',30,'Checkup','qqq','2026-02-07 22:54:44');
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_day_overrides`
--

DROP TABLE IF EXISTS `doctor_day_overrides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_day_overrides` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doctor_id` int DEFAULT NULL,
  `day_date` date DEFAULT NULL,
  `is_off` tinyint(1) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_day_overrides`
--

LOCK TABLES `doctor_day_overrides` WRITE;
/*!40000 ALTER TABLE `doctor_day_overrides` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor_day_overrides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_weekly_shifts`
--

DROP TABLE IF EXISTS `doctor_weekly_shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_weekly_shifts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doctor_id` int DEFAULT NULL,
  `weekday` int DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `slot_minutes` int NOT NULL DEFAULT '30',
  PRIMARY KEY (`id`),
  KEY `doctor_weekly_shifts_ibfk_1` (`doctor_id`),
  CONSTRAINT `doctor_weekly_shifts_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_weekly_shifts`
--

LOCK TABLES `doctor_weekly_shifts` WRITE;
/*!40000 ALTER TABLE `doctor_weekly_shifts` DISABLE KEYS */;
INSERT INTO `doctor_weekly_shifts` VALUES (1,2,1,'09:00:00','13:00:00',30),(2,2,2,'09:00:00','13:00:00',30),(3,2,5,'09:00:00','13:00:00',40),(4,2,0,'09:00:00','13:00:00',40);
/*!40000 ALTER TABLE `doctor_weekly_shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `user_id` int NOT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (2,'1234');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `user_id` int NOT NULL,
  `dob` date DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (3,'2006-01-01'),(5,'2006-01-23');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `role` enum('ADMIN','DOCTOR','PATIENT') DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'Doctor 1','dr@prodental.local','DOCTOR','$2b$10$m.tAm1LdyQFNlSg8AuxqI.dYlDVKUdt7J35KO2DyJZm1tlw5BZ/Re'),(3,'Patient 1','p@prodental.local','PATIENT','$2b$10$efiu38OeTB.1USJuglMU/edMy2FAEqzE2.IRV2s4g7oWKQSOmouZ.'),(4,'Admin','admin@prodental.local','ADMIN','$2b$10$QQhx4zBWJW7917O9d9Pd4uxqKZo.fexzlA7dT4/gRzWl3aymnB76K'),(5,'test','test@test.com','PATIENT','$2b$10$Rx5BhDTsqvmmQLcRrJ.ZzOfr1t/i4A.dEXNP4IINfR5Eh99YvOPGG');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'prodental'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-08  2:58:48

