/* 
Create Table untuk Import Data dari CSV ke BigQuery

Dataset: kimia_farma
Tabel:
1. kf_final_transaction
2. kf_inventory
3. kf_kantor_cabang
4. kf_product
*/

-- Tabel kf_final_transaction
CREATE OR REPLACE TABLE kimia_farma.kf_final_transaction (
  transaction_id STRING,
  date DATE,
  branch_id INT64,
  customer_name STRING,
  product_id STRING,
  price NUMERIC,
  discount_percentage NUMERIC,
  rating NUMERIC
);

-- Tabel kf_inventory
CREATE OR REPLACE TABLE kimia_farma.kf_inventory (
  inventory_id STRING,
  branch_id INT64,
  product_id STRING,
  product_name STRING,
  opname_stock INT64
);

-- Tabel kf_kantor_cabang
CREATE OR REPLACE TABLE kimia_farma.kf_kantor_cabang (
  branch_id INT64,
  branch_category STRING,
  branch_name STRING,
  kota STRING,
  provinsi STRING,
  rating NUMERIC
);

-- Tabel kf_product
CREATE OR REPLACE TABLE kimia_farma.kf_product (
  product_id STRING,
  product_name STRING,
  product_category STRING,
  price NUMERIC
);
