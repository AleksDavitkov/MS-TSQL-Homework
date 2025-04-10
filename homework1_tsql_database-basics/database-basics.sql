USE [master]
GO
CREATE DATABASE [SEDCACADEMYDB]
GO
USE [SEDCACADEMYDB]
GO
-- **** database created ****

CREATE TABLE [Student] (
	Id INT IDENTITY(1,1) NOT NULL,
	[FirstName] NVARCHAR(30) NOT NULL,
	[LastName] NVARCHAR(50) NOT NULL,
	[DateOfBirth] DATE NOT NULL,
	[EnrolledDate] DATE NOT NULL,
	[Gender] CHAR(1) NOT NULL,
	[NationalIDNumber] INT NOT NULL,
	[StudentCardNumber] INT NOT NULL,

	CONSTRAINT PK_Student_Id PRIMARY KEY CLUSTERED (Id),
	CONSTRAINT UQ_Student_NationalID UNIQUE (NationalIDNumber),
	CONSTRAINT UQ_Student_CardNumber UNIQUE (StudentCardNumber)
)
GO
-- Detailed identification fields are required in most educational institutions
-- These values are a must for uniquely identifying students/employees, which is why I didn't allow NULLs here

CREATE TABLE [Teacher] (
	Id INT IDENTITY(1,1) NOT NULL,
	[FirstName] NVARCHAR(30) NOT NULL,
	[LastName] NVARCHAR(50) NOT NULL,
	[DateOfBirth] DATE NOT NULL,
	[AcademicRank] NVARCHAR(10) NOT NULL
		CHECK (AcademicRank IN ('Instructor', 'Assistant')),
	[HireDate] DATE NOT NULL,

	CONSTRAINT PK_Teacher_Id PRIMARY KEY CLUSTERED (Id)
)
GO

CREATE TABLE [Grade] (
	Id INT IDENTITY(1,1) NOT NULL,
	[StudentID] INT NOT NULL,
	[CourseID] INT NOT NULL,
	[TeacherID] INT NOT NULL,
	[Grade] TINYINT NULL,
	[Comment] NVARCHAR(200) NULL,
	[CreatedDate] DATE NULL,

	CONSTRAINT PK_Grade_Id PRIMARY KEY CLUSTERED (Id)
)
GO

CREATE TABLE [Course] (
	Id INT IDENTITY(1,1) NOT NULL,
	[Name] NVARCHAR(50) NOT NULL,
	[Credit] SMALLINT NOT NULL,
	[AcademicYear] SMALLINT NOT NULL,
	[Semester] TINYINT NOT NULL,

	CONSTRAINT PK_Course_Id PRIMARY KEY CLUSTERED (Id)
)
GO

CREATE TABLE [GradeDetails] (
	Id INT IDENTITY(1,1) NOT NULL,
	[GradeID] INT NOT NULL,
	[AchievementTypeID] INT NOT NULL,
	[AchievementPoints] TINYINT NULL,
	[AchievementMaxPoints] TINYINT NULL,
	[AchievementDate] DATE NULL,
	
	CONSTRAINT PK_GradeDetails_Id PRIMARY KEY CLUSTERED (Id)
)
GO

CREATE TABLE [AchievementType] (
	Id INT IDENTITY(1,1) NOT NULL,
	[Name] NVARCHAR(40) NOT NULL,
	[Description] NVARCHAR(100) NULL,
	[ParticipationRate] TINYINT NULL,
	
	CONSTRAINT PK_AchievementType_Id PRIMARY KEY CLUSTERED (Id)
)
GO
-- **** tables created ****

INSERT INTO [Student] ([FirstName], [LastName], [DateOfBirth], [EnrolledDate], [Gender], [NationalIDNumber], [StudentCardNumber])
VALUES 
('John', 'Doe', '1995-05-15', '2019-09-01', 'M', 123456789, 987654321),
('Jane', 'Smith', '1997-07-22', '2020-01-20', 'F', 234567890, 876543210),
('Mark', 'Taylor', '1996-11-10', '2018-09-01', 'M', 345678901, 765432109),
('Emily', 'Johnson', '1998-03-17', '2021-02-15', 'F', 456789012, 654321098)

SELECT * FROM dbo.Student

INSERT INTO [Teacher] ([FirstName], [LastName], [DateOfBirth], [AcademicRank], [HireDate])
VALUES 
('Alice', 'Johnson', '1985-03-10', 'Instructor', '2018-08-15'),
('Bob', 'Martin', '1980-06-25', 'Assistant', '2020-05-10'),
('Sarah', 'Williams', '1979-01-30', 'Instructor', '2015-01-05'),
('David', 'Brown', '1990-12-12', 'Assistant', '2019-04-22')

SELECT * FROM dbo.Teacher

INSERT INTO [Course] ([Name], [Credit], [AcademicYear], [Semester])
VALUES 
('Math - Median Class', 5, 2021, 1),
('Physics - Higher Class', 4, 2021, 2),
('Computer Science 101', 6, 2021, 1),
('Biology - Median Class', 4, 2021, 2)

SELECT * FROM dbo.Course

INSERT INTO [Grade] ([StudentID], [CourseID], [TeacherID], [Grade], [Comment], [CreatedDate])
VALUES 
(1, 1, 1, 85, 'Good performance', '2021-12-01'),
(2, 2, 2, 92, 'Excellent student', '2021-12-05'),
(3, 3, 3, 78, 'Needs improvement in projects', '2021-11-15'),
(4, 4, 4, 88, 'Strong understanding of material', '2021-12-10')

SELECT * FROM dbo.Grade

INSERT INTO [GradeDetails] ([GradeID], [AchievementTypeID], [AchievementPoints], [AchievementMaxPoints], [AchievementDate])
VALUES 
(1, 1, 80, 100, '2021-12-01'),
(2, 2, 90, 100, '2021-12-05'),
(3, 1, 70, 100, '2021-11-15'),
(4, 2, 85, 100, '2021-12-10')

SELECT * FROM dbo.GradeDetails

INSERT INTO [AchievementType] ([Name], [Description], [ParticipationRate])
VALUES 
('Final Exam', 'End-of-semester exam', 80),
('Homework', 'Assignments and projects', 20),
('Midterm Exam', 'Mid-semester exam', 70),
('Class Participation', 'Active involvement in class discussions', 30)

SELECT * FROM dbo.AchievementType