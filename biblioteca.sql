-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 192.168.42.135    Database: biblioteca
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `claveAutor` int NOT NULL,
  `nombre` varchar(60) NOT NULL,
  PRIMARY KEY (`claveAutor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editorial`
--

DROP TABLE IF EXISTS `editorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editorial` (
  `claveEditorial` smallint NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `direccion` varchar(60) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`claveEditorial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editorial`
--

LOCK TABLES `editorial` WRITE;
/*!40000 ALTER TABLE `editorial` DISABLE KEYS */;
/*!40000 ALTER TABLE `editorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ejemplar`
--

DROP TABLE IF EXISTS `ejemplar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ejemplar` (
  `claveEjemplar` int NOT NULL,
  `claveLibro` int NOT NULL,
  `numeroOrden` smallint NOT NULL,
  `edicion` smallint DEFAULT NULL,
  `ubicación` varchar(15) DEFAULT NULL,
  `categoria` char(1) DEFAULT NULL,
  PRIMARY KEY (`claveEjemplar`),
  KEY `claveLibroEjemplar_idx` (`claveLibro`),
  CONSTRAINT `claveLibroEjemplar` FOREIGN KEY (`claveLibro`) REFERENCES `libro` (`claveLibro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ejemplar`
--

LOCK TABLES `ejemplar` WRITE;
/*!40000 ALTER TABLE `ejemplar` DISABLE KEYS */;
/*!40000 ALTER TABLE `ejemplar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escrito_por`
--

DROP TABLE IF EXISTS `escrito_por`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escrito_por` (
  `claveLibro` int NOT NULL,
  `claveAutor` int NOT NULL,
  KEY `claveLibro_idx` (`claveLibro`),
  KEY `claveAutor_idx` (`claveAutor`),
  CONSTRAINT `claveAutor` FOREIGN KEY (`claveAutor`) REFERENCES `autor` (`claveAutor`),
  CONSTRAINT `claveLibro` FOREIGN KEY (`claveLibro`) REFERENCES `libro` (`claveLibro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escrito_por`
--

LOCK TABLES `escrito_por` WRITE;
/*!40000 ALTER TABLE `escrito_por` DISABLE KEYS */;
/*!40000 ALTER TABLE `escrito_por` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro`
--

DROP TABLE IF EXISTS `libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro` (
  `claveLibro` int NOT NULL,
  `titulo` varchar(60) NOT NULL,
  `idioma` varchar(15) DEFAULT NULL,
  `Formato` varchar(15) DEFAULT NULL,
  `claveEditorial` smallint NOT NULL,
  PRIMARY KEY (`claveLibro`),
  KEY `claveEditorialLibro_idx` (`claveEditorial`),
  CONSTRAINT `claveEditorialLibro` FOREIGN KEY (`claveEditorial`) REFERENCES `editorial` (`claveEditorial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro`
--

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamo`
--

DROP TABLE IF EXISTS `prestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamo` (
  `claveSocio` int NOT NULL,
  `claveEjemplar` int NOT NULL,
  `numeroOrden` smallint NOT NULL,
  `fecha_prestamo` date NOT NULL,
  `fecha_devolucion` date NOT NULL,
  `notas` blob,
  KEY `claveSocio_idx` (`claveSocio`),
  KEY `claveEjemplar_idx` (`claveEjemplar`),
  CONSTRAINT `claveEjemplar` FOREIGN KEY (`claveEjemplar`) REFERENCES `ejemplar` (`claveEjemplar`),
  CONSTRAINT `claveSocio` FOREIGN KEY (`claveSocio`) REFERENCES `socio` (`claveSocio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamo`
--

LOCK TABLES `prestamo` WRITE;
/*!40000 ALTER TABLE `prestamo` DISABLE KEYS */;
/*!40000 ALTER TABLE `prestamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socio`
--

DROP TABLE IF EXISTS `socio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socio` (
  `claveSocio` int NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `direccion` varchar(60) DEFAULT NULL,
  `telefono` varchar(15) NOT NULL,
  `categoria` char(1) DEFAULT NULL,
  PRIMARY KEY (`claveSocio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socio`
--

LOCK TABLES `socio` WRITE;
/*!40000 ALTER TABLE `socio` DISABLE KEYS */;
/*!40000 ALTER TABLE `socio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tema`
--

DROP TABLE IF EXISTS `tema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tema` (
  `claveTema` smallint NOT NULL,
  `nombre` varchar(40) NOT NULL,
  PRIMARY KEY (`claveTema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tema`
--

LOCK TABLES `tema` WRITE;
/*!40000 ALTER TABLE `tema` DISABLE KEYS */;
/*!40000 ALTER TABLE `tema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trata_sobre`
--

DROP TABLE IF EXISTS `trata_sobre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trata_sobre` (
  `claveLibro` int NOT NULL,
  `claveTema` smallint NOT NULL,
  KEY `claveLibro_idx` (`claveLibro`),
  KEY `claveTema_idx` (`claveTema`),
  CONSTRAINT `claveLibroSobre` FOREIGN KEY (`claveLibro`) REFERENCES `libro` (`claveLibro`),
  CONSTRAINT `claveTema` FOREIGN KEY (`claveTema`) REFERENCES `tema` (`claveTema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trata_sobre`
--

LOCK TABLES `trata_sobre` WRITE;
/*!40000 ALTER TABLE `trata_sobre` DISABLE KEYS */;
/*!40000 ALTER TABLE `trata_sobre` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-28 12:20:03
