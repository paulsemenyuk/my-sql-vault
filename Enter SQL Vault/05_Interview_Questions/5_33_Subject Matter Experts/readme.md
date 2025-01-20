# Subject Matter Experts
# Accenture SQL Interview Question

# Identifying Subject Matter Experts (SMEs) at Accenture

## Scenario
You are tasked with identifying **Subject Matter Experts (SMEs)** at Accenture based on their **work experience** in specific domains. An employee qualifies as an SME if they meet **either** of the following criteria:

1. **Single Domain Expertise**:
   - An employee has **8 or more years** of work experience in a **single domain**.

2. **Combined Domain Expertise**:
   - An employee has **12 or more years** of work experience across **two different domains**.

---

## Assumptions
1. Employees with experience in **more than two domains** are **disregarded** for SME qualification.
2. The dataset contains sufficient information in the `employee_expertise` table to calculate SME status.

---

## Table Schema: `employee_expertise`

| Column Name          | Type      | Description                                            |
|----------------------|-----------|--------------------------------------------------------|
| `employee_id`        | integer   | Unique identifier for each employee                   |
| `domain`             | string    | The domain of expertise                               |
| `years_of_experience`| integer   | Years of experience in the specific domain            |

---

## Example Input

| employee_id | domain                  | years_of_experience |
|-------------|-------------------------|----------------------|
| 101         | Digital Transformation  | 9                    |
| 102         | Supply Chain            | 6                    |
| 102         | IoT                     | 7                    |
| 103         | Change Management       | 4                    |
| 104         | DevOps                  | 5                    |
| 104         | Cloud Migration         | 5                    |
| 104         | Agile Transformation    | 5                    |

---

## Expected Output

| employee_id |
|-------------|
| 101         |
| 102         |

---

## Explanation

1. **Employee 101**:
   - Has **9 years** of experience in "Digital Transformation", meeting the **8-year single domain requirement**.
   - **SME Status**: Qualified.

2. **Employee 102**:
   - Has **6 years** in "Supply Chain" and **7 years** in "IoT".
   - Combined years of experience = **6 + 7 = 13**, meeting the **12-year combined domain requirement**.
   - **SME Status**: Qualified.

3. **Employee 103**:
   - Only **4 years** in "Change Management".
   - Does not meet either requirement.
   - **SME Status**: Not Qualified.

4. **Employee 104**:
   - Has experience in **three domains** ("DevOps", "Cloud Migration", "Agile Transformation").
   - Per the assumptions, employees with **more than two domains** are disregarded.
   - **SME Status**: Not Qualified.

---

## Task
Write a query to:
1. Identify employees who meet the **single domain** or **combined domain** criteria.
2. Exclude employees with experience in **more than two domains**.
