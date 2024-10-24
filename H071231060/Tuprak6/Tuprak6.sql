USE classicmodels;


#Nomor 1
SELECT customerName, CONCAT(e.firstName, " ", e.lastName) AS salesRep, 
creditLimit - SUM(amount) AS remainingCredit
FROM customers AS c
JOIN payments AS p
USING (customerNumber)
JOIN employees AS e
ON e.employeeNumber = c.salesRepEmployeeNumber
GROUP BY customerName
HAVING remainingCredit > 0;

#Nomor 2
SELECT productName AS 'Nama Produk', customerName AS 'Nama Customer', 
COUNT(DISTINCT customerNumber) AS 'Jumlah Customer', SUM(quantityOrdered) AS 'Total Quantitas'
FROM orderdetails AS od
JOIN orders AS o
USING (orderNumber)
JOIN customers AS c
USING (customerNumber)
JOIN products AS p
USING (productCode)
GROUP BY p.productName;

#Nomor 3
SELECT CONCAT(e.firstName, " ", e.lastName) AS employeeName, 
COUNT(customerNumber) AS totalCustomers
FROM employees AS e
JOIN customers AS c
ON e.employeeNumber = c.salesRepEmployeeNumber
GROUP BY employeeName
ORDER BY totalCustomers DESC;

#Nomor 4
SELECT CONCAT(e.firstName, " ", e.lastName) AS 'Nama Karyawan', 
p.productName AS 'Nama Produk', 
SUM(od.quantityOrdered) AS 'jumlah pesanan'
FROM employees AS e
LEFT JOIN customers AS c
ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN orders AS o 
USING (customerNumber)
LEFT JOIN orderdetails AS od 
USING (orderNumber)
LEFT JOIN products AS p 
USING (productCode)
JOIN offices AS fc 
ON fc.officeCode = e.officeCode
WHERE fc.country = 'Australia'
GROUP BY e.employeeNumber, p.productName
ORDER BY `jumlah pesanan` DESC;

#Nomor 5
SELECT c.customerName AS 'Nama Pelanggan', 
GROUP_CONCAT(DISTINCT p.productName ORDER BY p.productName) AS 'Nama Produk', 
COUNT(DISTINCT p.productName) AS 'Banyak Jenis Produk'
FROM customers AS c
JOIN orders AS o 
USING (customerNumber)
JOIN orderdetails AS od 
USING (orderNumber)
JOIN products AS p 
USING (productCode)
WHERE o.shippedDate IS NULL
GROUP BY c.customerName;

