USE library;

INSERT INTO authors
VALUES (1, 'Tere Liye', 'Indonesia'), (2, 'J.K Rowling', 'British'), (3, 'Andrea Hirata', '')


INSERT INTO books (isbn, title,author_id, published_year, genre, copies_avalable)
VALUES (7040289780375, 'Ayah',3, '2015', 'Fiction', 15),
(9780375704025, 'Bumi',1, '2014', 'Fantasy', 5),
(8310371703024, 'Bulan',1, '2015', 'Fantasy', 3),
(9780747532699, 'Harry Potter and the Philosophers Stone',2, '1997', '',10),
(7210301703022, 'The Running Grave',2, '2016', 'Fiction', 11);

ALTER TABLE books
ADD author_name VARCHAR (100)
UPDATE books
SET author_name = (SELECT nama FROM authors WHERE books.author_id = authors.id)

INSERT INTO members (firts_name, last_name, email, phone_number, join_date, membership_type)
VALUES ('John', 'Doe', 'john.doe@example.com', NULL, '2023-04-29', ''),
('Alice', 'Johnson', 'alice.johnson@example.com',1231231231 , '2023-05-01', 'Standart'),
('Bob', 'Williams', 'bob.williams@example.com', 3213214321, '2023-06-20', 'Premium')

INSERT INTO borrowings
VALUES (1, 1, 4, '2023-07-10', '2023-07-25'),
(2, 3, 1, '2023-07-10', NULL),
(3, 2, 5, '2023-09-06', '2023-09-09'),
(4, 2, 3, '2023-09-08', NULL),
(5, 3, 2, '2023-09-10', NULL);

SHOW CREATE TABLE borrowings
ALTER TABLE borrowings
DROP CONSTRAINT borrowings_ibfk_1;

ALTER TABLE borrowings
ADD CONSTRAINT fk_book_id
FOREIGN KEY (book_id)
REFERENCES books(id)
ON DELETE CASCADE;

UPDATE books
SET copies_avalable = copies_avalable - 1
WHERE id IN (
SELECT book_id
FROM borrowings
WHERE return_date IS NULL
);

SELECT book_id FROM borrowings
WHERE return_date IS NULL;

UPDATE books 
SET copies_avalable = copies_avalable -1 
WHERE id = 1;

UPDATE books 
SET copies_avalable = copies_avalable -1 
WHERE id = 2;

UPDATE books 
SET copies_avalable = copies_avalable -1 
WHERE id = 3;

UPDATE members
SET membership_type = 'Standart'
WHERE membership_type = 'Premium'
AND EXISTS (
SELECT *
FROM borrowings
WHERE borrowings.member_id = members.id
AND borrowings.return_date IS NULL
);

DELETE FROM members
WHERE membership_type = 'Standart'
AND EXISTS (
SELECT *
FROM borrowings
WHERE borrowings.member_id = members.id
AND borrowings.return_date IS NULL
);

SELECT member_id FROM borrowings
WHERE return_date IS NULL;

UPDATE Members
SET membership_type = 'Standart'
WHERE id = 3;

DELETE FROM members
WHERE id = 3;




SELECT * FROM members
ALTER TABLE members 
ADD full_name VARCHAR (100)
UPDATE members
SET full_name = CONCAT(firts_name, ' ', last_name)

DELETE * FROM members

DELETE FROM borrowings;
DELETE FROM members;
DELETE FROM books;
DELETE FROM authors;
