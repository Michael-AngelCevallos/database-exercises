USE employees;


# todo #2 Update your queries for employees whose names start and end with 'E'. Use concat() to combine their first and last name together as a single column in your results.

SELECT CONCAT(first_name, ' ', last_name)
from employees
WHERE last_name LIKE ('E%') AND last_name Like('%E');





#todo #3 Find all employees born on Christmas — 842 rows.


SELECT first_name, last_name, birth_date
FROM employees
WHERE
    birth_date LIKE ('%12-25%')
ORDER BY birth_date;


# todo #4 Find all employees hired in the 90s and born on Christmas — 362 rows.
SELECT first_name, last_name, hire_date, birth_date
FROM employees
WHERE hire_date LIKE ('199%')
  AND birth_date LIKE ('%12-25%')
ORDER BY hire_date, birth_date;



# todo #5Change the query for employees hired in the 90s and born on Christmas such that the first result is the oldest employee who was hired last. It should be Khun Bernini.


SELECT first_name, last_name, hire_date, birth_date
FROM employees
WHERE hire_date LIKE ('199%')
  AND birth_date LIKE ('%12-25%')
ORDER BY birth_date ASC, hire_date DESC;


# todo #6 For your query of employees born on Christmas and hired in the 90s, use datediff() to find how many days they have been working at the company (Hint: You might also need to use now() or curdate()).

SELECT CONCAT(
               first_name, ' ', last_name, ' has been working here for ',
               ROUND ((UNIX_TIMESTAMP(hire_date) - CURDATE())/60/60/24, 0),
               ' days.'
           )
from employees
WHERE hire_date LIKE ('199%')
  AND birth_date LIKE ('%12-25%')
ORDER BY hire_date, birth_date;


