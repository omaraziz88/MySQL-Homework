 -- 1A:
USE sakila;
SELECT first_name, last_name FROM actor;
 -- 1B:
SELECT CONCAT(first_name, ',',last_name) AS ACTOR_NAME FROM actor;
 -- 2A:
SELECT actor_id, first_name, last_name FROM actor WHERE first_name = "Joe";
 -- 2B:
SELECT actor_id, first_name, last_name FROM actor WHERE last_name LIKE '%GEN%';
 -- 2C:
SELECT last_name, first_name FROM actor WHERE last_name LIKE '%LI%';
 -- 2D:
SELECT country_id, country FROM country WHERE country IN ('Afghanistan', 'Bangladesh', 'China');
 -- 3A:
ALTER TABLE actor
ADD description BLOB;
SELECT * FROM actor;
 -- 3B:
ALTER TABLE actor
DROP COLUMN description;
SELECT * FROM actor;
 -- 4A:
SELECT last_name, COUNT(*) as count FROM actor GROUP BY last_name ORDER BY count DESC;
 -- 4B:
SELECT last_name, COUNT(*) as count FROM actor GROUP BY last_name HAVING count > 1;
 -- 4C:
SET SQL_SAFE_UPDATES = 0;
UPDATE actor
SET first_name = 'HARPO'
WHERE first_name = 'GROUCHO';
SELECT * FROM actor WHERE last_name = 'Williams';
 -- 4D:
UPDATE actor
SET first_name = 'GROUCHO'
WHERE first_name = 'HARPO';
SELECT * FROM actor WHERE last_name = 'Williams';
 -- 5A:
		-- We would use the SHOW CREATE statement that shows the create statement for an existing table,
		-- view, or sequence. 
 -- 6A:
SELECT staff.first_name, staff.last_name, address.address
FROM staff
INNER JOIN address ON
address.address_id=staff.address_id;
 -- 6B:
SELECT staff.first_name, staff.last_name,
SUM(payment.amount)
FROM payment INNER JOIN staff ON payment.staff_id = staff.staff_id
WHERE DATE (payment_date) BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY staff.last_name, staff.first_name;
 -- 6C:
SELECT f.title, COUNT(fa.actor_id)'Number of Actors' FROM film f
INNER JOIN film_actor fa ON f.film_id = fa.film_id
GROUP BY f.title;
 -- 6D:
SELECT f.title, COUNT(i.film_id) FROM film f
INNER JOIN inventory i ON f.film_id = i.film_id
WHERE f.title = 'Hunchback Impossible'
GROUP BY f.title;
 -- 6E:
SELECT customer.first_name, customer.last_name,
SUM(payment.amount) AS 'Total Amount Paid'
FROM payment INNER JOIN customer ON payment.customer_id = customer.customer_id
GROUP BY customer.last_name, customer.first_name
ORDER BY last_name ASC;
 -- 7A:
SELECT title
FROM film
WHERE title LIKE 'Q%' OR title LIKE 'K%' 
AND language_id IN
(
 SELECT language_id
 FROM language
 WHERE name = 'English'
);
 -- 7B:
SELECT first_name, last_name
FROM actor
WHERE actor_id IN
(
 SELECT actor_id
 FROM film_actor
 WHERE film_id IN
 (
  SELECT film_id
  FROM film
  WHERE title = 'Alone Trip'
  )
 );
 -- 7C:
SELECT first_name, last_name, email
FROM customer 
WHERE address_id IN
(
 SELECT address_id
 FROM address
 WHERE city_id IN
 (
  SELECT city_id
  FROM city
  WHERE country_id IN
  (
   SELECT country_id
   FROM country
   WHERE country = 'Canada'
   )
  )
 );
 -- 7D:
SELECT title
FROM film
WHERE film_id IN
(
 SELECT film_id
 FROM film_category
 WHERE category_id IN
 (
  SELECT category_id
  FROM category
  WHERE name = 'Family'
  )
 );
 -- 7E:


   
    

