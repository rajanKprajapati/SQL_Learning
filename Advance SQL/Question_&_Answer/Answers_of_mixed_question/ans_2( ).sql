/*2.
Get companies that:
posted jobs in 2023
OR have jobs requiring no degree
Use UNION and classify using CASE.
💡 Hint:
Use EXTRACT(YEAR FROM job_posted_date)
Join with company_dim
Use CASE WHEN job_no_degree_mention = 1
*/

SELECT
    c.name,
    j.job_posted_date,
    CASE
        when EXTRACT(Year From job_posted_date)=2023 Then 'Posted2023'
        End as type
FROM
    job_postings_fact j     
JOIN
    company_dim c
ON
    j.company_id=c.company_id    
WHERE
    EXTRACT(Year From job_posted_date)=2023
UNION

SELECT
    c.name,
    j.job_posted_date,
    Case
        WHEN j.job_no_degree_mention = 'TRUE' then 'No Degree'
    End as type    
FROM
    job_postings_fact j     
JOIN
    company_dim c
ON
    j.company_id=c.company_id    
WHERE
    j.job_no_degree_mention = 'TRUE'
Limit 100;    
        
