-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: localhost    Database: ols
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `announcement`
--

DROP TABLE IF EXISTS `announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement` (
  `user_id` int NOT NULL,
  `time_of_ann` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(45) NOT NULL,
  `announcement_text` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement`
--

LOCK TABLES `announcement` WRITE;
/*!40000 ALTER TABLE `announcement` DISABLE KEYS */;
INSERT INTO `announcement` VALUES (8,'2020-12-05 21:03:12','New Book Added','We have added The Perks of Being A Wallflower by Stephen Chbosky to our library!');
/*!40000 ALTER TABLE `announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkoutLog`
--

DROP TABLE IF EXISTS `checkoutLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkoutLog` (
  `user_id` int NOT NULL,
  `title` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkoutLog`
--

LOCK TABLES `checkoutLog` WRITE;
/*!40000 ALTER TABLE `checkoutLog` DISABLE KEYS */;
INSERT INTO `checkoutLog` VALUES (3,'The Perks of Being a Wallflower'),(7,'The Perks of Being a Wallflower'),(8,'The Perks of Being A Wallflower'),(8,'The Perks of Being a Wallflower'),(3,'The Perks of Being a Wallflower'),(8,'The Shining'),(10,'The Perks of Being a Wallflower'),(10,'The Shining'),(7,'The Perks of Being a Wallflower'),(8,'The Shining');
/*!40000 ALTER TABLE `checkoutLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `author` varchar(45) NOT NULL,
  `book_desc` varchar(1000) NOT NULL,
  `publisher` varchar(45) NOT NULL,
  `material_type` varchar(45) NOT NULL,
  `release_date` date NOT NULL,
  `file_size` decimal(4,2) DEFAULT NULL,
  `ISBN` varchar(45) DEFAULT NULL,
  `genre` varchar(45) NOT NULL,
  `extra_genre` varchar(45) DEFAULT NULL,
  `extra_genre2` varchar(45) DEFAULT NULL,
  `category` varchar(45) NOT NULL,
  `book_cover_img` blob,
  `dig_rights_info` varchar(45) DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `checked_out_by` int DEFAULT NULL,
  `day_checked_out` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`),
  FULLTEXT KEY `author` (`author`,`title`,`publisher`,`genre`,`extra_genre`,`extra_genre2`,`material_type`),
  FULLTEXT KEY `author_2` (`author`,`title`,`genre`,`extra_genre`,`extra_genre2`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,'The Perks of Being a Wallflower','Stephen Chbosky','The Perks of Being a Wallflower is a young adult coming-of-age epistolary novel by American writer Stephen Chbosky, which was first published on February 1, 1999, by Pocket Books.','Pocket Books','PDF_eBook','1999-02-01',9.00,'123','Young_Adult','Fiction','Romance','book','','digital rights','2020-12-28',7,'2020-12-07 10:28:09'),(2,'The Shining','Stephen King','The Shining centers on the life of Jack Torrance, a struggling writer and recovering alcoholic who accepts a position as the off-season caretaker of the historic Overlook Hotel in the Colorado Rockies. His family accompanies him on this job, including his young son Danny Torrance, who possesses \"the shining\", an array of psychic abilities that allow Danny to see the hotel\'s horrific past. Soon, after a winter storm leaves them snowbound, the supernatural forces inhabiting the hotel influence Jack\'s sanity, leaving his wife and son in incredible danger.','Doubleday','PDF_eBook','1977-01-28',3.00,'456','Horror','Fiction',NULL,'book',NULL,'dig right','2020-12-28',8,'2020-12-07 10:29:06');
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(45) NOT NULL,
  `access_type` varchar(45) NOT NULL,
  `top_notch_member_num` int DEFAULT NULL,
  `library_member_num` int DEFAULT NULL,
  `overdue_fines` decimal(4,2) DEFAULT NULL,
  `materials_overdue_id` int DEFAULT NULL,
  `materials_prev_checked_out_id` int DEFAULT NULL,
  `materials_returned_id` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Manuel','Perez','','','mdperez@sdsu.edu','',1,1,0.00,1,2,3),(2,'test','test','','','test@test.com','',1,1,0.00,1,2,3),(3,'fd','fd','fd','fd','fd@fd','Patron',NULL,NULL,NULL,NULL,NULL,NULL),(4,'asdf','g','g','g','g@g','Staff',NULL,NULL,NULL,NULL,NULL,NULL),(5,'asd','asd','asd','asd','asd@asd','Patron',NULL,NULL,NULL,NULL,NULL,NULL),(6,'Lety','Olguin','gletisiaor','papssword','gletisia@mail.net','Patron',NULL,NULL,NULL,NULL,NULL,NULL),(7,'patron','patron','patron','pass','patron@patron.com','Patron',NULL,NULL,NULL,NULL,NULL,NULL),(8,'staff','staff','staff','pass','staff@staff.com','Staff',NULL,NULL,NULL,NULL,NULL,NULL),(9,'David','Perez','zPhM','password','zphm@gmail.com','Patron',NULL,NULL,NULL,NULL,NULL,NULL),(10,'a','a','a','a','a@a','Patron',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-07 10:34:15
