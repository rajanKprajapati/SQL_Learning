🚀 15 HARD SQL QUESTIONS
🔴 Q1. Daily Job Posting Trend
👉 Find number of jobs posted per day in 2023.
⚠️ Condition:
Ignore time (use casting)

🔴 Q2. Peak Hiring Hour
👉 Find the hour of the day when most jobs are posted.
⚠️ Use:
EXTRACT(HOUR)
Grouping

🔴 Q3. Jobs Posted in Last 7 Days
👉 Get all jobs posted in the last 7 days from current time
⚠️ Use:
NOW()
INTERVAL

🔴 Q4. Month-wise Average Salary
👉 Find average salary per month
⚠️ Use:
EXTRACT(MONTH)
Ignore NULL salaries

🔴 Q5. Jobs Posted Today (Timezone Safe)
👉 Get jobs posted today (based on system timezone)
⚠️ Must handle:
TIMESTAMP vs DATE issue

🔴 Q6. Convert Job Time to IST
👉 Convert job_posted_date into Asia/Kolkata timezone
⚠️ Use:
AT TIME ZONE

🔴 Q7. Jobs Older Than 6 Months
👉 Find jobs older than 6 months from today
⚠️ Use:
INTERVAL

🔴 Q8. Year-wise Job Count
👉 Count jobs per year
⚠️ Use:
EXTRACT(YEAR)
GROUP BY 1

🔴 Q9. Jobs Posted on Weekend
👉 Find jobs posted on Saturday & Sunday
⚠️ Use:
EXTRACT(DOW)

🔴 Q10. Company-wise Latest Job Posting
👉 For each company, find latest job posting date
⚠️ Use:
MAX()

🔴 Q11. Jobs Posted Between Two Dates
👉 Get jobs between:
2023-01-01 and 2023-06-30
⚠️ Use:
BETWEEN

🔴 Q12. Time Difference from Now
👉 Show:
job_id
time difference between now and job_posted_date
⚠️ Use:
AGE()

🔴 Q13. Monthly Job Trend Using DATE_TRUNC
👉 Count jobs per month using DATE_TRUNC()
⚠️ Not EXTRACT

🔴 Q14. Format Job Date
👉 Show job_posted_date like:
Monday, 24 Mar 2026
⚠️ Use:
TO_CHAR()

🔴 Q15. Type Casting Fix (VERY IMPORTANT 🔥)
👉 This query is WRONG — fix it:
SELECT *
FROM job_postings_fact
WHERE job_posted_date = '2023-03-24';

⚠️ Problem:
Type mismatch
🧠 BONUS ULTRA HARD (INTERVIEW LEVEL)
🔥 Q16. Real-Time vs Fixed Time
👉 Write a query to show difference between:
NOW()
CLOCK_TIMESTAMP()
Use:
pg_sleep(2)

🔥 Q17. Jobs Posted in Same Week as Today
👉 Find jobs posted in the same week as current date
⚠️ Use:
DATE_TRUNC('week', ...)

🔥 Q18. Group Jobs by Exact Date (Ignore Time)
👉 Count jobs per date (remove time part)
⚠️ Use:
::DATE

⚡ How to Practice (VERY IMPORTANT)
👉 Solve like this:
First try yourself ❗
Then ask me:
👉 “Check my answer Q3”
I’ll:
Fix mistakes
Optimize query
Give interview tips

💥 Pro Tip (Real Developer Thinking)
When you see:
Problem            	Use
Remove time	        ::DATE
Extract part	    EXTRACT()
Group by level  	DATE_TRUNC()
Add/subtract        INTERVAL
Format output	    TO_CHAR()
Fix mismatch	    ::