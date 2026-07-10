-- create new database 
    CREATE DATABASE united_nation;
    
    -- use united_nation database 
    USE united_nation  ;
    
    -- create new table " access to basic services "
    CREATE TABLE  access_to_basic_services  ( 
    Region varchar(45),
    subRegion varchar(45),
    country_name  varchar(30),
    time_priod int not null ,
    land_area  numeric(10,2)
    );
    -- change data type for column  time_priod to  datatime
    ALTER TABLE  access_to_basic_services
    MODIFY COLUMN time_priod DATETIME  ;
    
    -- show column info
SHOW COLUMNS
FROM access_to_basic_services
LIKE 'time_period';
    
    -- Check all column names and data types
    DESC access_to_basic_services;