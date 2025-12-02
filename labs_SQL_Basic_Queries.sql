use Sakila ;

-- 1. Display all available tables in the Sakila database.
SHOW TABLES;

-- 2. Retrieve all the data from the tables actor, film and customer
SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM customer;


-- 3. Retrieve the following columns from their respective tables:
-- 3.1 Titles of all films from the film table
SELECT title FROM film;

-- 3.2 List of languages used in films, with the column aliased as language from the language table
SELECT name as language
FROM sakila.language;

-- 3.3 List of first names of all employees from the staff table -- 
select first_name from sakila.staff;

-- 4 Retrieve unique release years.
select distinct(release_year) from sakila.film;

-- Counting records for database insights:
-- 5.1 Determine the number of stores that the company has.
select count(*) from sakila.store;

-- 5.2 Determine the number of employees that the company has.
select count(*) from sakila.staff;

-- 5.3 Determine how many films are available for rent and how many have been rented.
  SELECT 
  (SELECT COUNT(DISTINCT inventory_id) 
   FROM sakila.inventory 
   WHERE inventory_id NOT IN (SELECT inventory_id FROM sakila.rental WHERE return_date IS NULL)) AS available_for_rent,

  (SELECT COUNT(DISTINCT inventory_id) 
   FROM sakila.rental 
   WHERE return_date IS NULL) AS rented;

-- 5.4 Determine the number of distinct last names of the actors in the database.
select count(distinct last_name) 
   from sakila.actor;  

-- 6 Retrieve the 10 longest films.
select film_id, title, length
from sakila.film
order by length desc
limit 10;

-- 7 Use filtering techniques in order to:
-- 7.1 Retrieve all actors with the first name "SCARLETT".
select * from sakila.actor where upper(first_name) = "SCARLETT";

-- 7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.
select * from sakila.film where upper(title) like "%ARMAGEDDON%"
and length > 100;

-- 7.3 Determine the number of films that include Behind the Scenes content
select count(*) from sakila.film where special_features like "%BEHIND THE SCENES%";



