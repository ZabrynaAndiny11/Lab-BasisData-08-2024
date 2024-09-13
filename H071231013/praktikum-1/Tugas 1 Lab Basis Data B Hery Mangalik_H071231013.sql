-- 1. Create database and tables
CREATE DATABASE library;                  -- Membuat database baru bernama 'library'
USE library;                              -- Menggunakan database 'library'

CREATE TABLE authors (                    -- Membuat tabel 'authors'
    id INT AUTO_INCREMENT PRIMARY KEY,    -- ID author, auto-increment
    name VARCHAR(100) NOT NULL            -- Nama author, wajib diisi
);
library

CREATE TABLE books (                      -- Membuat tabel 'books'
    id INT AUTO_INCREMENT PRIMARY KEY,    -- ID buku, auto-increment
    isbn VARCHAR(13),                     -- ISBN buku
    title VARCHAR(100) NOT NULL,          -- Judul buku, wajib diisi
    author_id INT,                        -- ID author sebagai foreign key
    FOREIGN KEY (author_id) REFERENCES authors(id)
);

ALTER TABLE books ADD published_year YEAR NOT NULL,
ADD genre VARCHAR(50) NOT NULL,
ADD copies_available INT NOT NULL;



-- 2. Add nationality column to authors table
ALTER TABLE authors ADD COLUMN nationality VARCHAR(50);  -- Menambahkan kolom 'nationality'

-- 3. Modify isbn column in books table to prevent duplicates
ALTER TABLE books MODIFY COLUMN isbn VARCHAR(13) UNIQUE;  -- Membuat ISBN unik

-- 4. Display table structures
DESCRIBE authors;                         -- Menampilkan struktur tabel 'authors'
DESCRIBE books;                           -- Menampilkan struktur tabel 'books'

-- 5. Modify database to match the new schema
-- Drop existing tables
DROP TABLE IF EXISTS books;               -- Menghapus tabel 'books' jika ada
DROP TABLE IF EXISTS authors;             -- Menghapus tabel 'authors' jika ada

-- Create new tables
CREATE TABLE members (                    -- Membuat tabel 'members'
    id INT AUTO_INCREMENT PRIMARY KEY ,    -- ID anggota, auto-increment
    first_name VARCHAR(50) NOT NULL  ,               -- Nama depan anggota
    last_name VARCHAR(50) NOT null,                -- Nama belakang anggota
    email VARCHAR(100) NOT null,                   -- Email anggota
    phone_number CHAR(10),                -- Nomor telepon anggota
    join_date DATE NOT NULL ,                       -- Tanggal bergabung
    membership_type VARCHAR(50) NOT NULL            -- Tipe keanggotaan
);

CREATE TABLE books (                      -- Membuat ulang tabel 'books' dengan skema baru
    id INT AUTO_INCREMENT PRIMARY KEY,    -- ID buku, auto-increment
    title VARCHAR(150),                   -- Judul buku
    isbn VARCHAR(13) UNIQUE,              -- ISBN buku, unik
    author_id INT,                        -- ID author
    published_year YEAR,                  -- Tahun terbit
    genre VARCHAR(50),                    -- Genre buku
    copies_available INT                  -- Jumlah salinan tersedia
);

CREATE TABLE authors (                    -- Membuat ulang tabel 'authors' dengan skema baru
    id INT AUTO_INCREMENT PRIMARY KEY,    -- ID author, auto-increment
    name VARCHAR(100),                    -- Nama author
    nationality VARCHAR(50)               -- Kewarganegaraan author
);

CREATE TABLE borrowings (                 -- Membuat tabel 'borrowings'
    id INT AUTO_INCREMENT PRIMARY KEY,    -- ID peminjaman, auto-increment
    member_id INT NOT NULL ,                        -- ID anggota yang meminjam
    book_id INT NOT NULL ,                          -- ID buku yang dipinjam
    borrow_date DATE NOT null,                     -- Tanggal peminjaman
    return_date DATE,                     -- Tanggal pengembalian
    FOREIGN KEY (member_id) REFERENCES members(id),  -- Foreign key ke tabel 'members'
    FOREIGN KEY (book_id) REFERENCES books(id)       -- Foreign key ke tabel 'books'
);libraryborrowings

-- Add foreign key constraint to books table
ALTER TABLE books ADD FOREIGN KEY (author_id) REFERENCES authors(id);  -- Menambahkan foreign key ke tabel 'authors'




DESCRIBE members;                         -- Menampilkan struktur tabel 'members'
DESCRIBE books;                           
DESCRIBE authors;                         
DESCRIBE borrowings;