-- Exercise 1
-- Rank all the orders of a specific customer from the most recent to the least recent using window functions. Assume that the customer ID is 'ALFKI'.
SELECT OrderID,CustomerID,OrderDate,
ROW_NUMBER() OVER(ORDER BY OrderDate DESC) AS Order_rank
FROM Orders
WHERE CustomerID = 'ALFKI';

-- Exercise 2
-- Calculate a running total of the quantity of orders using window functions.

SELECT 
    OrderID, 
    Quantity, 
    SUM(Quantity) OVER (ORDER BY OrderID) AS RunningTotal 
FROM 
    OrderDetails;

-- Exercise 3
-- Use window functions to find the difference in successive order dates for each customer. Use the appropriate MySQL date-difference function to calculate the number of days between the current order date and the previous one.
SELECT 
    CustomerID, 
    OrderDate, 
    LAG(OrderDate, 1) OVER 
        (PARTITION BY CustomerID 
        ORDER BY OrderDate) AS PrevOrderDate, 
    TIMESTAMPDIFF(
        DAY,
        LAG(OrderDate, 1) OVER (PARTITION BY CustomerID ORDER BY OrderDate),
        OrderDate
    ) AS DateDiff
FROM 
    Orders;

-- Exercise 4
-- Calculate the moving average of the quantity of the last 3 orders for each product using window functions.

