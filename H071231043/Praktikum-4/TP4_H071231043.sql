# Nama : Diza Sazkia
# Nim  : H071231043

#1
SELECT 
	customerNumber, 
	customerName, 
	country
FROM customers
WHERE (country = 'USA' AND creditLimit > 50000 AND creditLimit < 100000)
   OR (country != 'USA' AND creditLimit >= 100000 AND creditLimit <= 200000)
ORDER BY creditLimit DESC;

#2
SELECT 
	productCode, 
	productName, 
	quantityInStock,
	buyPrice
FROM products
WHERE quantityInStock >= 1000 AND quantityInStock <= 2000
	AND (buyPrice < 50 OR buyPrice > 150)
	AND productLine != 'Vintage';
	 
	 
#3
SELECT productCode,
		 productName, 
		 MSRP 
FROM products 
WHERE productLine LIKE 'Classic%' AND buyPrice > 50

#4
SELECT orderNumber, 
		 orderdate, 
		 status, 
		 customerNumber
FROM orders 
WHERE orderNumber > 10250 
	AND status NOT IN ('Shipped', 'Cancelled')
	AND orderDate >= '2004-01-01' AND orderDate <= '2005-12-31'


#5
SELECT orderNumber, 
		 orderLineNumber, 
		 productCode, 
		 quantityOrdered, 
		 priceEach,
		 priceEach * 0.95 AS discountedTotalPrice
FROM orderdetails
WHERE quantityOrdered > 50
	AND priceEach > 100
	AND productCode NOT LIKE 'S18%'
ORDER BY discountedTotalPrice DESC;
	