CREATE DATABASE TransectionTrends ;

SELECT * FROM transectiontrends.shopping_trends;


SELECT COUNT(`Customer ID`)
FROM  transectiontrends.shopping_trends;

-- Customer Who spend more than $50 
SELECT count(*) FROM transectiontrends.shopping_trends
WHERE  `Purchase Amount (USD)` > 50;

-- Purchases in Winter
SELECT * FROM transectiontrends.shopping_trends
WHERE Season ="Winter"