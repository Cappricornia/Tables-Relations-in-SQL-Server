
-- 1. One-To-One Relationship 
CREATE DATABASE [Flights]

CREATE TABLE [Flights](
	[FlightID] INT PRIMARY KEY NOT NULL,
	[PassengerNumber] CHAR(8) NOT NULL
)


CREATE TABLE [Passenger](
	[PersonID] INT PRIMARY KEY IDENTITY(101, 1) NOT NULL,
	[FirstName] VARCHAR(50) NOT NULL,
	[FlightID] INT FOREIGN KEY REFERENCES [Flights]([FlightID]) UNIQUE NOT NULL
)


INSERT INTO [Flights]([FlightID], [PassengerNumber])
	VALUES
			(101, 'N3dgd21B'),
			(102, 'M5LdfgfR'),
			(103, 'GE657QP2'),
			(104, 'GfRk57QP');


--2. One-To-Many Relationship
CREATE DATABASE [EntrepreneursDB]
	
CREATE TABLE [Entrepreneurs](
	[EntrepreneurID] INT PRIMARY KEY IDENTITY NOT NULL,
	[Name] VARCHAR(50) UNIQUE NOT NULL,
	[EstablishedOn] DATE NOT NULL
)

CREATE TABLE [Models](
	[ModelID] INT PRIMARY KEY IDENTITY(101, 1) NOT NULL,
	[Name] VARCHAR(50) NOT NULL,
	[EntrepreneurID] INT FOREIGN KEY REFERENCES [Entrepreneurs]([EntrepreneurID]) NOT NULL
)

INSERT INTO [Entrepreneurs] ([Name], [EstablishedOn])
VALUES
    ('BMW', '07/03/1916'),
    ('Tesla', '01/01/2003'),
    ('Lada', '01/05/1966'),
    ('Apple', '04/01/1976'),
    ('Microsoft', '04/04/1975'),
    ('Amazon', '07/05/1994'),
    ('Google', '09/04/1998'),
    ('Facebook', '02/04/2004'),
    ('Samsung', '03/01/1938'),
    ('Toyota', '08/28/1937');


-- 3. Many-To-Many Relationship 
CREATE DATABASE [StudentExams]
	
CREATE TABLE [Students](
	[StudentID] INT PRIMARY KEY IDENTITY NOT NULL,
	[FullName] VARCHAR(100)
)

CREATE TABLE [Exams](
	[ExamID] INT PRIMARY KEY IDENTITY(101, 1) NOT NULL,
	[ExamName] NVARCHAR(75) NOT NULL
)

-- mapping table 
CREATE TABLE [StudentsExams](
	[StudentID] INT FOREIGN KEY REFERENCES [Students]([StudentID]) NOT NULL,
	[ExamID] INT FOREIGN KEY REFERENCES [Exams]([ExamID]) NOT NULL,
	PRIMARY KEY ([StudentID], [ExamID])
	
)

INSERT INTO [Students]([FullName])
	VALUES
		('Mila Smith'),
		('Toni Johnson'),
		('Ron Williams'),
		('John Davis'),
		('Emily Brown'),
		('Daniel Taylor'),
		('Sophia Miller'),
		('Oliver Wilson'),
		('Ava Anderson'),
		('Ethan Thomas');

INSERT INTO [Exams]([ExamName])
	VALUES
		('SpringMVC'),
        ('Neo4j'),
		('Oracle 11g'),
		('ReactJS'),
		('Python'),
		('AWS Certified Solutions Architect'),
		('Java SE 8'),
		('SQL Server'),
		('Machine Learning'),
		('JavaScript');


-- Problem 4.	Self-Referencing 
CREATE DATABASE [Tutors]
	
CREATE TABLE [Tutors](
	[TutorID] INT PRIMARY KEY IDENTITY(101, 1) NOT NULL,
	[Name] VARCHAR(50) NOT NULL,
	[ManagerID] INT FOREIGN KEY REFERENCES [Tutors]([TutorID])
)

INSERT INTO [Tutors] ([Name], [ManagerID])
	VALUES
		('Ava Martinez', 106),
		('Ethan Thompson', 104),
		('Lily Carter', 102),
		('Lucas Turner', 101),
		('Grace Evans', 103),
		('Benjamin White', 105),
		('Chloe Harris', 106),
		('Alexander Adams', 101),
		('Nora Wright', 104),
		('Henry Green', 102),
		('Victoria Davis', 105),
		('John Smith', NULL),
		('Maya Johnson', 106),
		('Sintia Williams', 106),
		('Teddy Davis', 105),
		('Mark Brown', 101),
		('Emily Taylor', 103),
		('Daniel Clark', 104),
		('Sophia Anderson', 105),
		('Oliver Wilson', 102);


-- Problem 6

CREATE DATABASE [NewUniversityDB]

CREATE TABLE [Majors](
	[MajorID] INT PRIMARY KEY IDENTITY NOT NULL,
	[Name] VARCHAR(50) NOT NULL
)

CREATE TABLE [Students](
	[StudentID] INT PRIMARY KEY IDENTITY NOT NULL,
	[StudentNumber] INT UNIQUE NOT NULL,
	[StudentName] VARCHAR(50) NOT NULL,
	[MajorID] INT FOREIGN KEY REFERENCES [Majors] ([MajorID]) NOT NULL
)

CREATE TABLE [Payments](
	[PaymentID] INT PRIMARY KEY IDENTITY NOT NULL,
	[PaymentDate] DATE NOT NULL,
	[PaymentDueDate] DATE NOT NULL,
	[PaymentAmount] DECIMAL NOT NULL,
	[StudentID] INT FOREIGN KEY REFERENCES [Students] ([StudentID]) NOT NULL
)

CREATE TABLE [Subjects](
	[SubjectID] INT PRIMARY KEY IDENTITY NOT NULL,
	[SubjectName] VARCHAR(50) NOT NULL
)

CREATE TABLE [Schedule](
	[StudentID] INT NOT NULL,
	[SubjectID] INT NOT NULL,
	PRIMARY KEY ([StudentID], [SubjectID]),
	FOREIGN KEY ([StudentID]) REFERENCES [Students]([StudentID]),
	FOREIGN KEY ([SubjectID]) REFERENCES [Subjects]([SubjectID])
)
