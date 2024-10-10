USE classicmodels;

#NO 1
SELECT DISTINCT c.customerName AS namaKustomer,
                p.productName AS namaProduk,
                pl.textDescription
FROM customers AS c
JOIN orders AS o USING (customerNumber) 
JOIN orderdetails AS od USING (orderNumber) 
JOIN products AS p USING  (productCode)
JOIN productlines AS pl USING (productLine)
WHERE p.productName LIKE '%Titanic%'
ORDER BY c.customerName ASC;

#NO2
SELECT c.customerName,
       p.productName,
       o.status AS orderStatus,
       o.shippedDate
FROM customers AS c
JOIN orders AS o USING (customerNumber)
JOIN orderdetails AS od USING (orderNumber)
JOIN products AS p USING (productCode)
WHERE p.productName LIKE '%Ferrari%'
  AND o.status = 'Shipped'
  AND o.shippedDate BETWEEN '2003-10-01' AND '2004-09-30'
ORDER BY o.shippedDate DESC;

#NO3
SELECT 
    supervisor.lastName AS Supervisor, 
    employee.lastName AS Karyawan
FROM  employees AS employee
JOIN employees AS supervisor ON employee.reportsTo = supervisor.employeeNumber
WHERE supervisor.firstName = 'Gerard'
ORDER BY employee.lastName ASC;



#NO4

# a.
SELECT c.customerName,
		p.paymentDate,
		c.contactFirstName AS employeeName,
		p.amount
FROM customers AS c
JOIN payments AS p USING (customerNumber)
WHERE p.paymentDate LIKE "_____11%"

# b. 

ORDER BY p.amount DESC LIMIT 1

# c. 

SELECT c.customerName,
		pr.productName
FROM customers AS c
JOIN orders AS o USING (customerNumber)
JOIN orderdetails AS odt USING (orderNumber)
JOIN products AS pr USING  (productCode)
WHERE c.customerName = 'Corporate Gift Ideas Co.'

#Live Coding

SELECT e.firstName,
		e.lastName,
		o.orderNumber,
		c.customerName
FROM employees AS e
JOIN offices AS s USING (officeCode)
JOIN customers AS c ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN orders AS o USING (customerNumber)
WHERE s.city = 'tokyo' 
 


