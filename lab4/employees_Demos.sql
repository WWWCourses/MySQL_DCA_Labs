use employees;


SELECT COUNT(*) FROM employees LIMIT ;

SELECT COUNT(*),gender FROM employees GROUP BY gender LIMIT 30;

SELECT first_name, last_name, salary
FROM employees,salaries
WHERE employees.emp_no=salaries.emp_no
LIMIT 10;

DELETE FROM employees WHERE first_name='Georgi';


SELECT * FROM employees WHERE first_name='Georgi';
