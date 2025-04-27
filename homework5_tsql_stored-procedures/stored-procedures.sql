USE SEDC_ACADEMY_HOMEWORK
GO

-- Task 01
CREATE OR ALTER PROCEDURE usp_CreateGrade
    @StudentID INT,
    @CourseID INT,
    @TeacherID INT,
    @Grade TINYINT,
    @Comment NVARCHAR(MAX),
    @CreatedDate DATETIME
AS
BEGIN
    INSERT INTO dbo.Grade (StudentID, CourseID, TeacherID, Grade, Comment, CreatedDate)
    VALUES (@StudentID, @CourseID, @TeacherID, @Grade, @Comment, @CreatedDate);

    SELECT COUNT(*) AS [Student Total Grades Number]
    FROM dbo.Grade
    WHERE StudentID = @StudentID;

    SELECT MAX(Grade) AS [Max Grade For Student & Teacher]
    FROM dbo.Grade
    WHERE StudentID = @StudentID AND TeacherID = @TeacherID;
END
GO

EXEC usp_CreateGrade
    @StudentID = 111, 
    @CourseID = 0, 
    @TeacherID = 82, 
    @Grade = 10, 
    @Comment = N'Snaodliv',
    @CreatedDate = '1999-02-05';

SELECT * FROM dbo.Grade WHERE StudentID = 111;

-- Task 02
CREATE OR ALTER PROCEDURE usp_CreateGradeDetail
    @GradeID INT,
    @AchievementTypeID INT,
    @AchievementPoints SMALLINT,
    @AchievementMaxPoints SMALLINT,
    @AchievementDate DATE
AS
BEGIN
    INSERT INTO dbo.GradeDetails (GradeID, AchievementTypeID, AchievementPoints, AchievementMaxPoints, AchievementDate)
    VALUES (@GradeID, @AchievementTypeID, @AchievementPoints, @AchievementMaxPoints, @AchievementDate);

    SELECT SUM(CAST(AchievementPoints AS FLOAT) / CAST(AchievementMaxPoints AS FLOAT) * ParticipationRate) AS [Total Grade Points]
    FROM dbo.GradeDetails gd
    JOIN dbo.AchievementType at ON gd.AchievementTypeID = at.ID
    WHERE gd.GradeID = @GradeID;
END
GO

EXEC usp_CreateGradeDetail
    @GradeID = 1, 
    @AchievementTypeID = 3, 
    @AchievementPoints = 35, 
    @AchievementMaxPoints = 50, 
    @AchievementDate = '2023-12-01';

SELECT * FROM dbo.GradeDetails WHERE GradeID = 1;