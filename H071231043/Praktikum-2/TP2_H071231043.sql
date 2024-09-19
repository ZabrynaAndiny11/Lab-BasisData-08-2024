#Nama	: Diza Sazkia
#NIM	: H071231043

USE classicmodels

#1
SELECT * FROM products

SELECT 
	productCode AS 'Kode Produk',
	productName AS 'Nama Produk',
	quantityInStock AS 'Jumlah Stok'
FROM products
WHERE quantityInStock >= 5000 AND quantityInStock <= 6000
ORDER BY quantityInStock;

#2
SELECT * FROM orders

SELECT
	orderNumber AS 'Nomor Pesanan',
	requiredDate AS 'Tanggal Pesanan',
	status ,
	customerNumber AS 'Nomor Pelanggan'
FROM orders
WHERE STATUS != "Shipped"
ORDER BY customerNumber; 

#3
SELECT * FROM employees

SELECT 
	employeeNumber AS 'Nomor Karyawan',
	firstName,
	lastName,
	email,
	jobTitle AS 'Jabatan'
FROM employees
ORDER BY firstName
LIMIT 10;

#4
SELECT * FROM products

SELECT 
	productCode AS 'Kode Produk',
	productName AS 'Nama Produk',
	productLine AS 'Lini Produk',
	buyPrice AS 'Harga Beli'
FROM products
ORDER BY buyPrice DESC
LIMIT 5, 10;

#5
SELECT DISTINCT 
	country,
	city
FROM customers
ORDER BY country, city;

# SOAL TAMBAHAN
SELECT * FROM employees

SELECT 
	employeeNumber,
	firstname,
	jobTitle
FROM employees
WHERE reportsTo = 1102 OR officeCode = 1;

