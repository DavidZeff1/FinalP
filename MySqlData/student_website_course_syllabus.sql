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
-- Table structure for table `course_syllabus`
--

DROP TABLE IF EXISTS `course_syllabus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_syllabus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `week_number` int NOT NULL,
  `topic` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `course_syllabus_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_syllabus`
--

LOCK TABLES `course_syllabus` WRITE;
/*!40000 ALTER TABLE `course_syllabus` DISABLE KEYS */;
INSERT INTO `course_syllabus` VALUES (1,1,1,'Variables and Data Types'),(2,1,2,'Control Structures'),(3,1,3,'Functions and Scope'),(4,1,4,'OOP Principles'),(5,1,5,'Basic Data Structures'),(6,1,6,'Algorithm Analysis'),(7,1,7,'Memory Management'),(8,1,8,'File I/O'),(9,2,1,'Probability Fundamentals'),(10,2,2,'Pandas for Data Manipulation'),(11,2,3,'Data Visualization'),(12,2,4,'Statistical Modeling'),(13,2,5,'Intro to ML'),(14,2,6,'Supervised Learning'),(15,2,7,'Unsupervised Learning'),(16,2,8,'Model Evaluation'),(17,3,1,'HTML5 & Semantics'),(18,3,2,'CSS Flexbox & Grid'),(19,3,3,'JavaScript Essentials'),(20,3,4,'DOM & Events'),(21,3,5,'React Basics'),(22,3,6,'State Management'),(23,3,7,'Routing & SPAs'),(24,3,8,'RESTful APIs'),(25,4,1,'AI History & Overview'),(26,4,2,'Search Algorithms'),(27,4,3,'Knowledge Representation'),(28,4,4,'ML Foundations'),(29,4,5,'Neural Networks'),(30,4,6,'NLP Techniques'),(31,4,7,'Computer Vision'),(32,4,8,'Ethics in AI'),(63,7,1,'Introduction to Data Structures'),(64,7,1,'Algorithm Analysis and Big-O'),(65,7,2,'Arrays and Strings'),(66,7,2,'Linked Lists'),(67,7,3,'Stacks'),(68,7,3,'Queues'),(69,7,4,'Trees and Terminology'),(70,7,4,'Binary Search Trees'),(71,7,5,'Tree Traversals'),(72,7,5,'AVL Trees'),(73,7,6,'Heaps'),(74,7,6,'Priority Queues'),(75,7,7,'Hash Tables'),(76,7,7,'Collision Resolution'),(77,7,8,'Bubble and Selection Sort'),(78,7,8,'Insertion and Shell Sort'),(79,7,9,'Merge Sort'),(80,7,9,'Quick Sort'),(81,7,10,'Graph Representations'),(82,7,10,'Graph Traversals (BFS and DFS)'),(83,7,11,'Shortest Path Algorithms'),(84,7,11,'Minimum Spanning Trees'),(85,7,12,'Greedy Algorithms'),(86,7,12,'Dynamic Programming');
/*!40000 ALTER TABLE `course_syllabus` ENABLE KEYS */;
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
