USE classicmodels;

# -- NOMOR 1
SELECT
	productCode AS "Kode Produk",
	productName AS "Nama Produk",
	quantityInStock AS "Jumlah Stok"
FROM products # -- Menentukan tabel sumber data.
WHERE quantityInStock # -- Menentukan kondisi untuk memfilter data.
BETWEEN 5000 AND 6000; # -- Menentukan range nilai untuk quantityInStock antara 5000 dan 6000.classicmodels

# NOMOR 2
SELECT
	orderNumber AS "Nama Pesanan", # -- Menampilkan nomor pesanan
	orderDate AS "Tanggal Pesanan",
	status,
	customerNumber AS "Nomor Pelanggan"
FROM orders 
WHERE status != "Shipped" # -- Mengambil data pesanan yang belum dikirim (status bukan "Shipped").
ORDER BY customerNumber ASC; # -- Pengurutan ascending (dari kecil ke besar).

# NOMOR 3
SELECT
	employeeNumber AS "Nomor Karyawan", # -- Menampilkan nomor karyawan
	firstName, 
	lastName,
	email,
	jobTitle AS "Jabatan"
FROM employees
WHERE jobTitle = "Sales Rep" # -- Mengambil data 10 karyawan pertama dengan jabatan "Sales Rep".
ORDER BY firstName ASC # -- Mengurutkan hasil berdasarkan nama depan secara ascending.
LIMIT 10; # -- Membatasi output hanya 10 baris pertama.

# NOMOR 4
SELECT
	productCode AS "Kode Produk",
	productName AS "Nama Produk", 
	productLine AS "Lini Produk",
	buyPrice AS "Harga Beli"
FROM products
ORDER BY buyPrice DESC # -- secara descending.
LIMIT 5, 10; # -- Mengambil 10 baris mulai dari baris ke-6 (indeks 5).

# NOMOR 5
SELECT DISTINCT # -- Menghilangkan duplikasi baris dalam hasil query.
	country, # -- Mengambil data unik negara dan kota dari pelanggan.
	city
FROM customers # -- untuk mendapatkan daftar lokasi unik pelanggan.
ORDER BY country ASC, city ASC; # -- mengurutkan berdasarkan dua kolom, yang pertama country, habis itu city.

# -- Tugas Tambahan (Live Coding)

SELECT productname, quantityInStock
FROM products
WHERE quantityInStock < 50
ORDER BY quantityInStock ASC