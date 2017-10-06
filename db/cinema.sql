DROP TABLE tickets;
DROP TABLE customers;
DROP TABLE films;

CREATE TABLE customers (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  funds INT4
);

CREATE TABLE films (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  price INT4
);

CREATE TABLE tickets (
  id SERIAL4 PRIMARY KEY,
  customer_id INT4 REFERENCES customers(id) ON DELETE CASCADE,
  film_id INT4 REFERENCES films(id) ON DELETE CASCADE
);


-- Your app should be able to:
--
-- Create customers, films and tickets
-- CRUD actions (create, read, update, delete) customers, films and tickets.
-- Show which films a customer has booked to see, and see which customers are coming to see one film.
-- Basic extensions:
--
-- Buying tickets should decrease the funds of the customer by the price
-- Check how many tickets were bought by a customer
-- Check how many customers are going to watch a certain film
-- Advanced extensions:
--
-- Create a screenings table that lets us know what time films are showing
-- Write a method that finds out what is the most popular time (most tickets sold) for a given film
-- Limit the available tickets for screenings.
-- Add any other extensions you think would be great to have at a cinema!
-- Possible useful info on constraints: https://www.postgresql.org/docs/9.3/static/ddl-constraints.html
