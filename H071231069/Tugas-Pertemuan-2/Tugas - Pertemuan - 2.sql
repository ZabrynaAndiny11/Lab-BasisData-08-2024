# Nama : Novi Rezkiyah Azzahrah Ramadhani
# Nim  : H071231069

USE classicmodels;

# NO 1
SELECT * FROM products;
SELECT productCode AS "Kode Produk",productName AS "NamaProduk",quantityInStock AS "Jumlah Stok" FROM products
WHERE quantityInStock >= 5000 AND quantityInStock <= 6000

#NO 2
SELECT * FROM orders;
SELECT orderNumber AS "Nomor Pesanan",orderDate AS "Tanggal Pesanan",status,customerNumber AS "Nomor Pelanggan"  FROM orders
WHERE status != "Shipped" ORDER BY customerNumber

#NO 3
SELECT * FROM employees;
SELECT employeeNumber AS "Nomor Karyawan",firstName,lastName,email,jobTitle AS "Jabatan" FROM employees
WHERE jobTitle = "Sales Rep" ORDER BY firstName limit 10 

#NO 4
SELECT * FROM products;
SELECT productCode AS "Kode Produk",productName AS "Nama Produk",productLine AS "Lini Product",buyPrice AS "Harga Beli" FROM products
ORDER BY buyPrice DESC 
LIMIT 10 OFFSET 5

#NO 5
SELECT * FROM customers;
SELECT DISTINCT country,city FROM customers
ORDER BY country,city

# LIVE CODING
SELECT * FROM orders;
SELECT orderDate, shippedDate, `status` FROM orders
WHERE shippedDate IS NULL 

