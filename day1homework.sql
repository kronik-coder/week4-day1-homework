-- 1. Actors with last name Wahlberg
SELECT last_name
FROM actor
WHERE last_name = 'Wahlberg'

-- 2. How many payments made between 3.99 and 5.99
-- 5607 payments made
SELECT count(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99

-- 3. What film does the store the most of?
SELECT COUNT(inventory_id), film_id
FROM inventory
GROUP BY film_id
ORDER BY count DESC

-- 4. How many customers have the last name 'William'? no customers with last name william
SELECT last_name
FROM customer
WHERE last_name = 'William'

-- 5. What store employee (get the id) sold the most rentals? staff_id 2 has the most
SELECT staff_id, count(rental_id)
FROM payment
GROUP BY staff_id

-- 6. How many different district names are there? 599 different names
SELECT COUNT(DISTINCT CITY)
FROM city

-- 7. What film has the most actors in it? (use film_actor table and get film_id) film_id 508
SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY count DESC

-- 8. From store_id 1, how many customers have a last name ending with 'es'? (use customer table)
-- 13 last names ending in 'es'
SELECT store_id, COUNT(last_name)
FROM customer
WHERE last_name LIKE '%es'
AND store_id = 1
GROUP BY store_id;

-- 9. How many payments amounts (4.99, 5.99, etc.) had a number of rentals above 250 for
-- customers with ids between 380 and 430? (use group by and having > 250)
SELECT count(rental_id), amount
FROM payment
WHERE customer_id BETWEEN 380 AND 450
GROUP BY amount
HAVING count(rental_id) > 250

-- 10. Within the film table, how many rating categories are there?
-- And what rating has the most movies total? there are 5 ratings and pg-13 has the most films
SELECT DISTINCT rating, COUNT(title)
FROM film
GROUP BY rating
ORDER BY count DESC