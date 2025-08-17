-- CATEGORICAL COLUMN CHECK --
-- EACH QUERY BELOW RETURNS A LIST OF CATEGORIES AVAIALBLE WITHIN A CERTAIN COLUMN, AND THE NUMBER OF TIMES THEY APPEAR. 
-- THIS ALLOWS DATA ANALYSTS TO DETECT CATEGORIES THAT ARE THE RESULT OF ERRORS (i.e. MISSPELLINGS, LEADING AND TRAILING SPACES, etc.)
SELECT
complaint_filed_against,
COUNT(complaint_filed_against) As `count`
FROM insurance_complaints.complaints
GROUP BY complaint_filed_against
ORDER BY COUNT(complaint_filed_against) DESC;

SELECT
complaint_filed_by,
COUNT(complaint_filed_by) AS `count`
FROM insurance_complaints.complaints
GROUP BY complaint_filed_by
ORDER BY COUNT(complaint_filed_by) DESC;

SELECT 
reason_complaint_filed,
COUNT(reason_complaint_filed) AS `count`
FROM insurance_complaints.complaints
GROUP BY reason_complaint_filed
ORDER BY COUNT(reason_complaint_filed) DESC;

SELECT
confirmed_complaint,
COUNT(confirmed_complaint) AS `count`
FROM insurance_complaints.complaints
GROUP BY confirmed_complaint
ORDER BY COUNT(confirmed_complaint) DESC;

SELECT
how_resolved,
COUNT(how_resolved) AS `count`
FROM insurance_complaints.complaints
GROUP BY how_resolved
ORDER BY COUNT(how_resolved) DESC;

SELECT
complaint_type,
COUNT(complaint_type) AS `count`
FROM insurance_complaints.complaints
GROUP BY complaint_type
ORDER BY COUNT(complaint_type) DESC;

SELECT
coverage_type,
COUNT(coverage_type) AS `count`
FROM insurance_complaints.complaints
GROUP BY coverage_type
ORDER BY COUNT(coverage_type) DESC;

SELECT
coverage_level,
COUNT(coverage_level) AS `count`
FROM insurance_complaints.complaints
GROUP BY coverage_level
ORDER BY COUNT(coverage_level) DESC;

SELECT
others_involved,
COUNT(others_involved) AS `count`
FROM insurance_complaints.complaints
GROUP BY others_involved
ORDER BY COUNT(others_involved) DESC;

SELECT
respondent_role,
COUNT(respondent_role) AS `count`
FROM insurance_complaints.complaints
GROUP BY respondent_role
ORDER BY COUNT(respondent_role) DESC;

SELECT
respondent_type,
COUNT(respondent_type) AS `count`
FROM insurance_complaints.complaints
GROUP BY respondent_type
ORDER BY COUNT(respondent_type) DESC;

SELECT
keywords,
COUNT(keywords) AS `count`
FROM insurance_complaints.complaints
GROUP BY keywords
ORDER BY COUNT(keywords) DESC;