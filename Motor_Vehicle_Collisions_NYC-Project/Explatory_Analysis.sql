-- Doing some explatory analysis
-- Looking for Collision Trends
SELECT
    SUM(`NUMBER OF PERSONS INJURED`)      AS total_persons_injured,
    SUM(`NUMBER OF PERSONS KILLED`)       AS total_persons_killed,
    SUM(`NUMBER OF PEDESTRIANS INJURED`)  AS total_pedestrians_injured,
    SUM(`NUMBER OF PEDESTRIANS KILLED`)   AS total_pedestrians_killed,
    SUM(`NUMBER OF CYCLIST INJURED`)      AS total_cyclists_injured,
    SUM(`NUMBER OF CYCLIST KILLED`)       AS total_cyclists_killed,
    SUM(`NUMBER OF MOTORIST INJURED`)     AS total_motorists_injured,
    SUM(`NUMBER OF MOTORIST KILLED`)      AS total_motorists_killed
FROM motor_crashes_stages;

-- Calculate the total crashes per year and see if they’re increasing or decreasing.
SELECT
    YEAR(`CRASH DATE`) AS crash_year,
    SUM(`NUMBER OF PERSONS INJURED`)      AS total_persons_injured,
    SUM(`NUMBER OF PERSONS KILLED`)       AS total_persons_killed,
    SUM(`NUMBER OF PEDESTRIANS INJURED`)  AS total_pedestrians_injured,
    SUM(`NUMBER OF PEDESTRIANS KILLED`)   AS total_pedestrians_killed,
    SUM(`NUMBER OF CYCLIST INJURED`)      AS total_cyclists_injured,
    SUM(`NUMBER OF CYCLIST KILLED`)       AS total_cyclists_killed,
    SUM(`NUMBER OF MOTORIST INJURED`)     AS total_motorists_injured,
    SUM(`NUMBER OF MOTORIST KILLED`)      AS total_motorists_killed
FROM motor_crashes_stages
WHERE `CRASH DATE` IS NOT NULL
GROUP BY YEAR(`CRASH DATE`)
ORDER BY crash_year;


-- Break down crashes by borough to find which areas have the highest rates.

SELECT BOROUGH, 
    SUM(`NUMBER OF PERSONS INJURED`)      AS total_persons_injured,
    SUM(`NUMBER OF PERSONS KILLED`)       AS total_persons_killed,
    SUM(`NUMBER OF PEDESTRIANS INJURED`)  AS total_pedestrians_injured,
    SUM(`NUMBER OF PEDESTRIANS KILLED`)   AS total_pedestrians_killed,
    SUM(`NUMBER OF CYCLIST INJURED`)      AS total_cyclists_injured,
    SUM(`NUMBER OF CYCLIST KILLED`)       AS total_cyclists_killed,
    SUM(`NUMBER OF MOTORIST INJURED`)     AS total_motorists_injured,
    SUM(`NUMBER OF MOTORIST KILLED`)      AS total_motorists_killed
FROM motor_crashes_stages
WHERE BOROUGH IS NOT NULL
GROUP BY BOROUGH
ORDER BY BOROUGH;     

-- Break down crashes by borough and per year to find which areas have the highest rates.
SELECT YEAR(`CRASH DATE`) AS crash_year, BOROUGH,
    SUM(`NUMBER OF PERSONS INJURED`)      AS total_persons_injured,
    SUM(`NUMBER OF PERSONS KILLED`)       AS total_persons_killed,
    SUM(`NUMBER OF PEDESTRIANS INJURED`)  AS total_pedestrians_injured,
    SUM(`NUMBER OF PEDESTRIANS KILLED`)   AS total_pedestrians_killed,
    SUM(`NUMBER OF CYCLIST INJURED`)      AS total_cyclists_injured,
    SUM(`NUMBER OF CYCLIST KILLED`)       AS total_cyclists_killed,
    SUM(`NUMBER OF MOTORIST INJURED`)     AS total_motorists_injured,
    SUM(`NUMBER OF MOTORIST KILLED`)      AS total_motorists_killed
FROM motor_crashes_stages
WHERE BOROUGH IS NOT NULL AND `CRASH DATE` IS NOT NULL
GROUP BY YEAR(`CRASH DATE`), BOROUGH
ORDER BY crash_year, BOROUGH; 


-- Find the top 10 streets or intersections with the most collisions.
SELECT `ON STREET NAME`, 
    SUM(`NUMBER OF PERSONS INJURED`)      AS total_persons_injured,
    SUM(`NUMBER OF PERSONS KILLED`)       AS total_persons_killed,
    SUM(`NUMBER OF PEDESTRIANS INJURED`)  AS total_pedestrians_injured,
    SUM(`NUMBER OF PEDESTRIANS KILLED`)   AS total_pedestrians_killed,
    SUM(`NUMBER OF CYCLIST INJURED`)      AS total_cyclists_injured,
    SUM(`NUMBER OF CYCLIST KILLED`)       AS total_cyclists_killed,
    SUM(`NUMBER OF MOTORIST INJURED`)     AS total_motorists_injured,
    SUM(`NUMBER OF MOTORIST KILLED`)      AS total_motorists_killed
FROM motor_crashes_stages
WHERE `ON STREET NAME` IS NOT NULL
GROUP BY `ON STREET NAME`
ORDER BY total_persons_injured DESC;   

-- Investigates Contributing Factors
-- Count how often each contributing factor
-- (e.g., “Driver Behavior/Distraction,” “Vehicle Defect”) appears.

SELECT `CONTRIBUTING FACTOR VEHICLE 1`,
    SUM(`NUMBER OF PERSONS INJURED`)      AS total_persons_injured,
    SUM(`NUMBER OF PERSONS KILLED`)       AS total_persons_killed,
    SUM(`NUMBER OF PEDESTRIANS INJURED`)  AS total_pedestrians_injured,
    SUM(`NUMBER OF PEDESTRIANS KILLED`)   AS total_pedestrians_killed,
    SUM(`NUMBER OF CYCLIST INJURED`)      AS total_cyclists_injured,
    SUM(`NUMBER OF CYCLIST KILLED`)       AS total_cyclists_killed,
    SUM(`NUMBER OF MOTORIST INJURED`)     AS total_motorists_injured,
    SUM(`NUMBER OF MOTORIST KILLED`)      AS total_motorists_killed
FROM motor_crashes_stages
WHERE `CONTRIBUTING FACTOR VEHICLE 1` IS NOT NULL
GROUP BY `CONTRIBUTING FACTOR VEHICLE 1`;
  

 SELECT `CONTRIBUTING FACTOR VEHICLE 2`,
    SUM(`NUMBER OF PERSONS INJURED`)      AS total_persons_injured,
    SUM(`NUMBER OF PERSONS KILLED`)       AS total_persons_killed,
    SUM(`NUMBER OF PEDESTRIANS INJURED`)  AS total_pedestrians_injured,
    SUM(`NUMBER OF PEDESTRIANS KILLED`)   AS total_pedestrians_killed,
    SUM(`NUMBER OF CYCLIST INJURED`)      AS total_cyclists_injured,
    SUM(`NUMBER OF CYCLIST KILLED`)       AS total_cyclists_killed,
    SUM(`NUMBER OF MOTORIST INJURED`)     AS total_motorists_injured,
    SUM(`NUMBER OF MOTORIST KILLED`)      AS total_motorists_killed
FROM motor_crashes_stages
WHERE `CONTRIBUTING FACTOR VEHICLE 2` IS NOT NULL
GROUP BY `CONTRIBUTING FACTOR VEHICLE 2`;

 SELECT `CONTRIBUTING FACTOR VEHICLE 3`,
    SUM(`NUMBER OF PERSONS INJURED`)      AS total_persons_injured,
    SUM(`NUMBER OF PERSONS KILLED`)       AS total_persons_killed,
    SUM(`NUMBER OF PEDESTRIANS INJURED`)  AS total_pedestrians_injured,
    SUM(`NUMBER OF PEDESTRIANS KILLED`)   AS total_pedestrians_killed,
    SUM(`NUMBER OF CYCLIST INJURED`)      AS total_cyclists_injured,
    SUM(`NUMBER OF CYCLIST KILLED`)       AS total_cyclists_killed,
    SUM(`NUMBER OF MOTORIST INJURED`)     AS total_motorists_injured,
    SUM(`NUMBER OF MOTORIST KILLED`)      AS total_motorists_killed
FROM motor_crashes_stages
WHERE `CONTRIBUTING FACTOR VEHICLE 3` IS NOT NULL
GROUP BY `CONTRIBUTING FACTOR VEHICLE 3`;

 SELECT `CONTRIBUTING FACTOR VEHICLE 4`,
    SUM(`NUMBER OF PERSONS INJURED`)      AS total_persons_injured,
    SUM(`NUMBER OF PERSONS KILLED`)       AS total_persons_killed,
    SUM(`NUMBER OF PEDESTRIANS INJURED`)  AS total_pedestrians_injured,
    SUM(`NUMBER OF PEDESTRIANS KILLED`)   AS total_pedestrians_killed,
    SUM(`NUMBER OF CYCLIST INJURED`)      AS total_cyclists_injured,
    SUM(`NUMBER OF CYCLIST KILLED`)       AS total_cyclists_killed,
    SUM(`NUMBER OF MOTORIST INJURED`)     AS total_motorists_injured,
    SUM(`NUMBER OF MOTORIST KILLED`)      AS total_motorists_killed
FROM motor_crashes_stages
WHERE `CONTRIBUTING FACTOR VEHICLE 4` IS NOT NULL
GROUP BY `CONTRIBUTING FACTOR VEHICLE 4`;

 SELECT `CONTRIBUTING FACTOR VEHICLE 5`,
    SUM(`NUMBER OF PERSONS INJURED`)      AS total_persons_injured,
    SUM(`NUMBER OF PERSONS KILLED`)       AS total_persons_killed,
    SUM(`NUMBER OF PEDESTRIANS INJURED`)  AS total_pedestrians_injured,
    SUM(`NUMBER OF PEDESTRIANS KILLED`)   AS total_pedestrians_killed,
    SUM(`NUMBER OF CYCLIST INJURED`)      AS total_cyclists_injured,
    SUM(`NUMBER OF CYCLIST KILLED`)       AS total_cyclists_killed,
    SUM(`NUMBER OF MOTORIST INJURED`)     AS total_motorists_injured,
    SUM(`NUMBER OF MOTORIST KILLED`)      AS total_motorists_killed
FROM motor_crashes_stages
WHERE `CONTRIBUTING FACTOR VEHICLE 5` IS NOT NULL
GROUP BY `CONTRIBUTING FACTOR VEHICLE 5`;

-- To get a complete count of how often each contributing factor appears, 
-- combine all 5 columns into one result set using UNION ALL.
SELECT factor, COUNT(*) AS appearances
FROM (
    SELECT `CONTRIBUTING FACTOR VEHICLE 1` AS factor FROM motor_crashes_stages
    UNION ALL
    SELECT `CONTRIBUTING FACTOR VEHICLE 2` FROM motor_crashes_stages
    UNION ALL
    SELECT `CONTRIBUTING FACTOR VEHICLE 3` FROM motor_crashes_stages
    UNION ALL
    SELECT `CONTRIBUTING FACTOR VEHICLE 4` FROM motor_crashes_stages
    UNION ALL
    SELECT `CONTRIBUTING FACTOR VEHICLE 5` FROM motor_crashes_stages
) AS all_factors
WHERE factor IS NOT NULL
GROUP BY factor
ORDER BY appearances DESC;

-- by this query include injury and fatality counts 
SELECT factor,
    COUNT(*) AS times_appeared,
    SUM(`NUMBER OF PERSONS INJURED`)      AS total_persons_injured,
    SUM(`NUMBER OF PERSONS KILLED`)       AS total_persons_killed,
    SUM(`NUMBER OF PEDESTRIANS INJURED`)  AS total_pedestrians_injured,
    SUM(`NUMBER OF PEDESTRIANS KILLED`)   AS total_pedestrians_killed,
    SUM(`NUMBER OF CYCLIST INJURED`)      AS total_cyclists_injured,
    SUM(`NUMBER OF CYCLIST KILLED`)       AS total_cyclists_killed,
    SUM(`NUMBER OF MOTORIST INJURED`)     AS total_motorists_injured,
    SUM(`NUMBER OF MOTORIST KILLED`)      AS total_motorists_killed
FROM (
    SELECT `CONTRIBUTING FACTOR VEHICLE 1` AS factor,
           `NUMBER OF PERSONS INJURED`, `NUMBER OF PERSONS KILLED`,
           `NUMBER OF PEDESTRIANS INJURED`, `NUMBER OF PEDESTRIANS KILLED`,
           `NUMBER OF CYCLIST INJURED`, `NUMBER OF CYCLIST KILLED`,
           `NUMBER OF MOTORIST INJURED`, `NUMBER OF MOTORIST KILLED`
    FROM motor_crashes_stages
    UNION ALL
    SELECT `CONTRIBUTING FACTOR VEHICLE 2`, 
           `NUMBER OF PERSONS INJURED`, `NUMBER OF PERSONS KILLED`,
           `NUMBER OF PEDESTRIANS INJURED`, `NUMBER OF PEDESTRIANS KILLED`,
           `NUMBER OF CYCLIST INJURED`, `NUMBER OF CYCLIST KILLED`,
           `NUMBER OF MOTORIST INJURED`, `NUMBER OF MOTORIST KILLED`
    FROM motor_crashes_stages
    UNION ALL
    SELECT `CONTRIBUTING FACTOR VEHICLE 3`, 
           `NUMBER OF PERSONS INJURED`, `NUMBER OF PERSONS KILLED`,
           `NUMBER OF PEDESTRIANS INJURED`, `NUMBER OF PEDESTRIANS KILLED`,
           `NUMBER OF CYCLIST INJURED`, `NUMBER OF CYCLIST KILLED`,
           `NUMBER OF MOTORIST INJURED`, `NUMBER OF MOTORIST KILLED`
    FROM motor_crashes_stages
    UNION ALL
    SELECT `CONTRIBUTING FACTOR VEHICLE 4`, 
           `NUMBER OF PERSONS INJURED`, `NUMBER OF PERSONS KILLED`,
           `NUMBER OF PEDESTRIANS INJURED`, `NUMBER OF PEDESTRIANS KILLED`,
           `NUMBER OF CYCLIST INJURED`, `NUMBER OF CYCLIST KILLED`,
           `NUMBER OF MOTORIST INJURED`, `NUMBER OF MOTORIST KILLED`
    FROM motor_crashes_stages
    UNION ALL
    SELECT `CONTRIBUTING FACTOR VEHICLE 5`, 
           `NUMBER OF PERSONS INJURED`, `NUMBER OF PERSONS KILLED`,
           `NUMBER OF PEDESTRIANS INJURED`, `NUMBER OF PEDESTRIANS KILLED`,
           `NUMBER OF CYCLIST INJURED`, `NUMBER OF CYCLIST KILLED`,
           `NUMBER OF MOTORIST INJURED`, `NUMBER OF MOTORIST KILLED`
    FROM motor_crashes_stages
) AS combined_factors
WHERE factor IS NOT NULL
GROUP BY factor
ORDER BY times_appeared DESC;

-- Compare factors between boroughs 
-- (e.g., Is speeding more common in Queens than Manhattan?).
SELECT 
    YEAR(`CRASH DATE`) AS crash_year,
    borough,
    contributing_factor,
    COUNT(*) AS occurrences
FROM (
    SELECT BOROUGH, `CRASH DATE`, `CONTRIBUTING FACTOR VEHICLE 1` AS contributing_factor
    FROM motor_crashes_stages
    WHERE `CONTRIBUTING FACTOR VEHICLE 1` IS NOT NULL

    UNION ALL

    SELECT BOROUGH, `CRASH DATE`, `CONTRIBUTING FACTOR VEHICLE 2`
    FROM motor_crashes_stages
    WHERE `CONTRIBUTING FACTOR VEHICLE 2` IS NOT NULL

    UNION ALL

    SELECT BOROUGH, `CRASH DATE`, `CONTRIBUTING FACTOR VEHICLE 3`
    FROM motor_crashes_stages
    WHERE `CONTRIBUTING FACTOR VEHICLE 3` IS NOT NULL

    UNION ALL

    SELECT BOROUGH, `CRASH DATE`, `CONTRIBUTING FACTOR VEHICLE 4`
    FROM motor_crashes_stages
    WHERE `CONTRIBUTING FACTOR VEHICLE 4` IS NOT NULL

    UNION ALL

    SELECT BOROUGH, `CRASH DATE`, `CONTRIBUTING FACTOR VEHICLE 5`
    FROM motor_crashes_stages
    WHERE `CONTRIBUTING FACTOR VEHICLE 5` IS NOT NULL
) AS all_factors
WHERE BOROUGH IS NOT NULL
  AND YEAR(`CRASH DATE`) IN (2021)
  AND BOROUGH IN ('QUEENS', 'MANHATTAN')
GROUP BY crash_year, BOROUGH, contributing_factor
ORDER BY contributing_factor, occurrences DESC;


-- Injury & Fatality Analysis

-- Analyze the total number of people injured and killed by borough.
SELECT BOROUGH,
    SUM(`NUMBER OF PERSONS INJURED`) AS total_injured,
    SUM(`NUMBER OF PERSONS KILLED`) AS total_killed
FROM motor_crashes_stages
WHERE BOROUGH IS NOT NULL
GROUP BY BOROUGH
ORDER BY total_injured DESC;


-- Separate out pedestrians, cyclists, 
-- and motorists to see which groups are most affected.
SELECT BOROUGH,
    SUM(`NUMBER OF PEDESTRIANS INJURED`)     AS pedestrians_injured,
    SUM(`NUMBER OF PEDESTRIANS KILLED`)      AS pedestrians_killed,
    SUM(`NUMBER OF CYCLIST INJURED`)         AS cyclists_injured,
    SUM(`NUMBER OF CYCLIST KILLED`)          AS cyclists_killed,
    SUM(`NUMBER OF MOTORIST INJURED`)        AS motorists_injured,
    SUM(`NUMBER OF MOTORIST KILLED`)         AS motorists_killed
FROM motor_crashes_stages
WHERE BOROUGH IS NOT NULL
GROUP BY BOROUGH
ORDER BY BOROUGH;

-- Analyzing Vehicle Types
-- Determine which vehicle types are most often involved in crashes 
-- (e.g., Taxis, SUVs, Trucks, Mopeds).
SELECT vehicle_type, COUNT(*) AS total_involved
FROM (
    SELECT `VEHICLE TYPE CODE 1` AS vehicle_type FROM motor_crashes_stages WHERE `VEHICLE TYPE CODE 1` IS NOT NULL
    UNION ALL
    SELECT `VEHICLE TYPE CODE 2` FROM motor_crashes_stages WHERE `VEHICLE TYPE CODE 2` IS NOT NULL
    UNION ALL
    SELECT `VEHICLE TYPE CODE 3` FROM motor_crashes_stages WHERE `VEHICLE TYPE CODE 3` IS NOT NULL
    UNION ALL
    SELECT `VEHICLE TYPE CODE 4` FROM motor_crashes_stages WHERE `VEHICLE TYPE CODE 4` IS NOT NULL
    UNION ALL
    SELECT `VEHICLE TYPE CODE 5` FROM motor_crashes_stages WHERE `VEHICLE TYPE CODE 5` IS NOT NULL
) AS all_vehicle_types
GROUP BY vehicle_type
ORDER BY total_involved DESC;
   
-- Compare if certain vehicle types are linked to
-- more severe crashes (higher injury/fatality rates).
SELECT `VEHICLE TYPE CODE 1`,
    SUM(`NUMBER OF PERSONS INJURED`) AS total_injured,
    SUM(`NUMBER OF PERSONS KILLED`) AS total_killed
FROM  motor_crashes_stages
WHERE `VEHICLE TYPE CODE 1` IS NOT NULL
GROUP BY `VEHICLE TYPE CODE 1`;    