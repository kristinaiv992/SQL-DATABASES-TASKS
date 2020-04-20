


SELECT * FROM [dbo].[GradeDetails];
SELECT * FROM [dbo].[Grade];
SELECT * FROM [dbo].[Student];
SELECT * FROM [dbo].[AchievementType];
SELECT * FROM [dbo].[Teacher];

------------------------------------------------------------------------------------
--<-----------------------------STUDENTS MANIPULATION---------------------------->--
------------------------------------------------------------------------------------
--Find all Students with FirstName = Jasmina​
SELECT * 
FROM dbo.Student
WHERE FirstName = 'Jasmina'
GO
--Find all Students with FirstName = Antonio
SELECT * 
FROM dbo.Student 
WHERE FirstName = 'Antonio'
GO
--Find all Students with DateOfBirth greater than ‘01.01.1999’​
SELECT * 
FROM dbo.Student
WHERE DateOfBirth > '1999-01-01'
GO
--Find all Male students​ && Female students
SELECT * 
FROM dbo.Student
WHERE Gender = 'M' 
GO
SELECT * 
FROM dbo.Student
WHERE Gender = 'F' 
GO
--Find all Students with LastName starting With ‘T’​
SELECT * 
FROM dbo.Student
WHERE LastName like 'T%'
GO
----Find all Students Enrolled in January/1998​
SELECT *
FROM dbo.Student
WHERE YEAR(EnrolledDate)= 1998 and MONTH(EnrolledDate) = 01 
GO
------Find all Students with LastName starting With ‘J’ enrolled in January/1998​
SELECT * 
FROM dbo.Student
WHERE LastName like '%J' 
and YEAR(EnrolledDate) = 1998 
and MONTH(EnrolledDate) = 01
GO
-------------------------------------------------------------------------------------------
--<---------------------------------HOMEWORK PART 2------------------------------------->--
-------------------------------------------------------------------------------------------
--Find all Students with FirstName = Antonio ordered by Last Name​
SELECT* 
FROM dbo.Student
WHERE FirstName = 'Antonio'
ORDER BY LastName 
GO
-----List all Students ordered by FirstName​
SELECT *
FROM dbo.Student
ORDER BY FirstName
GO
----Find all Male students ordered by EnrolledDate, starting from the last enrolled​
SELECT*
FROM dbo.Student
WHERE Gender = 'M'
ORDER BY EnrolledDate DESC
GO
-------------------------------------------------------------------------------------------
--<---------------------------------HOMEWORK PART 3------------------------------------->--
					--<----------TEACHER MANIPULATION----------->--
-------------------------------------------------------------------------------------------
--List all Teacher First Names and Student First Names in single result set with duplicates​
SELECT FirstName
FROM dbo.Teacher
UNION ALL
SELECT FirstName
FROM Student

----List all Teacher Last Names and Student Last Names in single result set. Remove duplicates​
SELECT LastName
FROM dbo.Teacher
UNION
SELECT LastName
FROM dbo.Student
GO
----List all common First Names for Teachers and Students
SELECT FirstName
FROM dbo.Teacher
INTERSECT 
SELECT FirstName
FROM dbo.Student
GO
-------------------------------------------------------------------------------------------
--<---------------------------------HOMEWORK PART 4------------------------------------->--
-------------------------------------------------------------------------------------------
----Change GradeDetails table always to insert value 100 in AchievementMaxPoints column if no value is provided on insert​
ALTER TABLE GradeDetails
ADD CONSTRAINT DF_GradeDetails_AchievementMaxPoints 
default 100 for [AchievementMaxPoints]
GO
----Change GradeDetails table to prevent inserting AchievementPoints that will more than AchievementMaxPoints​
ALTER TABLE [dbo].[GradeDetails] WITH CHECK
ADD CHECK (AchievementPoints < = AchievementMaxPoints​)
GO
--OR
ALTER TABLE [dbo].[GradeDetails] WITH CHECK
ADD CONSTRAINT CHK_AchievementPoints CHECK(AchievementPoints> 0 AND AchievementPoints < = AchievementMaxPoints );
GO
----Change AchievementType table to guarantee unique names across the Achievement types
--SELECT * FROM dbo.AchievementType
ALTER TABLE [dbo].[AchievementType] WITH CHECK
ADD CONSTRAINT UNQ_AchievementType UNIQUE (Name)
GO
-------------------------------------------------------------------------------------------
--<---------------------------------HOMEWORK PART 5------------------------------------->--
-------------------------------------------------------------------------------------------
--Create Foreign Key constraints from diagram or with script
ALTER TABLE [dbo].[Grade] DROP CONSTRAINT [FK_Grade_Course];
ALTER TABLE [dbo].[Grade] DROP CONSTRAINT [FK_Grade_Teacher];
ALTER TABLE [dbo].[Grade] DROP CONSTRAINT [FK_Grade_Student] 
ALTER TABLE [dbo].[GradeDetails] DROP CONSTRAINT [FK_GradeDetails_AchievementType] 
ALTER TABLE [dbo].[GradeDetails] DROP CONSTRAINT [FK_GradeDetails_Grade]
						-----------------------
ALTER TABLE [dbo].[Grade]
ADD CONSTRAINT [FK_Grade_Student] 
FOREIGN KEY ([StudentID]) REFERENCES [dbo].[Student]([ID])

ALTER TABLE [dbo].[Grade]
ADD CONSTRAINT [FK_Grade_Course] 
FOREIGN KEY ([CourseID]) REFERENCES [dbo].[Course]([ID])

ALTER TABLE [dbo].[Grade]
ADD CONSTRAINT [FK_Grade_Teacher] 
FOREIGN KEY (TeacherID) REFERENCES [dbo].[Teacher]([ID])

ALTER TABLE [dbo].[GradeDetails]
ADD CONSTRAINT [FK_GradeDetails_Grade]
FOREIGN KEY (GradeID) REFERENCES [dbo].[Grade]([ID])

ALTER TABLE [dbo].[GradeDetails]
ADD CONSTRAINT [FK_GradeDetails_AchievementType]
FOREIGN KEY (AchievementTypeID) REFERENCES [dbo].[AchievementType]([ID])
-------------------------------------------------------------------------------------------
--<---------------------------------HOMEWORK PART 6------------------------------------->--
-------------------------------------------------------------------------------------------

----List all possible combinations of Courses names and AchievementType names that can be passed by student​
SELECT C.Name, A.Name 
FROM dbo.Course AS C 
CROSS JOIN dbo.AchievementType AS A
GO
----List all Teachers that has any exam Grade​
SELECT T.FirstName 
FROM dbo.Teacher AS T
INNER JOIN dbo.Grade AS G
ON T.ID = G.TeacherID 
GO
----List all Teachers without exam Grade​
SELECT DISTINCT T.FirstName 
FROM dbo.Teacher AS T
LEFT JOIN dbo.Grade AS G
ON T.ID = G.TeacherID
WHERE G.TeacherID is NULL
GO
--List all Students without exam Grade (using Right Join)

SELECT s.FirstName as StudentNAme
FROM dbo.Grade AS G 
RIGHT JOIN dbo.Student AS S
ON G.ID = S.StudentID
where G.Grade is NULL
GO

--Change a value in a Students table
UPDATE dbo.Student
set Gender = 'M'
WHERE FirstName = 'Antonio'
