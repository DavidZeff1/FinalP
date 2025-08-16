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
-- Table structure for table `flash_card_set`
--

DROP TABLE IF EXISTS `flash_card_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flash_card_set` (
  `idflash_card_set` int NOT NULL AUTO_INCREMENT,
  `course` varchar(100) DEFAULT NULL,
  `main_topic` varchar(255) NOT NULL,
  `subtopic_1` varchar(255) DEFAULT NULL,
  `importance_1` tinyint unsigned DEFAULT NULL,
  `subtopic_2` varchar(255) DEFAULT NULL,
  `importance_2` tinyint unsigned DEFAULT NULL,
  `subtopic_3` varchar(255) DEFAULT NULL,
  `importance_3` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`idflash_card_set`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flash_card_set`
--

LOCK TABLES `flash_card_set` WRITE;
/*!40000 ALTER TABLE `flash_card_set` DISABLE KEYS */;
INSERT INTO `flash_card_set` VALUES (156,'Biology','Biology','Unifying themes of biology',10,'Levels of biological organization',7,'History of biology',8),(157,'Biology','The scientific study of life','Cell theory',8,'Evolution',9,'History of biology',7),(158,'Biology','Biology overview','Cell theory',9,'Evolution',9,'Molecular genetics',8),(159,'Biology','Biology','Cell Theory',9,'Evolution',10,'Energy Processing',7),(160,'Biology','The scientific study of life and its history','Cell theory',8,'Evolutionary theory',9,'Molecular genetics',7),(161,'Biology','Biology','Unifying themes in biology',10,'History of biology',8,'Cell theory',7),(162,'Biology','Biology is the scientific study of life','All organisms are composed of at least one cell that processes hereditary information encoded in genes',9,'Evolution explains the unity and diversity of life',10,'Energy processing allows organisms to move, grow, and reproduce',8),(163,'Biology','Biology is the scientific study of life','Cellular basis of life',10,'Evolution',10,'Energy processing',8),(164,'Introduction to Biology','Biology','Cell Theory',9,'Evolutionary Theory',10,'Molecular Genetics',8),(165,'Biology','Biology','Cell theory',9,'Evolution',10,'Molecular genetics',8),(166,'Biology','Scientific study of life','Cell theory',8,'Evolution',10,'Molecular genetics',7),(167,'Biology','Biology','Cell Theory',10,'Evolution',10,'Molecular Genetics',8),(168,'General Biology','Chemical Foundations of Life','Structure and Behavior of Atoms',9,'Chemical Properties of Water',8,'Origins of the Universe and Molecular Evolution',6),(169,'General Chemistry','Atomic Structure and Radioactivity','Isotopes',9,'Radioactive Decay and Half-life',8,'Electron Orbitals and Ion Formation',7);
/*!40000 ALTER TABLE `flash_card_set` ENABLE KEYS */;
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
