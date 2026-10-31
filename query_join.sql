-- ========================================================
-- TUGAS PRAKTIKUM: REDUNDANSI DAN DENORMALISASI
-- ========================================================

-- --------------------------------------------------------
-- TAHAP 1: EKSPLORASI JOIN DAN AGREGASI (Sebelum Denormalisasi)
-- Query ini menghitung jumlah siswa per kelas secara real-time
-- menggunakan LEFT JOIN dan fungsi agregasi COUNT().
-- --------------------------------------------------------

SELECT 
    kelas.nama_kelas, 
    kelas.kode_kelas, 
    COUNT(siswa.id_siswa) AS total_siswa
FROM kelas
LEFT JOIN siswa ON kelas.id_kelas = siswa.id_kelas
GROUP BY 
    kelas.id_kelas, 
    kelas.nama_kelas, 
    kelas.kode_kelas;


-- --------------------------------------------------------
-- TAHAP 2: PENERAPAN DENORMALISASI (DDL & INISIALISASI DATA)
-- 1. Menambahkan atribut turunan (kolom baru) ke tabel master (kelas)
-- --------------------------------------------------------

ALTER TABLE kelas ADD COLUMN jumlah_siswa INT DEFAULT 0;

-- 2. Mengisi/Sinkronisasi data awal ke kolom baru berdasarkan hasil hitung tabel siswa
UPDATE kelas
LEFT JOIN (
    SELECT id_kelas, COUNT(*) AS total
    FROM siswa
    GROUP BY id_kelas
) AS s ON kelas.id_kelas = s.id_kelas
SET kelas.jumlah_siswa = COALESCE(s.total, 0);


-- --------------------------------------------------------
-- TAHAP 3: PEMBUKTIAN (Query Tanpa JOIN atau Agregasi)
-- Memanggil data langsung dari kolom hasil denormalisasi.
-- Jauh lebih cepat karena tidak membutuhkan proses JOIN yang berat.
-- --------------------------------------------------------

SELECT 
    nama_kelas, 
    kode_kelas, 
    jumlah_siswa
FROM kelas;