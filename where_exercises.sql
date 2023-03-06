#======================================================== PART 1


# todo #1 Create a file named where_exercises.sql. Make sure to use the employees database before you begin.
USE employees;


# todo #2 Find all employees with first names 'Irena', 'Vidya', or 'Maya' — 709 rows (Hint: Use IN).

SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');

# todo #3 Find all employees whose last name starts with 'E' — 7,330 rows.

SELECT first_name, last_name
from employees
WHERE last_name LIKE ('e%');


# todo #4 Find all employees with a 'q' in their last name — 1,873 rows.
SELECT 'Last names that contain a "q"' AS '';
SELECT first_name , last_name AS 'last_name with a "q"'
from employees
WHERE last_name LIKE ('%q%');

# ============================================== Part 2

# todo #1 Update your query for 'Irena', 'Vidya', or 'Maya' to use OR instead of IN — 709 rows.
SELECT first_name , last_name
FROM employees
WHERE first_name = ('Irena') OR first_name = ('Vidya') OR first_name = ('Maya');

# todo #2 Add a condition to the previous query to find everybody with those names who is also male — 441 rows.
SELECT first_name , last_name, gender
FROM employees
WHERE gender = ('M') AND (first_name = ('Irena') OR first_name = ('Vidya') OR first_name = ('Maya'));


# todo #3 Find all employees whose last name starts or ends with 'E' — 30,723 rows.

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE ('E%')
AND last_name LIKE ('%E');



# todo #4 Duplicate the previous query and update it to find all employees whose last name starts and ends with 'E' — 899 rows.
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE ('E%') AND (last_name LIKE '%E');



# todo #5 Find all employees with a 'q' in their last name but not 'qu' — 547 rows.

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE ('%q%')
  AND last_name NOT LIKE ('%qu%');
