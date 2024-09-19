CREATE DATABASE library;

USE library;
CREATE TABLE authors(
id INT PRIMARY KEY AUTO_INCREMENT,
NAME VARCHAR (100) NOT NULL 
);

CREATE TABLE books(
id INT PRIMARY KEY AUTO_INCREMENT,
isbn VARCHAR(13),
title VARCHAR(100) NOT NULL,
author_id INT,
FOREIGN KEY (author_id)REFERENCES authors(id)
);
# nomor 2
ALTER TABLE authors
ADD COLUMN  nationality VARCHAR (50);
#nomor 3
ALTER TABLE books
MODIFY isbn VARCHAR(13) NOT NULL;

ALTER TABLE books
ADD UNIQUE (isbn);

#nomor 4
SHOW TABLES ;
DESCRIBE authors ;
DESCRIBE books;																						

CREATE TABLE members(
Id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR (50) NOT NULL,
last_name VARCHAR (50) NOT NULL,
email VARCHAR (100) NOT NULL,
phone_number CHAR (10),
join_date DATE NOT NULL,
membership_type VARCHAR (50)NOT NULL
);

CREATE TABLE borrowings (
id INT PRIMARY KEY AUTO_INCREMENT ,
member_id INT NOT NULL  ,
FOREIGN KEY (member_id) REFERENCES members (id),
book_id INT NOT NULL ,
FOREIGN KEY (book_id) REFERENCES books (id),
borrow_date DATE NOT NULL,
return_date DATE  
);

DESCRIBE members;
DESCRIBE borrowings;
SHOW TABLES;

ALTER TABLE books
ADD published_year YEAR NOT NULL ;

ALTER TABLE books
ADD genre VARCHAR (50)NOT NULL ;

ALTER TABLE books
ADD copies_available INT NOT NULL ;


