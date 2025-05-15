# Write the query to find avg marks in each city in ascending order
SELECT 
    city, AVG(MARKS)
FROM
    student
GROUP BY city
ORDER BY AVG(MARKS);


# Write the query to find students according to grades
SELECT 
    grade, COUNT(name)
FROM
    student
GROUP BY grade
ORDER BY grade;


# Write the query to find total payment according to each payment method
SELECT 
    mode, COUNT(customer)
FROM
    customers
GROUP BY mode;


# In Student Table - Change the name of column "name" to "full_name".
ALTER TABLE student 
	CHANGE name full_name VARCHAR(50);


# In Student Table - Delete all students who scored marks less than 80
SET SQL_SAFE_UPDATES = 0;
DELETE FROM student 
WHERE
    marks < 80;
    

# In Student Table - Delete the column for grades
ALTER TABLE student
	DROP COLUMN grade;
