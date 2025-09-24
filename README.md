# Kimia Farma Data Analysis (2020–2023)

Proyek ini berisi query SQL untuk menganalisis performa Kimia Farma dari tahun 2020–2023.
Proyek ini adalah final task dari Project-Based Internship Kimia Farma x Rakamin Academy - Big Data Analytics.
Analisis dilakukan dengan membuat tabel transaksi, produk, kantor cabang, dan inventory, kemudian digabungkan dalam tabel analisa untuk menghitung metrik bisnis seperti nett sales, nett profit, dan gross profit margin.

## Struktur Proyek

1. **create_tables.sql** > Membuat 4 tabel utama untuk memindahkan data dari file CSV ke MySQL:
   - kf_final_transaction
   - kf_inventory
   - kf_kantor_cabang
   - kf_product
2. **load_data.sql** > Mengimpor data CSV ke MySQL menggunakan LOAD DATA INFILE.
3. **create_table_analisa.sql** > Membuat tabel kf_analisa yang berisi hasil join dari beberapa tabel serta perhitungan analisis (nett sales, nett profit, gross margin).

## Dataset

Dataset berasal dari 4 file CSV utama:
1. **kf_final_transaction_clean.csv** [Link file](https://drive.google.com/file/d/1lPVbW4Z4wzm9CnYXzvQGmQYQdDh_Rnmd/view?usp=sharing)
2. **kf_inventory_final.csv** [Link file](https://drive.google.com/file/d/1gcb7Xj_0TBgQ9lec2-mkHuuSJQkDsorQ/view?usp=sharing)
3. **kf_kantor_cabang.csv** [Link file](https://drive.google.com/file/d/1VT27J9rAtIgJ-JGOJuMH8lYpvkQG-Qjc/view?usp=sharing)
4. **kf_product.csv** [Link file](https://drive.google.com/file/d/1ijivhk-PKmNJ9OBZxifWAu0YqBelqwxv/view?usp=sharing)

Semua file di-load ke dalam tabel MySQL sebagai sumber utama analisis.

## CATATAN TEKNIS

Awalnya proyek ini direncanakan untuk menggunakan Google BigQuery sesuai instruksi.
Namun, karena terdapat kendala dalam aktivasi akun BigQuery di Google Cloud, maka sebagai alternatif digunakan MySQL.

Alasan penggunaan MySQL:
- Sudah dikuasai sebelumnya.
- Bisa dijalankan secara lokal tanpa kendala aktivasi akun.

Untuk submission, saya menyertakan dua versi kode:
- Versi asli (MySQL) → kode yang benar-benar saya jalankan.
- Versi konversi (BigQuery) → kode yang sudah saya adaptasi dengan bantuan AI agar sesuai dengan sintaks BigQuery.

## Struktur Branch

### mysql_version
Berisi semua query SQL asli untuk MySQL, termasuk pembuatan tabel, pemuatan data dari CSV, dan pembuatan tabel analisis.
### bigquery_version
Berisi versi query yang telah dikonversi ke sintaks BigQuery, disesuaikan dengan kebutuhan platform tersebut.
