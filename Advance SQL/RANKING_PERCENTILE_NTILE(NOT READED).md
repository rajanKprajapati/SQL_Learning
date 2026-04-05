🔹 1. PERCENTILE_CONT()
📌 What it does

It finds a value at a given percentile (continuous distribution).

👉 Example:
75th percentile = value below which 75% data lies

📊 Example Data
salary
10
20
30
40
📌 Query
SELECT 
  PERCENTILE_CONT(0.75) 
  WITHIN GROUP (ORDER BY salary) AS p75
FROM jobs;
📌 Output
p75 = 32.5
🧠 Why 32.5?

Because it's interpolated (continuous):

75% lies between 30 and 40 → so it gives value between them
✅ Use Case
Salary benchmarking
Top performers cutoff
Your question (HIGH / MEDIUM / LOW)
⚠️ Important
Not supported in all databases (MySQL ❌ older versions)
Works in PostgreSQL, Oracle, SQL Server
🔹 2. NTILE(4)
📌 What it does

Divides data into N equal buckets

👉 NTILE(4) = 4 groups (quartiles)

📊 Example
salary
10
20
30
40
📌 Query
SELECT salary,
       NTILE(4) OVER (ORDER BY salary) AS bucket
FROM jobs;
📌 Output
salary	bucket
10	1
20	2
30	3
40	4
🧠 Interpretation
Bucket 4 → highest salaries
Bucket 1 → lowest
✅ Use Case
CASE 
  WHEN NTILE(4) OVER (ORDER BY salary) = 4 THEN 'HIGH'
  WHEN NTILE(4) OVER (ORDER BY salary) = 3 THEN 'MEDIUM'
  ELSE 'LOW'
END
⚡ Key Idea

👉 This is approximation of percentile
(no exact value, just grouping)

🔹 3. PERCENT_RANK()
📌 What it does

Gives relative rank between 0 and 1

Formula:

(rank - 1) / (total_rows - 1)
📊 Example
salary
10
20
30
40
📌 Query
SELECT salary,
       PERCENT_RANK() OVER (ORDER BY salary) AS pr
FROM jobs;
📌 Output
salary	pr
10	0.00
20	0.33
30	0.66
40	1.00
🧠 Meaning
0 → lowest
1 → highest
0.75 → 75% of values below
✅ Use Case
CASE 
  WHEN PERCENT_RANK() OVER (ORDER BY salary) > 0.75 THEN 'HIGH'
  WHEN PERCENT_RANK() OVER (ORDER BY salary) > 0.5 THEN 'MEDIUM'
  ELSE 'LOW'
END
⚠️ Important
First row always = 0
Last row always = 1
🔹 4. CUME_DIST()
📌 What it does

Returns cumulative distribution

👉 % of rows ≤ current value

📊 Example
salary
10
20
30
40
📌 Query
SELECT salary,
       CUME_DIST() OVER (ORDER BY salary) AS cd
FROM jobs;
📌 Output
salary	cd
10	0.25
20	0.50
30	0.75
40	1.00
🧠 Meaning
0.75 → 75% values are ≤ this row
Directly usable as percentile
✅ Use Case
CASE 
  WHEN CUME_DIST() OVER (ORDER BY salary) > 0.75 THEN 'HIGH'
  WHEN CUME_DIST() OVER (ORDER BY salary) > 0.5 THEN 'MEDIUM'
  ELSE 'LOW'
END
🔥 FINAL COMPARISON (VERY IMPORTANT)
Function	Type	Output Type	Accuracy
PERCENTILE_CONT	Exact value	Salary value	⭐⭐⭐⭐⭐
NTILE(4)	Buckets	Integer (1–4)	⭐⭐⭐
PERCENT_RANK()	Relative rank	0–1	⭐⭐⭐⭐
CUME_DIST()	Cumulative %	0–1	⭐⭐⭐⭐
🚀 When to Use What
✅ Use PERCENTILE_CONT

👉 When you need exact cutoff (best solution)

✅ Use NTILE

👉 When DB doesn't support percentile

✅ Use PERCENT_RANK

👉 When you need ranking comparison

✅ Use CUME_DIST

👉 Best alternative to percentile

⚡ PRO INSIGHT (Interview Level)

👉 CUME_DIST() is closest to percentile logic
👉 NTILE() is easiest but least precise
👉 PERCENTILE_CONT() is most accurate but not always available