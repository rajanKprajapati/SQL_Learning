/*3️⃣ Remote jobs with skills
Find job titles and required skills for jobs that are work from home.

Requirements:
Join
job_postings_fact
skills_job_dim
skills_dim
Display:
job_title
skills*/
/* HOw to combine multiple rows ?
SELECT c.name, o.amount, p.product_name
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN products p
ON o.product_id = p.product_id;*/ 
SELECT 
    jpf.job_title, 
    sd.skills
FROM 
    job_postings_fact jpf
JOIN
    skills_job_dim s 
    ON jpf.job_id =s.job_id
JOIN
    skills_dim sd
    ON s.skill_id=sd.skill_id
WHERE
    jpf.job_work_from_home IS TRUE -- The condition:WHERE jpf.job_work_from_home s incomplete in
    -- y SQL databases.u must specify the value to check.Usually the column job_work_from_home is a BOOLEAN (TRUE/FALSE).
    
    
    
  -- Another way to write this program 
  /*SELECT 
    j.job_title,
    sd.skills
FROM job_postings_fact j
JOIN skills_job_dim sj USING (job_id)
JOIN skills_dim sd USING (skill_id)
WHERE j.job_work_from_home = TRUE;*/


  /*THis is the order of writing SQL: 
SELECT  
FROM
JOIN
WHERE
GROUP BY
HAVING
ORDER BY
LIMIT
*/

    
    

    
   
   
    



