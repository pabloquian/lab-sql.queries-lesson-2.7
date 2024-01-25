-- Lab | SQL Join (Part I)
-- In this lab, you will be using the Sakila database of movie rentals.

-- Instructions
-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
USE sakila;

SELECT category_id, count(film_id) as count_film
FROM film f
JOIN film_category f_cat
USING (film_id)
GROUP BY category_id
ORDER BY count_film;

-- 2. Display the total amount rung up by each staff member in August of 2005.
SELECT staff_id, SUM(amount) AS total_payment
FROM staff s
JOIN payment p
USING (staff_id)
WHERE payment_date LIKE "2005-08%"
GROUP BY staff_id
ORDER BY staff_id ASC;

-- 3. Which actor has appeared in the most films?
SELECT first_name, last_name, COUNT(film_id) AS film_count
FROM actor a
JOIN film_actor f_a
USING (actor_id)
GROUP BY first_name, last_name
ORDER BY film_count DESC
LIMIT 1;

-- 4. Most active customer (the customer that has rented the most number of films)
SELECT first_name, last_name, COUNT(rental_id) AS rental_count
FROM customer c
JOIN rental r
USING (customer_id)
GROUP BY first_name, last_name
ORDER BY rental_count DESC
LIMIT 1;

-- 5. Display the first and last names, as well as the address, of each staff member.
SELECT first_name, last_name, address, address2
FROM staff
JOIN address
USING (address_id);

-- 6.List each film and the number of actors who are listed for that film.
SELECT title, COUNT(DISTINCT actor_id) AS count_actor
FROM film
JOIN film_actor
USING (film_id)
GROUP BY title
ORDER BY title ASC;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT customer_id, first_name, last_name, ROUND(SUM(amount),2) AS sum_amount
FROM payment
JOIN customer
USING (customer_id)
GROUP BY customer_id, first_name, last_name
ORDER BY last_name ASC;

-- 8. List the titles of films per category.
SELECT title, name
FROM film
JOIN film_category
USING (film_id)
JOIN category
USING (category_id)
GROUP BY title, category_id;

# LAB FINISHED

