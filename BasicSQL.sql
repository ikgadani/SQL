-- Isha Gadani
-- 041085940

USE flightdb;

-- Q1. Select all columns from the aircrafts table.
SELECT*
FROM aircrafts; -- selecting all from aircrafts table.

-- Q2. Select the name and description from the aircrafts table.
SELECT NAME, DESCRIPTION
FROM aircrafts; -- selecting name and description from the aircrafts table. 

-- Q3. Select the distinct “name” from the aircrafts table.
SELECT DISTINCT NAME 
FROM aircrafts; -- filtering distinct name from the table

-- Q4. Select name and city from the airports table.  Alias the name to “Airport name”
SELECT NAME AS 'Airport name', city
FROM airports; -- "Airport name" and city being selected

-- Q5. Select name, city and elevation for all airports that have a country id of 24.
SELECT NAME, city, elevation
FROM airports -- name and elevation selection
WHERE country_id = 24; -- country id specification

-- Q6. Select the country from the country table that has an id of 24.
SELECT*
FROM countries 
WHERE id = 24; -- country from the county table that has an id of 24

-- Q7. Select airports that have an elevation between 400 and 500.  You must make sure to include 400 and 500.
SELECT*
FROM airports
WHERE elevation BETWEEN 400 AND 500; -- 

-- Q8. Select all airlines who has a name that start with “Air”.
SELECT*
FROM airlines
WHERE NAME REGEXP '^Air'; -- selecting the airlines whose name starts with Air

-- Q9. Select all airlines that have a name that contains “International”.
SELECT*
FROM airlines
WHERE NAME REGEXP 'International'; -- selecting the airlines whose name starts with International

-- Q10. Select all airlines that have a name that ends in “Aviation”.
SELECT*
FROM airlines
WHERE NAME REGEXP 'Aviation$'; -- selecting the airlines whose name ends  with Aviation

-- Q11. Select all airports in Canada that have an elevation of 0.  You will need 2 queries to accomplish this.

SELECT *
FROM airports
WHERE elevation = 0 AND country_id = -- selecting airports in Canada that has an elevation of 0
									(SELECT id
                                    FROM countries
                                    WHERE NAME REGEXP 'Canada'                                    
                                    );

-- Q12. Select all airlines in France that have an active status of “Y”
SELECT *
FROM airlines
WHERE ACTIVE = 'Y' AND country_id = -- airlines in France that has an active status of "Y"
									(
                                    SELECT id
                                    FROM countries
                                    WHERE NAME REGEXP 'France'
                                    );

