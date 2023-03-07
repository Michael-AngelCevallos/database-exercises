# todo #1 Create a new file named aliases_exercises.sql.




# todo #2 Use the employees database.
USE employees;

# todo #3 Return 10 employees in a result set named 'full_name' in the format of 'last name, first name' for each employee.
SELECT concat(first_name,' ' ,last_name) AS full_name
from employees
LIMIT 10;



# todo #4 Add the date of birth for each employee as 'DOB' to the query.
SELECT concat(first_name,' ' ,last_name) AS full_name, birth_date AS DOB
from employees
LIMIT 10;



# todo #5 Update the query to format full name to include the employee number so it is formatted as 'employee number - last name, first name'.
SELECT concat(emp_no, '-', last_name,' ' ,first_name) AS full_name, birth_date AS DOB
from employees
LIMIT 10;