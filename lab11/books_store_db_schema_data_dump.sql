-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: books_store_db
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.20.04.2

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
-- Current Database: `books_store_db`
--

/*!40000 DROP DATABASE IF EXISTS `books_store_db`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `books_store_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `books_store_db`;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(250) DEFAULT NULL,
  `lname` varchar(250) NOT NULL,
  `birth_year` smallint DEFAULT NULL,
  `death_year` smallint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lname` (`lname`(10))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'Kurt','Vonnegut',1922,2007),(2,'Douglas','Adams',1952,2001),(3,'Charles','Dodgson',1832,1898),(4,'Georgi','Gospodinov',1968,NULL),(5,'Alek','Popov',1966,NULL),(6,'Georgi','Markov',1929,1978);
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int unsigned NOT NULL,
  `book_name` varchar(250) NOT NULL,
  `pub_year` smallint unsigned DEFAULT NULL,
  `price` decimal(5,2) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `book_name` (`book_name`(10)),
  KEY `author_id` (`author_id`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,1,'The Sirens of Titan',1959,45.00),(2,1,'Mother Night',1961,14.25),(3,1,'Cat\'s Cradle',1963,20.02),(4,1,'God Bless You',1965,23.50),(5,1,'Slaughterhouse',1969,45.00),(6,1,'Breakfast of Champions',1973,12.34),(7,2,'The Hitchhiker\'s Guide to the Galaxy',1979,20.99),(8,2,'The Restaurant at the End of the Universe',1980,34.56),(9,2,'Life',1982,12.90),(10,2,'So Long',1984,9.89),(11,2,'Young Zaphod Plays It Safe',1986,5.60),(12,2,'Dirk Gently\'s Holistic Detective Agency',1987,23.90),(13,2,'The Long Dark Tea',1988,45.00),(14,2,'Last Chance to See',1990,5.78),(15,2,'Mostly Harmless',1992,23.50),(16,3,'Alice\'s Adventures in Wonderland',1865,120.00),(17,3,'Through the Looking-Glass, and What Alice Found There',1871,45.00),(18,3,'Rhyme? And Reason?',NULL,125.60),(19,3,'A Tangled Tale',NULL,23.50),(20,3,'Pillow Problems',NULL,89.90),(21,3,'La Guida di Bragia, a Ballad Opera for the Marionette Theatre',1950,42.50),(22,3,'Sylvie and Bruno',NULL,43.50),(23,3,'Sylvie and Bruno Concluded',NULL,50.90),(24,3,'Three Sunsets and Other Poems',1898,42.90),(25,3,'The Hunting of the Snark',1876,90.50),(26,3,'What the Tortoise Said to Achilles',1895,27.90),(27,3,'A Syllabus of Plane Algebraic Geometry',1860,21.20),(28,3,'The Fifth Book of Euclid Treated Algebraically',1858,89.50),(29,3,'An Elementary Treatise on Determinants, With Their Application to Simultaneous Linear Equations and Algebraic Equations',NULL,48.99),(30,3,'Euclid and his Modern Rivals',1879,56.30),(31,3,'Symbolic Logic Part I',NULL,93.90),(32,3,'Symbolic Logic Part II',NULL,25.89),(33,3,'The Alphabet Cipher',1868,67.90),(34,3,'The Game of Logic',1887,142.90),(35,3,'Curiosa Mathematica I',1888,295.40),(36,3,'Curiosa Mathematica II',1892,200.90),(37,4,'Natural Novel',1999,25.90),(38,4,'And Other Stories',2001,18.90),(39,4,'The Physics of Sorrow',2012,32.90),(40,4,'Time Shelter',2020,52.90),(41,6,'The Truth That Killed',1984,95.00),(42,6,'A Portrait of My Double',1966,83.90);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Sofia'),(2,'Paris'),(3,'Lodon'),(4,'New York');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `age` smallint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Ivan',23),(2,'John',34),(3,'Merry',NULL),(4,'Peter',35),(5,'Lily',23);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients_books`
--

DROP TABLE IF EXISTS `clients_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients_books` (
  `client_id` int unsigned NOT NULL,
  `book_id` int unsigned NOT NULL,
  PRIMARY KEY (`client_id`,`book_id`),
  KEY `book_fk` (`book_id`),
  CONSTRAINT `clients_books_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `clients_books_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients_books`
--

LOCK TABLES `clients_books` WRITE;
/*!40000 ALTER TABLE `clients_books` DISABLE KEYS */;
INSERT INTO `clients_books` VALUES (1,1),(1,4),(1,5),(1,7),(2,7),(2,10),(3,12),(2,15),(1,36),(5,36),(1,38),(3,38),(5,38);
/*!40000 ALTER TABLE `clients_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients_cities`
--

DROP TABLE IF EXISTS `clients_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients_cities` (
  `client_id` int unsigned NOT NULL,
  `city_id` int unsigned NOT NULL,
  PRIMARY KEY (`client_id`,`city_id`),
  KEY `city_fk` (`city_id`),
  CONSTRAINT `clients_cities_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `clients_cities_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients_cities`
--

LOCK TABLES `clients_cities` WRITE;
/*!40000 ALTER TABLE `clients_cities` DISABLE KEYS */;
INSERT INTO `clients_cities` VALUES (1,1),(5,1),(3,2),(4,3),(1,4);
/*!40000 ALTER TABLE `clients_cities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-23 13:41:45
