use classicmodels;


-- nomor 1

(SELECT pdt.productName,
sum(od.priceEach * od.quantityOrdered) "TotalRevenue",
'Pendapatan Tinggi' Pendapatan
FROM products pdt
JOIN orderdetails od USING(productCode)
JOIN orders o USING(orderNumber)
WHERE MONTH(o.orderDate) = 9
GROUP BY pdt.productName
ORDER BY TotalRevenue DESC 
LIMIT 5)

UNION 
(SELECT pdt.productName,
sum(od.priceEach * od.quantityOrdered) "TotalRevenue",
'Pendapatan Pendek (kayak cholin)' Pendapatan
FROM products pdt
JOIN orderdetails od USING(productCode)
JOIN orders o USING(orderNumber)
WHERE MONTH(o.orderDate) = 9
GROUP BY pdt.productName 
ORDER BY TotalRevenue
LIMIT 5)


-- nomor 2

SELECT pdt.productName
FROM products pdt
WHERE pdt.productCode IN (
	SELECT pdt.productCode
	FROM products pdt
	EXCEPT (
		SELECT od.productCode
		FROM orders o
		JOIN orderdetails od USING(ordernumber)
		WHERE o.customerNumber IN (
		  SELECT c.customerNumber
		  FROM customers c
		  JOIN orders o USING(customernumber)
		  JOIN orderdetails od USING(ordernumber)
		  JOIN products pdt USING(productcode)
		  WHERE pdt.buyPrice > (
		  		-- Query ini menghitung rata-rata harga beli produk untuk pelanggan yang memiliki lebih dari 10 pesanan.
			  SELECT AVG(buyPrice) 
			  FROM products
		  )
		  GROUP BY c.customerNumber
		  HAVING COUNT(distinct o.orderNumber) > 10
		)
	)
)


-- nomor 3

SELECT c.customerName
FROM payments p
JOIN customers c USING(customerNumber)
GROUP BY p.customerNumber
HAVING SUM(p.amount) > 2 * (
	SELECT AVG(totalhasilsum)
		FROM (
			SELECT sum(p.amount) as totalhasilsum
			FROM payments p
			GROUP BY p.customerNumber
		) AS gila
)

INTERSECT
SELECT c.customerName
FROM orders o 
JOIN customers c USING(customerNumber)
JOIN orderdetails od USING(orderNumber)
JOIN products pdt USING(productcode)
WHERE pdt.productLine IN ('Planes', 'Trains')
GROUP BY o.customerNumber
HAVING SUM(od.quantityOrdered * od.priceEach) > 20000

-- nomor 4

SELECT result.orderDate,
result.customernumber,
result.riwayat
FROM (
	SELECT o.orderDate, o.customerNumber,
	'Membayar Pesanan dan Memesan Barang' AS riwayat
	FROM orders o
	JOIN customers c USING (customerNumber)
	JOIN payments p ON o.orderDate = p.paymentDate
	WHERE MONTH(o.orderDate) = 9
	AND YEAR(o.orderDate) = 2003
    
   UNION
    
	SELECT o.orderDate, o.customerNumber,
	'Memesan Barang' AS riwayat
	FROM orders o
	WHERE MONTH(o.orderDate) = 9
	AND YEAR(o.orderDate) = 2003
	EXCEPT
	SELECT o2.orderDate, o2.customerNumber,
	'Memesan Barang' AS riwayat
	FROM orders o2
	JOIN payments p2 ON o2.orderDate = p2.paymentDate
	WHERE MONTH(o2.orderDate) = 9
	AND YEAR(o2.orderDate) = 2003
    
   UNION
	
	SELECT p.paymentDate, p.customerNumber,
	'Membayar Pesanan' AS riwayat
	FROM payments p
	WHERE MONTH(p.paymentDate) = 9
	AND YEAR(p.paymentDate) = 2003
	EXCEPT
	SELECT p2.paymentDate, p2.customerNumber,
	'Membayar Pesanan' AS riwayat
	FROM orders o2
	JOIN payments p2 ON o2.orderDate = p2.paymentDate
	WHERE MONTH(p2.paymentDate) = 9
	AND YEAR(p2.paymentDate) = 2003
) AS result
ORDER BY result.orderDate


-- nomor 5

SELECT ggwp.productcode
FROM (
	SELECT pdt.productcode
	FROM products pdt
	JOIN orderdetails od USING(productcode)
	JOIN orders o USING(ordernumber)
	WHERE pdt.buyPrice > (
		SELECT AVG(pdt.buyPrice)
		FROM products pdt
	)
	AND o.orderDate BETWEEN "2001-01-01" AND "2004-03-31"
	AND od.quantityOrdered > 48
	
	INTERSECT  
	
	SELECT pdt.productCode
	FROM products pdt 
	WHERE pdt.productVendor LIKE 'A%' 
	OR pdt.productVendor LIKE 'I%' 
	OR pdt.productVendor LIKE 'U%'
	OR pdt.productVendor LIKE 'E%'
	OR pdt.productVendor LIKE 'O%'
		
	EXCEPT 	
	
	SELECT pdt.productCode
	FROM products pdt
	JOIN orderdetails od USING(productcode)
	JOIN orders o USING(ordernumber)
	JOIN customers c USING(customernumber)
	JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber
	JOIN offices ofc USING(officeCode)
	WHERE ofc.country IN ('Japan', 'UK', 'France')
	AND c.country IN ('Japan', 'Germany', 'Italy')
) ggwp
GROUP BY ggwp.productCode