

# Exercise Goals
#
# Use JOIN, LEFT JOIN, and RIGHT JOIN statements on our Join Example DB
# Integrate aggregate functions and clauses into our queries with JOIN statements

#todo #1 Create a file named join_exercises.sql to do your work in.


USE employees;

# todo #2 Using the example in the Associative Table Joins section as a guide,
#  write a query that shows each department , along with the name of the current manager,  for that department.


SELECT d.dept_name AS Department_Name, CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager
FROM employees AS e
JOIN dept_manager AS dm
ON dm.emp_no = e.emp_no
JOIN departments AS d
ON dm.dept_no = d.dept_no
WHERE dm.to_date = '9999-01-01';


# todo #3 Find the name of all departments currently managed by women.
SELECT d.dept_name AS Department_Name, CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager
FROM employees AS e
JOIN dept_manager AS dm
    ON dm.emp_no = e.emp_no
JOIN departments AS d
    ON dm.dept_no = d.dept_no
WHERE dm.to_date = '9999-01-01' AND e.gender = 'F';


# todo #4 Find the current titles of employees currently working in the Customer Service department.
SELECT t.title AS Title , count(*) as Count /*t.titles grabs title of employee from employees table, count is used to count the number of employees */
FROM employees AS e
JOIN dept_manager AS dm
     ON dm.emp_no = e.emp_no
JOIN departments AS d
     ON dm.dept_no = d.dept_no
Join titles AS t
    ON e.emp_no = t.emp_no
JOIN dept_emp AS de
     ON de.emp_no = e.emp_no
WHERE dm.to_date = '9999-01-01' AND d.dept_name = 'Customer Service Department' AND de.to_date = '9999-01-01'
GROUP BY t.title;
