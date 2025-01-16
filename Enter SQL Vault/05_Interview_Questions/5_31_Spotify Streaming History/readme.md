# Spotify Streaming History
# Spotify SQL Interview Question

## Scenario
You’re analyzing Spotify user streaming activity across two tables:
1. **`songs_history`**: Contains historical streaming data up to **July 31st, 2022**.
2. **`songs_weekly`**: Contains streaming data for the week of **August 1st to August 7th, 2022**.

Your task is to calculate the **cumulative count of song plays** (up to **August 4th, 2022**) for each user-song combination, **including new users or songs** introduced in the weekly data. The output should be sorted in descending order by cumulative plays.

---

## Definitions
- **Cumulative Count**: Total number of plays for a user-song combination up to **August 4th, 2022**, aggregated from both tables.
- The `songs_weekly` table includes new user-song combinations not present in `songs_history`.

---

## Table Schemas

### 1. `songs_history`

| Column Name  | Type     | Description                                                  |
|--------------|----------|--------------------------------------------------------------|
| `history_id` | integer  | Unique ID for the historical record                          |
| `user_id`    | integer  | Unique identifier for the user                               |
| `song_id`    | integer  | Unique identifier for the song                               |
| `song_plays` | integer  | Number of times the user has played the song historically    |

#### Example Input
| history_id | user_id | song_id | song_plays |
|------------|---------|---------|------------|
| 10011      | 777     | 1238    | 11         |
| 12452      | 695     | 4520    | 1          |

---

### 2. `songs_weekly`

| Column Name  | Type       | Description                                                 |
|--------------|------------|-------------------------------------------------------------|
| `user_id`    | integer    | Unique identifier for the user                              |
| `song_id`    | integer    | Unique identifier for the song                              |
| `listen_time`| datetime   | Timestamp indicating when the song was streamed             |

#### Example Input
| user_id | song_id | listen_time          |
|---------|---------|----------------------|
| 777     | 1238    | 08/01/2022 12:00:00 |
| 695     | 4520    | 08/04/2022 08:00:00 |
| 125     | 9630    | 08/04/2022 16:00:00 |
| 695     | 9852    | 08/07/2022 12:00:00 |

---

## Expected Output

| user_id | song_id | song_plays |
|---------|---------|------------|
| 777     | 1238    | 12         |
| 695     | 4520    | 2          |
| 125     | 9630    | 1          |

---

## Explanation

1. **User 777**:
   - Historical plays: 11 (`songs_history`).
   - Weekly plays (before August 5th): 1 (`songs_weekly`).
   - **Cumulative Total**: 11 + 1 = **12**.

2. **User 695** (song 4520):
   - Historical plays: 1 (`songs_history`).
   - Weekly plays (on August 4th): 1 (`songs_weekly`).
   - **Cumulative Total**: 1 + 1 = **2**.

3. **User 125** (song 9630):
   - No historical data (`songs_history`).
   - Weekly plays (on August 4th): 1 (`songs_weekly`).
   - **Cumulative Total**: 0 + 1 = **1**.

4. **Excluded Record**:
   - User 695, song 9852: Not included as its `listen_time` (August 7th) is outside the specified date range.

---

## Instructions
Write a SQL query to calculate:
1. The **cumulative song plays** for each user-song combination up to **August 4th, 2022**.
2. Include both historical data and weekly streaming data.
3. Ensure the results are sorted in descending order by `song_plays`.

### Requirements
- Use **joins** to combine `songs_history` and `songs_weekly` tables.
- Filter weekly data to include only plays up to **August 4th, 2022**.
- Use **aggregation** to sum historical and filtered weekly plays.
- Handle cases where a user-song combination exists only in one table.

> **No solution provided**—use your SQL knowledge to craft the query. Your result should match the **Expected Output** above.
