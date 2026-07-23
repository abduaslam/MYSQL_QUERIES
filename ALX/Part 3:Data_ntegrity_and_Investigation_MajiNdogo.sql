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
   TIME_FORMAT(TIME(time_of_record), '%H:00') AS hour_of_day_addFormat,
    AVG(time_in_queue) AS avg_queue_time
FROM visits
GROUP BY  HOUR(time_of_record),
TIME_FORMAT(TIME(time_of_record), '%H:00') 
ORDER BY hour_of_day;


/*To filter a row we use WHERE, but using CASE() in SELECT can filter columns. We can use a CASE() function for each day to separate the queue
time column into a column for each day. Let’s begin by only focusing on Sunday. So, when a row's DAYNAME(time_of_record) is Sunday, we
make that value equal to time_in_queue, and NULL for any days.*/

SELECT
TIME_FORMAT(TIME(time_of_record), '%H:00') AS hour_of_day,
DAYNAME(time_of_record),
CASE
WHEN DAYNAME(time_of_record) = 'Sunday' THEN time_in_queue
ELSE NULL
END AS Sunday
FROM
visits
WHERE
time_in_queue != 0; -- this exludes other sources with 0 queue times.



-- 
SELECT
    TIME_FORMAT(TIME(time_of_record), '%H:00') AS hour_of_day,

    ROUND(AVG(
        CASE
            WHEN DAYNAME(time_of_record) = 'Sunday'
            THEN time_in_queue
        END
    ), 0) AS Sunday,

    ROUND(AVG(
        CASE
            WHEN DAYNAME(time_of_record) = 'Monday'
            THEN time_in_queue
        END
    ), 0) AS Monday,

    ROUND(AVG(
        CASE
            WHEN DAYNAME(time_of_record) = 'Tuesday'
            THEN time_in_queue
        END
    ), 0) AS Tuesday,

    ROUND(AVG(
        CASE
            WHEN DAYNAME(time_of_record) = 'Wednesday'
            THEN time_in_queue
        END
    ), 0) AS Wednesday,

    ROUND(AVG(
        CASE
            WHEN DAYNAME(time_of_record) = 'Thursday'
            THEN time_in_queue
        END
    ), 0) AS Thursday,

    ROUND(AVG(
        CASE
            WHEN DAYNAME(time_of_record) = 'Friday'
            THEN time_in_queue
        END
    ), 0) AS Friday,

    ROUND(AVG(
        CASE
            WHEN DAYNAME(time_of_record) = 'Saturday'
            THEN time_in_queue
        END
    ), 0) AS Saturday

FROM visits
WHERE time_in_queue != 0
GROUP BY hour_of_day
ORDER BY hour_of_day;



/*Water Accessibility and infrastructure summary report
This survey aimed to identify the water sources people use and determine both the total and average number of users for each source.
Additionally, it examined the duration citizens typically spend in queues to access water.
So let's create a short summary report we can send off to Pres. Naledi:

Insights
1. Most water sources are rural.
2. 43% of our people are using shared taps. 2000 people often share one tap.
3. 31% of our population has water infrastructure in their homes, but within that group, 45% face non-functional systems due to issues with pipes,
pumps, and reservoirs.
4. 18% of our people are using wells of which, but within that, only 28% are clean..
5. Our citizens often face long wait times for water, averaging more than 120 minutes.
6. In terms of queues:
- Queues are very long on Saturdays.
- Queues are longer in the mornings and evenings.
- Wednesdays and Sundays have the shortest queues.*/

/*Start of our plan
We have started thinking about a plan:
1. We want to focus our efforts on improving the water sources that affect the most people.
- Most people will benefit if we improve the shared taps first.
- Wells are a good source of water, but many are contaminated. Fixing this will benefit a lot of people.
- Fixing existing infrastructure will help many people. If they have running water again, they won't have to queue, thereby shorting queue times for
others. So we can solve two problems at once.
- Installing taps in homes will stretch our resources too thin, so for now, if the queue times are low, we won't improve that source.
2. Most water sources are in rural areas. We need to ensure our teams know this as this means they will have to make these repairs/upgrades in
rural areas where road conditions, supplies, and labour are harder challenges to overcome.*/

/*Practical solutions
1. If communities are using rivers, we can dispatch trucks to those regions to provide water temporarily in the short term, while we send out
crews to drill for wells, providing a more permanent solution.
2. If communities are using wells, we can install filters to purify the water. For wells with biological contamination, we can install UV filters that
kill microorganisms, and for *polluted wells*, we can install reverse osmosis filters. In the long term, we need to figure out why these sources
are polluted.
3. For shared taps, in the short term, we can send additional water tankers to the busiest taps, on the busiest days. We can use the queue time
pivot table we made to send tankers at the busiest times. Meanwhile, we can start the work on installing extra taps where they are needed.
According to UN standards, the maximum acceptable wait time for water is 30 minutes. With this in mind, our aim is to install taps to get
queue times below 30 min.
4. Shared taps with short queue times (< 30 min) represent a logistical challenge to further reduce waiting times. The most effective solution,
installing taps in homes, is resource-intensive and better suited as a long-term goal.
5. Addressing broken infrastructure offers a significant impact even with just a single intervention. It is expensive to fix, but so many people
can benefit from repairing one facility. For example, fixing a reservoir or pipe that multiple taps are connected to. We will have to find the
commonly affected areas though to see where the problem actually is.*





































