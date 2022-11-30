-- Active: 1663945334496@@127.0.0.1@3306@employees
SELECT e.first_name,s.salary
FROM employees AS e INNER JOIN salaries AS s
ON e.emp_no = s.emp_no;


SELECT e.first_name,s.salary
FROM employees AS e, salaries AS s
WHERE e.emp_no = s.emp_no;
