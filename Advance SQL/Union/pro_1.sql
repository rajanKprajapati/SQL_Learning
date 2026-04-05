SELECT
    job_title,
    company_id
FROM
    job_postings_fact
-- LIMIT 5;

UNION
SELECT
    name,
    company_id
FROM
    company_dim
ORDER BY company_id    
limit 5    

