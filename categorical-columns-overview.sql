-- CATEGORICAL COLUMN CHECK --
-- EACH QUERY BELOW RETURNS A LIST OF CATEGORIES AVAIALBLE WITHIN A CERTAIN COLUMN, AND THE NUMBER OF TIMES THEY APPEAR. 
-- THIS ALLOWS DATA ANALYSTS TO DETECT CATEGORIES THAT ARE THE RESULT OF ERRORS (i.e. MISSPELLINGS, LEADING AND TRAILING SPACES, etc.)

-- COMPLAINT_FILED_AGAINST
SELECT
complaint_filed_against,
COUNT(complaint_filed_against) As "count"
FROM insurance_complaints.dbo.complaints
GROUP BY complaint_filed_against
ORDER BY COUNT(complaint_filed_against) DESC;

-- COMPLAINT_FILED_BY
SELECT
complaint_filed_by,
COUNT(complaint_filed_by) AS "count"
FROM insurance_complaints.dbo.complaints
GROUP BY complaint_filed_by
ORDER BY COUNT(complaint_filed_by) DESC;

-- REASON_COMPLAINT_FILED
SELECT 
reason_complaint_filed,
COUNT(reason_complaint_filed) AS "count"
FROM insurance_complaints.dbo.complaints
GROUP BY reason_complaint_filed
ORDER BY COUNT(reason_complaint_filed) DESC;

-- CONFIRMED_COMPLAINT
SELECT
confirmed_complaint,
COUNT(confirmed_complaint) AS "count"
FROM insurance_complaints.dbo.complaints
GROUP BY confirmed_complaint
ORDER BY COUNT(confirmed_complaint) DESC;

-- HOW_RESOLVED
SELECT
how_resolved,
COUNT(how_resolved) AS "count"
FROM insurance_complaints.dbo.complaints
GROUP BY how_resolved
ORDER BY COUNT(how_resolved) DESC;

-- COMPLAINT_TYPE
SELECT
complaint_type,
COUNT(complaint_type) AS "count"
FROM insurance_complaints.dbo.complaints
GROUP BY complaint_type
ORDER BY COUNT(complaint_type) DESC;

-- COVERAGE_TYPE
SELECT
coverage_type,
COUNT(coverage_type) AS "count"
FROM insurance_complaints.dbo.complaints
GROUP BY coverage_type
ORDER BY COUNT(coverage_type) DESC;

-- COVERAGE_LEVEL
SELECT
coverage_level,
COUNT(coverage_level) AS "count"
FROM insurance_complaints.dbo.complaints
GROUP BY coverage_level
ORDER BY COUNT(coverage_level) DESC;

-- OTHERS_INVOLVED
SELECT
others_involved,
COUNT(others_involved) AS "count"
FROM insurance_complaints.dbo.complaints
GROUP BY others_involved
ORDER BY COUNT(others_involved) DESC;

-- RESPONDENT_ROLE
SELECT
respondent_role,
COUNT(respondent_role) AS "count"
FROM insurance_complaints.dbo.complaints
GROUP BY respondent_role
ORDER BY COUNT(respondent_role) DESC;

-- RESPONDENT_TYPE
SELECT
respondent_type,
COUNT(respondent_type) AS "count"
FROM insurance_complaints.dbo.complaints
GROUP BY respondent_type
ORDER BY COUNT(respondent_type) DESC;

-- KEYWORDS
SELECT
keywords,
COUNT(keywords) AS "count"
FROM insurance_complaints.dbo.complaints
GROUP BY keywords
ORDER BY COUNT(keywords) DESC;