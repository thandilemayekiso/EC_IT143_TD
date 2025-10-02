/*
------------------------------------------------------------
EC_IT143_W5.2_FamilyData_TM.sql
Author: Thandile Mayekiso
Date: 2025-10-01
Dataset: family_data.csv
Description: Four SQL analysis queries with answers
------------------------------------------------------------
*/

-- Question 1 (Author: Me)
-- How do household sizes correlate with total household income across different neighborhoods?
SELECT Neighborhood, Household_Size, SUM(Income) AS TotalIncome
FROM family_data
GROUP BY Neighborhood, Household_Size
ORDER BY Neighborhood;

-- Question 2 (Author: Me)
-- Are families with higher education levels more likely to own homes compared to renting?
SELECT Education_Level, Housing_Status, COUNT(*) AS FamilyCount
FROM family_data
GROUP BY Education_Level, Housing_Status;

-- Question 3 (Author: Me)
-- What is the relationship between parental employment status and children’s school enrollment?
SELECT Parent_Employment_Status, Child_Enrollment, COUNT(*) AS FamilyCount
FROM family_data
GROUP BY Parent_Employment_Status, Child_Enrollment;

-- Question 4 (Author: Marvis Agbonkpolor)
-- From Family_Data: Which departments have the most members employed?
SELECT Department, COUNT(*) AS MemberCount
FROM family_data
GROUP BY Department
ORDER BY MemberCount DESC;
