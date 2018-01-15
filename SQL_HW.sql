USE sakila;

#1a
SELECT * FROM actor;

#1b
SELECT CONCAT(first_name, ' ' , last_name) AS ACTOR_NAME FROM actor;

#2a
SELECT * FROM actor WHERE first_name = 'Joe';

#2b
SELECT * FROM actor WHERE last_name LIKE '%GEN%';

#2c
SELECT * FROM actor WHERE last_name LIKE '%LI%'
ORDER BY last_name, first_name; 

#2d
SELECT country_id, country
FROM country
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

#3a
#ALTER TABLE actor
#ADD middle_name VARCHAR(45);
#SELECT first_name, middle_name, last_name FROM actor;

#3b
#ALTER TABLE actor
#MODIFY middle_name BLOB;

#3c
#ALTER TABLE actor
#DROP middle_name;


#4b
SELECT last_name FROM actor
GROUP BY last_name
HAVING ( COUNT(last_name) >=2);

#4c
#SELECT * FROM actor WHERE first_name = "Groucho" AND last_name = "Williams";
#4d
UPDATE actor
SET first_name = "MUCHO GRUCHO"
WHERE actor_id = 172;
SELECT * FROM actor WHERE actor_id = 172;


#SELECT * FROM staff;

#SELECT * FROM address;

#6a
SELECT *
FROM staff JOIN address
ON staff.address_id = address.address_id;

#6b
#SELECT * FROM staff;

#SELECT * FROM payment;

SELECT * 
FROM staff JOIN payment
ON staff.staff_id = payment.staff_id;

#6c
#SELECT * FROM film_actor;

#SELECT * FROM film;
SELECT * 
FROM film_actor JOIN film
ON film_actor.film_id = film.film_id;

#6d
#SELECT * FROM film WHERE title = "Hunchback Impossible";
SELECT title, COUNT(title)
FROM film
WHERE title = "Hunchback Impossible";

#6e
#SELECT * FROM payment;
#SELECT * FROM customer;
SELECT * 
FROM payment JOIN customer
ON payment.customer_id = customer.customer_id;

SELECT customer_id, SUM(amount) 
FROM payment
GROUP BY customer_id;

#7a
SELECT * FROM film WHERE title LIKE 'K%';

SELECT * FROM film WHERE title LIKE 'Q%';

#7b
#SELECT * FROM film WHERE title = 'Alone Trip';
SELECT actor_id, first_name, last_name
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



 #7d
 SELECT film_id, title 
 FROM film
 WHERE film_id IN
 (
	SELECT film_id
    FROM film_category
    WHERE category_id IN
    (
		SELECT category_id
        FROM category
        WHERE name = "Family"
	)
);




#7f
SELECT staff_id, SUM(amount) 
FROM payment
GROUP BY staff_id;
