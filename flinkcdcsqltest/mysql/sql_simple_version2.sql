-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 192.168.56.101    Database: test_join_1
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
-- Table structure for table `invoice_1`
--

DROP TABLE IF EXISTS `invoice_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_1` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `fpid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `fpmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_1`
--

LOCK TABLES `invoice_1` WRITE;
/*!40000 ALTER TABLE `invoice_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_2`
--

DROP TABLE IF EXISTS `invoice_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_2` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `fpid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `fpmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_2`
--

LOCK TABLES `invoice_2` WRITE;
/*!40000 ALTER TABLE `invoice_2` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_3`
--

DROP TABLE IF EXISTS `invoice_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_3` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `fpid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `fpmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_3`
--

LOCK TABLES `invoice_3` WRITE;
/*!40000 ALTER TABLE `invoice_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_4`
--

DROP TABLE IF EXISTS `invoice_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_4` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `fpid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `fpmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_4`
--

LOCK TABLES `invoice_4` WRITE;
/*!40000 ALTER TABLE `invoice_4` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztxx_1`
--

DROP TABLE IF EXISTS `ztxx_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztxx_1` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `ztmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztxx_1`
--

LOCK TABLES `ztxx_1` WRITE;
/*!40000 ALTER TABLE `ztxx_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `ztxx_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztxx_2`
--

DROP TABLE IF EXISTS `ztxx_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztxx_2` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `ztmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztxx_2`
--

LOCK TABLES `ztxx_2` WRITE;
/*!40000 ALTER TABLE `ztxx_2` DISABLE KEYS */;
/*!40000 ALTER TABLE `ztxx_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztxx_3`
--

DROP TABLE IF EXISTS `ztxx_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztxx_3` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `ztmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztxx_3`
--

LOCK TABLES `ztxx_3` WRITE;
/*!40000 ALTER TABLE `ztxx_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `ztxx_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztxx_4`
--

DROP TABLE IF EXISTS `ztxx_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztxx_4` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `ztmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztxx_4`
--

LOCK TABLES `ztxx_4` WRITE;
/*!40000 ALTER TABLE `ztxx_4` DISABLE KEYS */;
/*!40000 ALTER TABLE `ztxx_4` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-29  0:08:59
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 192.168.56.101    Database: test_join_2
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
-- Table structure for table `invoice_1`
--

DROP TABLE IF EXISTS `invoice_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_1` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `fpid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `fpmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_1`
--

LOCK TABLES `invoice_1` WRITE;
/*!40000 ALTER TABLE `invoice_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_2`
--

DROP TABLE IF EXISTS `invoice_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_2` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `fpid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `fpmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_2`
--

LOCK TABLES `invoice_2` WRITE;
/*!40000 ALTER TABLE `invoice_2` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_3`
--

DROP TABLE IF EXISTS `invoice_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_3` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `fpid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `fpmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_3`
--

LOCK TABLES `invoice_3` WRITE;
/*!40000 ALTER TABLE `invoice_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_4`
--

DROP TABLE IF EXISTS `invoice_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_4` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `fpid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `fpmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_4`
--

LOCK TABLES `invoice_4` WRITE;
/*!40000 ALTER TABLE `invoice_4` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztxx_1`
--

DROP TABLE IF EXISTS `ztxx_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztxx_1` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `ztmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztxx_1`
--

LOCK TABLES `ztxx_1` WRITE;
/*!40000 ALTER TABLE `ztxx_1` DISABLE KEYS */;
INSERT INTO `ztxx_1` VALUES (1,'zsdf','sdf');
/*!40000 ALTER TABLE `ztxx_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztxx_2`
--

DROP TABLE IF EXISTS `ztxx_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztxx_2` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `ztmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztxx_2`
--

LOCK TABLES `ztxx_2` WRITE;
/*!40000 ALTER TABLE `ztxx_2` DISABLE KEYS */;
/*!40000 ALTER TABLE `ztxx_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztxx_3`
--

DROP TABLE IF EXISTS `ztxx_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztxx_3` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `ztmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztxx_3`
--

LOCK TABLES `ztxx_3` WRITE;
/*!40000 ALTER TABLE `ztxx_3` DISABLE KEYS */;
INSERT INTO `ztxx_3` VALUES (1,'1234','牛牛有限公司');
/*!40000 ALTER TABLE `ztxx_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztxx_4`
--

DROP TABLE IF EXISTS `ztxx_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztxx_4` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `ztmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztxx_4`
--

LOCK TABLES `ztxx_4` WRITE;
/*!40000 ALTER TABLE `ztxx_4` DISABLE KEYS */;
/*!40000 ALTER TABLE `ztxx_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztxx_invoice_join_sink`
--

DROP TABLE IF EXISTS `ztxx_invoice_join_sink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztxx_invoice_join_sink` (
  `database_name` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `table_name` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `fpid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `fpmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `ztmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`database_name`,`table_name`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztxx_invoice_join_sink`
--

LOCK TABLES `ztxx_invoice_join_sink` WRITE;
/*!40000 ALTER TABLE `ztxx_invoice_join_sink` DISABLE KEYS */;
INSERT INTO `ztxx_invoice_join_sink` VALUES ('test_join_3','invoice_2',1,'是','是否','是',NULL),('test_join_3','invoice_2',2,'1','1','扭了二零',NULL),('test_join_4','invoice_2',1,'11','11','牛乐豆11','勇敢牛牛不怕困难'),('test_join_4','invoice_2',2,'12','111','牛乐豆111','勇敢牛牛2不怕困难');
/*!40000 ALTER TABLE `ztxx_invoice_join_sink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztxx_sink`
--

DROP TABLE IF EXISTS `ztxx_sink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztxx_sink` (
  `database_name` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `table_name` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `ztmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`database_name`,`table_name`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztxx_sink`
--

LOCK TABLES `ztxx_sink` WRITE;
/*!40000 ALTER TABLE `ztxx_sink` DISABLE KEYS */;
INSERT INTO `ztxx_sink` VALUES ('test_join_2','ztxx_1',1,'zsdf','sdf'),('test_join_3','ztxx_3',1,'11','勇敢牛牛不怕困难');
/*!40000 ALTER TABLE `ztxx_sink` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-29  0:08:59
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 192.168.56.101    Database: test_join_4
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
-- Table structure for table `invoice_1`
--

DROP TABLE IF EXISTS `invoice_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_1` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `fpid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `fpmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_1`
--

LOCK TABLES `invoice_1` WRITE;
/*!40000 ALTER TABLE `invoice_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_2`
--

DROP TABLE IF EXISTS `invoice_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_2` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `fpid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `fpmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_2`
--

LOCK TABLES `invoice_2` WRITE;
/*!40000 ALTER TABLE `invoice_2` DISABLE KEYS */;
INSERT INTO `invoice_2` VALUES (1,'11','11','牛乐豆11'),(2,'12','111','牛乐豆111');
/*!40000 ALTER TABLE `invoice_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_3`
--

DROP TABLE IF EXISTS `invoice_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_3` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `fpid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `fpmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_3`
--

LOCK TABLES `invoice_3` WRITE;
/*!40000 ALTER TABLE `invoice_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_4`
--

DROP TABLE IF EXISTS `invoice_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_4` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `fpid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `fpmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_4`
--

LOCK TABLES `invoice_4` WRITE;
/*!40000 ALTER TABLE `invoice_4` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztxx_1`
--

DROP TABLE IF EXISTS `ztxx_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztxx_1` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `ztmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztxx_1`
--

LOCK TABLES `ztxx_1` WRITE;
/*!40000 ALTER TABLE `ztxx_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `ztxx_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztxx_2`
--

DROP TABLE IF EXISTS `ztxx_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztxx_2` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `ztmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztxx_2`
--

LOCK TABLES `ztxx_2` WRITE;
/*!40000 ALTER TABLE `ztxx_2` DISABLE KEYS */;
/*!40000 ALTER TABLE `ztxx_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztxx_3`
--

DROP TABLE IF EXISTS `ztxx_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztxx_3` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `ztmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztxx_3`
--

LOCK TABLES `ztxx_3` WRITE;
/*!40000 ALTER TABLE `ztxx_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `ztxx_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztxx_4`
--

DROP TABLE IF EXISTS `ztxx_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztxx_4` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `ztmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztxx_4`
--

LOCK TABLES `ztxx_4` WRITE;
/*!40000 ALTER TABLE `ztxx_4` DISABLE KEYS */;
/*!40000 ALTER TABLE `ztxx_4` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-29  0:08:59
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 192.168.56.101    Database: test_join_3
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
-- Table structure for table `invoice_1`
--

DROP TABLE IF EXISTS `invoice_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_1` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `fpid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `fpmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_1`
--

LOCK TABLES `invoice_1` WRITE;
/*!40000 ALTER TABLE `invoice_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_2`
--

DROP TABLE IF EXISTS `invoice_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_2` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `fpid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `fpmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_2`
--

LOCK TABLES `invoice_2` WRITE;
/*!40000 ALTER TABLE `invoice_2` DISABLE KEYS */;
INSERT INTO `invoice_2` VALUES (1,'是','是否','是'),(2,'1','1','扭了二零');
/*!40000 ALTER TABLE `invoice_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_3`
--

DROP TABLE IF EXISTS `invoice_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_3` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `fpid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `fpmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_3`
--

LOCK TABLES `invoice_3` WRITE;
/*!40000 ALTER TABLE `invoice_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_4`
--

DROP TABLE IF EXISTS `invoice_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_4` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `fpid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `fpmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_4`
--

LOCK TABLES `invoice_4` WRITE;
/*!40000 ALTER TABLE `invoice_4` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztxx_1`
--

DROP TABLE IF EXISTS `ztxx_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztxx_1` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `ztmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztxx_1`
--

LOCK TABLES `ztxx_1` WRITE;
/*!40000 ALTER TABLE `ztxx_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `ztxx_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztxx_2`
--

DROP TABLE IF EXISTS `ztxx_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztxx_2` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `ztmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztxx_2`
--

LOCK TABLES `ztxx_2` WRITE;
/*!40000 ALTER TABLE `ztxx_2` DISABLE KEYS */;
/*!40000 ALTER TABLE `ztxx_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztxx_3`
--

DROP TABLE IF EXISTS `ztxx_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztxx_3` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `ztmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztxx_3`
--

LOCK TABLES `ztxx_3` WRITE;
/*!40000 ALTER TABLE `ztxx_3` DISABLE KEYS */;
INSERT INTO `ztxx_3` VALUES (1,'11','勇敢牛牛不怕困难'),(2,'12','勇敢牛牛2不怕困难');
/*!40000 ALTER TABLE `ztxx_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztxx_4`
--

DROP TABLE IF EXISTS `ztxx_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztxx_4` (
  `id` int(11) NOT NULL,
  `ztid` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `ztmc` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztxx_4`
--

LOCK TABLES `ztxx_4` WRITE;
/*!40000 ALTER TABLE `ztxx_4` DISABLE KEYS */;
/*!40000 ALTER TABLE `ztxx_4` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-29  0:08:59
