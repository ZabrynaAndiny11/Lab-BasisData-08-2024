USE classicmodels;
#1
SELECT customerNumber, customerName, country FROM customers
WHERE (country = 'USA' AND creditLimit > 50000 AND creditLimit < 100000)
	OR (country != 'USA' AND creditLimit BETWEEN 100000 AND 200000)
ORDER BY creditLimit DESC;


#2
SELECT * FROM products
SELECT productCode, productName, quantityInStock, buyPrice FROM products
WHERE quantityInStock BETWEEN 1000 AND 2000
	AND buyPrice < 50 OR buyPrice > 150
	AND productLine NOT IN ("Vintage");
 
#3
SELECT productCode, productName, MSRP FROM products
WHERE productLine LIKE '%Classic%'
AND buyPrice > 50;

#4
SELECT orderNumber, orderDate, STATUS, customerNumber FROM orders
WHERE orderNumber > 10250
	AND STATUS NOT IN ('shipped', 'cancelled')
	AND orderDate BETWEEN '2004-01-01' AND  '2006-01-01';
	
#5
SELECT *, quantityOrdered * priceEach * 0.95 AS discountedTotalPrice FROM orderdetails
WHERE quantityOrdered > 50
	AND priceEach > 100
	AND productCode NOT LIKE 'S18%'
ORDER BY discountedTotalPrice DESC;