USE united_nations ;
         -- There are three typr of views
-- Lookup Views 
CREATE VIEW  Country_lookUp AS -- Serve as quick referance to acceess country name and their Est_population
SELECT Country_name,Est_population_in_millions,Time_period
FROM  Access_to_Basic_Services ;

use Northwind ;
-- Joins Views
-- Complex View → Multiple tables or aggregates, usually not updatable.
CREATE VIEW Customer_Order_Summary AS
SELECT c.CustomerName,
       COUNT(o.OrderID) AS TotalOrders
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName;


-- aggregating View  
-- An Aggregating View (also called an Aggregate View) is a type of complex view that uses aggregate functions to summarize data.
CREATE VIEW Region_aggregation AS
SELECT region,
       SUM(pop_n) AS total_population,
       AVG(pop_n) AS avg_population
FROM md_water_services.global_water_access
GROUP BY region;

   
   
   USE Chinook ;
                                 -- Views  Exercise one
   
/*Exercise 1
Create a LOOKUP view of the surname, first name, title, and country of each employee called Employee_View.*/
CREATE VIEW Employee_View AS
SELECT LastName,FirstName,Title
FROM Employee;


/*Exercise 2
Query the Employee_View view to get a view of the sales team. 
Use the wildcard operators and the LIKE query to filter all the employees in the specified view.*/
SELECT * FROM Employee_View
WHERE title LIKE  '%sales%' ;


/*Exercise 3
Create a JOIN view that will link up all the customers with the support staff assisting them, called Customer_Support_View. We want to view the following:
First name of the customer
Last name (surname) of the customer
Country where the customer resides
SupportRepId
EmployeeId
Last name of the employee
First name of the employee
Job title of the employee
Country where the employee operated from*/

DROP VIEW IF EXISTS Customer_Support_View;
CREATE VIEW Customer_Support_View AS
SELECT
    C.FirstName,
    C.LastName,
    C.Country,
    C.SupportRepId,
    E.EmployeeId,
    E.LastName AS EmployeeLastName,
    E.FirstName AS EmployeeFirstName,
    E.Title,
    E.Country AS EmployeeCountry
FROM Customer AS C
JOIN Employee AS E
ON C.SupportRepId = E.EmployeeId;



/*Exercise 4
Query the Customer_Support_View view to get a list of the names and surnames of the clients who were helped by an employee with the EmployeeId '3'.*/
SELECT FirstName,LastName,EmployeeId
FROM 
Customer_Support_View
WHERE EmployeeId ='3';

/*Exercise 5
Create an AGGREGATING view that counts the number of customers that are currently being serviced per country, called Customer_per_Country_View.
 We would like to see the country name and the number of customers in this view.*/
 CREATE VIEW ustomer_per_Country_View AS
SELECT Country,COUNT(CustomerId)AS ustomer_per_Country_View
FROM Chinook.Customer
GROUP  BY Country ;

/*Exercise 6
Write a query that returns the country with the most customers from Customer_per_Country_View.*/
SELECT * 
FROM Chinook.ustomer_per_Country_View
LIMIT 1;

/*Exercise 7
Write a query that will delete the Employee_View view.
Challenge question
Write a query that returns the number of customers that each support employee services, along with the name of the employee. Call this view Support_Person_Stats.
To do this, we will need to create a view, join the Customer and Employee tables, and use the COUNT and GROUP BY functions to aggregate the number of customers serviced by each employee*/





