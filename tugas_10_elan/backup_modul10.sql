-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: modul10
-- ------------------------------------------------------
-- Server version	8.4.3

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
-- Table structure for table `hasil_kuis`
--

DROP TABLE IF EXISTS `hasil_kuis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hasil_kuis` (
  `id_hasil` int NOT NULL AUTO_INCREMENT,
  `id_siswa` int NOT NULL,
  `id_kuis` int NOT NULL,
  `nilai` decimal(5,2) DEFAULT NULL,
  `tanggal_pengerjaan` datetime DEFAULT CURRENT_TIMESTAMP,
  `status_pengerjaan` enum('selesai','belum_selesai') DEFAULT 'belum_selesai',
  PRIMARY KEY (`id_hasil`),
  KEY `fk_hasil_kuis_siswa` (`id_siswa`),
  KEY `fk_hasil_kuis` (`id_kuis`),
  KEY `idx_hasil_tanggal` (`tanggal_pengerjaan`),
  CONSTRAINT `fk_hasil_kuis` FOREIGN KEY (`id_kuis`) REFERENCES `kuis` (`id_kuis`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_hasil_kuis_siswa` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hasil_kuis`
--

LOCK TABLES `hasil_kuis` WRITE;
/*!40000 ALTER TABLE `hasil_kuis` DISABLE KEYS */;
INSERT INTO `hasil_kuis` VALUES (1,1,1,85.00,'2026-11-01 09:00:00','selesai'),(2,2,1,90.00,'2026-11-01 09:15:00','selesai'),(3,3,1,75.00,'2026-11-01 09:30:00','selesai'),(5,5,2,95.00,'2026-11-02 10:15:00','selesai'),(6,6,3,88.00,'2026-11-03 08:00:00','selesai'),(7,7,3,NULL,'2026-11-03 08:30:00','belum_selesai'),(8,8,4,92.00,'2026-11-04 09:00:00','selesai'),(9,9,5,70.00,'2026-11-04 10:00:00','selesai'),(10,1,2,NULL,'2026-11-05 09:00:00','belum_selesai');
/*!40000 ALTER TABLE `hasil_kuis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kelas`
--

DROP TABLE IF EXISTS `kelas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kelas` (
  `id_kelas` int NOT NULL AUTO_INCREMENT,
  `nama_kelas` varchar(50) NOT NULL,
  `tingkat` int NOT NULL,
  `tahun_ajaran` varchar(20) NOT NULL,
  PRIMARY KEY (`id_kelas`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelas`
--

LOCK TABLES `kelas` WRITE;
/*!40000 ALTER TABLE `kelas` DISABLE KEYS */;
INSERT INTO `kelas` VALUES (1,'X IPA 1',10,'2026/2027'),(2,'X IPA 2',10,'2026/2027'),(3,'XI IPA 1',11,'2026/2027'),(4,'XI IPS 1',11,'2026/2027'),(50,'XII IPA 1',12,'2026/2027'),(51,'KELAS_UJI_COMMIT',10,'2026/2027');
/*!40000 ALTER TABLE `kelas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kuis`
--

DROP TABLE IF EXISTS `kuis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kuis` (
  `id_kuis` int NOT NULL AUTO_INCREMENT,
  `id_pengguna` int NOT NULL,
  `judul_kuis` varchar(150) NOT NULL,
  `deskripsi` text,
  `tanggal_dibuat` datetime DEFAULT CURRENT_TIMESTAMP,
  `kode_kuis` varchar(30) NOT NULL,
  PRIMARY KEY (`id_kuis`),
  UNIQUE KEY `kode_kuis` (`kode_kuis`),
  KEY `fk_kuis_pengguna` (`id_pengguna`),
  CONSTRAINT `fk_kuis_pengguna` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kuis`
--

LOCK TABLES `kuis` WRITE;
/*!40000 ALTER TABLE `kuis` DISABLE KEYS */;
INSERT INTO `kuis` VALUES (1,2,'Kuis Matematika Dasar','Kuis mengenai operasi bilangan dan aljabar.','2026-11-09 02:15:22','MTK001'),(2,2,'Kuis Fisika','Kuis mengenai konsep dasar gerak dan gaya.','2026-11-09 02:15:22','FIS001'),(3,3,'Kuis Bahasa Indonesia','Kuis mengenai teks eksposisi dan teks narasi.','2026-11-09 02:15:22','BIN001'),(4,3,'Kuis Biologi','Kuis mengenai sistem organ manusia.','2026-11-09 02:15:22','BIO001'),(5,2,'Kuis Matematika Lanjutan','Evaluasi matematika tingkat lanjutan','2026-11-09 02:15:22','MTK002');
/*!40000 ALTER TABLE `kuis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengguna`
--

DROP TABLE IF EXISTS `pengguna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pengguna` (
  `id_pengguna` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','guru','wali_murid') NOT NULL,
  PRIMARY KEY (`id_pengguna`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengguna`
--

LOCK TABLES `pengguna` WRITE;
/*!40000 ALTER TABLE `pengguna` DISABLE KEYS */;
INSERT INTO `pengguna` VALUES (1,'Admin Sekolah','admin@sekolah.com','admin123','admin'),(2,'Budi Santoso','budi@sekolah.com','guru123','guru'),(3,'Siti Aminah','siti@sekolah.com','guru456','guru'),(4,'Andi Wijaya','andi@gmail.com','wali123','wali_murid'),(5,'Dewi Lestari','dewi@gmail.com','wali456','wali_murid');
/*!40000 ALTER TABLE `pengguna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siswa`
--

DROP TABLE IF EXISTS `siswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `siswa` (
  `id_siswa` int NOT NULL AUTO_INCREMENT,
  `id_kelas` int NOT NULL,
  `nama_siswa` varchar(100) DEFAULT NULL,
  `kode_siswa` varchar(30) NOT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  PRIMARY KEY (`id_siswa`),
  UNIQUE KEY `kode_siswa` (`kode_siswa`),
  KEY `fk_siswa_kelas` (`id_kelas`),
  CONSTRAINT `fk_siswa_kelas` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siswa`
--

LOCK TABLES `siswa` WRITE;
/*!40000 ALTER TABLE `siswa` DISABLE KEYS */;
INSERT INTO `siswa` VALUES (1,1,'Ahmad Rizky','S001','2010-03-15'),(2,1,'Putri Amelia','S002','2010-07-20'),(3,2,'Rizky Pratama','S003','2010-05-10'),(4,2,'Nadia Safitri','S004','2010-11-25'),(5,3,'Fajar Ramadhan','S005','2009-02-12'),(6,3,'Intan Permata','S006','2009-08-17'),(7,4,'Dimas Saputra','S007','2009-04-22'),(8,50,'Rani Oktaviani','S008','2008-06-30'),(9,50,'Bagas Firmansyah','S009','2008-09-14');
/*!40000 ALTER TABLE `siswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `umpan_balik`
--

DROP TABLE IF EXISTS `umpan_balik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `umpan_balik` (
  `id_umpan_balik` int NOT NULL AUTO_INCREMENT,
  `id_kelas` int NOT NULL,
  `isi_umpan_balik` text NOT NULL,
  `tingkat_pemahaman` enum('belum_paham','cukup_paham','sangat_paham') NOT NULL,
  `tanggal_pengisian` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_umpan_balik`),
  KEY `fk_umpan_balik_kelas` (`id_kelas`),
  CONSTRAINT `fk_umpan_balik_kelas` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umpan_balik`
--

LOCK TABLES `umpan_balik` WRITE;
/*!40000 ALTER TABLE `umpan_balik` DISABLE KEYS */;
INSERT INTO `umpan_balik` VALUES (1,1,'Materi matematika mudah dipahami dan contoh soal cukup jelas.','sangat_paham','2026-11-09 02:15:22'),(2,1,'Saya masih kesulitan memahami materi persamaan linear.','belum_paham','2026-11-09 02:15:22'),(3,2,'Materi yang diberikan cukup jelas, tetapi perlu lebih banyak latihan.','cukup_paham','2026-11-09 02:15:22'),(4,2,'Penjelasan guru mudah dimengerti.','sangat_paham','2026-11-09 02:15:22'),(5,3,'Saya belum memahami beberapa konsep dalam materi fisika.','belum_paham','2026-11-09 02:15:22'),(6,4,'Materi pembelajaran cukup mudah dipahami.','cukup_paham','2026-11-09 02:15:22'),(7,50,'Pembelajaran sangat membantu dalam persiapan ujian.','sangat_paham','2026-11-09 02:15:22');
/*!40000 ALTER TABLE `umpan_balik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'modul10'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-09  3:27:39
