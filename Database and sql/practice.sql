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