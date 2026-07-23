       -- Part 3: Data Integrity and Investigation(Maji Ndogo)
 /*1.Apply string manipulation functions to clean and update employee data
2.Aggregate and analyze water source distribution across locations
3.Rank water sources using window functions to prioritize interventions
4.Construct pivot tables using CASE statements to analyze queue patterns
5.Synthesize data insights into actionable solutions for infrastructure improvement*/
USE md_water_services;

SELECT  * FROM employee;

-- Replace space between employee name with ".";
SELECT REPLACE( employee_name ,' ','.')
FROM employee ;

-- remove extra space 
SELECT TRIM(REPLACE( employee_name ,' ','.'))
FROM employee ;

-- Change to lowercase
SELECT TRIM(LOWER(REPLACE( employee_name ,' ','.')))
FROM employee ;

-- We then use CONCAT() to add the rest of the email address:
SELECT CONCAT( TRIM(LOWER(REPLACE( employee_name ,' ','.'))),'@ndogowater.gov') AS new_email 
FROM employee ;

/*there is a space at the end of the number! If you try to send an automated SMS to that number it will fail. This happens so often
that they create a function, especially for trimming off the space, called TRIM(column).
It removes any leading or trailing spaces from a string.*/

SELECT phone_number AS `phone number`,
       LENGTH(phone_number) AS Number_of_strings,
       TRIM(phone_number) AS new_phone
FROM employee ;

/* Use the employee table to count how many of our employees live in each town. Think carefully about what function we should use and how we
should aggregate the data.*/
SELECT town_name,COUNT(assigned_employee_id) AS Total_employee_in_town
FROM employee
GROUP BY town_name
ORDER BY Total_employee_in_town DESC ;


/*Let's first look at the number of records each employee collected. So find the correct table, figure out what function to use and how to group, order
and limit the results to only see the top 3 employee_ids with the highest number of locations visited.*/

SELECT assigned_employee_id, COUNT(visit_count) AS assigned_employee_id
FROM visits
GROUP BY assigned_employee_id
ORDER BY assigned_employee_id 
LIMIT 3;

/*Analysing locations
Looking at the location table, let’s focus on the province_name, town_name and location_type to understand where the water sources are in
Maji Ndogo.*/

-- Create a query that counts the number of records per town
SELECT town_name ,COUNT(location_id) AS `records per town`
FROM location
GROUP BY town_name
ORDER BY   `records per town` DESC ;

-- Now count the records per province.
SELECT province_name ,COUNT(location_id) AS `records per province`
FROM location
GROUP BY province_name
ORDER BY    `records per province` DESC ;

/*1. Create a result set showing:
• province_name
• town_name
• An aggregated count of records for each town (consider naming this 1. Create a result set showing:
• province_name
• town_name
• An aggregated count of records for each town (consider naming this records_per_town).
• Ensure your data is grouped by both province_name and town_name.
2. Order your results primarily by province_name. Within each province, further sort the towns by their record counts in descending order.).
• Ensure your data is grouped by both province_name and town_name.
2. Order your results primarily by province_name. Within each province, further sort the towns by their record counts in descending order.
*/
SELECT province_name,town_name,COUNT(location_id) AS records_per_town
FROM location
GROUP BY province_name,town_name
ORDER BY province_name DESC;

-- Finally, look at the number of records for each location type
SELECT location_type,COUNT(location_id)
FROM location
GROUP BY location_type ;
-- Percentages are more relatable.If we use SQL as a very overpowered calculator:
SELECT 23740 / (15910 + 23740) * 100;


            -- Diving into the sources
-- Ok, water_source is a big table, with lots of stories to tell, so strap in!


/*These are the questions that I am curious about.
1. How many people did we survey in total?
2. How many wells, taps and rivers are there?
3. How many people share particular types of water sources on average?
4. How many people are getting water from each type of source?
*/
-- . How many people did we survey in total?
SELECT COUNT(*)  AS People_surved FROM water_source;

-- 2. How many wells, taps and rivers are there?
SELECT type_of_water_source , COUNT(number_of_people_served) as num_of_People
FROM water_source
GROUP BY type_of_water_source
ORDER BY num_of_People DESC ;

-- 3. How many people share particular types of water sources on average?
SELECT
    type_of_water_source,
    AVG(number_of_people_served) AS Avg_people_shared
FROM water_source
GROUP BY type_of_water_source;


  -- What is the average number of people that are served by each water source? Remember to make the numbers easy to read.
SELECT
    type_of_water_source,
    ROUND(AVG(number_of_people_served), 0) AS avg_people_served
FROM water_source
GROUP BY type_of_water_source;

-/*calculate the total number of people served by each type of water source in total, 
to make it easier to interpret, order them so the most
people served by a source is at the top*/

SELECT
    type_of_water_source,
    SUM(number_of_people_served) AS total_people_served
FROM water_source
GROUP BY type_of_water_source
ORDER BY total_people_served DESC;

-- calculate the percentage
SELECT
    type_of_water_source,
    total_people_served,
    ROUND(
        (total_people_served * 100.0) /
        SUM(total_people_served) OVER (),
        2
    ) AS percentage_of_total
FROM (
    SELECT
        type_of_water_source,
        SUM(number_of_people_served) AS total_people_served
    FROM water_source
    GROUP BY type_of_water_source
) AS totals
ORDER BY total_people_served DESC;


                      /*Start of a solution
At some point, we will have to fix or improve all of the infrastructure, so we should start thinking about how we can make a data-driven decision
how to do it. I think a simple approach is to fix the things that affect most people first. So let's write a query that ranks each type of source based
on how many people in total use it. RANK() should tell you we are going to need a window function to do this, so let's think through the problem.*/
   
   
 --   We will need the following columns:
--  Type of sources 
--  Total people served grouped by the types 
--  A rank based on the total people served, grouped by the types 

  -- window function on the total people served column, converting it into a rank
 SELECT
    type_of_water_source,
    total_people_served,
    RANK() OVER (ORDER BY total_people_served DESC) AS rank_by_people_served
FROM (
    SELECT
        type_of_water_source,
        SUM(number_of_people_served) AS total_people_served
    FROM water_source
    GROUP BY type_of_water_source
) AS totals
ORDER BY rank_by_people_served;

         /*
         create a query to do this, and keep these requirements in mind:
1. The sources within each type should be assigned a rank.
2. Limit the results to only improvable sources.
3. Think about how to partition, filter and order the results set.
4. Order the results to see the top of the list.
         */
SELECT source_id,
       type_of_water_source,
       number_of_people_served,
      RANK() OVER (
        PARTITION BY type_of_water_source
        ORDER BY number_of_people_served DESC
    ) AS rank_each_type 
FROM water_source
WHERE type_of_water_source IN ('river','shared_taps');


/*
Analysing queues
Ok, this is the really big, and last table we'll look at this time. The analysis is going to be a bit tough, but the results will be worth it, so stretch out

Ok, these are some of the things I think are worth looking at:
1. How long did the survey take?
2. What is the average total queue time for water?
3. What is the average queue time on different days?
4. How can we communicate this information efficiently?
*/

-- 1. How long did the survey take?
SELECT
    MIN(time_of_record) AS survey_start,
    MAX(time_of_record) AS survey_end,
    DATEDIFF(MAX(time_of_record), MIN(time_of_record)) AS survey_duration_days
FROM visits;

-- What is the average total queue time for water?
SELECT
    AVG(time_in_queue) AS avg_queue_time
FROM visits;

-- 3.

-- look at the queue times aggregated across the different days of the week.
SELECT
    DAYNAME(time_of_record) AS day_of_week,
    AVG(time_in_queue) AS avg_queue_time
FROM visits
GROUP BY DAYNAME(time_of_record)
ORDER BY avg_queue_time DESC;

-- We can also look at what time during the day people collect water. Try to order the results in a meaningful way.?
SELECT
    HOUR(time_of_record) AS hour_of_day,
    AVG(time_in_queue) AS avg_queue_time
FROM visits
GROUP BY HOUR(time_of_record)
ORDER BY hour_of_day;













































