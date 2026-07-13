CREATE DATABASE Customers;
USE Customers;
-- Create the table
CREATE TABLE customer (
    customer_id VARCHAR(46),
    fname VARCHAR(24),
    lname VARCHAR(24),
    age INT,
    gender VARCHAR(10)
);

-- insert  values into custmer table
INSERT INTO customer(customer_id,fname,lname,age,gender)
VALUES ('1101','abbu','Yagoub',28,'male'),
       ('1102','omer','salim',25,'.male'),
       ('1103','sara','ahamed',30,'female');
       
SELECT  * FROM customer;

-- update values abdu age to 26
UPDATE customer 
set age=27
WHERE customer_id='1101';
select * from  customer
