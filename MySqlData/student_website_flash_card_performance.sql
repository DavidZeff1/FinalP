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
-- Table structure for table `flash_card_performance`
--

DROP TABLE IF EXISTS `flash_card_performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flash_card_performance` (
  `idflash_card_performance` int NOT NULL AUTO_INCREMENT,
  `flash_card_id` int DEFAULT NULL,
  `outcome` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idflash_card_performance`),
  KEY `flash_card_id` (`flash_card_id`),
  CONSTRAINT `flash_card_performance_ibfk_1` FOREIGN KEY (`flash_card_id`) REFERENCES `flash_card` (`idflash_card`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flash_card_performance`
--

LOCK TABLES `flash_card_performance` WRITE;
/*!40000 ALTER TABLE `flash_card_performance` DISABLE KEYS */;
INSERT INTO `flash_card_performance` VALUES (1,416,1),(2,417,1),(3,418,1),(4,419,1),(5,420,1),(6,421,1),(7,422,1),(8,423,1),(9,424,1),(10,425,1),(11,426,1),(12,427,1),(13,428,1),(14,429,1),(15,430,1),(16,431,1),(17,432,1),(18,433,1),(19,434,1),(20,435,1),(21,436,1),(22,437,0),(23,438,0),(24,439,0),(25,440,0),(26,441,0),(27,442,0),(28,443,1),(29,444,1),(30,445,1),(31,446,1),(32,447,1),(33,448,1),(34,449,1),(35,450,0),(36,451,1),(37,452,1),(38,453,1),(39,454,1),(40,455,0),(41,456,0),(42,475,1),(43,476,1),(44,477,0),(45,478,0),(46,479,1),(47,480,1),(48,481,0),(49,482,0),(50,483,1),(51,484,1),(52,485,0),(53,486,1),(54,487,0),(55,488,1),(56,489,1),(57,490,0),(58,491,1),(59,492,1),(60,493,0),(61,494,0),(62,495,0),(63,496,1),(64,497,0);
/*!40000 ALTER TABLE `flash_card_performance` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-18 20:07:05
