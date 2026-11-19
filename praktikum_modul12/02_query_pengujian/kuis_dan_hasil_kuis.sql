SELECT
    h.id_hasil,
    h.tanggal_pengerjaan,
    k.judul_kuis
FROM `simpul`.`akademik`.`hasil_kuis` AS h
JOIN `simpul`.`akademik`.`kuis` AS k
    ON h.id_kuis = k.id_kuis
WHERE h.id_kuis = "1"
  AND h.tanggal_pengerjaan >= "2026-11-01";
