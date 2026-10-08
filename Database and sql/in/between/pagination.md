# Pagination

E-commerce applications like Amazon and Flipkart may contain **millions of products**. However, users usually don't need all the products at once.

Fetching all the records at once can:

* Take more time.
* Consume more network data.
* Increase the load on the database and server.
* Provide a poor user experience.

**Pagination** solves this problem by retrieving only a **small chunk of data at a time**.

For example:

```text
Page 1 → Products 1–10
Page 2 → Products 11–20
Page 3 → Products 21–30
```

In SQL, pagination is commonly implemented using:

* `LIMIT`
* `OFFSET`

---

# 1. LIMIT

The `LIMIT` clause is used to specify the **maximum number of rows** to return.

## Syntax

```sql
SELECT column1, column2, ..., columnN
FROM table_name
LIMIT n;
```

Here, `n` represents the maximum number of rows to retrieve.

---

## Example

Get the details of the **2 top-rated products** from the `Puma` brand.

```sql
SELECT name, price, rating
FROM product
WHERE brand = "Puma"
ORDER BY rating DESC
LIMIT 2;
```

### Output

| name        | price | rating |
| ----------- | ----: | -----: |
| Black Shirt |   600 |    4.8 |
| Blue Shirt  |  1000 |    4.3 |

### How it works

```sql
ORDER BY rating DESC
```

First sorts the Puma products from highest rating to lowest rating.

```sql
LIMIT 2
```

Then selects only the first 2 products.

---

## Practice Question

### Question

Get the **3 lowest-priced products** from the `Puma` brand.

### Solution

```sql
SELECT name, price, rating
FROM product
WHERE brand = "Puma"
ORDER BY price ASC
LIMIT 3;
```

### Important Note

If the `LIMIT` value is greater than the total number of available rows, SQL returns **all available rows**.

For example:

```sql
LIMIT 100
```

If only 20 matching rows exist, all 20 rows will be returned.

---

# 2. OFFSET

The `OFFSET` clause is used to **skip a specified number of rows** before returning the results.

It is useful when implementing pagination.

## Syntax

```sql
SELECT column1, column2, ..., columnN
FROM table_name
LIMIT m
OFFSET n;
```

Where:

* `LIMIT m` → Number of rows to retrieve.
* `OFFSET n` → Number of rows to skip.

---

## Understanding OFFSET

Suppose the products are ordered like this:

```text
1 → Product A
2 → Product B
3 → Product C
4 → Product D
5 → Product E
6 → Product F
7 → Product G
8 → Product H
```

If we use:

```sql
LIMIT 3
OFFSET 2;
```

SQL skips the first 2 rows and returns the next 3:

```text
3 → Product C
4 → Product D
5 → Product E
```

---

# 3. LIMIT with OFFSET

`LIMIT` and `OFFSET` are commonly used together for pagination.

## Example

Get the details of **5 top-rated products, starting from the 7th row**.

```sql
SELECT name, price, rating
FROM product
ORDER BY rating DESC
LIMIT 5
OFFSET 6;
```

### Why `OFFSET 6`?

The 7th row comes after skipping the first 6 rows.

```text
OFFSET 6
↓
Skip rows 1–6
↓
Start from row 7
↓
LIMIT 5
↓
Return rows 7–11
```

### Output

| name                                | price | rating |
| ----------------------------------- | ----: | -----: |
| Bourbon Special                     |    15 |    4.6 |
| Realme Smart Band                   |  3000 |    4.6 |
| Harry Potter and the Goblet of Fire |   431 |    4.6 |
| Black Jeans                         |   750 |    4.5 |
| Potato Chips Cream & onion          |    63 |    4.5 |

---

# 4. Pagination Example

Suppose we want to display **10 products per page**.

### Page 1

```sql
SELECT *
FROM product
LIMIT 10
OFFSET 0;
```

Returns:

```text
Rows 1–10
```

### Page 2

```sql
SELECT *
FROM product
LIMIT 10
OFFSET 10;
```

Returns:

```text
Rows 11–20
```

### Page 3

```sql
SELECT *
FROM product
LIMIT 10
OFFSET 20;
```

Returns:

```text
Rows 21–30
```

### General Formula

If each page contains `n` rows:

```text
OFFSET = (page_number - 1) × n
```

For example, with 10 products per page:

```text
Page 1 → OFFSET 0
Page 2 → OFFSET 10
Page 3 → OFFSET 20
Page 4 → OFFSET 30
```

---

# 5. Possible Mistakes

## Mistake 1: Using OFFSET Before LIMIT

In SQLite, `LIMIT` should come before `OFFSET`.

### Incorrect

```sql
SELECT *
FROM product
OFFSET 2
LIMIT 4;
```

This results in a syntax error.

### Correct

```sql
SELECT *
FROM product
LIMIT 4
OFFSET 2;
```

---

## Mistake 2: Using Only OFFSET in SQLite

In SQLite, `OFFSET` cannot be used by itself.

### Incorrect

```sql
SELECT *
FROM product
OFFSET 2;
```

This results in a syntax error.

### Correct

```sql
SELECT *
FROM product
LIMIT 10
OFFSET 2;
```

---

# 6. Practice Question

### Question

Get the details of **5 top-rated products, starting from the 10th row**.

### Solution

```sql
SELECT name, price, rating
FROM product
ORDER BY rating DESC
LIMIT 5
OFFSET 9;
```

### Why `OFFSET 9`?

To start from the 10th row:

```text
10th row - 1 = 9
```

So we skip the first 9 rows and retrieve the next 5 rows.

---

# 7. Important Notes

### SQLite

In SQLite:

* `OFFSET` is used after `LIMIT`.
* The default `OFFSET` value is `0` when it is not specified.
* `OFFSET` cannot be used by itself.

Example:

```sql
SELECT *
FROM product
LIMIT 10
OFFSET 0;
```

### PostgreSQL

In PostgreSQL, `OFFSET` can be used with or without `LIMIT`.

---

# LIMIT vs OFFSET

| Clause   | Purpose                             |
| -------- | ----------------------------------- |
| `LIMIT`  | Specifies how many rows to retrieve |
| `OFFSET` | Specifies how many rows to skip     |

### Example

```sql
SELECT *
FROM product
LIMIT 10
OFFSET 20;
```

This means:

```text
Skip the first 20 rows
        ↓
Retrieve the next 10 rows
        ↓
Rows 21–30
```

---

# Quick Revision

## LIMIT

```sql
LIMIT 5;
```

Returns a maximum of **5 rows**.

## OFFSET

```sql
OFFSET 10;
```

Skips the first **10 rows**.

## Pagination

```sql
SELECT *
FROM product
ORDER BY rating DESC
LIMIT 10
OFFSET 20;
```

This:

1. Sorts products by rating.
2. Skips the first 20 rows.
3. Returns the next 10 rows.

---

# Key Takeaways

1. **Pagination** retrieves data in smaller chunks instead of loading everything at once.
2. `LIMIT` specifies the **number of rows to retrieve**.
3. `OFFSET` specifies the **number of rows to skip**.
4. `LIMIT` and `OFFSET` are commonly used together for pagination.
5. To start from the 10th row, use `OFFSET 9`.
6. In SQLite, `LIMIT` comes before `OFFSET`.
7. The default `OFFSET` value is `0`.
8. A good pagination query usually uses `ORDER BY` to ensure a predictable order.
