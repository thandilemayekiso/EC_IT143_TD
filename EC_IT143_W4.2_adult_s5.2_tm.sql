-- Step 5.2: Refine table (PK, constraints)
-- Dataset: adult

-- Write SQL code here
ALTER TABLE avg_age_by_occupation_table
ADD Occupation_ID INT IDENTITY(1,1) PRIMARY KEY;
