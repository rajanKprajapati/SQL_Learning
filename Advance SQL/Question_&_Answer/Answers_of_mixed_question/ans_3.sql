/*3.
Find jobs that:
require Python skill
OR have salary > overall average salary
Use subquery + UNION.
💡 Hint:
Join skills_dim + skills_job_dim
Subquery for avg salary
Use skills = 'Python'
*/

SELECT
    j.job_title,
    'PYHTON' as type
FROM
    job_postings_fact j
JOIN
    skills_job_dim sj
ON
    sj.job_id=j.job_id
JOIN
    skills_dim s
ON
    s.skill_id=sj.skill_id        
WHERE
    s.skills ='python'
UNION
SELECT
    j.job_title,
    'High salary' as type
FROM
    job_postings_fact j
JOIN
    skills_job_dim sj
ON
    sj.job_id=j.job_id
JOIN
    skills_dim s
ON
    s.skill_id=sj.skill_id        
Where salary_year_avg>(SELECT AVG(salary_year_avg) from job_postings_fact);

/*
-- Python jobs
SELECT
    j.job_title,
    'PYTHON' AS type
FROM job_postings_fact j
JOIN skills_job_dim sj
ON sj.job_id = j.job_id
JOIN skills_dim s
ON s.skill_id = sj.skill_id
WHERE LOWER(s.skills) = 'python'

UNION

-- High salary jobs
SELECT
    j.job_title,
    'HIGH_SALARY' AS type
FROM job_postings_fact j
WHERE salary_year_avg > 
(
    SELECT AVG(salary_year_avg)
    FROM job_postings_fact
);*/

