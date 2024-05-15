CREATE DATABASE  IF NOT EXISTS `webgiay` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `webgiay`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: webgiay
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `seo` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjmi40wjksyok9mo6409mo107b` (`create_by`),
  KEY `FKqsm2u5h9adbpnh564lve5ahln` (`update_by`),
  CONSTRAINT `FKjmi40wjksyok9mo6409mo107b` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`id`),
  CONSTRAINT `FKqsm2u5h9adbpnh564lve5ahln` FOREIGN KEY (`update_by`) REFERENCES `tbl_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_category`
--

LOCK TABLES `tbl_category` WRITE;
/*!40000 ALTER TABLE `tbl_category` DISABLE KEYS */;
INSERT INTO `tbl_category` VALUES (3,'giày nam',1,1,'2024-04-11 00:00:00',NULL,1,'',NULL),(4,'giày nữ',1,1,'2024-04-11 00:00:00',NULL,1,'',NULL),(5,'giày trẻ em',1,1,'2024-04-13 00:00:00',NULL,1,'',NULL),(6,'giày nội địa',1,1,'2024-04-13 00:00:00',NULL,1,'',NULL);
/*!40000 ALTER TABLE `tbl_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_contact`
--

DROP TABLE IF EXISTS `tbl_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `lastname` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `mobile` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `address` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `request_type` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `message` varchar(1200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_contact`
--

LOCK TABLES `tbl_contact` WRITE;
/*!40000 ALTER TABLE `tbl_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_news`
--

DROP TABLE IF EXISTS `tbl_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_news` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKprr8k6vddl4w4qigr2dj2qqrq` (`create_by`),
  KEY `FK2jl8ldvnvey5wn7xujnv49pkv` (`update_by`),
  CONSTRAINT `FK2jl8ldvnvey5wn7xujnv49pkv` FOREIGN KEY (`update_by`) REFERENCES `tbl_user` (`id`),
  CONSTRAINT `FKprr8k6vddl4w4qigr2dj2qqrq` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_news`
--

LOCK TABLES `tbl_news` WRITE;
/*!40000 ALTER TABLE `tbl_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_product`
--

DROP TABLE IF EXISTS `tbl_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `avatar` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `sale_price` decimal(15,2) DEFAULT NULL,
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `is_hot` tinyint DEFAULT NULL,
  `short_description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `detail_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `seo` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `sort_by` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category_product_idx` (`category_id`),
  KEY `FKq3ba8cumoa4c4ttae8jsu4rlg` (`create_by`),
  KEY `FK1ofdgdw34cmqy0cexshy2txx5` (`update_by`),
  CONSTRAINT `FK1ofdgdw34cmqy0cexshy2txx5` FOREIGN KEY (`update_by`) REFERENCES `tbl_user` (`id`),
  CONSTRAINT `fk_category_product` FOREIGN KEY (`category_id`) REFERENCES `tbl_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKq3ba8cumoa4c4ttae8jsu4rlg` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_product`
--

LOCK TABLES `tbl_product` WRITE;
/*!40000 ALTER TABLE `tbl_product` DISABLE KEYS */;
INSERT INTO `tbl_product` VALUES (1,3,'GIẦY VẢI THƯỢNG ĐÌNH HV 14-3','Product/Avatar/EPN01_1.webp',100000.00,90000.00,1,1,'2024-04-13 00:00:00','2024-05-11 00:00:00',1,1,'','',NULL,NULL),(2,3,'GIẦY VẢI THƯỢNG ĐÌNH HV 14-2','Product/Avatar/50817bab-3f9a-4bcc-95db-456dd3e194f9.webp',100000.00,90000.00,1,1,'2024-04-13 00:00:00','2024-04-23 00:00:00',0,0,'','',NULL,NULL),(3,4,'GIẦY THƯỢNG ĐÌNH DB06','Product/Avatar/c5abf8f7-1fd1-483b-a6fe-69eb16ddd547.webp',200000.00,190000.00,1,1,'2024-04-14 00:00:00','2024-05-15 00:00:00',1,1,'','',NULL,NULL),(4,5,'GIẦY VẢI THƯỢNG ĐÌNH BD05','Product/Avatar/BD05_1.webp',150000.00,120000.00,1,1,'2024-04-14 00:00:00','2024-05-11 00:00:00',1,1,'','',NULL,NULL),(5,3,'GIẦY VẢI THƯỢNG ĐÌNH BD05','Product/Avatar/c5abf8f7-1fd1-483b-a6fe-69eb16ddd547.webp',150000.00,120000.00,1,1,'2024-04-14 00:00:00','2024-04-23 00:00:00',0,1,'','',NULL,NULL),(6,6,'GIẦY VẢI THƯỢNG ĐÌNH EPN01','Product/Avatar/ae5ee53e-9ed5-41ee-a852-425e796cf43f.webp',150000.00,120000.00,1,1,'2024-04-14 00:00:00','2024-04-23 00:00:00',0,1,'','',NULL,NULL),(7,3,'GIẦY VẢI THƯỢNG ĐÌNH BD05','Product/Avatar/50817bab-3f9a-4bcc-95db-456dd3e194f9.webp',100000.00,NULL,1,1,'2024-04-20 00:00:00',NULL,0,0,'','',NULL,NULL),(8,3,'GIẦY THỂ THAO THỜI TRANG NAM','Product/Avatar/70092fbf-6e8d-4e3c-9f9d-73ec82cae9a3.webp',200000.00,NULL,1,1,'2024-04-24 00:00:00',NULL,1,0,'','',NULL,NULL),(9,3,'GIẦY VẢI THƯỢNG ĐÌNH BD61','Product/Avatar/BD16_1.webp',250000.00,NULL,1,1,'2024-05-11 00:00:00',NULL,1,0,'Chất liệu vải thô bền, nhẹ và đẹp.\r\nĐế giày đinh nhựa chống trơn trượt, đế khâu.\r\nThích hợp cho chơi đá bóng, đi bộ và các hoạt động ngoài trời.','',NULL,NULL),(10,3,'GIẦY VẢI THƯỢNG ĐÌNH KT 14-1','Product/Avatar/KK14-1_1.webp',140000.00,NULL,1,1,'2024-05-11 00:00:00',NULL,1,0,'Đế giày cao su kếp, mang lại cảm giác êm ái.\r\nThiết kế mũi da bảo vệ ngón chân khỏi tổn thương.','',NULL,NULL),(11,4,'GIẦY VẢI THƯỢNG ĐÌNH EP02','Product/Avatar/EP02_1.webp',200000.00,NULL,1,1,'2024-05-11 00:00:00',NULL,1,0,'','Giày lười (vải) đế cao su sản phẩm chính hãng của Giày Thượng Đình, Việt Nam.\r\n\r\nSản phẩm giày lười phù hợp cho công việc bảo hộ, thể thao, chạy bộ\r\n\r\nChất liệu: vải tổng hợp\r\nXuất xứ: Việt Nam\r\nMàu sắc: Trắng, Xanh, Đen',NULL,NULL),(12,3,'GIẦY VẢI THƯỢNG ĐÌNH TD9905','Product/Avatar/0106a804-00a6-43c0-865f-f11a8c815e61.webp',270000.00,NULL,1,1,'2024-05-11 00:00:00','2024-05-11 00:00:00',1,1,'','',NULL,NULL),(13,5,'GIẦY THƯỢNG ĐÌNH Q01','Product/Avatar/356e5ab9-52a1-47c4-a084-e7c70360aa30.webp',300000.00,NULL,1,1,'2024-05-11 00:00:00','2024-05-11 00:00:00',1,1,'','',NULL,NULL),(14,3,'GIẦY VẢI THƯỢNG ĐÌNH KK14-2','Product/Avatar/e7f74e61-25c3-4ac5-80f1-75ff3eb70a2c.webp',150000.00,140000.00,1,1,'2024-05-11 00:00:00',NULL,1,0,'','',NULL,NULL),(15,3,'GIẦY VẢI THƯỢNG ĐÌNH TD9916','Product/Avatar/EPN01_4.webp',110000.00,NULL,1,1,'2024-05-11 00:00:00',NULL,1,0,'','',NULL,NULL);
/*!40000 ALTER TABLE `tbl_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_product_image`
--

DROP TABLE IF EXISTS `tbl_product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_product_image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `title` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `path` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_image_product_idx` (`product_id`),
  CONSTRAINT `fk_product_image_product` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_product_image`
--

LOCK TABLES `tbl_product_image` WRITE;
/*!40000 ALTER TABLE `tbl_product_image` DISABLE KEYS */;
INSERT INTO `tbl_product_image` VALUES (8,8,'img-0491-copy.webp','Product/Image/img-0491-copy.webp',NULL,NULL,'2024-04-24 21:41:07',NULL,1),(9,9,'BD16_4.webp','Product/Image/BD16_4.webp',NULL,NULL,'2024-05-11 13:40:10',NULL,1),(10,9,'BD16_1.webp','Product/Image/BD16_1.webp',NULL,NULL,'2024-05-11 13:40:09',NULL,1),(11,9,'BD16_2.webp','Product/Image/BD16_2.webp',NULL,NULL,'2024-05-11 13:40:09',NULL,1),(12,9,'BD16_3.webp','Product/Image/BD16_3.webp',NULL,NULL,'2024-05-11 13:40:09',NULL,1),(13,10,'KK14-1_1.webp','Product/Image/KK14-1_1.webp',NULL,NULL,'2024-05-11 13:41:40',NULL,1),(14,10,'KK14-1_4.webp','Product/Image/KK14-1_4.webp',NULL,NULL,'2024-05-11 13:41:40',NULL,1),(15,10,'KK14-1_2.webp','Product/Image/KK14-1_2.webp',NULL,NULL,'2024-05-11 13:41:40',NULL,1),(16,10,'KK14-1_3.webp','Product/Image/KK14-1_3.webp',NULL,NULL,'2024-05-11 13:41:40',NULL,1),(17,1,'EPN01_3.webp','Product/Image/EPN01_3.webp',NULL,NULL,'2024-05-11 13:44:06',NULL,1),(18,1,'EPN01_4.webp','Product/Image/EPN01_4.webp',NULL,NULL,'2024-05-11 13:44:06',NULL,1),(19,1,'EPN01_1.webp','Product/Image/EPN01_1.webp',NULL,NULL,'2024-05-11 13:44:06',NULL,1),(20,1,'EPN01_2.webp','Product/Image/EPN01_2.webp',NULL,NULL,'2024-05-11 13:44:06',NULL,1),(21,4,'BD05_2.webp','Product/Image/BD05_2.webp',NULL,NULL,'2024-05-11 13:45:16',NULL,1),(22,4,'BD05_3.webp','Product/Image/BD05_3.webp',NULL,NULL,'2024-05-11 13:45:16',NULL,1),(23,4,'BD05_4.webp','Product/Image/BD05_4.webp',NULL,NULL,'2024-05-11 13:45:16',NULL,1),(24,4,'BD05_1.webp','Product/Image/BD05_1.webp',NULL,NULL,'2024-05-11 13:45:16',NULL,1),(25,11,'EP02_4.webp','Product/Image/EP02_4.webp',NULL,NULL,'2024-05-11 13:54:03',NULL,1),(26,11,'EP02_1.webp','Product/Image/EP02_1.webp',NULL,NULL,'2024-05-11 13:54:03',NULL,1),(27,11,'EP02_3.webp','Product/Image/EP02_3.webp',NULL,NULL,'2024-05-11 13:54:03',NULL,1),(28,11,'EP02_2.webp','Product/Image/EP02_2.webp',NULL,NULL,'2024-05-11 13:54:03',NULL,1),(29,12,'0106a804-00a6-43c0-865f-f11a8c815e61.webp','Product/Image/0106a804-00a6-43c0-865f-f11a8c815e61.webp',NULL,NULL,'2024-05-11 13:56:36',NULL,1),(30,12,'356e5ab9-52a1-47c4-a084-e7c70360aa30.webp','Product/Image/356e5ab9-52a1-47c4-a084-e7c70360aa30.webp',NULL,NULL,'2024-05-11 13:56:36',NULL,1),(31,12,'5a16833a-abbc-41b8-9e19-9df526f9e7e8.webp','Product/Image/5a16833a-abbc-41b8-9e19-9df526f9e7e8.webp',NULL,NULL,'2024-05-11 13:56:36',NULL,1),(32,12,'8950eee9-423e-4c36-8385-8db9cc126544.webp','Product/Image/8950eee9-423e-4c36-8385-8db9cc126544.webp',NULL,NULL,'2024-05-11 13:56:36',NULL,1),(33,13,'356e5ab9-52a1-47c4-a084-e7c70360aa30.webp','Product/Image/356e5ab9-52a1-47c4-a084-e7c70360aa30.webp',NULL,NULL,'2024-05-11 14:01:44',NULL,1),(34,13,'2968f9c0-f1db-4fc4-a533-6eae838bf8a5.webp','Product/Image/2968f9c0-f1db-4fc4-a533-6eae838bf8a5.webp',NULL,NULL,'2024-05-11 14:01:44',NULL,1),(35,13,'851192b0-b451-40ff-aed9-b3da8ef2907b.webp','Product/Image/851192b0-b451-40ff-aed9-b3da8ef2907b.webp',NULL,NULL,'2024-05-11 14:01:44',NULL,1),(36,13,'8950eee9-423e-4c36-8385-8db9cc126544.webp','Product/Image/8950eee9-423e-4c36-8385-8db9cc126544.webp',NULL,NULL,'2024-05-11 14:01:44',NULL,1),(37,14,'4b139528-a5c9-4711-a7b4-558e1487b76d.webp','Product/Image/4b139528-a5c9-4711-a7b4-558e1487b76d.webp',NULL,NULL,'2024-05-11 14:51:56',NULL,1),(38,14,'268edaeb-e481-451c-a8dd-c0e05a05c714.webp','Product/Image/268edaeb-e481-451c-a8dd-c0e05a05c714.webp',NULL,NULL,'2024-05-11 14:51:56',NULL,1),(39,14,'e7f74e61-25c3-4ac5-80f1-75ff3eb70a2c.webp','Product/Image/e7f74e61-25c3-4ac5-80f1-75ff3eb70a2c.webp',NULL,NULL,'2024-05-11 14:51:56',NULL,1),(40,14,'1521cfe8-f21d-4d3e-b73d-d270fc32fe3c.webp','Product/Image/1521cfe8-f21d-4d3e-b73d-d270fc32fe3c.webp',NULL,NULL,'2024-05-11 14:51:56',NULL,1),(41,15,'6765c044-d45a-4ace-ba94-c681de597b8d.webp','Product/Image/6765c044-d45a-4ace-ba94-c681de597b8d.webp',NULL,NULL,'2024-05-11 14:53:56',NULL,1),(42,15,'80baef40-2801-47e4-93e7-cd0b13783800.webp','Product/Image/80baef40-2801-47e4-93e7-cd0b13783800.webp',NULL,NULL,'2024-05-11 14:53:56',NULL,1),(43,15,'f1931bd2-9bfe-409d-87fb-2a85d149fa59.webp','Product/Image/f1931bd2-9bfe-409d-87fb-2a85d149fa59.webp',NULL,NULL,'2024-05-11 14:53:56',NULL,1),(44,15,'d12f5ca4-f33c-4c8b-86ff-e2220dde0640.webp','Product/Image/d12f5ca4-f33c-4c8b-86ff-e2220dde0640.webp',NULL,NULL,'2024-05-11 14:53:56',NULL,1),(45,3,'BD05_2.webp','Product/Image/BD05_2.webp',NULL,NULL,'2024-05-15 20:41:58',NULL,1),(46,3,'BD05_3.webp','Product/Image/BD05_3.webp',NULL,NULL,'2024-05-15 20:41:58',NULL,1);
/*!40000 ALTER TABLE `tbl_product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_role`
--

DROP TABLE IF EXISTS `tbl_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgfiday9xow82vjo3jtv1u3dpo` (`create_by`),
  KEY `FKopw8xlj1lb8gcyl3d2oq61nqv` (`update_by`),
  CONSTRAINT `FKgfiday9xow82vjo3jtv1u3dpo` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`id`),
  CONSTRAINT `FKopw8xlj1lb8gcyl3d2oq61nqv` FOREIGN KEY (`update_by`) REFERENCES `tbl_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_role`
--

LOCK TABLES `tbl_role` WRITE;
/*!40000 ALTER TABLE `tbl_role` DISABLE KEYS */;
INSERT INTO `tbl_role` VALUES (2,'admin',1,1,'2024-04-14 00:00:00',NULL,1,''),(3,'khach hang',1,1,'2024-04-14 00:00:00',NULL,1,'');
/*!40000 ALTER TABLE `tbl_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sale_order`
--

DROP TABLE IF EXISTS `tbl_sale_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_sale_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `code` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `total` decimal(15,2) DEFAULT NULL,
  `customer_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `customer_mobile` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `customer_email` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `customer_address` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sale_order_user_idx` (`user_id`),
  KEY `FK8mneld0xhnhbc3q4ndv9jntsp` (`create_by`),
  KEY `FKk5js7ga7bhr9qbsj29xhlf55e` (`update_by`),
  CONSTRAINT `FK8mneld0xhnhbc3q4ndv9jntsp` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`id`),
  CONSTRAINT `fk_sale_order_user` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKk5js7ga7bhr9qbsj29xhlf55e` FOREIGN KEY (`update_by`) REFERENCES `tbl_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sale_order`
--

LOCK TABLES `tbl_sale_order` WRITE;
/*!40000 ALTER TABLE `tbl_sale_order` DISABLE KEYS */;
INSERT INTO `tbl_sale_order` VALUES (1,1,'1234',100000.00,'luan','098374567',NULL,'hn',1,NULL,'2024-05-07 00:00:00',NULL,1),(2,1,'1233',500000.00,'nguyen','0393111999',NULL,'hp',1,NULL,'2024-04-24 00:00:00',NULL,1),(3,1,'03032283324202448',150000.00,'long','03032283324',NULL,'hn',1,NULL,'2024-03-22 00:00:00',NULL,1),(4,1,'032345775202448',100000.00,'anh','032345775',NULL,'hp',1,NULL,'2024-02-23 00:00:00',NULL,1),(5,1,'0234932435202448',1150000.00,'nguyễn văn nguyên','0234932435',NULL,'hn',1,NULL,'2024-01-11 00:00:00',NULL,1),(6,1,'0234932435202448',1300000.00,'anh','0234932435',NULL,'hd',1,NULL,'2024-02-10 00:00:00',NULL,1),(7,1,'0394324675202448',700000.00,'luân','0394324675',NULL,'kiên giang',1,NULL,'2024-06-14 00:00:00',NULL,1),(8,1,'0394324675202448',550000.00,'anh','0394324675',NULL,'hn',1,NULL,'2024-02-22 00:00:00',NULL,1),(9,1,'098374567202449',200000.00,'luan','098374567',NULL,'hn',1,NULL,'2024-03-10 00:00:00',NULL,1),(10,1,'0987898765202449',200000.00,'ngô ánh','0987898765',NULL,'hải phòng',1,NULL,'2024-01-27 00:00:00',NULL,0);
/*!40000 ALTER TABLE `tbl_sale_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sale_order_product`
--

DROP TABLE IF EXISTS `tbl_sale_order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_sale_order_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sale_order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sale_order_idx` (`sale_order_id`),
  KEY `fk_sale_product_idx` (`product_id`),
  CONSTRAINT `fk_sale_order` FOREIGN KEY (`sale_order_id`) REFERENCES `tbl_sale_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sale_product` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sale_order_product`
--

LOCK TABLES `tbl_sale_order_product` WRITE;
/*!40000 ALTER TABLE `tbl_sale_order_product` DISABLE KEYS */;
INSERT INTO `tbl_sale_order_product` VALUES (1,1,7,NULL,NULL,NULL,NULL,1,NULL,1),(2,2,2,NULL,NULL,NULL,NULL,1,NULL,7),(3,3,6,NULL,NULL,NULL,NULL,1,NULL,1),(4,4,2,NULL,NULL,NULL,NULL,1,NULL,1),(5,5,6,NULL,NULL,NULL,NULL,1,NULL,5),(6,5,8,NULL,NULL,NULL,NULL,1,NULL,2),(7,6,2,NULL,NULL,NULL,NULL,1,NULL,7),(8,6,7,NULL,NULL,NULL,NULL,1,NULL,6),(9,7,1,NULL,NULL,NULL,NULL,1,NULL,1),(10,7,2,NULL,NULL,NULL,NULL,1,NULL,2),(11,7,3,NULL,NULL,NULL,NULL,1,NULL,2),(12,8,5,NULL,NULL,NULL,NULL,1,NULL,1),(13,8,8,NULL,NULL,NULL,NULL,1,NULL,2),(14,9,2,NULL,NULL,NULL,NULL,1,NULL,1),(15,9,1,NULL,NULL,NULL,NULL,1,NULL,1),(16,10,3,NULL,NULL,NULL,NULL,1,NULL,1);
/*!40000 ALTER TABLE `tbl_sale_order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `mobile` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `address` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `avatar` varchar(300) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_create_by_user_idx` (`create_by`),
  KEY `fk_update_by_user_idx` (`update_by`),
  CONSTRAINT `fk_create_by_user` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_update_by_user` FOREIGN KEY (`update_by`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (1,'admin','$2a$04$aHxvCx6nSWKeC8yt4bFj/uBkmuTrSlyGXC9.TWXmOfmcN0enZ6WTq','nguyen','0393177999','hn1999@gmail.com','hp',1,1,NULL,NULL,1,'',NULL),(2,'khach hang','$2a$04$aHxvCx6nSWKeC8yt4bFj/uBkmuTrSlyGXC9.TWXmOfmcN0enZ6WTq','hoàng Luân','098374567','haha@gmail.com','hải phòng',NULL,NULL,NULL,NULL,1,NULL,'User/Avatar/tải xuống.jpg'),(3,'nguyen123','$2a$04$aHxvCx6nSWKeC8yt4bFj/uBkmuTrSlyGXC9.TWXmOfmcN0enZ6WTq','nguyen','0393111999','huhu@gmail.com','',NULL,NULL,NULL,NULL,1,NULL,'User/Avatar/tải xuống.jpg'),(4,'hihi','$2a$04$aHxvCx6nSWKeC8yt4bFj/uBkmuTrSlyGXC9.TWXmOfmcN0enZ6WTq','Nguyễn văn Nguyên ','1234567897','dqdqd@gmail.com','hp',1,1,'2024-04-29 00:00:00',NULL,1,'',NULL),(5,'nguyenhi','$2a$04$aHxvCx6nSWKeC8yt4bFj/uBkmuTrSlyGXC9.TWXmOfmcN0enZ6WTq','Nguyễn văn Nguyên jj','0393123123','hi@gmail.com','hn',1,1,'2024-04-29 00:00:00',NULL,1,'',NULL),(6,'anh123','E:\\DoAn\\WebGiay\\FileUploads\\','Ngô quốc áng','03931232342','hhqq@gmail.com','phú quốc',1,1,'2024-05-09 00:00:00',NULL,1,'',NULL),(7,'nguyen22','$2a$04$JYPdfneamNGBeA0EsQtm9uCmyKQwercJyP2V/BuooGuvcVzTQg2fK','nguyễn văn nguyên','0394245656','12aa2@gmail.com','hà nội',NULL,NULL,NULL,NULL,1,NULL,NULL),(8,'nguyen22','$2a$04$MipCiwB5fJXD7tTYpzBZ4OmXuylp.w.zjc8egU/hSUNnv.vC766mS','','','','',NULL,NULL,NULL,NULL,1,NULL,NULL),(9,'nguyen2','$2a$04$6CualUYov16k6othsmsjvOhpRZXrz0/2ruoZENYTwLXTXIqsE8psW','111','','','',NULL,NULL,NULL,NULL,1,NULL,NULL),(10,'nguyen12','$2a$04$k3nncguMT6603cFMpaWg6OQfsxWaeiEEyU9yupQyZewHGcKXnQqlG','','','','',NULL,NULL,NULL,NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user_role`
--

DROP TABLE IF EXISTS `tbl_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_user_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_role_idx` (`user_id`),
  KEY `fk_role_user_idx` (`role_id`),
  CONSTRAINT `fk_role_user` FOREIGN KEY (`role_id`) REFERENCES `tbl_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_role` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user_role`
--

LOCK TABLES `tbl_user_role` WRITE;
/*!40000 ALTER TABLE `tbl_user_role` DISABLE KEYS */;
INSERT INTO `tbl_user_role` VALUES (1,1,2),(24,2,3),(25,3,3),(26,4,3),(27,5,3),(28,7,3),(29,8,3),(30,9,3),(31,10,3);
/*!40000 ALTER TABLE `tbl_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-15 20:50:47
