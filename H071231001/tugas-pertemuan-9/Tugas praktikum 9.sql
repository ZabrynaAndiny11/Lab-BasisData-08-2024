-- no 1
CREATE DATABASE sepakbola;
USE sepakbola;

CREATE TABLE klub (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nama_klub VARCHAR(50) NOT NULL,
	kota_asal VARCHAR(20) NOT NULL
);

CREATE TABLE pemain (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nama_pemain VARCHAR(50) NOT NULL,
	posisi VARCHAR(20) NOT NULL,
	id_klub INT,
	FOREIGN KEY (id_klub) REFERENCES klub(id)
);

CREATE TABLE pertandingan (
	id INT PRIMARY KEY AUTO_INCREMENT,
	id_klub_tuan_rumah INT,
	id_klub_tamu INT,
	tanggal_pertandingan DATE NOT NULL,
	skor_tuan_rumah INT DEFAULT 0,
	skor_tamu INT DEFAULT 0,
	FOREIGN KEY (id_klub_tuan_rumah) REFERENCES klub(id),
	FOREIGN KEY (id_klub_tamu) REFERENCES klub(id)
);
	
CREATE INDEX idx_posisi ON pemain(posisi);
DESCRIBE pemain;

CREATE INDEX idx_kota_asal ON klub(kota_asal);
DESCRIBE klub;	
		
-- no 2
SELECT 
    c.customerName,
    c.country,
    FORMAT(SUM(p.amount), 2) AS TotalPayment,
    COUNT(o.orderNumber) AS orderCount,
    MAX(p.paymentDate) AS LastPaymentDate,
    CASE 
        WHEN SUM(p.amount) > 100000 THEN 'VIP'
        WHEN SUM(p.amount) BETWEEN 5000 AND 10000 THEN 'Loyal'
        ELSE 'New'
    END AS `Status`
FROM customers c
LEFT JOIN payments p USING(customerNumber)
LEFT JOIN orders o USING(customerNumber)
GROUP BY c.customerName, c.country
ORDER BY c.customerName;

-- no 3
SELECT 
    c.customerNumber,
    c.customerName,
    SUM(od.quantityOrdered) AS total_quantity,
    CASE 
        WHEN SUM(od.quantityOrdered) > (
            SELECT AVG(quantityOrdered) 
            FROM orderdetails
        ) THEN 'di atas rata-rata'
        ELSE 'di bawah rata-rata'
    END AS kategori_pembelian
FROM customers c
JOIN orders o USING(customerNumber)
JOIN orderdetails od USING(orderNumber)
GROUP BY c.customerNumber, c.customerName
ORDER BY total_quantity DESC;




-- soal tambahan
START TRANSACTION;

INSERT INTO klub (nama_klub, kota_asal)
VALUES('Persija','jakarta'),
		('Arema FC','Malang'),
		('Persebaya','Surabaya'),
		('PSM Makassar','Makassar'),
		('Bali United', 'Bali');
		

INSERT INTO pemain(nama_pemain, posisi, id_klub)
VALUES ('Evan Dimas', 'Midfielder', 1),
		 ('Riko Simanjuntak', 'Forward', 1),
		 ('Hanif Sjahbandi', 'Defender', 2),
		 ('Makan Konate', 'Middielder', 2),
		 ('David da Silva', 'Forward', 3),
		 ('Irfan Jaya', 'Forward', 4),
		 ('Rizky Pellu', 'Midfielder', 4),
		 ('llija Spasojevic', 'Forward', 5),
		 ('Andhika Wiajaya', 'Defender', 5);

INSERT INTO pertandingan(tanggal_pertandingan, id_klub_tuan_rumah, skor_tuan_rumah, skor_tamu, id_klub_tamu)
VALUES ('2024-09-10', 1, 2, 1, 2), 
		 ('2024-09-12', 3, 1, 1, 4), 
		 ('2024-09-15', 5, 0, 3, 1), 
		 ('2024-09-20', 2, 1, 2, 5), 
		 ('2024-09-25', 4, 2, 0, 3);

ROLLBACK;
COMMIT;


SELECT *FROM klub;
SELECT *FROM pemain;
SELECT *FROM pertandingan;