-- Solution

SELECT
  employee_id
FROM employee_expertise
group by employee_id
HAVING sum(years_of_experience) >= 8 and count(domain)=1
  or count(domain)=2 and sum(years_of_experience) >= 12
;
