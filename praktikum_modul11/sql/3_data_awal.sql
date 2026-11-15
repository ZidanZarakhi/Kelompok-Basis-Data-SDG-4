INSERT INTO detail_soal_json
(id_kuis, nomor_soal, detail_soal)
VALUES
(
    1,
    1,
    '{
        "pertanyaan": "Berapakah hasil dari 10 x 5?",
        "tipe_soal": "pilihan_ganda",
        "opsi_jawaban": {
            "A": "15",
            "B": "25",
            "C": "50",
            "D": "100"
        },
        "kunci_jawaban": "C",
        "pembahasan": "10 dikalikan 5 menghasilkan 50.",
        "tingkat_kesulitan": "mudah",
        "poin": 10
    }'
),
(
    1,
    2,
    '{
        "pertanyaan": "Apa yang dimaksud dengan bilangan prima?",
        "tipe_soal": "isian_singkat",
        "kata_kunci": [
            "bilangan",
            "lebih dari satu",
            "dua faktor"
        ],
        "kunci_jawaban": "Bilangan yang memiliki tepat dua faktor.",
        "pembahasan": "Bilangan prima hanya dapat dibagi oleh 1 dan dirinya sendiri.",
        "tingkat_kesulitan": "menengah",
        "poin": 15
    }'
),
(
    2,
    1,
    '{
        "pertanyaan": "Apa satuan SI untuk gaya?",
        "tipe_soal": "pilihan_ganda",
        "opsi_jawaban": {
            "A": "Joule",
            "B": "Newton",
            "C": "Watt",
            "D": "Pascal"
        },
        "kunci_jawaban": "B",
        "pembahasan": "Satuan SI untuk gaya adalah Newton.",
        "tingkat_kesulitan": "mudah",
        "poin": 10
    }'
);



INSERT INTO detail_materi_json
(id_pengguna, id_kelas, judul_materi, detail_materi)
VALUES
(
    2,
    1,
    'Persamaan Linear',
    '{
        "mata_pelajaran": "Matematika",
        "topik": "Persamaan Linear",
        "jenis_file": "PDF",
        "jumlah_halaman": 15,
        "tingkat_kesulitan": "menengah",
        "tujuan_pembelajaran": [
            "Memahami persamaan linear",
            "Menyelesaikan persamaan linear satu variabel"
        ],
        "tags": [
            "matematika",
            "aljabar",
            "kelas 10"
        ]
    }'
),
(
    3,
    2,
    'Sistem Organ Manusia',
    '{
        "mata_pelajaran": "Biologi",
        "topik": "Sistem Organ",
        "jenis_file": "VIDEO",
        "durasi_menit": 20,
        "tingkat_kesulitan": "menengah",
        "tujuan_pembelajaran": [
            "Mengidentifikasi organ manusia",
            "Memahami fungsi organ tubuh"
        ],
        "tags": [
            "biologi",
            "organ manusia",
            "kelas 10"
        ]
    }'
);
