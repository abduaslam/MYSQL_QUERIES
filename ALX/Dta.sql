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










