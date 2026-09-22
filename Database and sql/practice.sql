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