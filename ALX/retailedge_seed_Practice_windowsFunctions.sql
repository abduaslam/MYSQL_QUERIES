SELECT * FROM customers;
 
-- Assign a unique row number to each order within its product category,
-- ordered by total order value (highest first)

SELECT
    p.category,
    o.order_id,
    o.customer_id,
    (o.quantity * o.unit_price) AS total_order_value,
    ROW_NUMBER() OVER (
        PARTITION BY p.category
        ORDER BY (o.quantity * o.unit_price) DESC
    ) AS row_num
FROM orders AS o
JOIN products AS p
    ON o.product_id = p.product_id;
    
--  
-- Rank customers according to their total spending

SELECT
    customer_id,
    total_spend,
    RANK() OVER (
        ORDER BY total_spend DESC
    ) AS customer_rank
FROM (
    SELECT
        customer_id,
        SUM(quantity * unit_price) AS total_spend
    FROM orders
    GROUP BY customer_id
) AS customer_totals
ORDER BY customer_rank;