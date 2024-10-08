CREATE DATABASE Library;
USE Library;

CREATE TABLE authors (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nama VARCHAR(100) NOT NULL 
);

CREATE TABLE books (
	id INT PRIMARY KEY AUTO_INCREMENT,
	isbn CHAR (13),
	title VARCHAR(100) NOT NULL,
	author_id INT,
	FOREIGN KEY (author_id)REFERENCES authors(id)
);

ALTER TABLE authors
ADD nationality VARCHAR(50);

ALTER TABLE books
MODIFY isbn CHAR(13) UNIQUE;


DESCRIBE authors;
DESCRIBE books;

ALTER TABLE books
ADD published_year YEAR NOT NULL,
ADD genre VARCHAR(50) NOT NULL,
ADD copies_avalable INT NOT NULL;

CREATE TABLE members (
 id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
 firts_name VARCHAR(50) NOT NULL,
 last_name VARCHAR(50) NOT NULL , 
 email VARCHAR(100) UNIQUE,
 phone_number CHAR(10),
 join_date DATE NOT NULL,
 membership_type VARCHAR (50)
);

CREATE TABLE borrowings(
	id INT PRIMARY KEY NOT NULL,
	member_id INT NOT NULL,
	book_id INT NOT NULL,
	borrow_date DATE NOT NULL,
	return_date DATE,
	FOREIGN KEY (member_id) REFERENCES members(id),
	FOREIGN KEY (book_id) REFERENCES books(id)
);

DROP TABLE authors;
DROP TABLE books;

