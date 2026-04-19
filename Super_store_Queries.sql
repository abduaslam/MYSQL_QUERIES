SELECT * FROM superstore.super_store_dataset;

-- What is the total sales and total profit?
SELECT  sum(Sales) as total_sales,  SUM(Profit) as total_profit
FROM superstore.super_store_dataset;

-- What are sales by region / country / city?



-- What is the monthly or yearly revenue trend?
SELECT year(`Order Date`) AS year,month(`Order Date`)as month ,Sum(Profit) as Revenue 
FROM superstore.super_store_dataset
GROUP BY year ,month 
ORDER BY Revenue DESC

-- Which products generate the highest revenue?


-- Which products have low profit but high sales?


-- What are the top 10 best-selling products?







