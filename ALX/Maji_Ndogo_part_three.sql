
USE md_water_services ;
  /*by the end this activity I havee to know :
Interpret database relationships using ERDs
Integrate external audit data
Identify data discrepancies using joins
Trace inconsistencies to specific actors
Use data to support evidence-based conclusions */

-- Integrating the Auditor's report
DROP TABLE IF EXISTS `auditor_report`;
CREATE TABLE `auditor_report` (
`location_id` VARCHAR(32),
`type_of_water_source` VARCHAR(64),
`true_water_source_score` int DEFAULT NULL,
`statements` VARCHAR(255));


/*We need to tackle a couple of questions here.
1. Is there a difference in the scores?
2. If so, are there patterns?

For the first question, we will have to compare the quality scores in the water_quality table to the auditor's scores. The auditor_report table
used location_id, but the quality scores table only has a record_id we can use. The visits table links location_id and record_id, so we
can link the auditor_report table and water_quality using the visits table.*/

SELECT  WR.source_id,AR.true_water_source_score
FROM water_source WR
INNER JOIN auditor_report AR
ON AR.location_id = WR.source_id ;







