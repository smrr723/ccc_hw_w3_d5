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
  customer_id REFERENCES customers(id) ON DELETE CASCADE,
  film_id REFERENCES customers(id) ON DELETE CASCADE
);
