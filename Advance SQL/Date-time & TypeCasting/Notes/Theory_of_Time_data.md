🟢 1. Date & Time Data Types

These are the base:

Type	Meaning	    Example
DATE	Only date	2026-03-24
TIME	Only time	14:30:00
TIMESTAMP	Date + time	2026-03-24 14:30:00
TIMESTAMPTZ	Timestamp with timezone	2026-03-24 14:30:00+05:30

🟢 2. CURRENT Date & Time Functions
...........................................
These functions give you the current system date and time from your database server.

🔷 1. CURRENT_DATE
✅ What it does:
Returns only today’s date
No time included
👉 Example:
SELECT CURRENT_DATE;
🧾 Output:
2026-03-24
📌 Important Points:
Format → YYYY-MM-DD
Based on server timezone
Type → DATE
🔷 2. CURRENT_TIME
✅ What it does:
Returns current time with timezone
👉 Example:
SELECT CURRENT_TIME;
🧾 Output:
14:35:20.123456+05:30
📌 Breakdown:
Part	Meaning
14:35:20	Time
.123456	Microseconds
+05:30	Timezone (India)

👉 Type: TIME WITH TIME ZONE

🔷 3. CURRENT_TIMESTAMP
✅ What it does:
Returns date + time + timezone
👉 Example:
SELECT CURRENT_TIMESTAMP;
🧾 Output:
2026-03-24 14:35:20.123456+05:30
📌 Structure:
Part	Meaning
2026-03-24	Date
14:35:20	Time
.123456	Fraction
+05:30	Timezone

👉 Type: TIMESTAMP WITH TIME ZONE

🔷 4. NOW()
✅ What it does:
Same as CURRENT_TIMESTAMP
👉 Example:
SELECT NOW();
🧾 Output:
2026-03-24 14:35:20.123456+05:30
📌 Key Insight:
SELECT NOW() = CURRENT_TIMESTAMP;

👉 Output:

true

✔️ Both are identical in PostgreSQL

🔥 VERY IMPORTANT CONCEPT (INTERVIEW LEVEL)
🧠 All CURRENT functions are FIXED per query

👉 This means:
Even if time changes while query runs → output remains same

❗ Example:
SELECT NOW(), pg_sleep(3), NOW();
🧾 Output:
2026-03-24 14:35:20 | (waits 3 sec) | 2026-03-24 14:35:20

👉 Notice:

Time did NOT change
Because NOW() is fixed at query start
🔥 Real-Time Changing Function
🔷 CLOCK_TIMESTAMP()
👉 Example:
SELECT CLOCK_TIMESTAMP(), pg_sleep(3), CLOCK_TIMESTAMP();
🧾 Output:
2026-03-24 14:35:20 | (waits 3 sec) | 2026-03-24 14:35:23

👉 ✅ This one updates in real-time

🔷 5. LOCALTIME & LOCALTIMESTAMP
✅ No timezone included
👉 Example:
SELECT LOCALTIME;

🧾 Output:

14:35:20.123456
SELECT LOCALTIMESTAMP;

🧾 Output:

2026-03-24 14:35:20.123456
📌 Difference Table:
Function	Includes Date	Includes Time	Includes Timezone
CURRENT_DATE	✅	❌	❌
CURRENT_TIME	❌	✅	✅
CURRENT_TIMESTAMP	✅	✅	✅
NOW()	✅	✅	✅
LOCALTIME	❌	✅	❌
LOCALTIMESTAMP	✅	✅	❌
🔥 Practical Real Examples
✅ 1. Insert current date automatically
INSERT INTO orders (order_date)
VALUES (CURRENT_DATE);
✅ 2. Insert full timestamp
INSERT INTO logs (created_at)
VALUES (NOW());
✅ 3. Get today's records
SELECT *
FROM orders
WHERE order_date = CURRENT_DATE;
✅ 4. Get records of last 24 hours
SELECT *
FROM logs
WHERE created_at >= NOW() - INTERVAL '1 day';
⚠️ Common Mistakes
❌ Mistake:
WHERE date = NOW()

👉 ❌ Wrong because:

date ≠ timestamp
✅ Correct:
WHERE date = CURRENT_DATE

OR

WHERE DATE(created_at) = CURRENT_DATE
🧠 Pro Tip (Very Important)

👉 Use:

CURRENT_DATE → when only date needed
NOW() → when full timestamp needed
CLOCK_TIMESTAMP() → when real-time tracking needed
🚀 Final Understanding
These functions depend on server time
They are used in:
Logging systems
Order tracking
Analytics queries
Time-based filtering



WHY we use CURRENT Date & Time functions
👉 Simple reason:
We use them to get the current system date/time automatically instead of writing it manually.

👉 Example:
INSERT INTO orders (order_date)
VALUES (CURRENT_DATE);

🧾 Output stored:

2026-03-24


🧠 BIG DIFFERENCE (Important)
Function	      Timezone? 	Why use
CURRENT_DATE	   ❌	      Only date
CURRENT_TIME	   ✅	      Time + timezone
CURRENT_TIMESTAMP	✅	     Full timestamp
NOW()	           ✅	     Shortcut
LOCALTIME	       ❌	      Time only
LOCALTIMESTAMP	   ❌	     Timestamp without timezone
....................................................
👉 Get current values
SELECT CURRENT_DATE;
SELECT CURRENT_TIME;
SELECT CURRENT_TIMESTAMP;
SELECT NOW();

📌 NOW() = same as CURRENT_TIMESTAMP







🟢 3. Type Casting (::DATE):
<<<<<<<<<<<<<Detailed in "Type_casting.md" file>>>>>>>>>>>>>
Used to convert data types.

👉 Example:
SELECT '2026-03-24 15:45:00'::DATE;

👉 Output:

2026-03-24
👉 Convert to timestamp:
SELECT '2026-03-24'::TIMESTAMP;
🟢 4. EXTRACT() Function

Used to get specific part of date/time.

👉 Syntax:
EXTRACT(field FROM source)
👉 Examples:
SELECT EXTRACT(YEAR FROM CURRENT_DATE);
SELECT EXTRACT(MONTH FROM CURRENT_DATE);
SELECT EXTRACT(DAY FROM CURRENT_DATE);
SELECT EXTRACT(HOUR FROM CURRENT_TIMESTAMP);

📌 Output example:

2026
3
24
15

Detailed:
..................................................
🟢 What is EXTRACT()?

👉 EXTRACT() is a built-in SQL function in PostgreSQL

It is used to take out (extract) a specific part from a date/time value.

🧠 Simple Meaning

Think like this:

A date-time is a full object
2026-03-24 14:50:30

👉 It contains:

Year → 2026
Month → 03
Day → 24
Hour → 14
Minute → 50

👉 EXTRACT() lets you pick only one part

🟢 From Where This Topic Comes From?

👉 This function comes from SQL Standard (ANSI SQL)

✔️ That means:

It is not only PostgreSQL
It is used in:
MySQL (slightly different)
Oracle
SQL Server (with alternatives)
🧠 Why SQL needs EXTRACT?

Because:

Real-world data analysis needs parts of date, not full timestamp

🎯 Real-world needs:
Sales per year
Orders per month
Traffic per hour
Users per day

👉 That’s why EXTRACT() exists

🟢 Syntax
EXTRACT(field FROM source)
🟢 Common Fields
Field	Meaning
YEAR	Year
MONTH	Month
DAY 	Day
HOUR	Hour
MINUTE	Minute
SECOND	Second
DOW	    Day of week (0–6)
DOY 	Day of year
WEEK	Week number
🟢 Basic Examples with Output
🔷 Example 1: Extract Year
SELECT EXTRACT(YEAR FROM DATE '2026-03-24');

🧾 Output:

2026
🔷 Example 2: Extract Month
SELECT EXTRACT(MONTH FROM DATE '2026-03-24');

🧾 Output:

3
🔷 Example 3: Extract Day
SELECT EXTRACT(DAY FROM DATE '2026-03-24');

🧾 Output:

24
🔷 Example 4: Extract Hour
SELECT EXTRACT(HOUR FROM TIMESTAMP '2026-03-24 15:45:10');

🧾 Output:

15
🟢 Example Using Table (created_at)
📊 Table:
id | created_at
--------------------------
1  | 2026-03-24 10:15:30
2  | 2026-03-24 12:20:10
3  | 2026-02-23 09:05:00
🔷 Query: Orders per Month
SELECT EXTRACT(MONTH FROM created_at), COUNT(*)
FROM orders
GROUP BY EXTRACT(MONTH FROM created_at);
🧾 Output:
month | count
----------------
3     | 2
2     | 1
🟢 Why Use EXTRACT Instead of ::DATE?

👉 Difference:

Feature	EXTRACT()	::DATE
Purpose	Get specific part	Remove time
Example	Year, month	Only date
Use case	Analysis	Formatting
🟢 Advanced Examples 🔥
🔷 1. Orders per Year
SELECT EXTRACT(YEAR FROM created_at), COUNT(*)
FROM orders
GROUP BY 1;
///////////////////////////
GROUP BY 1

👉 1 refers to:

EXTRACT(YEAR FROM created_at)

So this:

GROUP BY 1

is exactly same as:

GROUP BY EXTRACT(YEAR FROM created_at)
🟢 Full Equivalent Query
SELECT EXTRACT(YEAR FROM created_at), COUNT(*)
FROM orders
GROUP BY EXTRACT(YEAR FROM created_at);

✔️ Both are identical
/////////////////////////////
🔷 2. Orders per Hour
SELECT EXTRACT(HOUR FROM created_at), COUNT(*)
FROM orders
GROUP BY 1;

👉 Useful for:

Peak traffic time analysis
🔷 3. Day of Week
SELECT EXTRACT(DOW FROM created_at)
FROM orders;

🧾 Output:

0 = Sunday
1 = Monday
...
6 = Saturday
🟢 Important Concept (Interview 🔥)

👉 EXTRACT() returns numeric value (DOUBLE PRECISION)

Example:

SELECT EXTRACT(YEAR FROM CURRENT_DATE);

Output:

2026.0
✅ Convert to Integer
SELECT EXTRACT(YEAR FROM CURRENT_DATE)::INT;
🟢 Shortcut Alternative

In PostgreSQL:

SELECT DATE_PART('year', CURRENT_DATE);

👉 Same as EXTRACT

🟢 Common Mistakes ❌
❌ Wrong:
SELECT EXTRACT(YEAR, created_at);

👉 Wrong syntax ❌

✅ Correct:
SELECT EXTRACT(YEAR FROM created_at);
🧠 Final Understanding

👉 EXTRACT() is used to:

Break date into parts
Perform analysis
Group data
Filter based on time
🔥 Real Developer Thinking

👉 Use:

EXTRACT() → analysis (year, month, hour)
::DATE → remove time
DATE_TRUNC() → grouping by level
...................................................
🟢 5. AGE() Function

Find difference between two dates.

SELECT AGE('2026-03-24', '2000-01-01');

👉 Output:

26 years 2 mons 23 days
<<<<<<incomplete>>>>>>
🟢 6. DATE_TRUNC()

Used to truncate date to a specific level.

👉 Examples:
SELECT DATE_TRUNC('year', CURRENT_TIMESTAMP);
SELECT DATE_TRUNC('month', CURRENT_TIMESTAMP);
SELECT DATE_TRUNC('day', CURRENT_TIMESTAMP);

📌 Output:

2026-01-01 00:00:00
2026-03-01 00:00:00
2026-03-24 00:00:00
🟢 7. INTERVAL (Very Important 🔥)

Used for adding/subtracting time.

👉 Add days:
SELECT CURRENT_DATE + INTERVAL '5 days';
👉 Subtract:
SELECT CURRENT_DATE - INTERVAL '2 months';
👉 Complex:
SELECT CURRENT_TIMESTAMP + INTERVAL '1 year 2 months 10 days';
🟢 8. AT TIME ZONE 🌍

Used to convert time zones.

👉 Example:
SELECT CURRENT_TIMESTAMP AT TIME ZONE 'UTC';
SELECT CURRENT_TIMESTAMP AT TIME ZONE 'Asia/Kolkata';

📌 Use when working with global apps.

🟢 9. TO_CHAR() (Formatting Date)
Convert date into readable format.
👉 Examples:
SELECT TO_CHAR(CURRENT_DATE, 'DD-MM-YYYY');
SELECT TO_CHAR(CURRENT_TIMESTAMP, 'Day, DD Mon YYYY');
📌 Output:
24-03-2026
Tuesday, 24 Mar 2026

🟢 10. TO_DATE() & TO_TIMESTAMP()
Convert string → date/time
👉 Example:
SELECT TO_DATE('24-03-2026', 'DD-MM-YYYY');
SELECT TO_TIMESTAMP('24-03-2026 15:30', 'DD-MM-YYYY HH24:MI');

🟢 11. Date Comparison
SELECT * 
FROM orders
WHERE order_date > '2025-01-01';
🟢 12. BETWEEN with Dates
SELECT * 
FROM orders
WHERE order_date BETWEEN '2025-01-01' AND '2025-12-31';
🟢 13. Useful Real Examples 🔥
👉 Find today's records
WHERE order_date = CURRENT_DATE;
👉 Last 7 days data
WHERE order_date >= CURRENT_DATE - INTERVAL '7 days';
👉 Extract month-wise data
SELECT EXTRACT(MONTH FROM order_date), COUNT(*)
FROM orders
GROUP BY 1;
🟢 14. Common Mistakes ❌

🚫 Wrong:

WHERE date = '24-03-2026'

✅ Correct:

WHERE date = '2026-03-24'

📌 PostgreSQL uses YYYY-MM-DD

🟢 Final Summary 🧠
::DATE → convert type
EXTRACT() → get part of date
INTERVAL → add/subtract time
AT TIME ZONE → handle timezone
TO_CHAR() → format output
AGE() → find difference
DATE_TRUNC() → round date
<<<<<incomplete>>>>>