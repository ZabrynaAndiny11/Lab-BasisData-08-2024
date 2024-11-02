-- no 1
SELECT productCode, productName, buyPrice
FROM products
WHERE buyPrice > (SELECT AVG(buyPrice) 
    					FROM products);

-- no 2
SELECT o.orderNumber, o.orderDate
FROM orders o
WHERE customerNumber IN (
    SELECT customerNumber
    FROM customers c
    WHERE c.salesRepEmployeeNumber IN (
        SELECT e.employeeNumber
        FROM employees e
        JOIN offices o ON e.officeCode = o.officeCode
        WHERE o.city = 'Tokyo'
    )
);

-- no 3
SELECT 
    c.customerName,
    o.orderNumber,
    o.shippedDate,
    o.requiredDate,
    (SELECT GROUP_CONCAT(p.productName SEPARATOR ', ') 
     FROM orderdetails od 
     JOIN products p ON od.productCode = p.productCode 
     WHERE od.orderNumber = o.orderNumber
    ) AS products,
    (SELECT SUM(od.quantityOrdered)
     FROM orderdetails od
     WHERE od.orderNumber = o.orderNumber
    ) AS total_quantity_ordered,
    CONCAT(e.firstName, ' ', e.lastName) AS employeeName 
FROM 
    orders o
JOIN 
    customers c ON o.customerNumber = c.customerNumber
JOIN 
    employees e ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE 
    o.shippedDate > o.requiredDate;
    
-- no 3 dri kak diny   
SELECT c.customerName, 
		 o.orderNumber,
		 o.shippedDate, 
		 o.requiredDate, 
		 GROUP_CONCAT(p.productName SEPARATOR ', ') products, 
		 SUM(od.quantityOrdered) total_quantity_ordered, 
		 CONCAT(e.firstName, " ", e.lastName) employeeName
FROM employees e
JOIN customers c
ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN orders o
USING(customerNumber)
JOIN orderdetails od
USING(orderNumber)
JOIN products p
USING(productCode)
WHERE o.orderNumber IN (
	SELECT orderNumber FROM orders o2
	WHERE o2.shippedDate > o2.requiredDate
)
GROUP BY c.customerNumber, o.orderNumber;

    

-- no 4
SELECT p.productName, p.productLine, SUM(od.quantityOrdered) AS total_quantity_ordered
FROM products p
JOIN orderdetails od USING(productCode)
WHERE p.productLine IN (
	SELECT p2.productLine 
	FROM products p2
	WHERE p2.productLine IN ('Classic Cars', 'Motorcycles', 'Vintage Cars'))
GROUP BY p.productName, p.productLine
ORDER BY p.productLine, total_quantity_ordered DESC;

SELECT productLine, COUNT(*) AS jumlah FROM products
GROUP BY productLine
ORDER BY jumlah DESC;