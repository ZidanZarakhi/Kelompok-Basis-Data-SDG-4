
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
