-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: repository_jti
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document` (
  `id_document` varchar(10) NOT NULL,
  `doc_name` varchar(150) DEFAULT NULL,
  `doc_type` varchar(15) DEFAULT NULL,
  `abstract` varchar(1000) DEFAULT NULL,
  `upload_date` date DEFAULT NULL,
  `id_user` varchar(15) NOT NULL,
  PRIMARY KEY (`id_document`),
  KEY `fk_document_user_idx` (`id_user`),
  CONSTRAINT `fk_document_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

/*!40000 ALTER TABLE `document` DISABLE KEYS */;
INSERT INTO `document` VALUES ('DOC_1','JOBSHEET 14 ALGORITMA STRUKTUR DATA','modul','lorem ipsum','2024-07-01','198107052005011'),('DOC_2','JOBSHEET 11 BASIS DATA','modul','lorem ipsum','2024-06-30','198107052005011'),('DOC_3','Skripsi: Pengaruh Penjualan Permainan Berbayar terhadap Finansial Mahasiswa JTI Polinema','skripsi D-IV','lorem ipsum dolot sit amet','2024-06-29','2341720183'),('DOC_4','Aplikasi Pengembangan Game Akses Terbuka','artikel jurnal','Surat keterangan sakit dari dokter','2024-06-29','2341720183'),('DOC_5','Laporan Anak Yang Ikut Kegiatan Minat Bakat','surat tugas','Data anak yang ikut kegiatan minat bakat','2024-06-23','197803272003122');
/*!40000 ALTER TABLE `document` ENABLE KEYS */;

--
-- Table structure for table `download`
--

DROP TABLE IF EXISTS `download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `download` (
  `total_download` int(11) DEFAULT NULL,
  `id_user` varchar(15) NOT NULL,
  `id_document` varchar(10) NOT NULL,
  PRIMARY KEY (`id_user`,`id_document`),
  KEY `fk_download_document1_idx` (`id_document`),
  CONSTRAINT `fk_download_document1` FOREIGN KEY (`id_document`) REFERENCES `document` (`id_document`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_download_user1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `download`
--

/*!40000 ALTER TABLE `download` DISABLE KEYS */;
INSERT INTO `download` VALUES (2,'198107052005011','DOC_3'),(1,'2341720129','DOC_3'),(1,'2341720171','DOC_5'),(1,'2341720172','DOC_5'),(1,'2341720183','DOC_1'),(1,'2341720183','DOC_5'),(1,'2341720234','DOC_5');
/*!40000 ALTER TABLE `download` ENABLE KEYS */;

--
-- Table structure for table `mentioned_user`
--

DROP TABLE IF EXISTS `mentioned_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mentioned_user` (
  `id_user` varchar(15) NOT NULL,
  `id_document` varchar(10) NOT NULL,
  PRIMARY KEY (`id_user`,`id_document`),
  KEY `fk_mentioned_user_document1_idx` (`id_document`),
  CONSTRAINT `fk_mentioned_user_document1` FOREIGN KEY (`id_document`) REFERENCES `document` (`id_document`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mentioned_user_user1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentioned_user`
--

/*!40000 ALTER TABLE `mentioned_user` DISABLE KEYS */;
INSERT INTO `mentioned_user` VALUES ('197903132008121','DOC_3'),('198311092014042','DOC_4'),('2341720129','DOC_2'),('2341720129','DOC_5'),('2341720171','DOC_1'),('2341720171','DOC_5'),('2341720172','DOC_1'),('2341720172','DOC_5'),('2341720183','DOC_2'),('2341720183','DOC_5'),('2341720234','DOC_2'),('2341720234','DOC_5');
/*!40000 ALTER TABLE `mentioned_user` ENABLE KEYS */;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id_user` varchar(15) NOT NULL,
  `id_document` varchar(10) NOT NULL,
  PRIMARY KEY (`id_document`,`id_user`),
  KEY `fk_notification_user1_idx` (`id_user`),
  CONSTRAINT `fk_notification_document1` FOREIGN KEY (`id_document`) REFERENCES `document` (`id_document`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_notification_user1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES ('195304161979032','DOC_2'),('197803272003122','DOC_4'),('2341720129','DOC_5'),('2341720171','DOC_5'),('2341720172','DOC_5'),('2341720183','DOC_5'),('2341720234','DOC_5');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;

--
-- Table structure for table `tracking_doc`
--

DROP TABLE IF EXISTS `tracking_doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tracking_doc` (
  `id_tracking` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('Success','Pending') DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `id_user` varchar(15) NOT NULL,
  `id_document` varchar(10) NOT NULL,
  PRIMARY KEY (`id_tracking`),
  KEY `fk_tracking_doc_user1_idx` (`id_user`),
  KEY `fk_tracking_doc_document1_idx` (`id_document`),
  CONSTRAINT `fk_tracking_doc_document1` FOREIGN KEY (`id_document`) REFERENCES `document` (`id_document`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tracking_doc_user1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracking_doc`
--

/*!40000 ALTER TABLE `tracking_doc` DISABLE KEYS */;
INSERT INTO `tracking_doc` VALUES (1,'Success','Dokumen berhasil diupload','198107052005011','DOC_1'),(2,'Pending','Dokumen sedang ditinjau','198107052005011','DOC_2'),(3,'Success','Dokumen berhasil diupload','2341720183','DOC_3'),(4,'Pending','Dokumen sedang ditinjau','2341720183','DOC_4'),(5,'Success','Dokumen berhasil diupload','197803272003122','DOC_5');
/*!40000 ALTER TABLE `tracking_doc` ENABLE KEYS */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id_user` varchar(15) NOT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `role` enum('Mahasiswa','Dosen','Admin') DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('195304161979032','Sri Whariyanti, S.S.','Admin','sri@gmail.com','sri14'),('196201051990030','Budi Harijanto, ST., MMkom','Dosen','budi@gmail.com','budi10'),('197606252005012','Atiqah Nurul Asri, S.Pd., M.Pd','Dosen','atiqah@gmail.com','atiqah09'),('197803272003122','Titis Octary Satrio, S.ST.','Admin','titis@gmail.com','titis15'),('197903132008121','Arief Prasetyo, S.Kom','Dosen','arief@gmail.com','arief08'),('198007162010121','Danin, S.AP.','Admin','danin@gmail.com','danin11'),('198101052005011','Gian Nurafifa Cessari, A.Md.','Admin','gian@gmail.com','gian12'),('198103182010122','Lailatul Qodriayah, S.Sos.','Admin','lailatul@gmail.com','lailatul13'),('198107052005011','Ahmadi Yuli Ananta, ST','Dosen','ahmadi@gmail.com','ahmadi06'),('198311092014042','Dhebys Suryani H, S.Kom., MT','Dosen','dhebys@gmail.com','dhebys07'),('2341720129','Romy Mahardika Pangestu Lazuardi','Mahasiswa','romy@gmail.com','romy05'),('2341720171','Aaisyah Nursalsabiil Ni Patriarti','Mahasiswa','aaisyah@gmail.com','aaisyah01'),('2341720172','Achmad Maulana Hamzah','Mahasiswa','hamzah@gmail.com','hamzah02'),('2341720183','Muhammad Erril Putra Pratidina','Mahasiswa','erril@gmail.com','erril04'),('2341720234','Anya Callissta Chriswantari','Mahasiswa','anya@gmail.com','anya03');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

--
-- Table structure for table `view`
--

DROP TABLE IF EXISTS `view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `view` (
  `total_view` int(11) DEFAULT NULL,
  `id_user` varchar(15) NOT NULL,
  `id_document` varchar(10) NOT NULL,
  PRIMARY KEY (`id_user`,`id_document`),
  KEY `fk_view_user1_idx` (`id_user`),
  KEY `fk_view_document1_idx` (`id_document`),
  CONSTRAINT `fk_view_document1` FOREIGN KEY (`id_document`) REFERENCES `document` (`id_document`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_view_user1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `view`
--

/*!40000 ALTER TABLE `view` DISABLE KEYS */;
INSERT INTO `view` VALUES (1,'197903132008121','DOC_1'),(3,'2341720129','DOC_3'),(2,'2341720171','DOC_3'),(1,'2341720171','DOC_5'),(1,'2341720172','DOC_5'),(1,'2341720183','DOC_5'),(1,'2341720234','DOC_5');
/*!40000 ALTER TABLE `view` ENABLE KEYS */;

--
-- Dumping routines for database 'repository_jti'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-04 12:25:56
