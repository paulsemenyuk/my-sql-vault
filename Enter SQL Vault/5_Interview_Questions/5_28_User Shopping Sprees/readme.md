# User Shopping Sprees

# Identifying Shopping Sprees on Amazon

## Scenario
A **shopping spree** occurs when a user makes **purchases on 3 or more consecutive days**. We have a **`transactions`** table containing each user’s purchases. We want to list the **user IDs** who have **at least one** such spree, **in ascending order**.

---

## Table: `transactions`

| Column Name       | Type     | Description                                  |
|-------------------|----------|----------------------------------------------|
| user_id           | integer  | Unique ID for the user                       |
| amount            | float    | Purchase amount                              |
| transaction_date  | timestamp | Date & time the transaction occurred         |

### Example Input

| user_id | amount | transaction_date          |
|--------:|-------:|---------------------------|
| 1       | 9.99   | 08/01/2022 10:00:00       |
| 1       | 55.00  | 08/17/2022 10:00:00       |
| 2       | 149.50 | 08/05/2022 10:00:00       |
| 2       | 4.89   | 08/06/2022 10:00:00       |
| 2       | 34.00  | 08/07/2022 10:00:00       |

---

## Expected Output (Example)

| user_id |
|--------:|
| 2       |

**Explanation**
- **User 2** has transactions on **08/05/2022**, **08/06/2022**, and **08/07/2022**, which are **3 consecutive days**. Thus, user 2 is identified as going on a shopping spree.
- **User 1** does not have 3 consecutive days of purchases; hence they are excluded.
