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

-- What is the total quantity sold per product category?
SELECT
    p.category AS product_category,
    SUM(o.quantity) AS total_quantity_sold
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY p.category;

-- 5. What is the average unit price per category?
SELECT
    category AS product_category,
    AVG(unit_price) AS average_unit_price
FROM products
GROUP BY category;

-- 6. How many orders has each customer placed?
 SELECT customer_id, COUNT(quantity) AS number_of_customer_placed
 FROM orders 
GROUP BY customer_id ;

-- calculates the total quantity sold for each product category and product name?
SELECT
    p.category AS product_category,
    p.name AS product_name,
    SUM(o.quantity) AS total_quantity_sold
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY
    p.category,
    p.name
ORDER BY
    p.category,
    total_quantity_sold DESC;
