/* 
Create Tabel Big Data Analysis Performa Kimia Farma Tahun 2020-2023

Tabel ini menggunakan alias agar query lebih jelas dan singkat ketika melakukan join.
Catatan alias: 
t = kf_final_transaction
c = kf_kantor_cabang
p = kf_product
*/

CREATE TABLE kf_analisa (
    transaction_id VARCHAR(50),
    date DATE,
    branch_id INT,
    branch_name VARCHAR(255),
    kota VARCHAR(100),
    provinsi VARCHAR(100),
    rating_cabang DECIMAL(3,1),
    customer_name VARCHAR(255),
    product_id VARCHAR(50),
    product_name VARCHAR(255),
    actual_price DECIMAL(12,2),
    discount_percentage DECIMAL(5,2),
    persentase_gross_laba INT,
    nett_sales DECIMAL(15,4),
    nett_profit DECIMAL(15,4),
    rating_transaksi DECIMAL(3,1)
);

-- Untuk menambahkan hasil analisa ke dalam tabel analisa
INSERT INTO kf_analisa (
    transaction_id, date, branch_id, branch_name, kota, provinsi, rating_cabang,
    customer_name, product_id, product_name, actual_price, discount_percentage,
    persentase_gross_laba, nett_sales, nett_profit, rating_transaksi
)
SELECT
	t.transaction_id,
    t.date,
    t.branch_id,
    c.branch_name,
    c.kota,
    c.provinsi,
    c.rating AS rating_cabang,
    t.customer_name,
    p.product_id,
    p.product_name,
    p.price AS actual_price,
    t.discount_percentage,
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
FROM kf_final_transaction t
LEFT JOIN kf_product p ON t.product_id = p.product_id
LEFT JOIN kf_kantor_cabang c ON t.branch_id = c.branch_id
;
