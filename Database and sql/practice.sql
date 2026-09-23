CREATE TABLE student(name varchar(200), age integer, score integer);

CREATE TABLE customer (
  customer_id integer,
  first_name varchar(200),
  last_name varchar(200),
  date_of_birth date,
  address text,
  phone_number integer
)



CREATE TABLE order_details(
  order_id integer,
  customer_id integer,
  order_datetime datetime,
  shipped_datetime datetime,
  total_amount float
);



CREATE TABLE player(name varchar, age integer, score integer);
INSERT INTO
  player(name, age, score)
VALUES
  ("Ram", 28, 30);




  SELECT
  *
FROM
  player

  
INSERT INTO
  player(name, age, score)
VALUES
  ("Raj", 26, 120)  




  INSERT INTO
  player(name, age, score)
VALUES
  ("Ram", 28, 125),
  ("Charan", 25, 173),
  ("Ravan", 20, 152);


  DROP TABLE player



  ALTER TABLE
  player RENAME COLUMN name TO full_name



  SELECT
  name,
  age
FROM
  player


  ALTER TABLE
  player
ADD
  strike_rate float



DELETE FROM
  player
WHERE
  name = "David";






UPDATE
  player
SET
  age = 30
WHERE
  name = "Shyam";

########day 2######
problem statement:Consider an e-commerce company like Amazon that holds the data of a wide variety of products. While shopping online, we often search for the product or brand with a partial name over giving the exact name of the product. And, while applying filters, we tend to select if the price/rating is greater than a certain number over mentioning the exact number.

Comparison operators such as LIKE, equal to(=), greater than(>) help us fetch data for such queries.

Similar to the e-commerce scenario, we have a database that contains a range of products with details like the name of the product, category it belongs to, price, brand and rating. Help the user get the desired products by writing SQL queries satisfying user requirements.

Note: Expected output format for all the queries, unless specified.

queries and answers :



SELECT
  *
FROM
  Product
WHERE
  brand LIKE "Puma%";



SELECT
  *
FROM
  Product
WHERE
  rating > 4.0






SELECT
  *
FROM
  Product
WHERE
  price <= 1000