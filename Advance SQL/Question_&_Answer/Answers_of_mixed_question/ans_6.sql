/*5.
List companies where:
total jobs > average jobs per company
Use subquery + CASE.
💡 Hint:
First count jobs per company
Then compare with overall avg using subquery
Use GROUP BY company_id*/

-- .total job per company
-- .avg job per company
/*-- Using subquery
SELECT 
    c.name,
    CASE
        WHEN count(*)>(SELECT AVG(job_count) from (select COUNT(*) as job_count  from job_postings_fact GROUP BY company_id)  )  then 'Greater'     
        ELSE 'EQUAL'
    END as job_per_company    
FROM    
    job_postings_fact j
JOIN    
    company_dim c
ON
    c.company_id=j.company_id
group by c.name    

*/

-- Using CTE
/*WITH company_jobs AS (
    SELECT 
        company_id,
        COUNT(*) AS total_jobs
    FROM job_postings_fact
    GROUP BY company_id
),
avg_jobs AS (
    SELECT 
        AVG(total_jobs) AS avg_job
    FROM company_jobs
)
SELECT 
    c.name,
    cj.total_jobs
FROM company_jobs cj
JOIN company_dim c
ON c.company_id = cj.company_id
CROSS JOIN avg_jobs aj
WHERE cj.total_jobs > aj.avg_job;*/

