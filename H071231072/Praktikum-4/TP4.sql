SELECT * FROM customers ;

SELECT customerNumber,
customerName,
country
FROM customers
WHERE (country = 'USA' AND creditlimit BETWEEN 50000 AND  100000) 
OR (country != 'USA' AND creditlimit BETWEEN 100000 AND 200000)
ORDER BY creditlimit DESC;


SELECT * FROM products ;

SELECT productCode,
productName,
quantityInStock,
buyPrice
FROM products
WHERE (quantityInStock BETWEEN 1000 AND 200)
AND (buyPrice < 50 OR buyPrice > 150)
AND productLine NOT LIKE 'Vintage%';


  
