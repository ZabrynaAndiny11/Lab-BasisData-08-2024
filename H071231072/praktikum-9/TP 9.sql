CREATE DATABASE sepakbola;
USE lab 

CREATE TABLE klub (
	id INT AUTO_INCREMENT PRIMARY KEY,
	nama_klub VARCHAR(50) NOT NULL,
	kota_asal VARCHAR(20) NOT null
);

CREATE TABLE pemain (
	id INT AUTO_INCREMENT PRIMARY KEY,
	nama_pemain VARCHAR(50) NOT NULL,
	posisi VARCHAR(20) NOT NULL,
	id_klub INT,
	FOREIGN KEY(id_klub) references klub(id) 
);

CREATE TABLE pertandingan (
	id INT AUTO_INCREMENT PRIMARY KEY,
	id_klub_tuan_rumah INT,
	FOREIGN KEY(id_klub_tuan_rumah) REFERENCES klub(id),
	id_klub_tamu INT,
	FOREIGN KEY(id_klub_tamu) REFERENCES klub(id),
	tanggal_pertandingan DATE NOT NULL,
	skor_tuan_rumah INT DEFAULT 0,
	skor_tamu INT DEFAULT 0
);

CREATE INDEX id_posisi ON pemain(posisi);
CREATE INDEX id_kota_asal ON klub(kota_asal);


#nomor 2
SELECT*FROM payments;
SELECT*FROM customers;

use classicmodels;

SELECT customerName,country,ROUND(SUM(p.amount), 2) as TotalPayment,
COUNT(o.orderNumber) as orderCount,
    MAX(p.paymentDate) as LastPaymentDate,
    CASE
        WHEN SUM(p.amount) > 100000 THEN 'VIP'
        WHEN SUM(p.amount) BETWEEN 5000 AND 100000 THEN 'Loyal'
        WHEN SUM(p.amount) < 5000 OR SUM(p.amount) IS NULL THEN 'New'
    END as Status
FROM 
    customers c
LEFT JOIN payments p
USING(customerNumber)
LEFT JOIN orders o
USING(customerNumber)
GROUP BY c.customerName,c.country
ORDER BY c.customerName;



   
SELECT 
c.customerNumber,
c.customerName,
SUM(od.quantityOrdered) AS total_quantity,
CASE 
WHEN SUM(od.quantityOrdered) > (
SELECT AVG(total_quantity)
FROM (
SELECT SUM(quantityOrdered) as total_quantity
FROM orderdetails od2
JOIN orders o2 
USING(orderNumber)
GROUP BY o2.customerNumber) total_quantity
        )
THEN 'di atas rata-rata'
ELSE 'di bawah rata-rata'
END AS kategori_pembelian
FROM customers c
JOIN orders 
USING(customerNumber)
JOIN orderdetails od 
USING(orderNumber)
GROUP BY c.customerNumber, c.customerName
ORDER BY total_quantity DESC;



#live coding
USE lab;
START TRANSACTION;

INSERT INTO  klub(nama_klub,kota_asal)
VALUES("Persija","jakarta"),
("Arema FC","Malang"),
("persebaya","surabaya"),
("PSM Makassar","Makassar"),
("bali unitied","bali");

SELECT * FROM pemain;
INSERT INTO pemain(nama_pemain, posisi, id_klub) 
VALUES 
    ('Evan Dimas', 'Midfielder', 1),
    ('Riko Simanjuntak', 'Forward', 1),
    ('Hanif Sjahbandi', 'Defender', 2),
    ('Makan Konate', 'Midfielder', 2),
    ('David da Silva', 'Forward', 3),
    ('Irfan Jaya', 'Forward', 4),
    ('Rizky Pellu', 'Midfielder', 4),
    ('Ilija Spasojevic', 'Forward', 5),
    ('Andhika Wijaya', 'Defender', 5);

INSERT INTO pertandingan (id_klub_tuan_rumah, id_klub_tamu, tanggal_pertandingan, skor_tuan_rumah, skor_tamu) VALUES 
    (1, 2, '2024-09-10', 2, 1),
    (3, 4, '2024-09-12', 1, 1),
    (5, 3, '2024-09-15', 0, 3),
    (2, 5, '2024-09-20', 1, 2),
    (4, 3, '2024-09-25', 2, 0);

ROLLBACK;
COMMIT;


