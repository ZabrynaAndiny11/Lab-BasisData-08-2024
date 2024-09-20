#nomor 1
SELECT productCode AS 'Kode Produk', 
productName AS 'Nama Produk' ,
quantityInStock AS 'Jumlah Stok'
FROM products
WHERE quantityInStock BETWEEN 5000 AND 6000;

#nomor 2
SELECT orderNumber AS 'Nomor Pesanan' ,
orderDate AS 'Tanggal Pesanan' ,
STATUS ,
customerNumber AS 'Nomor Pelanggan' 
FROM orders
WHERE STATUS != "Shipped"
ORDER BY customerNumber ;

#nomor 3
SELECT officeCode AS 'Nomor Karyawan',
firstName , lastName ,email ,
jobTitle AS 'Jabatan'
FROM employees
WHERE jobTitle = "sales Rep" 
ORDER BY firstName 
LIMIT 10 ;

#nomor 4
SELECT productCode AS 'Kode Produk',
productName AS 'Nama Product',
productLine AS 'Lini Produk',
buyPrice AS 'Harga Beli'
FROM products
ORDER BY buyPrice DESC
LIMIT 10 OFFSET 5 ; 

#nomor 5
SELECT country , city 
FROM customers
ORDER BY country , city ;


#live codiing
SELECT customerName , state ,city
FROM customers
WHERE state = 'CA'
ORDER BY customerName ;

