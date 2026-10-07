SELECT
  *
FROM
  product
WHERE
  category LIKE "Clothing"
  AND price < 700






SELECT
  *
FROM
  product
WHERE
  brand LIKE "Denim"
  AND rating > 4





SELECT
  *
FROM
  product
WHERE
  price <= 1000
  AND rating > 4.0



SELECT
  *
FROM
  product
WHERE
  rating > 3.6
  AND price < 1000
  AND brand LIKE "Puma";


SELECT
  *
FROM
  product
WHERE
  brand LIKE "Denim"
  OR brand LIKE "Puma"
  OR brand LIKE "Nike";



SELECT
  *
FROM
  product
WHERE
  brand LIKE "Redmi"
  OR brand LIKE "Oneplus"
  AND rating > 4;




SELECT
  *
FROM
  product
WHERE
  name LIKE '%cake%'
  AND (
    brand = "Cadbury"
    OR brand = "Britannia"
  )
  AND rating > 4.0;


SELECT
  *
FROM
  product
WHERE
  brand LIKE "Puma"
  AND rating > 3.5
  OR (
    brand LIKE "Denim"
    AND rating > 4.0
  );



SELECT
  *
FROM
  product
WHERE
  name LIKE '%shirt%'
  AND NOT name LIKE '%Black%'
  AND brand LIKE "Puma"
  OR brand LIKE "Nike"
  OR brand LIKE "Levi's";


