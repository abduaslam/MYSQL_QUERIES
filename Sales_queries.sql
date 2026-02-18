SELECT * 
FROM 
sales

-- total number of sales 
SELECT COUNT(*) as total_sales
From
sales ;


-- Total quantity sold\
SELECT sum(quantity) as total_quantity
FROM sales

-- Average price 
SELECT avg(price) as average_price
FROM sales

-- Highest  price
SELECT max(price) as highest_price
FROM sales  ;

-- lowest price
SELECT min(price) as lowest_price
FROM sales

-- Total sales quantity for Electronics only
SELECT sum(quantity) as electrronic_sales 
FROM sales 
WHERE category="Electronics"

-- Average price in East region
SELECT avg(price) as avg_East 
FROM sales
WHERE region="East";

--  Total quantity sold per category 
SELECT category, sum(quantity) as total_quantity
FROM sales  
group by category

-- Total revenue per product
SELECT region, SUM(quantity * price) AS revenue
FROM sales
WHERE category = 'Furniture'
GROUP BY region

-- Top 3 products by total revenue
SELECT product ,sum(quantity * price) as revenue
FROM sales
GROUP BY product 
ORDER BY revenue DESC
LIMIT 3;

-- Top 3 products by quantity sold
SELECT product, sum(quantity) as quantity_sold
FROM sales 
GROUP BY product 
ORDER BY quantity_sold  DESC 
LIMIT 3;














