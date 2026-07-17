-- 1. IS NULL

-- Exercise 1
-- Find employees whose phone number is NULL.
SELECT * FROM employees
WHERE phone IS NULL ;

-- Exercise 2
-- Find employees who do not have a bonus.
SELECT employee_id,bonus 
FROM employees
WHERE bonus IS NULL;

-- Exercise 3
-- Find employees without an email.
SELECT employee_id,first_name,last_name,email
FROM employees
WHERE email IS NULL;

-- Exercise 4
-- -- Find employees who don't have a manager.
SELECT employee_id,first_name,last_name,email,manager_id
FROM employees
WHERE manager_id  IS NULL ;

-- Exercise 5
-- Count employees whose commission is NULL.
SELECT COUNT(commission) AS null_commission
FROM employees
WHERE commission is NULL;


