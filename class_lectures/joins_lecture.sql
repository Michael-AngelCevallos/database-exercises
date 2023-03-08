USE codeup_test_db;

# Lecture: Joins
-- A join is a type of SQL query that combines two or more tables.
-- Use foreign keys to ensure that the data integrity is maintained.

#Inner Join: Only returns connected row on both tables;

#Left Join: Returns all connected rows on the left side, and all connected rows on the right, nulls will be
# inserted if the data is missing (nulls on right)

#Right Join Return all connected and unconnected rows on the right sides
# nulls on left


# Create Tables for the todos and the owners

DROP TABLE IF EXISTS owners;
CREATE TABLE IF NOT EXISTS owners
(
    id         INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name       VARCHAR(30) NOT NULL,
    address    VARCHAR(255),
    created_at TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS todos;
CREATE TABLE IF NOT EXISTS todos
(
    id          INTEGER PRIMARY KEY AUTO_INCREMENT,
    title       VARCHAR(255) NOT NULL,
    description TEXT,
    owner_id    INT UNSIGNED,
    created_at  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (owner_id) REFERENCES owners (id)
);


# Insert data into the todos and owners tables
INSERT INTO owners (name, address)
VALUES ('John Doe', '123 Main St.');
INSERT INTO owners (name, address)
VALUES ('Jane Doe', '456 Main St.');
INSERT INTO owners (name, address)
VALUES ('Joe Doe', '789 Main St.');

SELECT *
FROM owners; /* POPULATE OWNERS TABLE FIRST */

INSERT INTO todos (title, description, owner_id)
VALUES ('Learn SQL', 'Learn how to write SQL queries', 1);
INSERT INTO todos (title, description, owner_id)
VALUES ('Learn PHP', 'Learn how to write PHP code', 2);
INSERT INTO todos (title, description, owner_id)
VALUES ('Learn MySQL', 'Learn how to write MySQL queries', 3);
INSERT INTO todos (title, description, owner_id)
VALUES ('Learn Coding', 'Learn codee at Codeup', 4); /*WILL NOT WORK BECAUSE THERE IS ONLY # OWNERS DECLARED ABOVE */

# Create more fake todos and add them to ID 1
INSERT INTO todos (title, description, owner_id)
VALUES ('Learn to Cook', 'Learn how to  make food', 1);
INSERT INTO todos (title, description, owner_id)
VALUES ('Learn to Code', 'Learn how to write code', 1);
INSERT INTO todos (title, description, owner_id)
VALUES ('Learn to Dance', 'Learn how to dance', 1);


SELECT *
FROM todos;

# TODO: BASIC JOIN QUERY

SELECT *
FROM owners AS o
         JOIN todos t ON (o.id = t.owner_id);



#TODO: Basic Joins with aliases
# same as
SELECT t.*, o.*
FROM owners o
         INNER JOIN todos t ON (o.id = t.owner_id);


-- Output string that says the name of the owner and the name of the todos

SELECT owners.name, todos.title
FROM owners JOIN todos ON owners.id = todos.owner_id;

# ADD DESCRIPTION column from todos
SELECT owners.name, todos.title, todos.description from todos
JOIN owners ON owners.id = todos.owner_id;


SELECT owners.address, COUNT(todos.title)
FROM owners
         JOIN todos ON owners.id = todos.owner_id
GROUP BY owners.address;


-- list the average age of the the todos in our datasets
SELECT owners.name, AVG(todos.created_at)
FROM owners
         JOIN todos ON owners.id = todos.owner_id
GROUP BY owners.name;



-- List te number of pets at eac addresses


-- List the address with the fewest todos


-- List the address with the most todos
SELECT owners.address, COUNT(todos.id)
FROM owners
         JOIN todos ON todos.owner_id = owners.id
GROUP BY owners.address
ORDER BY COUNT(todos.id) ASC;



-- Find the average age of the todos for each address
-- list the average age of the the ttodos in our datasets
SELECT owners.name, AVG(todos.created_at)
FROM owners
         JOIN todos ON owners.id = todos.owner_id
GROUP BY owners.name;


# Practice Joins:

USE codeup_test_db;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS roles;

CREATE TABLE roles
(
    id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE users
(
    id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name    VARCHAR(100) NOT NULL,
    email   VARCHAR(100) NOT NULL,
    role_id INT UNSIGNED DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name)
VALUES ('admin');
INSERT INTO roles (name)
VALUES ('author');
INSERT INTO roles (name)
VALUES ('reviewer');
INSERT INTO roles (name)
VALUES ('commenter');

INSERT INTO users (name, email, role_id)
VALUES ('bob', 'bob@example.com', 1),
       ('joe', 'joe@example.com', 2),
       ('sally', 'sally@example.com', 3),
       ('adam', 'adam@example.com', 3),
       ('jane', 'jane@example.com', NULL),
       ('mike', 'mike@example.com', NULL);

SELECT *
FROM roles;
SELECT *
FROM users;

# TODO: output user name and role for all records with a non-null user name and role name

SELECT users.name, roles.name
FROM users
         INNER JOIN roles ON roles.id = users.role_id;


# TODO: output user name and their role name for all matches and all users regardless of null roles (LEFT)

SELECT users.name, roles.name
FROM users
         LEFT JOIN roles ON roles.id = users.role_id;

# TODO: output user name and role for all non-null matches and all roles with null users (RIGHT)
SELECT users.name, roles.name
FROM users
         RIGHT JOIN roles ON roles.id = users.role_id;








USE employees;
SELECT *
FROM employees;
SELECT *
FROM titles;





SELECT titles.title, employees.first_name from titles
JOIN employees on titles.emp_no = employees.emp_no;




# DISPLAY each employees name , title, and salary

# FROM salaries JOIN employees join titles ( click on database tab on the right, right employees, go to diagrams, click visualation)
# this will give you a better idea of how/what is connecting

SELECT employees.first_name, titles.title, salaries.salary from salaries
JOIN employees ON salaries.emp_no = employees.emp_no
JOIN titles ON employees.emp_no = titles.emp_no;

# # sam as above shorter version
# SELECT titles.title, salaries.salary from salaries
# JOIN salaries ON salaries.emp_no = titles.emp_no;


# todo========= creating ALIASES(shorthand) does same as lines 225-227

SELECT e.first_name, t.title, s.salary from titles as t
JOIN employees AS e ON t.emp_no = e.emp_no
JOIN salaries AS s ON e.emp_no = s.emp_no;

SELECT * FROM titles;


# TODO: output all current employee names and their current titles
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name,
       t.title,
       t.to_date                              AS end_date
FROM employees e
         JOIN titles t ON t.emp_no = e.emp_no
WHERE t.to_date LIKE '9999%';

# or

SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name,
       t.title,
       t.to_date                              AS end_date
FROM employees e
         JOIN titles t ON t.emp_no = e.emp_no
WHERE t.to_date > NOW();

# using aliases


# TODO: output name and current department for employee number 10001

# name field -> employees (E) table
# dept_name -> departments (D) table
# dept_emp (DE) -> Match the emp_no on employees table and the
#               dept_no on the dept_name table


SELECT e.emp_no, CONCAT(e.first_name, ' ', e.last_name) AS full_name, COUNT(d.dept_name)
FROM employees e
         JOIN dept_emp de ON de.emp_no = e.emp_no
         JOIN departments d ON d.dept_no = de.dept_no
GROUP BY e.emp_no;
WHERE e.emp_no = 10010;



SELECT e.emp_no,
       CONCAT(e.first_name, ' ', e.last_name) AS full_name,
       d.dept_name
FROM employees e
         JOIN dept_emp de ON de.emp_no = e.emp_no
         JOIN departments d ON d.dept_no = de.dept_no
WHERE e.emp_no = 10010
  AND de.to_date > NOW();



# MySQL allows us to JOIN tables, usually based on a foreign key relationship. The process of joining will allow us to obtain query results from more than one table in a single query. There are different types of joins, and those different types give us a lot of flexibility in the actual query results. We will be discussing the following types of joins:
#
# JOIN, a.k.a INNER JOIN
# LEFT JOIN- gives evrything inner join does BUT only from the USERS
# RIGHT JOIN - gives evrything inner join does BUT only from the ROLES


# Practice Joins:

USE codeup_test_db;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS roles;

CREATE TABLE roles
(
    id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE users
(
    id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name    VARCHAR(100) NOT NULL,
    email   VARCHAR(100) NOT NULL,
    role_id INT UNSIGNED DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name)
VALUES ('admin');
INSERT INTO roles (name)
VALUES ('author');
INSERT INTO roles (name)
VALUES ('reviewer');
INSERT INTO roles (name)
VALUES ('commenter');

INSERT INTO users (name, email, role_id)
VALUES ('bob', 'bob@example.com', 1),
       ('joe', 'joe@example.com', 2),
       ('sally', 'sally@example.com', 3),
       ('adam', 'adam@example.com', 3),
       ('jane', 'jane@example.com', NULL),
       ('mike', 'mike@example.com', NULL);

SELECT *
FROM roles;
SELECT *
FROM users;


# TODO: output user name and role for all records with a non-null user name and role name

SELECT users.name, roles.name
FROM users
         INNER JOIN roles ON roles.id = users.role_id;


# returns
/*
 users.name   |    roles.name
    bob       |      admin
    joe       |      author
    sally     |      reviewer
    adam      |      reviewer

 */


# TODO: output user name and their role name for all matches and all users regardless of null roles (LEFT)

SELECT users.name, roles.name
FROM users
         LEFT JOIN roles ON roles.id = users.role_id;

# returns
/*
 users.name   |    roles.name
    bob       |      admin
    joe       |      author
    sally     |      reviewer
    adam      |      reviewer
    jane      |      <null>
    mike      |      <null>
 */



# TODO: output user name and role for all non-null matches and all roles with null users (RIGHT)
SELECT users.name, roles.name
FROM users
         RIGHT JOIN roles ON roles.id = users.role_id;

# returns
/*
 users.name   |    roles.name
    bob       |      admin
    joe       |      author
    sally     |      reviewer
    adam      |      reviewer
   <null>     |      commenter
 */