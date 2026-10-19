---Creation of Table Schemas---
--NOTE: After going through all the questions, I assume that we have to add multiple values and alter the table schema so that we can get the desired output. So I have added more values in the tables.

---Table Departments---

CREATE TABLE Departments (
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(80) NOT NULL
);


---Table Students---

CREATE TABLE Students (
StudentID INT PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Email VARCHAR(80) UNIQUE,
BirthDate DATE,
EnrollmentDate DATE
);

---Table Instructors---

CREATE TABLE Instructors (
InstructorID INT PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Email VARCHAR(80) UNIQUE,
DepartmentID INT 
CONSTRAINT fk_Department
REFERENCES Departments(DepartmentID),
Salary DECIMAL(10,2)
);


---Table Courses---

CREATE TABLE Courses (
CourseID INT PRIMARY KEY,
CourseName VARCHAR(80) NOT NULL,
DepartmentID INT 
CONSTRAINT fk_Department
REFERENCES Departments(DepartmentID),
Credits INT
);


---Table Enrollments---

CREATE TABLE Enrollments (
EnrollmentID INT PRIMARY KEY,
StudentID INT 
CONSTRAINT fk_Students
REFERENCES Students(StudentID),
CourseID INT 
CONSTRAINT fk_Courses
REFERENCES Courses(CourseID),
EnrollmentDate DATE
);



----Insertion of values in the Tables---

--Department Table
INSERT INTO Departments(DepartmentID,DepartmentName)
VALUES
(1,'Computer Science'),
(2,'Mathematics');

--Students Table

INSERT INTO Students (StudentID,FirstName,LastName,Email,BirthDate,EnrollmentDate)
VALUES
(1,'John','Doe','john.doe@email.com','2000-01-15','2022-08-01'),
(2,'Jane','Smith','jane.smith@email.com','1999-05-25','2021-08-01');

--Courses Table
INSERT INTO Courses (CourseID,CourseName,DepartmentID,Credits)
VALUES
(101,'Introduction to SQL',1,3),
(102,'Data Structures',2,4);

--Instructors Table
INSERT INTO Instructors (InstructorID,FirstName,LastName,Email,DepartmentID)
VALUES
(1,'Alice','Johnson','alice.johnson@univ.com',1),
(2,'Bob','Lee','bob.lee@univ.com',2);

--Enrollments Table
INSERT INTO Enrollments(EnrollmentID,StudentID,CourseID,EnrollmentDate)
VALUES
(1,1,'101','2022-08-01'),
(2,2,'102','2021-08-01');


select * from Students;

---Queries to Perform--- 
---1. Perform CRUD Operations on all tables.

---SOLUTION: Performing CRUD operations in every table

--1. Departments table

--C-CREATE COMMAND:
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES (3, 'Biology');

--R-READ COMMAND:
SELECT * FROM Departments;

--U-UPDATE COMMAND:
UPDATE Departments
SET DepartmentName = 'Chemistry'
WHERE DepartmentID = 3;

--D-DELETE COMMAND:
DELETE FROM Departments
WHERE DepartmentID = 3;

--2.Students table

--C-CREATE COMMAND:

INSERT INTO Students
VALUES (3, 'Vijay', 'Verma', 'verma.vijay@email.com','2003-08-16', '2022-09-03');

--R-READ COMMAND:
SELECT * FROM Students;

---U-UPDATE COMMAND:
UPDATE Students
SET Email = 'vijay.verma@email.com'
WHERE StudentID = 3;

--D-DELETE COMMAND

DELETE FROM Students
WHERE StudentID = 3;

--3. Instructors table

--C-CREATE COMMAND:
INSERT INTO Instructors
(InstructorID, FirstName, LastName, Email, DepartmentID, Salary)
VALUES
(8, 'Richard', 'Clarke', 'emma@univ.com', 2, 84000.00);

--R--READ COMMAND:
SELECT * FROM Instructors;

--U-UPDATE COMMAND:
UPDATE Instructors
SET Salary = 770000.00
WHERE InstructorID = 8;

UPDATE Instructors
SET Salary = 4000.00
WHERE InstructorID = 1;

UPDATE Instructors
SET Salary = 5000.00
WHERE InstructorID = 2;

--D-DELETE COMMAND:
DELETE FROM Instructors
WHERE InstructorID = 8;

--4. Courses table

--C-CREATE COMMAND:
INSERT INTO Courses (CourseID, CourseName, DepartmentID, Credits)
VALUES (103, 'JAVA', 2, 6);

--R-READ COMMAND:
SELECT * FROM Courses;

--UPDATE COMMAND:
UPDATE Courses
SET Credits = 8
WHERE CourseID = 103;

--D-DELETE COMMAND:
DELETE FROM Courses
WHERE CourseID = 103;

--5.Enrollments table:

--C- CREATE COMMAND:
INSERT INTO Enrollments
(EnrollmentID, StudentID, CourseID, EnrollmentDate)
VALUES
(15, 1, 102, '2022-09-01');

--R-READ COMMAND:
SELECT * FROM Enrollments;


--U-UPDATE COMMAND:
UPDATE Enrollments
SET EnrollmentDate = '2025-06-02'
WHERE EnrollmentID = 15;

--D-DELETE COMMAND:
DELETE FROM Enrollments
WHERE EnrollmentID = 15;

--NOTE: I'm also inserting more values in the multiple tables so that we can get the desired output.


--STUDENTS:
INSERT INTO Students
    (StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate)
VALUES
    (3,  'Atharava',  'Sharma',  'aarav@univ.com',  '2002-03-12', '2023-08-01'),
    (4,  'Supriya',  'Singh',   'priya@univ.com',  '2001-07-21', '2023-08-01'),
    (5,  'Rahul',  'Verma',   'rahul@univ.com',  '2002-11-05', '2024-01-15'),
    (6,  'Rama',   'Gupta',   'neha@univ.com',   '2001-02-17', '2024-08-01'),
    (7,  'Amit',   'Kumar',   'amit@univ.com',   '2003-06-25', '2025-01-10'),
    (8,  'Sonam',  'Yadav',   'sneha@univ.com',  '2002-09-14', '2025-08-01'),
    (9,  'Arjun',  'Mishra',  'arjun@univ.com',  '2001-12-30', '2023-07-15'),
    (10, 'Smriti',  'Rao',     'pooja@univ.com',  '2003-04-08', '2024-01-15'),
    (11, 'Karan',  'Malik',   'karan@univ.com',  '2002-10-19', '2025-01-10'),
    (12, 'Tuba',  'Khan',    'meera@univ.com',  '2001-08-11', '2023-08-01'),
    (13, 'Mohan', 'Das',     'vikram@univ.com', '2002-05-27', '2024-08-01'),
    (14, 'Suparna', 'Roy',     'ananya@univ.com', '2003-01-03', '2025-08-01');

---Courses:
INSERT INTO Courses (CourseID, CourseName, DepartmentID, Credits)
VALUES
(103, 'Discrete Mathematics', 2, 3),
(104, 'Database Systems',      1, 4),
(105, 'Statistics',            2, 3);

--Instructors:
INSERT INTO Instructors
(InstructorID, FirstName, LastName, Email, DepartmentID, Salary)
VALUES
(3, 'Jimmy', 'Clarke',  'carol@univ.com', 1, 73000.00),
(4, 'Michel', 'Dawson', 'michel@univ.com', 2, 58000.00),
(5, 'Jimmy', 'Anderson', 'anderson@univ.com', 2, 53000.00);

--Enrollments:
INSERT INTO Enrollments
(EnrollmentID, StudentID, CourseID, EnrollmentDate)
VALUES
    (3,  3, 101, '2023-08-01'),
    (4,  3, 102, '2023-08-02'),
    (5,  4, 101, '2023-08-01'),
    (6,  4, 102, '2023-08-02'),
    (7,  5, 101, '2024-01-15'),
    (8,  5, 102, '2024-01-16'),
    (9,  6, 101, '2024-08-01'),
    (10, 6, 102, '2024-08-02'),
    (11, 7, 101, '2025-01-10'),
    (12, 7, 102, '2025-01-11'),
    (13, 8, 101, '2025-08-01'),
    (14, 8, 102, '2025-08-02'),
    (15, 9, 101, '2023-07-15'),
    (16, 10, 101, '2024-01-15'),
    (17, 11, 101, '2025-01-10'),
    (18, 12, 101, '2023-08-01'),
    (19, 13, 101, '2024-08-01'),
    (20, 14, 101, '2025-08-01');

	

---2. Retrieve students who enrolled after 2022.
---Solution:
SELECT 
*
FROM Enrollments
WHERE 
EnrollmentDate >= '2023-01-01';
---3. Retrieve courses offered by the Mathematics department with a limit of 5 courses.
--SOLUTION:
SELECT 
d.DepartmentName,
c.CourseName
FROM Courses c
JOIN Departments d
ON c.DepartmentID = d.DepartmentID
WHERE d.departmentName = 'Mathematics'
Limit 5;
---4. Get the number of students enrolled in each course, filtering for courses with more than 5 students.
--SOLUTION:
SELECT c.CourseName, 
COUNT(DISTINCT e.StudentID) As No_of_Students
FROM Courses c
JOIN Enrollments e 
ON c.CourseID = e.CourseID
GROUP BY c.CourseName
HAVING COUNT(DISTINCT e.StudentID) > 5;
---5. Find students who are enrolled in both Introduction to SQL and Data Structures.
--SOLUTION:
SELECT s.StudentId, s.FirstName, s.LastName
FROM Students s
JOIN Enrollments e 
ON s.StudentID = e.StudentID
JOIN Courses c
ON e.CourseID = c.CourseID
WHERE c.CourseName 
IN ('Introduction to SQL', 'Data Structure')
GROUP BY s.StudentId, s.FirstName, s.LastName
HAVING COUNT(DISTINCT CourseName) = 2;
---6. Find students who are either enrolled in Introduction to SQL or Data Structures.
--SOLUTION:
SELECT s.StudentId, s.FirstName, s.LastName
FROM Students s
JOIN Enrollments e 
ON s.StudentID = e.StudentID
JOIN Courses c
ON e.CourseID = c.CourseID
WHERE c.CourseName 
IN ('Introduction to SQL', 'Data Structure')
GROUP BY s.StudentId, s.FirstName, s.LastName;
---7. Calculate the average number of credits for all courses.
--SOLUTION:
SELECT Round(AVG(Credits),2) AS Avg_Credits
FROM Courses;
---8. Find the maximum salary of instructors in the Computer Science department.
--SOLUTION:
SELECT MAX(i.Salary) As Max_Salary
FROM Instructors i
JOIN Departments d
ON i.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Computer Science';
---9. Count the number of students enrolled in each department.
--SOLUTION:
SELECT d.DepartmentID, d.DepartmentName,
COUNT(DISTINCT e.StudentID) As Total_Students
FROM Departments d
JOIN Courses c 
ON d.DepartmentID = c.DepartmentID
JOIN Enrollments e
ON c.CourseID = e.CourseID
GROUP BY d.DepartmentName, d.DepartmentID;
---10. INNER JOIN: Retrieve students and their corresponding courses.
--SOLUTION:
SELECT s.FirstName, s.LastName, c.CourseName
FROM Students s
INNER JOIN Enrollments e
ON s.StudentID = e.StudentID
INNER JOIN Courses c
ON e.CourseId = c.CourseID
ORDER BY s.FirstName, s.LastName, c.CourseName;
---11. LEFT JOIN: Retrieve all students and their corresponding courses, if any.
--SOLUTION:
SELECT s.FirstName, s.LastName, c.CourseName
FROM Students s
LEFT JOIN Enrollments e
ON s.StudentID = e.StudentID
LEFT JOIN Courses c
ON e.CourseId = c.CourseID
ORDER BY s.FirstName, s.LastName, c.CourseName;
---12. Subquery: Find students enrolled in courses that have more than 10 students.
--SOLUTION:
SELECT FirstName, LastName
FROM Students
WHERE StudentID
IN (SELECT StudentID FROM Enrollments WHERE CourseID 
      IN (SELECT CourseID FROM Enrollments 
	       GROUP BY CourseID 
		   HAVING COUNT (DISTINCT StudentID)>10));
---13. Extract the year from the EnrollmentDate of students.
--SOLUTION:
SELECT 
StudentID, FirstName, LastName,
EXTRACT (YEAR FROM EnrollmentDate) As Enrollment_Year
FROM Students
ORDER BY Enrollment_Year ASC;
---14. Concatenate the instructor's first and last name.
--SOLUTION:
SELECT CONCAT (FirstName, ' ', LastName) AS FullName
FROM Instructors;
---15. Calculate the running total of students enrolled in courses.
--SOLUTION:
SELECT 
EnrollmentID,
StudentID,
CourseID,
COUNT(*)
OVER (ORDER BY EnrollmentID) AS Running_Total
FROM Enrollments
ORDER BY EnrollmentID;
---16. Label students as 'Senior' or 'Junior' based on their year of enrollment. (If the enrollment date is more than 4 years from the current date, put the label 'Senior' otherwise 'Junior')
--SOLUTION:
SELECT
StudentID,
FirstName,
LastName,
EnrollmentDate,
CASE
WHEN EnrollmentDate < CURRENT_DATE - INTERVAL '4 YEARS'
THEN 'Senior'
ELSE 'Junior'
END AS StudentExperiance
FROM Students;
