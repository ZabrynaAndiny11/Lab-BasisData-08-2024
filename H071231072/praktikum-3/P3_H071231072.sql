USE Library; 

INSERT INTO authors (NAME , Nationality)
VALUES ('Tere Liye','Indonesia'),
('J.K Rowling','British'),
('Andrea Hirata','' );

INSERT INTO books (isbn,Title,Author_id,Published_year,genre,copies_available)
VALUES ('7040289780375','Ayah',3,2015,'Fiction',15),
('9780375704025','Bumi',1,2014,'Fantasy',5),
('8310371703024','Bulan',1,2015,'Fantasy',3),
('9780747532699','Harry Potter and the Philosophers',2,1997,'',10),
('7210301703022','The Running Grave',2,2016,'Fiction',11);

INSERT INTO members(first_name ,email ,phone_number ,join_date, Membership_type)
VALUES('John Doe','John.doe@EXAMPLE.com',NULL ,2023-04-29,''),
('Alice Johnson','alice.johnshon@example.com',1231231231,'2023-05-01','Standar'),
('Bob Williams','bob.Williams@example.com',1231231231,'2023-06-20','Premium');


INSERT INTO borrowings
(member_id, book_id, borrow_date, return_date)
VALUES 
(1,4, '2023-07-10', '2023-07-25'),
(3,1, '2023-08-01', NULL),
(2,5, '2023-09-06', '2023-09-09'),
(2,3, '2023-09-08', NULL),
(3,2, '2023-09-10',NULL);


SELECT * FROM borrowings;
SELECT * FROM books;
SELECT * FROM members;

SELECT book_id FROM borrowings WHERE return_date IS NULL 
UPDATE books 
SET copies_available = copies_available -1
WHERE id <= 3;



UPDATE members 
SET membership_type = 'Standar'
WHERE id = 3;

DELETE FROM members
WHERE id =3;

DELETE FROM members  
WHERE id = 2;



ALTER TABLE borrowings DROP FOREIGN KEY borrowings_ibfk_1;
ALTER TABLE borrowings ADD FOREIGN KEY (member_id) REFERENCES members(id) ON DELETE cascade ;
)SELECT * FROM authors;
SELECT * FROM books;
SELECT * FROM members;
SELECT * FROM borrowings;
