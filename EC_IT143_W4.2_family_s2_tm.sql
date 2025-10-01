-- Step 2: Begin creating an answer
-- Dataset: family


-- Write SQL code here
/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_family_s2_TM.sql
PURPOSE: Step 2 - First attempt at answering (family_data)

NOTES:
"Which employees are currently Active?"
******************************************************************************************************************/

SELECT Name, Job_Title, Department, Status
FROM family_data
WHERE Status = 'Active';