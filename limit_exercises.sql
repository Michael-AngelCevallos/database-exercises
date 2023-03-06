USE employees;
#  EXERCISE GOALS :
# Add the LIMIT clause to our existing queries


# todo #1 Create a new SQL script called limit_exercises.sql.


#  todo #2 MySQL provides a way to return only unique results from our queries with the keyword DISTINCT. For example, to find all the unique titles within the company, we could run the following query:

SELECT DISTINCT last_name
FROM employees
ORDER BY last_name DESC
LIMIT 10;



# todo # 3 Create a query to get the top 5 salaries and display just the employees number from the salaries table. The employee number results should be:

SELECT first_name, last_name, hire_date, birth_date
FROM employees
WHERE hire_date LIKE ('199%')
  AND birth_date LIKE ('%12-25%')
ORDER BY birth_date ASC, hire_date DESC
LIMIT 5;





SELECT first_name, last_name, hire_date, birth_date
FROM employees
WHERE hire_date LIKE ('199%')
  AND birth_date LIKE ('%12-25%')
ORDER BY birth_date ASC, hire_date DESC
LIMIT 5 OFFSET 45;