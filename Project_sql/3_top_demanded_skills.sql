/*What are the most in-demand skills for the data analytics?
join job postings in inner join table similar to the query 2
identify top 5 in=demand skill for the data analytics
focus on all job postings
why? retrives the top skills with the highest demand inn job marcket
providing insight of the most valuable skills for job seekers
*/
SELECT 
    skills,
    count(skills_job_dim.job_id) as demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE
    job_title_short='Data Analyst'
    AND job_work_from_home=TRUE
GROUP BY
    skills
ORDER BY
    2 DESC
limit 5