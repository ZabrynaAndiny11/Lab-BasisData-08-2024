# Nama : Diza Sazkia
# Nim  : H071231043

#1
SELECT DISTINCT 
    c.customerName AS 'namaKustomer', 
    pr.productName AS 'namaProduk', 
    pl.textDescription
FROM customers c
INNER JOIN orders o
ON c.customerNumber = o.customerNumber  
INNER JOIN orderDetails od
ON o.orderNumber = od.orderNumber 
INNER JOIN products pr
ON od.productCode = pr.productCode  
INNER JOIN productLines pl
ON pr.productLine = pl.productLine 
WHERE pr.productName LIKE '%Titanic%' 
ORDER BY c.customerName ASC;

#2
SELECT
    c.customerName, 
    pr.productName, 
    o.status,
    o.shippedDate
FROM customers c
INNER JOIN orders o
ON c.customerNumber = o.customerNumber  
INNER JOIN orderDetails od
ON o.orderNumber = od.orderNumber 
INNER JOIN products pr
ON od.productCode = pr.productCode 
WHERE pr.productName LIKE '%Ferrari%'  
  AND o.status = 'Shipped' 
  AND o.shippedDate BETWEEN '2003-10-01' AND '2004-09-30'
ORDER BY o.shippedDate DESC; 

#3
SELECT 
    s.firstName AS 'Supervisor',
    k.firstName AS 'Karyawan'
FROM employees s
INNER JOIN employees k 
ON s.employeeNumber = k.reportsTo
WHERE s.firstName LIKE '%Gerard%'
ORDER BY s.firstName ASC;

#4

#a
SELECT 
	c.customerName, 
	p.paymentDate,
	e.firstName AS 'employeeName',
	p.amount
FROM customers c
INNER JOIN payments p
ON c.customerNumber = p.customerNumber
INNER JOIN employees e
ON e.employeeNumber = c.salesRepEmployeeNumber
WHERE p.paymentDate LIKE '%11___'

#b
SELECT 
	c.customerName, 
	p.paymentDate,
	e.firstName AS 'employeeName',
	p.amount
FROM customers c
INNER JOIN payments p
ON c.customerNumber = p.customerNumber
INNER JOIN employees e
ON e.employeeNumber = c.salesRepEmployeeNumber
WHERE p.paymentDate LIKE '%11___' 
ORDER BY p.amount DESC
LIMIT 1;

#c
SELECT 
	c.customerName,
	p.productName
FROM customers c
INNER JOIN orders o
USING (customerNumber)
INNER JOIN orderDetails od
ON o.orderNumber = od.orderNumber 
INNER JOIN products p
ON od.productCode = p.productCode 
INNER JOIN payments py
ON c.customerNumber = py.customerNumber
WHERE c.customerName LIKE 'Corporate%' AND py.paymentDate LIKE '%11___'


#soal tambahan
SELECT 
	o.orderNumber,
	c.customerName,
	o.orderDate
FROM orders o
INNER JOIN customers c
USING (customerNumber)
WHERE orderDate BETWEEN '2003-01-01' AND '2003-06-30'