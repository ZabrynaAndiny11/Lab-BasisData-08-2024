USE classicmodels;

-- Nomor 1

SELECT productCode, productName, buyPrice
FROM products
WHERE buyPrice > (
    SELECT AVG(buyPrice)
    FROM products
)
ORDER BY productCode;

-- nomor 2

SELECT o.orderNumber, o.orderDate
FROM orders o
JOIN customers c ON o.customerNumber = c.customerNumber
WHERE c.salesRepEmployeeNumber IN (
    SELECT e.employeeNumber
    FROM employees e
    WHERE e.officeCode = (
        SELECT officeCode
        FROM offices
        WHERE city = 'Tokyo'
    )
);


# nomor 3

SELECT 
    c.customerName,
    o.orderNumber,
    o.shippedDate,
    o.requiredDate,
    (
        SELECT GROUP_CONCAT(p.productName SEPARATOR ', ')
        FROM orderdetails od
        JOIN products p ON od.productCode = p.productCode
        WHERE od.orderNumber = o.orderNumber
    ) AS products,
    (
        SELECT SUM(od.quantityOrdered)
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
    o.shippedDate > o.requiredDate  -- Pesanan terlambat
ORDER BY 
    o.orderNumber;

    
# nomor 4

SELECT 
    productName,
    productLine,
    total_quantity_ordered
FROM (
    SELECT 
        p.productName,
        p.productLine,
        SUM(od.quantityOrdered) AS total_quantity_ordered,
        ROW_NUMBER() OVER (ORDER BY SUM(od.quantityOrdered) DESC) AS row_num -- memberikan nomor urut pada hasil query berdasarkan urutan tertentu
    FROM 
        products p
    JOIN 
        orderdetails od ON p.productCode = od.productCode
    WHERE 
        p.productLine = 'Classic Cars'
    GROUP BY 
        p.productName, p.productLine
) AS subquery
WHERE 
    row_num <= 8 -- membatasi hasil query untuk menampilkan 8 baris pertama berdasarkan nomor urut.
ORDER BY 
    total_quantity_ordered DESC;