CREATE DATABASE TransectionTrends ;

SELECT * FROM transectiontrends.shopping_trends;


SELECT COUNT(`Customer ID`)
FROM  transectiontrends.shopping_trends;

-- Customer Who spend more than $50 
	SELECT  `Customer ID`, count(`Purchase Amount (USD)`) 
   FROM  transectiontrends.shopping_trends
   WHERE `Purchase Amount (USD)`  >50