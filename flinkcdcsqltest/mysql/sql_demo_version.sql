-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 192.168.56.101    Database: test1
-- ------------------------------------------------------
-- Server version	5.7.26-log

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
-- Table structure for table `table_a`
--

DROP TABLE IF EXISTS `table_a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_a` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `ztmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_a`
--

LOCK TABLES `table_a` WRITE;
/*!40000 ALTER TABLE `table_a` DISABLE KEYS */;
INSERT INTO `table_a` VALUES (1,'sfsdf','sdfff'),(2,'22','222');
/*!40000 ALTER TABLE `table_a` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_a_1`
--

DROP TABLE IF EXISTS `table_a_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_a_1` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `ztmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_a_1`
--

LOCK TABLES `table_a_1` WRITE;
/*!40000 ALTER TABLE `table_a_1` DISABLE KEYS */;
INSERT INTO `table_a_1` VALUES (111,'手动阀手动阀','士大夫是是发士大夫');
/*!40000 ALTER TABLE `table_a_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_a_2`
--

DROP TABLE IF EXISTS `table_a_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_a_2` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `ztmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_a_2`
--

LOCK TABLES `table_a_2` WRITE;
/*!40000 ALTER TABLE `table_a_2` DISABLE KEYS */;
INSERT INTO `table_a_2` VALUES (1,'11','table2'),(2,'2','table2'),(3,'手动阀手动阀','table2'),(5,'ss','table2');
/*!40000 ALTER TABLE `table_a_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_a_3`
--

DROP TABLE IF EXISTS `table_a_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_a_3` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `ztmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_a_3`
--

LOCK TABLES `table_a_3` WRITE;
/*!40000 ALTER TABLE `table_a_3` DISABLE KEYS */;
INSERT INTO `table_a_3` VALUES (1,'11','table3');
/*!40000 ALTER TABLE `table_a_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_a_sum`
--

DROP TABLE IF EXISTS `table_a_sum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_a_sum` (
  `id` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `ztmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `source` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_a_sum`
--

LOCK TABLES `table_a_sum` WRITE;
/*!40000 ALTER TABLE `table_a_sum` DISABLE KEYS */;
INSERT INTO `table_a_sum` VALUES ('table_a1','sfsdf','sdfff','table_a'),('table_a2','22','222','table_a'),('table_a_1111','手动阀手动阀','士大夫是是发士大夫','table_a_1'),('table_a_21','11','table2','table_a_2'),('table_a_22','2','table2','table_a_2'),('table_a_23','手动阀手动阀','table2','table_a_2'),('table_a_25','ss','table2','table_a_2'),('table_a_31','11','table3','table_a_3');
/*!40000 ALTER TABLE `table_a_sum` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-29  0:10:28
