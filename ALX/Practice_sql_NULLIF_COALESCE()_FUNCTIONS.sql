CREATE DATABASE sql_null_practice;
USE sql_null_practice;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    commission DECIMAL(10,2),
    manager_id INT,
    phone VARCHAR(20),
    email VARCHAR(50)
);
INSERT INTO employees VALUES
(1,'John','Smith','Sales',5000,500,NULL,101,'0781111111','john@gmail.com'),
(2,'Mary','Jones','HR',4200,NULL,NULL,102,NULL,'mary@gmail.com'),
(3,'David','Brown','IT',6500,800,300,NULL,'0783333333','david@gmail.com'),
(4,'Sarah','Wilson','Finance',5800,NULL,NULL,101,NULL,NULL),
(5,'James','Taylor','Sales',4700,400,NULL,NULL,'0785555555','james@gmail.com'),
(6,'Linda','White','IT',7200,NULL,500,103,NULL,'linda@gmail.com'),
(7,'Michael','Moore','Marketing',4300,NULL,NULL,NULL,NULL,NULL),
(8,'Emma','Thomas','HR',4600,250,NULL,102,'0788888888',NULL),
(9,'Daniel','Martin','Finance',6100,NULL,350,101,NULL,'daniel@gmail.com'),
(10,'Sophia','Lee','Sales',5300,NULL,NULL,NULL,'0799999999',NULL);