# IN and BETWEEN Operators

In SQL, the **IN** and **BETWEEN** operators are commonly used to filter data based on a list of values or a range of values.

---

## 1. IN Operator

The `IN` operator is used to check whether a column value matches **any value from a given list**.

### Syntax

```sql
SELECT *
FROM table_name
WHERE column_name IN (value1, value2, value3);
```

### Example

Get all products whose brand is **Puma, Levi's, Mufti, Lee, or Denim**.

```sql
SELECT *
FROM product
WHERE brand IN ("Puma", "Levi's", "Mufti", "Lee", "Denim");
```

### Using IN with Multiple Conditions

We can combine `IN` with other conditions using `AND` or `OR`.

For example, get all products that:

* Belong to the `Food` category
* Have a brand of `Britannia`, `Lay's`, or `Cadbury`

```sql
SELECT *
FROM product
WHERE category = "Food"
AND brand IN ("Britannia", "Lay's", "Cadbury");
```

### Why use IN?

Instead of writing:

```sql
WHERE brand = "Puma"
   OR brand = "Levi's"
   OR brand = "Mufti"
   OR brand = "Lee"
   OR brand = "Denim";
```

We can write:

```sql
WHERE brand IN ("Puma", "Levi's", "Mufti", "Lee", "Denim");
```

This makes the query **shorter, cleaner, and easier to read**.

---

# 2. BETWEEN Operator

The `BETWEEN` operator is used to check whether a column value lies within a specified range.

### Syntax

```sql
SELECT *
FROM table_name
WHERE column_name BETWEEN lower_limit AND upper_limit;
```

### Example

Find products with prices ranging from **1000 to 5000**.

```sql
SELECT name, price, brand
FROM product
WHERE price BETWEEN 1000 AND 5000;
```

### Important: BETWEEN is Inclusive

`BETWEEN` includes **both the lower and upper limits**.

For example:

```sql
WHERE price BETWEEN 1000 AND 5000;
```

This includes:

* `1000`
* `5000`
* All values between them

It is equivalent to:

```sql
WHERE price >= 1000
AND price <= 5000;
```

---

# 3. Possible Mistakes with BETWEEN

## Mistake 1: Reversing the Limits

The lower limit should normally come first, followed by the upper limit.

Correct:

```sql
SELECT name, price, brand
FROM product
WHERE price BETWEEN 300 AND 500;
```

Incorrect:

```sql
SELECT name, price, brand
FROM product
WHERE price BETWEEN 500 AND 300;
```

The second query does not represent a valid ascending range and will normally return no rows.

---

## Mistake 2: Missing One of the Limits

Both limits are required.

Incorrect:

```sql
SELECT name, price, brand
FROM product
WHERE price BETWEEN AND 300;
```

This results in a syntax error.

If you only want values up to `300`, use:

```sql
SELECT name, price, brand
FROM product
WHERE price <= 300;
```

---

## Mistake 3: Using Incompatible Data Types

The column being compared should contain values that are compatible with the range values.

For example, `price` is a numeric column, so numeric values should be used:

```sql
WHERE price BETWEEN 300 AND 500;
```

Avoid using a text column with numeric range values:

```sql
WHERE name BETWEEN 300 AND 500;
```

The behavior may be unexpected or depend on the database system.

---

# 4. IN vs BETWEEN

| Operator  | Purpose                                  | Example                      |
| --------- | ---------------------------------------- | ---------------------------- |
| `IN`      | Checks against a list of specific values | `brand IN ("Puma", "Nike")`  |
| `BETWEEN` | Checks whether a value is within a range | `price BETWEEN 500 AND 1000` |

### IN

Use `IN` when you have **specific values**:

```sql
WHERE brand IN ("Puma", "Nike", "Levi's");
```

### BETWEEN

Use `BETWEEN` when you have a **range**:

```sql
WHERE price BETWEEN 500 AND 1000;
```

---

# 5. Quick Revision

### IN

```sql
WHERE column_name IN (value1, value2, value3);
```

* Used for a list of values
* Checks whether a value matches any item in the list
* Makes multiple `OR` conditions cleaner

### BETWEEN

```sql
WHERE column_name BETWEEN lower_limit AND upper_limit;
```

* Used for a range
* Includes both boundary values
* Lower limit should come before upper limit
* Both limits are required

---

## Key Takeaways

1. `IN` is used to match a value against a **list of values**.
2. `BETWEEN` is used to filter values within a **range**.
3. `BETWEEN` is **inclusive** of both limits.
4. `IN` can make multiple `OR` conditions shorter and easier to read.
5. Always provide both the lower and upper limits with `BETWEEN`.
6. Use compatible data types when applying `BETWEEN`.



# ORDER BY and DISTINCT

In SQL, we often need to:

* Sort data based on price, rating, name, etc.
* Retrieve only unique values from a table.

For these requirements, we use the **`ORDER BY`** and **`DISTINCT`** clauses.

---

# 1. ORDER BY

The `ORDER BY` clause is used to **sort the rows** returned by a query.

By default, `ORDER BY` sorts data in **ascending order (`ASC`)**.

## Syntax

```sql
SELECT column1, column2, ..., columnN
FROM table_name
WHERE condition
ORDER BY column1 ASC / DESC;
```

### Sorting Options

| Keyword | Meaning          |
| ------- | ---------------- |
| `ASC`   | Ascending order  |
| `DESC`  | Descending order |

* `ASC` → Low to high / A to Z
* `DESC` → High to low / Z to A

---

## Example

Get all products from the **Puma** brand in the order of **lowest price first**.

```sql
SELECT name, price, rating
FROM product
WHERE brand = "Puma"
ORDER BY price ASC;
```

### Output

| name        | price | rating |
| ----------- | ----: | -----: |
| Black Shirt |   600 |    4.8 |
| Blue Jeans  |   800 |    3.6 |
| Blue Shirt  |  1000 |    4.3 |

---

# 2. ORDER BY with Multiple Columns

We can specify multiple columns in the `ORDER BY` clause.

SQL first sorts the data using the **first column**. If two or more rows have the same value in the first column, SQL then uses the **second column** to sort those rows.

This continues for any additional columns.

## Syntax

```sql
SELECT column1, column2, ..., columnN
FROM table_name
WHERE condition
ORDER BY column1 ASC / DESC,
         column2 ASC / DESC;
```

---

## Example 1

Get all products with the name **"Blue Shirt"**, sorted by:

1. Highest rating first
2. Lowest price first

```sql
SELECT name, price, rating
FROM product
WHERE name = "Blue Shirt"
ORDER BY rating DESC, price ASC;
```

### Output

| name       | price | rating |
| ---------- | ----: | -----: |
| Blue Shirt |  1000 |    4.3 |
| Blue Shirt |   750 |    3.8 |

Here:

```sql
ORDER BY rating DESC, price ASC;
```

means:

* First, sort by `rating` from highest to lowest.
* If two products have the same rating, sort them by `price` from lowest to highest.

---

## Example 2

Get all products with the name **"Black Jeans"** or **"Blue Shirt"**, sorted by:

1. Lowest price first
2. Highest rating first

```sql
SELECT name, price, rating
FROM product
WHERE name IN ("Black Jeans", "Blue Shirt")
ORDER BY price ASC, rating DESC;
```

### Output

| name        | price | rating |
| ----------- | ----: | -----: |
| Black Jeans |   750 |    4.5 |
| Blue Shirt  |   750 |    3.8 |
| Blue Shirt  |  1000 |    4.3 |

Here, `price` is the first sorting column.

Both `Black Jeans` and `Blue Shirt` have a price of `750`, so SQL uses the second column, `rating`, to determine their order.

---

# 3. Important Rule for Multiple Columns

Consider:

```sql
ORDER BY price ASC, rating DESC;
```

The sorting happens in this order:

```text
1. Sort by price → ASC
2. If price is the same → sort by rating → DESC
```

The **first column has higher priority** than the columns that follow it.

---

# 4. Practice Question

### Question

Get all the shirts from the `product` table in:

1. Descending order of `rating`
2. Ascending order of `price`

Assume a product is a shirt if its `name` contains `"Shirt"`.

### Solution

```sql
SELECT name, price, rating
FROM product
WHERE name LIKE "%Shirt%"
ORDER BY rating DESC, price ASC;
```

---

# 5. DISTINCT

The `DISTINCT` keyword is used to return **unique values** from a column or combination of columns.

It removes duplicate rows from the result.

## Syntax

```sql
SELECT DISTINCT column1, column2, ..., columnN
FROM table_name
WHERE condition;
```

---

## Example

Get all the **unique brands** present in the `product` table.

```sql
SELECT DISTINCT brand
FROM product;
```

If you also want the brands in alphabetical order:

```sql
SELECT DISTINCT brand
FROM product
ORDER BY brand;
```

### Output

| brand |
| ----- |
| Absa  |
| Apple |
| ...   |

---

# 6. DISTINCT with ORDER BY

`DISTINCT` and `ORDER BY` can be used together.

For example:

```sql
SELECT DISTINCT brand
FROM product
ORDER BY brand ASC;
```

This query:

1. Removes duplicate brands.
2. Sorts the remaining brands alphabetically.

---

# 7. DISTINCT with Multiple Columns

`DISTINCT` can be applied to multiple columns.

```sql
SELECT DISTINCT brand, category
FROM product;
```

Here, SQL returns unique **brand + category combinations**.

For example, if the table contains:

| brand | category |
| ----- | -------- |
| Puma  | Clothing |
| Puma  | Clothing |
| Puma  | Footwear |
| Nike  | Clothing |

The result will be:

| brand | category |
| ----- | -------- |
| Puma  | Clothing |
| Puma  | Footwear |
| Nike  | Clothing |

The duplicate `Puma + Clothing` combination is removed.

---

# 8. ORDER BY vs DISTINCT

| Clause     | Purpose                       |
| ---------- | ----------------------------- |
| `ORDER BY` | Sorts the result              |
| `DISTINCT` | Removes duplicate values/rows |

### ORDER BY

```sql
SELECT *
FROM product
ORDER BY price ASC;
```

Sorts products by price.

### DISTINCT

```sql
SELECT DISTINCT brand
FROM product;
```

Returns each brand only once.

### Using Both

```sql
SELECT DISTINCT brand
FROM product
ORDER BY brand ASC;
```

Returns unique brands in alphabetical order.

---

# Quick Revision

## ORDER BY

```sql
SELECT *
FROM product
ORDER BY price ASC;
```

* Used to sort rows.
* `ASC` → Ascending order.
* `DESC` → Descending order.
* Default order is usually `ASC`.
* Multiple columns can be used.
* The first column has the highest sorting priority.

## DISTINCT

```sql
SELECT DISTINCT brand
FROM product;
```

* Used to retrieve unique values.
* Removes duplicate rows from the result.
* Can be combined with `ORDER BY`.
* Can be used with multiple columns.

---

## Key Takeaways

1. Use `ORDER BY` when you need to **sort data**.
2. Use `ASC` for ascending order.
3. Use `DESC` for descending order.
4. When using multiple columns with `ORDER BY`, the first column gets the highest priority.
5. Use `DISTINCT` to **remove duplicate results**.
6. `DISTINCT` and `ORDER BY` can be used together.
