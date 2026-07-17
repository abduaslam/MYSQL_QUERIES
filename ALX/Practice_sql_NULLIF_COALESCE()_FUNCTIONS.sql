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



-- 2. IS NOT NULL
-- Exercise 1
-- Find employees who have a phone number.
SELECT * FROM employees
WHERE phone IS NOT NULL;

-- Exercise 2
-- Find employees with a bonus.
SELECT  * FROM employees
WHERE bonus IS  NOT NULL;

-- Exercise 3
-- Find employees with an email.
SELECT * FROM  employees
WHERE email IS NOT NULL ;

-- Exercise 4
-- Find employees assigned to a manager.
SELECT * FROM employees
WHERE manager_id IS NOT NULL;

-- Exercise 5
-- Find employees receiving commission.
SELECT * FROM employees
WHERE commission IS NOT NULL;


-- 3. IFNULL()
-- IFNULL(value, replacement) returns the replacement if the value is NULL.
-- Exercise 1
-- Display bonus as 0 when NULL.
SELECT first_name,IFNULL(bonus,0)AS Bouns FROM employees ;

-- Exercise 2
-- Replace missing commission with 0.
SELECT first_name,
       IFNULL(commission,0) FROM employees;

-- Exercise 3
-- Replace missing phone numbers.
SELECT first_name,
       last_name,
       IFNULL(phone,"no phone")
FROM employees ;

-- Replace missing emails.
SELECT employee_id,IFNULL(email,"don't have email")
FROM employees ;

-- Exercise 5
-- Calculate total salary.
-- If bonus is NULL, treat it as zero.
SELECT employee_id,salary+IFNULL(bonus,0) AS total_salary
FROM employees ;

-- 4. NULLIF()
-- NULLIF(a,b) returns NULL if the two values are equal; otherwise it returns the first value.
-- Exercise 1
-- Return NULL if salary is 5000.
SELECT employee_id,NULLIF(salary,5000)
FROM employees;

-- Exercise 2
-- Return NULL if department is HR.
SELECT employee_id,NULLIF(department,'HR')
FROM employees;

-- Exercise 3
-- Return NULL if manager_id is 101.
SELECT employee_id,NULLIF(manager_id,101)
FROM employees;

-- Exercise 4
-- Return NULL if bonus equals 400.
SELECT first_name,NULLIF(bonus,400)
FROM employees;

-- Exercise 5
-- Return NULL if commission equals 300.
SELECT first_name,NULLIF(commission,300)
FROM employees ;


-- 5. COALESCE()
-- COALESCE() returns the first non-NULL value from a list.

-- Exercise 1
-- Show phone if available; otherwise show email.
SELECT first_name,COALESCE(phone,email)
FROM employees ;
-- Exercise 2
-- Show phone, otherwise email, otherwise "No Contact".
SELECT first_name ,COALESCE(phone,email,"No Contact")
FROM employees ;
-- Exercise 3
-- Show bonus, otherwise commission, otherwise 0.
SELECT first_name,COALESCE(bonus,commission,0) 
FROM employees;

-- Exercise 4
-- Show manager ID or "No Manager".
SELECT  first_name,COALESCE(manager_id,"No Manager")
FROM employees;

-- anathoer solution
SELECT first_name,IFNULL(manager_id,"No Manager")
FROM employees;
-- Exercise 5
-- Calculate salary plus the first available extra payment (bonus first, then commission, otherwise 0).
SELECT first_name,
       salary + COALESCE(bonus,commission,0) AS total_pay
FROM employees;


