# Level 2
# Rations

# Squid Game Data Analysis: Food Rations Calculation

## Scenario
**Congratulations** on passing Level 1, Data Scientist! The Front Man is impressed—though you *did* see what happened to the last person who questioned his methods, right? Best keep your head down and your **queries** error-free.

**Now** for the next challenge:
We need to figure out how many **food portions** to withhold to create the right amount of tension. More specifically:

1. **Identify** how many **non-insider, alive** players remain.
2. **Determine** how many rations would feed **90%** of those alive, non-insider players (rounded **down**).
3. In **another** column, indicate **True** or **False** depending on whether the **current rations** supply is **sufficient** to meet that 90% threshold.

Then, we can optimize resource allocation (i.e., starve them just *enough*) and keep the “games” going.

---

## Potential Table Schema
We might have a table named `players` with columns:

| Column Name         | Type      | Description                                              |
|---------------------|-----------|----------------------------------------------------------|
| player_id           | integer   | Unique ID for each player                                |
| name                | varchar   | The name of the player                                   |
| status              | varchar   | 'alive' or 'eliminated'                                  |
| is_insider          | boolean   | Indicates whether the player is an 'insider' or not      |
| current_rations     | integer   | Current stock of food rations (same value repeated, or stored separately?) |

*(You could store `current_rations` in a separate table if needed, but for simplicity, let's assume it’s here or you have a second table to JOIN.)*

---

### Example Data (Hypothetical)

| player_id | name          | status   | is_insider | current_rations |
|----------:|--------------:|---------:|-----------:|----------------:|
| 1         | Seong Gi-hun  | alive    | false      | 2000            |
| 2         | Oh Il-nam     | alive    | true       | 2000            |
| 3         | Jang Deok-su  | alive    | false      | 2000            |
| 4         | Han Mi-nyeo   | alive    | false      | 2000            |
| 5         | Kang Sae-byeok| eliminated| false     | 2000            |

In this example, the total alive players = 4 (IDs 1, 2, 3, 4). Among them, `is_insider = true` for player 2, so the number of **alive & non-insider** players is 3 (IDs 1, 3, 4).

- **90%** of 3 = 2.7 → Round **down** = 2 rations needed.
- If `current_rations` = 2000, obviously that’s more than enough for 2. So the "Sufficient" column would be **True**.

---

## Required Output
We want a small table or query result indicating:

1. The **number_of_non_insider_alive_players**.
2. The **rations_for_90pct** (rounded down).
3. A **boolean** indicating if `current_rations >= rations_for_90pct`.

---

## Example Output

| number_of_non_insider_alive | rations_for_90pct | sufficient |
|----------------------------:|-------------------:|:----------:|
| 3                           | 2                 | True       |

---
