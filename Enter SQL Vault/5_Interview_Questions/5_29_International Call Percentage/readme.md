# International Call Percentage

# Calculating the Percentage of International Phone Calls

## Scenario
A phone call is **international** if the **caller’s country** is different from the **receiver’s country**. We want to determine **what percentage of total calls** are international, **rounded to 1 decimal place**.

---

## Table Schemas

### 1. `phone_calls`
| Column Name | Type      | Description                                                    |
|-------------|-----------|----------------------------------------------------------------|
| caller_id   | integer   | The unique identifier for the caller                          |
| receiver_id | integer   | The unique identifier for the receiver                        |
| call_time   | timestamp | The date and time the call took place                         |

#### Example Input
| caller_id | receiver_id | call_time              |
|----------:|------------:|------------------------|
| 1         | 2           | 2022-07-04 10:13:49    |
| 1         | 5           | 2022-08-21 23:54:56    |
| 5         | 1           | 2022-05-13 17:24:06    |
| 5         | 6           | 2022-03-18 12:11:49    |

---

### 2. `phone_info`
| Column Name | Type     | Description                                              |
|-------------|----------|----------------------------------------------------------|
| caller_id   | integer  | The same ID as `caller_id` in `phone_calls` (for both caller and receiver) |
| country_id  | integer or string | The country code or identifier (e.g., US, IN)           |
| network     | string   | The mobile network operator                               |
| phone_number| string   | The actual phone number                                   |

#### Example Input
| caller_id | country_id | network  | phone_number      |
|----------:|:----------:|:--------:|:------------------|
| 1         | US         | Verizon  | +1-212-897-1964   |
| 2         | US         | Verizon  | +1-703-346-9529   |
| 3         | US         | Verizon  | +1-650-828-4774   |
| 4         | US         | Verizon  | +1-415-224-6663   |
| 5         | IN         | Vodafone | +91 7503-907302   |
| 6         | IN         | Vodafone | +91 2287-664895   |

---

## Expected Output (Example)

| international_calls_pct |
|------------------------:|
| 50.0                    |

**Explanation**
- There are **4** calls total.
- **2** of them are international:
  - `caller_id = 1` calling `receiver_id = 5` (US → IN)
  - `caller_id = 5` calling `receiver_id = 1` (IN → US)
- Therefore, \(\frac{2}{4} \times 100 = 50.0\%\).
