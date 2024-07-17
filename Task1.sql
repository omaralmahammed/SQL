--Design and implement a database named "Library" with tables for books (Books) and authors (Authors)

-- create databsae "Library"
USE master;

CREATE Database Library;

--create table (Books)

USE Library;

CREATE Table Books(
BookID int not null,
Title varchar(20) not null,
AuthorID int not null,
PublishedYear int not null,
CopiesAvailable int,
BookCategory varchar(30)
);

--create table (Authors)

CREATE Table Authors(
AuthorID int not null,
FirstName varchar(20) not null,
LastName varchar(20) not null,
BirthYear date
);

-- Edit the length of the Title value.
ALTER TABLE Books 
ALTER COLUMN Title varchar(50);

--insert value for Books Table

INSERT INTO Books (BookID,Title,AuthorID,PublishedYear,CopiesAvailable,BookCategory)
VALUES
(1, 'Animal Farm', 1, '1998', 12, 'Political Satire'),
(2, 'Harry Potter', 2, '1997', 30, 'Fantasy'),
(3, 'The Hobbit', 3, '1937', 8, 'Fantasy'),
(4, 'Pride and Prejudice', 4, '1813', 5, 'Romance'),
(5, 'Adventures of Huckleberry Finn', 5, '1884', 10, 'Adventure');


-- inser value for Auther Table

INSERT INTO Authors (AuthorID, FirstName, LastName, BirthYear)
VALUES
(1, 'George', 'Orwell', '1903'),
(2, 'J.K.', 'Rowling', '1965'),
(3, 'J.R.R.', 'Tolkien', '1892'),
(4, 'Jane', 'Austen', '1775'),
(5, 'Mark', 'Twain', '1835');

--Display All Books and Authors
select * from Books;
select * from Authors;

--Book Availability: ( Query to show the book with the highest and lowest number of available copies )
SELECT * FROM Books WHERE CopiesAvailable = (SELECT MAX(CopiesAvailable) FROM Books);
SELECT MIN(CopiesAvailable) FROM Books;

--Average Publication Year:( Query to calculate and display the average publication year of books in the library )
SELECT Avg(PublishedYear) FROM Books;

--Total Books Count:( Query to count and print the total number of books in the library )
SELECT Count(BookID) FROM Books;

-- Empty Books & Authors Table ( i just need make Books Table with out any record )
DELETE Books;
DELETE Authors;

