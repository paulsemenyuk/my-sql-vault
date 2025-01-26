-- Solution

SELECT
  fd.datacenter_id,
  (d.monthly_capacity) - SUM(monthly_demand) as spare_capacity
FROM forecasted_demand fd
JOIN datacenters d
    ON fd.datacenter_id = d.datacenter_id
GROUP BY
    fd.datacenter_id, d.monthly_capacity
ORDER BY fd.datacenter_id
