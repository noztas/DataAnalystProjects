DROP TABLE IF EXISTS motor_crashes_stages;

-- Recreate Stage Table from Original
CREATE TABLE motor_crashes_stages
LIKE motor_vehicle_collisions_crashes;

INSERT INTO motor_crashes_stages
SELECT *
FROM motor_vehicle_collisions_crashes;

-- update the date format and change the type in the table
UPDATE motor_crashes_stages
SET `CRASH DATE` = STR_TO_DATE(`CRASH DATE`, '%m/%d/%Y')
WHERE `CRASH DATE` LIKE '__/__/____';

-- now can convert the data type properly
ALTER TABLE motor_crashes_stages
MODIFY COLUMN `CRASH DATE` DATE;

-- Standardize Missing Values
SELECT DISTINCT BOROUGH
FROM motor_crashes_stages;

UPDATE motor_crashes_stages
SET BOROUGH = NULL
WHERE BOROUGH = '';

SELECT DISTINCT `ZIP CODE`
FROM motor_crashes_stages;

UPDATE motor_crashes_stages
SET `ZIP CODE` = NULL
WHERE `ZIP CODE` = '';

SELECT DISTINCT `ON STREET NAME`
FROM motor_crashes_stages;

UPDATE motor_crashes_stages 
SET `ON STREET NAME` = UPPER(TRIM(`ON STREET NAME`));

UPDATE motor_crashes_stages 
SET `ON STREET NAME` = NULL
WHERE `ON STREET NAME` = '';

SELECT DISTINCT LOCATION, COUNT(*)
FROM motor_crashes_stages
GROUP BY LOCATION;

UPDATE motor_crashes_stages
SET LOCATION = NULL
WHERE LOCATION = '' OR LOCATION = '(0.0, 0.0)';

UPDATE motor_crashes_stages
SET LATITUDE = NULL, LONGITUDE = NULL
WHERE LATITUDE = 0 OR LONGITUDE = 0;

SELECT DISTINCT `CROSS STREET NAME`
FROM motor_crashes_stages;

UPDATE motor_crashes_stages
SET `CROSS STREET NAME` = UPPER(TRIM(`CROSS STREET NAME`));

UPDATE motor_crashes_stages 
SET `CROSS STREET NAME` = NULL
WHERE `CROSS STREET NAME` = '';

SELECT DISTINCT `OFF STREET NAME`
FROM motor_crashes_stages;

UPDATE motor_crashes_stages
SET `OFF STREET NAME` = UPPER(TRIM(`OFF STREET NAME`));

UPDATE motor_crashes_stages 
SET `OFF STREET NAME` = NULL
WHERE `OFF STREET NAME` = '';

-- Standardize Vehicle Type Codes
SELECT DISTINCT `VEHICLE TYPE CODE 1`
FROM motor_crashes_stages
ORDER BY `VEHICLE TYPE CODE 1`;

UPDATE motor_crashes_stages
SET `VEHICLE TYPE CODE 1` = 'Truck'
WHERE TRIM(`VEHICLE TYPE CODE 1`) IN (
  'Box Truck', 'Armored Truck', 'Beverage Truck', 'Dump', 'Concrete Mixer',
  'Commercial', 'Chassis Cab', 'Com', 'Tow Truck', 'Tow Truck / Wrecker', 
  'Tractor Truck Diesel', 'USPS truck', 'Pick-up Truck', 'Trailer', 'Flat Bed',
  'Flat Rack', 'Garbage or Refuse', 'Tanker', 'Semi Trail', 'Open Body', 'Lunch Wagon',
  'PK', 'Garbage Tr', 'USPCS',   'Truck', 'UTILITY', 'Tractor Truck Gasoline', 'PKUP', 'PICK UP',
  'Bulk Agriculture', 'Multi-Wheeled Vehicle', 'USPS VEHIC'
);

-- Motorcycle
UPDATE motor_crashes_stages
SET `VEHICLE TYPE CODE 1` = 'Motorcycle'
WHERE TRIM(`VEHICLE TYPE CODE 1`) IN (
  'Bike', 'E-Bike', 'E-Scooter', 'Scooter', 'Motorscooter', 'Motorbike',
  'Moped', 'Minicycle', 'e bike uni'
);

-- Emergency
UPDATE motor_crashes_stages
SET `VEHICLE TYPE CODE 1` = 'Emergency Vehicle'
WHERE TRIM(`VEHICLE TYPE CODE 1`) IN (
  'Ambulance', 'FDNY Ambul', 'Fire Truck', 'FIRE'
);

-- Construction
UPDATE motor_crashes_stages
SET `VEHICLE TYPE CODE 1` = 'Construction Equipment'
WHERE TRIM(`VEHICLE TYPE CODE 1`) IN (
  'Street Swe', 'Lift Boom', 'Fork Lift', 'Cater', 'Excavator'
);

-- Car
UPDATE motor_crashes_stages
SET `VEHICLE TYPE CODE 1` = 'Car/SUV'
WHERE TRIM(`VEHICLE TYPE CODE 1`) IN (
 'Car', 'Sedan', 'Convertible', '4 Dr Sedan', '2 Dr Sedan', '3-Door', 'Limo', 'PSD', 
  'Station Wagon/Sport Utility Vehicle'
);

-- Bus
UPDATE motor_crashes_stages
SET `VEHICLE TYPE CODE 1` = 'Bus'
WHERE TRIM(`VEHICLE TYPE CODE 1`) IN (
  'Bus', 'School Bus', 'MTA', 'Commuter Van'
);

UPDATE motor_crashes_stages
SET `VEHICLE TYPE CODE 1` = 'Specialty Vehicle'
WHERE TRIM(`VEHICLE TYPE CODE 1`) IN (
  'Carry All', 'Street Swe', 'MTA', 'PK', 'Flat Rack', 'Glass Rack'
);

-- Van
UPDATE motor_crashes_stages
SET `VEHICLE TYPE CODE 1` = 'Van'
WHERE TRIM(`VEHICLE TYPE CODE 1`) IN ('FORD VAN', 'SW/VAN');

-- Handle unknown/junk
UPDATE motor_crashes_stages
SET `VEHICLE TYPE CODE 1` = NULL
WHERE TRIM(`VEHICLE TYPE CODE 1`) IN (
  '', 'UNK', 'Unknown', 'Unspecified', 'ï¿½MBU', 'N/A', '999'
);

SELECT `VEHICLE TYPE CODE 1`, COUNT(*) AS total_crashes
FROM motor_crashes_stages
GROUP BY `VEHICLE TYPE CODE 1`
ORDER BY total_crashes DESC;

-- standardized categories for vehicle 2
SELECT DISTINCT `VEHICLE TYPE CODE 2`
FROM motor_crashes_stages
ORDER BY `VEHICLE TYPE CODE 2`;

UPDATE motor_crashes_stages
SET `VEHICLE TYPE CODE 2` = 'Truck'
WHERE TRIM(`VEHICLE TYPE CODE 2`) IN (
  'Armored Truck', 'Beverage Truck', 'Box Truck', 'BOX', 'BOX VAN', 'Bulk Agriculture',
  'Chassis Cab', 'COM', 'Concrete Mixer', 'Dump', 'Pick-up Truck', 'PK',
  'Refrigerated Van', 'Stake or Rack', 'Tanker', 'Tow Truck / Wrecker',
  'Tractor Truck Diesel', 'Tractor Truck Gasoline', 'TRAILER', 'TRK',
  'util truck', 'VAN/TRUCK', 'work van', 'Flat Bed', 'Carry All', 'Open Body', 
  'Garbage or Refuse', 'DL', 'TOW TRUCK', 'pickup tru', 'garbage tr', 'Hopper'
);

UPDATE motor_crashes_stages
SET `VEHICLE TYPE CODE 2` = 'Car/SUV'
WHERE TRIM(`VEHICLE TYPE CODE 2`) IN (
 'Car', 'Sedan', 'Convertible', '4 dr sedan', 'bmw', '3-Door', 'PRIVATE', 
  'Station Wagon/Sport Utility Vehicle'
);

UPDATE motor_crashes_stages
SET `VEHICLE TYPE CODE 2` = 'Motorcycle'
WHERE TRIM(`VEHICLE TYPE CODE 2`) IN (
  'Bike', 'E-Bike', 'E-Scooter', 'Motorcycle', 'Motorscooter', 'Motorbike',
  'Moped', 'Dirt Bike', 'SCOOTER', 'ESCOOTERSI'
);

UPDATE motor_crashes_stages
SET `VEHICLE TYPE CODE 2` = 'Emergency Vehicle'
WHERE TRIM(`VEHICLE TYPE CODE 2`) IN (
  'Ambulance', 'FDNY ENGIN', 'FDNY TRUCK', 'fire truck', 'FIRETRUCK', 'NYC FIRE T'
);

UPDATE motor_crashes_stages
SET `VEHICLE TYPE CODE 2` = 'Bus'
WHERE TRIM(`VEHICLE TYPE CODE 2`) IN (
  'Bus', 'School Bus', 'MTA BUS', 'NICE BUS'
);

UPDATE motor_crashes_stages
SET `VEHICLE TYPE CODE 2` = 'Van'
WHERE TRIM(`VEHICLE TYPE CODE 2`) IN (
  'Van', 'Van Camper'
);

UPDATE motor_crashes_stages
SET `VEHICLE TYPE CODE 2` = 'Construction Equipment'
WHERE TRIM(`VEHICLE TYPE CODE 2`) IN (
  'Forklift', 'Food cart',  'POWER SHOV', 'MOWER', 'Lift Boom'
);

UPDATE motor_crashes_stages
SET `VEHICLE TYPE CODE 2` = 'Specialty Vehicle'
WHERE TRIM(`VEHICLE TYPE CODE 2`) IN (
  'Multi-Wheeled Vehicle', 'Pedicab', 'WHEELCHAIR', 'Flat Rack', 'Snow Plow'
);

UPDATE motor_crashes_stages
SET `VEHICLE TYPE CODE 2` = NULL
WHERE 
  TRIM(`VEHICLE TYPE CODE 2`) = ''
  OR TRIM(`VEHICLE TYPE CODE 2`) IN ('UNK', '?', 'N/A')
  OR `VEHICLE TYPE CODE 2` REGEXP '^[0-9]{1,4}$';

SELECT `VEHICLE TYPE CODE 2`, COUNT(*) AS total_crashes
FROM motor_crashes_stages
GROUP BY `VEHICLE TYPE CODE 2`
ORDER BY total_crashes DESC;  




-- standardized categories for vehicle 3
SELECT DISTINCT `VEHICLE TYPE CODE 3`, COUNT(*)
FROM motor_crashes_stages
GROUP BY `VEHICLE TYPE CODE 3`;

UPDATE motor_crashes_stages
SET `VEHICLE TYPE CODE 3` = 'Truck'
WHERE TRIM(`VEHICLE TYPE CODE 3`) IN (
  'Box Truck', 'Pick-up Truck', 'Flat Bed', 'PK', 'Tractor Truck Diesel', 
  'UTILITY TR', 'Tow Truck / Wrecker'
);

UPDATE motor_crashes_stages
SET `VEHICLE TYPE CODE 3` = 'Car'
WHERE TRIM(`VEHICLE TYPE CODE 3`) IN (
  'Sedan', 'Convertible', 'Station Wagon/Sport Utility Vehicle'
);

UPDATE motor_crashes_stages
SET `VEHICLE TYPE CODE 3` = 'Motorcycle'
WHERE TRIM(`VEHICLE TYPE CODE 3`) IN (
  'Bike', 'Motorbike', 'Motorcycle', 'E-Scooter', 'E-Bike'
);

UPDATE motor_crashes_stages
SET `VEHICLE TYPE CODE 3` = 'Emergency Vehicle'
WHERE TRIM(`VEHICLE TYPE CODE 3`) = 'Ambulance';

UPDATE motor_crashes_stages
SET `VEHICLE TYPE CODE 3` = NULL
WHERE 
  TRIM(`VEHICLE TYPE CODE 3`) = ''
  OR TRIM(`VEHICLE TYPE CODE 3`) IN ('UNK', 'N/A', '?')
  OR `VEHICLE TYPE CODE 3` REGEXP '^[0-9]{1,4}$';
  
SELECT `VEHICLE TYPE CODE 3`, COUNT(*) AS total_crashes
FROM motor_crashes_stages
GROUP BY `VEHICLE TYPE CODE 3`
ORDER BY total_crashes DESC;  
  
-- standardized categories for vehicle 4
SELECT DISTINCT `VEHICLE TYPE CODE 4`, COUNT(*)
FROM motor_crashes_stages
GROUP BY `VEHICLE TYPE CODE 4`;

UPDATE motor_crashes_stages
SET `VEHICLE TYPE CODE 4` = 'Truck'
WHERE TRIM(`VEHICLE TYPE CODE 4`) IN (
  'Box Truck', 'Tow Truck / Wrecker', 'Pick-up Truck');

UPDATE motor_crashes_stages
SET `VEHICLE TYPE CODE 4` = 'Car/SUV'
WHERE TRIM(`VEHICLE TYPE CODE 4`) IN (
'Car', 'Sedan', 'Station Wagon/Sport Utility Vehicle');

UPDATE motor_crashes_stages
SET `VEHICLE TYPE CODE 4` = 'Motorcycle'
WHERE TRIM(`VEHICLE TYPE CODE 4`) = 'Bike';

UPDATE motor_crashes_stages
SET `VEHICLE TYPE CODE 4` = 'Bus'
WHERE TRIM(`VEHICLE TYPE CODE 4`) IN ('bus', 'School Bus');

UPDATE motor_crashes_stages
SET `VEHICLE TYPE CODE 4` = NULL
WHERE 
  TRIM(`VEHICLE TYPE CODE 4`) = ''
  OR TRIM(`VEHICLE TYPE CODE 4`) IN ('UNK', 'N/A', '?')
  OR `VEHICLE TYPE CODE 4` REGEXP '^[0-9]{1,4}$';
  
SELECT `VEHICLE TYPE CODE 4`, COUNT(*) AS total_crashes
FROM motor_crashes_stages
GROUP BY `VEHICLE TYPE CODE 4`
ORDER BY total_crashes DESC;  

-- standardized categories for vehicle 5
SELECT DISTINCT `VEHICLE TYPE CODE 5`, COUNT(*)
FROM motor_crashes_stages
GROUP BY `VEHICLE TYPE CODE 5`;

UPDATE motor_crashes_stages
SET `VEHICLE TYPE CODE 5` = 'Truck'
WHERE TRIM(`VEHICLE TYPE CODE 5`) IN ('Pick-up Truck');

UPDATE motor_crashes_stages
SET `VEHICLE TYPE CODE 5` = 'Car'
WHERE TRIM(`VEHICLE TYPE CODE 5`) IN ('Sedan', 'Station Wagon/Sport Utility Vehicle');

UPDATE motor_crashes_stages
SET `VEHICLE TYPE CODE 5` = NULL
WHERE 
  TRIM(`VEHICLE TYPE CODE 5`) = ''
  OR TRIM(`VEHICLE TYPE CODE 5`) IN ('UNK', 'N/A', '?')
  OR `VEHICLE TYPE CODE 5` REGEXP '^[0-9]{1,4}$';

SELECT `VEHICLE TYPE CODE 5`, COUNT(*) AS total_crashes
FROM motor_crashes_stages
GROUP BY `VEHICLE TYPE CODE 5`
ORDER BY total_crashes DESC; 



-- Standardizing values in CONTRIBUTING FACTOR VEHICLE 1
SELECT DISTINCT `CONTRIBUTING FACTOR VEHICLE 1`, COUNT(*)
FROM motor_crashes_stages
GROUP BY `CONTRIBUTING FACTOR VEHICLE 1`
ORDER BY `CONTRIBUTING FACTOR VEHICLE 1`;

UPDATE motor_crashes_stages 
SET `CONTRIBUTING FACTOR VEHICLE 1` = NULL
WHERE `CONTRIBUTING FACTOR VEHICLE 1` = '' OR `CONTRIBUTING FACTOR VEHICLE 1` = 'Unspecified';

-- Fix typos
UPDATE motor_crashes_stages
SET `CONTRIBUTING FACTOR VEHICLE 1` = 'Illness'
WHERE `CONTRIBUTING FACTOR VEHICLE 1` = 'Illnes';

-- Standardize distractions
UPDATE motor_crashes_stages
SET `CONTRIBUTING FACTOR VEHICLE 1` = 'Distraction'
WHERE `CONTRIBUTING FACTOR VEHICLE 1` IN (
  'Driver Inattention/Distraction', 'Passenger Distraction', 'Outside Car Distraction',
  'Using On Board Navigation Device', 'Cell Phone (hand-Held)', 'Cell Phone (hands-free)',
  'Eating or Drinking', 'Other Electronic Device'
);

-- Standardize driver behavior
UPDATE motor_crashes_stages
SET `CONTRIBUTING FACTOR VEHICLE 1` = 'Driver Behavior'
WHERE `CONTRIBUTING FACTOR VEHICLE 1` IN (
  'Failure to Yield Right-of-Way', 'Aggressive Driving/Road Rage', 'Following Too Closely',
  'Unsafe Lane Changing', 'Passing Too Closely', 'Turning Improperly',
  'Traffic Control Disregarded', 'Failure to Keep Right', 'Passing or Lane Usage Improper',
   'Unsafe Speed'
);

-- Driver condition
UPDATE motor_crashes_stages
SET `CONTRIBUTING FACTOR VEHICLE 1` = 'Driver Condition'
WHERE `CONTRIBUTING FACTOR VEHICLE 1` IN (
  'Fatigued/Drowsy', 'Fell Asleep', 'Lost Consciousness', 'Illness',
  'Physical Disability', 'Driver Inexperience', 'Alcohol Involvement', 'Drugs (illegal)'
);

-- Vehicle defect
UPDATE motor_crashes_stages
SET `CONTRIBUTING FACTOR VEHICLE 1` = 'Vehicle Defect'
WHERE `CONTRIBUTING FACTOR VEHICLE 1` IN (
  'Brakes Defective', 'Accelerator Defective', 'Tire Failure/Inadequate',
  'Headlights Defective', 'Steering Failure', 'Other Lighting Defects'
);

-- Environment
UPDATE motor_crashes_stages
SET `CONTRIBUTING FACTOR VEHICLE 1` = 'Environment'
WHERE `CONTRIBUTING FACTOR VEHICLE 1` IN (
  'Pavement Slippery', 'Pavement Defective', 'Lane Marking Improper/Inadequate',
  'Obstruction/Debris', 'View Obstructed/Limited', 'Glare'
);

-- Pedestrian/Bike
UPDATE motor_crashes_stages
SET `CONTRIBUTING FACTOR VEHICLE 1` = 'Pedestrian/Bike'
WHERE `CONTRIBUTING FACTOR VEHICLE 1` IN (
  'Pedestrian/Bicyclist/Other Pedestrian Error/Confusion', 'Animals Action'
);

-- Other
UPDATE motor_crashes_stages
SET `CONTRIBUTING FACTOR VEHICLE 1` = 'Other'
WHERE `CONTRIBUTING FACTOR VEHICLE 1` IN (
  'Other Vehicular', 'Driverless/Runaway Vehicle', 'Oversized Vehicle',
  'Tinted Windows', 'Backing Unsafely', 'Reaction to Uninvolved Vehicle'
);

-- Standardizing values in CONTRIBUTING FACTOR VEHICLE 2
SELECT DISTINCT `CONTRIBUTING FACTOR VEHICLE 2`, COUNT(*)
FROM motor_crashes_stages
GROUP BY `CONTRIBUTING FACTOR VEHICLE 2`
ORDER BY `CONTRIBUTING FACTOR VEHICLE 2`;

UPDATE motor_crashes_stages 
SET `CONTRIBUTING FACTOR VEHICLE 2` = NULL
WHERE `CONTRIBUTING FACTOR VEHICLE 2` = '' OR `CONTRIBUTING FACTOR VEHICLE 2` = 'Unspecified';

-- Distraction
UPDATE motor_crashes_stages
SET `CONTRIBUTING FACTOR VEHICLE 2` = 'Distraction'
WHERE `CONTRIBUTING FACTOR VEHICLE 2` IN (
  'Driver Inattention/Distraction', 'Passenger Distraction', 'Outside Car Distraction'
);

-- Driver Behavior
UPDATE motor_crashes_stages
SET `CONTRIBUTING FACTOR VEHICLE 2` = 'Driver Behavior'
WHERE `CONTRIBUTING FACTOR VEHICLE 2` IN (
  'Failure to Yield Right-of-Way', 'Aggressive Driving/Road Rage', 'Following Too Closely',
  'Passing Too Closely', 'Turning Improperly', 'Traffic Control Disregarded',
  'Unsafe Lane Changing', 'Unsafe Speed', 'Passing or Lane Usage Improper',
  'Fell Asleep'
);

-- Driver Condition
UPDATE motor_crashes_stages
SET `CONTRIBUTING FACTOR VEHICLE 2` = 'Driver Condition'
WHERE `CONTRIBUTING FACTOR VEHICLE 2` IN (
  'Driver Inexperience', 'Alcohol Involvement'
);

-- Environment
UPDATE motor_crashes_stages
SET `CONTRIBUTING FACTOR VEHICLE 2` = 'Environment'
WHERE `CONTRIBUTING FACTOR VEHICLE 2` IN (
  'Obstruction/Debris', 'View Obstructed/Limited', 'Pavement Slippery', 'Glare'
);

-- Pedestrian/Bike
UPDATE motor_crashes_stages
SET `CONTRIBUTING FACTOR VEHICLE 2` = 'Pedestrian/Bike'
WHERE `CONTRIBUTING FACTOR VEHICLE 2` = 'Pedestrian/Bicyclist/Other Pedestrian Error/Confusion';
-- Other
UPDATE motor_crashes_stages
SET `CONTRIBUTING FACTOR VEHICLE 2` = 'Other'
WHERE `CONTRIBUTING FACTOR VEHICLE 2` IN (
  'Backing Unsafely', 'Reaction to Uninvolved Vehicle', 'Oversized Vehicle',
  'Other Vehicular', 'Vehicle Vandalism'
);

-- Standardizing values in CONTRIBUTING FACTOR VEHICLE 3
SELECT DISTINCT `CONTRIBUTING FACTOR VEHICLE 3`, COUNT(*)
FROM motor_crashes_stages
GROUP BY `CONTRIBUTING FACTOR VEHICLE 3`
ORDER BY `CONTRIBUTING FACTOR VEHICLE 3`;

UPDATE motor_crashes_stages 
SET `CONTRIBUTING FACTOR VEHICLE 3` = NULL
WHERE `CONTRIBUTING FACTOR VEHICLE 3` = '' OR `CONTRIBUTING FACTOR VEHICLE 3` = 'Unspecified';

-- Distraction
UPDATE motor_crashes_stages
SET `CONTRIBUTING FACTOR VEHICLE 3` = 'Distraction'
WHERE `CONTRIBUTING FACTOR VEHICLE 3` IN (
'Driver Inattention/Distraction', 'Outside Car Distraction');

-- Driver Behavior
UPDATE motor_crashes_stages
SET `CONTRIBUTING FACTOR VEHICLE 3` = 'Driver Behavior'
WHERE `CONTRIBUTING FACTOR VEHICLE 3` IN (
  'Following Too Closely', 'Passing or Lane Usage Improper', 'Traffic Control Disregarded', 
  'Unsafe Lane Changing'
);

-- Environment
UPDATE motor_crashes_stages
SET `CONTRIBUTING FACTOR VEHICLE 3` = 'Environment'
WHERE `CONTRIBUTING FACTOR VEHICLE 3` IN (
   'View Obstructed/Limited', 'Pavement Slippery'
);

-- Other
UPDATE motor_crashes_stages
SET `CONTRIBUTING FACTOR VEHICLE 3` = 'Other'
WHERE `CONTRIBUTING FACTOR VEHICLE 3` IN ( 'Other Vehicular', 
'Reaction to Uninvolved Vehicle');


-- Standardizing values in CONTRIBUTING FACTOR VEHICLE 4
SELECT DISTINCT `CONTRIBUTING FACTOR VEHICLE 4`, COUNT(*)
FROM motor_crashes_stages
GROUP BY `CONTRIBUTING FACTOR VEHICLE 4`
ORDER BY `CONTRIBUTING FACTOR VEHICLE 4`;

UPDATE motor_crashes_stages 
SET `CONTRIBUTING FACTOR VEHICLE 4` = NULL
WHERE `CONTRIBUTING FACTOR VEHICLE 4` = '' OR `CONTRIBUTING FACTOR VEHICLE 4` = 'Unspecified';

-- Other
UPDATE motor_crashes_stages
SET `CONTRIBUTING FACTOR VEHICLE 4` = 'Other'
WHERE `CONTRIBUTING FACTOR VEHICLE 4` IN ('Other Vehicular', 'Reaction to Uninvolved Vehicle');

-- Driver Behavior
UPDATE motor_crashes_stages
SET `CONTRIBUTING FACTOR VEHICLE 4` = 'Driver Behavior'
WHERE `CONTRIBUTING FACTOR VEHICLE 4` = 'Following Too Closely';


-- Standardizing values in CONTRIBUTING FACTOR VEHICLE 5
SELECT DISTINCT `CONTRIBUTING FACTOR VEHICLE 5`, COUNT(*)
FROM motor_crashes_stages
GROUP BY `CONTRIBUTING FACTOR VEHICLE 5`
ORDER BY `CONTRIBUTING FACTOR VEHICLE 5`;

UPDATE motor_crashes_stages 
SET `CONTRIBUTING FACTOR VEHICLE 5` = NULL
WHERE `CONTRIBUTING FACTOR VEHICLE 5` = '' OR `CONTRIBUTING FACTOR VEHICLE 5` = 'Unspecified';

-- Other
UPDATE motor_crashes_stages
SET `CONTRIBUTING FACTOR VEHICLE 5` = 'Other'
WHERE `CONTRIBUTING FACTOR VEHICLE 5` IN ('Other Vehicular', 'Reaction to Uninvolved Vehicle');


SELECT *
FROM motor_crashes_stages;

-- CHECKING FOR DUPLICATES
SELECT COLLISION_ID, COUNT(*) AS count
FROM motor_crashes_stages
GROUP BY COLLISION_ID
HAVING COUNT(*) > 1;

-- checking for rows where all the following values are identical
SELECT *,
ROW_NUMBER() OVER(PARTITION BY COLLISION_ID, `CRASH DATE`, `CRASH TIME`, BOROUGH, `ZIP CODE`, LATITUDE, LONGITUDE, LOCATION, 
`ON STREET NAME`, `CROSS STREET NAME`, `OFF STREET NAME`, `CONTRIBUTING FACTOR VEHICLE 1`,
`CONTRIBUTING FACTOR VEHICLE 2`, `CONTRIBUTING FACTOR VEHICLE 3`, `CONTRIBUTING FACTOR VEHICLE 4`, `CONTRIBUTING FACTOR VEHICLE 5`,
`VEHICLE TYPE CODE 1`, `VEHICLE TYPE CODE 2`, `VEHICLE TYPE CODE 3`, `VEHICLE TYPE CODE 4`,
`VEHICLE TYPE CODE 5` ) AS row_num
FROM motor_crashes_stages;

SELECT *
FROM (
     SELECT *,
     ROW_NUMBER() OVER(PARTITION BY COLLISION_ID, `CRASH DATE`, `CRASH TIME`, BOROUGH, `ZIP CODE`, LATITUDE, LONGITUDE, LOCATION, 
     `ON STREET NAME`, `CROSS STREET NAME`, `OFF STREET NAME`, `CONTRIBUTING FACTOR VEHICLE 1`,
	 `CONTRIBUTING FACTOR VEHICLE 2`, `CONTRIBUTING FACTOR VEHICLE 3`, `CONTRIBUTING FACTOR VEHICLE 4`, `CONTRIBUTING FACTOR VEHICLE 5`,
	 `VEHICLE TYPE CODE 1`, `VEHICLE TYPE CODE 2`, `VEHICLE TYPE CODE 3`, `VEHICLE TYPE CODE 4`,
	 `VEHICLE TYPE CODE 5` ) AS row_num
	 FROM motor_crashes_stages
     ) duplicates
WHERE row_num > 1;









     
     



   