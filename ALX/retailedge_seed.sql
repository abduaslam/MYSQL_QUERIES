USE retailedge ;
-- 1. What is the total revenue generated across all orders? (revenue = quantity * unit_price)
SELECT 
      SUM(quantity * unit_price) AS total_reveenue 
FROM 
      orders ;

-- 2.What is the average discount applied across all orders?
SELECT 
     AVG(discount) AS avg_dicount
FROM 
    orders ;
    
-- 3. What is the largest single order quantity recorded?
SELECT
     MAX(quantity) AS largest_qunintity
FROM orders;

-- 4. How many orders have been placed in total?
SELECT COUNT(*)
FROM orders ;

