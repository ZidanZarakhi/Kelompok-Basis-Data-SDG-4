CREATE DATABASE IF NOT EXISTS modul10;
USE modul10;

CREATE TABLE kelas (
    id_kelas INT AUTO_INCREMENT PRIMARY KEY,
    nama_kelas VARCHAR(50) NOT NULL,
    tingkat INT NOT NULL,
    tahun_ajaran VARCHAR(20) NOT NULL
);

CREATE TABLE pengguna (
    id_pengguna INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'guru', 'wali_murid') NOT NULL
);

CREATE TABLE siswa (
    id_siswa INT AUTO_INCREMENT PRIMARY KEY,
    id_kelas INT NOT NULL,
    nama_siswa VARCHAR(100),
    kode_siswa VARCHAR(30) UNIQUE NOT NULL,
    tanggal_lahir DATE,
    CONSTRAINT fk_siswa_kelas
        FOREIGN KEY (id_kelas)
        REFERENCES kelas(id_kelas)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE kuis (
    id_kuis INT AUTO_INCREMENT PRIMARY KEY,
    id_pengguna INT NOT NULL,
    judul_kuis VARCHAR(150) NOT NULL,
    deskripsi TEXT,
    tanggal_dibuat DATETIME DEFAULT CURRENT_TIMESTAMP,
    kode_kuis VARCHAR(30) UNIQUE NOT NULL,
    CONSTRAINT fk_kuis_pengguna
        FOREIGN KEY (id_pengguna)
        REFERENCES pengguna(id_pengguna)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE hasil_kuis (
    id_hasil INT AUTO_INCREMENT PRIMARY KEY,
    id_siswa INT NOT NULL,
    id_kuis INT NOT NULL,
    nilai DECIMAL(5,2),
    tanggal_pengerjaan DATETIME DEFAULT CURRENT_TIMESTAMP,
    status_pengerjaan ENUM(
        'selesai',
        'belum_selesai'
    ) DEFAULT 'belum_selesai',
    CONSTRAINT fk_hasil_kuis_siswa
        FOREIGN KEY (id_siswa)
        REFERENCES siswa(id_siswa)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_hasil_kuis
        FOREIGN KEY (id_kuis)
        REFERENCES kuis(id_kuis)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE umpan_balik (
    id_umpan_balik INT AUTO_INCREMENT PRIMARY KEY,
    id_kelas INT NOT NULL,
    isi_umpan_balik TEXT NOT NULL,
    tingkat_pemahaman ENUM(
        'belum_paham',
        'cukup_paham',
        'sangat_paham'
    ) NOT NULL,
    tanggal_pengisian DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_umpan_balik_kelas
        FOREIGN KEY (id_kelas)
        REFERENCES kelas(id_kelas)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

INSERT INTO kelas (nama_kelas, tingkat, tahun_ajaran)
VALUES
('X IPA 1', 10, '2026/2027'),
('X IPA 2', 10, '2026/2027'),
('XI IPA 1', 11, '2026/2027'),
('XI IPS 1', 11, '2026/2027'),
('XII IPA 1', 12, '2026/2027');

INSERT INTO pengguna (nama, email, password, role)
VALUES
('Admin Sekolah', 'admin@sekolah.com', 'admin123', 'admin'),
('Budi Santoso', 'budi@sekolah.com', 'guru123', 'guru'),
('Siti Aminah', 'siti@sekolah.com', 'guru456', 'guru'),
('Andi Wijaya', 'andi@gmail.com', 'wali123', 'wali_murid'),
('Dewi Lestari', 'dewi@gmail.com', 'wali456', 'wali_murid');

INSERT INTO siswa
(id_kelas, nama_siswa, kode_siswa, tanggal_lahir)
VALUES
(1, 'Ahmad Rizky', 'S001', '2010-03-15'),
(1, 'Putri Amelia', 'S002', '2010-07-20'),
(2, 'Rizky Pratama', 'S003', '2010-05-10'),
(2, 'Nadia Safitri', 'S004', '2010-11-25'),
(3, 'Fajar Ramadhan', 'S005', '2009-02-12'),
(3, 'Intan Permata', 'S006', '2009-08-17'),
(4, 'Dimas Saputra', 'S007', '2009-04-22'),
(5, 'Rani Oktaviani', 'S008', '2008-06-30'),
(5, 'Bagas Firmansyah', 'S009', '2008-09-14');

INSERT INTO kuis
(id_pengguna, judul_kuis, deskripsi, kode_kuis)
VALUES
(2, 'Kuis Matematika Dasar',
 'Kuis mengenai operasi bilangan dan aljabar.', 'MTK001'),
(2, 'Kuis Fisika',
 'Kuis mengenai konsep dasar gerak dan gaya.', 'FIS001'),
(3, 'Kuis Bahasa Indonesia',
 'Kuis mengenai teks eksposisi dan teks narasi.', 'BIN001'),
(3, 'Kuis Biologi',
 'Kuis mengenai sistem organ manusia.', 'BIO001'),
(2, 'Kuis Matematika Lanjutan',
 'Kuis mengenai fungsi dan persamaan kuadrat.', 'MTK002');

INSERT INTO hasil_kuis
(id_siswa, id_kuis, nilai, tanggal_pengerjaan, status_pengerjaan)
VALUES
(1, 1, 85.00, '2026-11-01 09:00:00', 'selesai'),
(2, 1, 90.00, '2026-11-01 09:15:00', 'selesai'),
(3, 1, 75.00, '2026-11-01 09:30:00', 'selesai'),
(4, 2, 80.00, '2026-11-02 10:00:00', 'selesai'),
(5, 2, 95.00, '2026-11-02 10:15:00', 'selesai'),
(6, 3, 88.00, '2026-11-03 08:00:00', 'selesai'),
(7, 3, NULL, '2026-11-03 08:30:00', 'belum_selesai'),
(8, 4, 92.00, '2026-11-04 09:00:00', 'selesai'),
(9, 5, 70.00, '2026-11-04 10:00:00', 'selesai'),
(1, 2, NULL, '2026-11-05 09:00:00', 'belum_selesai');

INSERT INTO umpan_balik
(id_kelas, isi_umpan_balik, tingkat_pemahaman)
VALUES
(1, 'Materi matematika mudah dipahami dan contoh soal cukup jelas.',
 'sangat_paham'),
(1, 'Saya masih kesulitan memahami materi persamaan linear.',
 'belum_paham'),
(2, 'Materi yang diberikan cukup jelas, tetapi perlu lebih banyak latihan.',
 'cukup_paham'),
(2, 'Penjelasan guru mudah dimengerti.',
 'sangat_paham'),
(3, 'Saya belum memahami beberapa konsep dalam materi fisika.',
 'belum_paham'),
(4, 'Materi pembelajaran cukup mudah dipahami.',
 'cukup_paham'),
(5, 'Pembelajaran sangat membantu dalam persiapan ujian.',
 'sangat_paham');

SELECT * FROM kelas;
SELECT * FROM pengguna;
SELECT * FROM siswa;
SELECT * FROM kuis;
SELECT * FROM hasil_kuis;
SELECT * FROM umpan_balik;

UPDATE kuis
SET judul_kuis = 'Kuis Matematika Lanjutan',
    deskripsi = 'Evaluasi matematika tingkat lanjutan'
WHERE id_kuis = 5;

SELECT * FROM kuis
WHERE id_kuis = 5;

DELETE FROM hasil_kuis
WHERE id_hasil = 4;

SELECT * from hasil_kuis

INSERT INTO kelas (id_kelas, nama_kelas, tingkat, tahun_ajaran)
VALUES (1, 'X IPA Akselerasi', 10, '2026/2027');

INSERT INTO siswa (id_kelas, nama_siswa, kode_siswa, tanggal_lahir)
VALUES (999, 'Farhan Maulana', 'S010', '2010-04-12');

DELETE FROM pengguna 
WHERE id_pengguna = 2;

UPDATE kelas 
SET id_kelas = 50 
WHERE id_kelas = 5;

SELECT * FROM kelas WHERE id_kelas = 50;

SELECT id_siswa, id_kelas, nama_siswa, kode_siswa 
FROM siswa 
WHERE id_kelas = 50;

START TRANSACTION;

INSERT INTO kelas (nama_kelas, tingkat, tahun_ajaran)
VALUES ('KELAS_UJI_COMMIT', 10, '2026/2027');

COMMIT;


SELECT *
FROM kelas
WHERE nama_kelas = 'KELAS_UJI_COMMIT';

START TRANSACTION;

INSERT INTO kelas (nama_kelas, tingkat, tahun_ajaran)
VALUES ('KELAS_UJI_ROLLBACK', 10, '2026/2027');

ROLLBACK;

SELECT *
FROM kelas
WHERE nama_kelas = 'KELAS_UJI_ROLLBACK';

EXPLAIN
SELECT
    id_hasil,
    id_siswa,
    id_kuis,
    nilai,
    tanggal_pengerjaan,
    status_pengerjaan
FROM hasil_kuis
WHERE tanggal_pengerjaan >= '2025-01-01'
  AND tanggal_pengerjaan < '2025-04-01';

CREATE INDEX idx_hasil_tanggal
ON hasil_kuis(tanggal_pengerjaan);

SHOW INDEX FROM hasil_kuis;

EXPLAIN
SELECT
    id_hasil,
    id_siswa,
    id_kuis,
    nilai,
    tanggal_pengerjaan,
    status_pengerjaan
FROM hasil_kuis
WHERE tanggal_pengerjaan >= '2025-01-01'
  AND tanggal_pengerjaan < '2025-04-01';

CREATE DATABASE IF NOT EXISTS modul10_restore;
