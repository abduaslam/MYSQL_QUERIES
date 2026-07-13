CREATE DATABASE Bikes;
use Bikes;

-- Create bikes table
CREATE TABLE bikes (
    bike_id INT AUTO_INCREMENT,
    brand VARCHAR(100) NOT NULL,
    type VARCHAR(50) NOT NULL,
    daily_rental_rate DECIMAL(10,2) NOT NULL,
    availability_status ENUM('Available', 'Rented', 'Maintenance') DEFAULT 'Available',

    PRIMARY KEY (bike_id)
);

-- create customers table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT,
    full_name VARCHAR(150) NOT NULL,
    email_address VARCHAR(150) UNIQUE NOT NULL,
    date_of_birth DATE NOT NULL,

    PRIMARY KEY (customer_id)
);

-- create rentals table
CREATE TABLE rentals (
    rental_id INT AUTO_INCREMENT,
    customer_id INT NOT NULL,
    bike_id INT NOT NULL,
    start_date DATE NOT NULL,
    expected_return_date DATE NOT NULL,
    actual_return_date DATE,
    total_amount_charged DECIMAL(10,2),

    PRIMARY KEY (rental_id),
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (bike_id)
        REFERENCES bikes(bike_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
-- insert new vales into customers typle
INSERT INTO customers (full_name, email_address, date_of_birth)
VALUES
('John Smith', 'john.smith@gmail.com', '1995-04-15'),
('Maria Johnson', 'maria.johnson@gmail.com', '1998-09-22');

INSERT INTO customers (full_name, email_address, date_of_birth)
VALUES
('Ahmed Ali', 'ahmed.ali@gmail.com', '1995-06-12'),
('Sara Mohamed', 'sara.mohamed@gmail.com', '1998-03-25'),
('John Smith', 'john.smith@gmail.com', '1992-11-08'),
('Maria Johnson', 'maria.johnson@gmail.com', '2000-01-15'),
('David Brown', 'david.brown@gmail.com', '1996-09-30'),
('Omar Hassan', 'omar.hassan@gmail.com', '1994-07-20'),
('Emily Wilson', 'emily.wilson@gmail.com', '1997-12-05');


-- Insert values into bikes table
INSERT INTO bikes (brand, type, daily_rental_rate, availability_status)
VALUES
('Trek', 'Mountain Bike', 25.00, 'Available'),
('Giant', 'Road Bike', 30.00, 'Rented'),
('Scott', 'Hybrid Bike', 20.00, 'Available'),
('Cannondale', 'Electric Bike', 45.00, 'Maintenance'),
('Specialized', 'Mountain Bike', 35.00, 'Available');

-- insert new data into rentals table
INSERT INTO rentals 
(customer_id, bike_id, start_date, expected_return_date, actual_return_date, total_amount_charged)
VALUES
(1, 2, '2026-07-01', '2026-07-03', '2026-07-03', 90.00),
(2, 1, '2026-07-02', '2026-07-05', '2026-07-05', 75.00),
(3, 5, '2026-07-04', '2026-07-06', NULL, NULL),
(4, 3, '2026-07-05', '2026-07-07', '2026-07-07', 60.00),
(5, 4, '2026-07-06', '2026-07-08', NULL, NULL),
(6, 2, '2026-07-08', '2026-07-10', '2026-07-10', 60.00),
(7, 1, '2026-07-09', '2026-07-11', '2026-07-11', 50.00);

-- Update rental record with rental_id = 3
UPDATE rentals
SET 
    actual_return_date = CURDATE(),
    total_amount_charged = 37.50
WHERE rental_id = 3;

--
DELETE FROM rentals
WHERE customer_id = 7;










