     
     
     
       /*By the end of this lesson, you should be able to:
Integrate multiple tables into a combined analysis table 
Generate provincial and town-level insights 
Design a prioritized engineering action plan 
Use CASE logic and JOINs for operational decisions 
Populate a live progress table to guide field operations */

/*1. Are there any specific provinces, or towns where some sources are more abundant?
2. We identified that tap_in_home_broken taps are easy wins. Are there any towns where this is a particular problem?

To answer question 1, we will need province_name and town_name from the location table. 
We also need to know type_of_water_source and
number_of_people_served from the water_source table.
The problem is that the location table uses location_id while water_source only has source_id. So we won't be able to join these tables di-
rectly. But the visits table maps location_id and source_id. So if we use visits as the table we query from, we can join location where
the location_id matches, and water_source where the source_id matches.*/

USE  md_water_services ;

-- Start by joining location to visits.
SELECT LO.province_name,LO.town_name,V.visit_count,V.location_id
FROM location AS LO
INNER JOIN
visits AS V
ON LO.location_id = V.location_id ;

-- we can join the water_source table on the key shared between water_source and visits.
SELECT LO.province_name,
      LO.town_name,
      V.visit_count,
      V.location_id,
      WS.type_of_water_source,
      WS.number_of_people_served
FROM location AS LO
INNER JOIN
visits AS V
ON LO.location_id = V.location_id 
INNER JOIN water_source AS WS
ON V.source_id = WS.source_id;

/*Note that there are rows where visit_count > 1. These were the sites our surveyors collected additional information for, but they happened at the
same source/location. For example, add this to your query: WHERE visits.location_id = 'AkHa00103'*/

SELECT LO.province_name,
      LO.town_name,
      V.visit_count,
      V.location_id,
      WS.type_of_water_source,
      WS.number_of_people_served
FROM location AS LO
INNER JOIN
visits AS V
ON LO.location_id = V.location_id 
INNER JOIN water_source AS WS
ON V.source_id = WS.source_id
WHERE V.location_id = "AkHa00103" ;

-- Remove WHERE visits.location_id = 'AkHa00103' and add the visits.visit_count = 1 as a filter.
SELECT LO.province_name,
      LO.town_name,
      V.visit_count,
      V.location_id,
      WS.type_of_water_source,
      WS.number_of_people_served
FROM location AS LO
INNER JOIN
visits AS V
ON LO.location_id = V.location_id 
INNER JOIN water_source AS WS
ON V.source_id = WS.source_id
WHERE V.visit_count = 1 ;

-- Add the location_type column from location and time_in_queue from visits to our results set.
SELECT LO.province_name,
      LO.town_name,
      LO.location_type,
      V.visit_count,
      V.time_in_queue,
      V.location_id,
      WS.type_of_water_source,
      WS.number_of_people_served
FROM location AS LO
INNER JOIN
visits AS V
ON LO.location_id = V.location_id 
INNER JOIN water_source AS WS
ON V.source_id = WS.source_id
WHERE V.visit_count = 1 ;

/*Last one! Now we need to grab the results from the well_pollution table.
This one is a bit trickier. The well_pollution table contained only data for well. If we just use JOIN, we will do an INNER JOIN, so that only
records that are in well_pollution AND visits will be joined. We have to use a LEFT JOIN to join the results from the well_pollution table
for well sources, and will be NULL for all of the rest. Play around with the different JOIN operations to make sure you understand why we used LEFT
JOIN.*/
SELECT LO.province_name,
      LO.town_name,
      LO.location_type,
      V.visit_count,
      V.time_in_queue,
      V.location_id,
      WS.type_of_water_source,
      WS.number_of_people_served ,
      WP.results
FROM location AS LO
INNER JOIN
visits AS V
ON LO.location_id = V.location_id 
INNER JOIN water_source AS WS
ON V.source_id = WS.source_id
LEFT JOIN well_pollution AS WP
ON WP.source_id = V.source_id
WHERE V.visit_count = 1 ;

/*So this table contains the data we need for this analysis. Now we want to analyse the data in the results set. We can either create a CTE, and then
query it, or in my case, I'll make it a VIEW so it is easier to share with you. I'll call it the combined_analysis_table.*/
CREATE VIEW combined_analysis_table AS 
SELECT LO.province_name,
      LO.town_name,
      LO.location_type,
      V.visit_count,
      V.time_in_queue,
      V.location_id,
      WS.type_of_water_source,
      WS.number_of_people_served ,
      WP.results
FROM location AS LO
INNER JOIN
visits AS V
ON LO.location_id = V.location_id 
INNER JOIN water_source AS WS
ON V.source_id = WS.source_id
LEFT JOIN well_pollution AS WP
ON WP.source_id = V.source_id
WHERE V.visit_count = 1 ;





