USE classicmodels;

SELECT * FROM customers;
SELECT customerName FROM customers;
SELECT country, customerName, phone FROM customers;
SELECT customerName, country FROM customers WHERE country != 'USA';
SELECT country FROM customers ORDER BY country DESC;
SELECT productname, buyprice FROM products WHERE buyprice > 100;
SELECT productname AS 'nama produk', buyprice 'harga barang' FROM products ORDER BY buyprice;
SELECT * FROM products LIMIT 2, 5;
SELECT DISTINCT country FROM customers;
SELECT customerName AS 'nama pelangan', phone 'nomor telepon' FROM customers WHERE country ='USA' LIMIT 10;

SELECT productName AS 'produk', quantityInStock AS 'quantity' FROM products WHERE quantityInStock > 100 ORDER BY productName;
SELECT DISTINCT buyprice AS 'harga' FROM products ORDER BY buyprice;
SELECT firstName, lastName, jobTitle FROM employees WHERE officeCode = 1;
SELECT orderNumber, shippedDate, status FROM orders WHERE status = 'shipped' ORDER BY shippedDate ASC;
SELECT productName AS 'produk', buyprice FROM products WHERE buyprice < 50 ORDER BY buyprice LIMIT 5;

SELECT customernumber, paymentDate, amount FROM payments WHERE paymentDate < '2005-01-01' AND paymentDate >'2003-12-31' ORDER BY paymentDate;
SELECT buyprice, MSRP FROM products WHERE buyprice > MSRP;
