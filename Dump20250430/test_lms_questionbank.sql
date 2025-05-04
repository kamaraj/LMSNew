-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `lms_questionbank`
--

DROP TABLE IF EXISTS `lms_questionbank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lms_questionbank` (
  `subject_code` varchar(20) NOT NULL,
  `question_text` text NOT NULL,
  `choice_a` varchar(255) DEFAULT NULL,
  `choice_b` varchar(255) DEFAULT NULL,
  `choice_c` varchar(255) DEFAULT NULL,
  `choice_d` varchar(255) DEFAULT NULL,
  `correct_answer` enum('A','B','C','D') NOT NULL,
  `question_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lms_questionbank`
--

LOCK TABLES `lms_questionbank` WRITE;
/*!40000 ALTER TABLE `lms_questionbank` DISABLE KEYS */;
INSERT INTO `lms_questionbank` VALUES ('BM101','Apakah maksud kesusasteraan dalam konteks pengajaran Bahasa Melayu?','Kajian tentang sains','Kajian tentang budaya dan seni bahasa','Kajian tentang ekonomi','Kajian tentang sejarah','B',1),('BM101','Apakah peranan utama kesusasteraan dalam pembelajaran bahasa?','Membantu pelajar memahami tatabahasa','Meningkatkan kemahiran komunikasi dan kreativiti','Menjadikan pelajar lebih mahir dalam matematik','Mengajar konsep fizik','B',2),('BM101','Apakah jenis kesusasteraan yang sering digunakan dalam pengajaran Bahasa Melayu?','Kesusasteraan Inggeris','Kesusasteraan Melayu Klasik dan Moden','Kesusasteraan Cina','Kesusasteraan Jepun','B',3),('BM101','Apakah contoh karya sastera klasik Melayu yang sering diajar di sekolah?','Hikayat Hang Tuah','Harry Potter','Lord of the Rings','Game of Thrones','A',4),('BM101','Mengapakah kesusasteraan penting dalam pemupukan nilai murni?','Ia mengajar pelajar tentang kisah hantu','Ia membantu membentuk sahsiah dan moral yang baik','Ia membantu pelajar menjadi kaya','Ia hanya sekadar hiburan','B',5),('BM101','Apakah elemen utama dalam sebuah karya sastera?','Watak, tema, dan plot','Matematik dan Fizik','Warna dan bentuk','Jenis-jenis tumbuhan','A',6),('BM101','Apakah peranan pantun dalam kesusasteraan Melayu?','Sebagai alat komunikasi dan hiburan','Untuk mengajar sains','Untuk menyelesaikan masalah matematik','Untuk meramal masa depan','A',7),('BM101','Apakah bentuk puisi tradisional Melayu selain pantun?','Soneta','Syair dan Gurindam','Haiku','Limerick','B',8),('BM101','Bagaimanakah kesusasteraan membantu pelajar dalam penguasaan bahasa?','Dengan memperkenalkan kosa kata baru','Dengan menghafal nombor','Dengan menulis rumusan sejarah','Dengan membaca jurnal sains','A',9),('BM101','Siapakah antara tokoh sasterawan negara Malaysia?','A. Samad Said','J.K. Rowling','Stephen King','George Orwell','A',10),('BM101','Apakah jenis karya yang termasuk dalam kesusasteraan lisan Melayu?','Novel moden','Hikayat, pantun, dan legenda','Drama Broadway','Cerpen sains fiksyen','B',11),('BM101','Apakah maksud metafora dalam kesusasteraan?','Perbandingan secara langsung tanpa kata seperti \'seperti\' atau \'bagai\'','Pengulangan kata dalam ayat','Penggunaan bahasa kasar','Kiasan yang tidak bermakna','A',12),('BM101','Mengapakah cerita rakyat penting dalam pengajaran kesusasteraan?','Ia menyampaikan nilai moral dan budaya','Ia hanya untuk hiburan semata-mata','Ia mengandungi fakta sejarah tepat','Ia tidak memberi kesan kepada pembelajaran','A',13),('BM101','Bagaimanakah kesusasteraan membantu membangunkan pemikiran kritis pelajar?','Dengan menganalisis tema dan watak','Dengan menghafal perkataan sahaja','Dengan membaca tanpa memahami','Dengan mengabaikan aspek seni bahasa','A',14),('BM101','Apakah peranan novel dalam pengajaran Bahasa Melayu?','Memberikan pelajar pengalaman membaca secara mendalam','Menggantikan buku teks','Mengajar pelajar cara menulis puisi','Menghafal fakta sejarah','A',15),('BM101','Siapakah tokoh yang menulis \'Salina\'?','A. Samad Said','Usman Awang','Shahnon Ahmad','J.M. Coetzee','A',16),('BM101','Bagaimanakah pengajaran kesusasteraan boleh diperkaya dalam kelas?','Melalui perbincangan dan lakonan','Dengan membaca sahaja tanpa perbincangan','Dengan menghafal setiap ayat dalam novel','Dengan menonton filem tanpa analisis','A',17),('BM101','Apakah keistimewaan sastera lisan berbanding sastera bertulis?','Ia diwarisi secara turun-temurun dan lebih bersifat interaktif','Ia lebih moden dan menggunakan teknologi tinggi','Ia tidak boleh diubah suai oleh generasi baharu','Ia lebih pendek daripada sastera bertulis','A',18),('BM101','Bagaimanakah penggunaan novel sejarah membantu pelajar memahami warisan negara?','Dengan menghidupkan peristiwa sejarah melalui naratif','Dengan menggantikan buku teks sejarah','Dengan menulis cerita fiksyen sendiri','Dengan membaca novel moden sahaja','A',19),('BM101','Apakah manfaat utama pembelajaran kesusasteraan kepada pelajar?','Meningkatkan daya imaginasi, empati, dan pemahaman bahasa','Memudahkan pelajar menjadi saintis','Mengelakkan pelajar daripada membaca buku lain','Menjadikan pelajar lebih mahir dalam matematik','A',20),('PB100','Apakah maksud utama PB dalam konteks video ini?','Perkembangan Bahasa','Pengajaran Berkesan','Pembelajaran Berpusat','Perbincangan Bertema','C',21),('PB100','Apakah objektif utama PB dalam pendidikan?','Meningkatkan kemahiran berfikir pelajar','Mengurangkan interaksi dalam kelas','Hanya menilai prestasi pelajar','Menghafal tanpa memahami','A',22),('PB100','Apakah elemen penting dalam PB?','Interaksi, refleksi, dan kolaborasi','Hafalan fakta sahaja','Penggunaan teknologi tanpa kawalan','Pemberian tugasan berulang','A',23),('PB100','Bagaimana PB membantu pelajar dalam pembelajaran?','Memberi pengalaman pembelajaran aktif','Menggantikan buku teks sepenuhnya','Mengurangkan komunikasi dalam kelas','Memberi lebih banyak ujian bertulis','A',24),('PB100','Apakah kaedah yang sesuai digunakan dalam PB?','Pembelajaran berasaskan projek','Kuliah panjang tanpa aktiviti','Hafalan tanpa analisis','Penggunaan slaid sahaja','A',25),('PB100','Apakah peranan guru dalam PB?','Sebagai fasilitator','Hanya memberi arahan tanpa panduan','Menggunakan kaedah tradisional sepenuhnya','Mengelakkan pelajar daripada berdiskusi','A',26),('PB100','Apakah kesan positif PB kepada pelajar?','Meningkatkan daya kreativiti dan pemikiran kritis','Mengurangkan motivasi pelajar','Menggalakkan persaingan tidak sihat','Menghindarkan pelajar daripada bertanya','A',27),('PB100','Bagaimana pelajar boleh mendapat manfaat maksimum daripada PB?','Terlibat secara aktif dalam perbincangan','Berdiam diri sepanjang sesi pembelajaran','Bergantung kepada guru sepenuhnya','Hanya menyalin nota tanpa memahami','A',28),('PB100','Apakah contoh aktiviti PB yang boleh dijalankan?','Kajian kes dan pembelajaran kolaboratif','Hanya mendengar ceramah','Menghafal teks tanpa berbincang','Menyalin jawapan dari buku','A',29),('PB100','Apakah cabaran utama dalam melaksanakan PB?','Kesukaran mengawal interaksi pelajar','Pelajar menjadi pasif','PB menghalang pembelajaran sebenar','PB hanya berkesan untuk subjek teori','A',30),('PB100','Bagaimana teknologi boleh membantu dalam PB?','Menggunakan alat digital untuk aktiviti interaktif','Menggantikan peranan guru sepenuhnya','Hanya memberi akses kepada e-buku','Menyediakan lebih banyak ujian bertulis','A',31),('PB100','Apakah perbezaan utama antara PB dan pembelajaran tradisional?','PB melibatkan lebih banyak interaksi','PB hanya bergantung kepada guru','PB lebih berkesan untuk semua pelajar tanpa mengira tahap','PB kurang memberi kesan kepada pelajar','A',32),('PB100','Apakah impak PB terhadap kemahiran sosial pelajar?','Meningkatkan kerjasama dan komunikasi','Mengasingkan pelajar secara individu','Membuat pelajar lebih bergantung kepada teknologi','Mengurangkan minat pelajar dalam pembelajaran','A',33),('PB100','Bagaimanakah penilaian dilakukan dalam PB?','Berdasarkan proses dan hasil pembelajaran','Hanya menggunakan ujian bertulis','Berdasarkan kehadiran sahaja','Hanya bergantung pada markah peperiksaan','A',34),('PB100','Apakah kelebihan PB kepada guru?','Membantu guru memahami pelajar dengan lebih baik','Mengurangkan keperluan untuk berinteraksi dengan pelajar','Menghapuskan peranan guru sepenuhnya','Menjadikan pembelajaran lebih statik','A',35),('PB100','Apakah contoh bahan yang boleh digunakan dalam PB?','Video pembelajaran dan kajian kes','Buku teks sahaja','Artikel akademik tanpa diskusi','Soalan latihan yang sama setiap minggu','A',36),('PB100','Mengapakah PB sesuai untuk abad ke-21?','Ia menggalakkan kemahiran berfikir aras tinggi','Ia menggantikan semua kaedah tradisional','Ia hanya sesuai untuk subjek sains dan matematik','Ia tidak sesuai untuk pelajar yang kurang aktif','A',37),('PB100','Bagaimanakah guru boleh memastikan keberkesanan PB?','Merancang aktiviti yang menarik dan bermakna','Memberikan lebih banyak kerja rumah','Mengawal setiap pergerakan pelajar','Menggunakan kaedah tradisional sahaja','A',38),('PB100','Apakah kesan negatif jika PB tidak dilaksanakan dengan baik?','Pelajar boleh menjadi keliru dan tidak fokus','Pelajar menjadi lebih aktif dalam pembelajaran','Pembelajaran lebih menyeronokkan','Guru lebih memahami keperluan pelajar','A',39),('PB100','Apakah sumbangan utama PB dalam pendidikan?','Menghasilkan pelajar yang berfikiran kritis dan kreatif','Menghapuskan semua kaedah pembelajaran lama','Menjadikan pembelajaran lebih mudah tanpa usaha','Mengelakkan interaksi sosial dalam kelas','A',40);
/*!40000 ALTER TABLE `lms_questionbank` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-30 13:57:26
