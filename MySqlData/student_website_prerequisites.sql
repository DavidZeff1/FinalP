-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: student_website
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `prerequisites`
--

DROP TABLE IF EXISTS `prerequisites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prerequisites` (
  `topic_id` int NOT NULL,
  `prereq_topic_id` int NOT NULL,
  PRIMARY KEY (`topic_id`,`prereq_topic_id`),
  KEY `prereq_topic_id` (`prereq_topic_id`),
  CONSTRAINT `prerequisites_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `course_syllabus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prerequisites_ibfk_2` FOREIGN KEY (`prereq_topic_id`) REFERENCES `course_syllabus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prerequisites`
--

LOCK TABLES `prerequisites` WRITE;
/*!40000 ALTER TABLE `prerequisites` DISABLE KEYS */;
INSERT INTO `prerequisites` VALUES (6,14),(15,14),(27,14),(32,14),(64,14),(81,14),(6,15),(14,15),(27,15),(64,15),(81,15),(19,22),(70,26),(6,27),(31,27),(32,27),(64,27),(14,29),(15,29),(27,29),(31,29),(32,29),(81,29),(6,31),(14,31),(15,31),(27,31),(32,31),(64,31),(81,31),(84,31),(71,66),(74,66),(80,66),(5,67),(63,67),(66,67),(74,67),(79,67),(5,68),(63,68),(66,68),(70,68),(74,68),(79,68),(69,70),(71,70),(74,70),(75,70),(76,70),(5,72),(63,72),(66,72),(70,72),(5,73),(63,73),(66,73),(69,73),(74,73),(77,73),(78,73),(79,73),(80,73),(70,74),(4,75),(5,75),(63,75),(76,75),(6,79),(64,79),(77,79),(78,79),(80,79),(86,79),(86,80),(85,84),(84,85),(4,86),(26,86),(82,86),(83,86),(85,86);
/*!40000 ALTER TABLE `prerequisites` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-29 10:07:12
