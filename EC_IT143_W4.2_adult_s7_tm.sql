-- Step 7: Create stored procedure
-- Dataset: adult

-- Write SQL code here
CREATE PROCEDURE sp_load_avg_age_by_occupation
AS
BEGIN
    TRUNCATE TABLE avg_age_by_occupation_table;

    INSERT INTO avg_age_by_occupation_table (Occupation, avg_age)
    SELECT Occupation, AVG(Age)
    FROM adult_data
    GROUP BY Occupation;
END;