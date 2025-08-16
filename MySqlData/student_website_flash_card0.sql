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
-- Table structure for table `flash_card`
--

DROP TABLE IF EXISTS `flash_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flash_card` (
  `idflash_card` int NOT NULL AUTO_INCREMENT,
  `concept` varchar(255) DEFAULT NULL,
  `summary` text,
  `idflash_card_set` int NOT NULL,
  `syllabus_id` int NOT NULL,
  PRIMARY KEY (`idflash_card`),
  KEY `idflash_card_set` (`idflash_card_set`),
  KEY `syllabus_id` (`syllabus_id`),
  CONSTRAINT `flash_card_ibfk_1` FOREIGN KEY (`idflash_card_set`) REFERENCES `flash_card_set` (`idflash_card_set`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `flash_card_ibfk_2` FOREIGN KEY (`syllabus_id`) REFERENCES `course_syllabus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flash_card`
--

LOCK TABLES `flash_card` WRITE;
/*!40000 ALTER TABLE `flash_card` DISABLE KEYS */;
INSERT INTO `flash_card` VALUES (1,'What is a variable?','A named storage location for a value.',1,1),(2,'Explain Big-O notation.','A measure of algorithmic time complexity.',1,6),(3,'What is a DataFrame?','A 2D labeled data structure in Pandas.',2,10),(4,'Define supervised learning.','Training models on labeled data.',2,14),(5,'What does CSS Flexbox do?','Arranges items in a container along one axis.',3,18),(6,'How to create a React component?','Define a function or class returning JSX.',3,21),(7,'What is a search algorithm?','A method to traverse problem spaces to find solutions.',4,26),(8,'Explain backpropagation.','Error-gradient method for training neural networks.',4,29),(34,'What is a linked list?','A linked list is a series of nodes where each node points to the next node and the last node points to null.',7,66),(35,'What pointers are maintained in DSA linked list implementations?','They maintain head and tail pointers to allow constant time insertion at both ends.',7,66),(36,'Why do we maintain head and tail pointers?','To enable O(1) insertion at the head or tail of the list.',7,66),(37,'What is the time complexity of insertion in a DSA linked list?','Insertion at the head or tail is O(1).',7,66),(38,'What is the time complexity of deletion in a linked list?','Deletion is O(n) because it may require traversing the list to find the node to remove.',7,66),(39,'What is the time complexity of searching in a linked list?','Searching is O(n) since it may require scanning through all nodes.',7,66),(40,'What is random insertion in a singly linked list?','Insertion before a node that is neither at the head nor tail of the list.',7,66),(41,'Why is random insertion O(n)?','Because we must traverse the list to find the predecessor of the target node, leading to linear time.',7,66),(42,'What are two key advantages of linked lists?','They resize dynamically without copy penalties and support O(1) insertion at the ends.',7,66),(43,'What constitutes a node in a singly linked list?','A value and a reference to the next node in the list.',7,66);
/*!40000 ALTER TABLE `flash_card` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-29 10:07:13
