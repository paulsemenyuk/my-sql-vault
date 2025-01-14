-- Solution

SELECT
    team_id,
    AVG(age) AS avg_team_age,
    CASE
    WHEN AVG(age) < 40 THEN 'Fit'
    WHEN AVG(age) BETWEEN 40 AND 50 THEN 'Grizzled'
    ELSE 'Elderly'
END AS age_group,
RANK() OVER (ORDER BY AVG(age) DESC) AS age_rank
FROM player
WHERE status = 'alive'
AND team_id IS NOT NULL
GROUP BY team_id
HAVING COUNT(*) = 10
ORDER BY age_rank;

# SQL Query: Analyzing and Ranking Teams by Average Age

## Overview

This query is designed to analyze teams based on their **average player age**, categorize them into **age groups**, and rank them based on their average age. Here's a breakdown of the query and how it works.

---

## **Query Logic**

### **SELECT Clause**
- **`team_id`**: Retrieves the ID of each team.
- **`AVG(age) AS avg_team_age`**: Calculates the average age of the players in each team, labeled as `avg_team_age`.
- **`CASE ... END AS age_group`**: Categorizes teams into three groups:
  - **Fit**: Average age is less than 40.
  - **Grizzled**: Average age is between 40 and 50 (inclusive).
  - **Elderly**: Average age is greater than 50.
- **`RANK() OVER (ORDER BY AVG(age) DESC) AS age_rank`**: Assigns a rank to each team, with the highest average age being **rank 1**.

---

### **FROM Clause**
- **`FROM player`**: Fetches data from the `player` table.

---

### **WHERE Clause**
- **`status = 'alive'`**: Includes only players who are still alive.
- **`team_id IS NOT NULL`**: Excludes players who are not part of any team (`NULL` team_id).

---

### **GROUP BY Clause**
- **`GROUP BY team_id`**: Groups the data by `team_id`, allowing aggregate calculations (e.g., `AVG(age)`, `COUNT(*)`) for each team.

---

### **HAVING Clause**
- **`HAVING COUNT(*) = 10`**: Ensures that only teams with exactly **10 players** are included.

---

### **ORDER BY Clause**
- **`ORDER BY age_rank`**: Sorts the output by the **age_rank**, with rank **1** being the team with the highest average age.

---

## **Expected Output**

For each team, the query outputs:
1. **`team_id`**: The team's unique identifier.
2. **`avg_team_age`**: The calculated average age of the players in the team.
3. **`age_group`**: Categorization of the team based on their average age:
   - **Fit**: Average age < 40.
   - **Grizzled**: Average age between 40 and 50.
   - **Elderly**: Average age > 50.
4. **`age_rank`**: Rank of the team based on their average age (highest average = rank 1).

---
Query Execution Steps
	1.	Filter Rows:
	•	Select only players who are alive and belong to a team (team_id IS NOT NULL).
	2.	Group Players:
	•	Group the filtered data by team_id.
	3.	Aggregate Data:
	•	Calculate the average age for each team.
	•	Ensure only teams with exactly 10 players are included using the HAVING clause.
	4.	Rank Teams:
	•	Rank teams based on their average age in descending order.
	5.	Categorize Teams:
	•	Assign an age group to each team based on their average age.
	6.	Order Results:
	•	Display teams in order of their rank (age_rank).
