-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 29 Jun 2019 pada 14.23
-- Versi Server: 10.1.8-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_elearning_course`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `assignment_analytics`
--

CREATE TABLE `assignment_analytics` (
  `id_aanalytics` int(60) NOT NULL,
  `id_assignment` int(50) DEFAULT NULL,
  `id_student` int(50) DEFAULT NULL,
  `id_question` int(50) DEFAULT NULL,
  `id_option` int(60) DEFAULT NULL,
  `option_char` varchar(10) DEFAULT NULL,
  `analytics_status` enum('true','false','empty') DEFAULT NULL,
  `analytics_created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `assignment_analytics`
--

INSERT INTO `assignment_analytics` (`id_aanalytics`, `id_assignment`, `id_student`, `id_question`, `id_option`, `option_char`, `analytics_status`, `analytics_created`) VALUES
(1, 23, 137, 367, 1763, 'B', 'false', '2019-06-25 08:21:51'),
(2, 23, 137, 371, 1778, 'A', 'true', '2019-06-25 08:21:51'),
(3, 23, 137, 370, 1777, 'D', 'true', '2019-06-25 08:21:51'),
(4, 23, 137, 369, 1771, 'B', 'false', '2019-06-25 08:21:51'),
(5, 23, 137, 368, 1767, 'B', 'true', '2019-06-25 08:21:51'),
(6, 24, 137, 372, 1782, 'A', 'true', '2019-06-25 08:24:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `assignment_begin`
--

CREATE TABLE `assignment_begin` (
  `id_abegin` int(20) NOT NULL,
  `id_assignment` int(50) DEFAULT NULL,
  `id_student` int(50) DEFAULT NULL,
  `time_begin` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `assignment_class`
--

CREATE TABLE `assignment_class` (
  `id_aclass` int(10) NOT NULL,
  `id_assignment` int(50) DEFAULT NULL,
  `id_class` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `assignment_class`
--

INSERT INTO `assignment_class` (`id_aclass`, `id_assignment`, `id_class`) VALUES
(41, 23, 17),
(42, 24, 17);

-- --------------------------------------------------------

--
-- Struktur dari tabel `assignment_question`
--

CREATE TABLE `assignment_question` (
  `id_aquestion` int(50) NOT NULL,
  `id_assignment` int(50) DEFAULT NULL,
  `id_question` int(10) DEFAULT NULL,
  `val_hide` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `assignment_question`
--

INSERT INTO `assignment_question` (`id_aquestion`, `id_assignment`, `id_question`, `val_hide`) VALUES
(373, 23, 367, 0),
(374, 23, 368, 0),
(375, 23, 369, 0),
(376, 23, 370, 0),
(377, 23, 371, 0),
(378, 24, 372, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `assignment_result`
--

CREATE TABLE `assignment_result` (
  `id_aresult` int(50) NOT NULL,
  `id_assignment` int(50) DEFAULT NULL,
  `id_student` int(50) DEFAULT NULL,
  `result_true` int(10) DEFAULT NULL,
  `result_false` int(10) DEFAULT NULL,
  `result_score` float DEFAULT NULL,
  `result_status` enum('lulus','gagal') DEFAULT NULL,
  `result_created` datetime DEFAULT NULL,
  `result_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `assignment_result`
--

INSERT INTO `assignment_result` (`id_aresult`, `id_assignment`, `id_student`, `result_true`, `result_false`, `result_score`, `result_status`, `result_created`, `result_update`) VALUES
(16, 23, 137, 3, 2, 60, 'lulus', '2019-06-25 08:21:51', '2019-06-25 01:21:51'),
(17, 24, 137, 1, 0, 100, 'lulus', '2019-06-25 08:24:34', '2019-06-25 01:24:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_admin`
--

CREATE TABLE `ms_admin` (
  `id_admin` int(10) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `full_name` text,
  `admin_email` varchar(50) NOT NULL,
  `admin_tlp` varchar(13) NOT NULL,
  `level` varchar(10) DEFAULT NULL,
  `admin_photo` varchar(100) NOT NULL,
  `admin_hide` tinyint(1) DEFAULT '0',
  `admin_created` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ms_admin`
--

INSERT INTO `ms_admin` (`id_admin`, `username`, `password`, `full_name`, `admin_email`, `admin_tlp`, `level`, `admin_photo`, `admin_hide`, `admin_created`) VALUES
(1, 'admin', '$2y$10$OyUFCVUfQPvXXFLGjQTjRupDRK4psSo3e6L.FTM3glw3ycnqxiSFi', 'Administrator', 'admin@gmail.com', '082321090800', 'admin', '5c8a9d876909e5defe67c1b4d2d26825.png', 0, '2018-12-07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_assignment`
--

CREATE TABLE `ms_assignment` (
  `id_assignment` int(50) NOT NULL,
  `id_` int(10) DEFAULT NULL,
  `author_` enum('admin','guru','staff') DEFAULT NULL,
  `id_lesson` int(10) DEFAULT NULL,
  `assignment_type` varchar(100) DEFAULT NULL,
  `assignment_order` enum('asc','desc','random') DEFAULT NULL,
  `assignment_author` varchar(100) DEFAULT NULL,
  `assignment_kkm` int(10) DEFAULT NULL,
  `question_used` int(10) DEFAULT '0',
  `assignment_path` varchar(100) DEFAULT NULL,
  `show_report` tinyint(1) DEFAULT '0',
  `show_analytic` tinyint(1) DEFAULT '0',
  `assignment_active` tinyint(1) DEFAULT '0',
  `assignment_hide` tinyint(1) DEFAULT '0',
  `assignment_duration` int(10) DEFAULT NULL,
  `assignment_created` datetime DEFAULT NULL,
  `assignment_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ms_assignment`
--

INSERT INTO `ms_assignment` (`id_assignment`, `id_`, `author_`, `id_lesson`, `assignment_type`, `assignment_order`, `assignment_author`, `assignment_kkm`, `question_used`, `assignment_path`, `show_report`, `show_analytic`, `assignment_active`, `assignment_hide`, `assignment_duration`, `assignment_created`, `assignment_updated`) VALUES
(23, 1, 'admin', 16, 'Kuis', 'asc', 'Inung Dyah Kurniawati', 60, 0, '26-192b791-1', 1, 1, 1, 0, 40, '2019-06-25 05:42:26', '2019-06-25 01:22:09'),
(24, 1, 'admin', 16, 'UTS', 'asc', 'Inung Dyah Kurniawati', 70, 0, '52-192b791-1', 1, 1, 1, 0, 30, '2019-06-25 08:18:52', '2019-06-25 01:23:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_class`
--

CREATE TABLE `ms_class` (
  `id_class` int(10) NOT NULL,
  `class_name` varchar(100) DEFAULT NULL,
  `class_hide` tinyint(1) DEFAULT '0',
  `class_created` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ms_class`
--

INSERT INTO `ms_class` (`id_class`, `class_name`, `class_hide`, `class_created`) VALUES
(17, '7A', 0, '2019-06-13'),
(18, '7C', 0, '2019-06-13'),
(21, '7B', 0, '2019-06-13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_lesson`
--

CREATE TABLE `ms_lesson` (
  `id_lesson` int(10) NOT NULL,
  `lesson_name` varchar(100) DEFAULT NULL,
  `lesson_hide` tinyint(1) DEFAULT '0',
  `lesson_created` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ms_lesson`
--

INSERT INTO `ms_lesson` (`id_lesson`, `lesson_name`, `lesson_hide`, `lesson_created`) VALUES
(15, 'Kinematika', 0, '2019-06-13'),
(16, 'Dinamika', 0, '2019-06-14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_lesson_sub`
--

CREATE TABLE `ms_lesson_sub` (
  `id_lesson_sub` int(11) NOT NULL,
  `id_lesson` int(11) NOT NULL,
  `nama_materi` varchar(100) NOT NULL,
  `isi_materi` text NOT NULL,
  `file` varchar(200) NOT NULL,
  `file_video` varchar(100) NOT NULL,
  `materi_created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ms_lesson_sub`
--

INSERT INTO `ms_lesson_sub` (`id_lesson_sub`, `id_lesson`, `nama_materi`, `isi_materi`, `file`, `file_video`, `materi_created`) VALUES
(4, 16, 'Hukum Newton I II III', '<ul>\r\n	<li>Bunyi Hukum Newton I: &ldquo;Jika resultan gaya yang bekerja pada benda yang sama dengan nol, maka benda yang mula-mula diam akan tetap diam. Benda yang mula-mula bergerak lurus beraturan akan tetap lurus beraturan dengan kecepatan tetap</li>\r\n	<li>Bunyi Hukum Newton II: &ldquo;Percepatan (perubahan dari kecepatan) dari suatu benda akan sebanding dengan resultan gaya (jumlah gaya) yang bekerja pada benda tersebut dan berbanding terbalik dengan massa benda.</li>\r\n	<li>Bunyi Hukum Newton III: &ldquo;Setiap aksi akan menimbulkan reaksi, jika suatu benda memberikan gaya pada benda yang lain maka benda yang terkena gaya akan memberikan gaya yang besarnya sama dengan gaya yang diterima dari benda pertama, tetapi arahnya berlawanan&ldquo;</li>\r\n</ul>\r\n', '984ecc01d0bc385da8c0a1e1feec5624.png', '695e95c6471cd962ed31c4dbd517a085.mp4', '2019-06-25'),
(5, 16, 'Macam-macam Gaya', '<p><strong>1.&nbsp;&nbsp; &nbsp;GAYA GRAVITASI (GAYA BERAT)</strong><br />\r\nSemua benda yang berada dalam medan gravitasi bumi akan tertarik ke bawah dengan percepatan gravitasi</p>\r\n\r\n<figure class="easyimage easyimage-full"><img alt="" src="blob:http://localhost/3ce0b14a-8284-45bf-b647-c0f1c812ee63" width="438" />\r\n<figcaption></figcaption>\r\n</figure>\r\n\r\n<p>&nbsp;</p>\r\n', 'd38101495ce277884d82bd7d4136b753.png', '2244c42030aeb1114c4b66b8ddfde121.mp4', '2019-06-25'),
(6, 15, 'Gerak Parabola', '<p style="text-align:justify"><strong>Gerak Parabola</strong> juga dikenal sebagai Gerak Peluru. Dinamakan Gerak parabola karena lintasannya berbentuk parabola, bukan bergerak lurus. Contoh bentuk gerak ini dapat kita lihat pada gerakan bola saat dilempar, gerakan pada peluru meriam yang ditembakkan, gerakan pada benda yang dilemparkan dari pesawat dan gerakan pada seseorang yang melompat maju.</p>\r\n', '9874b6336fe290be74e6134eb47954e6.PNG', 'f2e973cb06a2bd87563ee98017527a50.mp4', '2019-06-25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_log`
--

CREATE TABLE `ms_log` (
  `id_log` int(255) NOT NULL,
  `log_author` text,
  `log_desc` text,
  `log_created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ms_log`
--

INSERT INTO `ms_log` (`id_log`, `log_author`, `log_desc`, `log_created`) VALUES
(1, 'Admin - Administrator', 'Menambahkan user baru', '2018-06-13 08:23:17'),
(2, 'Admin - Sandi Ramadhan', 'Menghapus data user bernama - shincan', '2018-06-14 14:26:29'),
(3, 'Guru - Kakashi Hatake', 'Membuat ujian UTS untuk pelajaran Matematika', '2018-06-14 09:23:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_question`
--

CREATE TABLE `ms_question` (
  `id_question` int(50) NOT NULL,
  `id_lesson` int(10) DEFAULT NULL,
  `question_` text CHARACTER SET utf8,
  `question_image` varchar(100) DEFAULT NULL,
  `question_sound` varchar(100) DEFAULT NULL,
  `question_created` datetime DEFAULT NULL,
  `question_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `question_hide` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ms_question`
--

INSERT INTO `ms_question` (`id_question`, `id_lesson`, `question_`, `question_image`, `question_sound`, `question_created`, `question_update`, `question_hide`) VALUES
(359, 15, 'TESS??', NULL, NULL, '2019-06-13 22:40:34', '2019-06-13 15:40:34', 0),
(360, 15, '                        fdsfsdfsd                                        ', NULL, NULL, '2019-06-15 11:12:51', '2019-06-15 04:12:51', 0),
(361, 20, 'tess', NULL, NULL, '2019-06-15 12:59:55', '2019-06-15 05:59:55', 0),
(362, 18, 'aaa', NULL, NULL, '2019-06-16 01:44:42', '2019-06-15 18:44:42', 0),
(363, 16, '                        Suatu mobil bergerak lurus disebuah jalan tol. Mobil tersebut melaju dengan kecepatan awal sebesar 36 km/jam. Setelah mobil tersebut menempuh jarak sejauh 300m, kecepatannya berubah menjadi 72km/jam. Berapakah waktu tempuh mobil tersebut?                                ', NULL, NULL, '2019-06-17 22:12:49', '2019-06-17 15:13:07', 1),
(364, 16, 'Seoarang anak yang sedang bermain menjatuhkan sebuah benda dari ketinggian 45m. Satu detik kemudian anak tersebut melempar sebuah benda lagi dari atas kebawah dengan percepatan gravitasi sebesar 10m/s2. Jika kedua benda yang dilempar anak tersebut mencapai tanah secara besamaan, maka berapakah besar kecepatan awal benda kedua?', NULL, NULL, '2019-06-17 22:14:00', '2019-06-17 15:14:00', 0),
(365, 15, 'Seoarang anak yang sedang bermain menjatuhkan sebuah benda dari ketinggian 45m. Satu detik kemudian anak tersebut melempar sebuah benda lagi dari atas kebawah dengan percepatan gravitasi sebesar 10m/s2. Jika kedua benda yang dilempar anak tersebut mencapai tanah secara besamaan, maka berapakah besar kecepatan awal benda kedua?', NULL, NULL, '2019-06-17 22:18:01', '2019-06-17 15:18:01', 0),
(366, 15, 'Sebuah benda 2kg jatuh bebas dari ketinggian 20m diatas tanah. Berapa lama waktu yang diperlukan oleh benda untuk mencapai tanah?', NULL, NULL, '2019-06-17 22:18:47', '2019-06-17 15:18:47', 0),
(367, 16, 'Jika sistem benda bergerak, gaya gesekan antara balok dan lantai masing-masing sebesar 2 N dan percepatan benda 2 m/s2, besar tegangan tali pada kedua balok tersebut adalah …N.', '62ad43f8119a2615abb02bf3834bff77.PNG', NULL, '2019-06-25 05:45:30', '2019-06-24 22:45:30', 0),
(368, 16, 'Balok A memiliki massa 5 kg diletakkan pada bidang miring licin dan dihubungkan dengan balok B memiliki massa 3 kg. Jika tali penghubung antara balok A dan balok B dilewatkan pada sebuah katrol dengan massa yang diabaikan, percepatan balok adalah … m/s2. (g = 10 m/s2)', '00b028e80ad7df2c5fe23ddd771f2d4c.PNG', NULL, '2019-06-25 05:51:14', '2019-06-24 22:51:14', 0),
(369, 16, 'Dua balok yang masing-masing bermassa 2 kg, dihubungkan dengan tali dan katrol seperti pada gambar. Bidang permukaan dan katrol licin. Jika balok B ditarik dengan gaya mendatar 40 N, percepatan balok adalah …. (g = 10 m/s2)', 'b216f44039739c93f542890e9dc5df19.PNG', NULL, '2019-06-25 05:52:46', '2019-06-24 22:52:46', 0),
(370, 16, '                        Dua buah benda A dan B masing-masing bermassa 2 kg dan 3 kg dihubungkan dengan tali melalui sebuah katrol licin (massa tali diabaikan). Jika percepatan gravitasi bumi ditempat itu 10 ms , maka besarnya tegangan tali adalah ….                    ', '6ac7debfc3ae99098264a67f0cfd377d.PNG', NULL, '2019-06-25 05:56:24', '2019-06-24 22:56:24', 0),
(371, 16, 'Perhatikan Gambar! Gaya dorong Ucok F harus dapat mengimbangi proyeksi gaya berat. Lihat gambar di bawah ini. Balok bergerak ke atas dengan kecepatan tetap berarti masih berlaku hukum I Newton sehingga memenuhi persamaan berikut.', '4e16dc69a7b9855c79b7dad91e7eeb07.jpg', NULL, '2019-06-25 06:27:14', '2019-06-24 23:27:14', 0),
(372, 16, 'Titik materi D pada detik t = 1 s berada pada posisi (2,0) m dan pada t = 4 s berada pada posisi (8,8) m. Tentukan :', NULL, NULL, '2019-06-25 08:20:36', '2019-06-25 01:20:36', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_student`
--

CREATE TABLE `ms_student` (
  `id_student` int(50) NOT NULL,
  `student_nim` int(30) DEFAULT NULL,
  `student_name` varchar(100) DEFAULT NULL,
  `student_jk` varchar(25) DEFAULT NULL,
  `student_date` date DEFAULT NULL,
  `student_place` varchar(25) DEFAULT NULL,
  `student_adress` text,
  `student_password` varchar(100) DEFAULT NULL,
  `student_email` varchar(100) DEFAULT NULL,
  `student_photo` varchar(100) DEFAULT NULL,
  `student_created` date DEFAULT NULL,
  `student_hide` int(1) DEFAULT NULL,
  `student_active` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ms_student`
--

INSERT INTO `ms_student` (`id_student`, `student_nim`, `student_name`, `student_jk`, `student_date`, `student_place`, `student_adress`, `student_password`, `student_email`, `student_photo`, `student_created`, `student_hide`, `student_active`) VALUES
(137, 15211011, 'Finsa Cahya Andika', 'Laki - Laki', '1994-09-13', 'Madiun', 'Magetan', '$2y$10$S6DCRtgPXw0./aFSgAiQNe/cBYaWg5ancSGaayZXKd6P7PPH7fJSa', 'finsa@gmail.com', '3d5a850ebe263d7abb9a8aefd0bbd235.png', '2019-06-13', 0, 'Y'),
(144, 15211012, 'Finsa', 'Laki - Laki', '2019-06-07', 'Madiun', 'Magetan', '$2y$10$4o0iicHW8U3v3YzhM7ONe.KNii6Z62qWKArqfO0SX1Yjg3rdAmbji', 'finsa@gmail.com', 'default.jpg', '2019-06-25', 0, 'Y'),
(145, 15211013, 'Andika', 'Laki - Laki', '2019-06-25', 'Madiun', 'Magetan', '$2y$10$9kbhN7sPIwVdteL1ny7Jpe30dD3fa0guKrowCPSsYiDLzRpJn6bD2', 'andhyka.synyster@gmail.com', 'default.jpg', '2019-06-25', 0, 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_teacher`
--

CREATE TABLE `ms_teacher` (
  `id_teacher` int(10) NOT NULL,
  `teacher_name` varchar(100) DEFAULT NULL,
  `teacher_username` varchar(50) DEFAULT NULL,
  `teacher_password` varchar(100) DEFAULT NULL,
  `teacher_phone` varchar(20) DEFAULT NULL,
  `teacher_email` varchar(50) DEFAULT NULL,
  `teacher_address` text,
  `teacher_photo` varchar(100) DEFAULT NULL,
  `teacher_created` date DEFAULT NULL,
  `teacher_hide` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ms_teacher`
--

INSERT INTO `ms_teacher` (`id_teacher`, `teacher_name`, `teacher_username`, `teacher_password`, `teacher_phone`, `teacher_email`, `teacher_address`, `teacher_photo`, `teacher_created`, `teacher_hide`) VALUES
(1, 'Andika', 'andika', '$1$Cb/.j15.$x0Wvru/r7J1H4FpmNq0jC/', '081311026641', 'andika@gmail.com', 'Madiun', 'b54a35ad02bb09419e64c2c3f97a7bbe.png', '2019-04-21', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_token`
--

CREATE TABLE `ms_token` (
  `id_token` int(100) NOT NULL,
  `access_token` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ms_token`
--

INSERT INTO `ms_token` (`id_token`, `access_token`) VALUES
(1, '$1$SwwKz6Mu$iNb8fofJ8bUmTshLtcnvH0'),
(5, '$1$i.qfAVxT$3.kp.sYx.EM5HM.AFnosG1'),
(7, '$1$VSr09zLg$3TNNdYNfHn8fiu2TrUcAB.'),
(10, '$1$cm2FcP9V$MGEXCLH6awDvls5aSQJjz0'),
(20, '$1$C4UeWibu$g5qvUEycqMDTyxqKN9vM9.'),
(25, '$1$r3ne7.q2$hCszQmqi8a6yoffRE6.IZ0'),
(30, '$1$EacMwNnj$4lzY1ibWcHJUZ0L2cvcmA0'),
(32, '$1$IayTUPz4$uFvx19uzqxFqexQux5fne/'),
(33, '$1$YYG8uYIS$7AAJ5EkiXFUDL9pHeVE6T.'),
(37, '$1$zFLdl/yU$GLYcGB2OazTB0X4FpazTX0'),
(39, '$1$0COnhdXN$fvUBq1vohWgtDFgcwMjB2/'),
(48, '$1$V.fMCb10$8VY2wqSsAZRghwCr56Sf/.'),
(55, '$1$LI.9VGO5$APdTJ.Fmqxyfu7fQYHuE9/'),
(62, '$1$VhKcPAyK$KPB4oeeuBbhDYvhRrnDN20'),
(65, '$1$uBT23WTY$D/ZRt4xAgzn1ErerVuEf41'),
(66, '$1$RSTMKHjn$zB0Ur0UiTTAETMFJBkRY7/'),
(67, '$1$FsxGJRLB$XAnwsH1yrUQOdrWLS5f6b.'),
(72, '$1$TuZ2VZK9$iHTcLykRI61rGVrRANP2i/'),
(74, '$1$rK3fQELz$EBe4HUTR.c/PQqnDsUqCH.'),
(75, '$1$wLIPYCeg$2Bmd11Qvgu63n8feNSekW.'),
(76, '$1$9xNBtB1O$mpT8bP/VcTGoN2VsR1MAw.'),
(78, '$1$u36ckSwQ$h45sXR/X9OwUpia6BlP0F0'),
(81, '$1$y7GiMkVr$OzzdVRp3zJxEkMiOdzpAt/'),
(84, '$1$2fxYNuDT$UDVYatCuyLxwYCjR3E4CC1'),
(88, '$1$gm0SaiTk$X7suv9QUEfO0NS164zhZ1.'),
(89, '$1$4zKLQV.h$xjh/LvW6JeZ36LGoVsrV91'),
(90, '$1$Fpw0Zxoc$5zDZIabn9Dq9wb3EVxLG5/'),
(91, '$1$BLOUCLzq$6Z2pTmXoCgjMl5M9z9uc70'),
(92, '$1$4RmOm83D$OYfXiQ9fyW5EB4tY4TmgW/'),
(93, '$1$uqm85cYK$s.XUvkCbWF8y5zN0BJaic.'),
(94, '$1$MwRSS/YH$zTXpBrdsqFhSLcP6cce4z0'),
(98, '$1$YluLmUdf$TdkQYYqShxGOC9Vs69x1j1'),
(100, '$1$aqOclbnf$oDvLdH8lf4/uw0FzjWghI1'),
(103, '$1$4qu2e1BE$BjnWCtjReOLBkJIBdHBGN0'),
(104, '$1$uv2.fm5.$xkzd0oaVPjhmhgxFm9pcu1'),
(106, '$1$l/0.Kt4.$XEKFPi3A9ASRHuyKAqKh2.'),
(107, '$1$A23.Jd3.$XgFaDpKnIrjAdW0EzUaHd/'),
(111, '$1$wT/.3u0.$Apfz4BHZe9CtiUf/k6ua0.'),
(112, '$1$Id..xr0.$kHdloUeL38iUnkr3JbLTw.'),
(113, '$1$iW3.DN5.$r7OFbBVxzXvlX1jYOrc14/'),
(114, '$1$m4/.1I5.$QXySiyBsI2AODPa...41M1'),
(116, '$1$OA5.9t/.$T3VtH46OfVD96TUApQ4A9.'),
(117, '$1$h2/.WN1.$v11v/YgqFUr1buj.1n4Iw0'),
(118, '$1$X01.Uy..$nYDRWc3izSQzCk1YDJsxz/'),
(119, '$1$i01.Dt4.$9oczaDCOdPKvO81nDfeEU/'),
(121, '$1$N8/.SZ1.$Ghct3kGfRICL2BOjU.6d//'),
(122, '$1$rY/.Yu0.$yCVTyCufBU5584WZA4MAK/'),
(123, '$1$uz4.fa..$/t5W/zJF7aXRGZeMZR0fy1'),
(124, '$1$eO..P83.$sY7WffTvUw8AYQI5Z6q7M0'),
(125, '$1$mW4.1...$PYSMBvFLaZxL1fAo00exK1'),
(126, '$1$LU/.2E5.$Zp8PhRAQsC3ax16OVhJ8j1'),
(127, '$1$405.5p4.$BHHhekLVa6UniJpQEOA6j.'),
(128, '$1$.i/.tK4.$LzEMJbUB9nmT2fX2r1MR90'),
(129, '$1$sD0.F1/.$5z0ha4bstxSK50/dOaqpB0'),
(130, '$1$rB3.Yj5.$NEs898OwRoQbsPBNJLbvs.'),
(132, '$1$ig3.DP..$rggVxxC.su2HWRhai4EsC1'),
(133, '$1$kr1.dx0.$WxLU8HkxF9TRiBIgB9wy31'),
(134, '$1$VY/.435.$da8iztkwKWLhfvYH0BNyX1'),
(135, '$1$8t0.v45.$c.q8zKjeW0Rw3xt.l7dwi1'),
(136, '$1$OP/.9Q3.$l1EXgdPaLFDx9oDWYhHCl/'),
(137, '$1$cb/./U4.$bXSfxYTzAej8vjVwarjXI/'),
(139, '$1$HU..Ed4.$1gkK86pqSW6e9ZHW7pdw8.'),
(140, '$1$bX3.Im4.$wMqMO5IrUuDyAPMYtG19S1'),
(142, '$1$j7/.wh3.$MEhMBXT99u78JSItW60N30'),
(143, '$1$pk3.8X/.$xeG//jlpP78REaAI3Q23T1'),
(144, '$1$vc2.MJ2.$QvlJwWWKecBoxABQxTod30'),
(145, '$1$uQ3.fz5.$hALzSogs/uMCAfeDeXqer1'),
(146, '$1$7j/.C92.$JT2spa7eJsqat6oaC3Gfx1'),
(149, '$1$xA3.mQ1.$28wIHWk2jiFO7Bu14r/5H1'),
(151, '$1$ZC/.uB3.$sAuxDb9IVtESHZwkgUIj0/'),
(152, '$1$0U5.HI4.$QYHRAHXrrHp2lHu3DCjw01'),
(154, '$1$B53.0e5.$qhfkiCFgQuu1V5vCynFs5.'),
(155, '$1$Ay/.JP2.$dYllHPWznbQinzPHzmfP1/'),
(156, '$1$Cv1.j51.$/HtBrV1FC4lQSLQa0RQ4f1'),
(157, '$1$RE2.GO..$TSoQ4Jj4sNE7X43nxBCqG.'),
(158, '$1$WI3.ni2.$kqZSD902IZa1M.165rwDD1'),
(159, '$1$Ov1.9w3.$pDJ6fvuHjob36swxyZRtU/'),
(163, '$1$St5.z60.$noJHaWgjTzJowpsYa2lc8/'),
(166, '$1$s52.FP3.$lqJCOcMMWt6L73PWzcj1f.'),
(167, '$1$Hp3.EO1.$dt0KePJlNd.9w/FySra7U1'),
(171, '$1$v92.Mw0.$V4R6IxnHQJO9O1exykE461'),
(173, '$1$j63.w...$wQmQZQ7R1MEwPa/RYHaTT/'),
(174, '$1$jf2.wb4.$8LSu6eQmRpqgIYxsAG.Oq0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `question_option`
--

CREATE TABLE `question_option` (
  `id_option` int(60) NOT NULL,
  `id_question` int(10) DEFAULT NULL,
  `option_` text CHARACTER SET utf8,
  `option_image` varchar(100) DEFAULT NULL,
  `option_true` tinyint(1) DEFAULT '0',
  `option_created` datetime DEFAULT NULL,
  `option_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `option_hide` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `question_option`
--

INSERT INTO `question_option` (`id_option`, `id_question`, `option_`, `option_image`, `option_true`, `option_created`, `option_updated`, `option_hide`) VALUES
(1730, 359, 'aa', NULL, 0, '2019-06-13 22:40:34', '2019-06-13 15:40:34', 0),
(1731, 359, 'bb', NULL, 0, '2019-06-13 22:40:34', '2019-06-13 15:40:34', 0),
(1732, 359, 'cc', NULL, 1, '2019-06-13 22:40:35', '2019-06-13 15:40:35', 0),
(1733, 359, 'dd', NULL, 0, '2019-06-13 22:40:35', '2019-06-13 15:40:35', 0),
(1734, 360, 'aaa                                                                ', NULL, 0, '2019-06-13 22:41:06', '2019-06-15 04:12:51', 0),
(1735, 360, '                                    bbb                                                                ', NULL, 0, '2019-06-13 22:41:06', '2019-06-15 04:12:51', 0),
(1736, 360, '                                    ccc                                                                ', NULL, 0, '2019-06-13 22:41:06', '2019-06-15 04:12:51', 0),
(1737, 360, '                                                                        dddd                                                                ', NULL, 1, '2019-06-13 22:41:06', '2019-06-15 04:12:51', 0),
(1738, 361, 'a', NULL, 1, '2019-06-15 12:59:55', '2019-06-15 05:59:55', 0),
(1739, 361, 'b', NULL, 0, '2019-06-15 12:59:56', '2019-06-15 05:59:56', 0),
(1740, 361, 'c', NULL, 0, '2019-06-15 12:59:56', '2019-06-15 05:59:56', 0),
(1741, 361, 'd', NULL, 0, '2019-06-15 12:59:56', '2019-06-15 05:59:56', 0),
(1742, 362, 'aaa', NULL, 1, '2019-06-16 01:44:42', '2019-06-15 18:44:42', 0),
(1743, 362, 'bb', NULL, 0, '2019-06-16 01:44:42', '2019-06-15 18:44:42', 0),
(1744, 362, 'cc', NULL, 0, '2019-06-16 01:44:42', '2019-06-15 18:44:42', 0),
(1745, 362, 'dd', NULL, 0, '2019-06-16 01:44:43', '2019-06-15 18:44:43', 0),
(1746, 363, '                                    12,5 m/s                                                            ', NULL, 1, '2019-06-17 11:47:24', '2019-06-17 15:12:49', 0),
(1747, 363, '                                    10,5 m/s                                                              ', NULL, 1, '2019-06-17 11:47:24', '2019-06-17 15:12:49', 0),
(1748, 363, '                                    22,5 m/s                                                 ', NULL, 0, '2019-06-17 11:47:24', '2019-06-17 15:12:49', 0),
(1749, 363, '                                    15,5 m/s                                                ', NULL, 0, '2019-06-17 11:47:24', '2019-06-17 15:12:49', 0),
(1750, 364, '12,5 m/s.', NULL, 1, '2019-06-17 22:14:00', '2019-06-17 15:14:00', 0),
(1751, 364, '22,5 m/s.', NULL, 0, '2019-06-17 22:14:00', '2019-06-17 15:14:00', 0),
(1752, 364, '15 m/s.', NULL, 0, '2019-06-17 22:14:00', '2019-06-17 15:14:00', 0),
(1753, 364, '12 m/s.', NULL, 0, '2019-06-17 22:14:01', '2019-06-17 15:14:01', 0),
(1754, 365, '12,5 m/s', NULL, 1, '2019-06-17 22:18:01', '2019-06-17 15:18:01', 0),
(1755, 365, '22,5 m/s', NULL, 0, '2019-06-17 22:18:01', '2019-06-17 15:18:01', 0),
(1756, 365, '20 m/s', NULL, 0, '2019-06-17 22:18:01', '2019-06-17 15:18:01', 0),
(1757, 365, '30 m/s', NULL, 0, '2019-06-17 22:18:01', '2019-06-17 15:18:01', 0),
(1758, 366, '2 sekon', NULL, 1, '2019-06-17 22:18:48', '2019-06-17 15:18:48', 0),
(1759, 366, '4 sekon', NULL, 0, '2019-06-17 22:18:48', '2019-06-17 15:18:48', 0),
(1760, 366, '5 sekon', NULL, 0, '2019-06-17 22:18:48', '2019-06-17 15:18:48', 0),
(1761, 366, '6 sekon', NULL, 0, '2019-06-17 22:18:48', '2019-06-17 15:18:48', 0),
(1762, 367, '64', NULL, 0, '2019-06-25 05:45:30', '2019-06-24 22:45:30', 0),
(1763, 367, '32', NULL, 0, '2019-06-25 05:45:31', '2019-06-24 22:45:31', 0),
(1764, 367, '26', NULL, 0, '2019-06-25 05:45:31', '2019-06-24 22:45:31', 0),
(1765, 367, '6', NULL, 1, '2019-06-25 05:45:31', '2019-06-24 22:45:31', 0),
(1766, 368, '3,50', NULL, 0, '2019-06-25 05:51:14', '2019-06-24 22:51:14', 0),
(1767, 368, '3,75', NULL, 1, '2019-06-25 05:51:14', '2019-06-24 22:51:14', 0),
(1768, 368, '4,00', NULL, 0, '2019-06-25 05:51:14', '2019-06-24 22:51:14', 0),
(1769, 368, '5,25', NULL, 0, '2019-06-25 05:51:14', '2019-06-24 22:51:14', 0),
(1770, 369, '5 m/s2', NULL, 1, '2019-06-25 05:52:46', '2019-06-24 22:52:46', 0),
(1771, 369, '7,5 m/s2', NULL, 0, '2019-06-25 05:52:46', '2019-06-24 22:52:46', 0),
(1772, 369, '10 m/s2', NULL, 0, '2019-06-25 05:52:47', '2019-06-24 22:52:47', 0),
(1773, 369, '12,5 m/s2', NULL, 0, '2019-06-25 05:52:47', '2019-06-24 22:52:47', 0),
(1774, 370, '                                    21 N                                ', NULL, 1, '2019-06-25 05:55:57', '2019-06-24 22:56:24', 0),
(1775, 370, '                                    22 N                                ', NULL, 0, '2019-06-25 05:55:57', '2019-06-24 22:56:24', 0),
(1776, 370, '                                    23 N                                ', NULL, 0, '2019-06-25 05:55:57', '2019-06-24 22:56:24', 0),
(1777, 370, '                                    24 N                                ', NULL, 1, '2019-06-25 05:55:57', '2019-06-24 22:56:24', 0),
(1778, 371, '100 N', NULL, 1, '2019-06-25 06:27:14', '2019-06-24 23:27:14', 0),
(1779, 371, '105 N', NULL, 0, '2019-06-25 06:27:14', '2019-06-24 23:27:14', 0),
(1780, 371, '110 N', NULL, 0, '2019-06-25 06:27:14', '2019-06-24 23:27:14', 0),
(1781, 371, '120 N', NULL, 0, '2019-06-25 06:27:14', '2019-06-24 23:27:14', 0),
(1782, 372, '12', NULL, 1, '2019-06-25 08:20:36', '2019-06-25 01:20:36', 0),
(1783, 372, '11', NULL, 0, '2019-06-25 08:20:36', '2019-06-25 01:20:36', 0),
(1784, 372, '10', NULL, 0, '2019-06-25 08:20:36', '2019-06-25 01:20:36', 0),
(1785, 372, '6', NULL, 0, '2019-06-25 08:20:36', '2019-06-25 01:20:36', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `student_class`
--

CREATE TABLE `student_class` (
  `id_student_class` int(11) NOT NULL,
  `id_class` int(11) NOT NULL,
  `id_student` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `student_class`
--

INSERT INTO `student_class` (`id_student_class`, `id_class`, `id_student`) VALUES
(1, 17, 137),
(7, 17, 144),
(8, 21, 145);

-- --------------------------------------------------------

--
-- Struktur dari tabel `st_presence`
--

CREATE TABLE `st_presence` (
  `idpresence` int(10) UNSIGNED NOT NULL,
  `presence_log` timestamp NULL DEFAULT NULL,
  `nis` int(20) DEFAULT NULL,
  `presence_type` enum('alpha','leave','attend','out','sick') NOT NULL DEFAULT 'attend',
  `presence_out` timestamp NULL DEFAULT NULL,
  `presence_res` enum('finger','mobile','website') NOT NULL DEFAULT 'finger',
  `presence_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `notif_sent` int(2) NOT NULL DEFAULT '0',
  `notif_read` timestamp NULL DEFAULT NULL,
  `leave_approve` tinyint(4) NOT NULL DEFAULT '0',
  `leave_reason` text CHARACTER SET utf8 NOT NULL,
  `leave_image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `st_presence`
--

INSERT INTO `st_presence` (`idpresence`, `presence_log`, `nis`, `presence_type`, `presence_out`, `presence_res`, `presence_time`, `notif_sent`, `notif_read`, `leave_approve`, `leave_reason`, `leave_image`) VALUES
(1, '2018-02-19 02:48:48', 13, 'attend', NULL, 'website', '2018-02-19 03:48:48', 0, NULL, 0, '', ''),
(2, '2018-02-19 02:48:50', 12, 'attend', NULL, 'website', '2018-02-19 03:48:50', 0, NULL, 0, '', ''),
(3, '2018-03-03 05:43:50', 2013310016, 'attend', NULL, 'website', '2018-03-03 06:44:01', 0, NULL, 0, '', ''),
(4, '2018-02-01 06:06:11', 13, 'attend', NULL, 'website', '2018-03-03 07:06:11', 0, NULL, 0, '', ''),
(5, '2018-02-01 06:06:14', 12, 'sick', NULL, 'website', '2018-03-03 07:06:14', 0, NULL, 0, '', ''),
(6, '2018-02-04 06:06:27', 13, 'leave', NULL, 'website', '2018-03-03 07:06:27', 0, NULL, 0, '', ''),
(7, '2018-02-04 06:06:28', 12, 'alpha', NULL, 'website', '2018-03-03 07:06:28', 0, NULL, 0, '', ''),
(8, '2018-02-05 06:07:02', 13, 'sick', NULL, 'website', '2018-03-03 07:07:02', 0, NULL, 0, '', ''),
(9, '2018-02-05 06:07:04', 12, 'attend', NULL, 'website', '2018-03-03 07:07:04', 0, NULL, 0, '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `teacher_class`
--

CREATE TABLE `teacher_class` (
  `id_teacher_class` int(10) NOT NULL,
  `id_teacher` int(10) DEFAULT NULL,
  `id_class` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `teacher_lesson`
--

CREATE TABLE `teacher_lesson` (
  `id_teacher_lesson` int(10) NOT NULL,
  `id_teacher` int(10) DEFAULT NULL,
  `id_lesson` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignment_analytics`
--
ALTER TABLE `assignment_analytics`
  ADD PRIMARY KEY (`id_aanalytics`),
  ADD KEY `id_assignment` (`id_assignment`);

--
-- Indexes for table `assignment_begin`
--
ALTER TABLE `assignment_begin`
  ADD PRIMARY KEY (`id_abegin`),
  ADD KEY `id_assignment` (`id_assignment`),
  ADD KEY `id_student` (`id_student`);

--
-- Indexes for table `assignment_class`
--
ALTER TABLE `assignment_class`
  ADD PRIMARY KEY (`id_aclass`),
  ADD KEY `id_assignment` (`id_assignment`),
  ADD KEY `id_class` (`id_class`);

--
-- Indexes for table `assignment_question`
--
ALTER TABLE `assignment_question`
  ADD PRIMARY KEY (`id_aquestion`),
  ADD KEY `id_assignment` (`id_assignment`),
  ADD KEY `id_question` (`id_question`);

--
-- Indexes for table `assignment_result`
--
ALTER TABLE `assignment_result`
  ADD PRIMARY KEY (`id_aresult`),
  ADD KEY `id_assignment` (`id_assignment`);

--
-- Indexes for table `ms_admin`
--
ALTER TABLE `ms_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `ms_assignment`
--
ALTER TABLE `ms_assignment`
  ADD PRIMARY KEY (`id_assignment`);

--
-- Indexes for table `ms_class`
--
ALTER TABLE `ms_class`
  ADD PRIMARY KEY (`id_class`);

--
-- Indexes for table `ms_lesson`
--
ALTER TABLE `ms_lesson`
  ADD PRIMARY KEY (`id_lesson`);

--
-- Indexes for table `ms_lesson_sub`
--
ALTER TABLE `ms_lesson_sub`
  ADD PRIMARY KEY (`id_lesson_sub`),
  ADD KEY `id_lesson` (`id_lesson`);

--
-- Indexes for table `ms_log`
--
ALTER TABLE `ms_log`
  ADD PRIMARY KEY (`id_log`);

--
-- Indexes for table `ms_question`
--
ALTER TABLE `ms_question`
  ADD PRIMARY KEY (`id_question`);

--
-- Indexes for table `ms_student`
--
ALTER TABLE `ms_student`
  ADD PRIMARY KEY (`id_student`);

--
-- Indexes for table `ms_teacher`
--
ALTER TABLE `ms_teacher`
  ADD PRIMARY KEY (`id_teacher`);

--
-- Indexes for table `ms_token`
--
ALTER TABLE `ms_token`
  ADD PRIMARY KEY (`id_token`);

--
-- Indexes for table `question_option`
--
ALTER TABLE `question_option`
  ADD PRIMARY KEY (`id_option`),
  ADD KEY `id_question` (`id_question`);

--
-- Indexes for table `student_class`
--
ALTER TABLE `student_class`
  ADD PRIMARY KEY (`id_student_class`),
  ADD KEY `id_class` (`id_class`),
  ADD KEY `id_student` (`id_student`);

--
-- Indexes for table `st_presence`
--
ALTER TABLE `st_presence`
  ADD PRIMARY KEY (`idpresence`),
  ADD KEY `nis` (`nis`);

--
-- Indexes for table `teacher_class`
--
ALTER TABLE `teacher_class`
  ADD PRIMARY KEY (`id_teacher_class`),
  ADD KEY `id_teacher` (`id_teacher`),
  ADD KEY `id_class` (`id_class`);

--
-- Indexes for table `teacher_lesson`
--
ALTER TABLE `teacher_lesson`
  ADD PRIMARY KEY (`id_teacher_lesson`),
  ADD KEY `id_teacher` (`id_teacher`),
  ADD KEY `id_lesson` (`id_lesson`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignment_analytics`
--
ALTER TABLE `assignment_analytics`
  MODIFY `id_aanalytics` int(60) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `assignment_begin`
--
ALTER TABLE `assignment_begin`
  MODIFY `id_abegin` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `assignment_class`
--
ALTER TABLE `assignment_class`
  MODIFY `id_aclass` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `assignment_question`
--
ALTER TABLE `assignment_question`
  MODIFY `id_aquestion` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=379;
--
-- AUTO_INCREMENT for table `assignment_result`
--
ALTER TABLE `assignment_result`
  MODIFY `id_aresult` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `ms_admin`
--
ALTER TABLE `ms_admin`
  MODIFY `id_admin` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ms_assignment`
--
ALTER TABLE `ms_assignment`
  MODIFY `id_assignment` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `ms_class`
--
ALTER TABLE `ms_class`
  MODIFY `id_class` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `ms_lesson`
--
ALTER TABLE `ms_lesson`
  MODIFY `id_lesson` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `ms_lesson_sub`
--
ALTER TABLE `ms_lesson_sub`
  MODIFY `id_lesson_sub` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ms_log`
--
ALTER TABLE `ms_log`
  MODIFY `id_log` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ms_question`
--
ALTER TABLE `ms_question`
  MODIFY `id_question` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=373;
--
-- AUTO_INCREMENT for table `ms_student`
--
ALTER TABLE `ms_student`
  MODIFY `id_student` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;
--
-- AUTO_INCREMENT for table `ms_teacher`
--
ALTER TABLE `ms_teacher`
  MODIFY `id_teacher` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ms_token`
--
ALTER TABLE `ms_token`
  MODIFY `id_token` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;
--
-- AUTO_INCREMENT for table `question_option`
--
ALTER TABLE `question_option`
  MODIFY `id_option` int(60) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1786;
--
-- AUTO_INCREMENT for table `student_class`
--
ALTER TABLE `student_class`
  MODIFY `id_student_class` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `st_presence`
--
ALTER TABLE `st_presence`
  MODIFY `idpresence` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `teacher_class`
--
ALTER TABLE `teacher_class`
  MODIFY `id_teacher_class` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `teacher_lesson`
--
ALTER TABLE `teacher_lesson`
  MODIFY `id_teacher_lesson` int(10) NOT NULL AUTO_INCREMENT;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `assignment_analytics`
--
ALTER TABLE `assignment_analytics`
  ADD CONSTRAINT `assignment_analytics_ibfk_1` FOREIGN KEY (`id_assignment`) REFERENCES `ms_assignment` (`id_assignment`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `assignment_begin`
--
ALTER TABLE `assignment_begin`
  ADD CONSTRAINT `assignment_begin_ibfk_1` FOREIGN KEY (`id_assignment`) REFERENCES `ms_assignment` (`id_assignment`) ON DELETE CASCADE,
  ADD CONSTRAINT `assignment_begin_ibfk_2` FOREIGN KEY (`id_student`) REFERENCES `ms_student` (`id_student`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `assignment_class`
--
ALTER TABLE `assignment_class`
  ADD CONSTRAINT `assignment_class_ibfk_1` FOREIGN KEY (`id_assignment`) REFERENCES `ms_assignment` (`id_assignment`) ON DELETE CASCADE,
  ADD CONSTRAINT `assignment_class_ibfk_2` FOREIGN KEY (`id_class`) REFERENCES `ms_class` (`id_class`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `assignment_question`
--
ALTER TABLE `assignment_question`
  ADD CONSTRAINT `assignment_question_ibfk_1` FOREIGN KEY (`id_assignment`) REFERENCES `ms_assignment` (`id_assignment`) ON DELETE CASCADE,
  ADD CONSTRAINT `assignment_question_ibfk_2` FOREIGN KEY (`id_question`) REFERENCES `ms_question` (`id_question`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `assignment_result`
--
ALTER TABLE `assignment_result`
  ADD CONSTRAINT `assignment_result_ibfk_1` FOREIGN KEY (`id_assignment`) REFERENCES `ms_assignment` (`id_assignment`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `ms_lesson_sub`
--
ALTER TABLE `ms_lesson_sub`
  ADD CONSTRAINT `ms_lesson_sub_ibfk_1` FOREIGN KEY (`id_lesson`) REFERENCES `ms_lesson` (`id_lesson`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `question_option`
--
ALTER TABLE `question_option`
  ADD CONSTRAINT `question_option_ibfk_1` FOREIGN KEY (`id_question`) REFERENCES `ms_question` (`id_question`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `student_class`
--
ALTER TABLE `student_class`
  ADD CONSTRAINT `student_class_ibfk_1` FOREIGN KEY (`id_class`) REFERENCES `ms_class` (`id_class`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_class_ibfk_2` FOREIGN KEY (`id_student`) REFERENCES `ms_student` (`id_student`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `teacher_class`
--
ALTER TABLE `teacher_class`
  ADD CONSTRAINT `teacher_class_ibfk_1` FOREIGN KEY (`id_teacher`) REFERENCES `ms_teacher` (`id_teacher`) ON DELETE CASCADE,
  ADD CONSTRAINT `teacher_class_ibfk_2` FOREIGN KEY (`id_class`) REFERENCES `ms_class` (`id_class`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `teacher_lesson`
--
ALTER TABLE `teacher_lesson`
  ADD CONSTRAINT `teacher_lesson_ibfk_1` FOREIGN KEY (`id_teacher`) REFERENCES `ms_teacher` (`id_teacher`) ON DELETE CASCADE,
  ADD CONSTRAINT `teacher_lesson_ibfk_2` FOREIGN KEY (`id_lesson`) REFERENCES `ms_lesson` (`id_lesson`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
