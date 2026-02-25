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
    




