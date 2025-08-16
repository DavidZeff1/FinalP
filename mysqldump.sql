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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_syllabus`
--

LOCK TABLES `course_syllabus` WRITE;
/*!40000 ALTER TABLE `course_syllabus` DISABLE KEYS */;
INSERT INTO `course_syllabus` VALUES (1,1,1,'Atoms as Natures Building Material'),(2,1,2,'Electron Orbitals'),(3,1,2,'Energy Levels'),(4,1,3,'Elements in Living Things'),(5,1,4,'Ionic Bonds'),(6,1,4,'Covalent Bonds'),(7,1,5,'Water Polarity'),(8,1,5,'Hydrogen Bonding'),(9,1,5,'Water Ionization'),(10,1,6,'Big Bang'),(11,1,6,'Chemical Evolution'),(12,1,6,'Origin of Life'),(13,2,1,'Atoms and Electron Structure'),(14,2,1,'Nucleus and Electrons'),(15,2,2,'Periodic Table and Essential Elements'),(16,2,2,'Biological Abundance'),(17,2,3,'Chemical Bonds: Ionic'),(18,2,3,'Covalent'),(19,2,4,'Water Polarity'),(20,2,4,'Hydrogen Bonding'),(21,2,4,'Cohesion'),(22,2,5,'Water Ionization'),(23,2,5,'pH in Biological Systems'),(24,2,6,'Origin of the Universe'),(25,2,6,'Chemical Evolution'),(26,2,6,'Origin of Life');
/*!40000 ALTER TABLE `course_syllabus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'General Biology'),(2,'Introduction To Biology');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flash_card`
--

LOCK TABLES `flash_card` WRITE;
/*!40000 ALTER TABLE `flash_card` DISABLE KEYS */;
INSERT INTO `flash_card` VALUES (1,'What are atoms?','Atoms are nature’s building material composed of a positively charged nucleus surrounded by orbiting electrons.',1,13),(2,'Which subatomic particles determine the chemical behavior of atoms?','Electrons.',1,13),(3,'How does an electron’s energy level relate to its distance from the nucleus?','The closer an electron’s orbit to the nucleus, the lower its energy level.',1,13),(4,'How many naturally occurring elements occur in organisms in significant amounts?','Eleven.',1,15),(5,'What holds atoms together in molecules?','Chemical bonds formed by forces such as the attraction of opposite charges or the sharing of electrons.',1,18),(6,'What type of bond forms crystals through attraction of opposite charges?','Ionic bonds.',1,17),(7,'What type of bond is formed by sharing electrons and builds stable molecules?','Covalent bonds.',1,18),(8,'Why is water considered polar?','Unequal sharing of electrons between hydrogen and oxygen creates partial positive and negative poles.',1,19),(9,'What causes water to cling to other polar molecules?','Attraction between opposite partial charges causes water to cling to itself and other polar molecules.',1,20),(10,'Why does water contain hydrogen and hydroxide ions?','Because its covalent bonds occasionally break, ionizing water molecules into H+ and OH– ions.',1,22),(11,'What event marked the beginning of the universe about 10 to 20 billion years ago?','An enormous explosion often called the Big Bang.',1,24),(12,'Why is chemistry important for understanding the origin of life?','Because life on Earth evolved through chemical processes that also shaped the evolution of molecules and matter.',1,26);
/*!40000 ALTER TABLE `flash_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flash_card_performance`
--

DROP TABLE IF EXISTS `flash_card_performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flash_card_performance` (
  `idflash_card_performance` int NOT NULL AUTO_INCREMENT,
  `flash_card_id` int NOT NULL,
  `outcome` tinyint DEFAULT NULL,
  PRIMARY KEY (`idflash_card_performance`),
  KEY `flash_card_id` (`flash_card_id`),
  CONSTRAINT `flash_card_performance_ibfk_1` FOREIGN KEY (`flash_card_id`) REFERENCES `flash_card` (`idflash_card`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flash_card_performance`
--

LOCK TABLES `flash_card_performance` WRITE;
/*!40000 ALTER TABLE `flash_card_performance` DISABLE KEYS */;
INSERT INTO `flash_card_performance` VALUES (1,1,1),(2,2,1),(3,3,0),(4,4,1),(5,5,1),(6,6,0),(7,7,1),(8,8,0),(9,9,1),(10,10,0),(11,11,1),(12,12,1);
/*!40000 ALTER TABLE `flash_card_performance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flash_card_schedule`
--

DROP TABLE IF EXISTS `flash_card_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flash_card_schedule` (
  `student_id` int NOT NULL,
  `flash_card_id` int NOT NULL,
  `repetition` int unsigned NOT NULL DEFAULT '0' COMMENT 'consecutive successful reviews',
  `interval_days` int unsigned NOT NULL DEFAULT '0' COMMENT 'current interval length in days',
  `ease_factor` decimal(3,2) NOT NULL DEFAULT '2.50' COMMENT 'SM-2 ease factor (min 1.3)',
  `last_reviewed_at` datetime NOT NULL COMMENT 'when we last applied SM-2 to this card',
  `next_review_date` date NOT NULL COMMENT 'when this card is next due',
  `rating` int NOT NULL DEFAULT '1200' COMMENT 'Elo rating for this card',
  PRIMARY KEY (`student_id`,`flash_card_id`),
  KEY `next_review_date` (`next_review_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flash_card_schedule`
--

LOCK TABLES `flash_card_schedule` WRITE;
/*!40000 ALTER TABLE `flash_card_schedule` DISABLE KEYS */;
INSERT INTO `flash_card_schedule` VALUES (42,101,1,1,2.36,'2025-05-04 09:15:30','2025-05-05',1200),(42,102,2,6,2.50,'2025-05-04 09:18:12','2025-05-10',1200),(43,201,0,1,2.50,'2025-05-04 10:02:45','2025-05-05',1200),(44,302,2,6,2.60,'2025-05-04 11:32:10','2025-05-10',1200),(45,402,3,16,2.70,'2025-05-04 13:48:07','2025-05-20',1200),(46,501,1,1,2.40,'2025-05-04 15:10:30','2025-05-05',1200);
/*!40000 ALTER TABLE `flash_card_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flash_card_set`
--

DROP TABLE IF EXISTS `flash_card_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flash_card_set` (
  `idflash_card_set` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  PRIMARY KEY (`idflash_card_set`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `flash_card_set_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flash_card_set`
--

LOCK TABLES `flash_card_set` WRITE;
/*!40000 ALTER TABLE `flash_card_set` DISABLE KEYS */;
INSERT INTO `flash_card_set` VALUES (1,2);
/*!40000 ALTER TABLE `flash_card_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `idgame` int NOT NULL,
  `question` varchar(255) DEFAULT NULL,
  `answer` text,
  `course` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idgame`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `idstudent` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `college` varchar(100) DEFAULT NULL,
  `degree` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`idstudent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'John Doe','Tech College','Bachelors','123 Main St',20);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summaries`
--

DROP TABLE IF EXISTS `summaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `summaries` (
  `idsummary` int NOT NULL,
  `summary` text,
  `course` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idsummary`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summaries`
--

LOCK TABLES `summaries` WRITE;
/*!40000 ALTER TABLE `summaries` DISABLE KEYS */;
/*!40000 ALTER TABLE `summaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `begin_time` date DEFAULT NULL,
  `end_time` date DEFAULT NULL,
  `task_desciption` text,
  `task_id` int NOT NULL,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `idtest` int NOT NULL,
  `question` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `course` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idtest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'What is a variable?','A storage container for data','CS 101');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_performance`
--

DROP TABLE IF EXISTS `test_performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_performance` (
  `idtest_performance` int NOT NULL,
  `success_ratio` decimal(5,2) DEFAULT NULL,
  `student_id` int DEFAULT NULL,
  `topic` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idtest_performance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_performance`
--

LOCK TABLES `test_performance` WRITE;
/*!40000 ALTER TABLE `test_performance` DISABLE KEYS */;
INSERT INTO `test_performance` VALUES (1,0.90,1,'CS 101');
/*!40000 ALTER TABLE `test_performance` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-19 21:09:48
