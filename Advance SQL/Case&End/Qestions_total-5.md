🧠 5 HARD PRACTICE QUESTIONS (Based on Your 2023 Job Database)
🔥 Q1
Create a column that:
High Demand → if job_title contains 'Data'
Medium Demand → if contains 'Engineer'
Low Demand → otherwise
👉 Also filter only 2023 data

🔥 Q2
Categorize salary:
"Very High" → >150000
"High" → 100000–150000
"Average" → 50000–99999
"Low" → <50000
👉 Show job_title + category

🔥 Q3
Create a column:
"Remote" → if job_location = 'Anywhere'
"Onsite" → otherwise
👉 Also sort Remote first using CASE in ORDER BY

🔥 Q4
Count number of jobs in each salary category using CASE + GROUP BY

🔥 Q5 (🔥🔥 Hardest)
Create a column:
"Top Role" → if job_title contains BOTH 'Data' AND salary > 100000
"Growing Role" → if job_title contains 'Data'
"Other" → otherwise

👉 Also:

Filter only March 2023
Order by salary category priority (Top → Growing → Other)