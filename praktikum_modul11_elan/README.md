Praktikum Modul 11 – Perkembangan DBMS dan Lingkup Penerapan Basis Data

Repositori ini berisi hasil praktikum Pertemuan 11 Mata Kuliah Praktik Basis Data yang diimplementasikan pada studi kasus proyek PjBL Aplikasi Umpan Balik Formatif Berbasis Exit Ticket untuk Meningkatkan Kualitas Pembelajaran di Sekolah (SDG 4).

Lingkungan Sistem
- DBMS: MySQL Community Server - GPL 8.4.3 (*Storage Engine*: InnoDB)
- SQL Editor / Client: DBeaver
- Model Data: Kombinasi Relasional dan Semi-Terstruktur (`JSON`)
- Version Control: Git & GitHub

Ringkasan Kegiatan Praktikum
1. Eksplorasi & Perbandingan DBMS: Identifikasi kelengkapan fitur MySQL 8.4.3 serta analisis perbandingan terhadap PostgreSQL dan MongoDB berdasarkan kebutuhan sistem evaluasi sekolah.
2. Implementasi Fitur JSON: Pembuatan skema tabel dengan kolom bertipe `JSON` serta pengujian manipulasi data menggunakan fungsi `JSON_VALID`, `JSON_EXTRACT`, `JSON_SET`, `JSON_REMOVE`, `JSON_UNQUOTE`, `JSON_OBJECT`, `JSON_ARRAY`, dan `JSON_LENGTH`.
3. Pemodelan Data Berorientasi Objek: Perancangan diagram kelas UML (`Pengguna`, `Admin`, `Guru`, `WaliMurid`, `Kelas`, `Siswa`, `UmpanBalik`, `Kuis`, `HasilKuis`, `DetailMateriJSON`, dan `DetailSoalJSON`) beserta pemetaan konsep objek dan pewarisan (inheritance) ke struktur relasional.
4. Analisis Lingkup Penerapan: Evaluasi kesesuaian model data dan fitur DBMS terhadap kebutuhan operasional pembelajaran di sekolah.
