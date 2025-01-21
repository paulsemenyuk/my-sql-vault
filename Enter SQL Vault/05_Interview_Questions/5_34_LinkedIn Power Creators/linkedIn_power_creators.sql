-- Solution P1 (Easy)

SELECT
  pp.profile_id
FROM personal_profiles as pp
JOIN company_pages as cp
  ON pp.employer_id=cp.company_id
WHERE
pp.followers>cp.followers
ORDER BY pp.profile_id;

-- Solution P2 (Medium) - dif

SELECT
  pp.profile_id
FROM
    personal_profiles as pp
JOIN employee_company as ec
  ON pp.profile_id=ec.personal_profile_id
JOIN company_pages as cp
  ON ec.company_id=cp.company_id
GROUP BY
    pp.profile_id, pp.followers
HAVING
    pp.followers>max(cp.followers)
ORDER BY
    pp.profile_id;
