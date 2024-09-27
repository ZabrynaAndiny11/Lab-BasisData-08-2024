# Nama : Novi Rzekiyah Azzahrah Ramadhani
# Nim  : H071231069

USE LIBRARY;

#NO 1

-- Authors
SELECT * FROM authors;

INSERT INTO authors (`NAME`, nationality) 
VALUES ('Tere Liye','Indonesia'),
			('J.K. Rowling','British'), 
			('Andrea Hirata','');

-- Books
SELECT * FROM books;

INSERT INTO books (isbn, title, author_id, published_year, genre, copies_available)
VALUES (7040289780375, ' Ayah ', 3, 2015, 'Fiction', 15),
			(9780375704025, ' Bumi ', 1, 2014, 'Fantasy', 5),
			(83103717003024, ' Bulan ', 1, 2015, 'Fantasy', 3),
			(9780747532699, ' Harry Potters and the Philosophers Stone ', 2, 1997, '', 10),
			(7210301703022, ' The Running Grave ', 2, 2016, 'Fiction', 11);

-- Members
SELECT * FROM members;
INSERT INTO members (first_name, last_name, email, phone_number, join_date, membership_type)
VALUES ('John', 'Doe', 'John.doe@example.com', NULL, '2023-04-29', ''),
			('Alice', 'Johnson', 'alice.johnson@example.com', '1231231231', '2023-05-01', 'Standar'),
			('Bob', 'Williams', 'bob.williams@example.com', '3213214321', '2023-06-20', 'Premium');

-- Borrowings
SELECT * FROM borrowings;
INSERT INTO borrowings (member_id,book_id,borrow_date,return_date)
VALUES (1,4,'2023-04-09','2023-07-25'),
			(3,1,'2023-08-01',NULL), 
			(2,5,'2023-09-06','2023-09-09'),           
			(2,3,'2023-09-08',NULL),
			(3,2,'2023-09-10',NULL);

#NO2

SELECT * FROM books;
SELECT book_id FROM borrowings WHERE return_date IS NULL;
UPDATE books
SET copies_available = copies_available - 1 
WHERE id <=3;

#N03 

SELECT member_id FROM borrowings WHERE return_date IS NULL ;
UPDATE members
SET membership_type = "Standar"
WHERE id = 3;
borrowings
ALTER TABLE borrowings DROP FOREIGN KEY borrowings_ibfk_1;
ALTER TABLE borrowings ADD FOREIGN KEY (member_id) REFERENCES members (id) ON DELETE CASCADE 

DELETE FROM members
WHERE id = 2;


