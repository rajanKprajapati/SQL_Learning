/* 🔴 January */
CREATE TABLE January_job_po_fact AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 1;


/* 🔴 February */
CREATE TABLE February_job_po_fact AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 2;


/* 🔴 March */
CREATE TABLE March_job_po_fact AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

select *
from January_job_po_fact;

select *
from February_job_po_fact;

select *
from march_job_po_fact;

CREATE VIEW emp_view AS
SELECT *
FROM january_job_po_fact;

drop emp_view;

