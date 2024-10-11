# Tugas Praktikum  4

USE classicmodels;

# NOMOR 1

SELECT 
	c.customerName AS "namaKustomer", 
	p.productName AS "namaProduk", 
	pl.textDescription 
FROM customers AS c 
INNER JOIN orders AS o 
USING (customerNumber) 
INNER JOIN orderdetails AS od 
ON o.orderNumber = od.orderNumber 
INNER JOIN products AS p 
ON od.productCode = p.productCode 
INNER JOIN productlines AS pl 
ON p.productLine = pl.productLine
WHERE p.productName LIKE "%Titanic%"
ORDER BY c.customerName ASC;


# NOMOR 2

SELECT
	c.customerName,
	p.productName,
	o.status,
	o.shippedDate

FROM customers AS c
INNER JOIN orders AS o
ON c.customerNumber = o.customerNumber
INNER JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
INNER JOIN products AS p
ON od.productCode = p.productCode

WHERE productName LIKE "%Ferrari%"
AND status = "Shipped"
AND shippedDate BETWEEN "2003-10-01" AND "2004-10-01"
ORDER BY shippedDate ASC;


# NOMOR 3

SELECT
	e1.firstName AS Supervisor,
	e2.firstName AS Karyawan
FROM employees AS e1
INNER JOIN employees AS e2
ON e1.employeeNumber = e2.reportsTo
WHERE e1.firstName = "Gerard"
ORDER BY e2.firstName ASC;

# NOMOR 4
	
-- bagian a
SELECT c.`customerName`, p.`paymentDate`, e.`firstName` AS "employeeName", p.`amount`
FROM customers c
JOIN payments p ON c.`customerNumber` = p.`customerNumber`
JOIN employees e ON c.`salesRepEmployeeNumber` = e.`employeeNumber`
WHERE p.`paymentDate` LIKE "%-11-%";

-- bagian b
SELECT c.`customerName`, p.`paymentDate`, e.`firstName` AS "employeeName", p.`amount` # Memilih kolom
FROM customers c
JOIN payments p ON c.`customerNumber` = p.`customerNumber`
JOIN employees e ON c.`salesRepEmployeeNumber` = e.`employeeNumber`
WHERE p.`paymentDate` LIKE "%-11-%"
ORDER BY p.amount DESC LIMIT 1;

-- bagian c
SELECT c.`customerName`, p.`productName`
FROM customers c
JOIN payments py ON c.`customerNumber` = py.`customerNumber`
JOIN orders o ON c.`customerNumber` = o.`customerNumber`
JOIN orderdetails od ON o.`orderNumber` = od.`orderNumber`
JOIN products p ON od.`productCode` = p.`productCode`
WHERE py.`paymentDate` LIKE "%-11-%" AND c.customerName = "Corporate Gift Ideas Co."

# soal tambahan

SELECT c.customerNumber , o.orderNumber, o.STATUS
FROM customers c 
INNER JOIN orders o USING (customerNumber)
WHERE o.`status` = 'shipped'