Untuk mengimport data dari DBMS relasional sebelumnya (MariaDB) ke Couchbase saya menggunakan cbimport

Bash Command
 /opt/couchbase/bin/cbimport json     
 --cluster couchbase://127.0.0.1
 --username Administrator
 --password '........'
 --bucket simpul_import_from_relasional                            --> Bucket Couchbase
 --dataset file:///home/zidan/Downloads/umpan_balik.json           --> Ganti nama file sesuai dengan masing masing tabel
 --format list     --generate-key %id_umpan_balik%                 --> Ganti id sesuai dengan id di tabel
 --scope-collection-exp akademik.umpan_balik
