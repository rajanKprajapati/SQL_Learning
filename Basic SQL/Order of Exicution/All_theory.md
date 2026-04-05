>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
HOW WE USE DISTINCT KEYWORD:
SELECT DISTINCT department, name
FROM employees;
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
1️⃣ Order of Writing SQL Query (Syntax Order)

When we write a query, the order usually looks like this:
SELECT column1, column2
FROM table_name
JOIN table2
ON condition
WHERE condition
GROUP BY column
HAVING condition
ORDER BY column
LIMIT number;/OFFSET

Writing Order:
SELECT column1, column2, aggregate_function(column)
FROM table_name
JOIN table_name2
ON table_name.column = table_name2.column
WHERE condition
GROUP BY column
HAVING aggregate_condition
ORDER BY column ASC/DESC
LIMIT number OFFSET number;

But this is NOT the execution order.

2️⃣ Actual Order of Execution (Logical Order)
The SQL engine processes the query in this order:

FROM
JOIN
ON
WHERE
GROUP BY
HAVING
SELECT
DISTINCT
ORDER BY
LIMIT(Meaning is given below)/OFFSET((Meaning: skip first 5 rows return next 5 rows))
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
3️⃣ FLOW OF EXICUTION:(same as 2)
Start
  │
  ▼
FROM (Load tables)
  │
  ▼
JOIN (Combine tables)
  │
  ▼
ON (Apply join condition)
  │
  ▼
WHERE (Filter rows)
  │
  ▼
GROUP BY (Create groups)
  │
  ▼
HAVING (Filter groups)
  │
  ▼
SELECT (Choose columns)
  │
  ▼
DISTINCT (Remove duplicates)
  │
  ▼
ORDER BY (Sort results)
  │
  ▼
LIMIT (Restrict rows)/OFFSET
  │
  ▼
Final Result
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
4️⃣Why This Concept is Important
Understanding execution order helps avoid mistakes like:

❌ Wrong:
SELECT name
FROM employees
WHERE COUNT(*) > 2

WHERE cannot use COUNT() because aggregation happens later.

✔ Correct:
SELECT name
FROM employees
GROUP BY name
HAVING COUNT(*) > 2

Because HAVING runs after GROUP BY.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
5️⃣One Line Memory Trick:

FROM → JOIN → ON → WHERE → GROUP BY → HAVING → SELECT → DISTINCT → ORDER BY → LIMIT