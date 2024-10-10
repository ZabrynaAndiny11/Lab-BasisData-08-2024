USE classicmodels;
#1
SELECT DISTINCT c.customername AS 'namaKustomer', p.productname AS 'namaProduk', pl.textdescription FROM customers AS c
JOIN orders USING (customerNumber)
JOIN orderdetails USING (orderNumber)
JOIN products AS p USING (productCode)
JOIN productlines AS pl USING (productLine)
WHERE p.productName LIKE '%Titanic%'
ORDER BY c.customerName;

#2
SELECT c.customername, p.productname, o.`status`, o.shippeddate FROM customers AS c
JOIN orders AS o USING (customerNumber)
JOIN orderdetails USING (orderNumber)
JOIN products AS p USING (productCode)
WHERE p.productName LIKE '%Ferrari%' 
AND o.`status` = 'Shipped' 
AND o.shippedDate BETWEEN '2003-10-01' AND '2004-10-01'
ORDER BY o.shippedDate DESC;

#3
SELECT * FROM employees
WHERE firstname = 'Gerard';

SELECT 'Gerard' AS Supervisor, firstname AS 'Karyawan' FROM employees
WHERE reportsTo = 1102
ORDER BY firstName ASC;

SELECT s.firstname AS supervisor, k.firstname AS karyawan FROM employees s
JOIN employees k ON k.reportsto = s.employeeNumber
WHERE s.firstname = 'Gerard';


#4
-- a
SELECT customername, p.paymentdate, e.firstname AS employeeName, p.amount FROM payments AS p
JOIN customers USING (customerNumber)
JOIN employees AS e ON salesRepEmployeeNumber = e.employeeNumber
WHERE p.paymentDate LIKE '_____11%';

-- b
SELECT customername, p.paymentdate, e.firstname AS employeeName, p.amount FROM payments AS p
JOIN customers USING (customerNumber)
JOIN employees AS e ON salesRepEmployeeNumber = e.employeeNumber
WHERE p.paymentDate LIKE '_____11%'
ORDER BY p.amount DESC 
LIMIT 1;

-- c
SELECT c.customername, productname FROM customers AS c
JOIN orders USING (customerNumber)
JOIN orderdetails USING (orderNumber)
JOIN products USING (productCode)
JOIN payments USING (customerNumber)
WHERE c.customerName = 'Corporate Gift Ideas Co.'
AND paymentDate LIKE '_____11%';


##live coding
SELECT customerName, orderNumber, STATUS FROM customers c
JOIN orders o USING (customerNumber)
WHERE STATUS = 'shipped';