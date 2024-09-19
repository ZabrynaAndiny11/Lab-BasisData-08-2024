#nomor 1
SELECT productCode AS "kode produk", 
	productName AS "nama produk",
	quantityInStock AS "jumlah stok"
	FROM products
WHERE quantityInStock >= 5000 AND quantityInStock <= 6000;

#nomor2
SELECT orderNumber AS "nomor pesanan", 
	orderDate AS "tanggal pesanan",  
	STATUS,
	customerNumber AS "nomor pelanggan"
	FROM orders
WHERE STATUS != 'shipped'
ORDER BY customerNumber;

#nomor3
SELECT employeeNumber AS "Nomor Karyawan",
	firstName,
	lastName,
	email,
	jobTitle AS Jabatan
	FROM employees
WHERE jobTitle="Sales Rep"
ORDER BY firstName
LIMIT 10;

#nomor4
SELECT productCode AS "Kode Produk",
	productName AS "Nama Produk",
	productLine AS "Lini Produk",
	buyPrice AS "Harga Beli"
	FROM products
ORDER BY buyPrice DESC
LIMIT 5, 10;

#nomor5
SELECT DISTINCT country, city FROM customers
ORDER BY country, city;


#live coding
#1
SELECT customername, state, city FROM customers WHERE state = 'CA' ORDER BY customername ASC;

#2
SELECT orderDate, shippedDate,STATUS FROM orders  WHERE shippeddate IS null;
	