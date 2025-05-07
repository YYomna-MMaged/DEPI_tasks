-- Step 1: Create the database (optional if you're working with an existing one)
-- CREATE DATABASE CompanyDB;
-- USE CompanyDB;

-- Step 2: Create the employees table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    last_name VARCHAR(50),
    salary DECIMAL(10, 2),
    manager_id INT,
    department_id INT
);

-- Step 3: Create the departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- Step 4: Insert sample data into employees table
INSERT INTO employees (emp_id, last_name, salary, manager_id, department_id) VALUES
(1, 'Smith', 3000, 100, 1),
(2, 'Johnson', 4500, 101, 2),
(3, 'Williams', 2500, 200, 1),
(4, 'Brown', 6000, 102, 3),
(5, 'Jones', 4000, NULL, 2);

-- Step 5: Insert sample data into departments table
INSERT INTO departments (department_id, department_name) VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Marketing');

-- Task 1: Retrieve employees with salary between 2000 and 5000 but not managed by 101 or 200
SELECT emp_id, last_name, salary
FROM employees
WHERE salary BETWEEN 2000 AND 5000
  AND manager_id NOT IN (101, 200);

-- Task 2: Retrieve employee names and their respective department names using JOINs and aliases
SELECT e.last_name AS employee_name, d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
ORDER BY d.department_name ASC;

-- Task 3: Find the number of employees and average salary for each department
SELECT department_id,
       COUNT(emp_id) AS employee_count,
       AVG(salary) AS average_salary
FROM employees
GROUP BY department_id;
