SELECT h.id_hasil, h.id_siswa, k.judul_kuis, h.nilai
FROM simpul_import_from_relasional.akademik.hasil_kuis AS h
JOIN simpul_import_from_relasional.akademik.kuis AS k ON k.id_kuis = h.id_kuis
WHERE k.id_pengguna = "2"
  AND h.status_pengerjaan = "selesai"
  AND h.nilai >= 80;
