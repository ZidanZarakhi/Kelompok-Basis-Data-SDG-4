-- JSON SELECT

SELECT
    id_detail_soal,
    nomor_soal,
    JSON_UNQUOTE(
        JSON_EXTRACT(detail_soal, '$.pertanyaan')
    ) AS pertanyaan,
    JSON_UNQUOTE(
        JSON_EXTRACT(detail_soal, '$.tipe_soal')
    ) AS tipe_soal,
    JSON_EXTRACT(
        detail_soal, '$.poin'
    ) AS poin
FROM detail_soal_json;

SELECT
    id_detail_materi,
    judul_materi,
    JSON_UNQUOTE(
        JSON_EXTRACT(detail_materi, '$.mata_pelajaran')
    ) AS mata_pelajaran,
    JSON_UNQUOTE(
        JSON_EXTRACT(detail_materi, '$.topik')
    ) AS topik,
    JSON_UNQUOTE(
        JSON_EXTRACT(detail_materi, '$.jenis_file')
    ) AS jenis_file,
    JSON_EXTRACT(
        detail_materi, '$.tingkat_kesulitan'
    ) AS tingkat_kesulitan
FROM detail_materi_json;


-- JSON UPDATE DAN JSON SET
UPDATE detail_soal_json
SET detail_soal = JSON_SET(
    detail_soal,
    '$.tingkat_kesulitan',
    'sulit'
)
WHERE id_detail_soal = 1;

SELECT
    id_detail_soal,
    JSON_UNQUOTE(
        JSON_EXTRACT(
            detail_soal,
            '$.tingkat_kesulitan'
        )
    ) AS tingkat_kesulitan
FROM detail_soal_json
WHERE id_detail_soal = 1;


UPDATE detail_soal_json
SET detail_soal = JSON_SET(
    detail_soal,
    '$.waktu_pengerjaan',
    60
)
WHERE id_detail_soal = 1;

UPDATE detail_materi_json
SET detail_materi = JSON_SET(
    detail_materi,
    '$.pengarang',
    'Budi Santoso'
)
WHERE id_detail_materi = 1;


-- JSON EXTRACT
SELECT
    id_detail_materi,
    JSON_EXTRACT(
        detail_materi,
        '$.pengarang'
    ) AS pengarang
FROM detail_materi_json
WHERE id_detail_materi = 1;

-- JSON REMOVE
UPDATE detail_soal_json
SET detail_soal = JSON_REMOVE(
    detail_soal,
    '$.pembahasan'
)
WHERE id_detail_soal = 1;

SELECT
    id_detail_soal,
    JSON_CONTAINS_PATH(
        detail_soal,
        'one',
        '$.pembahasan'
    ) AS pembahasan_tersedia
FROM detail_soal_json
WHERE id_detail_soal = 1;


-- JSON WHERE
SELECT
    id_detail_soal,
    nomor_soal,
    JSON_UNQUOTE(
        JSON_EXTRACT(
            detail_soal,
            '$.pertanyaan'
        )
    ) AS pertanyaan,
    JSON_UNQUOTE(
        JSON_EXTRACT(
            detail_soal,
            '$.tingkat_kesulitan'
        )
    ) AS tingkat_kesulitan
FROM detail_soal_json
WHERE JSON_UNQUOTE(
    JSON_EXTRACT(
        detail_soal,
        '$.tingkat_kesulitan'
    )
) = 'mudah';










