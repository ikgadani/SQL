-- Isha Gadani
-- 041085940

use flightdb;

-- 1. Count how many rows are present in the airlines table.
select Count(*) 
from   airlines ;
  -- 2) Calculate the average elevation in the airports tables.
select avg(elevation) 
from airports;

-- 3. Calculate the maximum and minimum elevations in the airports table.
select max(elevation) as  max_elevation,
	min(elevation) as min_elevation
from airports;

-- 4. Calculate the average elevation, grouped by country id, in the airports table.
select avg(elevation) as average_elevation,country_id
from airports
group by country_id ;

-- 5. Calculate the average elevation, grouped by country id, in the airports table ordered by country id.
select avg(elevation) as average_elevation,country_id
from airports
group by country_id 
order by country_id ;

-- 6. Calculate the average elevation, grouped by country id, in the airports table ordered by the average elevation in descending order.
select avg(elevation) as average_elevation, country_id
from airports
group by country_id 
order by average_elevation desc ;

-- 7. Calculate the average elevation, grouped by country id, in the airports table ordered by the average elevation in descending order for any country that has an average elevation of at least 300.
select avg(elevation) as average_elevation, country_id
from airports
group by country_id 
having average_elevation>=300
order by average_elevation desc ;

-- 8. Provide the query to determine how many aircrafts does “Boeing” (name) have a description that starts with “74”.
select name, description
from aircrafts
where name like "Boeing"
having description like "74%";

-- 9. Provide the query to determine how many different wake sizes do “Boeing” and “Airbus” have?
select name, COUNT(distinct wake_size) as no_wake_SIZE
from aircrafts
where name in("Boeing", "Airbus")
group by NAME ;

-- 10. Provide the query to determine how many active airlines are present in Canada.  You  will need 2 queries.
select * 
from countries
where name like "Canada";
