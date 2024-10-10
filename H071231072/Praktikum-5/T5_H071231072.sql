USE classicmodels ;
#nomor 1
SELECT DISTINCT 
 c.customerName AS NamaKustomer,
p.productName AS namaProduk,
pl.textDescription
FROM customers AS c
JOIN orders AS o 
ON c.customerNumber = o.customerNumber
JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
JOIN products AS p
ON od.productCode = p.productCode
JOIN productlines AS pl
ON p.productLine = pl.productLine
WHERE p.productName LIKE '%Titanic%'
ORDER BY c.customerName ;

#nomor 2
SELECT 
c.customerName,p.productName,o.status,o.shippedDate
FROM customers AS c
JOIN orders AS o
ON c.customerNumber = o.customerNumber
JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
JOIN products AS p
ON od.productCode = p.productCode
WHERE p.productName LIKE '%Ferrari%' AND 
o.status ='Shipped' AND 
(o.shippedDate BETWEEN '2003-10-01'AND '2004-10-01')
ORDER BY o.shippedDate desc;

# nomor 3
SELECT s.firstName AS supervisior, k.firstName AS karyawan
FROM employees s
JOIN employees k ON s.employeeNumber = k.reportsTo
WHERE s.firstName = 'Gerard'
ORDER BY karyawan ; 

#nomor 4a
SELECT c.customerName,py.paymentDate, e.firstName AS employeeName,py.amount
FROM customers AS c
JOIN payments AS py
ON c.customerNumber = py.customerNumber
JOIN employees AS e
ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE py.paymentDate LIKE '%-11-%';

#nomor4b
SELECT c.customerName,py.paymentDate, e.firstName AS employeeName,py.amount
FROM customers AS c
JOIN payments AS py
ON c.customerNumber = py.customerNumber
JOIN employees AS e
ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE py.paymentDate LIKE '%-11-%'
ORDER BY py.amount DESC LIMIT 1 ;

#nomor 4c
SELECT c.customerName ,p.productName
FROM customers AS c
JOIN orders AS o
USING (customerNumber)
JOIN orderdetails AS od
USING (orderNumber)
JOIN products AS p
ON od.productCode = p.productCode
WHERE c.customerName = 'Corporate Gift Ideas Co.'


#liveCoding 
SELECT 
o.orderNumber,c.customerNumber,o.orderDate
FROM customers AS c
JOIN orders AS o
USING (customerNumber)
WHERE (o.orderDate BETWEEN '2003-01-01'AND '2003-06-30');

