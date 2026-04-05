"""Question 1 (Basic NULL Filtering)
Find all skills where type is missing.
Return:
skill_id
skills
Table: skills_dim
Concept used:
IS NULL"""

SELECT
     skill_id,
     skills,
     type
FROM 
    skills_dim
/*WHERE
    type IS NULL <- this can not be run
*/
-- if in any culumn have not a single
-- null value then use of  IS NULL could show error

