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








