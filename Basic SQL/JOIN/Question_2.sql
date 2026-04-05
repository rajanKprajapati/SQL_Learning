/*
2️⃣ Top companies hiring for most jobs
Find top 5 companies that posted the highest number of jobs in 2023.
Requirements:
Join company_dim and job_postings_fact
Show
company_name, total_jobs
Use GROUP BY
Sort descending
*/
SELECT
    cd.name AS company_name,
    COUNT(job_title) AS total_jobs
FROM 
    job_postings_fact AS jpf
JOIN 
    company_dim AS cd
    ON jpf.company_id=cd.company_id
WHERE
    job_posted_date LIKE '2023%'
GROUP BY
    cd.name
ORDER BY
    total_jobs DESC    
LIMIT
    5

    
    
    
/*
INNER JOIN → only matching rows
<svg width='4' height='9' viewBox='0 0 4 9' fill='none'
xmlns='http://www.w3.org/2000/svg'><path d='M4
0.98056V4.5L4.00004 7.71428L4 9L1.10694e-07 4.5L4 0V0.98056Z' fill='#506784'/></svg>
LEFT JOIN → all rows from left table

RIGHT JOIN → all rows from right table

FULL JOIN → all rows from both tables
*/