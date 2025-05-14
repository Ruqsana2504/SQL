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


