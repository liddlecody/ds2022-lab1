-- SQL Exercises (With Answers)

-- 1. Retrieve all students who enrolled in 2023.
SELECT * FROM students
WHERE YEAR(EnrollmentDate) = 2023;

-- 2. Find students whose email contains 'gmail.com'.
SELECT * from students 
WHERE email like "%gmail.com";

-- 3. Count how many students are enrolled in the database.
SELECT COUNT(*) as StudentCount
FROM students; 


-- 4. Find students born between 2000 and 2005.
SELECT * FROM students 
WHERE YEAR(dateofbirth) >= 2000 AND YEAR(dateofbirth) <= 2005;

-- 5. List students sorted by last name in descending order.
SELECT * FROM students 
ORDER BY LastName DESC;

-- 6. Find the names of students and the courses they are enrolled in.
SELECT Students.firstname, Students.lastname, Courses.coursename
FROM students 
INNER JOIN Enrollments on Students.studentid = Enrollments.studentid
INNER JOIN Courses on Enrollments.courseid = Courses.courseid;

-- 7. List all students and their courses, ensuring students without courses are included (LEFT JOIN).
SELECT Students.firstname, Students.lastname, Courses.coursename
FROM students 
LEFT JOIN Enrollments on Students.studentid = Enrollments.studentid
LEFT JOIN Courses on Enrollments.courseid = Courses.courseid;


-- 8. Find all courses with no students enrolled (LEFT JOIN).
SELECT c.CourseName
FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
WHERE e.EnrollmentID IS NULL;

-- 10. List courses and show the number of students enrolled in each course.
SELECT c.CourseID, c.CourseName, c.Credits, c.Instructor, COUNT(e.StudentID) AS NumberOfStudents
FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName, c.Credits, c.Instructor;