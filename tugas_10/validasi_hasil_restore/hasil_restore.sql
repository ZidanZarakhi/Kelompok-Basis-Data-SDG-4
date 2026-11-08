-- Simpul

USE sdg_simpul_db;

SHOW TABLES;

SELECT COUNT(*) FROM hasil_kuis;
SELECT COUNT(*) FROM kelas;
SELECT COUNT(*) FROM kuis;
SELECT COUNT(*) FROM pengguna;
SELECT COUNT(*) FROM siswa;
SELECT COUNT(*) FROM umpan_balik;

-- Hasil Restore
USE test_import_sdg_simpul_db;

SHOW TABLES;

SELECT COUNT(*) FROM hasil_kuis;
SELECT COUNT(*) FROM kelas;
SELECT COUNT(*) FROM kuis;
SELECT COUNT(*) FROM pengguna;
SELECT COUNT(*) FROM siswa;
SELECT COUNT(*) FROM umpan_balik;
