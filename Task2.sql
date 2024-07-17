USE master;
CREATE Database School;

USE School;

CREATE Table Teachers(
ID int PRIMARY KEY IDENTITY(1,1),
FirstName varchar(50) not null,
LastName varchar(50) not null
);

CREATE Table TeacherDetails(
ID int PRIMARY KEY IDENTITY(1,1),
TeacherID int UNIQUE,
Address varchar (200),
Phone varchar (50),
Email varchar (100),
FOREIGN KEY (TeacherID) REFERENCES Teachers(ID)
);

CREATE Table Courses(
ID int PRIMARY KEY IDENTITY(1,1),
TeacherID int,
CoursesName varchar(100),
FOREIGN KEY (TeacherID) REFERENCES Teachers(ID)
);

CREATE Table Students(
ID int PRIMARY KEY IDENTITY(1,1),
FirstName varchar(50) not null,
LastName varchar(50) not null
);


CREATE Table Enrollment(
EnrollmentID int PRIMARY KEY IDENTITY(1,1),
StudentID int,
CourseID int,
EnrollmentDate date,
FOREIGN KEY (StudentID) REFERENCES Students(ID),
FOREIGN KEY (CourseID) REFERENCES Courses(ID)
);



INSERT INTO Teachers(FirstName,LastName)
VALUES
('Ahmed', 'Tayseer'),
('Omar', 'Mohammed'),
('Salem','Mahmud');


INSERT INTO  TeacherDetails(TeacherID,Address,Phone,Email)
VALUES
(1, 'Amman','0798','A@yahoo.com'),
(2, 'Irbid','0798','O@yahoo.com'),
(3, 'Amman', '0798','S@yahoo.com');

INSERT INTO  Courses(TeacherID,CoursesName)
VALUES
('1','Biology'),
('2','Biology'),
('1','Chem'),
('2','Chem'),
('3','History');

INSERT INTO Students(FirstName,LastName)
VALUES
('Anas', 'Najar'),
('Sad', 'Ghar'),
('Mahdi', 'Ababneh'),
('Tala', 'Mousa');

INSERT INTO Enrollment(StudentID,CourseID,EnrollmentDate)
VALUES
('1', '1','2021-12-01'),
('1', '3','2021-12-01'),
('2', '1','2021-12-01'),
('2', '2','2021-12-01'),
('3', '3','2021-12-01');



select * from Teachers;
select * from TeacherDetails;
select * from Students;
select * from Courses;
select * from Enrollment;
