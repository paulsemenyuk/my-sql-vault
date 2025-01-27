# Active User Retention
# Facebook SQL Interview Question

## Scenario
This problem is inspired by **problem #23** in the SQL Chapter of *Ace the Data Science Interview*!

You’re tasked with identifying the **Monthly Active Users (MAUs)** for **July 2022**. An active user is defined as any user who performed actions such as **'sign-in'**, **'like'**, or **'comment'** in **both the current month and the previous month**.

---

## Table Schema: `user_actions`

| Column Name  | Type     | Description                                   |
|--------------|----------|-----------------------------------------------|
| `user_id`    | integer  | Unique identifier for each Facebook user      |
| `event_id`   | integer  | Unique identifier for each user action        |
| `event_type` | string   | Type of action performed (e.g., 'sign-in')    |
| `event_date` | datetime | Date and time of the action                   |

---

## Example Input

| user_id | event_id | event_type | event_date          |
|---------|----------|------------|---------------------|
| 445     | 7765     | sign-in    | 05/31/2022 12:00:00 |
| 742     | 6458     | sign-in    | 06/03/2022 12:00:00 |
| 445     | 3634     | like       | 06/05/2022 12:00:00 |
| 742     | 1374     | comment    | 06/05/2022 12:00:00 |
| 648     | 3124     | like       | 06/18/2022 12:00:00 |

---

## Expected Output (For June 2022 Example)

| month | monthly_active_users |
|-------|-----------------------|
| 6     | 1                     |

---

### Explanation (For June 2022)
In this example:
1. User **445** performed actions in **both May and June 2022**, making them a **monthly active user** for June.
2. User **742** only performed actions in June, so they are **not considered active** for June (no actions in May).
3. User **648** only performed actions in June, so they are also **not considered active** for June.

Therefore, the only **monthly active user** for June 2022 is **user_id 445**.

---

## Task
1. Write a SQL query to calculate the **number of Monthly Active Users (MAUs)** for **July 2022**.
2. Include the **month** (in numerical format) and the count of active users (`monthly_active_users`) in your output.

---

## Key Points to Consider
- An active user must have actions in **both the current month (July 2022)** and **the previous month (June 2022)**.
- Your query should dynamically filter for users with actions in **July 2022** and ensure those users also had actions in **June 2022**.

---

## Hint
- Consider joining the `user_actions` table on itself to compare users' actions in consecutive months.
- Use date functions to extract the **month** and **year** from the `event_date`.

---

## No Solution Provided
Use your SQL knowledge to craft the query and identify the active users for **July 2022**. Ensure your solution adheres to the logic described above. Good luck!
