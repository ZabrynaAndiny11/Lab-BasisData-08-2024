USE classicmodels;

SELECT * FROM products

#Nomor 1
SELECT customerNumber, customerName, country, creditLimit FROM customers
WHERE (country = 'USA' AND creditLimit BETWEEN 50000 AND 100000)
OR  (country != 'USA' AND creditLimit BETWEEN 100000 AND 200000)
ORDER BY creditLimit DESC;

#Nomor 2
SELECT productCode, productName, quantityInStock, buyPrice FROM products
WHERE (quantityInStock BETWEEN 1000 AND 2000) AND (buyPrice < 50 OR buyPrice > 150)
AND (productLine NOT LIKE '%Vintage%');

#Nomor 3
SELECT productCode, productName, MSRP FROM products
WHERE (productLine LIKE '%Classic%') AND (buyPrice > 50)

#Nomor 4
SELECT orderNumber, orderDate, STATUS, customerNumber FROM orders
WHERE (orderNumber > 10250) AND (STATUS NOT LIKE 'Shipped' AND STATUS NOT LIKE 'Cancelled') 
AND (orderDate LIKE '2004%' OR orderDate LIKE '2005%');

#Nomor 5
SELECT orderNumber, orderLineNumber, productCode, quantityOrdered, priceEach, 
priceEach * quantityOrdered * 0.95 AS 'discountedTotalPrice' FROM orderdetails
WHERE productCode NOT LIKE 'S18%' AND quantityOrdered > 50 AND priceEach > 100;