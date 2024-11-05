#NO1
(SELECT 
		productName,
		SUM(priceEach * quantityOrdered)  AS TotalRevenue,
		'Pendapatan Tinggi' AS Pendapatan
FROM products
JOIN orderdetails USING(productCode)
JOIN orders USING(orderNumber)
WHERE MONTH(orderDate) = 9
GROUP BY productName
ORDER BY TotalRevenue DESC
LIMIT 5)
UNION
(SELECT 
	    productName,
	    SUM(priceEach * quantityOrdered)  AS TotalRevenue,
	    'Pendapatan Pendek (kayak kamu)' AS Pendapatan
FROM products
JOIN orderdetails USING(productCode)
JOIN orders USING(orderNumber)
WHERE MONTH(orderDate) = 9
GROUP BY productName
ORDER BY TotalRevenue ASC
LIMIT 5)

#NO2
SELECT p.productName
FROM products AS p
EXCEPT
SELECT p.productName
FROM products p
JOIN orderdetails AS od USING(productCode)
JOIN orders AS o USING(orderNumber)
WHERE customerNumber IN (SELECT customerNumber
							    FROM orders
							    GROUP BY customerNumber
							    HAVING COUNT(*) > 10
						  		 INTERSECT
							    SELECT DISTINCT o.customerNumber
							    FROM orders o
							    JOIN orderdetails od USING(orderNumber)
							    JOIN products p USING(productCode)
							    WHERE p.buyPrice > (
							        SELECT AVG(buyPrice)
							        FROM products)
							   )


#NO3
SELECT customerName
FROM customers
JOIN payments USING(customerNumber)
GROUP BY customerName
HAVING SUM(amount) > 2 * (
    SELECT AVG(totalAmount)
    FROM (
        SELECT DISTINCT SUM(amount) AS totalAmount
        FROM payments
        GROUP BY customerNumber
    ) AS hasil)
INTERSECT
SELECT c.customerName
FROM customers AS c
JOIN orders AS o USING(customerNumber)
JOIN orderdetails AS od USING(orderNumber)
JOIN products AS p USING(productCode)
WHERE p.productLine IN ('Planes', 'Trains')
GROUP BY c.customerName
HAVING SUM(priceEach * quantityOrdered) > 20000;


#NO4
SELECT 
	    o.orderDate AS 'Tanggal',
	    c.customerNumber AS 'CustomerNumber',
	    'Membayar Pesanan dan Memesan Barang' AS 'riwayat'
FROM orders AS o
JOIN customers AS c USING (customerNumber)
JOIN payments AS p ON o.orderDate = p.paymentDate
HAVING MONTH(Tanggal) = 09 AND YEAR(Tanggal) = 2003
UNION
SELECT 
	    orderDate, 
	    customerNumber,
	    'Memesan Barang' 
FROM orders
WHERE MONTH(orderDate) = 09 AND YEAR(orderDate) = 2003
AND orderDate NOT IN (  
	SELECT o.orderDate AS 'Tanggal'
	FROM orders AS o
	JOIN customers AS c 
        USING (customerNumber)
	JOIN payments AS p 
        ON o.orderDate = p.paymentDate
	HAVING MONTH(Tanggal) = 09 AND YEAR(Tanggal) = 2003
)
UNION
SELECT 
	    paymentDate, 
	    customerNumber, 
	    'Membayar Pesanan' FROM payments
WHERE MONTH(paymentDate) = 09 AND YEAR(paymentDate) = 2003
AND paymentDate NOT IN (  
	SELECT p.paymentDate AS 'Tanggal'
	FROM orders AS o
	JOIN customers AS c USING (customerNumber)
	JOIN payments p ON o.orderDate = p.paymentDate
	HAVING MONTH(Tanggal) = 09 AND YEAR(Tanggal) = 2003
)
ORDER BY Tanggal;

#NO5
SELECT DISTINCT productCode FROM products
JOIN orderdetails USING(productCode)
WHERE buyPrice > (
					    SELECT AVG(buyPrice) FROM products 
					    join orderdetails USING(productCode) 
					    join orders USING(orderNumber)
					    where orderDate BETWEEN '2001-01-01' and '2004-03-31')
AND quantityOrdered > 48
AND LEFT(productVendor, 1) IN ('A', 'I', 'U','E','O')
EXCEPT
SELECT DISTINCT productCode FROM products
JOIN orderdetails USING(productCode)
    JOIN orders USING(orderNumber)
    JOIN customers using(customerNumber)
WHERE country in ("Japan", "Germany", "Italy");