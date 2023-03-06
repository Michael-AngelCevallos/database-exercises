-- START HERE, USE employees database
USE employees;


# ======================== WHERE CLAUSES
-- todo USING 'WHERE' CLAUSE

# # LIKE keyword - for finding results that contain a substring
# # Select the last name from all employees with a last name ending in z

SELECT last_name FROM employees
WHERE last_name LIKE 'z%';  #//START WITH Z

SELECT last_name FROM employees
WHERE last_name LIKE '%z'; #ENDS WITH Z

SELECT last_name FROM employees
WHERE last_name LIKE 'z%z'; # STARTS AND ENDS WITH Z


-- todo USING 'AND'
-- todo SELECT employees with first name that starts with 'a'
--  and last name that ends in z

SELECT first_name, last_name FROM employees
Where first_name LIKE 'a%' AND last_name LIKE '%z';


-- todo 'BETWEEN' - for filtering results within a given range
-- todo To find all the employees between employee number 10026 and 10082:

describe employees;

 SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no BETWEEN 10026 AND 10082;


-- todo USING 'DISTINCT' -

SELECT DISTINCT first_name FROM employees
WHERE first_name LIKE '%z%';




-- todo SELECT BY a specified  first name and order by gender

# MALE (ASC keyword)
SELECT *
FROM employees
WHERE first_name = 'Leni'
ORDER BY gender ASC, last_name;



-- FEMALE (DESC keyword)
SELECT *
From employees
Where first_name = 'Leni'
Order by gender DESC, last_name;

# todo ORDER BY LAST NAME in DESCENDING ORDER
SELECT *
From employees
Where first_name = 'Leni'
Order by gender DESC, last_name DESC;

# USING 'LIMIT' - limits the amount of records we can view on each page

SELECT *
FROM employees
LIMIT 1O OFFSET 0;


# pageNo * limit - limit = offset

#  see results from page 4
#  4 *10 -10 = 30