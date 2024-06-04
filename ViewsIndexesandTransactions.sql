-- Isha Gadani
-- 041085940

use flightdb;

ALTER TABLE `flightdb`.`countries` ENGINE = InnoDB ;



CREATE VIEW Q8Lab9 AS
    SELECT DISTINCT
c.NAME, COUNT(DISTINCT b.airline_id)
    FROM
    airports a
    INNER JOIN
    routes b ON a.id = b.destination_airport_id
    INNER JOIN
    countries c ON a.country_id = c.id
    WHERE
    c.NAME IN ('France' , 'Germany', 'Spain', 'Italy')
    GROUP BY c.NAME;

CREATE VIEW wake_size_stastic_of_country AS 
     select countries.name, count(aircrafts.wake_size) as wakeSizeStastic
     from countries
     join airports on countries.id=airports.country_id
     join routes
     on routes.source_airport_id=airports.id
     or routes.destination_airport_id=airports.id
     join airlines on routes.airline_id=airlines.id
     join aircrafts on airlines.id=aircrafts.id
     where Countries.name like 'Canada'
     or Countries.name like 'United States'
     or Countries.name like 'Mexico'
     group by countries.name
     order by countries.name;

CREATE INDEX IDX_elevation ON airports (elevation);

CREATE INDEX IDX_source_Destination_airport 
ON routes ( destination_airport_id, source_airport_id );

SELECT
COUNT( * ) as NumberOfRows
FROM
countries;

-- Q4. 
-- there are 241 rows

START TRANSACTION;
INSERT INTO countries(id,name)
VALUES(241,"AlgonquinCollege");

COMMIT;

START TRANSACTION;

delete from flightdb.countries
where id=241;

select count(*) from countries;

select count(*) from countries;

COMMIT;

select count(*) from countries;

-- Q7
-- 241

-- Q8.
-- 241

-- Q13
-- 240

-- Q14
-- 240

-- Q16
-- 240