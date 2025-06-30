-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: biblioteca
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

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
-- Table structure for table `acervo`
--

DROP TABLE IF EXISTS `acervo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acervo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `autor` int(11) NOT NULL,
  `curso` int(11) DEFAULT NULL,
  `multa` int(11) DEFAULT NULL,
  `biblioteca` int(11) NOT NULL,
  `data_publi` datetime NOT NULL,
  `orgao_publi` varchar(30) NOT NULL,
  `area_conhec` varchar(30) NOT NULL,
  `tamanho` varchar(30) DEFAULT NULL,
  `n_paginas` int(5) NOT NULL DEFAULT 1,
  `data_insert` datetime NOT NULL,
  `aquisicao` varchar(30) DEFAULT NULL,
  `n_exemplares` tinyint(2) DEFAULT NULL,
  `tipo` enum('Físico','Periódico') DEFAULT NULL,
  `n_eventos` tinyint(4) NOT NULL DEFAULT 0,
  `n_consultas` int(3) NOT NULL DEFAULT 0,
  `procedencia` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_acervo_autor` (`autor`),
  KEY `fk_acervo_multa` (`multa`),
  KEY `fk_acervo_biblioteca` (`biblioteca`),
  KEY `fk_acervo_curso` (`curso`),
  CONSTRAINT `fk_acervo_autor` FOREIGN KEY (`autor`) REFERENCES `autor` (`ID`),
  CONSTRAINT `fk_acervo_biblioteca` FOREIGN KEY (`biblioteca`) REFERENCES `biblioteca` (`ID`),
  CONSTRAINT `fk_acervo_curso` FOREIGN KEY (`curso`) REFERENCES `curso` (`ID`),
  CONSTRAINT `fk_acervo_multa` FOREIGN KEY (`multa`) REFERENCES `multa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acervo`
--

LOCK TABLES `acervo` WRITE;
/*!40000 ALTER TABLE `acervo` DISABLE KEYS */;
INSERT INTO `acervo` VALUES (1,'Anti-Édipo',3,1,1,1,'2010-06-15 09:00:00','Editora 34','psicologia','20.45 X 18.6',340,'2025-06-13 00:00:00','Compra',1,'Físico',0,0,'Biblioteca de Maceió');
/*!40000 ALTER TABLE `acervo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) NOT NULL,
  `nascimento` date NOT NULL,
  `genero` enum('M','F','HT','MT','NB','AG','I','GF','Q','AN','OU','PNI') DEFAULT NULL,
  `nacionalidade` varchar(30) DEFAULT NULL,
  `area_formacao` varchar(30) DEFAULT NULL,
  `n_publi_acervo` tinyint(3) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'Gilles Deleuze','1925-01-18','M','França','Filosofia',2),(2,'Michel Foucault','1926-10-15','M','França','Psicologia',1),(3,'Félix Guattari','1930-04-30','M','França','Psicanálise',2);
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autor_publi_acervo`
--

DROP TABLE IF EXISTS `autor_publi_acervo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor_publi_acervo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `autor` int(11) DEFAULT NULL,
  `acervo` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `autor` (`autor`),
  KEY `acervo` (`acervo`),
  CONSTRAINT `autor_publi_acervo_ibfk_1` FOREIGN KEY (`autor`) REFERENCES `autor` (`ID`),
  CONSTRAINT `autor_publi_acervo_ibfk_2` FOREIGN KEY (`acervo`) REFERENCES `acervo` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor_publi_acervo`
--

LOCK TABLES `autor_publi_acervo` WRITE;
/*!40000 ALTER TABLE `autor_publi_acervo` DISABLE KEYS */;
INSERT INTO `autor_publi_acervo` VALUES (1,1,1),(4,2,1);
/*!40000 ALTER TABLE `autor_publi_acervo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biblioteca`
--

DROP TABLE IF EXISTS `biblioteca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biblioteca` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `endereco` varchar(30) NOT NULL,
  `n_acervo` int(5) DEFAULT 0,
  `telefone` bigint(11) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `hor_funcionamento` varchar(100) NOT NULL,
  `responsavel` int(11) DEFAULT NULL,
  `polo` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_bibliotecario` (`responsavel`),
  KEY `fk_polo` (`polo`),
  CONSTRAINT `fk_bibliotecario` FOREIGN KEY (`responsavel`) REFERENCES `bibliotecario` (`ID`),
  CONSTRAINT `fk_polo` FOREIGN KEY (`polo`) REFERENCES `polo` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblioteca`
--

LOCK TABLES `biblioteca` WRITE;
/*!40000 ALTER TABLE `biblioteca` DISABLE KEYS */;
INSERT INTO `biblioteca` VALUES (1,'Biblioteca do Polo Arapiraca','Bloco A sala 3',3450,8235427689,'biblioteca@ufal.com.br','8h às 18h de segunda a sexta',1,1);
/*!40000 ALTER TABLE `biblioteca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bibliotecario`
--

DROP TABLE IF EXISTS `bibliotecario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bibliotecario` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) NOT NULL,
  `registro` int(7) DEFAULT NULL,
  `telefone` bigint(11) DEFAULT NULL,
  `biblioteca` int(11) DEFAULT NULL,
  `genero` enum('M','F','HT','MT','NB','AG','I','GF','Q','AN','OU','PNI') NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_biblioteca` (`biblioteca`),
  CONSTRAINT `fk_biblioteca` FOREIGN KEY (`biblioteca`) REFERENCES `biblioteca` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bibliotecario`
--

LOCK TABLES `bibliotecario` WRITE;
/*!40000 ALTER TABLE `bibliotecario` DISABLE KEYS */;
INSERT INTO `bibliotecario` VALUES (1,'Magna',167895,82996445126,NULL,'F');
/*!40000 ALTER TABLE `bibliotecario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `n_inscritos` tinyint(1) NOT NULL,
  `polo` int(11) DEFAULT NULL,
  `coordenador` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_curso_polo` (`polo`),
  KEY `fk_curso_usuario` (`coordenador`),
  CONSTRAINT `fk_curso_polo` FOREIGN KEY (`polo`) REFERENCES `polo` (`ID`),
  CONSTRAINT `fk_curso_usuario` FOREIGN KEY (`coordenador`) REFERENCES `usuario` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'Psicologia',32,1,2);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso_pertence_polo`
--

DROP TABLE IF EXISTS `curso_pertence_polo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso_pertence_polo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `curso` int(11) DEFAULT NULL,
  `polo` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `curso` (`curso`),
  KEY `polo` (`polo`),
  CONSTRAINT `curso_pertence_polo_ibfk_1` FOREIGN KEY (`curso`) REFERENCES `curso` (`ID`),
  CONSTRAINT `curso_pertence_polo_ibfk_2` FOREIGN KEY (`polo`) REFERENCES `polo` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso_pertence_polo`
--

LOCK TABLES `curso_pertence_polo` WRITE;
/*!40000 ALTER TABLE `curso_pertence_polo` DISABLE KEYS */;
INSERT INTO `curso_pertence_polo` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `curso_pertence_polo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `data_emprestimo` datetime NOT NULL,
  `data_devolucao` datetime DEFAULT NULL,
  `tipo_evento` tinyint(1) NOT NULL,
  `natureza_evento` varchar(30) NOT NULL,
  `biblioteca` int(11) DEFAULT NULL,
  `multa` int(11) DEFAULT NULL,
  `acervo` int(11) DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_evento_biblioteca` (`biblioteca`),
  KEY `fk_evento_multa` (`multa`),
  KEY `fk_evento_usuario` (`usuario`),
  CONSTRAINT `fk_evento_biblioteca` FOREIGN KEY (`biblioteca`) REFERENCES `biblioteca` (`ID`),
  CONSTRAINT `fk_evento_multa` FOREIGN KEY (`multa`) REFERENCES `multa` (`ID`),
  CONSTRAINT `fk_evento_usuario` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (1,'2025-06-12 09:00:00','2025-06-21 00:00:00',0,'Emprestimo de livros',1,1,1,1);
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multa`
--

DROP TABLE IF EXISTS `multa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multa` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `data_criacao` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `usuario` int(11) DEFAULT NULL,
  `biblioteca` int(11) DEFAULT NULL,
  `evento` int(11) DEFAULT NULL,
  `valor` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_multa_usuario` (`usuario`),
  KEY `fk_multa_evento` (`evento`),
  KEY `fk_multa_biblioteca` (`biblioteca`),
  CONSTRAINT `fk_multa_biblioteca` FOREIGN KEY (`biblioteca`) REFERENCES `biblioteca` (`ID`),
  CONSTRAINT `fk_multa_evento` FOREIGN KEY (`evento`) REFERENCES `evento` (`ID`),
  CONSTRAINT `fk_multa_usuario` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multa`
--

LOCK TABLES `multa` WRITE;
/*!40000 ALTER TABLE `multa` DISABLE KEYS */;
INSERT INTO `multa` VALUES (1,'2025-04-12 00:00:00',1,1,1,1,3.00);
/*!40000 ALTER TABLE `multa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polo`
--

DROP TABLE IF EXISTS `polo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `polo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `telefone` bigint(11) NOT NULL,
  `endereco` varchar(30) NOT NULL,
  `hor_funcionamento` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polo`
--

LOCK TABLES `polo` WRITE;
/*!40000 ALTER TABLE `polo` DISABLE KEYS */;
INSERT INTO `polo` VALUES (1,'Arapiraca',8231351818,'Av. 113, 3','8h às 18h de segunda a sexta'),(2,'Maceió',8232531000,'Av. 115, 3','8h às 18h de segunda a sexta');
/*!40000 ALTER TABLE `polo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) NOT NULL,
  `email` varchar(30) NOT NULL,
  `matricula` bigint(11) DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `telefone` bigint(11) DEFAULT NULL,
  `vinculo` enum('Docente','Discente') NOT NULL,
  `status` tinyint(1) NOT NULL,
  `polo` int(11) DEFAULT NULL,
  `curso` int(11) DEFAULT NULL,
  `multa` int(11) DEFAULT NULL,
  `genero` enum('M','F','HT','MT','NB','AG','I','GF','Q','AN','OU','PNI') NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `matricula` (`matricula`),
  KEY `fk_polo_usuario` (`polo`),
  KEY `fk_usuario_curso` (`curso`),
  KEY `fk_usuario_multa` (`multa`),
  CONSTRAINT `fk_polo_usuario` FOREIGN KEY (`polo`) REFERENCES `polo` (`ID`),
  CONSTRAINT `fk_usuario_curso` FOREIGN KEY (`curso`) REFERENCES `curso` (`ID`),
  CONSTRAINT `fk_usuario_multa` FOREIGN KEY (`multa`) REFERENCES `multa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Charlie Bellow','charlie@email.com',15861245639,'1994-01-16',829925467856,'Discente',1,1,1,1,'HT'),(2,'David Bernardo','david@email.com',20861245435,'1985-05-05',829945667885,'Docente',1,1,1,1,'M');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_consulta_acervo`
--

DROP TABLE IF EXISTS `usuario_consulta_acervo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_consulta_acervo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` int(11) DEFAULT NULL,
  `acervo` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `usuario` (`usuario`),
  KEY `acervo` (`acervo`),
  CONSTRAINT `usuario_consulta_acervo_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`ID`),
  CONSTRAINT `usuario_consulta_acervo_ibfk_2` FOREIGN KEY (`acervo`) REFERENCES `acervo` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_consulta_acervo`
--

LOCK TABLES `usuario_consulta_acervo` WRITE;
/*!40000 ALTER TABLE `usuario_consulta_acervo` DISABLE KEYS */;
INSERT INTO `usuario_consulta_acervo` VALUES (1,1,1),(3,2,1);
/*!40000 ALTER TABLE `usuario_consulta_acervo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-30 11:45:21
