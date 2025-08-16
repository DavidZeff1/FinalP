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
-- Table structure for table `quiz_questions`
--

DROP TABLE IF EXISTS `quiz_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_questions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `course` varchar(100) NOT NULL,
  `question` text NOT NULL,
  `answer_a` varchar(255) NOT NULL,
  `answer_b` varchar(255) NOT NULL,
  `answer_c` varchar(255) NOT NULL,
  `correct_option` enum('A','B','C') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_questions`
--

LOCK TABLES `quiz_questions` WRITE;
/*!40000 ALTER TABLE `quiz_questions` DISABLE KEYS */;
INSERT INTO `quiz_questions` VALUES (1,'Calculus I','What is the derivative of x² with respect to x?','2x','x','1','A','2025-04-24 10:22:33'),(2,'Calculus I','Evaluate the indefinite integral ∫ 1/x dx.','ln|x| + C','1/x² + C','x ln x – x + C','A','2025-04-24 10:22:33'),(3,'Geometry','Which equation expresses the Pythagorean theorem?','a² + b² = c²','a + b = c','a² – b² = c²','A','2025-04-24 10:22:33'),(4,'Algebra I','Solve for x in 2x + 3 = 7.','2','3','1','A','2025-04-24 10:22:33'),(5,'Calculus I','Evaluate limₓ→0 (sin x)/x.','1','0','∞','A','2025-04-24 10:22:33'),(6,'Linear Algebra','What is the determinant of the matrix [[1, 2], [3, 4]]?','-2','2','10','A','2025-04-24 10:22:33'),(7,'Number Theory','Which of the following numbers is prime?','7','9','15','A','2025-04-24 10:22:33'),(8,'Algebra II','In the quadratic formula, what is the discriminant?','b² – 4ac','4a² – bc','b² + 4ac','A','2025-04-24 10:22:33'),(9,'Geometry','What is the formula for the volume of a sphere?','(4/3)πr³','πr²h','2πr²','A','2025-04-24 10:22:33'),(10,'Probability','For a fair coin, what is the probability of landing heads?','0.5','1','0','A','2025-04-24 10:22:33'),(11,'Biology','Which of the following is a major unifying theme of biology that explains both the unity and the diversity of life?','Energy processing','Evolution','Internal regulation','B','2025-04-25 09:08:24'),(12,'Biology','Which pair of scientists provided key evidence that all cells arise from preexisting cells, completing the third tenet of cell theory?','Schleiden and Schwann','Remak and Virchow','Leeuwenhoek and Swammerdam','B','2025-04-25 09:08:24'),(13,'Biology','Carl Linnaeus is best known for which foundational contribution to biology?','Demonstrating that species can change over time through natural selection','Establishing a system of binomial nomenclature for naming species','Discovering the double-helical structure of DNA','B','2025-04-25 09:08:24'),(14,'Biology','Who independently formulated the theory of evolution by natural selection alongside Charles Darwin?','Jean-Baptiste Lamarck','Alfred Russel Wallace','Georges-Louis Leclerc, Comte de Buffon','B','2025-04-25 09:08:24'),(15,'Biology','Which experiment provided strong evidence that DNA is the hereditary material of chromosomes, marking a shift toward molecular genetics?','Hershey–Chase blender experiments','Watson and Crick’s X-ray crystallography','Mendel’s pea-plant hybridization','A','2025-04-25 09:08:24');
/*!40000 ALTER TABLE `quiz_questions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-18 20:07:04
