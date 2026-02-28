SELECT * 
FROM world.country


--  count total records in this table
SELECT COUNT(*) as total_rows
FROM world.country;

-- Total population for each continent
SELECT Continent  ,sum(Population) as total_population
FROM world.country
GROUP BY Continent
ORDER BY total_population DESC;

-- total population in sudan 
SELECT Name ,Capital,Code,IndepYear,GovernmentForm ,sum(Population) as total_population
FROM  world.country
WHERE name ="sudan"
GROUP BY Name ,Capital,Code,IndepYear ,GovernmentForm ;

-- all populations in North America for each Region 
SELECT Region ,Population
FROM
world.country
WHERE Continent="North America";

-- 
SELECT Name ,Capital,Code,IndepYear,GovernmentForm ,sum(Population) as total_population
FROM  world.country
GROUP BY Name ,Capital,Code,IndepYear ,GovernmentForm ;

-- what are  LifeExpectancy,Population  in sudan 
	SELECT LifeExpectancy,Population,Continent
	FROM world.country
	WHERE Name ="Sudan" ;
    
    -- Which continent has highest populations
SELECT continent ,sum(population) as total_population
FROM world.country
GROUP BY  Continent
ORDER BY total_population DESC;

-- Countries with lowest life expectancy
SELECT Name, LifeExpectancy
FROM world.country
WHERE LifeExpectancy IS NOT NULL
ORDER BY LifeExpectancy ASC
LIMIT 10;

-- Top 10 richest countries by GNP

SELECT Name, GNP
FROM world.country
ORDER BY GNP DESC
LIMIT 10;

-- GNP per capita (real wealth indicator)
SELECT Name,
       GNP / Population AS gnp_per_capita
FROM world.country
WHERE Population > 0 AND GNP IS NOT NULL
ORDER BY gnp_per_capita DESC
LIMIT 10;
-- Average GNP by continent
SELECT Continent, AVG(GNP) AS avg_gnp
FROM world.country
GROUP BY Continent
ORDER BY avg_gnp DESC;
-- Countries that became independent after 1960
SELECT Name, IndepYear
FROM world.country
WHERE IndepYear >= 1960
ORDER BY IndepYear;

    




