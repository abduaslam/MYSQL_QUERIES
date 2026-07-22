USE foodhub ;

SELECT * FROM customers ;

-- Display raw customer names and cities
SELECT
    `name`,
    city
FROM customers;

-- Display raw restaurant names and cuisine types
SELECT
    name,
    cuisine
FROM restaurants;


-- Use UPPER() to convert customer names to uppercase for consistent formatting.
-- Use TRIM() to remove leading/trailing spaces, then LOWER() to standardize city names.
-- Use CONCAT() to combine the cleaned name and city into a single descriptive label.

SELECT
    -- Convert the customer name to uppercase
    UPPER(name) AS `Customer Name`,

    -- Remove extra spaces and convert the city to lowercase
    LOWER(TRIM(city)) AS `City`,

    -- Combine the cleaned name and cleaned city into a single label
    CONCAT(
        UPPER(name),
        ' — ',
        LOWER(TRIM(city))
    ) AS `Customer Label`

FROM customers;

-- Use CAST(order_id AS CHAR) so the numeric order ID can be concatenated with text.
-- Use CAST(quantity AS CHAR) so the numeric quantity can be displayed as part of the text label.
-- Use CAST(price AS CHAR) so the numeric price can be concatenated with the currency text.

SELECT
    CONCAT(
        'Order #',
        CAST(order_id AS CHAR),
        ': ',
        item_name,
        ' x',
        CAST(quantity AS CHAR),
        ' @ ',
        CAST(price AS CHAR),
        ' USD'
    ) AS `Order Summary`
FROM orders;


SELECT
    order_id,
    order_date,

    -- YEAR() extracts the year from the order_date.
    YEAR(order_date) AS `Year`,

    -- MONTH() extracts the month number from the order_date.
    MONTH(order_date) AS `Month`,

    -- DAY() extracts the day of the month from the order_date.
    DAY(order_date) AS `Day`,

    -- DATEDIFF() calculates the number of days between today and the order_date.
    DATEDIFF(CURDATE(), order_date) AS `Days Ago`,

    -- DATE_ADD() adds 3 days to the order_date to simulate an estimated delivery date.
    DATE_ADD(order_date, INTERVAL 3 DAY) AS `Est. Delivery`

FROM orders
ORDER BY order_date ASC;

/*  
Write a SQL query that returns order_id, item_name, quantity, and price, plus:
A column called 'Order Size' using IF() that returns 'Bulk Order' if quantity > 2, and 'Standard Order' otherwise.
A column called 'Value Tier' using IF() that returns 'High Value' if price > 20.00, and 'Regular' otherwise.
*/

SELECT * FROM orders ;
 SELECT order_id, 
        item_name, 
        quantity, price,
        IF(quantity>2,'Bulk Order','Standard Order') AS 'Order Size',
        IF(price > 20.00,'High Value','Regular') AS 'Value Tier'
 FROM orders;

/* Write a SQL query that returns restaurant name, cuisine, avg_rating, and a new column called 'Performance Label' using a CASE statement that assigns:
'Excellent' for avg_rating >= 4.5
'Good' for avg_rating >= 4.0 and < 4.5
'Acceptable' for avg_rating >= 3.5 and < 4.0
'Needs Improvement' for avg_rating < 3.5
Order results by avg_rating descending.*/

SELECT * FROM restaurants;

SELECT name, cuisine, avg_rating,
CASE 
    WHEN  avg_rating >= 4.5 THEN 'Excellent'
    WHEN avg_rating >= 4.0 and avg_rating< 4.5 THEN 'Good'
    WHEN avg_rating >= 3.5 and avg_rating < 4.0 THEN 'Acceptable'
END AS 'Performance Label'
FROM restaurants
ORDER BY avg_rating DESC;


/*
write a SQL query that:
Uses a CASE statement to classify each order into a 'Price Tier': 'Premium' for price > 20, 'Mid-Range' for price between 10 and 20, and 'Budget' for price below 10.
Groups the results by Price Tier using GROUP BY.
Returns the Price Tier, the total number of orders in that tier aliased as 'Total Orders', and the total revenue per tier (quantity * price) aliased as 'Total Revenue'.
 Round Total Revenue to 2 decimal places.
Orders the results by Total Revenue descending.
*/
SELECT * FROM orders ;
SELECT 
    CASE 
        WHEN price > 20 THEN 'Premium'
        WHEN price BETWEEN 10 AND 20 THEN 'Mid-Range'
        WHEN price < 10 THEN 'Budget'
    END AS `Price Tier`,

    COUNT(*) AS `Total Orders`,

    ROUND(SUM(quantity * price), 2) AS `Total Revenue`

FROM orders

GROUP BY 
    CASE 
        WHEN price > 20 THEN 'Premium'
        WHEN price BETWEEN 10 AND 20 THEN 'Mid-Range'
        WHEN price < 10 THEN 'Budget'
    END

ORDER BY `Total Revenue` DESC;









