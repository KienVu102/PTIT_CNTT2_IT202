CREATE DATABASE  IF NOT EXISTS `social_network_pro` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `social_network_pro`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: social_network_pro
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `user_id` int NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`),
  KEY `comments_fk_posts` (`post_id`),
  KEY `comments_fk_users` (`user_id`),
  CONSTRAINT `comments_fk_posts` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`) ON DELETE CASCADE,
  CONSTRAINT `comments_fk_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,2,'Ủng hộ bạn! Cố lên nhé.','2026-01-08 16:53:30'),(2,1,3,'Hay đó, mình cũng đang học.','2026-01-08 16:53:30'),(3,2,4,'Mình có tài liệu, bạn cần phần nào?','2026-01-08 16:53:30'),(4,2,5,'Bạn tìm “SQL basics + MySQL” là ra nhiều lắm.','2026-01-08 16:53:30'),(5,3,6,'JOIN đầu khó, sau quen sẽ dễ.','2026-01-08 16:53:30'),(6,3,7,'Bạn thử vẽ bảng ra giấy cho dễ hình dung.','2026-01-08 16:53:30'),(7,4,8,'ERD đúng là cứu cánh.','2026-01-08 16:53:30'),(8,5,9,'Chuẩn hoá giúp giảm lỗi cập nhật dữ liệu.','2026-01-08 16:53:30'),(9,6,10,'Index đặt đúng cột hay lọc/ join là ổn.','2026-01-08 16:53:30'),(10,7,11,'Mini mạng xã hội nghe thú vị đấy!','2026-01-08 16:53:30'),(11,8,12,'InnoDB hỗ trợ transaction và FK tốt hơn.','2026-01-08 16:53:30'),(12,9,13,'Cà phê là chân ái ☕','2026-01-08 16:53:30'),(13,10,14,'GROUP BY nhớ cẩn thận HAVING nhé.','2026-01-08 16:53:30'),(14,11,15,'Subquery dùng vừa đủ thôi kẻo chậm.','2026-01-08 16:53:30'),(15,12,16,'VIEW tiện để tái sử dụng truy vấn.','2026-01-08 16:53:30'),(16,13,17,'Trigger nhớ tránh loop vô hạn.','2026-01-08 16:53:30'),(17,14,18,'Transaction giúp rollback khi lỗi.','2026-01-08 16:53:30'),(18,15,19,'ACID rất quan trọng cho dữ liệu tiền bạc.','2026-01-08 16:53:30'),(19,16,20,'Top bài nhiều like: GROUP BY + ORDER BY.','2026-01-08 16:53:30'),(20,20,2,'Backup xong nhớ test restore nữa.','2026-01-08 16:53:30'),(21,21,3,'Tiếng Việt ok khi dùng utf8mb4.','2026-01-08 16:53:30'),(22,22,4,'Chuẩn rồi, mình từng bị lỗi mất dấu.','2026-01-08 16:53:30'),(23,23,5,'Collation ảnh hưởng sắp xếp và so sánh.','2026-01-08 16:53:30'),(24,24,6,'Chia nhỏ query là cách debug tốt.','2026-01-08 16:53:30'),(25,25,7,'EXPLAIN giúp hiểu vì sao query chậm.','2026-01-08 16:53:30'),(26,26,8,'Index dư thừa sẽ làm insert/update chậm.','2026-01-08 16:53:30'),(27,27,9,'Pending/accepted giống Facebook đó.','2026-01-08 16:53:30'),(28,28,10,'Messages thì nên index theo created_at.','2026-01-08 16:53:30'),(29,29,11,'Notification nhìn “pro” hẳn.','2026-01-08 16:53:30'),(30,30,12,'50 bài tập SQL nghe hấp dẫn!','2026-01-08 16:53:30'),(31,2,13,'Bạn thử dùng sách Murach cũng ổn.','2026-01-08 16:53:30'),(32,3,14,'JOIN nhiều bảng thì đặt alias cho gọn.','2026-01-08 16:53:30'),(33,4,15,'Ràng buộc FK giúp tránh dữ liệu mồ côi.','2026-01-08 16:53:30'),(34,5,16,'Bạn nhớ thêm UNIQUE cho like (post_id,user_id).','2026-01-08 16:53:30'),(35,6,17,'Đúng rồi, mình cũng làm vậy.','2026-01-08 16:53:30'),(36,7,18,'Khi cần hiệu năng, cân nhắc denormalize một chút.','2026-01-08 16:53:30'),(37,8,19,'MySQL 8 có nhiều cải tiến optimizer.','2026-01-08 16:53:30'),(38,9,20,'Chúc bạn học tốt!','2026-01-08 16:53:30');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friends` (
  `user_id` int NOT NULL,
  `friend_id` int NOT NULL,
  `status` enum('pending','accepted','blocked') COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`friend_id`),
  KEY `friends_fk_user2` (`friend_id`),
  CONSTRAINT `friends_fk_user1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `friends_fk_user2` FOREIGN KEY (`friend_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
INSERT INTO `friends` VALUES (1,2,'accepted','2026-01-08 16:53:30'),(1,3,'accepted','2026-01-08 16:53:30'),(2,4,'accepted','2026-01-08 16:53:30'),(3,5,'pending','2026-01-08 16:53:30'),(4,6,'accepted','2026-01-08 16:53:30'),(5,7,'blocked','2026-01-08 16:53:30'),(6,8,'accepted','2026-01-08 16:53:30'),(7,9,'accepted','2026-01-08 16:53:30'),(8,10,'accepted','2026-01-08 16:53:30'),(9,11,'pending','2026-01-08 16:53:30');
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `post_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_id`,`user_id`),
  KEY `likes_fk_users` (`user_id`),
  CONSTRAINT `likes_fk_posts` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`) ON DELETE CASCADE,
  CONSTRAINT `likes_fk_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,2,'2026-01-08 16:53:30'),(1,3,'2026-01-08 16:53:30'),(1,4,'2026-01-08 16:53:30'),(2,1,'2026-01-08 16:53:30'),(2,5,'2026-01-08 16:53:30'),(2,6,'2026-01-08 16:53:30'),(3,7,'2026-01-08 16:53:30'),(3,8,'2026-01-08 16:53:30'),(4,9,'2026-01-08 16:53:30'),(4,10,'2026-01-08 16:53:30'),(5,11,'2026-01-08 16:53:30'),(5,12,'2026-01-08 16:53:30'),(6,13,'2026-01-08 16:53:30'),(6,14,'2026-01-08 16:53:30'),(7,15,'2026-01-08 16:53:30'),(7,16,'2026-01-08 16:53:30'),(8,17,'2026-01-08 16:53:30'),(8,18,'2026-01-08 16:53:30'),(9,19,'2026-01-08 16:53:30'),(9,20,'2026-01-08 16:53:30'),(10,2,'2026-01-08 16:53:30'),(11,3,'2026-01-08 16:53:30'),(12,4,'2026-01-08 16:53:30'),(13,5,'2026-01-08 16:53:30'),(14,6,'2026-01-08 16:53:30');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `sender_id` int NOT NULL,
  `receiver_id` int NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`message_id`),
  KEY `messages_fk_sender` (`sender_id`),
  KEY `messages_fk_receiver` (`receiver_id`),
  KEY `messages_created_at_ix` (`created_at` DESC),
  CONSTRAINT `messages_fk_receiver` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `messages_fk_sender` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,2,'Chào Bình, hôm nay bạn học tới đâu rồi?','2026-01-08 16:53:30'),(2,2,1,'Mình đang luyện JOIN, hơi chóng mặt ?','2026-01-08 16:53:30'),(3,3,4,'Duy ơi, share mình tài liệu MySQL 8 nhé.','2026-01-08 16:53:30'),(4,4,3,'Ok Chi, để mình gửi link sau.','2026-01-08 16:53:30'),(5,5,6,'Hiếu ơi, tối nay học transaction không?','2026-01-08 16:53:30'),(6,6,5,'Ok Hà, 8h nhé!','2026-01-08 16:53:30');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `notification_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`notification_id`),
  KEY `notifications_fk_users` (`user_id`),
  CONSTRAINT `notifications_fk_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,1,'like','Bình đã thích bài viết của bạn.',0,'2026-01-08 16:53:30'),(2,1,'comment','Chi đã bình luận bài viết của bạn.',0,'2026-01-08 16:53:30'),(3,2,'friend','An đã gửi lời mời kết bạn.',0,'2026-01-08 16:53:30'),(4,3,'message','Bạn có tin nhắn mới từ Duy.',0,'2026-01-08 16:53:30'),(5,4,'like','Hà đã thích bài viết của bạn.',0,'2026-01-08 16:53:30'),(6,5,'comment','Hiếu đã bình luận bài viết của bạn.',0,'2026-01-08 16:53:30'),(7,6,'friend','Hoa đã chấp nhận lời mời kết bạn.',0,'2026-01-08 16:53:30');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_id`),
  KEY `posts_fk_users` (`user_id`),
  KEY `posts_created_at_ix` (`created_at` DESC),
  CONSTRAINT `posts_fk_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,1,'Chào mọi người! Hôm nay mình bắt đầu học MySQL.','2026-01-08 16:53:30'),(2,2,'Ai có tài liệu SQL cơ bản cho người mới không?','2026-01-08 16:53:30'),(3,3,'Mình đang luyện JOIN, hơi rối nhưng vui.','2026-01-08 16:53:30'),(4,4,'Thiết kế ERD xong thấy dữ liệu rõ ràng hơn hẳn.','2026-01-08 16:53:30'),(5,5,'Học chuẩn hoá (normalization) giúp tránh trùng dữ liệu.','2026-01-08 16:53:30'),(6,6,'Tối ưu truy vấn: nhớ tạo index đúng chỗ.','2026-01-08 16:53:30'),(7,7,'Mình đang làm mini mạng xã hội bằng MySQL.','2026-01-08 16:53:30'),(8,8,'Bạn nào biết khác nhau giữa InnoDB và MyISAM không?','2026-01-08 16:53:30'),(9,9,'Uống cà phê rồi mới code tiếp thôi ☕','2026-01-08 16:53:30'),(10,10,'Hôm nay học GROUP BY và HAVING.','2026-01-08 16:53:30'),(11,11,'Subquery khó nhưng dùng quen sẽ “đã”.','2026-01-08 16:53:30'),(12,12,'Mình vừa tạo VIEW để xem thống kê bài viết.','2026-01-08 16:53:30'),(13,13,'Trigger dùng để tự tạo thông báo khi có comment.','2026-01-08 16:53:30'),(14,14,'Transaction quan trọng để tránh lỗi dữ liệu giữa chừng.','2026-01-08 16:53:30'),(15,15,'ACID là nền tảng của hệ quản trị CSDL.','2026-01-08 16:53:30'),(16,16,'Mình đang luyện câu truy vấn top bài nhiều like nhất.','2026-01-08 16:53:30'),(17,17,'Có ai muốn cùng luyện SQL mỗi ngày không?','2026-01-08 16:53:30'),(18,18,'Tạo bảng có khoá ngoại giúp dữ liệu “sạch” hơn.','2026-01-08 16:53:30'),(19,19,'Đang tìm cách sinh dữ liệu giả để test hiệu năng.','2026-01-08 16:53:30'),(20,20,'Backup database thường xuyên nhé mọi người!','2026-01-08 16:53:30'),(21,1,'Bài 2: hôm nay mình luyện insert dữ liệu tiếng Việt.','2026-01-08 16:53:30'),(22,2,'Lưu tiếng Việt nhớ dùng utf8mb4.','2026-01-08 16:53:30'),(23,3,'Đừng quên kiểm tra collation nữa.','2026-01-08 16:53:30'),(24,4,'Query phức tạp thì chia nhỏ ra debug dễ hơn.','2026-01-08 16:53:30'),(25,5,'Viết query xong nhớ EXPLAIN để xem plan.','2026-01-08 16:53:30'),(26,6,'Index nhiều quá cũng không tốt, phải cân bằng.','2026-01-08 16:53:30'),(27,7,'Mình thêm chức năng kết bạn: pending/accepted.','2026-01-08 16:53:30'),(28,8,'Nhắn tin (messages) cũng là quan hệ 2 user.','2026-01-08 16:53:30'),(29,9,'Notification giúp mô phỏng giống Facebook.','2026-01-08 16:53:30'),(30,10,'Cuối tuần mình tổng hợp 50 bài tập SQL.','2026-01-08 16:53:30');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('Nam','Nữ') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Nam',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthdate` date DEFAULT NULL,
  `hometown` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'an','Nguyễn Văn An','Nam','an@gmail.com','123','1990-01-01','Hà Nội','2026-01-08 16:53:30'),(2,'binh','Trần Thị Bình','Nữ','binh@gmail.com','123','1992-02-15','TP.HCM','2026-01-08 16:53:30'),(3,'chi','Lê Minh Chi','Nữ','chi@gmail.com','123','1991-03-10','Đà Nẵng','2026-01-08 16:53:30'),(4,'duy','Phạm Quốc Duy','Nam','duy@gmail.com','123','1990-05-20','Hải Phòng','2026-01-08 16:53:30'),(5,'ha','Vũ Thu Hà','Nữ','ha@gmail.com','123','1994-07-25','Hà Nội','2026-01-08 16:53:30'),(6,'hieu','Đặng Hữu Hiếu','Nam','hieu@gmail.com','123','1993-11-30','TP.HCM','2026-01-08 16:53:30'),(7,'hoa','Ngô Mai Hoa','Nữ','hoa@gmail.com','123','1995-04-18','Đà Nẵng','2026-01-08 16:53:30'),(8,'khanh','Bùi Khánh Linh','Nữ','khanh@gmail.com','123','1992-09-12','TP.HCM','2026-01-08 16:53:30'),(9,'lam','Hoàng Đức Lâm','Nam','lam@gmail.com','123','1991-10-05','Hà Nội','2026-01-08 16:53:30'),(10,'linh','Phan Mỹ Linh','Nữ','linh@gmail.com','123','1994-06-22','Đà Nẵng','2026-01-08 16:53:30'),(11,'minh','Nguyễn Minh','Nam','minh@gmail.com','123','1990-12-01','Hà Nội','2026-01-08 16:53:30'),(12,'nam','Trần Quốc Nam','Nam','nam@gmail.com','123','1992-02-05','TP.HCM','2026-01-08 16:53:30'),(13,'nga','Lý Thúy Nga','Nữ','nga@gmail.com','123','1993-08-16','Hà Nội','2026-01-08 16:53:30'),(14,'nhan','Đỗ Hoàng Nhân','Nam','nhan@gmail.com','123','1991-04-20','TP.HCM','2026-01-08 16:53:30'),(15,'phuong','Tạ Kim Phương','Nữ','phuong@gmail.com','123','1990-05-14','Đà Nẵng','2026-01-08 16:53:30'),(16,'quang','Lê Quang','Nam','quang@gmail.com','123','1992-09-25','Hà Nội','2026-01-08 16:53:30'),(17,'son','Nguyễn Thành Sơn','Nam','son@gmail.com','123','1994-03-19','TP.HCM','2026-01-08 16:53:30'),(18,'thao','Trần Thảo','Nữ','thao@gmail.com','123','1993-11-07','Đà Nẵng','2026-01-08 16:53:30'),(19,'trang','Phạm Thu Trang','Nữ','trang@gmail.com','123','1995-06-02','Hà Nội','2026-01-08 16:53:30'),(20,'tuan','Đinh Minh Tuấn','Nam','tuan@gmail.com','123','1990-07-30','TP.HCM','2026-01-08 16:53:30');
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

-- Dump completed on 2026-01-08 16:55:58

-- Ex 1
CREATE OR REPLACE VIEW view_users_firstname AS
SELECT 
    user_id,   
    username,   
    full_name, 
    email,      
    created_at  
FROM users
WHERE full_name LIKE 'Nguyễn %'; 

SELECT * FROM view_users_firstname;


INSERT INTO users(username, full_name, gender, email, password, birthdate, hometown) 
VALUES (
    'nguyen_van_a',      
    'Nguyễn Văn A',      
    'Nam', 
    'a_nguyen@gmail.com', 
    '123', 
    '1995-01-01', 
    'Hà Nội'
);

SELECT * FROM view_users_firstname;


DELETE FROM users 
WHERE username = 'nguyen_van_test'; 

SELECT * FROM view_users_firstname;

-- Ex 2
USE social_network_pro;

-- Hiển thị mã người dùng và tổng số bài viết của họ
CREATE OR REPLACE VIEW view_user_post AS
SELECT 
    user_id, 
    COUNT(post_id) AS total_user_post
FROM posts
GROUP BY user_id;

SELECT * FROM view_user_post;

-- Hiển thị họ tên (full_name) và tổng số bài viết
SELECT 
    u.full_name, 
    vup.total_user_post
FROM users u
JOIN view_user_post vup ON u.user_id = vup.user_id;

-- Ex 3
USE social_network_pro;

-- 1. TRUY VẤN VỚI EXPLAIN ANALYZE
-- Tìm tất cả User ở Hà Nội và kiểm tra hiệu năng thực tế
EXPLAIN ANALYZE 
SELECT * FROM users 
WHERE hometown = 'Hà Nội';

-- 2. TẠO CHỈ MỤC (INDEX)
-- Tạo index cho cột hometown để tăng tốc độ tìm kiếm theo quê quán
CREATE INDEX idx_hometown ON users(hometown);

-- 3. Chạy lại và so sánh
EXPLAIN ANALYZE 
SELECT * FROM users 
WHERE hometown = 'Hà Nội';

-- 4. Xóa chỉ mục
DROP INDEX idx_hometown ON users;




-- Ex 4
-- CHỌN DATABASE ĐỂ LÀM VIỆC
USE social_network_pro;

-- Tạo view_users_firstname: Danh sách người dùng họ "Nguyễn"
CREATE OR REPLACE VIEW view_users_firstname AS
SELECT user_id, username, full_name, email, created_at
FROM users
WHERE full_name LIKE 'Nguyễn %';

-- Hiển thị lại view vừa tạo
SELECT * FROM view_users_firstname;

-- Thêm nhân viên mới vào bảng User có họ "Nguyễn"
INSERT INTO users(username, full_name, gender, email, password, birthdate, hometown) 
VALUES ('nguyen_van_test', 'Nguyễn Văn Test', 'Nam', 'test_nguyen@gmail.com', '123', '1995-01-01', 'Hà Nội');

-- Kiểm tra view 
SELECT * FROM view_users_firstname;

-- Xóa nhân viên vừa thêm và kiểm tra lại view
DELETE FROM users WHERE username = 'nguyen_van_test';
SELECT * FROM view_users_firstname;

-- Tạo view_user_post: Thống kê số bài viết của mỗi User
CREATE OR REPLACE VIEW view_user_post AS
SELECT user_id, COUNT(post_id) AS total_user_post
FROM posts
GROUP BY user_id;

-- Kết hợp view_user_post với bảng users để hiện tên đầy đủ
SELECT u.full_name, vup.total_user_post
FROM users u
JOIN view_user_post vup ON u.user_id = vup.user_id;

--  PHẦN 1: INDEX ĐƠN (Hometown) 

-- Truy vấn tìm User ở Hà Nội trước khi đánh Index
EXPLAIN ANALYZE 
SELECT * FROM users WHERE hometown = 'Hà Nội';

-- Tạo chỉ mục đơn idx_hometown
CREATE INDEX idx_hometown ON users(hometown);

-- Kiểm tra lại sau khi đánh Index
EXPLAIN ANALYZE 
SELECT * FROM users WHERE hometown = 'Hà Nội';


--  PHẦN 2: CHỈ MỤC PHỨC HỢP  

-- Truy vấn tìm bài viết của user_id = 1 trong năm 2026 
EXPLAIN ANALYZE
SELECT post_id, content, created_at 
FROM posts 
WHERE user_id = 1 
  AND created_at BETWEEN '2026-01-01 00:00:00' AND '2026-12-31 23:59:59';

-- Tạo chỉ mục phức hợp idx_created_at_user_id trên bảng posts
CREATE INDEX idx_created_at_user_id ON posts(created_at, user_id);

-- Kiểm tra lại hiệu năng sau khi tạo chỉ mục phức hợp
EXPLAIN ANALYZE
SELECT post_id, content, created_at 
FROM posts 
WHERE user_id = 1 
  AND created_at BETWEEN '2026-01-01 00:00:00' AND '2026-12-31 23:59:59';


--  PHẦN 3: CHỈ MỤC DUY NHẤT  

-- Truy vấn tìm User theo email 
EXPLAIN ANALYZE
SELECT user_id, username, email 
FROM users 
WHERE email = 'an@gmail.com';

-- Tạo chỉ mục duy nhất idx_email trên cột email
CREATE UNIQUE INDEX idx_email ON users(email);

-- Kiểm tra lại hiệu năng sau khi tạo chỉ mục duy nhất
EXPLAIN ANALYZE
SELECT user_id, username, email 
FROM users 
WHERE email = 'an@gmail.com';

--  PHẦN 4: XÓa Chỉ mục 

-- Xóa chỉ mục phức hợp
DROP INDEX idx_created_at_user_id ON posts;

-- Xóa chỉ mục duy nhất
DROP INDEX idx_email ON users;

-- Xóa chỉ mục đơn hometown
DROP INDEX idx_hometown ON users;



-- Ex 5 
USE social_network_pro;

EXPLAIN ANALYZE
SELECT 
    u.username, 
    u.full_name, 
    u.hometown, 
    f.friend_id, 
    f.status
FROM users u
LEFT JOIN friends f ON u.user_id = f.user_id
WHERE u.hometown = 'Hà Nội'
ORDER BY u.username DESC
LIMIT 3;

-- TẠO CHỈ MỤC idx_hometown
CREATE INDEX idx_hometown ON users(hometown);


SELECT 
    u.username, 
    u.full_name, 
    u.hometown, 
    f.friend_id, 
    f.status
FROM users u
LEFT JOIN friends f ON u.user_id = f.user_id
WHERE u.hometown = 'Hà Nội'
ORDER BY u.username DESC
LIMIT 3;

-- KIỂM TRA LẠI VỚI EXPLAIN ANALYZE SAU KHI CÓ CHỈ MỤC
EXPLAIN ANALYZE
SELECT 
    u.username, 
    u.full_name, 
    u.hometown, 
    f.friend_id, 
    f.status
FROM users u
LEFT JOIN friends f ON u.user_id = f.user_id
WHERE u.hometown = 'Hà Nội'
ORDER BY u.username DESC
LIMIT 3;


-- Ex 6
USE social_network_pro;

-- Thống kê số lượng bài viết của từng người dùng
CREATE OR REPLACE VIEW view_users_summary AS
SELECT 
    u.user_id, 
    u.username, 
    COUNT(p.post_id) AS total_posts
FROM users u
LEFT JOIN posts p ON u.user_id = p.user_id
GROUP BY u.user_id, u.username;

-- Hiển thị người dùng có tổng số bài viết lớn hơn 5
SELECT 
    user_id, 
    username, 
    total_posts
FROM view_users_summary
WHERE total_posts > 5;


-- Ex 7
USE social_network_pro;

-- TẠO VIEW view_user_activity_status

CREATE OR REPLACE VIEW view_user_activity_status AS
SELECT 
    u.user_id, 
    u.username, 
    u.gender, 
    u.created_at,
    CASE 
        WHEN EXISTS (SELECT 1 FROM posts p WHERE p.user_id = u.user_id) 
             OR EXISTS (SELECT 1 FROM comments c WHERE c.user_id = u.user_id)
        THEN 'Active'
        ELSE 'Inactive'
    END AS status
FROM users u;

-- TRUY VẤN VIEW VÀ KIỂM TRA KẾT QUẢ
SELECT * FROM view_user_activity_status;

-- THỐNG KÊ SỐ LƯỢNG NGƯỜI DÙNG THEO TRẠNG THÁI

SELECT 
    status, 
    COUNT(user_id) AS user_count
FROM view_user_activity_status
GROUP BY status
ORDER BY user_count DESC;


-- Ex 8
USE social_network_pro;

-- Tối ưu hóa các truy vấn lọc theo giới tính người dùng
CREATE INDEX idx_user_gender ON users(gender);

-- Hiển thị người dùng có số lượng bình luận (comment) > 5
CREATE OR REPLACE VIEW view_highly_interactive_users AS
SELECT 
    u.user_id, 
    u.username, 
    COUNT(c.comment_id) AS comment_count
FROM users u
JOIN comments c ON u.user_id = c.user_id
GROUP BY u.user_id, u.username
HAVING COUNT(c.comment_id) > 5;

-- TRUY VẤN THÔNG TIN TỪ VIEW
SELECT * FROM view_highly_interactive_users;

-- TRUY VẤN KẾT HỢP VIEW VỚI BẢNG POSTS
SELECT 
    v.username, 
    SUM(v.comment_count) AS sum_comment_user
FROM view_highly_interactive_users v
JOIN posts p ON v.user_id = p.user_id
GROUP BY v.user_id, v.username
ORDER BY sum_comment_user DESC;

