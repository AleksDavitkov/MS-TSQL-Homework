USE SEDC_ACADEMY_HOMEWORK
GO

--    1.
-- ********
DECLARE @FirstName NVARCHAR(50);

--    2.
-- ********
SET @FirstName = 'Antonio';

--    3.
-- ********
SELECT * FROM dbo.Student
WHERE FirstName = @FirstName;

--    4.
-- ********
DECLARE @StudentsTable TABLE
(
    StudentId INT,
    StudentName NVARCHAR(100),
    DateOfBirth DATE
);

--    5.
-- ********
INSERT INTO @StudentsTable (StudentId, StudentName, DateOfBirth)
SELECT ID, FirstName + ' ' + LastName AS StudentName, DateOfBirth
FROM dbo.Student
WHERE Gender = 'F';

SELECT * FROM @StudentsTable;

--    6.
-- ********
-- Temporary table to hold info for short-term queries.
CREATE TABLE #TempStudents
(
    LastName NVARCHAR(100),
    EnrolledDate DATE
);

--    7.
-- ********
INSERT INTO #TempStudents (LastName, EnrolledDate)
SELECT LastName, EnrolledDate
FROM dbo.Student
WHERE Gender = 'M' AND FirstName LIKE 'A%';

SELECT * FROM #TempStudents;

--    8.
-- ********
SELECT LastName, EnrolledDate FROM #TempStudents
WHERE LEN(LastName) = 7;

--    9.
-- ********
SELECT FirstName, LastName, DateOfBirth, AcademicRank, HireDate FROM dbo.Teacher
WHERE LEN(FirstName) < 5;

--    10.
-- ********
-- Extracting FirstName and LastName — that mirror each other.
SELECT FirstName, LastName, DateOfBirth, AcademicRank, HireDate FROM dbo.Teacher
WHERE LEFT(FirstName, 3) = LEFT(LastName, 3);