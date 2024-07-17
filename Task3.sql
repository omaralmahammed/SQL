USE master;

CREATE Database Jaradat_Labrary;

USE Jaradat_Labrary;
GO

CREATE Table Categories(
CategorieID int primary key identity(1,1),
CategorieName varchar(50) not null,
);

CREATE Table Users(
UserID int primary key identity(1,1),
UserName varchar(50) not null,
);

CREATE Table Books(
BookID int primary key identity(1,1),
BookName varchar(50) not null,
CategorieID int,
UserID int,

FOREIGN KEY (CategorieID) REFERENCES Categories(CategorieID),
FOREIGN KEY (UserID) REFERENCES Users(UserID)
);


CREATE Table Authors(
AuthorID int primary key identity(1,1),
AuthorName varchar(50) not null,
);


CREATE Table Auther_Book(
Auther_BookID int UNIQUE identity(1,1),
AuthorID int,
BookID int,

FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

CREATE Table Employees(
EmployeeID int primary key identity(1,1),
EmployeeName varchar(50) not null,
);

CREATE Table Sections(
SectionID int primary key identity(1,1),
SectionName varchar(50) not null,
EmployeeID int,
BookID int,

FOREIGN KEY (BookID) REFERENCES Books(BookID),
FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);


------------------------------------------------------------------------------------------------------------
	
INSERT INTO Categories (CategorieName) 
VALUES 
('Science Fiction'),
('Fantasy'),
('Mystery'),
('Biography'),
('History');

INSERT INTO Users (UserName) 
VALUES 
('Alice'),
('Bob'),
('Charlie'),
('David'),
('James'),
('issa'), 
('Eve');

INSERT INTO Books (BookName, CategorieID, UserID)
VALUES 
('Dune', 1, 1),
('The Hobbit', 1, 2),
('The Hobbit', 2, 2),
('Sherlock Holmes', 3, 2),
('Steve Jobs', 3, 2),
('Steve Jobs', 2, 6),
('Moby-Dick', 2, 3),
('The Great Gatsby', 2, 5),
('Sapiens', 5, 7);


INSERT INTO Authors (AuthorName)
VALUES 
('Frank Herbert'),
('J.R.R. Tolkien'),
('Arthur Conan Doyle'),
('Walter Isaacson'),
('Yuval Noah Harari');

INSERT INTO Auther_Book (AuthorID, BookID) 
VALUES 
(1,1),
(1,2),
(2,1),
(3,3),
(4,2),
(4,1),
(5,1);

INSERT INTO Employees (EmployeeName) 
VALUES 
('Omar'),
('Anas'),
('Ayah'),
('Sarah'),
('Dema');

INSERT INTO Sections (SectionName, EmployeeID,BookID) 
VALUES 
('Human Resources', 1,2),
('Human Resources', 1,2),
('Finance', 2,3),
('Finance', 1,4),
('IT', 3,3),
('Marketing', 4,1),
('Marketing', 2,1),
('Sales', 5,4)

----------------------------------------------------------------------------
-- Know the users there bay books and the books that bought
SELECT Users.UserName, Books.BookName
FROM Users
INNER JOIN Books ON Books.UserID=Users.UserID;


-- Know all Categories and the books that have under evrey categories
SELECT Categories.CategorieName, Books.BookName
FROM Categories
LEFT JOIN Books ON Books.CategorieID = Categories.CategorieID;

-- Know all sections and the employees work in evrey section
SELECT Sections.SectionName, Employees.EmployeeName
FROM Employees
RIGHT JOIN Sections ON Sections.EmployeeID = Employees.EmployeeID

--Know all books and authers inside this library and the relationship between them
SELECT Authors.AuthorID, Authors.AuthorName, Books.BookName
FROM Authors
FULL OUTER JOIN Auther_Book ON Authors.AuthorID = Auther_Book.AuthorID
FULL OUTER JOIN Books ON Books.BookID = Auther_Book.BookID
