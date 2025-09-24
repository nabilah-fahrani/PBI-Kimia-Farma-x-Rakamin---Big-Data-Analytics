/*
Import CSV File ke SQL

Karena kendala dalam pengaktifan BigQuery, saya menggunakan MySQL sebagai alternatif karena MySQL adalah program query yang bisa saya operasikan secara lokal. 
Saya menggunakan perintah 'LOAD DATA INFILE' setelah sebelumnya memindahkan file CSV utama ke server MySQL di laptop saya.
*/

# Tabel kf_final_transaction
bq load \
  --source_format=CSV \
  --skip_leading_rows=1 \
  kimia_farma.kf_final_transaction \
  "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/kf_final_transaction_clean.csv" \
  transaction_id:STRING,date:DATE,branch_id:INT64,customer_name:STRING,product_id:STRING,price:NUMERIC,discount_percentage:NUMERIC,rating:NUMERIC

# Tabel kf_inventory
bq load \
  --source_format=CSV \
  --skip_leading_rows=1 \
  kimia_farma.kf_inventory \
  "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/kf_inventory_final.csv" \
  inventory_id:STRING,branch_id:INT64,product_id:STRING,product_name:STRING,opname_stock:INT64

# Tabel kf_kantor_cabang
bq load \
  --source_format=CSV \
  --skip_leading_rows=1 \
  kimia_farma.kf_kantor_cabang \
  "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/kf_kantor_cabang.csv" \
  branch_id:INT64,branch_category:STRING,branch_name:STRING,kota:STRING,provinsi:STRING,rating:NUMERIC

# Tabel kf_product
bq load \
  --source_format=CSV \
  --skip_leading_rows=1 \
  kimia_farma.kf_product \
  "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/kf_product.csv" \
  product_id:STRING,product_name:STRING,product_category:STRING,price:NUMERIC
