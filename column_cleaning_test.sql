USE insurance_complaints;

-- TOP 10 MOST COMMON REASONS USING THE COMPLAINTS TABLE 
SELECT TOP 10
reason_complaint_filed,
COUNT(reason_complaint_filed) AS "reason_count"
FROM insurance_complaints.dbo.complaints
GROUP BY reason_complaint_filed
ORDER BY COUNT(reason_complaint_filed) DESC;

-- TOP 10 MOST COMMON REASONS USING THE COMPLAINT_REASON_TABLE
SELECT TOP 10
reason,
COUNT(reason) AS "reason_count"
FROM insurance_complaints.dbo.complaint_reason_table
GROUP BY reason
ORDER BY COUNT(reason) DESC;

-- TOP COMPLAINT FOR ACCIDENT AND HEALTH EXAMPLE
SELECT TOP 1
cr.reason,
COUNT(cr.reason)
FROM complaints_desc AS cd LEFT JOIN complaint_reason_table AS cr 
ON cd.complaint_no = cr.complaint_no AND 
cd.respondent_id = cr.respondent_id
WHERE coverage_type LIKE '%Accident and Health%'
GROUP BY cr.reason
ORDER BY COUNT(cr.reason) DESC;

-- TOP 10 MOST COMMON REASONS USING THE COMPLAINTS TABLE 
SELECT TOP 10
how_resolved,
COUNT(how_resolved) AS "resolution_count"
FROM insurance_complaints.dbo.complaints
GROUP BY how_resolved
ORDER BY COUNT(how_resolved) DESC;

-- TOP 10 MOST COMMON REASONS USING THE COMPLAINT_REASON_TABLE
SELECT TOP 10
resolution,
COUNT(resolution) AS "resolution_count"
FROM insurance_complaints.dbo.complaint_resolution_table
GROUP BY resolution
ORDER BY COUNT(resolution) DESC;