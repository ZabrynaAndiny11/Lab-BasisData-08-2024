USE classicmodels;

-- no1
SELECT c.customerName, CONCAT(e.firstName, ' ', e.lastName) salesRep, (c.creditLimit - SUM(p.amount)) remainingCredit FROM customers c
JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN payments p USING (customerNumber)
GROUP BY c.customerName
HAVING remainingCredit > 0 ;

-- no2
SELECT DISTINCT p.productName 'Nama Produk', GROUP_CONCAT(c.customerName ORDER BY c.customerName SEPARATOR ', ') 'Nama Customer', COUNT(c.customerNumber) 'Jumlah Customer', SUM(od.quantityOrdered) 'Total Quantitas' FROM products p
JOIN orderdetails od USING (productCode)
JOIN orders o USING (orderNumber)
JOIN customers c USING (customerNumber) 
GROUP BY p.productName ;

-- no 3
SELECT CONCAT(e.firstName, ' ', e.lastName) employeeName, COUNT(c.customerNumber) totalCustomers FROM employees e 
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber 
GROUP BY e.employeeNumber
ORDER BY totalCustomers DESC;

-- no 4
SELECT CONCAT(e.firstName, ' ', e.lastName) NamaKaryawan, p.productName NamaProduk, SUM(od.quantityOrdered) JumlahPesanan FROM employees e 
JOIN offices o USING (officeCode)
LEFT JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN orders os USING (customerNumber)
LEFT JOIN orderdetails od USING (orderNumber)
LEFT JOIN products p USING (productCode)
WHERE o.country = 'Australia' GROUP BY e.employeeNumber, p.productName
ORDER BY JumlahPesanan DESC;

-- NOMOR 5
SELECT c.customerName 'Nama Pelanggan', p.productName 'Nama Produk', COUNT(p.productLine) 'Banyak Jenis Produk' FROM customers c
JOIN orders o USING (customerNumber)
JOIN orderdetails od USING (orderNumber)
JOIN products p USING (productCode)
WHERE o.shippedDate IS NULL GROUP BY c.customerName;