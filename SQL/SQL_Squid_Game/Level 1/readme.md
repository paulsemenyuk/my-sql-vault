# Level 1
# Red Light Green Light

# Squid Game Data Analysis: Identifying Vulnerable Players

## Scenario
Welcome, Data Scientist! It's me, the Front Man. I see you've accepted my... unique employment opportunity.

We've set up our operations on a private island—and before you ask, **no**, not **that** kind of private island.

You’ve joined just in time: the first game of **Red Light, Green Light** just finished, generating fresh data and, well... fresh *bodies* to handle. Your immediate task is to sift through the surviving players’ information.

---

## Goal
We want to identify **vulnerable living players** who might be easily manipulated for the next game. Specifically, a player is considered **vulnerable** if:

1. They are **alive** (i.e., not eliminated).
2. They have **severe debt** (i.e., debt > 400,000,000 won).
3. They are **either**:
   - **Elderly** (age > 65)
   **OR**
   - Have a **vice of 'Gambling'** **and** **no family connections**.

---

## Possible Table Schema

Let’s assume we have a table named `players` with the following columns:

| Column Name         | Type      | Description                                     |
|---------------------|-----------|-------------------------------------------------|
| player_id           | integer   | Unique ID for each player                       |
| name                | varchar   | Player’s name                                   |
| status              | varchar   | Status can be 'alive' or 'eliminated'           |
| debt                | integer   | Debt amount in won                              |
| age                 | integer   | Age of the player                               |
| vice                | varchar   | The player’s known vice (e.g., 'Gambling', 'Drugs', etc.) |
| family_connections  | integer   | Number of immediate family members connected to the player |

### Example Data (Hypothetical)

| player_id | name           | status   | debt       | age | vice       | family_connections |
|-----------|---------------|----------|------------|-----|------------|--------------------|
| 101       | Seong Gi-hun   | alive    | 456000000  | 47  | Gambling   | 1                  |
| 102       | Oh Il-nam      | alive    | 1000000000 | 77  | None       | 0                  |
| 103       | Jang Deok-su   | alive    | 1200000000 | 37  | Violence   | 0                  |
| 104       | Han Mi-nyeo    | alive    | 300000000  | 45  | Deception  | 2                  |
| 105       | Yoo Song-woo   | alive    | 410000000  | 68  | None       | 0                  |
| 106       | Im Hyo-rin     | alive    | 500000000  | 29  | Gambling   | 0                  |
| 107       | Park Ji-eun    | eliminated | 700000000 | 23  | Drugs      | 3                  |

- **player_id 102**: Elderly, in debt over 400M, alive.
- **player_id 106**: Has a vice of Gambling, no family connections, in severe debt, alive.

---
