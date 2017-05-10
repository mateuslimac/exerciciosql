-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: aeroporto
-- ------------------------------------------------------
-- Server version	5.7.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aeroportos`
--

DROP TABLE IF EXISTS `aeroportos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aeroportos` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aeroportos`
--

LOCK TABLES `aeroportos` WRITE;
/*!40000 ALTER TABLE `aeroportos` DISABLE KEYS */;
/*!40000 ALTER TABLE `aeroportos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avioes`
--

DROP TABLE IF EXISTS `avioes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avioes` (
  `codigo` int(11) NOT NULL,
  `cod_modelo` int(11) NOT NULL,
  `data_fabric` datetime NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avioes`
--

LOCK TABLES `avioes` WRITE;
/*!40000 ALTER TABLE `avioes` DISABLE KEYS */;
/*!40000 ALTER TABLE `avioes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fabricantes`
--

DROP TABLE IF EXISTS `fabricantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fabricantes` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cnpj` char(14) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `cnpj` (`cnpj`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fabricantes`
--

LOCK TABLES `fabricantes` WRITE;
/*!40000 ALTER TABLE `fabricantes` DISABLE KEYS */;
/*!40000 ALTER TABLE `fabricantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionarios` (
  `matricula` int(11) NOT NULL,
  `cpf` char(11) NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`matricula`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelos`
--

DROP TABLE IF EXISTS `modelos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modelos` (
  `codigo` int(11) NOT NULL,
  `cod_fabricante` int(11) NOT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `qt_passageiros` int(11) NOT NULL DEFAULT '0',
  `num_turbinas` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`codigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelos`
--

LOCK TABLES `modelos` WRITE;
/*!40000 ALTER TABLE `modelos` DISABLE KEYS */;
/*!40000 ALTER TABLE `modelos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoas`
--

DROP TABLE IF EXISTS `pessoas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoas` (
  `cpf` char(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `num_ident` varchar(15) NOT NULL,
  `org_emissor` varchar(15) NOT NULL,
  `cpf_conjuge` char(11) DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE KEY `num_ident` (`num_ident`,`org_emissor`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoas`
--

LOCK TABLES `pessoas` WRITE;
/*!40000 ALTER TABLE `pessoas` DISABLE KEYS */;
/*!40000 ALTER TABLE `pessoas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voos`
--

DROP TABLE IF EXISTS `voos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voos` (
  `numero` int(11) NOT NULL,
  `cod_aviao` int(11) NOT NULL,
  `cod_aer_par` int(11) NOT NULL,
  `cod_aer_che` int(11) NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voos`
--

LOCK TABLES `voos` WRITE;
/*!40000 ALTER TABLE `voos` DISABLE KEYS */;
/*!40000 ALTER TABLE `voos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voos_passageiros`
--

DROP TABLE IF EXISTS `voos_passageiros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voos_passageiros` (
  `num_voo` int(11) NOT NULL,
  `cpf_passageiro` char(11) NOT NULL,
  `num_assento` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_voo`,`cpf_passageiro`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voos_passageiros`
--

LOCK TABLES `voos_passageiros` WRITE;
/*!40000 ALTER TABLE `voos_passageiros` DISABLE KEYS */;
/*!40000 ALTER TABLE `voos_passageiros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voos_tripulantes`
--

DROP TABLE IF EXISTS `voos_tripulantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voos_tripulantes` (
  `num_voo` int(11) NOT NULL,
  `mat_tripulante` int(11) NOT NULL,
  PRIMARY KEY (`num_voo`,`mat_tripulante`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voos_tripulantes`
--

LOCK TABLES `voos_tripulantes` WRITE;
/*!40000 ALTER TABLE `voos_tripulantes` DISABLE KEYS */;
/*!40000 ALTER TABLE `voos_tripulantes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-09 21:35:54
