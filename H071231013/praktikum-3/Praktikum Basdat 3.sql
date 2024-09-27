-- NOMOR 1
USE library;

-- Memasukkan data penulis ke dalam tabel authors
INSERT INTO authors (name, nationality)
VALUES ("Tere Liye", "Indonesian"),
("J.K. Rowling", "British"),
("Andrea Hirata", "");

INSERT INTO books
VALUES (1, "7040289780375", "Ayah", 3, 2015, "Fiction", 15),
(2, "9780375704025", "Bumi", 1, 2014, "Fantasy", 5),
(3, "9780371703024", "Bulan", 1, 2015, "Fantasy", 3),
(4, "9780747532699", "Harry Potter and the Pholosopher's Stone", 2, 1997, "", 10),
(5, "7210301703022", "The Running Grave", 2, 2016, "Fiction", 11);

INSERT INTO members
VALUES (1, "John", "Doe", "John.doe@example.com", NULL, "2023-04-29", ""),
(2, "Alice", "Johnson", "alice.johnson@example.com", 1231231231, "2023-05-01", "Standar"),
(3, "Bob", "Williams", "bob.williams@example.com", 3213214321, "2023-06-20", "Premium");

-- Memasukkan data peminjaman ke dalam tabel borrowings
INSERT INTO borrowings
VALUES (1, 1, 4, "2023-07-10", "2023-07-25"),
(2, 3, 1, "2023-08-01", NULL),
(3, 2, 5, "2023-09-06", "2023-09-09"),
(4, 2, 3, "2023-09-08", NULL),
(5, 3, 2, "2023-09-10", NULL);

-- NOMOR 2

-- Mengurangi jumlah salinan yang tersedia untuk 3 buku pertama
UPDATE books -- melakukan pembaruan pada tabel books.
SET copies_available = copies_available - 1 -- Mengatur nilai kolom copies_available (jumlah salinan yang tersedia) 
-- dengan menguranginya sebanyak 1.
WHERE id <= 3; -- mengurangi jumlah salinan yang tersedia dari buku-buku dengan ID 1, 2, dan 3 sebanyak satu salinan

-- NOMOR 3

-- Mengubah tipe keanggotaan Bob Williams menjadi "Standar"
UPDATE members
SET membership_type = "Standar" -- Mengatur nilai kolom membership_type menjadi "Standar".
WHERE id = 3; -- mengubah tipe keanggotaan anggota dengan ID 3 menjadi "Standar".

-- Menghapus anggota dengan id 2 (Alice Johnson) dari tabel members
DELETE FROM members
WHERE id = 2;

SELECT CONSTRAINT_NAME, TABLE_NAME, column_name, referenced_table_name,referenced_column_name
FROM information_schema.key_column_usage
WHERE TABLE_NAME ='borrowings' AND CONSTRAINT_SCHEMA = 'library' AND referenced_table_name IS NOT NULL;

ALTER TABLE borrowings DROP FOREIGN KEY borrowings_ibfk_1;

ALTER TABLE borrowings ADD FOREIGN KEY(member_id) REFERENCES members(id)
ON DELETE CASCADE;