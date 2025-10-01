-- Step 2: Begin creating an answer
-- Dataset: adult

-- Write SQL code here
-- Q2: What is the average age grouped by occupation?
SELECT Occupation, AVG(Age) AS avg_age
FROM adult_data
GROUP BY Occupation
ORDER BY avg_age DESC;
