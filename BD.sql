-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: crina
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `clienti`
--

DROP TABLE IF EXISTS `clienti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clienti` (
  `idclient` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nume` varchar(45) DEFAULT NULL,
  `adresa` varchar(45) DEFAULT NULL,
  `telefon` varchar(45) DEFAULT NULL,
  `mail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idclient`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clienti`
--

LOCK TABLES `clienti` WRITE;
/*!40000 ALTER TABLE `clienti` DISABLE KEYS */;
INSERT INTO `clienti` VALUES (1,'Antonia','Dumitru','0720834172','Dumitru'),(3,'Stefan Abageru','Stefanesti','0723703400','stefanabageru@yahoo.com'),(5,'Alex Jujanss','Targu Jiu','07205929456','alexjujan@yahoo.GFHGJ'),(9,'Maluroiu-Vladut Razvan','Babeni','0720834172','Babeni'),(10,'dasd','adasdasd','0712548559','adasdasdAAAA'),(12,'Radu Crina','Babeni','0723703402','Babeni'),(13,'Radu Crina','Babeni','0723703402','Babeni');
/*!40000 ALTER TABLE `clienti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comenzi`
--

DROP TABLE IF EXISTS `comenzi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comenzi` (
  `idcomanda` bigint unsigned NOT NULL AUTO_INCREMENT,
  `valoare` varchar(45) DEFAULT NULL,
  `tipprodus` varchar(45) DEFAULT NULL,
  `cantitate` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcomanda`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comenzi`
--

LOCK TABLES `comenzi` WRITE;
/*!40000 ALTER TABLE `comenzi` DISABLE KEYS */;
INSERT INTO `comenzi` VALUES (1,'320','Red Velvetw','1'),(3,'250','Profiterol cu zmeuras','1'),(9,'1234','qweqwe','12'),(11,'100','asdasd','10');
/*!40000 ALTER TABLE `comenzi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `furnizori`
--

DROP TABLE IF EXISTS `furnizori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `furnizori` (
  `idfurnizor` bigint unsigned NOT NULL AUTO_INCREMENT,
  `idclient` bigint unsigned DEFAULT NULL,
  `idcomanda` bigint unsigned DEFAULT NULL,
  `adresa` varchar(45) DEFAULT NULL,
  `tipprodus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idfurnizor`),
  KEY `fk1_idx` (`idclient`),
  KEY `fk2_idx` (`idcomanda`),
  CONSTRAINT `fk1` FOREIGN KEY (`idclient`) REFERENCES `clienti` (`idclient`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk2` FOREIGN KEY (`idcomanda`) REFERENCES `comenzi` (`idcomanda`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `furnizori`
--

LOCK TABLES `furnizori` WRITE;
/*!40000 ALTER TABLE `furnizori` DISABLE KEYS */;
INSERT INTO `furnizori` VALUES (1,1,1,'yghi','yiouj'),(2,1,1,'AAAA','werewrw'),(3,1,1,'victoriei','tort cioco');
/*!40000 ALTER TABLE `furnizori` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-06 10:46:21
