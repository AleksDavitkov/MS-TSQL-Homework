USE SEDC_ACADEMY_HOMEWORK
GO

-- *****
--   1
-- *****
SELECT * FROM dbo.Student 
WHERE FirstName = 'Antonio';

-- *****
--   2
-- *****
SELECT * FROM dbo.Student
WHERE DateOfBirth > '1999-01-01';

-- *****
--   3
-- *****
SELECT * FROM dbo.Student
WHERE LastName LIKE 'J%' AND EnrolledDate >= '1998-01-01' AND EnrolledDate < '1998-02-01';

-- *****
--   4
-- *****
SELECT * FROM dbo.Student
ORDER BY FirstName; -- ASC by default

-- *****
--   5
-- *****
SELECT LastName FROM dbo.Student
UNION
SELECT LastName FROM dbo.Teacher;

-- *****
--   6
-- *****
SELECT * FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS;
-- There are already logical FK's included in the pre-defined queries

--- Old keys dropped for clarity. Relation still holds hasn't changed..


ALTER TABLE dbo.Grade
DROP CONSTRAINT FK_Grade_Student;

ALTER TABLE dbo.Grade
ADD CONSTRAINT FK_Grade_Student
FOREIGN KEY (StudentID) REFERENCES dbo.Student(ID);

ALTER TABLE dbo.Grade
DROP CONSTRAINT FK_Grade_Course;

ALTER TABLE dbo.Grade
ADD CONSTRAINT FK_Grade_Course
FOREIGN KEY (CourseID) REFERENCES dbo.Course(ID);

-- *****
--   7
-- *****
SELECT c.Name AS CourseName, a.Name AS AchievementTypeName FROM dbo.Course c
CROSS JOIN dbo.AchievementType a;

-- *****
--   8
-- *****
SELECT t.LastName, t.FirstName FROM dbo.Teacher t
WHERE NOT EXISTS (
    SELECT 1 FROM dbo.Grade g
    INNER JOIN dbo.Course c ON g.CourseID = c.ID
    WHERE g.TeacherID = t.ID
    AND c.Name IN (N'Kolokvium1', N'Kolokvium2', N'Ispit')
);