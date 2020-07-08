/*
SQLyog Ultimate v9.20 
MySQL - 5.5.5-10.4.6-MariaDB : Database - db_stki
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_stki` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_stki`;

/*Table structure for table `tb_result` */

DROP TABLE IF EXISTS `tb_result`;

CREATE TABLE `tb_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text DEFAULT NULL,
  `result` char(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `tb_result` */

insert  into `tb_result`(`id`,`text`,`result`) values (1,'Menteri Koordinator Bidang Perekonomian Airlangga Hartarto mengatakan tingginya harga gula di pasaran disebabkan adanya beberapa impor yang tertunda. https://t.co/VDGJcMwGLb\r\n','0'),(2,'Kementerian Pendidikan dan Kebudayaan serta Google menggandeng operator seluler untuk memberikan paket data gratis kepada ribuan guru di Indonesia. https://t.co/xU2BpmfkT7','1'),(3,'Pemerintah memastikan iuran BPJS Kesehatan naik per 1 Juli 2020. Untuk peserta mandiri kelas III, iuran ditetapkan sebesar Rp 42 ribu. https://t.co/Bu9sFVu0Va\r\n','0'),(4,'Kepala Pusat Pengendalian Operasi Badan Nasional Penanganan Bencana (BNPB), Bambang Surya Putra, mengatakan ego sektoral masih menjadi kendala pendataan untuk menanggulangi wabah Covid-19. https://t.co/K5VHhbTqzl\r\n','0'),(5,'Kepala Unit Tranfusi Darah PMI DKI Jakarta, Salimar Salim, mengatakan stok darah di DKI semakin menipis selama pandemi Corona. https://t.co/k9kKYr0sM8\r\n','0'),(6,'Pemerintah sudah mulai mengkaji pembukaan lahan sawah baru di Kalimantan Tengah. https://t.co/0dAXEixwsY','1'),(7,'Kominfo: Penyampaian Pesan Sederhana soal Covid-19 Jadi Tantangan Komunikasi publik ','1'),(8,'BNPB: Juni Covid-19 Bisa Turun, Asal Warga Patuh PSBB','1'),(9,'Bertahun-tahun Diculik, Bocah Selamat Berkat Unggahan di Medsos','1'),(10,'Susah Sinyal, Murid SD di Yogya Naik Bukit Demi Ikut Belajar Online ','1'),(11,'Waspadai Dua Jalur ini 1. Bibis Manukan arah Benowo Macet. Ada Truk Kontainer Mogok. 2. Kedamean arah Bringkang Macet ada pemasangan Box Culvert','0'),(12,'Kehadiran Medsos Tumbuh Suburkan Kebiasaan Nyinyir','0');

/*Table structure for table `tb_stopword` */

DROP TABLE IF EXISTS `tb_stopword`;

CREATE TABLE `tb_stopword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text DEFAULT NULL,
  `status` char(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `tb_stopword` */

insert  into `tb_stopword`(`id`,`text`,`status`) values (1,'yang di dan itu dengan untuk tidak ini dari dalam akan pada juga saya ke karena tersebut bisa ada mereka lebih kata tahun sudah atau saat oleh menjadi orang ia telah adalah seperti sebagai bahwa dapat para harus namun kita dua satu masih hari hanya mengatakan kepada kami setelah melakukan lalu belum lain dia kalau terjadi banyak menurut  anda hingga tak baru beberapa ketika saja jalan sekitar secara dilakukan sementara tapi sangat hal sehingga  seorang bagi besar lagi selama antara waktu sebuah jika sampai jadi terhadap tiga serta pun salah merupakan atas sejak  membuat baik memiliki  kembali selain tetapi pertama kedua memang pernah apa mulai sama tentang bukan agar semua sedang kali kemudian hasil sejumlah juta persen sendiri katanya demikian masalah  mungkin umum setiap bulan bagian bila lainnya terus luar cukup termasuk sebelumnya bahkan wib tempat perlu menggunakan memberikan rabu sedangkan kamis langsung apakah pihak melalui diri mencapai  minggu aku  berada tinggi ingin sebelum tengah kini the tahu bersama depan selasa begitu  merasa  berbagai mengenai  maka jumlah masuk   katanya  mengalami sering ujar kondisi akibat hubungan empat paling mendapatkan selalu lima  meminta melihat sekarang mengaku mau kerja acara menyatakan masa proses tanpa selatan sempat  adanya hidup datang senin rasa maupun seluruh mantan lama jenis segera misalnya  mendapat bawah jangan meski terlihat akhirnya jumat  punya yakni terakhir kecil panjang badan juni of  jelas jauh tentu semakin tinggal kurang  mampu posisi  asal sekali  sesuai sebesar berat  dirinya memberi pagi  sabtu  ternyata mencari sumber ruang menunjukkan biasanya nama  sebanyak utara berlangsung barat kemungkinan yaitu  berdasarkan  sebenarnya cara utama pekan terlalu  membawa kebutuhan suatu menerima  penting  tanggal bagaimana terutama tingkat awal sedikit nanti pasti  muncul dekat lanjut ketiga biasa dulu kesempatan  ribu  akhir  membantu terkait  sebab menyebabkan khusus  bentuk ditemukan  diduga mana ya kegiatan sebagian tampil hampir bertemu usai berarti keluar pula digunakan justru  padahal menyebutkan  gedung  apalagi program  milik teman menjalani keputusan sumber a  upaya mengetahui mempunyai berjalan menjelaskan  b mengambil benar lewat belakang ikut barang meningkatkan kejadian kehidupan keterangan penggunaan masing-masing menghadapi','1');

/* Function  structure for function  `wordcount` */

/*!50003 DROP FUNCTION IF EXISTS `wordcount` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `wordcount`(str TEXT) RETURNS int(11)
    NO SQL
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
 DECLARE wordCnt, idx, maxIdx INT DEFAULT 0;
 DECLARE currChar, prevChar BOOL DEFAULT 0;
 SET maxIdx=char_length(str);
 WHILE idx < maxIdx DO
     SET currChar=SUBSTRING(str, idx, 1) RLIKE '[[:alnum:]]';
     IF NOT prevChar AND currChar THEN
	 SET wordCnt=wordCnt+1;
     END IF;
     SET prevChar=currChar;
     SET idx=idx+1;
 END WHILE;
 RETURN wordCnt;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
