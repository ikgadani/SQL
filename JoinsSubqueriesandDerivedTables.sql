
-- Isha Gadani
-- 041085940

USE flightdb;

-- Q1. 
-- Query Entered: Display name, city and country fOR all the airports

SELECT airports.NAME, airports.city, airports.country_id, countries.NAME
FROM airports 
RIGHT JOIN countries ON airports.country_id=countries.id;

-- Q2.
-- Query Entered: All routes that have a source airport of "Lester B Pearson Intl."
-- Displaying: Name of the airport, airline id, and codeshare

SELECT airports.NAME, routes.airline_id, routes.codeshare
FROM routes
JOIN airports ON routes.source_airport_id=airports.id
WHERE airports.NAME LIKE 'Lester B Pearson Intl';

-- Q3.
-- Query Entered: All routes that have a source airport of "Lester B Pearson Intl."
-- Displaying: Distinct names of the airport and airlines

SELECT distinct routes.source_airport_id,airports.id,routes.airline_id,airports.NAME
FROM routes
RIGHT JOIN airports ON routes.source_airport_id=airports.id
WHERE airports.NAME LIKE 'Lester B Pearson Intl';

-- Q4. 
-- Query Entered: All routes that have a source airport of "Lester B Pearson Intl."
-- Displaying: Distinct names of the airport, airlines, and aircraft description

SELECT distinct airports.id,airports.NAME,routes.source_airport_id,routes.airline_id,airlines.NAME,aircrafts.NAME
FROM airports 
INNER JOIN routes ON routes.source_airport_id=airports.id
INNER JOIN airlines ON routes.airline_id=airlines.id
INNER JOIN aircrafts ON airlines.id=aircrafts.id
WHERE airports.NAME LIKE 'Lester B Pearson Intl';

-- Q5.
-- Query Entered: TO display the name of the airline and what country they are based in.

SELECT airlines.NAME,countries.NAME
FROM airlines
JOIN countries ON airlines.country_id=countries.id;

-- Q6.
-- Query Entered: Couting the number of airlines that are based in the mentioned countries. 
-- Displaying: Name of the country and the airline

SELECT count(airlines.id) as number_airline,   countries.NAME as Country
FROM airlines,countries
WHERE airlines.country_id=countries.id
GROUP BY countries.NAME
ORDER BY countries.NAME;

-- Q7. 
-- Query Entered: The number of different aircraft operate routes that ends at the airports in France
-- Displying: Distinct count of the aircrafts

SELECT count(routes.airline_id) as airline_num_France
FROM routes
JOIN airports ON routes.destination_airport_id=airports.id
JOIN countries ON airports.country_id=countries.id
WHERE countries.NAME LIKE 'France';

-- Q8.
-- The number of different aircraft operate routes that ends at the airports in France, Germany, Spain, and Italy.
-- Displaying: Distinct count of airlines and the aname of the countries

SELECT count(routes.airline_id) as number_airline,countries.NAME
FROM routes
JOIN airports ON routes.destination_airport_id=airports.id
JOIN countries ON airports.country_id=countries.id
WHERE (countries.NAME LIKE 'France') OR (countries.NAME LIKE'Germany') OR (countries.NAME LIKE 'Spain') OR (countries.NAME LIKE 'Italy')
GROUP BY countries.NAME
ORDER BY countries.NAME;

-- Q9. 
-- Query Entered: Display the name of the airline, aircraft, and country for 
-- the airlines that operates the routes that end at the airports in France, Germany, Spain, and Italy.


SELECT routes.airline_id,airlines.NAME as name_airline,aircrafts.NAME as name_aircraft,countries.NAME as destination_name
FROM routes
JOIN airports ON routes.destination_airport_id=airports.id
JOIN countries ON airports.country_id=countries.id
JOIN airlines ON routes.airline_id=airlines.id
JOIN aircrafts ON airlines.id=aircrafts.id
WHERE countries.NAME LIKE 'France' OR countries.NAME LIKE'Germany' OR countries.NAME LIKE 'Spain' OR countries.NAME LIKE 'Italy'
GROUP BY countries.NAME,routes.airline_id
ORDER BY countries.NAME;


-- Q10.
-- Query Entered: Display the number of each "wake size" 
-- for the aircrafts operated by the airlines that operate the start at airports in Canada, US, and Mexico.

SELECT countries.NAME, count(aircrafts.wake_size) as wake_size
FROM countries
JOIN airports ON countries.id=airports.country_id
JOIN routes ON routes.source_airport_id=airports.id OR routes.destination_airport_id=airports.id
JOIN airlines ON routes.airline_id=airlines.id
JOIN aircrafts ON airlines.id=aircrafts.id
WHERE Countries.NAME LIKE 'Canada' OR countries.NAME LIKE 'United States' OR countries.NAME LIKE 'Mexico'
GROUP BY countries.NAME
ORDER BY countries.NAME;

-- Q11. Redoing the Question 8 using a subquery in the WHERE clause 

SELECT countries.NAME, COUNT(DISTINCT (routes.airline_id)) 
AS 'Count of Airlines'
FROM airports, countries, routes
WHERE airports.country_id IN (SELECT id FROM countries WHERE NAME IN ('France', 'Germany', 'Spain', 'Italy')) AND airports.country_id = countries.id AND routes.destination_airport_id = airports.id
GROUP BY countries.NAME;


-- Redoing the Question 7 using a subquery in the FROM clause 

SELECT COUNT(DISTINCT (route_aircrafts.aircraft_id))
FROM route_aircrafts
WHERE route_id IN (SELECT id FROM routes WHERE routes.destination_airport_id IN 
(SELECT id FROM airports WHERE airports.country_id IN 
(SELECT id FROM countries WHERE NAME IN ('France'))));
