/* 
Create Table untuk Import Data dari CSV ke MySQL
 
File ini berisi query untuk pembuatan 4 tabel utama sebagai dataset yaitu:
1. kf_final_transaction
2. kf_inventory
3. kf_kantor_cabang
4. kf_product
Tabel ini dibuat untuk memindahkan data dari 4 file utama csv.
*/

-- Tabel kf_final_transaction
CREATE TABLE kf_final_transaction (
	transaction_id VARCHAR(20) PRIMARY KEY,
    date DATE,
    branch_id INT,
    customer_name VARCHAR(100),
    product_id VARCHAR(20),
    price DECIMAL(10,2),
    discount_percentage DECIMAL(5,2),
    rating DECIMAL (2,1)
);

-- Tabel kf_inventory
CREATE TABLE kf_inventory (
   Inventory_ID varchar(20) PRIMARY KEY,
   branch_id INT,
   product_id varchar(20),
   product_name varchar(255),
   opname_stock int
);

-- Tabel kf_kantor_cabang
CREATE TABLE kf_kantor_cabang (
   branch_id int PRIMARY KEY,
   branch_category varchar(50),
   branch_name varchar(100),
   kota varchar(50),
   provinsi varchar(50),
   rating decimal(2,1)
);

-- Tabel kf_product
CREATE TABLE kf_product (
   product_id varchar(20) PRIMARY KEY,
   product_name text,
   product_category varchar(20),
   price int
);