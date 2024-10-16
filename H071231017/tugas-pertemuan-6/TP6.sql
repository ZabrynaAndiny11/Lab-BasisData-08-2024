USE classicmodels;

-- nomor 1
SELECT c.customerName, 
		 CONCAT(e.firstName, ' ', e.lastName) AS salesRep, 
		 (c.creditLimit - SUM(p.amount)) AS remainingCredit
FROM customers c
JOIN employees e 
ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN payments p 
USING (customerNumber) 
GROUP BY c.customerName
HAVING remainingCredit > 0;

-- nomor 2
SELECT p.productName AS 'Nama Produk', 
		 GROUP_CONCAT(DISTINCT c.customerName SEPARATOR ', ') AS 'Nama Customer', 
		 COUNT(DISTINCT c.customerNumber) AS 'Jumlah Customer', 
		 SUM(od.quantityOrdered) AS 'Total Quantitas'
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
JOIN orders o ON od.orderNumber = o.orderNumber
JOIN customers c ON o.customerNumber = c.customerNumber
GROUP BY p.productName;

-- nomor 3
SELECT CONCAT(e.firstName, ' ', e.lastName) AS employeeName, 
       COUNT(c.customerNumber) AS totalCustomers
FROM employees e
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
GROUP BY e.employeeNumber
ORDER BY totalCustomers DESC;

-- nomor 4
SELECT CONCAT(e.firstName, ' ', e.lastName) AS NamaKaryawan, 
       p.productName AS NamaProduk, 
       SUM(od.quantityOrdered) AS JumlahPesanan
FROM offices o
JOIN employees e ON e.officeCode = o.officeCode
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN orders os ON c.customerNumber = os.customerNumber	
JOIN orderdetails od ON os.orderNumber = od.orderNumber
JOIN products p ON od.productCode = p.productCode
WHERE o.country = 'Australia'
GROUP BY e.employeeNumber, p.productName
ORDER BY JumlahPesanan DESC;

-- nomor 5
SELECT c.customerName AS 'Nama Pelanggan', 
		 p.productName AS 'Nama Produk',
		 COUNT(p.productLine) AS 'Banyak Jenis Produk'
FROM customers  c
JOIN orders o
ON c.customerNumber = o. customerNumber
JOIN orderdetails od
ON o.orderNumber = od .orderNumber
JOIN products p
ON od. productCode = p.productCode
WHERE o.shippedDate IS NULL
GROUP BY c.customerName;

