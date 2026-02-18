CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(50),
    product VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    order_date DATE,
    status VARCHAR(20)
);
-- Insert  data into order table;
INSERT INTO orders (customer_name, product, quantity, price, order_date, status) VALUES
('Customer_1','Laptop',2,1200,'2024-01-01','Delivered'),
('Customer_2','Phone',1,800,'2024-01-02','Shipped'),
('Customer_3','Tablet',3,450,'2024-01-03','Pending'),
('Customer_4','Monitor',2,300,'2024-01-04','Delivered'),
('Customer_5','Keyboard',5,40,'2024-01-05','Cancelled'),
('Customer_6','Laptop',1,1200,'2024-01-06','Delivered'),
('Customer_7','Phone',2,800,'2024-01-07','Pending'),
('Customer_8','Tablet',1,450,'2024-01-08','Delivered'),
('Customer_9','Monitor',3,300,'2024-01-09','Shipped'),
('Customer_10','Keyboard',4,40,'2024-01-10','Delivered'),

('Customer_11','Laptop',2,1200,'2024-01-11','Shipped'),
('Customer_12','Phone',1,800,'2024-01-12','Delivered'),
('Customer_13','Tablet',2,450,'2024-01-13','Pending'),
('Customer_14','Monitor',1,300,'2024-01-14','Cancelled'),
('Customer_15','Keyboard',3,40,'2024-01-15','Delivered'),

('Customer_16','Laptop',1,1200,'2024-01-16','Delivered'),
('Customer_17','Phone',2,800,'2024-01-17','Shipped'),
('Customer_18','Tablet',3,450,'2024-01-18','Delivered'),
('Customer_19','Monitor',2,300,'2024-01-19','Pending'),
('Customer_20','Keyboard',5,40,'2024-01-20','Delivered'),

-- DATA CONTINUES WITH SAME PATTERN
-- I’m grouping to stay readable

('Customer_21','Laptop',2,1200,'2024-01-21','Delivered'),
('Customer_22','Phone',1,800,'2024-01-22','Cancelled'),
('Customer_23','Tablet',2,450,'2024-01-23','Shipped'),
('Customer_24','Monitor',3,300,'2024-01-24','Delivered'),
('Customer_25','Keyboard',4,40,'2024-01-25','Pending'),

('Customer_26','Laptop',1,1200,'2024-01-26','Delivered'),
('Customer_27','Phone',2,800,'2024-01-27','Delivered'),
('Customer_28','Tablet',3,450,'2024-01-28','Shipped'),
('Customer_29','Monitor',1,300,'2024-01-29','Delivered'),
('Customer_30','Keyboard',5,40,'2024-01-30','Pending');

-- Show all columns 
SELECT * 
FROM  orders ;

-- Total revenue
SELECT sum(quantity * price) as total_revenue
FROM orders ;











