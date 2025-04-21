USE SEDC_ACADEMY_HOMEWORK
GO

--    1.
-- ********
SELECT dbo.Grade.TeacherID, COUNT(*) AS GradeCount FROM dbo.Grade
GROUP BY dbo.Grade.TeacherID;

--    2.
-- ********
SELECT dbo.Grade.TeacherID, COUNT(*) AS GradeCount FROM dbo.Grade
WHERE dbo.Grade.StudentID < 100
GROUP BY dbo.Grade.TeacherID;

--    3.
-- ********
SELECT dbo.Grade.StudentID, MAX(dbo.Grade.Grade) AS MaxGrade, AVG(dbo.Grade.Grade) AS AvgGrade
FROM dbo.Grade
GROUP BY dbo.Grade.StudentID;

--    4.
-- ********
SELECT dbo.Grade.TeacherID, COUNT(*) AS GradeCount FROM dbo.Grade
GROUP BY dbo.Grade.TeacherID
HAVING COUNT(*) > 200;

--    5.
-- ********
SELECT dbo.Grade.StudentID, COUNT(*) AS GradeCount, MAX(dbo.Grade.Grade) AS MaxGrade, AVG(dbo.Grade.Grade) AS AvgGrade
FROM dbo.Grade
GROUP BY dbo.Grade.StudentID
HAVING MAX(dbo.Grade.Grade) = AVG(dbo.Grade.Grade);

--    6.
-- ********
SELECT s.FirstName, s.LastName, g.StudentID, COUNT(*) AS GradeCount, MAX(g.Grade) AS MaxGrade, AVG(g.Grade) AS AvgGrade
FROM dbo.Grade g
JOIN dbo.Student s ON g.StudentID = s.ID
GROUP BY g.StudentID, s.FirstName, s.LastName
HAVING MAX(g.Grade) = AVG(g.Grade);

--    7.
-- ********
CREATE VIEW dbo.vv_StudentGrades AS
SELECT StudentID, COUNT(*) AS GradeCount FROM dbo.Grade
GROUP BY StudentID;

-- A view can transform how you look at data, turning Complexity into Simplicity.
SELECT * FROM dbo.vv_StudentGrades;

--    8.
-- ********
ALTER VIEW dbo.vv_StudentGrades AS
SELECT s.FirstName, s.LastName, COUNT(g.ID) AS GradeCount FROM dbo.Grade g
JOIN dbo.Student s ON g.StudentID = s.ID
GROUP BY s.FirstName, s.LastName;

--    9.
-- ********
SELECT * FROM vv_StudentGrades
ORDER BY GradeCount DESC;