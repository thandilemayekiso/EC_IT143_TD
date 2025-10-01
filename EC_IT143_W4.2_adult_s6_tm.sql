-- Step 6: Load table from view
-- Dataset: adult

-- Write SQL code here
TRUNCATE TABLE avg_age_by_occupation_table;

INSERT INTO avg_age_by_occupation_table (Occupation, avg_age)
SELECT Occupation, AVG(Age)
FROM adult_data
GROUP BY Occupation;
