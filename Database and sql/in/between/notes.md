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
