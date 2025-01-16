# Fill Missing Client Data
# Accenture SQL Interview Question

# Filling NULL Categories in Product Data: Retail Challenge

## Scenario
While accessing Accenture's retailer client's database, you observe that the **`category`** column in the `products` table contains **NULL values**. To ensure accurate reporting and analysis, you must fill in these NULLs based on the following assumptions:

---

## Assumptions
1. **Sequential Grouping**:
   Products within the same category are **grouped together** sequentially by their `product_id`.

2. **Defined Starting Point**:
   The **first product** in each category has a **non-NULL** category value.

3. **Downward Propagation**:
   Subsequent NULLs within the group will **inherit** the category value of the previous product until a new non-NULL value is encountered.

---

## Table Schema: `products`

| Column Name | Type    | Description                              |
|-------------|---------|------------------------------------------|
| product_id  | integer | Unique identifier for each product       |
| category    | varchar | Product category (e.g., 'Shoes', 'Jeans') |
| name        | varchar | Name of the product                     |

---

## Example Input

| product_id | category | name                   |
|-----------:|----------|------------------------|
|          1 | Shoes    | Sperry Boat Shoe       |
|          2 | NULL     | Adidas Stan Smith      |
|          3 | NULL     | Vans Authentic         |
|          4 | Jeans    | Levi 511               |
|          5 | NULL     | Wrangler Straight Fit  |
|          6 | Shirts   | Lacoste Classic Polo   |
|          7 | NULL     | Nautica Linen Shirt    |

---

## Expected Output

| product_id | category | name                   |
|-----------:|----------|------------------------|
|          1 | Shoes    | Sperry Boat Shoe       |
|          2 | Shoes    | Adidas Stan Smith      |
|          3 | Shoes    | Vans Authentic         |
|          4 | Jeans    | Levi 511               |
|          5 | Jeans    | Wrangler Straight Fit  |
|          6 | Shirts   | Lacoste Classic Polo   |
|          7 | Shirts   | Nautica Linen Shirt    |

---

## Task
Write a SQL query to **propagate** the category values downward to fill all NULLs based on the rules above. Ensure the query maintains the sequential relationship of `product_id` and that no NULL values remain in the `category` column.

### Requirements
- Use SQL techniques such as **window functions** (e.g., `LAST_VALUE()`) or **self-joins** to address the NULL propagation logic.
- Ensure the query is efficient and adheres to the defined rules.
- Produce an output table with no NULL values in the `category` column.

---

## Notes
- This exercise mimics a **real-world data cleaning scenario**, where missing values need to be resolved systematically based on known relationships.
- Your solution should handle larger datasets efficiently while maintaining accuracy.
