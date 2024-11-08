USE classicmodels;

# nomor 1

CREATE TABLE klub (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nama_klub VARCHAR(50) NOT NULL,
    kota_asal VARCHAR(20) NOT NULL
);

CREATE TABLE pemain (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nama_pemain VARCHAR(50) NOT NULL,
    posisi VARCHAR(20) NOT NULL,
    id_klub INTEGER,
    FOREIGN KEY (id_klub) REFERENCES klub(id)
);

CREATE TABLE pertandingan (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_klub_tuan_rumah INTEGER,
    id_klub_tamu INTEGER,
    tanggal_pertandingan DATE NOT NULL,
    skor_tuan_rumah INTEGER DEFAULT 0,
    skor_tamu INTEGER DEFAULT 0,
    FOREIGN KEY (id_klub_tuan_rumah) REFERENCES klub(id),
    FOREIGN KEY (id_klub_tamu) REFERENCES klub(id)
);

CREATE INDEX idx_posisi ON pemain(posisi);

CREATE INDEX idx_kota_asal ON klub(kota_asal);



# nomor 2

SELECT c.customerName,
c.country,
ROUND (SUM(p.amount),2) 'TotalPayment',
COUNT(o.orderNumber) 'orderCount',
MAX(p.paymentDate) 'LastPaymentDate',
case
	when SUM(p.amount) > 100000 then 'VIP'
	when SUM(p.amount) BETWEEN 5000 AND 10000 then 'Loyal'
	when SUM(p.amount) < 5000 then 'New'
END AS status
FROM customers c
left JOIN payments p USING(customerNumber)
left JOIN orders o USING(customernumber)
GROUP BY c.customerNumber
ORDER BY c.customerName	

    
    
# nomor 3

SELECT c.customerNumber,
c.customerName,
SUM(od.quantityOrdered) 'total_quantity',
case
	when SUM(od.quantityOrdered) > AVG(od.quantityOrdered) 
	then 'di atas rata-rata'
	when SUM(od.quantityOrdered)= AVG(od.quantityOrdered) 
	then 'rata-rata'
	when SUM(od.quantityOrdered) < AVG(od.quantityOrdered) 
	then 'di bawah rata-rata'
END AS 'kategori_pembelian'
FROM customers c
JOIN orders o USING(customerNumber)
JOIN orderdetails od USING(ordernumber)
GROUP BY c.customerNumber
ORDER BY total_quantity DESC


-- soal tambahan

INSERT INTO klub(nama_klub, kota_asal)
VALUES ('Persija', 'Jakarta'),
('Arema FC', 'Malang'),
('Persebaya', 'Surabaya'),
('PSM Makassar', 'Makassar'),
('Bali United', 'Bali');


INSERT INTO pemain(nama_pemain, posisi, id_klub)
VALUES ('Evan Dimas', 'Midfielder', 1), 
('Riko Simanjuntak', 'Forward', 1),
('Hanif Sjahbandi', 'Defender', 2),
('Makan Konate', 'Midfielder', 2),
('David da Silva', 'Forward', 3),
('Irfan Jaya', 'Forward', 4),
('Rizky Pellu', 'Midfielder', 4),
('Ilija Spasojevic', 'Forward', 5),
('Andhika Wijaya', 'Defender', 5)


INSERT INTO pertandingan(id_klub_tuan_rumah, 
id_klub_tamu, tanggal_pertandingan, skor_tuan_rumah, skor_tamu)
VALUES (1, 2, '2024-09-10', 2, 1),
(3, 4, '2024-09-12', 1, 1),
(5, 1, '2024-09-15', 0, 3),
(2, 5, '2024-09-20', 1, 2),
(4, 3, '2024-09-25', 2, 0)


SELECT * FROM klub

SELECT * FROM pemain

SELECT * FROM pertandingan

ROLLBACK 


COMMIT manajemen_tim_sepakbola