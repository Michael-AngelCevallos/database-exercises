USE employees;


#TODO Find all the employees with the same hire date as employee 101010 using a subquery. // 69 Rows

SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, e.hire_date
FROM employees AS e
WHERE e.hire_date IN (
    SELECT e.hire_date
    FROM employees AS e
    WHERE e.emp_no = 101010
);


#TODO Find all the titles held by all employees with the first name Aamod.  //  314 total titles, 6 unique titles

SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, t.title
FROM employees AS e
         JOIN titles AS t
              ON e.emp_no = t.emp_no
WHERE e.first_name = 'Aamod';