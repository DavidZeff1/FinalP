CREATE DATABASE  IF NOT EXISTS `student_website` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `student_website`;
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
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_syllabus`
--

LOCK TABLES `course_syllabus` WRITE;
/*!40000 ALTER TABLE `course_syllabus` DISABLE KEYS */;
INSERT INTO `course_syllabus` VALUES (1,1,1,'Variables and Data Types'),(2,1,2,'Control Structures'),(3,1,3,'Functions and Scope'),(4,1,4,'OOP Principles'),(5,1,5,'Basic Data Structures'),(6,1,6,'Algorithm Analysis'),(7,1,7,'Memory Management'),(8,1,8,'File I/O'),(9,2,1,'Probability Fundamentals'),(10,2,2,'Pandas for Data Manipulation'),(11,2,3,'Data Visualization'),(12,2,4,'Statistical Modeling'),(13,2,5,'Intro to ML'),(14,2,6,'Supervised Learning'),(15,2,7,'Unsupervised Learning'),(16,2,8,'Model Evaluation'),(17,3,1,'HTML5 & Semantics'),(18,3,2,'CSS Flexbox & Grid'),(19,3,3,'JavaScript Essentials'),(20,3,4,'DOM & Events'),(21,3,5,'React Basics'),(22,3,6,'State Management'),(23,3,7,'Routing & SPAs'),(24,3,8,'RESTful APIs'),(25,4,1,'AI History & Overview'),(26,4,2,'Search Algorithms'),(27,4,3,'Knowledge Representation'),(28,4,4,'ML Foundations'),(29,4,5,'Neural Networks'),(30,4,6,'NLP Techniques'),(31,4,7,'Computer Vision'),(32,4,8,'Ethics in AI'),(63,7,1,'Introduction to Data Structures'),(64,7,1,'Algorithm Analysis and Big-O'),(65,7,2,'Arrays and Strings'),(66,7,2,'Linked Lists'),(67,7,3,'Stacks'),(68,7,3,'Queues'),(69,7,4,'Trees and Terminology'),(70,7,4,'Binary Search Trees'),(71,7,5,'Tree Traversals'),(72,7,5,'AVL Trees'),(73,7,6,'Heaps'),(74,7,6,'Priority Queues'),(75,7,7,'Hash Tables'),(76,7,7,'Collision Resolution'),(77,7,8,'Bubble and Selection Sort'),(78,7,8,'Insertion and Shell Sort'),(79,7,9,'Merge Sort'),(80,7,9,'Quick Sort'),(81,7,10,'Graph Representations'),(82,7,10,'Graph Traversals (BFS and DFS)'),(83,7,11,'Shortest Path Algorithms'),(84,7,11,'Minimum Spanning Trees'),(85,7,12,'Greedy Algorithms'),(86,7,12,'Dynamic Programming'),(87,8,1,'Introduction to cryptography history'),(88,8,1,'Basic terminology: plaintext, ciphertext, keys'),(89,8,2,'Symmetric-key encryption overview'),(90,8,2,'Formal security definitions (IND-security)'),(91,8,3,'Pseudorandom generators'),(92,8,3,'Stream ciphers'),(93,8,4,'Block cipher design principles'),(94,8,4,'DES and AES'),(95,8,5,'Modes of operation (ECB, CBC, CTR)'),(96,8,5,'Provable security of modes'),(97,8,6,'Message authentication codes (MACs)'),(98,8,6,'Cryptographic hash functions'),(99,8,7,'Security proofs and reductions'),(100,8,7,'Hybrid arguments'),(101,8,8,'Public-key cryptography foundations'),(102,8,8,'Number theory: modular arithmetic'),(103,8,9,'RSA encryption and security'),(104,8,9,'Cramer-Shoup and hybrid encryption'),(105,8,10,'Digital signature schemes'),(106,8,10,'DSA and Schnorr signatures'),(107,8,11,'Diffie-Hellman key exchange'),(108,8,11,'Authenticated key exchange protocols'),(109,8,12,'System applications: TLS and disk encryption'),(110,8,12,'Advanced topics: zero-knowledge proofs and future directions'),(111,9,1,'Introduction to Computer Architecture'),(112,9,1,'History of Computing'),(113,9,2,'Number Systems and Data Representation'),(114,9,2,'Boolean Algebra and Logic Gates'),(115,9,3,'Combinational Logic Design'),(116,9,3,'Sequential Logic and Flip-Flops'),(117,9,4,'Finite State Machines'),(118,9,4,'Memory Elements and Registers'),(119,9,5,'Instruction Set Architecture'),(120,9,5,'Assembly Language Programming'),(121,9,6,'Processor Datapath Design'),(122,9,6,'Control Unit Design'),(123,9,7,'Pipelining Concepts'),(124,9,7,'Pipeline Hazards and Solutions'),(125,9,8,'Memory Hierarchy Overview'),(126,9,8,'Cache Organization and Performance'),(127,9,9,'Virtual Memory and Address Translation'),(128,9,9,'TLBs and Page Replacement'),(129,9,10,'Storage and I/O Systems'),(130,9,10,'Disk and SSD Architectures'),(131,9,11,'Parallelism and Multicore Processors'),(132,9,11,'Synchronization and Memory Consistency'),(133,9,12,'Performance Evaluation'),(134,9,12,'Emerging Topics in Computer Architecture'),(135,10,1,'Introduction to Software Engineering'),(136,10,1,'Software Processes and Models'),(137,10,2,'Stakeholder Analysis & Requirements Elicitation'),(138,10,2,'Requirements Specification Techniques'),(139,10,3,'Use Case Modeling & User Stories'),(140,10,3,'Requirements Validation and Management'),(141,10,4,'System Modeling with UML'),(142,10,4,'Architectural Design Fundamentals'),(143,10,5,'Architectural Styles and Patterns'),(144,10,5,'Software Design Principles (SOLID, GRASP)'),(145,10,6,'Detailed Design and Module-level Design'),(146,10,6,'Coding Standards and Conventions'),(147,10,7,'Unit Testing and Test-Driven Development'),(148,10,7,'Integration and System Testing'),(149,10,8,'Software Quality Assurance and Metrics'),(150,10,8,'Verification & Validation Techniques'),(151,10,9,'Configuration Management and Version Control'),(152,10,9,'Continuous Integration and Deployment'),(153,10,10,'Project Management Processes in SE'),(154,10,10,'Effort Estimation and Risk Management'),(155,10,11,'Agile Methods (Scrum, Kanban)'),(156,10,11,'DevOps Culture and Tooling'),(157,10,12,'Software Maintenance and Evolution'),(158,10,12,'Ethics, Professionalism, and Emerging Trends');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (4,'Artificial Intelligence'),(9,'Computer Architecture'),(1,'Computer Science'),(2,'Data Science'),(7,'Data Structures and Algorithms'),(8,'Introduction to Modern Cryptography'),(10,'Software Engineering'),(3,'Web Development');
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
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flash_card`
--

LOCK TABLES `flash_card` WRITE;
/*!40000 ALTER TABLE `flash_card` DISABLE KEYS */;
INSERT INTO `flash_card` VALUES (1,'What is a variable?','A named storage location for a value.',1,1),(2,'Explain Big-O notation.','A measure of algorithmic time complexity.',1,6),(3,'What is a DataFrame?','A 2D labeled data structure in Pandas.',2,10),(4,'Define supervised learning.','Training models on labeled data.',2,14),(5,'What does CSS Flexbox do?','Arranges items in a container along one axis.',3,18),(6,'How to create a React component?','Define a function or class returning JSX.',3,21),(7,'What is a search algorithm?','A method to traverse problem spaces to find solutions.',4,26),(8,'Explain backpropagation.','Error-gradient method for training neural networks.',4,29),(34,'What is a linked list?','A linked list is a series of nodes where each node points to the next node and the last node points to null.',7,66),(35,'What pointers are maintained in DSA linked list implementations?','They maintain head and tail pointers to allow constant time insertion at both ends.',7,66),(36,'Why do we maintain head and tail pointers?','To enable O(1) insertion at the head or tail of the list.',7,66),(37,'What is the time complexity of insertion in a DSA linked list?','Insertion at the head or tail is O(1).',7,66),(38,'What is the time complexity of deletion in a linked list?','Deletion is O(n) because it may require traversing the list to find the node to remove.',7,66),(39,'What is the time complexity of searching in a linked list?','Searching is O(n) since it may require scanning through all nodes.',7,66),(40,'What is random insertion in a singly linked list?','Insertion before a node that is neither at the head nor tail of the list.',7,66),(41,'Why is random insertion O(n)?','Because we must traverse the list to find the predecessor of the target node, leading to linear time.',7,66),(42,'What are two key advantages of linked lists?','They resize dynamically without copy penalties and support O(1) insertion at the ends.',7,66),(43,'What constitutes a node in a singly linked list?','A value and a reference to the next node in the list.',7,66),(44,'What is private-key (symmetric-key) encryption?','Encryption and decryption use the same secret key.',8,89),(45,'Why is symmetric-key encryption also called the symmetric-key setting?','Because both parties hold the same key used for encryption and decryption.',8,89),(46,'How does symmetric-key encryption differ from asymmetric encryption?','Symmetric uses a single shared key whereas asymmetric uses different keys for encryption and decryption.',8,101),(47,'What is the primary goal of encryption?','To keep the plaintext hidden from an eavesdropper monitoring the communication channel.',8,88),(48,'What is one canonical application of private-key cryptography involving two parties?','Two distinct parties share a secret key in advance to communicate securely over a distance.',8,89),(49,'Why must the secret key not be sent over the public channel?','Because an eavesdropper monitoring the channel would obtain the key.',8,89),(50,'How can two parties securely share a key?','By meeting physically in a secure location to exchange the key before separating.',8,89),(51,'What is the second widespread application of private-key cryptography?','The same party encrypting and decrypting its own data over time, such as disk encryption.',8,109),(52,'What solution addresses programmers\' desire for unlimited fast memory?','A memory hierarchy',9,125),(53,'What principle explains that most programs do not access all code or data uniformly?','The principle of locality',9,125),(54,'What are the two types of locality?','Temporal locality and spatial locality',9,125),(55,'According to the design guideline, what can be made faster for a given implementation technology and power budget?','Smaller hardware',9,121),(56,'What are the characteristics of memory levels as they get closer to the processor?','They become smaller, faster, and more expensive per byte',9,125),(57,'What is the goal of organizing memory into several levels?','To achieve cost per byte nearly as low as the cheapest level and speed nearly as fast as the fastest level',9,125),(58,'What property states that data in a lower level are a superset of the next higher level?','The inclusion property',9,126),(59,'For which level is the inclusion property always required?','The lowest level (main memory for caches, disk memory for virtual memory)',9,126),(60,'What types of people write programs?','People in business write spreadsheet programs, scientists and engineers write programs to process experimental data, and hobbyists write programs for interest and enjoyment',10,137),(61,'What is the main characteristic of professional software development?','It is a professional activity where software is developed for specific business purposes, for inclusion in devices, or as software products and maintained and changed throughout its life',10,135),(62,'Who usually develops professional software intended for use by others?','Teams rather than individuals',10,135),(63,'What does software engineering support?','Professional software development including techniques for program specification, design, and evolution',10,135),(64,'How is software defined in software engineering?','It includes not just programs but also all associated documentation and configuration data required to make the programs operate correctly',10,135),(65,'What does a professionally developed software system usually consist of?','A number of separate programs, configuration files, system documentation, user documentation, and websites for product information',10,135),(66,'Why is documentation required in professional software development?','Because other people will use the software and other engineers will maintain and change it',10,157),(67,'What techniques are not normally relevant for personal software development?','Techniques supporting program specification, design, and evolution',10,135),(68,'What additional information must developers provide when others use their software?','Program guides, design documentation, and other supporting information',10,157),(69,'What is the symmetric-key setting?','It is the encryption paradigm in which the same secret key is used for both encrypting plaintext into ciphertext and decrypting it back to plaintext.',11,89),(70,'How does symmetric-key encryption contrast with asymmetric encryption?','Symmetric-key uses one shared key for both encryption and decryption whereas asymmetric uses different public and private keys.',11,89),(71,'What is the primary goal of encryption?','To keep the plaintext hidden from any eavesdropper who can observe the ciphertext on the communication channel.',11,88),(72,'Why is it insecure to send the key over the public channel?','Because an eavesdropper monitoring the channel would also obtain the key.',11,89),(73,'How can two separated parties securely share a key in advance?','They can physically meet in a secure location to exchange the key before separating.',11,89),(74,'What are the two canonical applications of private-key cryptography?','Secure communication between two distant users with a shared key and a single user encrypting data over time, such as disk encryption.',11,109),(75,'Give an example of a single party communicating with itself over time using private-key cryptography.','Disk encryption, where a user encrypts plaintext and stores the ciphertext on a hard drive for later access.',11,109),(76,'Which chapters formally define the goal of keeping plaintext hidden?','Chapters 2 and 3.',11,90),(77,'In which chapter is the issue of key sharing revisited?','Chapter 10',11,107);
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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flash_card_performance`
--

LOCK TABLES `flash_card_performance` WRITE;
/*!40000 ALTER TABLE `flash_card_performance` DISABLE KEYS */;
INSERT INTO `flash_card_performance` VALUES (1,1,1),(2,2,0),(3,3,1),(4,4,1),(5,5,1),(6,6,0),(7,7,1),(8,8,0),(34,34,1),(35,35,1),(36,36,0),(37,37,0),(38,38,1),(39,39,1),(40,40,0),(41,41,0),(42,42,0),(43,43,1),(44,44,1),(45,45,0),(46,46,1),(47,47,1),(48,48,1),(49,49,1),(50,50,0),(51,51,0),(52,52,1),(53,53,1),(54,54,1),(55,55,0),(56,56,0),(57,57,1),(58,58,0),(59,59,1),(60,60,1),(61,61,0),(62,62,0),(63,63,1),(64,64,0),(65,65,1),(66,66,0),(67,67,1),(68,68,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flash_card_set`
--

LOCK TABLES `flash_card_set` WRITE;
/*!40000 ALTER TABLE `flash_card_set` DISABLE KEYS */;
INSERT INTO `flash_card_set` VALUES (1,1),(2,2),(3,3),(4,4),(7,7),(8,8),(11,8),(9,9),(10,10);
/*!40000 ALTER TABLE `flash_card_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flashcards`
--

DROP TABLE IF EXISTS `flashcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flashcards` (
  `id` int NOT NULL AUTO_INCREMENT,
  `concept` varchar(255) NOT NULL,
  `summary` text NOT NULL,
  `course_title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_title` (`course_title`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flashcards`
--

LOCK TABLES `flashcards` WRITE;
/*!40000 ALTER TABLE `flashcards` DISABLE KEYS */;
INSERT INTO `flashcards` VALUES (1,'Merge Sort','Divide and conquer sorting algorithm that recursively splits arrays into halves and merges sorted sublists with guaranteed O(n log n) time complexity in all cases','algorithms'),(2,'Quick Sort','Efficient in-place sorting algorithm using pivot partitioning with average O(n log n) time complexity but O(n²) worst case performance','algorithms'),(3,'Dijkstra\'s Algorithm','Single-source shortest path algorithm for weighted graphs using greedy approach and priority queue with O((V+E) log V) time complexity','algorithms'),(4,'Binary Search','Logarithmic search algorithm for sorted arrays using divide and conquer approach with O(log n) time complexity by repeatedly halving search space','algorithms'),(5,'Dynamic Programming','Algorithmic optimization technique solving complex problems by breaking into overlapping subproblems using memoization to avoid redundant calculations','algorithms'),(6,'Graph Traversal BFS','Breadth-first search algorithm systematically explores graph vertices level by level using queue data structure for shortest path problems','algorithms'),(7,'Heap Sort','Comparison-based sorting algorithm using binary heap data structure with O(n log n) worst-case time complexity and in-place memory usage','algorithms'),(8,'Linked List','Linear data structure with nodes containing data and pointers to next elements allowing dynamic memory allocation and efficient insertion deletion','data structures'),(9,'Hash Table','Data structure mapping keys to values using hash functions for O(1) average lookup insertion deletion with collision resolution strategies','data structures'),(10,'Binary Search Tree','Hierarchical tree data structure maintaining sorted order with left subtree values less than parent and right subtree values greater','data structures'),(11,'Stack','LIFO last-in-first-out data structure supporting push pop operations used for function calls recursion and expression evaluation','data structures'),(12,'Queue','FIFO first-in-first-out data structure with enqueue dequeue operations used in scheduling breadth-first search and buffering systems','data structures'),(13,'AVL Tree','Self-balancing binary search tree maintaining height difference of at most one between left and right subtrees with rotations','data structures'),(14,'Heap','Complete binary tree data structure satisfying heap property where parent nodes are greater or less than children used in priority queues','data structures'),(15,'Page Replacement','Memory management algorithms like LRU FIFO and optimal deciding which virtual memory pages to swap between physical memory and disk storage','operating systems'),(16,'Mutex Locks','Synchronization primitives ensuring mutual exclusion by preventing multiple threads from simultaneously accessing critical sections avoiding race conditions','operating systems'),(17,'Process Scheduling','CPU scheduling algorithms like round-robin priority and shortest-job-first managing process execution order and resource allocation efficiently','operating systems'),(18,'Deadlock Prevention','Operating system strategies avoiding circular wait conditions and resource allocation conflicts using banker\'s algorithm and resource ordering','operating systems'),(19,'Virtual Memory','Memory management technique providing illusion of larger address space using disk storage backing with paging and segmentation mechanisms','operating systems'),(20,'Semaphores','Synchronization objects controlling access to shared resources with counter-based signaling mechanism for coordinating multiple processes threads','operating systems'),(21,'Cell Membrane','Selective phospholipid bilayer boundary controlling molecular transport and maintaining cellular homeostasis through various transport mechanisms and proteins','cell biology'),(22,'Mitosis','Cell division process producing two genetically identical diploid daughter cells through prophase metaphase anaphase telophase stages with chromosome segregation','cell biology'),(23,'DNA Replication','Semiconservative molecular process copying genetic material using DNA polymerase helicase ligase enzymes during S phase of cell cycle','cell biology'),(24,'Protein Synthesis','Gene expression process involving transcription of DNA to RNA and translation of mRNA to functional proteins using ribosomes tRNA','cell biology'),(25,'Cellular Respiration','Metabolic pathway converting glucose and oxygen into ATP energy through glycolysis Krebs cycle and electron transport chain in mitochondria','cell biology'),(26,'Enzyme Kinetics','Study of biochemical reaction rates and how enzymes catalyze biological processes with substrate binding active sites and allosteric regulation','cell biology'),(27,'Big O Notation','Mathematical notation describing algorithm time and space complexity upper bounds like O(1) O(log n) O(n) O(n log n) O(n²) for performance analysis','cs 101'),(28,'Von Neumann Architecture','Fundamental computer design model with CPU memory storage and input output components processing instructions and data sequentially from same memory','cs 101'),(29,'Binary Representation','Base-2 number system using only 0 and 1 digits for computer data representation digital logic operations and memory storage mechanisms','cs 101'),(30,'Programming Paradigms','Different software development approaches including procedural object-oriented functional and declarative programming styles with distinct methodologies','cs 101'),(31,'Computational Complexity','Study of computational resources required by algorithms measuring time space trade-offs and classifying problem difficulty using complexity classes','cs 101'),(32,'Computer Architecture','Design and organization of computer system components including processor memory hierarchy instruction sets and pipeline execution models','cs 101'),(33,'Bellman-Ford Algorithm','Single-source shortest path algorithm that handles negative edge weights by relaxing all edges V−1 times with O(V·E) time complexity','algorithms'),(34,'Floyd-Warshall Algorithm','All-pairs shortest paths algorithm using dynamic programming over vertex triples with O(n³) time complexity','algorithms'),(35,'Prim\'s Minimum Spanning Tree','Greedy algorithm that grows an MST by repeatedly adding the smallest-weight edge connecting the tree to a new vertex','algorithms'),(36,'Topological Sort','Linear ordering of a DAG’s vertices such that for every edge u→v, u comes before v, computed via DFS or Kahn’s algorithm','algorithms'),(37,'Knuth-Morris-Pratt (KMP)','Linear-time string search that precomputes a prefix-suffix table to skip redundant comparisons during pattern matching','algorithms'),(38,'A* Search','Heuristic graph search combining actual path cost and estimated cost-to-go to efficiently find shortest paths in weighted graphs','algorithms'),(39,'Trie','Prefix tree storing strings as paths from root to leaves for fast retrieval, insertion, and prefix-based queries','data structures'),(40,'Disjoint Set Union','Union–find structure tracking disjoint subsets with union by rank and path compression for nearly O(1) operations','data structures'),(41,'B-Tree','Balanced multiway tree optimized for block storage, keeping nodes with multiple keys to minimize disk I/O','data structures'),(42,'Red-Black Tree','Self-balancing BST that enforces coloring rules to guarantee O(log n) for insert, delete, and search','data structures'),(43,'Segment Tree','Binary tree structure supporting fast range queries and updates (min/max/sum) in O(log n) time','data structures'),(44,'Bloom Filter','Probabilistic set membership structure using k hash functions to test membership with false-positive risk','data structures'),(45,'Interrupt Handling','Hardware mechanism for signalling events that transfers control to OS interrupt handlers via an interrupt vector table','operating systems'),(46,'Context Switching','Saving and restoring CPU state (registers, program counter) to switch execution between processes or threads','operating systems'),(47,'File System Architecture','Organization of data on disk using structures like inodes, directories, journaling, and block allocation maps','operating systems'),(48,'Kernel Modules','Loadable pieces of code that extend kernel functionality at runtime without requiring a reboot','operating systems'),(49,'Memory-Mapped I/O','Technique mapping device registers or file data into process address space for direct load/store operations','operating systems'),(50,'Thrashing','Performance degradation caused by excessive paging when working set exceeds available physical memory','operating systems'),(51,'Apoptosis','Programmed cell death cascade involving caspase activation to safely dismantle cells during development and homeostasis','cell biology'),(52,'Signal Transduction','Molecular cascade converting extracellular signals into cellular responses via receptors, second messengers, and kinases','cell biology'),(53,'Endocytosis','Cellular uptake process enveloping extracellular material in vesicles formed from the plasma membrane','cell biology'),(54,'Golgi Apparatus','Organelle modifying, sorting, and packaging proteins and lipids for secretion or delivery within the cell','cell biology'),(55,'Lysosome Function','Digestive organelle containing hydrolytic enzymes to break down macromolecules and recycle cellular waste','cell biology'),(56,'Cytoskeleton','Network of actin filaments, microtubules, and intermediate filaments providing structure and intracellular transport','cell biology'),(57,'Hexadecimal Representation','Base-16 numbering system using symbols 0–9 and A–F for compact representation of binary data','cs 101'),(58,'Logic Gates','Basic digital circuits (AND, OR, NOT, NAND, XOR) implementing boolean functions in hardware','cs 101'),(59,'Memory Hierarchy','Layered storage system from registers and cache to RAM and disk balancing speed, cost, and capacity','cs 101'),(60,'Instruction Cycle','Fetch–decode–execute–store loop by which a CPU processes each instruction in memory','cs 101'),(61,'Machine vs Assembly Language','Machine code uses binary opcodes; assembly uses human-readable mnemonics assembled into machine code','cs 101'),(62,'High-Level Compilation','Translation of source code through lexical analysis, parsing, optimization, and code generation into machine code','cs 101'),(63,'Karatsuba Multiplication','Subquadratic divide-and-conquer algorithm for large integer multiplication with O(n^1.585) time by splitting numbers into high/low halves','algorithms'),(64,'Strassen Matrix Multiplication','Recursive algorithm for multiplying two n×n matrices in O(n^2.807) time using seven submatrix multiplications per level','algorithms'),(65,'Graham Scan','Convex hull algorithm in the plane that sorts points by polar angle and processes them in O(n log n) time','algorithms'),(66,'Suffix Array','Array of starting positions of sorted suffixes of a string, built in O(n) or O(n log n) time for fast substring queries','algorithms'),(67,'Fenwick Tree','Binary-indexed tree structure supporting prefix‐sum and update queries in O(log n) time with O(n) space','data structures'),(68,'Skip List','Probabilistic linked structure with multiple forward pointers to achieve O(log n) expected search, insertion, and deletion','data structures'),(69,'Union-by-Size Disjoint Set','Variation of union-find that always attaches smaller tree under larger to guarantee near-constant amortized operations','data structures'),(70,'Bloom Filter','Probabilistic data structure with k hash functions for set membership testing allowing false positives but no false negatives','data structures'),(71,'Copy-On-Write','Memory optimization where pages are duplicated only when modified, enabling efficient process forking and snapshotting','operating systems'),(72,'NUMA Architecture','Non-Uniform Memory Access design where each CPU has faster access to its local memory, requiring careful allocation for performance','operating systems'),(73,'Kernel Preemption','OS feature allowing high-priority tasks to interrupt kernel code, reducing latencies in real-time systems','operating systems'),(74,'Lock-Free Data Structures','Concurrent data structures that use atomic primitives (CAS) to avoid locks and reduce contention in multithreaded code','operating systems'),(75,'Phagocytosis','Cellular process by which a cell engulfs large particles or microbes into a phagosome for degradation','cell biology'),(76,'Exocytosis','Vesicle-mediated transport mechanism by which cells export materials (e.g., neurotransmitters, hormones) to the extracellular space','cell biology'),(77,'Microtubule Dynamics','Rapid polymerization and depolymerization of microtubules regulated by GTP-tubulin for cell shape and transport','cell biology'),(78,'Signal Amplification','Cascade in signal transduction where one receptor activation leads to the production of many second-messenger molecules','cell biology'),(79,'Cache Coherence Protocols','Mechanisms (e.g., MESI) ensuring that multiple CPU caches maintain a consistent view of memory in multicore systems','cs 101'),(80,'Instruction Pipelining','Technique allowing overlapping fetch-decode-execute cycles for multiple instructions to improve CPU throughput','cs 101'),(81,'Two’s Complement Representation','Binary encoding for signed integers where negative values wrap around, simplifying arithmetic circuits','cs 101'),(82,'Von Neumann Bottleneck','Throughput limitation caused by the shared bus between CPU and memory in the classic Von Neumann architecture','cs 101'),(83,'Kosaraju\'s Algorithm','Two-pass DFS algorithm to find strongly connected components in a directed graph in O(V+E) time','algorithms'),(84,'Tarjan\'s SCC Algorithm','Single-pass DFS algorithm using low-link values to compute strongly connected components in O(V+E)','algorithms'),(85,'Interpolation Search','Search in sorted array using probe position proportional to key distance with average O(log log n) time','algorithms'),(86,'SHA-256 Hash Function','Cryptographic hash producing 256-bit digest through 64 rounds of bitwise operations and modular additions','algorithms'),(87,'Fibonacci Heap','Priority queue with amortized O(1) decrease-key and O(log n) extract-min operations using cascading cuts','algorithms'),(88,'Bell Numbers','Sequence counting the number of partitions of a set, computed via exponential generating functions','algorithms'),(89,'Simulated Annealing','Metaheuristic optimization mimicking cooling process by accepting worse solutions with temperature-dependent probability','algorithms'),(90,'Reservoir Sampling','Random sampling algorithm for selecting k items from a stream of unknown length with equal probability','algorithms'),(91,'KD-Tree','k-dimensional binary search tree for organizing points in space to support nearest-neighbor queries in O(log n) average','data structures'),(92,'R-Tree','Height-balanced tree for indexing multi-dimensional spatial objects with bounding rectangles for range queries','data structures'),(93,'Suffix Tree','Compressed trie of all string suffixes supporting substring search in O(m) time and linear construction','data structures'),(94,'Van Emde Boas Tree','Recursive tree structure supporting integer operations in O(log log U) time for universe size U','data structures'),(95,'Quadtree','Tree data structure partitioning 2D space into quadrants recursively for spatial indexing and collision detection','data structures'),(96,'Disjoint Sparse Table','Immutable RMQ structure built in O(n log n) for constant-time range queries without updates','data structures'),(97,'Circular Buffer','Fixed-size ring buffer supporting efficient FIFO queue operations with overwrite-on-full behavior','data structures'),(98,'Buddy Allocator','Memory allocator that splits and coalesces power-of-two sized blocks to satisfy dynamic allocation requests','operating systems'),(99,'Page Coloring','Cache optimization technique mapping physical pages to cache colors to reduce conflict misses','operating systems'),(100,'Spinlock','Low-level lock using busy-wait loops and atomic test-and-set operations for short critical sections','operating systems'),(101,'Barrier Synchronization','Primitive ensuring threads wait until all participants reach a synchronization point before proceeding','operating systems'),(102,'OOM Killer','Linux mechanism that selects and kills processes to free memory when the system is under OOM conditions','operating systems'),(103,'Transparent Huge Pages','OS feature aggregating small pages into large ones to reduce TLB misses and improve performance','operating systems'),(104,'G1 Checkpoint','Cell cycle control point ensuring cell size and DNA integrity before entry into S phase','cell biology'),(105,'RNA Splicing','Post-transcriptional process removing introns and joining exons to form mature mRNA','cell biology'),(106,'Operon Model','Bacterial gene regulation system where multiple genes are transcribed from a single promoter under operator control','cell biology'),(107,'Epigenetic Modification','Heritable changes in gene expression without DNA sequence change via DNA methylation and histone modification','cell biology'),(108,'CRISPR-Cas9','Genome editing tool using RNA-guided Cas9 nuclease to create targeted double-strand DNA breaks','cell biology'),(109,'Autophagy','Cellular degradation pathway where cytoplasmic components are sequestered into autophagosomes for lysosomal digestion','cell biology'),(110,'Floating-Point Representation','IEEE 754 format encoding real numbers with sign, exponent, and mantissa for approximate arithmetic','cs 101'),(111,'Word Size','Number of bits processed by a CPU in one operation, affecting addressable memory and performance','cs 101'),(112,'Compiler Phases','Sequential stages: lexical analysis, parsing, semantic analysis, optimization, code generation, linking','cs 101'),(113,'Interpreter vs Compiler','Interpreter executes source code line-by-line; compiler translates to machine code before execution','cs 101'),(114,'Von Neumann Machine Cycle','Basic CPU loop: fetch instruction, decode, execute, memory access, write-back','cs 101'),(115,'Harvard Architecture','Computer design separating instruction and data memory and buses for parallel access','cs 101'),(116,'Overfitting','When a model learns the random noise in the training data instead of the underlying pattern, leading to poor generalization','machine learning'),(117,'Bias–Variance Tradeoff','The balance between model complexity (variance) and simplicity (bias) to minimize total error on unseen data','machine learning'),(118,'Gradient Descent','Iterative optimization algorithm that adjusts model parameters by moving against the gradient of the loss function','machine learning'),(119,'Cross-Validation','Technique for assessing model performance by partitioning data into training and validation folds to reduce overfitting','machine learning'),(120,'OSI Model','Seven-layer conceptual framework (Physical, Data Link, Network, Transport, Session, Presentation, Application) for network communication','computer networks'),(121,'TCP Three-Way Handshake','Process initiating a reliable TCP connection using SYN, SYN-ACK, and ACK packets','computer networks'),(122,'IP Routing','Mechanism for forwarding packets from source to destination across multiple networks based on routing tables','computer networks'),(123,'Subnetting','Technique for dividing an IP network into smaller subnetworks by manipulating the subnet mask','computer networks'),(124,'Normalization','Process of organizing database tables to reduce redundancy and improve data integrity through normal forms','databases'),(125,'ACID Properties','Set of guarantees (Atomicity, Consistency, Isolation, Durability) ensuring reliable transaction processing','databases'),(126,'Indexes','Data structures (e.g., B-trees, hash indexes) that speed up data retrieval at the cost of additional storage and maintenance','databases'),(127,'SQL Injection','Security vulnerability allowing attackers to execute arbitrary SQL by injecting malicious input into queries','databases'),(128,'Regularization','Technique (L1, L2) adding penalty terms to the loss function to prevent overfitting by discouraging large weights','machine learning'),(129,'Support Vector Machine','Supervised algorithm that finds the hyperplane maximizing margin between classes, can use kernels for nonlinearity','machine learning'),(130,'Decision Tree','Tree-based model splitting features by information gain or Gini impurity to make a sequence of decisions','machine learning'),(131,'K-Means Clustering','Unsupervised algorithm that partitions data into K clusters by minimizing within-cluster variance iteratively','machine learning'),(132,'ROC Curve & AUC','Plot of true positive rate vs false positive rate at various thresholds, with area under curve measuring classifier quality','machine learning'),(133,'DNS','Hierarchical system translating human-readable domain names into IP addresses using iterative and recursive queries','computer networks'),(134,'HTTP','Stateless application-layer protocol for transferring hypermedia documents, using methods like GET, POST, headers, and status codes','computer networks'),(135,'UDP','Connectionless transport protocol providing low-overhead datagram delivery without guaranteed ordering or reliability','computer networks'),(136,'ARP','Protocol mapping IPv4 addresses to link-layer MAC addresses by broadcasting ARP request and receiving reply','computer networks'),(137,'DHCP','Protocol dynamically assigning IP configuration parameters (address, gateway, DNS) to hosts on a network','computer networks'),(138,'SQL Joins','Operations combining rows from two or more tables based on related columns: INNER, LEFT, RIGHT, FULL outer joins','databases'),(139,'Foreign Key Constraints','Rules enforcing referential integrity by requiring that a column’s values match primary keys in another table','databases'),(140,'Sharding','Horizontal partitioning that splits data across multiple servers or nodes to improve scalability and performance','databases'),(141,'Replication','Copying and maintaining database objects in multiple databases for high availability and fault tolerance','databases'),(142,'Transactions & ACID','Group of operations executed as a single unit guaranteeing Atomicity, Consistency, Isolation, Durability','databases'),(143,'Principal Component Analysis','Dimensionality-reduction technique projecting data onto orthogonal components that capture maximal variance','machine learning'),(144,'Neural Network','Model composed of layers of interconnected nodes (neurons) with activation functions, trained by backpropagation','machine learning'),(145,'Backpropagation','Algorithm computing gradients of the loss with respect to network weights via the chain rule for learning','machine learning'),(146,'Mini-Batch Gradient Descent','Optimization variant that updates parameters using small random subsets of data per iteration for speed and stability','machine learning'),(147,'Feature Scaling','Preprocessing step that normalizes or standardizes input features to improve convergence of learning algorithms','machine learning'),(148,'Ethernet Frame Structure','Data-link layer packet format containing preamble, destination MAC, source MAC, EtherType, payload, and FCS','computer networks'),(149,'MAC Addressing','Unique 48-bit identifier assigned to each network interface for local frame delivery on Ethernet LANs','computer networks'),(150,'VLAN','Logical segmentation of a LAN into separate broadcast domains using tagged Ethernet frames (802.1Q)','computer networks'),(151,'ICMP','Internet Control Message Protocol used for diagnostic and control messages such as echo request/reply and TTL exceeded','computer networks'),(152,'Network Address Translation','Technique mapping private IP addresses to a public IP (and ports) to enable multiple hosts to share one Internet address','computer networks'),(153,'Stored Procedure','Named collection of SQL statements and control-flow logic stored in the database for reuse and encapsulation','databases'),(154,'View','Virtual table defined by a query expression that simplifies complex joins and can restrict column visibility','databases'),(155,'Trigger','Database object that automatically executes a specified procedure in response to certain events on a table','databases'),(156,'Deadlock','Condition where two or more transactions wait indefinitely for locks held by each other, requiring detection and resolution','databases'),(157,'Checkpointing','Process periodically writing in-memory data pages and log records to disk to bound recovery time after a crash','databases'),(158,'Random Forest','Ensemble algorithm that builds many decision trees on bootstrapped samples and averages their predictions to reduce variance','machine learning'),(159,'Logistic Regression','Statistical classification model using the logistic (sigmoid) function to predict binary outcomes by minimizing log-loss','machine learning'),(160,'Reinforcement Learning','Paradigm where an agent learns optimal actions by interacting with an environment and maximizing cumulative reward','machine learning'),(161,'Learning Rate Decay','Technique that gradually reduces the learning rate according to a schedule (step, exponential, or 1/t) to aid convergence','machine learning'),(162,'Early Stopping','Method that halts training when validation performance stops improving, preventing overfitting by monitoring a held-out set','machine learning'),(163,'BGP','Border Gateway Protocol path-vector protocol that exchanges routing information between Autonomous Systems on the Internet','computer networks'),(164,'MPLS','Multi-Protocol Label Switching forwarding technique that uses short labels for fast packet forwarding across routers','computer networks'),(165,'Quality of Service','Mechanisms (traffic policing, shaping, scheduling) that prioritize certain traffic flows to meet bandwidth and latency requirements','computer networks'),(166,'SNMP','Simple Network Management Protocol for monitoring and managing network devices using a manager-agent model and MIBs','computer networks'),(167,'Transport Layer Security','Cryptographic protocol (TLS) that provides end-to-end encryption and authentication over TCP connections using certificates','computer networks'),(168,'CAP Theorem','Principle stating that a distributed system can provide at most two of Consistency, Availability, and Partition tolerance','databases'),(169,'Transaction Isolation Levels','Set of definitions (Read Uncommitted, Read Committed, Repeatable Read, Serializable) controlling transaction visibility','databases'),(170,'Query Optimizer','Component that chooses the most efficient execution plan for SQL queries by estimating the cost of various access paths','databases'),(171,'Materialized View','Precomputed, stored result of a query that can be refreshed periodically to speed up complex or frequently run queries','databases'),(172,'Sharding Key','Attribute used to horizontally partition a database into shards, distributing data and load across multiple servers','databases');
/*!40000 ALTER TABLE `flashcards` ENABLE KEYS */;
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
INSERT INTO `prerequisites` VALUES (118,7),(119,7),(121,7),(122,7),(123,7),(124,7),(127,7),(128,7),(131,7),(29,11),(6,14),(15,14),(27,14),(29,14),(32,14),(64,14),(111,14),(135,14),(137,14),(157,14),(6,15),(14,15),(27,15),(29,15),(64,15),(111,15),(135,15),(137,15),(157,15),(19,22),(70,26),(6,27),(31,27),(32,27),(64,27),(110,27),(111,27),(135,27),(137,27),(157,27),(14,29),(15,29),(27,29),(31,29),(32,29),(110,29),(6,31),(14,31),(15,31),(27,31),(29,31),(32,31),(64,31),(84,31),(110,31),(111,31),(135,31),(137,31),(157,31),(71,66),(74,66),(80,66),(5,67),(63,67),(66,67),(74,67),(79,67),(118,67),(5,68),(63,68),(66,68),(70,68),(74,68),(79,68),(69,70),(71,70),(74,70),(75,70),(76,70),(81,70),(5,72),(63,72),(66,72),(70,72),(5,73),(63,73),(66,73),(69,73),(74,73),(77,73),(78,73),(79,73),(80,73),(70,74),(4,75),(5,75),(63,75),(76,75),(81,75),(98,75),(6,79),(64,79),(77,79),(78,79),(80,79),(86,79),(86,80),(85,84),(84,85),(4,86),(26,86),(29,86),(82,86),(83,86),(85,86),(87,92),(88,92),(91,92),(88,98),(97,98),(4,112),(120,112),(123,112),(127,112),(130,112),(111,119),(120,119),(6,133),(27,133),(64,133),(111,133),(135,133),(137,133),(157,133);
/*!40000 ALTER TABLE `prerequisites` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_questions`
--

LOCK TABLES `quiz_questions` WRITE;
/*!40000 ALTER TABLE `quiz_questions` DISABLE KEYS */;
INSERT INTO `quiz_questions` VALUES (1,'Computer Science','Which data structure uses LIFO?','Queue','Stack','Heap','B','2025-05-20 09:30:00'),(2,'Data Science','Which library is used for data manipulation in Python?','NumPy','Pandas','Matplotlib','B','2025-05-20 09:30:00'),(3,'Web Development','Which tag creates a hyperlink in HTML?','<img>','<a>','<link>','B','2025-05-20 09:30:00'),(4,'Artificial Intelligence','Who coined the term \"Artificial Intelligence\"?','Alan Turing','John McCarthy','Marvin Minsky','B','2025-05-20 09:30:00');
/*!40000 ALTER TABLE `quiz_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sample_tests`
--

DROP TABLE IF EXISTS `sample_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sample_tests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `summary` text NOT NULL,
  `expected_course` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `expected_course` (`expected_course`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sample_tests`
--

LOCK TABLES `sample_tests` WRITE;
/*!40000 ALTER TABLE `sample_tests` DISABLE KEYS */;
INSERT INTO `sample_tests` VALUES (1,'Recursive sorting algorithm that selects pivot element and partitions array around it with average case logarithmic depth','algorithms'),(2,'Graph algorithm using priority queue to find minimum spanning tree or shortest paths with greedy selection strategy','algorithms'),(3,'Divide and conquer search technique for sorted arrays with logarithmic time complexity by eliminating half the search space each iteration','algorithms'),(4,'Tree data structure where each node has at most two children with left subtree values smaller than parent node','data structures'),(5,'Data structure using hash function to map keys to array indices supporting constant time average case operations','data structures'),(6,'Memory management strategy where operating system swaps pages between physical memory and disk when RAM becomes full','operating systems'),(7,'Synchronization mechanism ensuring only one thread can access shared resource preventing concurrent access conflicts','operating systems'),(8,'Selective barrier made of phospholipids that regulates passage of substances into and out of cellular compartments','cell biology'),(9,'Process of cell division resulting in two identical daughter cells through chromosome separation and nuclear division phases','cell biology'),(10,'Mathematical notation expressing how algorithm performance scales with input size using functions like logarithmic or quadratic','cs 101'),(11,'Computer design where central processing unit fetches both program instructions and data from unified memory system','cs 101'),(12,'Handles negative edge weights to find shortest paths by iteratively relaxing all edges V-1 times','algorithms'),(13,'Dynamic programming approach that computes shortest paths between all pairs of vertices in O(n³)','algorithms'),(14,'Greedy MST algorithm that picks the smallest connecting edge from the partial tree at each step','algorithms'),(15,'Data structure for storing strings in a tree of character nodes supporting fast prefix searches','data structures'),(16,'Tracks connected components with union by rank and path compression to achieve amortized O(α(n)) operations','data structures'),(17,'Probabilistic filter using k hash functions to test set membership with possible false positives only','data structures'),(18,'Switches CPU execution context by saving registers and program counter, then loading another process’s state','operating systems'),(19,'Maps device registers or file contents into process address space so reads/writes go directly to hardware','operating systems'),(20,'Condition where excessive paging leads to constant page faults and low CPU utilization','operating systems'),(21,'Cell death mechanism involving caspases to safely dismantle and remove unneeded or damaged cells','cell biology'),(22,'Engulfment of extracellular molecules into vesicles formed from the plasma membrane','cell biology'),(23,'Base-16 system using digits 0–9 and letters A–F to represent binary data more compactly','cs 101'),(24,'Fetch, decode, execute, and store loop constituting a CPU’s fundamental instruction processing cycle','cs 101'),(25,'Multiplication method splitting numbers and combining partial products in subquadratic time','algorithms'),(26,'Matrix multiplication that reduces recursive calls from eight to seven, achieving O(n^2.807)','algorithms'),(27,'Sorting points by angle around a pivot and building convex hull in O(n log n)','algorithms'),(28,'Building a sorted index of all string suffixes for substring searches','algorithms'),(29,'Tree structure allowing prefix‐sum queries and updates in logarithmic time','data structures'),(30,'List with multiple forward links that achieves expected logarithmic search time without rebalancing','data structures'),(31,'Set-membership filter using multiple hashes that can yield false positives','data structures'),(32,'Disjoint set union that attaches smaller sets under larger for efficiency','data structures'),(33,'Technique where memory pages are only copied when first written, after a fork','operating systems'),(34,'Memory design with non-uniform access times requiring careful placement','operating systems'),(35,'Allowing the OS to preempt its own kernel code to reduce scheduling latency','operating systems'),(36,'Data structures that use CAS to coordinate threads without locks','operating systems'),(37,'Process where a cell envelops large particles into a vesicle for digestion','cell biology'),(38,'Export of cellular products via vesicle fusion with the plasma membrane','cell biology'),(39,'Rapid assembly/disassembly of cytoskeletal filaments driven by nucleotide state','cell biology'),(40,'Signal cascade generating many second messengers from one receptor event','cell biology'),(41,'Maintaining consistent cache lines across multiple CPU caches in multicore systems','cs 101'),(42,'Overlapping instruction stages to improve CPU utilization','cs 101'),(43,'Binary integer encoding that allows natural wraparound for negatives','cs 101'),(44,'Performance limit due to shared bus between CPU and RAM in classic design','cs 101'),(45,'DFS-based two-pass algorithm finding strongly connected components','algorithms'),(46,'Using low-link values in single DFS to identify SCCs','algorithms'),(47,'Search method using key distribution to probe sorted array positions','algorithms'),(48,'Hash algorithm producing fixed-size digest via bitwise and modular steps','algorithms'),(49,'Priority queue supporting O(1) decrease-key using multi-tree heaps','algorithms'),(50,'Optimization heuristic accepting uphill moves based on temperature schedule','algorithms'),(51,'Stream sampling algorithm guaranteeing equal probability selection','algorithms'),(52,'k-d tree partitioning space for nearest neighbor queries','data structures'),(53,'Hierarchical bounding rectangle tree for spatial indexing','data structures'),(54,'Compressed trie indexing all suffixes for linear-time search','data structures'),(55,'Integer set structure supporting O(log log U) operations','data structures'),(56,'Spatial quadtree subdividing 2D space into quadrants recursively','data structures'),(57,'Immutable table answering range-maximum queries in O(1)','data structures'),(58,'Ring buffer implementing circular FIFO with overwrite behavior','data structures'),(59,'Allocator splitting memory blocks into power-of-two sizes','operating systems'),(60,'Technique mapping pages to cache sets to reduce conflicts','operating systems'),(61,'Busy-wait lock using atomic test-and-set for critical sections','operating systems'),(62,'Thread sync primitive waiting for all participants to arrive','operating systems'),(63,'Process killer that frees RAM under OOM conditions','operating systems'),(64,'Feature grouping small pages into huge pages to reduce TLB misses','operating systems'),(65,'Checkpoint ensuring DNA integrity before S phase entry','cell biology'),(66,'Process removing introns and joining exons in mRNA','cell biology'),(67,'Bacterial gene cluster controlled by a single promoter and operator','cell biology'),(68,'Heritable gene regulation via methylation and histone change','cell biology'),(69,'RNA-guided nuclease system for targeted genome editing','cell biology'),(70,'Pathway degrading cellular components via autophagosomes','cell biology'),(71,'IEEE 754 format encoding real numbers with exponent and mantissa','cs 101'),(72,'Bit-width defining CPU register and memory operations','cs 101'),(73,'Sequence from lexical analysis to linking in compiler design','cs 101'),(74,'Line-by-line execution vs ahead-of-time machine translation','cs 101'),(75,'CPU cycle stages: fetch, decode, execute, memory, write-back','cs 101'),(76,'Architecture separating instruction and data memory for parallel access','cs 101'),(77,'Model shows very low training error but high validation error indicating it fits noise','machine learning'),(78,'Tradeoff between how complex a model is and how well it generalizes to new data','machine learning'),(79,'Optimize model weights by iteratively subtracting a fraction of the gradient of the loss','machine learning'),(80,'Partition data into multiple folds to evaluate model performance more reliably','machine learning'),(81,'Conceptual layers from physical signaling up to application protocols in network design','computer networks'),(82,'Connection setup using SYN, SYN-ACK, and ACK messages before data transfer','computer networks'),(83,'Forwarding IP packets based on routing table entries across different network hops','computer networks'),(84,'Dividing a large IP address range into smaller blocks by adjusting the mask','computer networks'),(85,'Reorganizing tables into 3NF to eliminate update anomalies and redundant data','databases'),(86,'Ensuring transactions are atomic, isolated, and durable within the database system','databases'),(87,'Creating B-tree structures on columns to speed up WHERE clause lookups','databases'),(88,'Preventing malicious SQL code from executing by sanitizing user inputs','databases'),(89,'Adds a penalty on large parameter values to the cost function to reduce overfitting','machine learning'),(90,'Algorithm that finds the optimal separating hyperplane maximizing margin between classes','machine learning'),(91,'Model that splits data recursively based on feature thresholds until leaves predict outcomes','machine learning'),(92,'Partitions data points into K groups by alternating assignment and centroid update steps','machine learning'),(93,'Graph showing trade-offs between true positive and false positive rates, area measures performance','machine learning'),(94,'System resolving domain names to IP addresses via root, TLD, and authoritative servers','computer networks'),(95,'Protocol using stateless requests and responses over TCP for web page retrieval','computer networks'),(96,'Transport protocol sending datagrams without establishing a connection or guaranteeing delivery','computer networks'),(97,'Protocol broadcasting a request to learn the MAC address corresponding to an IPv4 address','computer networks'),(98,'Service leasing dynamic IP addresses and configuration details to clients on a LAN','computer networks'),(99,'Combines rows from tables based on matching column values, e.g., INNER JOIN or LEFT JOIN','databases'),(100,'Ensures that a column’s values correspond to primary key entries in another table','databases'),(101,'Splits large tables across multiple database instances to distribute load','databases'),(102,'Keeps identical copies of data on separate servers to ensure availability','databases'),(103,'Sequence of operations that must satisfy atomicity, consistency, isolation, and durability guarantees','databases'),(104,'Technique that projects high-dimensional data onto orthogonal axes capturing maximum variance','machine learning'),(105,'Layered model using weighted sums and nonlinear activations trained via error backpropagation','machine learning'),(106,'Chain-rule-based method to compute parameter gradients in multi-layer networks','machine learning'),(107,'Updates model weights using small randomly selected subsets of the training set','machine learning'),(108,'Rescales features to have zero mean and unit variance before training a model','machine learning'),(109,'Frame format on Ethernet LANs including MAC addresses, EtherType, payload, and CRC','computer networks'),(110,'Unique hardware identifier used at the data-link layer for local delivery','computer networks'),(111,'Separates a single physical LAN into multiple broadcast domains using tagged frames','computer networks'),(112,'Protocol generating error and diagnostic messages like ping replies and TTL exceeded','computer networks'),(113,'Method translating internal private IP addresses to a shared public IP for Internet access','computer networks'),(114,'Reusable block of SQL code stored on the server and invoked with parameters','databases'),(115,'Virtual table defined by a SELECT query and used like a real table','databases'),(116,'Automatically runs specified SQL in response to INSERT, UPDATE, or DELETE events','databases'),(117,'Condition in which two transactions wait on each other’s locks indefinitely','databases'),(118,'Periodic operation writing dirty pages and logs to disk to shorten crash recovery','databases'),(119,'Uses an ensemble of decision trees trained on different random subsets to improve generalization','machine learning'),(120,'Predicts binary outcomes by fitting a linear model and applying the sigmoid function','machine learning'),(121,'Agent learns by trial and error, receiving rewards and penalties from its environment','machine learning'),(122,'Reduces the step size of parameter updates over time according to a predefined schedule','machine learning'),(123,'Stops training early when performance on a validation set no longer improves','machine learning'),(124,'Inter-domain routing protocol exchanging AS path information for Internet-wide reachability','computer networks'),(125,'Switching method that forwards packets based on short labels rather than full network-layer lookups','computer networks'),(126,'Techniques like traffic shaping and priority queuing to guarantee service levels for critical flows','computer networks'),(127,'Protocol used to query and set management information on network devices via MIB objects','computer networks'),(128,'Protocol that secures data in transit by negotiating encryption keys and certificates over TCP','computer networks'),(129,'Theory stating that you cannot simultaneously guarantee consistency, availability, and partition tolerance','databases'),(130,'Defines how and when changes made by one transaction become visible to others, from dirty reads up to serializable','databases'),(131,'Selects execution plans by estimating costs of scans, joins, and index usage to minimize query runtime','databases'),(132,'Stores the result of a complex SELECT query as a physical table that can be refreshed on demand','databases'),(133,'Column chosen to distribute rows across shards to balance data and query load evenly','databases');
/*!40000 ALTER TABLE `sample_tests` ENABLE KEYS */;
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
  `task_id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,'2025-05-21','Review topic: Algorithm Analysis'),(2,'2025-05-21','Review topic: React Basics'),(3,'2025-05-21','Review topic: Neural Networks'),(4,'2025-05-30','Review topic: 29'),(5,'2025-05-30','Review topic: 79'),(6,'2025-05-30','Review topic: 21'),(7,'2025-05-30','Review topic: 67'),(8,'2025-05-30','Review topic: 68'),(9,'2025-05-30','Review topic: 72'),(10,'2025-05-30','Review topic: 73'),(11,'2025-05-30','Review topic: Neural Networks'),(12,'2025-05-30','Review topic: Merge Sort'),(13,'2025-05-30','Review topic: React Basics'),(14,'2025-05-30','Review topic: Stacks'),(15,'2025-05-30','Review topic: Queues'),(16,'2025-05-30','Review topic: AVL Trees'),(17,'2025-05-30','Review topic: Heaps'),(18,'2025-06-12','Review: Data Visualization'),(19,'2025-06-13','Review: Dynamic Programming'),(20,'2025-06-14','Review: Merge Sort'),(21,'2025-06-15','Review: React Basics'),(22,'2025-06-16','Review: Stacks'),(23,'2025-06-17','Review: Queues'),(24,'2025-06-18','Review: AVL Trees'),(25,'2025-06-19','Review: Heaps'),(26,'2025-06-20','Review: Symmetric-key encryption overview'),(27,'2025-06-21','Review: Diffie-Hellman key exchange'),(28,'2025-06-13','Review: Data Visualization'),(29,'2025-06-14','Review: Dynamic Programming'),(30,'2025-06-15','Review: Merge Sort'),(31,'2025-06-16','Review: Performance Evaluation'),(32,'2025-06-17','Review: React Basics'),(33,'2025-06-18','Review: Stacks'),(34,'2025-06-19','Review: Queues'),(35,'2025-06-20','Review: AVL Trees'),(36,'2025-06-21','Review: Heaps'),(37,'2025-06-22','Review: Symmetric-key encryption overview'),(38,'2025-06-23','Review: Diffie-Hellman key exchange'),(39,'2025-06-24','Review: Memory Management'),(40,'2025-06-25','Review: Instruction Set Architecture'),(41,'2025-06-26','Review: Cache Organization and Performance'),(42,'2025-06-13','Review: Data Visualization'),(43,'2025-06-14','Review: Dynamic Programming'),(44,'2025-06-15','Review: Merge Sort'),(45,'2025-06-16','Review: Performance Evaluation'),(46,'2025-06-17','Review: React Basics'),(47,'2025-06-18','Review: Stacks'),(48,'2025-06-19','Review: Queues'),(49,'2025-06-20','Review: AVL Trees'),(50,'2025-06-21','Review: Heaps'),(51,'2025-06-22','Review: Symmetric-key encryption overview'),(52,'2025-06-23','Review: Diffie-Hellman key exchange'),(53,'2025-06-24','Review: Memory Management'),(54,'2025-06-25','Review: Instruction Set Architecture'),(55,'2025-06-26','Review: Cache Organization and Performance'),(56,'2025-06-13','Review: Data Visualization'),(57,'2025-06-14','Review: Dynamic Programming'),(58,'2025-06-15','Review: Merge Sort'),(59,'2025-06-16','Review: Performance Evaluation'),(60,'2025-06-17','Review: React Basics'),(61,'2025-06-18','Review: Stacks'),(62,'2025-06-19','Review: Queues'),(63,'2025-06-20','Review: AVL Trees'),(64,'2025-06-21','Review: Heaps'),(65,'2025-06-22','Review: Symmetric-key encryption overview'),(66,'2025-06-23','Review: System applications: TLS and disk encryption'),(67,'2025-06-24','Review: Memory Management'),(68,'2025-06-25','Review: Cache Organization and Performance');
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

-- Dump completed on 2025-08-16 21:28:51
