-- SPLITS reason_complaint_filed VALUES INTO MULTIPLE ROWS IF THE NUMBER OF reasons IS GREATER THAN 1.
USE insurance_complaints;

ALTER DATABASE insurance_complaints SET compatibility_LEVEL = 150;

DROP TABLE IF EXISTS complaint_reason_table_inc;
CREATE TABLE complaint_reason_table_inc 
( complaint_no INT NOT NULL,
respondent_id INT NOT NULL,
reason VARCHAR(255) NULL
);

INSERT INTO insurance_complaints.dbo.complaint_reason_table_inc(
complaint_no, respondent_id, reason
)
SELECT
ic.complaint_no,
ic.respondent_id,
TRIM(value) AS "reason"
FROM dbo.complaints AS ic CROSS APPLY STRING_SPLIT(TRIM(reason_complaint_filed),';')
WHERE
ic.complaint_no IS NULL OR
ic.respondent_id IS NULL OR
ic.complaint_filed_against IS NULL OR
ic.complaint_filed_by IS NULL OR
ic.confirmed_complaint IS NULL OR
ic.received_date IS NULL OR 
ic.closed_date IS NULL OR
ic.complaint_type IS NULL OR
ic.coverage_type IS NULL OR
ic.coverage_level IS NULL OR
ic.respondent_role IS NULL OR
ic.respondent_type IS NULL OR 
ic.complainant_type IS NULL OR
ic.reason_complaint_filed IS  NULL OR
ic.how_resolved IS  NULL
GROUP BY ic.complaint_no, ic.respondent_id, TRIM(value);

-- PREVIEW OF COMPLAINT RESOLUTION TABLE.
SELECT TOP 100
*
FROM complaint_reason_table_inc;

-- COUNT OF RECORDS
SELECT
COUNT(*) AS "count"
FROM complaint_reason_table_inc;

-- ADD FOREIGN KEY CONSTRAINT IN THIS TABLE.
ALTER TABLE complaint_reason_table_inc
ADD CONSTRAINT FK_complaint_reason_inc
FOREIGN KEY (complaint_no, respondent_id) REFERENCES complaints_inc(complaint_no,respondent_id);

