# SQL Basics

## 1. Introduction

* SQL = Structured Query Language
* Used to perform operations on relational databases.
* SQL is declarative.
* Common operations: Create, Retrieve, Update, Delete (CRUD).

---

# 2. Data Types

| Data Type         | Description          |
| ----------------- | -------------------- |
| `INTEGER` / `INT` | Whole numbers        |
| `FLOAT`           | Decimal numbers      |
| `VARCHAR(n)`      | Variable-length text |
| `TEXT`            | Large text           |
| `DATE`            | Date (`YYYY-MM-DD`)  |
| `TIME`            | Time (`HH:MM:SS`)    |
| `DATETIME`        | Date + time          |
| `BOOLEAN`         | `TRUE` / `FALSE`     |

Examples:

```sql
name VARCHAR(200);
age INTEGER;
score INTEGER;
percentage FLOAT;
address TEXT;
date_of_birth DATE;
start_time TIME;
created_at DATETIME;
is_won BOOLEAN;
```

---

# 3. CREATE TABLE

Used to create a new table.

### Syntax

```sql
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype
);
```

### Example

```sql
CREATE TABLE player (
    name VARCHAR(200),
    age INTEGER,
    score INTEGER
);
```

### Another Example

```sql
CREATE TABLE student (
    name VARCHAR(200),
    date_of_birth DATE,
    address TEXT
);
```

```sql
CREATE TABLE exam_schedule (
    name VARCHAR(200),
    course VARCHAR(200),
    exam_date_time DATETIME,
    duration_in_sec INTEGER,
    pass_percentage FLOAT
);
```

---

# 4. PRAGMA TABLE_INFO

Used in SQLite to view the structure/schema of a table.

### Syntax

```sql
PRAGMA TABLE_INFO(table_name);
```

### Example

```sql
PRAGMA TABLE_INFO(player);
```

It shows information such as:

* Column name
* Data type
* Whether NULL is allowed
* Default value
* Primary key information

---

# 5. INSERT INTO

Used to insert new rows into a table.

### Syntax

```sql
INSERT INTO table_name (column1, column2, column3)
VALUES (value1, value2, value3);
```

### Insert One Row

```sql
INSERT INTO player (name, age, score)
VALUES ('Rakesh', 39, 35);
```

### Insert Multiple Rows

```sql
INSERT INTO player (name, age, score)
VALUES
    ('Rakesh', 39, 35),
    ('Sai', 47, 30);
```

### Insert Boolean and Date Values

```sql
INSERT INTO match_details
    (team_name, played_with, venue, date, is_won)
VALUES
    ('CSK', 'MI', 'Chennai', '2020-04-21', TRUE),
    ('SRH', 'RR', 'Hyderabad', '2020-04-23', TRUE);
```

### Important

The number of values must match the number of columns.

```sql
-- Correct
INSERT INTO player (name, age, score)
VALUES ('Virat', 31, 30);

-- Incorrect
INSERT INTO player (name, age, score)
VALUES ('Virat', 31);
```

---

# 6. SELECT

Used to retrieve data from a table.

### Select Specific Columns

```sql
SELECT name, age
FROM player;
```

### Select All Columns

```sql
SELECT *
FROM player;
```

---

# 7. WHERE

Used to retrieve only rows that satisfy a condition.

### Syntax

```sql
SELECT column1, column2
FROM table_name
WHERE condition;
```

### Example

```sql
SELECT name, age
FROM player
WHERE name = 'Sai';
```

---

# 8. UPDATE

Used to modify existing data in a table.

### Update All Rows

```sql
UPDATE player
SET score = 100;
```

### Update Specific Rows

```sql
UPDATE player
SET score = 150
WHERE name = 'Ram';
```

### Important

Be careful when using `UPDATE` without `WHERE`.

```sql
UPDATE player
SET score = 100;
```

This changes the score of **every row**.

---

# 9. DELETE

Used to delete rows from a table.

### Delete All Rows

```sql
DELETE FROM player;
```

### Delete Specific Row(s)

```sql
DELETE FROM player
WHERE name = 'Shyam';
```

### Important

Always be careful with:

```sql
DELETE FROM player;
```

Without a `WHERE` condition, **all rows are deleted**.

---

# 10. DROP TABLE

Used to completely remove a table from the database.

### Syntax

```sql
DROP TABLE table_name;
```

### Example

```sql
DROP TABLE player;
```

`DROP TABLE` removes the **entire table**, including its structure and data.

---

# 11. DELETE vs DROP

### DELETE

Removes rows from an existing table.

```sql
DELETE FROM player
WHERE name = 'Shyam';
```

The table still exists.

### DROP

Removes the entire table.

```sql
DROP TABLE player;
```

The table no longer exists.

---

# 12. ALTER TABLE

Used to change the structure of an existing table.

---

## Add Column

### Syntax

```sql
ALTER TABLE table_name
ADD column_name datatype;
```

### Example

```sql
ALTER TABLE player
ADD jersey_num INTEGER;
```

Existing rows will have `NULL` for the newly added column unless a default value is specified.

---

## Rename Column

### Syntax

```sql
ALTER TABLE table_name
RENAME COLUMN old_name TO new_name;
```

### Example

```sql
ALTER TABLE player
RENAME COLUMN jersey_num TO jersey_number;
```

---

## Drop Column

### Syntax

```sql
ALTER TABLE table_name
DROP COLUMN column_name;
```

### Example

```sql
ALTER TABLE player
DROP COLUMN jersey_number;
```

---

# 13. ALTER vs UPDATE

### UPDATE

Changes the **data inside existing rows**.

```sql
UPDATE player
SET score = 100
WHERE name = 'Ram';
```

### ALTER

Changes the **structure of the table**.

```sql
ALTER TABLE player
ADD jersey_number INTEGER;
```

---

# 14. SQL Keywords and Case

SQL keywords are generally case-insensitive.

Both work:

```sql
SELECT *
FROM player;
```

```sql
select *
from player;
```

### Best Practice

Use uppercase for SQL keywords:

```sql
SELECT
    name,
    age
FROM player
WHERE age > 20;
```

This makes queries easier to read.

---

# Quick SQL Reference

```sql
-- Create table
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype
);

-- View table structure (SQLite)
PRAGMA TABLE_INFO(table_name);

-- Insert data
INSERT INTO table_name (column1, column2)
VALUES (value1, value2);

-- Retrieve specific columns
SELECT column1, column2
FROM table_name;

-- Retrieve all columns
SELECT *
FROM table_name;

-- Filter rows
SELECT *
FROM table_name
WHERE condition;

-- Update data
UPDATE table_name
SET column1 = value1
WHERE condition;

-- Delete rows
DELETE FROM table_name
WHERE condition;

-- Delete all rows
DELETE FROM table_name;

-- Delete entire table
DROP TABLE table_name;

-- Add column
ALTER TABLE table_name
ADD column_name datatype;

-- Rename column
ALTER TABLE table_name
RENAME COLUMN old_name TO new_name;

-- Drop column
ALTER TABLE table_name
DROP COLUMN column_name;
```
