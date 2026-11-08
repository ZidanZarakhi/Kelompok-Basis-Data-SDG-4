
-- ============================================================
-- MODUL 10 PRAKTIK BASIS DATA
-- GENERATOR DATASET BENCHMARK SISTEM KUIS SEKOLAH
-- MySQL 8.x / MariaDB
--
-- Dataset:
--   kelas          : menggunakan data yang sudah tersedia
--   pengguna       : menggunakan data yang sudah tersedia
--   siswa          : menggunakan data yang sudah tersedia
--   kuis           : menggunakan data yang sudah tersedia
--   hasil_kuis     : 1.000.000 data simulasi
--   umpan_balik    : menggunakan data yang sudah tersedia
--
-- PENTING:
-- Jalankan pada database praktikum.
-- Jangan jalankan berulang kali tanpa memeriksa data.
-- ============================================================

-- Pilih database sistem kuis kamu
-- USE nama_database_kamu;


-- ------------------------------------------------------------
-- 1. PERSIAPAN DATA REFERENSI
-- ------------------------------------------------------------

-- Pastikan tabel induk sudah memiliki data
SELECT COUNT(*) AS jumlah_siswa FROM siswa;
SELECT COUNT(*) AS jumlah_kuis FROM kuis;

-- Pastikan tabel menggunakan InnoDB
SHOW TABLE STATUS;


-- ------------------------------------------------------------
-- 2. MEMBUAT TABEL DIGIT 0-9
--    Digunakan untuk menghasilkan urutan angka
--    tanpa recursive CTE.
-- ------------------------------------------------------------

CREATE TEMPORARY TABLE digit (
    n TINYINT UNSIGNED NOT NULL PRIMARY KEY
);

INSERT INTO digit (n) VALUES
(0),(1),(2),(3),(4),(5),(6),(7),(8),(9);


-- ------------------------------------------------------------
-- 3. MEMBUAT TABEL REFERENSI SIMULASI SISWA
--    Menggunakan ID siswa yang benar-benar tersedia.
-- ------------------------------------------------------------

CREATE TEMPORARY TABLE siswa_simulasi (
    nomor INT NOT NULL PRIMARY KEY,
    id_siswa INT NOT NULL
);

INSERT INTO siswa_simulasi (nomor, id_siswa)
SELECT
    ROW_NUMBER() OVER (ORDER BY id_siswa),
    id_siswa
FROM siswa;

SET @jumlah_siswa = (
    SELECT COUNT(*) FROM siswa_simulasi
);


-- ------------------------------------------------------------
-- 4. MEMBUAT TABEL REFERENSI SIMULASI KUIS
--    Menggunakan ID kuis yang benar-benar tersedia.
-- ------------------------------------------------------------

CREATE TEMPORARY TABLE kuis_simulasi (
    nomor INT NOT NULL PRIMARY KEY,
    id_kuis INT NOT NULL
);

INSERT INTO kuis_simulasi (nomor, id_kuis)
SELECT
    ROW_NUMBER() OVER (ORDER BY id_kuis),
    id_kuis
FROM kuis;

SET @jumlah_kuis = (
    SELECT COUNT(*) FROM kuis_simulasi
);


-- ------------------------------------------------------------
-- 5. VALIDASI DATA REFERENSI
-- ------------------------------------------------------------

SELECT @jumlah_siswa AS jumlah_siswa;
SELECT @jumlah_kuis AS jumlah_kuis;

-- Pastikan keduanya lebih dari 0 sebelum melanjutkan.


-- ------------------------------------------------------------
-- 6. GENERATE 1.000.000 DATA HASIL KUIS
-- ------------------------------------------------------------

INSERT INTO hasil_kuis (
    id_siswa,
    id_kuis,
    nilai,
    tanggal_pengerjaan,
    status_pengerjaan
)
SELECT
    s.id_siswa,
    k.id_kuis,
    60 + MOD(angka.n * 7, 41),

    DATE_ADD(
        '2024-01-01 00:00:00',
        INTERVAL MOD(angka.n * 17, 1095) DAY
    ) + INTERVAL MOD(angka.n * 23, 86400) SECOND,

    CASE MOD(angka.n, 4)
        WHEN 0 THEN 'belum_selesai'
        ELSE 'selesai'
    END

FROM (
    SELECT
        d0.n
        + d1.n * 10
        + d2.n * 100
        + d3.n * 1000
        + d4.n * 10000
        + d5.n * 100000 AS n
    FROM digit d0
    CROSS JOIN digit d1
    CROSS JOIN digit d2
    CROSS JOIN digit d3
    CROSS JOIN digit d4
    CROSS JOIN digit d5
) AS angka

JOIN siswa_simulasi s
    ON s.nomor = MOD(angka.n, @jumlah_siswa) + 1

JOIN kuis_simulasi k
    ON k.nomor = MOD(angka.n, @jumlah_kuis) + 1

WHERE angka.n < 1000000;


-- ------------------------------------------------------------
-- 7. VALIDASI JUMLAH DATA
-- ------------------------------------------------------------

SELECT
    'hasil_kuis' AS nama_tabel,
    COUNT(*) AS jumlah_baris
FROM hasil_kuis;

SELECT
    MIN(tanggal_pengerjaan) AS tanggal_terlama,
    MAX(tanggal_pengerjaan) AS tanggal_terbaru
FROM hasil_kuis;


-- ============================================================
-- 8. BENCHMARK SEBELUM INDEX TANGGAL
-- ============================================================

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


-- Jalankan query aktual dan catat waktu eksekusinya.

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


-- ============================================================
-- 9. MEMBUAT SINGLE INDEX TANGGAL
-- ============================================================

CREATE INDEX idx_hasil_tanggal
ON hasil_kuis(tanggal_pengerjaan);

SHOW INDEX FROM hasil_kuis;


-- ------------------------------------------------------------
-- 10. BENCHMARK SETELAH INDEX TANGGAL
-- ------------------------------------------------------------

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


-- ============================================================
-- 11. PENGUJIAN COMPOSITE INDEX
-- ============================================================

-- Sebelum composite index

EXPLAIN
SELECT
    id_hasil,
    id_siswa,
    id_kuis,
    nilai,
    tanggal_pengerjaan
FROM hasil_kuis
WHERE status_pengerjaan = 'selesai'
  AND tanggal_pengerjaan >= '2025-01-01'
  AND tanggal_pengerjaan < '2025-04-01';


-- Membuat composite index

CREATE INDEX idx_hasil_status_tanggal
ON hasil_kuis(status_pengerjaan, tanggal_pengerjaan);


-- Sesudah composite index

EXPLAIN
SELECT
    id_hasil,
    id_siswa,
    id_kuis,
    nilai,
    tanggal_pengerjaan
FROM hasil_kuis
WHERE status_pengerjaan = 'selesai'
  AND tanggal_pengerjaan >= '2025-01-01'
  AND tanggal_pengerjaan < '2025-04-01';


-- ============================================================
-- 12. PENGUJIAN JOIN DAN AGREGASI
-- ============================================================

EXPLAIN
SELECT
    s.nama_siswa,
    k.judul_kuis,
    COUNT(hk.id_hasil) AS jumlah_pengerjaan,
    AVG(hk.nilai) AS rata_rata_nilai
FROM siswa s

JOIN hasil_kuis hk
    ON hk.id_siswa = s.id_siswa

JOIN kuis k
    ON hk.id_kuis = k.id_kuis

WHERE hk.tanggal_pengerjaan >= '2025-01-01'
  AND hk.tanggal_pengerjaan < '2025-04-01'

GROUP BY
    s.id_siswa,
    s.nama_siswa,
    k.id_kuis,
    k.judul_kuis

ORDER BY jumlah_pengerjaan DESC;


-- Jalankan query JOIN aktual

SELECT
    s.nama_siswa,
    k.judul_kuis,
    COUNT(hk.id_hasil) AS jumlah_pengerjaan,
    AVG(hk.nilai) AS rata_rata_nilai
FROM siswa s

JOIN hasil_kuis hk
    ON hk.id_siswa = s.id_siswa

JOIN kuis k
    ON hk.id_kuis = k.id_kuis

WHERE hk.tanggal_pengerjaan >= '2025-01-01'
  AND hk.tanggal_pengerjaan < '2025-04-01'

GROUP BY
    s.id_siswa,
    s.nama_siswa,
    k.id_kuis,
    k.judul_kuis

ORDER BY jumlah_pengerjaan DESC;
