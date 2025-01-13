-- Solution

WITH temperature_extremes AS (
    SELECT month
    FROM monthly_temperatures
    WHERE avg_temperature = (SELECT MAX(avg_temperature) FROM monthly_temperatures)
        OR avg_temperature = (SELECT MIN(avg_temperature) FROM monthly_temperatures)
)
SELECT
    h.shape,
    EXTRACT(MONTH FROM h.date) AS month,
    AVG(h.average_completion_time) AS avg_time
FROM honeycomb_game h
WHERE EXTRACT(MONTH FROM h.date) IN (
    SELECT month FROM temperature_extremes
)
AND h.date >= CURRENT_DATE - INTERVAL '20 years'
GROUP BY h.shape, EXTRACT(MONTH FROM h.date)
ORDER BY avg_time;

Step 1: Extracting Temperature Extremes

WITH temperature_extremes AS (
    SELECT month
    FROM monthly_temperatures
    WHERE avg_temperature = (SELECT MAX(avg_temperature) FROM monthly_temperatures)
        OR avg_temperature = (SELECT MIN(avg_temperature) FROM monthly_temperatures)
)

What it does:
	1.	The WITH clause creates a Common Table Expression (CTE) named temperature_extremes.
	2.	Within this CTE:
	•	We query the monthly_temperatures table to find the hottest month (with the MAX(avg_temperature)) and the coldest month (with the MIN(avg_temperature)).
	•	The month values for these temperature extremes are selected into the CTE.

Result of temperature_extremes:
A single-column table (month) containing the months corresponding to the highest and lowest average temperatures.

Step 2: Main Query

SELECT
    h.shape,
    EXTRACT(MONTH FROM h.date) AS month,
    AVG(h.average_completion_time) AS avg_time
FROM honeycomb_game h
WHERE EXTRACT(MONTH FROM h.date) IN (
    SELECT month FROM temperature_extremes
)
AND h.date >= CURRENT_DATE - INTERVAL '20 years'
GROUP BY h.shape, EXTRACT(MONTH FROM h.date)
ORDER BY avg_time;

What it does:
	1.	Columns selected:
	•	h.shape: Retrieves the shape of the honeycomb (e.g., circle, star, triangle, etc.).
	•	EXTRACT(MONTH FROM h.date): Extracts the month part from the date column in the honeycomb_game table.
	•	AVG(h.average_completion_time): Calculates the average time players took to complete the honeycomb challenge, grouped by shape and month.
	2.	Filters applied:
	•	EXTRACT(MONTH FROM h.date) IN (...): Filters rows where the month part of the date matches the months identified in the temperature_extremes CTE.
	•	h.date >= CURRENT_DATE - INTERVAL '20 years': Ensures only rows from the past 20 years are considered.
	3.	Grouping:
	•	GROUP BY h.shape, EXTRACT(MONTH FROM h.date): Groups the data by the honeycomb shape and the extracted month, allowing us to calculate average completion time for each shape-month combination.
	4.	Ordering:
	•	ORDER BY avg_time: Sorts the results by average completion time in ascending order.
