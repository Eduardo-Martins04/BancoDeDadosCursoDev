CREATE DATABASE  IF NOT EXISTS `db_prova` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_prova`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_prova
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `celular` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `github_usuario` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (1,'Eduardo Martins','4998838-9944','dudumartinss2004@gmail.com','Eduardo-Martins04'),(2,'Mauricio J S Ramos','4999178-2727','mauriciojsr@gmail.com','Mauriciojsr');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno_prova`
--

DROP TABLE IF EXISTS `aluno_prova`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno_prova` (
  `aluno_id` int NOT NULL,
  `prova_id` int NOT NULL,
  PRIMARY KEY (`prova_id`,`aluno_id`),
  KEY `prova_id_idx` (`prova_id`),
  KEY `aluno_id_idx` (`aluno_id`),
  CONSTRAINT `aluno_id` FOREIGN KEY (`aluno_id`) REFERENCES `aluno` (`id`),
  CONSTRAINT `prova_id` FOREIGN KEY (`prova_id`) REFERENCES `prova` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_prova`
--

LOCK TABLES `aluno_prova` WRITE;
/*!40000 ALTER TABLE `aluno_prova` DISABLE KEYS */;
INSERT INTO `aluno_prova` VALUES (1,784),(2,784);
/*!40000 ALTER TABLE `aluno_prova` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pergunta`
--

DROP TABLE IF EXISTS `pergunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pergunta` (
  `id` int NOT NULL,
  `pergunta` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `prova_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pergunta_prova1_idx` (`prova_id`),
  CONSTRAINT `pergunta_prova1` FOREIGN KEY (`prova_id`) REFERENCES `prova` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pergunta`
--

LOCK TABLES `pergunta` WRITE;
/*!40000 ALTER TABLE `pergunta` DISABLE KEYS */;
INSERT INTO `pergunta` VALUES (2,'O que ?? um banco de dados?',784),(3,'Explique o que ?? um SGBD e cite exemplos.',784),(4,'O que s??o DML, DCL, DDL e DQL?',784),(5,'O que ?? uma Entidade?',784),(6,'Descreva o que ?? uma chave prim??ria.',784),(7,'Descreva o que ?? chave estrangeira.',784),(8,'Cite a diferen??a entre chave primaria e chave estrangeira.',784),(9,'Um campo do tipo char armazena quais valores? E do tipo int, varchar, date, datetime?',784),(10,'Explique a(s) diferen??as entre os tipos Time, Year, DateTime e Date?',784),(11,'Explique p/ que serve a instru????o DELETE.',784);
/*!40000 ALTER TABLE `pergunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prova`
--

DROP TABLE IF EXISTS `prova`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prova` (
  `id` int NOT NULL,
  `disciplina` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prova`
--

LOCK TABLES `prova` WRITE;
/*!40000 ALTER TABLE `prova` DISABLE KEYS */;
INSERT INTO `prova` VALUES (784,'Banco de Dados Relacionais e SQL');
/*!40000 ALTER TABLE `prova` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resposta`
--

DROP TABLE IF EXISTS `resposta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resposta` (
  `id` int NOT NULL,
  `resposta` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pergunta_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `resposta_pergunta1_idx` (`pergunta_id`),
  CONSTRAINT `resposta_pergunta1` FOREIGN KEY (`pergunta_id`) REFERENCES `pergunta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resposta`
--

LOCK TABLES `resposta` WRITE;
/*!40000 ALTER TABLE `resposta` DISABLE KEYS */;
INSERT INTO `resposta` VALUES (101,'?? uma cole????o organizada de informa????es/dados\nrelacionados entre si, que s??o armazenados em um sistema de computador.',2),(102,'Sistema de gerenciamento de banco de dados (SGBD) ?? um conjunto de programas respons??vel por gerenciar\num banco de dados. Exemplos: Oracle, PostgreSQL, MySQL Workbanch.',3),(103,'DML(Linguagem de manipula????o de dados) ?? um conjunto de instru????es para consulta e modifica????o de dados\narmazenados nas tabelas do banco. Exemplos: INSERT, UPDATE, DELETE.\nDCL(Linguagem de controle de dados) usadas para dar controle de acesso e gerenciamento de permiss??es para os usu??rios do banco.\nExemplos: GRANT, REVOKE, DENY.\nDDL(Linguagem de defini????o de dados) usadas para criar e modificar as estruturas dos objetos armazenados no banco.\nExemplos: ALTER, DROP, CREATE\nDQL(Linguagem de consulta de dados) utilizada para fazer uma consulta ao banco de dados. Exemplo: SELECT.',4),(104,'?? um tipo de modelagem conceitual, o qual procura representar, de maneira abstrata, os objetos de um dom??nio de neg??cios,\n descrevendo as suas caracter??sticas e relacionamentos. Exemplos na prova seriam: aluno, pergunta.',5),(105,'?? utilizada para designar a coluna da tabela que ser?? respons??vel pela identifica????o unica dos registros,\nimpedindo que existam dois ou mais registros com o mesmo dado.',6),(106,'?? usada para relacionar os registos entre tabelas, identifica em uma tabela a coluna que pode armazenar\nos valores da chave prim??ria de outra tabela.',7),(107,'Chave prim??ria ?? usada para garantir que os dados na coluna espec??fica sejam exclusivos. \nJ?? uma chave estrangeira ?? uma coluna ou grupo de colunas em uma tabela de banco de dados relacional que fornece \num link entre os dados em duas tabelas.',8),(108,'CHAR = Caracteres de tamano fixo, INT = Valores n??mericos inteiros, VARCHAR = Caracteres de tamanho vari??vel.\nDATE = Datas. DATETIME = Espec??fica datas e horas com uma precis??o indicada pelo qualificador.',9),(109,'TIME: Horas na faixa entre -838:59:59 at?? 838:59:59. Formato padr??o: ???hh;mm:ss???\nYEAR: Ano nos formatos de 2 ou 4 d??gitos. O padr??o ?? ano com quatro d??gitos, com valores permiss??veis de 1901 a 2155.\nJ?? no formato de 2 d??gitos, o intervalo aceito ?? de (19)70 at?? (20)69.\nDATETIME: Espec??fica datas e horas.\nDATE: Refere-se a uma data espec??fica do calend??rio.',10),(110,'DELETE (DML) ?? utilizado para excluir determinados registros em uma tabela.\nExemplo: DELETE FROM nome_tabela WHERE id = 1;',11);
/*!40000 ALTER TABLE `resposta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_prova'
--

--
-- Dumping routines for database 'db_prova'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-19 11:02:42
