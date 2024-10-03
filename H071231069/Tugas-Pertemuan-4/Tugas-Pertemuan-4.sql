# Nama : Novi Rezkiyah Azzahrah Ramadhani
# Nim  : H071231069

USE classicmodels

# NO 1
SELECT * FROM customers

SELECT customerNumber,customerName,Country
FROM customers 
WHERE (country = 'USA' AND creditLimit > 50000 AND creditLimit < 100000) 
OR (country != 'USA' AND creditLimit BETWEEN 100000 AND 200000)
ORDER BY creditLimit DESC ;

# NO 2

SELECT * FROM products

SELECT productCode,productName,quantityInStock,buyPrice
FROM products
WHERE quantityInStock BETWEEN 1000 AND 2000
AND buyPrice < 50 OR buyPrice > 150
AND productLine NOT LIKE 'Vintage';

# NO 3

SELECT * FROM products

SELECT productCode,productName,MSRP
FROM products
WHERE productLine LIKE  '%Classic%'
AND buyPrice > 50;

# NO 4

SELECT * FROM orders

SELECT orderNumber,orderDate,status,customerNumber
FROM orders
WHERE orderNumber > 10250 
AND status NOT IN ('Shipped' , 'Cancelled')
AND orderDate BETWEEN '2004-01-01' AND '2005-12-31';

# NO 5 

SELECT * FROM orderdetails 

SELECT *, (quantityOrdered * priceEach * 0.95) AS discountedTotalPrice
FROM orderdetails
WHERE quantityOrdered > 50
AND priceEach > 100
AND productCode NOT LIKE 'S18%'
ORDER BY discountedTotalPrice DESC; 
