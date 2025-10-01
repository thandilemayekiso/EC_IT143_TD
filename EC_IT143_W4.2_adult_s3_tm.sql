-- Step 3: Create an ad hoc SQL query
-- Dataset: adult

-- Write SQL code here
-- Find employees working more than 50 hours per week
SELECT Age, Occupation, HoursPerWeek
FROM adult
WHERE HoursPerWeek > 50;