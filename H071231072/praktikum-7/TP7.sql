SELECT productCode,productName,buyPrice
FROM products
WHERE buyPrice > (SELECT AVG(buyPrice)FROM products 
ORDER BY productCode DESC);

SELECT o.orderNumber, o.orderDate
FROM orders AS o
WHERE o.customerNumber IN (
    SELECT c.customerNumber
    FROM customers AS c
    WHERE c.salesRepEmployeeNumber IN (
        SELECT e.employeeNumber
        FROM employees AS e
        JOIN offices AS ofc USING(officeCode)
        WHERE ofc.city = 'Tokyo'));
        
# 3
SELECT 
    c.customerName,
    o.orderNumber,
    o.shippedDate,
    o.requiredDate,
    GROUP_CONCAT(p.productName ORDER BY p.productName SEPARATOR ', ') AS products,
    SUM(od.quantityOrdered) AS total_quantity_ordered,
    CONCAT(e.firstName, ' ', e.lastName) AS employeeName
FROM customers c
JOIN orders o
USING(customerNumber)
JOIN orderdetails od
USING(orderNumber)
JOIN products p
USING(productCode)
JOIN employees e
ON e.employeeNumber = c.salesRepEmployeeNumber
WHERE o.orderNumber IN 
(
    SELECT orderNumber
    FROM orders
    WHERE requiredDate < shippedDate
)
GROUP BY c.customerName, o.orderNumber, o.shippedDate, o.requiredDate, employeeName
ORDER BY o.orderNumber;


#no 4

SELECT p.productName, p.productLine, SUM(od.quantityOrdered) AS total_quantity_ordered
FROM products AS p
JOIN orderdetails AS od 
USING(productCode)
WHERE p.productLine IN (
    SELECT top.productLine
    FROM (SELECT p2.productLine FROM products AS p2 JOIN orderdetails AS od2
    USING (productCode) GROUP BY p2.productLine ORDER BY SUM(od2.quantityOrdered)
    DESC LIMIT 3) AS top
)
GROUP BY p.productName, p.productLine
ORDER BY p.productLine, total_quantity_ordered DESC;


SELECT p.productName, 
       p.productLine, 
       SUM(od.quantityOrdered) AS total_quantity_ordered
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
WHERE p.productLine IN (
    SELECT top_product_lines.productLine
    FROM (
        SELECT p.productLine
        FROM products p
        JOIN orderdetails od ON p.productCode = od.productCode
        GROUP BY p.productLine
        ORDER BY SUM(od.quantityOrdered) DESC
        LIMIT 3
    ) AS top_product_lines
)
GROUP BY p.productName, p.productLine
ORDER BY p.productLine, total_quantity_ordered DESC;



 products AS p2
    JOIN orderdetails AS od2
    USING(productCode)
    GROUP BY p2.productLine
    ORDER BY SUM(od2.quantityOrdered) DESC