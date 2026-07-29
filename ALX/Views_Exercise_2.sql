USE Northwind ;

/*Exercise 1
Write a SQL statement to create a view named CustomerOrderView that shows the CustomerID, OrderID, and OrderDate from the Orders table, and CompanyName from the Customers table.*/
CREATE  VIEW CustomerOrderView  AS
SELECT o.CustomerID, o.OrderID, o.OrderDate, c.CompanyName
FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID ;


/*Exercise 2
Write a SQL query to retrieve all the data from the CustomerOrderView view.*/
SELECT * FROM CustomerOrderView ;

/*Exercise 3
 a SQL statement to update the CustomerOrderView view to separate the OrderDate column into two different date and time columns named OrderDateOnly and OrderTimeOnly respectively.*/
CREATE OR REPLACE VIEW CustomerOrderView AS
SELECT o.CustomerID,
       o.OrderID,
       DATE(o.OrderDate) AS OrderDateOnly,
       TIME(o.OrderDate) AS OrderTimeOnly,
       c.CompanyName
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID;

/*Exercise 4
Write a SQL query to retrieve all the data from the updated CustomerOrderView view.*/
SELECT * FROM CustomerOrderView ;
