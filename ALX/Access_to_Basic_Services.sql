 Use united_nations ;

-- Create a Summary Statistic Report in SQL
SELECT 
    Region,
    MIN(Pct_managed_drinking_water_services) AS Min_managed_drinking_water_services,
    MAX(Pct_managed_drinking_water_services) AS Max_Pct_managed_drinking_water_services,
    COUNT(DISTINCT Country_name) AS numbers_of_countries,
    round(SUM(Est_population_in_millions),2) AS Est_total_population_in_millions
FROM Access_to_Basic_Services
GROUP BY Region
ORDER BY Est_total_population_in_millions DESC ;


SELECT 
    Region,Time_period,
    MIN(Pct_managed_drinking_water_services) AS Min_managed_drinking_water_services,
    MAX(Pct_managed_drinking_water_services) AS Max_Pct_managed_drinking_water_services,
    COUNT(DISTINCT Country_name) AS numbers_of_countries,
    round(SUM(Est_population_in_millions),2) AS Est_total_population_in_millions
FROM Access_to_Basic_Services
WHERE Time_period = 2020 and Pct_managed_drinking_water_services <60
GROUP BY Region
HAVING numbers_of_countries  <10 
ORDER BY Est_total_population_in_millions DESC ;

-- change datatype in column "Time_period " to  decimal (6,2)
SELECT
    Region,
    Country_name,
    CAST(Time_period AS DECIMAL(6,2)) AS Time_period
FROM Access_to_Basic_Services;

-- clean data in column country name that has extra info
SELECT
    Country_name,
    POSITION('(' IN Country_name) AS position_opening_brackets,
    LENGTH(Country_name) AS length_of_string,
    RTRIM(LEFT(Country_name, POSITION('(' IN Country_name) - 1)) AS new_country_name,
    LENGTH(RTRIM(LEFT(Country_name, POSITION('(' IN Country_name) - 1))) AS new_length_string
FROM Access_to_Basic_Services
WHERE Country_name LIKE '%(%';

-- create new column ID from Country_name,Est_population_in_millions
SELECT DISTINCT
    Country_name,
    Time_period,
    Est_population_in_millions,
    CONCAT(
        SUBSTRING(IFNULL(UPPER(Country_name), 'UNKNOWN'),1,4),
        '_',
        IFNULL(Time_period, 'UNKNOWN'),
        '_',
        IFNULL(Pct_managed_sanitation_services, 'UNKNOWN')
    ) AS NEW_ID
FROM Access_to_Basic_Services;


