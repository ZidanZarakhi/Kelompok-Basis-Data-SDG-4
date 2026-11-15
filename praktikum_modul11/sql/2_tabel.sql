CREATE TABLE detail_soal_json (
    id_detail_soal INT AUTO_INCREMENT PRIMARY KEY,
    id_kuis INT NOT NULL,
    nomor_soal INT NOT NULL,
    detail_soal JSON NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_detail_soal_kuis
        FOREIGN KEY (id_kuis)
        REFERENCES kuis(id_kuis)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    UNIQUE (id_kuis, nomor_soal)
);

CREATE TABLE detail_materi_json (
    id_detail_materi INT AUTO_INCREMENT PRIMARY KEY,
    id_pengguna INT NOT NULL,
    id_kelas INT NOT NULL,
    judul_materi VARCHAR(150) NOT NULL,
    detail_materi JSON NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_detail_materi_pengguna
        FOREIGN KEY (id_pengguna)
        REFERENCES pengguna(id_pengguna)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_detail_materi_kelas
        FOREIGN KEY (id_kelas)
        REFERENCES kelas(id_kelas)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);
