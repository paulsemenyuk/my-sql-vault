-- Solution

Solution
Step 1: Assigning Numbers to Categories using Window Function

We can start by creating an additional column to update the categories for products that have null values.

To achieve this, we can use the COUNT() function as a window function, which assigns a numeric value to each category type. The COUNT() function calculates the number of rows with non-null values in the category column and the window function allows us to apply it to the entire result set.

SELECT
  *,
  COUNT(category) OVER (ORDER BY product_id) AS numbered_category
FROM products;
The output of the query generates a numbered category for each row in the numbered_category column.

For example, the first 5 rows of the output will look like this:

product_id	category	name	numbered_category
1	Shoes	Sperry Boat Shoe	1
2	NULL	Adidas Stan Smith	1
3	NULL	Vans Authentic	1
4	Jeans	Levi 511	2
5	NULL	Wrangler Straight Fit	2
Product ID 1 is categorized as 'Shoes' and assigned the value of 1 in the numbered_category column. For Product IDs 2 and 3, which have no category assigned, the counter remains at 1 in the numbered_category column. However, Product ID 4 is labeled as 'Jeans', which is a non-null value, and thus the counter gets increased to 2 for this product.

Step 2: Filling Missing Categories using COALESCE() Function

Next, we fill the missing categories using the COALESCE() function.

WITH filled_category AS (
SELECT
  *,
  COUNT(category) OVER (
    ORDER BY product_id) AS numbered_category
FROM products
)

SELECT
  product_id,
  COALESCE(
    category,
    MAX(category) OVER (PARTITION BY numbered_category)) AS category,
  name
FROM filled_category;
How COALESCE() function works with two expressions:

category: If the category column is not null, the category value is returned.
MAX(category) OVER (PARTITION BY numbered_category): If the category value is null, it returns the maximum category value within the same numbered_category partition. In other words, it looks for the non-null category value from other rows that share the same numbered_category. This ensures that the missing category values are filled with the appropriate value from the same category group based on the numbered_category column.
For example, product IDs 1, 2, and 3 are assigned the value of 1 in the numbered_category column. Since the maximum value within this numbered_category partition is also 1, the COALESCE() function assigns the corresponding category value to product IDs 2 and 3, filling in the missing values based on the category of product ID 1.


You may find this Stack Overflow post helpful as it provides a concise explanation of a similar question.
https://stackoverflow.com/questions/56728095/postgresql-last-value-ignore-nulls
