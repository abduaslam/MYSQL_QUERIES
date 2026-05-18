CREATE DATABASE SQL_Queries ;

-- Find all orders where the Category = 'Furniture' AND Profit > 100.
SELECT * FROM SQL_Queries.Sample_Superstore
WHERE Category='Furniture' AND Profit>100 ;

-- List orders where the Segment = 'Consumer' OR Segment = 'Home Office'
SELECT * FROM  SQL_Queries.Sample_Superstore
WHERE Segment IN('Cousumer','Home office');

-- Retrieve all orders where the Category is NOT 'Technology'.
SELECT * FROM SQL_Queries.Sample_Superstore
WHERE NOT Category ='Technology'
