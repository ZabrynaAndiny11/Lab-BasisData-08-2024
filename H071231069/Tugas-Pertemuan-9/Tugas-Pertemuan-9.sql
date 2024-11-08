#NO 1
CREATE DATABASE SepakBola;
USE SepakBola;

CREATE TABLE klub (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nama_klub VARCHAR (50) NOT NULL,
	kota_asal VARCHAR (20) NOT NULL)

CREATE TABLE pemain (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nama_pemain VARCHAR (50) NOT NULL,
	posisi VARCHAR (20) NOT NULL,
	id_klub INT,
	FOREIGN KEY (id_klub) REFERENCES klub(id))

CREATE TABLE pertandingan (
	id INT PRIMARY KEY AUTO_INCREMENT,
	id_klub_tuan_rumah INT,
	id_klub_tamu INT,
	FOREIGN KEY (id_klub_tuan_rumah) REFERENCES pemain (id_klub),
	FOREIGN KEY (id_klub_tamu) REFERENCES pemain (id_klub),
	tanggal_pertandingan DATE NOT NULL,
	skor_tuan_rumah INT DEFAULT 0,
	skor_tamu INT DEFAULT 0);

ALTER TABLE pemain 
ADD INDEX index_posisi(posisi);

ALTER TABLE klub
ADD INDEX index_kota(kota_asal);

DESCRIBE pemain 

#NO 2
SELECT 
	c.customerName,
	c.country,
	ROUND(SUM(p.amount),2) AS TotalPayment,
	COUNT(o.orderNumber) AS orderCount,
	MAX(p.paymentDate) AS LastPaymentDate,
case 
	when SUM(amount) > 100000 then 'VIP'
	when SUM(amount) BETWEEN 5000 AND 10000 then 'Loyal'
	when SUM(amount) < 5000 then 'New'
END AS 'Status'
FROM customers AS c
LEFT JOIN payments AS p ON c.customerNumber = p.customerNumber
LEFT JOIN orders AS o ON c.customerNumber = o.customerNumber
GROUP BY c.customerName


#NO3
SELECT 
	c.customerNumber,
	c.customerName,
	SUM(od.quantityOrdered) AS 'total_quantity',
	case 
	when SUM(od.quantityOrdered) > ( 
		SELECT AVG(total)
		FROM (
			SELECT SUM(quantityOrdered) AS total
			FROM orderdetails
			JOIN orders
			USING(orderNumber)
			GROUP BY customerNumber
		) AS totalquantity) then 'di atas rata-rata'
	ELSE 'di bawah rata-rata'
	END AS 'kategori_pembelian'
FROM customers c
JOIN orders o
USING(customerNumber)
JOIN orderdetails od
USING(orderNumber)
GROUP BY c.customerNumber
ORDER BY total_quantity DESC

#Live Coding

START TRANSACTION;

INSERT INTO klub(nama_klub,kota_asal)
VALUES ('Persija','Jakarta'),
       ('Arema Fc','Malang'),
       ('Persebaya','Surabaya'),
       ('PSM Makassar','Makassar'),
       ('Bali United','Bali');
       
SELECT * FROM klub;
       
INSERT INTO pemain (nama_pemain, posisi, id_klub)
VALUES ('Evan Dimas', 'Midfielder', 6),
			('Riko Simanjuntak', 'Forward', 6),
			('Hanif Sjahbandi', 'Defender', 7),
			('Makan Konate', 'Midfielder', 7),
			('David da Silva', 'Forward', 8),
			('Irfan Jaya', 'Forward', 9),
			('Rizky Pellu', 'Midfielder', 9),
			('Ilija Spsojevic', 'Forward', 10),
			('Andhika Wijaya', 'Defender', 10);
			
SELECT * FROM pemain;

INSERT INTO pertandingan(tanggal_pertandingan, id_klub_tuan_rumah, skor_tuan_rumah, skor_tamu, id_klub_tamu)
VALUES ('2024-09-10', 6, 2, 1, 8),
		 ('2024-09-12', 8, 1, 1, 9), 
		 ('2024-09-15', 10, 0, 3, 6),
		 ('2024-09-20', 7, 1, 2, 10),
		 ('2024-09-25', 9, 2, 0, 8);
		 
SELECT * FROM pertandingan;

ROLLBACK;