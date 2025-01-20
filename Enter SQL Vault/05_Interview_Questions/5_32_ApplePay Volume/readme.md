# ApplePay Volume
# Visa SQL Interview Question

# Visa-ApplePay Transaction Analysis

## Scenario
Visa is analyzing its partnership with **ApplePay** to calculate the **total transaction volume** for each merchant where the transaction was performed using **ApplePay**. For merchants with no ApplePay transactions, their total transaction volume should be output as **0**. The results must be displayed in **descending order** of the transaction volume.

---

## Table Schema: `transactions`

| Column Name         | Type      | Description                                           |
|---------------------|-----------|-------------------------------------------------------|
| `merchant_id`       | integer   | Unique identifier for the merchant                   |
| `transaction_amount`| integer   | Amount of the transaction in dollars                 |
| `payment_method`    | varchar   | Payment method used for the transaction              |

---

## Example Input

| merchant_id | transaction_amount | payment_method       |
|-------------|--------------------|----------------------|
| 1           | 600                | Contactless Chip     |
| 1           | 850                | apple pay            |
| 1           | 500                | Apple Pay            |
| 2           | 560                | Magstripe            |
| 2           | 400                | Samsung Pay          |
| 4           | 1200               | apple pay            |

---

## Expected Output

| merchant_id | total_transaction |
|-------------|-------------------|
| 1           | 1350             |
| 4           | 1200             |
| 2           | 0                |

---

## Explanation

1. **Merchant 1**:
   - Two ApplePay transactions: $850 + $500 = **$1,350**.
   - Other payment methods (e.g., "Contactless Chip") are ignored.

2. **Merchant 4**:
   - One ApplePay transaction: $1,200.

3. **Merchant 2**:
   - No ApplePay transactions. Total = **0**.

---

## Task

Write a query that:
1. **Filters ApplePay transactions** (case insensitive).
2. Calculates the **total transaction volume** for each merchant.
3. Outputs **0** for merchants without ApplePay transactions.
4. **Sorts the results** in descending order of total transaction volume.
