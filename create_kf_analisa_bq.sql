/* 
Create Table Big Data Analysis Performa Kimia Farma Tahun 2020-2023

Menggunakan alias agar query lebih jelas dan singkat:
t = kf_final_transaction
c = kf_kantor_cabang
p = kf_product
*/

/*
Catatan: Query ini dijalankan di MySQL lokal, bukan BigQuery.
Untuk BigQuery, ganti schema/tabel sesuai dataset BigQuery (misalnya `project.dataset.table`).
*/
CREATE OR REPLACE TABLE dataset_kimiafarma.kf_analisa AS
SELECT
    t.transaction_id AS transaction_id,
    t.date AS date,
    t.branch_id AS branch_id,
    c.branch_name AS branch_name,
    c.kota AS kota,
    c.provinsi AS provinsi,
    c.rating AS rating_cabang,
    t.customer_name AS customer_name,
    p.product_id AS product_id,
    p.product_name AS product_name,
    p.price AS actual_price,
    t.discount_percentage AS discount_percentage,
    -- Perhitungan laba yang diterima dari obat
    CASE
        WHEN p.price <= 50000 THEN 10
        WHEN p.price <= 100000 THEN 15
        WHEN p.price <= 300000 THEN 20
        WHEN p.price <= 500000 THEN 25
        ELSE 30
    END AS persentase_gross_laba,
    -- Perhitungan harga obat setelah diskon
    p.price * (1 - t.discount_percentage / 100) AS nett_sales,
    -- Perhitungan keuntungan yang diperoleh Kimia Farma
    (p.price * (1 - t.discount_percentage / 100)) *
    (CASE 
        WHEN p.price <= 50000 THEN 0.10
        WHEN p.price <= 100000 THEN 0.15
        WHEN p.price <= 300000 THEN 0.20
        WHEN p.price <= 500000 THEN 0.25
        ELSE 0.30
    END) AS nett_profit,
    t.rating AS rating_transaksi
FROM dataset_kimiafarma.kf_final_transaction t
LEFT JOIN dataset_kimiafarma.kf_product p ON t.product_id = p.product_id
LEFT JOIN dataset_kimiafarma.kf_kantor_cabang c ON t.branch_id = c.branch_id;
