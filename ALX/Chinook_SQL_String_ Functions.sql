           
           -- Part 1 Data Cleaning and Standardization
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


                -- Part 2 Data Transformation and Reporting

/*
Task 4: Extracting Customer's City Code
The logistics team wants to analyze customer distribution. 
They need a report showing the CustomerId, FirstName, LastName, and a new column called CityCode. 
The CityCode should be the first three characters of the City column, in lowercase.
Query: Use a substring function and a case conversion function to extract and format the city code.
*/    
SELECT CustomerId,
      FirstName,
      LastName,
      SUBSTRING(LOWER(City),1,3) AS CityCode
FROM Customer;

/*
Task 5: Invoice Date Formatting
The accounting department needs a report of all invoices.
 They want the InvoiceDate to be formatted as a string in the YYYY-MM-DD format. 
The report should include the InvoiceId, CustomerId, and the new formatted date column.
Query: Use a date formatting function to convert the InvoiceDate into YYYY-MM-DD format.
*/
SELECT * FROM Invoice;

SELECT InvoiceId,CustomerId,InvoiceDate ,DATE_FORMAT(InvoiceDate , "%Y-%m-%d" )AS FormattedInvoiceDate
FROM Invoice;

/*
Task 6: Calculating a 'Customer ID Hash'

For internal system checks, the IT department needs a unique, standardized identifier for each customer. 
Create a report with CustomerId and a new column called CustomerID_Hash. 
This hash should be a string created by concatenating the first two letters of the FirstName and the first two letters of the LastName, both in lowercase.
Query: Use substring and case conversion functions to extract the first two letters of the FirstName and LastName, convert them to lowercase, and concatenate them.
*/
SELECT FirstName,
      LastName ,
LOWER(CONCAT(SUBSTRING( FirstName ,1,2),'_',
       SUBSTRING(LastName,1,2)))   AS CustomerID_Hash
FROM Customer ;

-- Task 7: Customer Data Type Conversion


                  -- Part 3: Advanced Reporting and Auditing
                  
                  
/*Task 7: Customer Data Type Conversion
The reporting tool used by management expects the InvoiceId to be a string. 
Create a query that shows the InvoiceId, but with its data type explicitly converted to CHAR (or VARCHAR) using CAST(). Also, include the CustomerId and Total for each invoice.

*/
SELECT
    InvoiceId,
    CAST(InvoiceId AS CHAR(20)) AS InvoiceId_Text
FROM Invoice;

