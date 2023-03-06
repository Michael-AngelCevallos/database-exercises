# todo #1 Create a file named where_exercises.sql. Make sure to use the employees database before you begin.
USE employees;


# todo #2 Find all employees with first names 'Irena', 'Vidya', or 'Maya' — 709 rows (Hint: Use IN).

SELECT first_name AS 'first_name', last_name AS 'last_name'
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');

# todo #3 Find all employees whose last name starts with 'E' — 7,330 rows.

SELECT first_name AS 'first_name', last_name AS 'last_name'
from employees
WHERE last_name LIKE ('e%');


# todo #4 Find all employees with a 'q' in their last name — 1,873 rows.
SELECT 'Last names that contain a "q"' AS '';
SELECT first_name AS 'first_name', last_name AS 'last_name with a "q"'
from employees
WHERE last_name LIKE ('%q%');



