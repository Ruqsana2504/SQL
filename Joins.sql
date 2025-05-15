#For JOINS
----------
CREATE TABLE student (
	id INT PRIMARY KEY,
	name VARCHAR(50)
);

INSERT INTO student
(id, name)
VALUES
(101, "adam"),
(102, "bob"),
(103, "casey");

CREATE TABLE course (
	id INT PRIMARY KEY,
	course VARCHAR(50)
);

INSERT INTO course
VALUES
(102, "english"),
(105, "math"),
(103, "science"),
(107, "computer science");

CREATE TABLE employee (
	id INT PRIMARY KEY,
	name VARCHAR(50),
    manager_id INT
);

INSERT INTO employee
VALUES
(101, "adam", 103),
(102, "bob", 104),
(103, "casey", NULL),
(104, "donald", 103);

SELECT * FROM student;
select * from course;
select * from employee;
-------------------------------------------------------------
#INNER JOIN
SELECT * FROM student INNER JOIN course ON student.id = course.id;

#LEFT OUTER JOIN
SELECT * FROM student as s LEFT JOIN course as c ON s.id = c.id;

#RIGHT OUTER JOIN
SELECT * FROM student as s RIGHT JOIN course as c ON s.id = c.id;

#FULL OUTER JOIN
SELECT * FROM student as s LEFT JOIN course as c ON s.id = c.id
    UNION
SELECT * FROM student as s RIGHT JOIN course as c ON s.id = c.id;
    
#CROSS JOIN
SELECT * FROM student as s CROSS JOIN course as c ON s.id = c.id;

#SELF JOIN(Executes right to left, first name is manager, second is employee)
SELECT a.name as manager_name, b.name FROM employee as a JOIN employee as b ON a.id = b.manager_id;

#UNION
SELECT name FROM employee 
UNION
SELECT name FROM employee;

#SUB QUERY
SELECT name, marks from student WHERE marks > (SELECT AVG(marks) FROM student);

#SUB QUERY WITH IN - Find the names of all students with even roll numbers
SElECT names FROM student WHERE rollno % 2 = 0;
SElECT names FROM student WHERE rollno IN (SELECT rollno FROM student WHERE rollno % 2 = 0);

#SUB QUERY WITH FROM - Find the max marks from the students of Delhi
SElECT name, MAX(marks) FROM (SELECT * FROM student WHERE city = "Delhi") AS temp;

#SUB QUERY WITH SELECT
SElECT (SELECT MAX(marks) FROM student) name FROM student;