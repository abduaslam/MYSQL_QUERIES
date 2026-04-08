CREATE DATABASE TransectionTrends ;

SELECT * FROM transectiontrends.shopping_trends;


SELECT COUNT(`Customer ID`)
FROM  transectiontrends.shopping_trends;

-- Customer Who spend more than $50 
SELECT count(*) FROM transectiontrends.shopping_trends
WHERE  `Purchase Amount (USD)` > 50;

-- Purchases in Winter
SELECT * FROM transectiontrends.shopping_trends
WHERE Season ="Winter" ;

-- Total revenue
SELECT SUM(`Purchase Amount (USD)`) as Total_revenue 
FROM transectiontrends.shopping_trends ;

-- Average purchase amount
SELECT avg(`Purchase Amount (USD)`) as Avrage_amount
FROM transectiontrends.shopping_trends ;

-- Total sales by category
SELECT Category , sum(`Purchase Amount (USD)`) as Total_sales
FROM transectiontrends.shopping_trends 
GROUP BY Category 
ORDER BY Total_sales desc;

-- Average rating by item
SELECT `Item Purchased`, avg(`Review Rating`) as avg_rating
FROM transectiontrends.shopping_trends 
GROUP BY `Item Purchased`
ORDER BY avg_rating DESC ;

-- Which payment method is most used?
SELECT `Payment Method`, COUNT(*) as most_used
FROM transectiontrends.shopping_trends 
GROUP BY `Payment Method`
ORDER BY most_used DESC ;

-- Do discounts increase purchases?
SELECT `Discount Applied` , AVG(`Purchase Amount (USD)`) as Increase_purchease
FROM transectiontrends.shopping_trends 
GROUP BY  `Discount Applied`;

-- Top 5 customers by spending
SELECT `Customer ID`,sum(`Purchase Amount (USD)`) as top_spending
FROM transectiontrends.shopping_trends 
GROUP BY `Customer ID`
ORDER BY top_spending DESC
LIMIT 5 ;

-- Customers with subscriptions vs without
SELECT `Subscription Status`, COUNT(*) as Total_customers
FROM transectiontrends.shopping_trends 
GROUP BY `Subscription Status`




