/*7.
Classify jobs:
HIGH if salary > 75th percentile
MEDIUM if between avg and 75th
LOW otherwise
💡 Hint:
Use PERCENTILE_CONT(0.75) (if supported)
Else simulate using ranking*/



-- SELECT
--     job_title,
--     CASE
--         WHEN salary_year_avg> PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY salary_year_avg) then 'HIGH'
--         WHEN salary_year_avg between avg(salary_year_avg) over() AND PERCENTILE_CONT(0.75) over(salary_year_avg) Then 'MIDIUM'
--         ELSE 'LOW'
--         END as STATUS
-- from job_postings_fact

