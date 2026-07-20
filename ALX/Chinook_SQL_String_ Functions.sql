--  Data Cleaning and Standardization
/*
Task 1: Customer Email Clean-Up
The marketing team has noticed some customer email addresses have leading or trailing spaces. 
They want a report of all customers, showing their CustomerId and their Email address after removing any leading or trailing whitespace.
Query: Use a string function to remove leading and trailing spaces from the Email column.
*/
SELECT * FROM Customer;

SELECT
    LENGTH(Email) AS original_length,
    LENGTH(TRIM(Email)) AS trimmed_length
FROM Customer;

/*
Task 2: Standardized Customer Name
For a personalized email campaign, the marketing team wants a single column
 for the full name of each customer, formatted as "Lastname, Firstname". 
They also need this name column to be in all uppercase for consistency.
Query: Use string concatenation and case conversion functions to format the FirstName and LastName columns.
*/
SELECT * FROM Customer;

SELECT  FirstName,LastName,
        UPPER(CONCAT(FirstName,' ', LastName)) AS full_name
FROM Customer;

/*
Task 3: Employee Contact Details
The HR department wants a clean report of all employees. 
They need a single column that combines the FirstName, LastName, Title, and Phone number, formatted as "Firstname Lastname, Title: Phone".
Query: Use string concatenation to combine the employee details into a single column.
*/
SELECT * FROM Customer;
SELECT FirstName,LastName,Address,Phone,
       CONCAT(FirstName," ",
       LastName," ",
       SUBSTRING(Address,1,8),":",
       Phone) AS EmployeeContact 
FROM Customer;       