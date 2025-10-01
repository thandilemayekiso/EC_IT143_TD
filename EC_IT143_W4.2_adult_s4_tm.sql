-- Step 4: Turn query into a view
-- Dataset: adult

-- Write SQL code here
CREATE VIEW vw_avg_age_by_occupation AS
SELECT Occupation, AVG(Age) AS avg_age
FROM adult_
GROUP BY Occupation;