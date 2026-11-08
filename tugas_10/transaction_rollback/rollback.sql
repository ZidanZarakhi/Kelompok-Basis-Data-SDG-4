START TRANSACTION;

INSERT INTO kelas (nama_kelas, tingkat, tahun_ajaran)
VALUES ('KELAS_UJI_ROLLBACK', 10, '2026/2027');

ROLLBACK;

SELECT *
FROM kelas
WHERE nama_kelas = 'KELAS_UJI_ROLLBACK';
