# Nama : Novi Rezkiyah Azzahrah Ramadhani 
# Nim  : H071231069


#NO 1
SELECT 
	c.customerName,
	CONCAT(e.firstName, " ", e.lastName) AS 'salesRep',
	creditLimit - SUM(p.amount) AS 'remainingCredit'
FROM customers c
JOIN employees e
ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN payments AS p
USING(customerNumber)
GROUP BY c.customerName
HAVING `remainingCredit` > 0

#NO 2
SELECT
	p.productName AS 'Nama Produk',
	GROUP_CONCAT(DISTINCT c.customerName ORDER BY c.customerName ASC) AS 'Nama Customer',
	COUNT(c.customerNumber) AS 'Jumlah Customer',
	SUM(od.quantityOrdered) AS 'Total Quantitas'
FROM products p
JOIN orderdetails od
USING(productCode)
JOIN orders o
USING(orderNumber)
JOIN customers c
USING(customerNumber)
GROUP BY p.productName

#N03
SELECT 
	CONCAT(e.firstName, " " ,e.lastName) AS employeeName,
	COUNT(DISTINCT c.customerName) AS 'totalCustomer'
FROM employees AS e
JOIN customers AS c ON c.salesRepEmployeeNumber = e.employeeNumber
GROUP BY employeeName
ORDER BY totalCustomer DESC ;

#NO4
SELECT 
		CONCAT(e.firstName, " " ,e.lastName) AS `Nama Karyawan`,
		p.productName AS `Nama Produk`,
		SUM(od.quantityOrdered) AS `Jumlah Pesanan`
FROM products AS p
JOIN orderdetails AS od USING(productCode)
JOIN orders AS o USING(orderNumber)
JOIN customers AS c USING(customerNumber) 
RIGHT JOIN employees AS e ON e.employeeNumber= c.salesRepEmployeeNumber
JOIN offices AS f USING(officeCode)
WHERE f.country = 'Australia'
GROUP BY `Nama Karyawan` , `Nama Produk` 
ORDER BY `Jumlah Pesanan` DESC

#NO5 
SELECT 
	c.customerName AS `Nama Pelanggan`,
	GROUP_CONCAT(DISTINCT p.productName SEPARATOR ' , ') AS `Nama Produk`,
	COUNT(p.productCode) AS `Banyak Jenis Barang`
FROM customers AS c
JOIN orders AS o USING(customerNumber)
JOIN orderdetails AS od USING(orderNumber)
JOIN products AS p USING(productCode)
WHERE o.shippedDate IS NULL 
GROUP BY c.customerName
ORDER BY c.customerName



