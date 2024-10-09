USE classicmodels;

-- nomor 1
SELECT DISTINCT c.customerName "namaKustomer", p.productName "namaProduk", p.productDescription "textDescription" FROM customers c
JOIN orders o USING (customerNumber) 
JOIN orderdetails od USING (orderNumber)
JOIN products p ON p.productCode = od.productCode
WHERE p.productName = 'The Titanic'
ORDER BY c.customerName;

-- nomor 2
SELECT c.customerName, pr.productName, o.`status`, o.shippedDate FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN products pr ON od.productCode = pr.productCode
WHERE pr.productName LIKE '%Ferrari%' AND o.`status` = 'Shipped'
AND o.shippedDate BETWEEN '2003-10-01' AND '2004-09-30'
ORDER BY o.shippedDate DESC;

-- nomor 3
SELECT * FROM employees
WHERE firstname = 'Gerard';

SELECT s.firstName supervisor, k.firstName karyawan FROM employees k
JOIN employees s ON k.reportsTo = s.employeeNumber
WHERE s.firstName = 'Gerard'
ORDER BY k.firstName;

-- nomor 4
-- a
SELECT c.customername, p.paymentdate, e.firstname employeeName, p.amount FROM payments p
JOIN customers c ON p.customerNumber = c.customerNumber
JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE p.paymentDate LIKE '_____11%';

-- b
SELECT c.customername, p.paymentdate, e.firstname employeeName, p.amount FROM payments p
JOIN customers c ON p.customerNumber = c.customerNumber
JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE p.paymentDate LIKE '_____11%'
ORDER BY p.amount DESC 
LIMIT 1;

-- c
SELECT c.customername, p.productname FROM customers c
JOIN orders ON c.customerNumber = orders.customerNumber
JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber
JOIN products p ON orderdetails.productCode = p.productCode
JOIN payments pay ON c.customerNumber = pay.customerNumber
WHERE c.customerName = 'Corporate Gift Ideas Co.' AND pay.paymentDate LIKE '_____11%';





-- soal tambahan
SELECT c.customerName, o.orderNumber, o.`status` FROM customers c
JOIN orders o USING (customerNumber)
WHERE o.`status` = 'Shipped';
