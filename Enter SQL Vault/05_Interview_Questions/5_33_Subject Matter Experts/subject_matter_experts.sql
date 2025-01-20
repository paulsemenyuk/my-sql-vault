-- Solution

SELECT
  employee_id
FROM employee_expertise
group by employee_id
HAVING sum(years_of_experience) >= 8 and count(domain)=1
  or count(domain)=2 and sum(years_of_experience) >= 12
;


-- Self Join

SELECT DISTINCT a.employee_id
FROM employee_expertise a
JOIN employee_expertise b ON a.employee_id = b.employee_id  /* check every pair of skills per employee */
WHERE
  ((a.domain = b.domain)  AND (a.years_of_experience >= 8)) OR   /* 8 years in 1 domain? */
  ((a.domain != b.domain) AND (a.years_of_experience + b.years_of_experience >= 12))  /* or 12 years in 2 domains? */
