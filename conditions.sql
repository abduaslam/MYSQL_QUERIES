CREATE DATABASE SQL_Queries ;

-- Find all orders where the Category = 'Furniture' AND Profit > 100.
SELECT * FROM SQL_Queries.Sample_Superstore
WHERE Category='Furniture' AND Profit>100 ;

-- List orders where the Segment = 'Consumer' OR Segment = 'Home Office'
SELECT * FROM  SQL_Queries.Sample_Superstore
WHERE Segment IN('Cousumer','Home office');

-- Retrieve all orders where the Category is NOT 'Technology'.
SELECT * FROM SQL_Queries.Sample_Superstore
WHERE NOT Category ='Technology';

-- Show orders where Sales BETWEEN 500 AND 1000 
SELECT * FROM  SQL_Queries.Sample_Superstore
WHERE Sales BETWEEN 500 AND  1000 
ORDER BY Sales desc;

-- Get all orders placed BETWEEN '2019-01-01' AND '2019-12-31'
SELECT * FROM SQL_Queries.Sample_Superstore
WHERE `Order Date` BETWEEN '2019-01-01' AND '2019-11-20';

-- Find orders where (Category = 'Office Supplies' OR Category = 'Furniture') AND Profit > 50
SELECT *  FROM SQL_Queries.Sample_Superstore
WHERE (Category = 'Office Supplies' OR Category = 'Furniture') AND Profit > 50