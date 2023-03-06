# Exercise Goals
#
# Use ORDER BY clauses to create more complex queries for our database

#======================================================== PART 1

-- USE employees database, (must type:) USE employees; ( and then execute before going on)
USE employees;

# todo #1 ----->> Create a new file called order_by_exercises.sql and copy and paste the contents of your where_exercises.sql.


# todo #2 Modify your first query to order by first name. The first result should be Irena Flexer and the last result should be Vidya Awdeh.

SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name ;




#todo #3 Update the query to order by first name and then last name. The first result should now be Irena Acton and the last should be Vidya Zweizig.

SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena','Vidya', 'Maya')
ORDER BY first_name, last_name;



# todo #4 Change the ORDER BY clause so that you order by last name before first name. Your first result should still be Irena Acton but now the last result should be Maya Zyda.
SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena','Vidya', 'Maya')
ORDER BY last_name, first_name;



# todo #5 Update your queries for employees with 'e' in their last name to sort the results by their employee number. Make sure the employee numbers are in the correct order.

SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE ('%E%')
ORDER BY emp_no;


# todo #6 Now reverse the sort order for both queries and compare results.

SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE ('%E%')
ORDER BY emp_no DESC;