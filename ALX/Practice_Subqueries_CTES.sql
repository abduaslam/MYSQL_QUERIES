USE Northwind ;

/*xercise 1
Retrieve product details from products that have been ordered by customers from the UK.*/
SELECT *
FROM Products
WHERE ProductID IN (
    SELECT od.ProductID
    FROM OrderDetails od
    JOIN Orders o
        ON od.OrderID = o.OrderID
    JOIN Customers c
        ON o.CustomerID = c.CustomerID
    WHERE c.Country = 'UK'
);

/*Exercise 2
Find out the names of customers who have ordered products of more than the average order value.*/
SELECT DISTINCT c.CustomerID,
       c.CompanyName
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
JOIN OrderDetails od
    ON o.OrderID = od.OrderID
WHERE (od.UnitPrice * od.Quantity) >
      (
          SELECT AVG(UnitPrice * Quantity) as avg_order
          FROM OrderDetails
      );
/*Exercise 3
Write a CTE to find the most ordered product by each customer.*/
WITH most_ordered_products AS (
    SELECT customers.CustomerID, OrderDetails.ProductID, COUNT(*) AS order_count
    FROM customers
    JOIN orders ON customers.CustomerID = orders.CustomerID
    JOIN OrderDetails ON orders.OrderID = OrderDetails.OrderID
    GROUP BY customers.CustomerID, OrderDetails.ProductID
)
SELECT customers.CompanyName, products.ProductName, max_order_count
FROM (
    SELECT CustomerID, MAX(order_count) AS max_order_count
    FROM most_ordered_products
    GROUP BY CustomerID
) AS max_order_count
JOIN most_ordered_products ON max_order_count.CustomerID = most_ordered_products.CustomerID AND max_order_count.max_order_count = most_ordered_products.order_count
JOIN customers ON most_ordered_products.CustomerID = customers.CustomerID
JOIN products ON most_ordered_products.ProductID = products.ProductID;

/*Exercise 4
Using a CTE, list employees who have more than the average number of reports.*/

WITH avg_reports AS (
    SELECT AVG(report_count) AS average_count
    FROM (
        SELECT COUNT(*) AS report_count
        FROM employees
        JOIN employees AS reports ON employees.EmployeeID = reports.ReportsTo
        GROUP BY employees.EmployeeID
    ) AS report_counts
)
SELECT employees.*
FROM employees
JOIN employees AS reports ON employees.EmployeeID = reports.ReportsTo
GROUP BY employees.EmployeeID
HAVING COUNT(*) > (SELECT average_count FROM avg_reports);


