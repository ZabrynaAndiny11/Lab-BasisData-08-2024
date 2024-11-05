# Nama : Diza Sazkia
# NIM : H071231043

#1
(SELECT 
	p.productName,
	SUM(od.priceeach * od.quantityOrdered) AS 'TotalRevenue',
	'Pendapatan Tinggi' AS Pendapatan
FROM products p
JOIN orderdetails od
USING(productCode)
JOIN orders o
USING(ordernumber)
WHERE MONTH(orderdate) = 9
GROUP BY productcode
ORDER BY `TotalRevenue` DESC 
LIMIT 5)
UNION 
(SELECT 
	p.productName,
	SUM(od.priceeach * od.quantityOrdered) AS 'TotalRevenue',
	'Pendapatan Pendek (kayak kamu)' AS Pendapatan
FROM products p
JOIN orderdetails od
USING(productCode)
JOIN orders o
USING(ordernumber)
WHERE MONTH(orderdate) = 9
GROUP BY productcode
ORDER BY `TotalRevenue`
LIMIT 5);

#2
SELECT
	productName
FROM products 
EXCEPT 
SELECT
	productName
FROM products
JOIN orderdetails
USING(productcode)
JOIN orders 
USING(ordernumber)
WHERE customerNumber IN(
	SELECT customerNumber
	FROM orders
	GROUP BY customerNumber
	HAVING COUNT(*) > 10
	INTERSECT 
	SELECT customerNumber
	FROM orders
	JOIN orderdetails
	USING(ordernumber)
	WHERE priceeach > (
		SELECT avg(priceeach)
		FROM orderdetails
		)
	)

#3
SELECT
	customerName
FROM customers
JOIN payments
USING(customerNumber)
GROUP BY customerNumber
HAVING SUM(amount) > 2 * (
	SELECT AVG(TotalPembayaran)
	FROM (
			SELECT SUM(amount) AS TotalPembayaran
			FROM payments 
			GROUP BY customerNumber
			) hasil
			
	)
INTERSECT
SELECT
	customerName
FROM customers
JOIN orders 
USING(customerNumber)
JOIN orderdetails
USING(orderNumber)
JOIN products
USING(productCode)
WHERE productline IN('Planes', 'Trains')
GROUP BY customerNumber
HAVING SUM(priceeach * quantityOrdered) > 20000

#4
SELECT
	orderdate AS 'Tanggal',
	o.customerNumber,
	'Memesan Barang' AS riwayat
FROM orders o
WHERE orderdate LIKE '2003-09%' 
		AND orderdate NOT IN(
		SELECT
			paymentdate
		FROM payments
		)
UNION 
SELECT
	paymentdate AS 'Tanggal',
	p.customerNumber,
	'Membayar Pesanan' AS riwayat
FROM payments p
WHERE paymentdate LIKE '2003-09%'
	AND paymentdate NOT IN(
		SELECT
			orderdate
		FROM orders
		)
UNION
SELECT DISTINCT 
	paymentdate AS 'Tanggal',
	o.customerNumber,
	'Membayar Pesanan dan Memesan Barang' AS riwayat
FROM payments p
JOIN customers c
USING(customerNumber)
JOIN orders o
ON p.paymentDate = o.orderDate
WHERE paymentdate LIKE '2003-09%'
ORDER BY tanggal;

#5
SELECT 
	productCode
FROM products
JOIN orderdetails od
USING(productCode)
JOIN orders
USING(orderNumber)
WHERE od.priceeach > (
	SELECT AVG(priceeach)
	FROM orderdetails
	)
AND orderdate BETWEEN '2001-01-01' AND '2004-03-31'
AND quantityOrdered > 48
AND LEFT(productVendor, 1) IN('a', 'i', 'u', 'e', 'o')
EXCEPT
SELECT 
	productCode
FROM products
JOIN orderdetails
USING(productcode)
JOIN orders
USING(orderNumber)
JOIN customers
USING(customerNumber)
WHERE country IN('japan', 'germany', 'Italy')
ORDER BY productCode 
