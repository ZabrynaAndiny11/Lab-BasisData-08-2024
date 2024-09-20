USE classicmodels;

SELECT productCode AS 'Kode produk', 
productName AS 'Nama Produk', quantityInStock AS 'Jumlah Produk'
FROM products
WHERE quantityInStock >= 5000 AND quantityInStock <= 6000;

SELECT orderNumber AS 'Nomor Pesanan', orderDate AS 'Tanggal Pesanan',
STATUS AS 'status', customerNumber AS 'Nomor Pelanggan'
FROM orders
WHERE STATUS != 'Shipped' 
ORDER BY orderNumber;

SELECT employeeNumber AS 'Nomor Karyawan', firstName, lastName,
email, jobTitle AS 'Jabatan'
FROM employees
WHERE jobTitle = 'Sales Rep'
ORDER BY firstName
LIMIT 10;

SELECT productCode AS 'Kode Produk', productName AS 'Nama Produk',
productLine AS 'Lini Produk', buyPrice AS 'Harga Beli'
FROM products
ORDER BY buyPrice DESC
LIMIT 10 OFFSET 5;

SELECT DISTINCT country, city FROM customers
ORDER BY country, city;

SELECT productName, quantityInStock
FROM products
WHERE quantityInStock <= 50;

SELECT customerNumber, paymentDate, amount AS 'Pengeluaran'
FROM payments
WHERE amount >= 100000
AND customerNumber = 141
ORDER BY amount DESC;
