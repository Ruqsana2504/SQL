CREATE DATABASE IF NOT EXISTS college;
use college;
-------------------------------------------------------------
CREATE TABLE student (
	rollno INT PRIMARY KEY,
	name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);

INSERT INTO student
(rollno, name, marks, grade, city)
VALUES
(101, "anil", 78, "C", "Pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhruv", 96, "A", "Mumbai"),
(105, "enamuel", 12, "F", "Delhi"),
(106, "farah", 82, "B", "Delhi");
-------------------------------------------------------------
#PARENT TABLE
CREATE TABLE dept(
	id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO dept
(id, name)
VALUES
(101, "english"),
(102, "IT");

SELECT * FROM dept;

#CHILD TABLE
CREATE TABLE teacher(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

INSERT INTO teacher
VALUES
(101, "Adam", 101),
(102, "Eve", 102);

SELECT * FROM teacher;
-------------------------------------------------------------
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer VARCHAR(100),
    mode VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO customers (customer_id, customer, mode, city) VALUES
(101, 'Olivia Barrett', 'Netbanking', 'Portland'),
(102, 'Ethan Sinclair', 'Credit Card', 'Miami'),
(103, 'Maya Hernandez', 'Credit Card', 'Seattle'),
(104, 'Liam Donovan', 'Netbanking', 'Denver'),
(105, 'Sophia Nguyen', 'Credit Card', 'New Orleans'),
(106, 'Caleb Foster', 'Debit Card', 'Minneapolis'),
(107, 'Ava Patel', 'Debit Card', 'Phoenix'),
(108, 'Lucas Carter', 'Netbanking', 'Boston'),
(109, 'Isabella Martinez', 'Netbanking', 'Nashville'),
(110, 'Jackson Brooks', 'Credit Card', 'Boston');
-------------------------------------------------------------

SELECT * FROM student;

select * from customers;

SELECT * 
FROM student 
WHERE marks > 80;

SELECT DISTINCT city FROM student;
SELECT * FROM student WHERE MARKS > 75 LIMIT 3;

# OPERATORS 
# 1.LOGICAL
SELECT * FROM student WHERE marks > 80 AND city = "Mumbai";
SELECT * FROM student WHERE marks > 90 OR city = "Mumbai";
SELECT * FROM student WHERE marks BETWEEN 80 AND 90;
SELECT * FROM student WHERE city IN ("Delhi", "Mumbai");
SELECT * FROM student WHERE city NOT IN ("Delhi", "Mumbai");

# ORDER BY
SELECT * FROM student ORDER BY city ASC;
SELECT * FROM student ORDER BY marks DESC LIMIT 3;

# AGGREGATE FUNCTIONS
SELECT MAX(marks) FROM student;
SELECT AVG(marks) FROM student;
SELECT COUNT(rollno) FROM student;

#GROUP BY
SELECT city, COUNT(name) FROM student GROUP BY city;

#HAVING BY
SELECT city, count(rollno) FROM student GROUP BY city HAVING MAX(marks) > 90;
SELECT city FROM student WHERE grade="A" GROUP BY city HAVING MAX(marks) >= 93 ORDER BY city;

SET SQL_SAFE_UPDATES = 0;

#UPDATE
UPDATE student SET grade = "O" WHERE grade = "A";
UPDATE student SET marks = marks + 1;

#DELETE
DELETE FROM student WHERE marks < 30;

#Foreign Key
UPDATE dept SET id = 103 where id = 102;
UPDATE dept SET id = 111 where id = 101;

