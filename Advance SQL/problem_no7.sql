-- find the count of number of remote job postings per skill
-- display the top five job demand in remote jobs
-- include skill ID,name and count of postings requiring the skill

with top_five_job_skills AS 
(SELECT
    s.skill_id,
    s.skills As skills,
    count(*) AS no_of_jobs
FROM
    job_postings_fact j
JOIN skills_job_dim sj ON j.job_id=sj.job_id
JOIN skills_dim s ON sj.skill_id=s.skill_id
WHERE
    J.job_work_from_home =TRUE
    AND j.job_title_short='Data Analyst'
GROUP BY
    s.skill_id,s.skills
ORDER BY count(*) DESC
LIMIT 5)

SELECT
    *
FROM top_five_job_skills 
