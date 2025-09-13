-- RETURNS THE NUMBER OF MISSING VALUES FOR EACH FIELD IN A TABLE. 
-- IF NEW FIELDS ARE ADDED TO THE COMPLAINTS TABLE, THEY WILL NEED TO BE MANUALLY ADDED TO THIS QUERY. 
WITH empty_table AS (
SELECT
SUM(CASE WHEN complaint_filed_against IS NULL THEN 1 ELSE 0 END) AS "empty value count - complaint_filed_against",
SUM(CASE WHEN complaint_filed_by IS NULL THEN 1 ELSE 0 END) AS "empty value count - complaint_filed_by",
SUM(CASE WHEN reason_complaint_filed IS NULL THEN 1 ELSE 0 END) AS "empty value count - reason_complaint_filed",
SUM(CASE WHEN confirmed_complaint IS NULL THEN 1 ELSE 0 END) AS "empty value count - confirmed_complaint",
SUM(CASE WHEN how_resolved IS NULL THEN 1 ELSE 0 END) AS "empty value count - how_resolved",
SUM(CASE WHEN received_date IS NULL THEN 1 ELSE 0 END) AS "empty value count - received_date",
SUM(CASE WHEN closed_date IS NULL THEN 1 ELSE 0 END) AS "empty value count - closed_date",
SUM(CASE WHEN complaint_type IS NULL THEN 1 ELSE 0 END) AS "empty value count - complaint_type",
SUM(CASE WHEN coverage_type IS NULL THEN 1 ELSE 0 END) AS "empty value count - coverage_type",
SUM(CASE WHEN coverage_level IS NULL THEN 1 ELSE 0 END) AS "empty value count - coverage_level",
SUM(CASE WHEN others_involved IS NULL THEN 1 ELSE 0 END) AS "empty value count - others_involved",
SUM(CASE WHEN respondent_role IS NULL THEN 1 ELSE 0 END) AS "empty value count - respondent_role",
SUM(CASE WHEN respondent_type IS NULL THEN 1 ELSE 0 END) AS "empty value count - respondent_type",
SUM(CASE WHEN complainant_type IS NULL THEN 1 ELSE 0 END) AS "empty value count - complainant_type",
SUM(CASE WHEN keywords IS NULL THEN 1 ELSE 0 END) AS "empty value count - keywords"
FROM insurance_complaints.dbo.complaints)

-- REFORMATTING THE CODE INTO A TWO COLUMN TABLE.
SELECT 'complaint_filed_against' AS "column", "empty value count - complaint_filed_against" AS "missing_value_count" FROM empty_table
UNION ALL
SELECT 'complaint_filed_by' AS "column", "empty value count - complaint_filed_by" AS "missing_value_count" FROM empty_table
UNION ALL
SELECT 'reason_complaint_filed' AS "column", "empty value count - reason_complaint_filed" AS "missing_value_count" FROM empty_table
UNION ALL
SELECT 'confirmed_complaint' AS "column", "empty value count - confirmed_complaint" AS "missing_value_count" FROM empty_table
UNION ALL
SELECT 'how_resolved' AS "column", "empty value count - how_resolved" AS "missing_value_count" FROM empty_table
UNION ALL
SELECT 'received_date' AS "column", "empty value count - received_date" AS "missing_value_count" FROM empty_table
UNION ALL
SELECT 'closed_date' AS "column", "empty value count - closed_date" AS "missing_value_count" FROM empty_table
UNION ALL
SELECT ALL 'complaint_type' AS "column", "empty value count - complaint_type" AS "missing_value_count" FROM empty_table
UNION ALL
SELECT 'coverage_type' AS "column", "empty value count - coverage_type" AS "missing_value_count" FROM empty_table
UNION ALL
SELECT 'coverage_level' AS "column", "empty value count - coverage_level" AS "missing_value_count" FROM empty_table
UNION ALL
SELECT 'others_involved' AS "column", "empty value count - others_involved" AS "missing_value_count" FROM empty_table
UNION ALL
SELECT 'respondent_role' as "column", "empty value count - respondent_role" AS "missing_value_count" FROM empty_table
UNION ALL
SELECT 'respondent_type' AS "column", "empty value count - respondent_type" AS "missing_value_count" FROM empty_table
UNION ALL
SELECT 'complainant_type' AS "column", "empty value count - complainant_type" AS "missing_value_count" FROM empty_table
UNION ALL
SELECT 'keywords' AS "column", "empty value count - keywords" AS "missing_value_count" FROM empty_table
ORDER BY "missing_value_count" DESC;

-- COUNT OF RECORDS WITH MISSING DATA WITHIN THE keywords AND others_involved columns.
SELECT
COUNT(*)
FROM insurance_complaints.dbo.complaints
WHERE keywords IS NULL OR others_involved IS NULL;