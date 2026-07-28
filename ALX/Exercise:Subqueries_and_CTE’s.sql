USE united_nations;

SELECT *
FROM
(SELECT Region,   
      Sub_region,
      Country_name,
      Pct_managed_drinking_water_services,
      Pct_managed_sanitation_services,
      Est_gdp_in_billions,
      AVG(Est_gdp_in_billions)  OVER(PARTITION BY Region  ORDER BY Est_population_in_millions DESC) AS avg_Est_gdp
FROM Access_to_Basic_Services 
WHERE  Region ='Sub-Saharan Africa' 
AND Time_period =2020)AS Regional_comparesion

WHERE Est_gdp_in_billions < avg_Est_gdp;


-- we can use the same query with CTEs

WITH  GDP_Est as(SELECT Region,   
      Sub_region,
      Country_name,
      Pct_managed_drinking_water_services,
      Pct_managed_sanitation_services,
      Est_gdp_in_billions,
      AVG(Est_gdp_in_billions)  OVER(PARTITION BY Region  ORDER BY Est_population_in_millions DESC) AS avg_Est_gdp
FROM Access_to_Basic_Services 
WHERE  Region ='Sub-Saharan Africa' 
AND Time_period =2020
AND Pct_managed_drinking_water_services <60)

SELECT * FROM GDP_Est
WHERE Est_gdp_in_billions < avg_Est_gdp;




































