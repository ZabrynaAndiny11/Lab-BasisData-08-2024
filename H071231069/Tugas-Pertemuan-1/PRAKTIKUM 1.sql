CREATE DATABASE library;
USE library;
CREATE TABLE authors (
	id INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(100) NOT NULL
)

ALTER table authors
ADD nationality VARCHAR(50)

CREATE TABLE books (
	id INT PRIMARY KEY AUTO_INCREMENT,
	isbn CHAR(13),
	title VARCHAR(100) NOT NULL,
	author_id INT,
	FOREIGN KEY (author_id) REFERENCES authors(id)		
)


ALTER TABLE books
ADD published_year YEAR NOT NULL 

ALTER TABLE books
ADD genre VARCHAR(50) NOT NULL

ALTER TABLE books 
DROP membership_type 

ALTER TABLE books
ADD membership_type VARCHAR(50) NOT NULL,
ADD copies_available INT NOT NULL,  
MODIFY isbn CHAR(13) UNIQUE,
MODIFY title VARCHAR(150)


CREATE TABLE members (
	id INT PRIMARY KEY NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	phone_number CHAR(10),
	join_date DATE,
	membership_type VARCHAR(50) NOT NULL
)
ALTER TABLE  members 
MODIFY join_date DATE NOT NULL 

ALTER TABLE members
MODIFY id INT NOT NULL AUTO_INCREMENT

CREATE TABLE borrowings (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	member_id INT NOT NULL,
	FOREIGN KEY (member_id) REFERENCES members(id),
	book_id INT NOT NULL,
	FOREIGN KEY (book_id) REFERENCES books(id),
	borrow_date DATE NOT NULL,
	return_date DATE 
)
DESCRIBE books;
DESCRIBE authors;
DESCRIBE members;
DESCRIBE borrowings;


