CREATE TABLE kelas (
    id_kelas INT AUTO_INCREMENT PRIMARY KEY,
    nama_kelas VARCHAR(50) NOT NULL,
    tingkat INT NOT NULL,
    tahun_ajaran VARCHAR(20) NOT NULL
);




CREATE TABLE pengguna (
    id_pengguna INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'guru', 'wali_murid') NOT NULL
);




CREATE TABLE siswa (
    id_siswa INT AUTO_INCREMENT PRIMARY KEY,
    id_kelas INT NOT NULL,
    nama_siswa VARCHAR(100),
    kode_siswa VARCHAR(30) NOT NULL UNIQUE,
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
    kode_kuis VARCHAR(30) NOT NULL UNIQUE,

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
