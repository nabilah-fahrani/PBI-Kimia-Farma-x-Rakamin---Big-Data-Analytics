/*
Import CSV File ke SQL

Karena kendala dalam pengaktifan BigQuery, saya menggunakan MySQL sebagai alternatif karena MySQL adalah program query yang bisa saya operasikan secara lokal. 
Saya menggunakan perintah 'LOAD DATA INFILE' setelah sebelumnya memindahkan file CSV utama ke server MySQL di laptop saya.
*/

-- Tabel kf_final_transaction
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/kf_final_transaction_clean.csv'
INTO TABLE kf_final_transaction
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(transaction_id, date, branch_id, customer_name, product_id, price, discount_percentage, rating, clean_date);

-- Tabel kf_inventory
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/kf_inventory_final.csv'
INTO TABLE kf_inventory
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Inventory_ID, branch_id, product_id, product_name, opname_stock);

-- Tabel kf_kantor_cabang
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/kf_kantor_cabang.csv'
INTO TABLE kf_kantor_cabang
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(branch_id, branch_category, branch_name, kota, provinsi, rating);

-- Tabel kf_product
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/kf_product.csv'
INTO TABLE kf_product
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(product_id, product_name, product_category, price);