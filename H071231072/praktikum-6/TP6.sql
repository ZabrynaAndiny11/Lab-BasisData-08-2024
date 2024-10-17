-- nama : ahmad rafly 
-- NIM : H071231072

-- nomor 1
SELECT c.customerName,
CONCAT(e.firstname, " ", e.lastname) AS SalesRep,
c.creditlimit - SUM(p.amount) AS remainingCredit
FROM customers c
JOIN employees e
ON e.employeenumber = c.salesRepEmployeeNumber
JOIN payments p
USING(customernumber)
GROUP BY customerName
HAVING remainingCredit > 0
ORDER BY customerName;

-- nomor 2
SELECT p.productName AS 'Nama Produk',
GROUP_CONCAT(DISTINCT c.customername ORDER BY c.customername SEPARATOR ', ') AS 'Nama Customer',
COUNT(DISTINCT c.customerNumber) AS 'Jumlah Customer', 
SUM(od.quantityOrdered) AS 'Total Quantitas'
FROM orderdetails od
JOIN orders o 
USING(orderNumber)
JOIN customers c 
USING(customerNumber)
JOIN products p 
USING(productCode)
GROUP BY p.productName
ORDER BY p.productName, c.customerName;

-- nomor 3
SELECT CONCAT(e.firstName, " ", e.lastName) AS employeeName,
COUNT(DISTINCT c.customerName) totalCustomers
FROM employees e
JOIN customers c
ON e.employeeNumber = c.salesRepEmployeeNumber
GROUP BY employeeName
ORDER BY totalCustomers DESC;

-- nomor 4
SELECT CONCAT(e.firstName, " ", e.lastName) AS 'Nama Karyawan',
p.productName AS 'Nama Produk',
SUM(od.quantityordered) AS 'Jumlah Pesanan'
FROM employees e
JOIN offices ofs
USING(officecode)
LEFT JOIN customers c
ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN orders o
USING(customerNumber)
LEFT JOIN orderdetails od
USING(orderNumber)
LEFT JOIN products p
USING(productCode)
WHERE ofs.country = 'Australia'
GROUP BY e.employeeNumber, p.productName
ORDER BY `Jumlah Pesanan` DESC;

#5
SELECT c.customerName AS 'Nama Pelanggan', GROUP_CONCAT(DISTINCT p.productName) AS 'Nama Produk', 
COUNT(o.status)  AS 'Banyak Jenis Produk'
FROM customers AS c
JOIN orders AS o
USING (customerNumber)
JOIN orderdetails AS od
USING (orderNumber)
JOIN products AS p
USING (productCode)
WHERE o.shippedDate IS NULL
GROUP BY customerName;


#live coding
SELECT ofc.city AS 'kota',
coalesce(ofc.addressLine2,ofc.country) AS 'Alamat Sekunder',
CONCAT(e.firstName, " ", e.lastName) AS 'Nama pegawai',
ofc.postalCode AS 'Kode Pos'
FROM offices AS ofc
JOIN employees AS e
USING(officeCode)
GROUP BY ofc.addressLine1
having ofc.addressLine1 LIKE '%11%';




