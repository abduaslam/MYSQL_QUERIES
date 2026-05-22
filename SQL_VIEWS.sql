SELECT * FROM SQL_Queries.retailsDataset;


-- 1. High-Value Customers
-- Create a temporary table that stores customers who spent more than $500.
-- -- Expected columns:
-- customer_id
-- total_spent
CREATE TEMPORARY TABLE spend_over_500 AS
SELECT
    CustomerID AS customer_id,
    SUM(Quantity * UnitPrice) AS total_spent
FROM SQL_Queries.retailsDataset
GROUP BY CustomerID
HAVING SUM(Quantity * UnitPrice) > 500;
SELECT * 
FROM spend_over_500;


-- 2. Expensive Products
-- Create a temporary table containing products with prices above the average product price.


-- 3. Recent Orders
-- Store all orders made in the last 30 days inside a temporary table.


-- 4. Top Selling Products
-- Create a temporary table showing the top 10 best-selling products.


-- 5. Employees in One Department
-- Create a temporary table for employees working in the Sales department.


-- 6. Monthly Revenue Summary
-- Create a temporary table that contains:
-- month
-- total_revenue
-- number_of_orders


-- 7. Customers With Multiple Orders
-- Create a temporary table of customers who placed more than 5 orders.

-- 8. Product Category Performance
-- Create a temporary table summarizing:
-- category
-- total_sales
-- average_price

-- 9. Duplicate Records Detection
-- Use a temporary table to identify duplicate customer emails or phone numbers.

-- 10. Low Stock Products
-- Create a temporary table for products whose stock quantity is below 10.


-- 11. Top Customers by Region
-- Create a temporary table storing the top 3 customers from each region based on sales.

-- 12. Daily Sales Trend
-- Create a temporary table that stores:
-- sale_date
-- daily_sales
-- previous_day_sales
-- difference


-- 13. Returning Customers
-- Create a temporary table for customers who made purchases in more than one month.

-- 14. Temporary Ranking Table
-- Create a temporary table ranking employees or products by revenue generated.

-- 15. ETL Workflow Practice
-- Step-by-step:
-- Create a temporary table with cleaned sales data
-- Remove null values
-- Aggregate total sales
-- Join with customer information
-- Produce a final report
-- Real Interview-Style Questions

-- 16. Highest Revenue Day
-- Use a temporary table to find the day with the highest total sales.

-- 17. Customer Segmentation
-- Create temporary tables for:
-- VIP customers
-- Regular customers
-- Inactive customers
-- based on purchase amount.

-- 18. Compare Current Month vs Previous Month
-- Use temporary tables to compare sales performance between two months.

-- 19. Average Order Value
-- Create a temporary table calculating:
-- customer_id
-- total_orders
-- total_spent
-- average_order_value
-- 20. Sales Dashboard Preparation

-- Use multiple temporary tables to prepare dashboard metrics such as:

-- total revenue
-- top products
-- best customers
-- monthly growth
-- Challenge Questions
-- 21.Can you create two temporary tables and join them together?

-- 22. Can you use a temporary table with:

-- JOIN
-- GROUP BY
-- HAVING
-- CASE WHEN
-- window functions?
-- 23. Can you replace a complex subquery using a temporary table?

-- 24 Create a temporary table and update some records inside it.

-- 25. Create a temporary table from another temporary table.

-- Example Structure
-- CREATE TEMPORARY TABLE temp_sales AS
-- SELECT customer_id,
--        SUM(total_amount) AS total_sales
-- FROM orders
-- GROUP BY customer_id;

-- Then query it:

-- SELECT *
-- FROM temp_sales
-- WHERE total_sales > 1000;