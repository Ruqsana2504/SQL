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

