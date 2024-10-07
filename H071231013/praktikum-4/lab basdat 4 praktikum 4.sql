# nomor 1
USE classicmodels;

-- Memilih data dari tabel customers terkait customerNumber, customerName, country, dan creditLimit.
-- Menggunakan CASE untuk memfilter data sesuai dengan kondisi:
-- Jika pelanggan berasal dari USA, hanya menampilkan creditLimit di antara 50.000 hingga 100.000.
-- Jika pelanggan dari luar USA, hanya menampilkan creditLimit di antara 100.000 hingga 200.000.
-- Data disusun berdasarkan filteredCreditLimit secara menurun.

SELECT customerNumber, customerName, country,
       CASE 
         WHEN country = 'USA' THEN 
           CASE 
             WHEN creditLimit > 50000 AND creditLimit < 100000 THEN creditLimit
             ELSE NULL
           END
         ELSE 
           CASE 
             WHEN creditLimit BETWEEN 100000 AND 200000 THEN creditLimit
             ELSE NULL
           END
       END AS filteredCreditLimit
FROM customers
WHERE (country = 'USA' AND creditLimit > 50000 AND creditLimit < 100000)
   OR (country != 'USA' AND creditLimit BETWEEN 100000 AND 200000)
ORDER BY filteredCreditLimit DESC;

# nomor 2

-- Memilih produk dengan productCode, productName, quantityInStock, dan buyPrice dari tabel products.
-- Produk dipilih berdasarkan kriteria:
-- quantityInStock antara 1000 hingga 2000.
-- buyPrice kurang dari 50.
-- productLine tidak mengandung kata "Vintage".
-- Data diurutkan berdasarkan buyPrice secara menurun.

SELECT productCode, productName, quantityInStock, buyPrice
FROM products
WHERE quantityInStock BETWEEN 1000 AND 2000
  AND buyPrice < 50
  AND productLine NOT LIKE '%Vintage%'
ORDER BY buyPrice DESC;

# nomor 3

-- Memilih productCode, productName, dan MSRP dari tabel products.
-- Produk yang dipilih adalah yang productLine mengandung kata "Classic" dan buyPrice lebih dari 50.
-- Data diurutkan berdasarkan MSRP secara menurun.

SELECT productCode, productName, MSRP
FROM products
WHERE productLine LIKE '%Classic%'
  AND buyPrice > 50
ORDER BY MSRP DESC;

# nomor 4

-- Memilih data orderNumber, orderDate, status, dan customerNumber dari tabel orders.
-- Mengambil order yang orderNumber-nya lebih dari 10250, tidak berstatus "Shipped" atau "Cancelled", dan terjadi antara tahun 2004-2005.
-- Data diurutkan berdasarkan orderNumber.

SELECT orderNumber, orderDate, status, customerNumber
FROM orders
WHERE orderNumber > 10250
  AND status NOT IN ('Shipped', 'Cancelled')
  AND YEAR(orderDate) BETWEEN 2004 AND 2005
ORDER BY orderNumber;

# nomor 5

-- Memilih data orderNumber, orderLineNumber, productCode, quantityOrdered, dan priceEach dari tabel orderdetails.
-- Menghitung total harga setelah diskon 5% untuk produk dengan quantityOrdered lebih dari 50 dan priceEach lebih dari 100, serta productCode tidak diawali dengan "S18".
-- Hasilnya diurutkan berdasarkan total harga diskon (discountedTotalPrice) secara menurun.

SELECT 
    od.orderNumber,
    od.orderLineNumber,
    od.productCode,
    od.quantityOrdered,
    od.priceEach,
    ROUND(od.quantityOrdered * od.priceEach * 0.95, 2) AS discountedTotalPrice
FROM 
    orderdetails od
WHERE 
    od.quantityOrdered > 50
    AND od.priceEach > 100
    AND od.productCode NOT LIKE 'S18%'
ORDER BY 
    discountedTotalPrice DESC;