-- SPLITS reason_complaint_filed VALUES INTO MULTIPLE ROWS IF THE NUMBER OF reasons IS GREATER THAN 1.
USE insurance_complaints;

ALTER DATABASE insurance_complaints SET compatibility_LEVEL = 150;

USE insurance_complaints;

DROP TABLE IF EXISTS complaint_reason_table;
CREATE TABLE complaint_reason_table 
( complaint_no INT NOT NULL,
respondent_id INT NOT NULL,
reason VARCHAR(255) NOT NULL,
PRIMARY KEY(complaint_no,respondent_id,reason)
);

INSERT INTO insurance_complaints.dbo.complaint_reason_table(
complaint_no, respondent_id, reason
)
SELECT
ic.complaint_no,
ic.respondent_id,
TRIM(value) AS "reason"
FROM dbo.complaints AS ic CROSS APPLY STRING_SPLIT(TRIM(reason_complaint_filed),';')
WHERE
ic.complaint_no IS NOT NULL AND
ic.respondent_id IS NOT NULL AND
ic.complaint_filed_against IS NOT NULL AND
ic.complaint_filed_by IS NOT NULL AND
ic.confirmed_complaint IS NOT NULL AND
ic.received_date IS NOT NULL AND 
ic.closed_date IS NOT NULL AND
ic.complaint_type IS NOT NULL AND
ic.coverage_type IS NOT NULL AND
ic.coverage_level IS NOT NULL AND
ic.respondent_role IS NOT NULL AND
ic.respondent_type IS NOT NULL AND 
ic.complainant_type IS NOT NULL AND
ic.reason_complaint_filed IS NOT NULL AND
ic.how_resolved IS NOT NULL
GROUP BY ic.complaint_no, ic.respondent_id, TRIM(value);

-- PREVIEW OF COMPLAINT RESOLUTION TABLE.
SELECT TOP 100
*
FROM complaint_reason_table;

-- COUNT OF RECORDS
SELECT
COUNT(*)
FROM complaint_reason_table;

ALTER TABLE insurance_complaints.dbo.complaint_reason_table
ADD CONSTRAINT FK_distinct_complaint_rcf
FOREIGN KEY(complaint_no, respondent_id) 
REFERENCES complaints_desc(complaint_no,respondent_id)
