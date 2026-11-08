-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 08 Nov 2026 pada 08.48
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sdg_simpul_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `hasil_kuis`
--

CREATE TABLE `hasil_kuis` (
  `id_hasil` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `id_kuis` int(11) NOT NULL,
  `nilai` decimal(5,2) DEFAULT NULL,
  `tanggal_pengerjaan` datetime DEFAULT current_timestamp(),
  `status_pengerjaan` enum('selesai','belum_selesai') DEFAULT 'belum_selesai'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `hasil_kuis`
--

INSERT INTO `hasil_kuis` (`id_hasil`, `id_siswa`, `id_kuis`, `nilai`, `tanggal_pengerjaan`, `status_pengerjaan`) VALUES
(1, 1, 1, 85.00, '2026-11-01 09:00:00', 'selesai'),
(2, 2, 1, 90.00, '2026-11-01 09:15:00', 'selesai'),
(3, 3, 1, 75.00, '2026-11-01 09:30:00', 'selesai'),
(4, 4, 2, 80.00, '2026-11-02 10:00:00', 'selesai'),
(5, 5, 2, 95.00, '2026-11-02 10:15:00', 'selesai'),
(6, 6, 3, 88.00, '2026-11-03 08:00:00', 'selesai'),
(7, 7, 3, NULL, '2026-11-03 08:30:00', 'belum_selesai'),
(8, 8, 4, 92.00, '2026-11-04 09:00:00', 'selesai'),
(9, 9, 5, 70.00, '2026-11-04 10:00:00', 'selesai'),
(10, 1, 2, NULL, '2026-11-05 09:00:00', 'belum_selesai');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(50) NOT NULL,
  `tingkat` int(11) NOT NULL,
  `tahun_ajaran` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `nama_kelas`, `tingkat`, `tahun_ajaran`) VALUES
(1, 'X IPA 1', 10, '2026/2027'),
(2, 'X IPA 2', 10, '2026/2027'),
(3, 'XI IPA 1', 11, '2026/2027'),
(4, 'XI IPS 1', 11, '2026/2027'),
(5, 'XII IPA 1', 12, '2026/2027'),
(7, 'KELAS_UJI_COMMIT', 10, '2026/2027');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kuis`
--

CREATE TABLE `kuis` (
  `id_kuis` int(11) NOT NULL,
  `id_pengguna` int(11) NOT NULL,
  `judul_kuis` varchar(150) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `tanggal_dibuat` datetime DEFAULT current_timestamp(),
  `kode_kuis` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kuis`
--

INSERT INTO `kuis` (`id_kuis`, `id_pengguna`, `judul_kuis`, `deskripsi`, `tanggal_dibuat`, `kode_kuis`) VALUES
(1, 2, 'Kuis Matematika Dasar', 'Kuis mengenai operasi bilangan dan aljabar.', '2026-11-07 00:28:24', 'MTK001'),
(2, 2, 'Kuis Fisika', 'Kuis mengenai konsep dasar gerak dan gaya.', '2026-11-07 00:28:24', 'FIS001'),
(3, 3, 'Kuis Bahasa Indonesia', 'Kuis mengenai teks eksposisi dan teks narasi.', '2026-11-07 00:28:24', 'BIN001'),
(4, 3, 'Kuis Biologi', 'Kuis mengenai sistem organ manusia.', '2026-11-07 00:28:24', 'BIO001'),
(5, 2, 'Kuis Matematika Lanjutan', 'Evaluasi matematika tingkat lanjutan', '2026-11-07 00:28:24', 'MTK002');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','guru','wali_murid') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `nama`, `email`, `password`, `role`) VALUES
(1, 'Admin Sekolah', 'admin@sekolah.com', 'admin123', 'admin'),
(2, 'Budi Santoso', 'budi@sekolah.com', 'guru123', 'guru'),
(3, 'Siti Aminah', 'siti@sekolah.com', 'guru456', 'guru'),
(4, 'Andi Wijaya', 'andi@gmail.com', 'wali123', 'wali_murid'),
(5, 'Dewi Lestari', 'dewi@gmail.com', 'wali456', 'wali_murid');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `nama_siswa` varchar(100) DEFAULT NULL,
  `kode_siswa` varchar(30) NOT NULL,
  `tanggal_lahir` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `id_kelas`, `nama_siswa`, `kode_siswa`, `tanggal_lahir`) VALUES
(1, 1, 'Ahmad Rizky', 'S001', '2010-03-15'),
(2, 1, 'Putri Amelia', 'S002', '2010-07-20'),
(3, 2, 'Rizky Pratama', 'S003', '2010-05-10'),
(4, 2, 'Nadia Safitri', 'S004', '2010-11-25'),
(5, 3, 'Fajar Ramadhan', 'S005', '2009-02-12'),
(6, 3, 'Intan Permata', 'S006', '2009-08-17'),
(7, 4, 'Dimas Saputra', 'S007', '2009-04-22'),
(8, 5, 'Rani Oktaviani', 'S008', '2008-06-30'),
(9, 5, 'Bagas Firmansyah', 'S009', '2008-09-14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `umpan_balik`
--

CREATE TABLE `umpan_balik` (
  `id_umpan_balik` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `isi_umpan_balik` text NOT NULL,
  `tingkat_pemahaman` enum('belum_paham','cukup_paham','sangat_paham') NOT NULL,
  `tanggal_pengisian` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `umpan_balik`
--

INSERT INTO `umpan_balik` (`id_umpan_balik`, `id_kelas`, `isi_umpan_balik`, `tingkat_pemahaman`, `tanggal_pengisian`) VALUES
(1, 1, 'Materi matematika mudah dipahami dan contoh soal cukup jelas.', 'sangat_paham', '2026-11-07 00:28:24'),
(2, 1, 'Saya masih kesulitan memahami materi persamaan linear.', 'belum_paham', '2026-11-07 00:28:24'),
(3, 2, 'Materi yang diberikan cukup jelas, tetapi perlu lebih banyak latihan.', 'cukup_paham', '2026-11-07 00:28:24'),
(4, 2, 'Penjelasan guru mudah dimengerti.', 'sangat_paham', '2026-11-07 00:28:24'),
(5, 3, 'Saya belum memahami beberapa konsep dalam materi fisika.', 'belum_paham', '2026-11-07 00:28:24'),
(6, 4, 'Materi pembelajaran cukup mudah dipahami.', 'cukup_paham', '2026-11-07 00:28:24'),
(7, 5, 'Pembelajaran sangat membantu dalam persiapan ujian.', 'sangat_paham', '2026-11-07 00:28:24');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `hasil_kuis`
--
ALTER TABLE `hasil_kuis`
  ADD PRIMARY KEY (`id_hasil`),
  ADD KEY `fk_hasil_kuis_siswa` (`id_siswa`),
  ADD KEY `fk_hasil_kuis` (`id_kuis`),
  ADD KEY `idx_hasil_tanggal` (`tanggal_pengerjaan`),
  ADD KEY `idx_hasil_status_tanggal` (`status_pengerjaan`,`tanggal_pengerjaan`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indeks untuk tabel `kuis`
--
ALTER TABLE `kuis`
  ADD PRIMARY KEY (`id_kuis`),
  ADD UNIQUE KEY `kode_kuis` (`kode_kuis`),
  ADD KEY `fk_kuis_pengguna` (`id_pengguna`);

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`),
  ADD UNIQUE KEY `kode_siswa` (`kode_siswa`),
  ADD KEY `fk_siswa_kelas` (`id_kelas`);

--
-- Indeks untuk tabel `umpan_balik`
--
ALTER TABLE `umpan_balik`
  ADD PRIMARY KEY (`id_umpan_balik`),
  ADD KEY `fk_umpan_balik_kelas` (`id_kelas`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `hasil_kuis`
--
ALTER TABLE `hasil_kuis`
  MODIFY `id_hasil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `kuis`
--
ALTER TABLE `kuis`
  MODIFY `id_kuis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `umpan_balik`
--
ALTER TABLE `umpan_balik`
  MODIFY `id_umpan_balik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `hasil_kuis`
--
ALTER TABLE `hasil_kuis`
  ADD CONSTRAINT `fk_hasil_kuis` FOREIGN KEY (`id_kuis`) REFERENCES `kuis` (`id_kuis`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_hasil_kuis_siswa` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kuis`
--
ALTER TABLE `kuis`
  ADD CONSTRAINT `fk_kuis_pengguna` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `fk_siswa_kelas` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `umpan_balik`
--
ALTER TABLE `umpan_balik`
  ADD CONSTRAINT `fk_umpan_balik_kelas` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
