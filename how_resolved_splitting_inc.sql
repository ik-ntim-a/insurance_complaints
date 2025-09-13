USE insurance_complaints;

ALTER DATABASE insurance_complaints SET compatibility_LEVEL = 150;

DROP TABLE IF EXISTS complaint_resolution_table_inc;
CREATE TABLE complaint_resolution_table_inc
( complaint_no INT NOT NULL,
respondent_id INT NOT NULL,
resolution VARCHAR(255) NULL
);

INSERT INTO insurance_complaints.dbo.complaint_resolution_table_inc(
complaint_no, respondent_id, resolution
)
SELECT
ic.complaint_no,
ic.respondent_id,
TRIM(value) AS "resolution"
FROM dbo.complaints AS ic CROSS APPLY STRING_SPLIT(TRIM(how_resolved),';')
WHERE
ic.complaint_no IS  NULL OR
ic.respondent_id IS  NULL OR
ic.complaint_filed_against IS  NULL OR
ic.complaint_filed_by IS  NULL OR
ic.confirmed_complaint IS  NULL OR
ic.received_date IS  NULL OR 
ic.closed_date IS  NULL OR
ic.complaint_type IS  NULL OR
ic.coverage_type IS  NULL OR
ic.coverage_level IS  NULL OR
ic.respondent_role IS  NULL OR
ic.respondent_type IS  NULL OR 
ic.complainant_type IS  NULL OR
ic.reason_complaint_filed IS  NULL OR
ic.how_resolved IS  NULL
GROUP BY ic.complaint_no, ic.respondent_id, TRIM(value);

-- PREVIEW OF COMPLAINT RESOLUTION TABLE.
SELECT TOP 100
*
FROM complaint_resolution_table_inc;

-- COUNT OF RECORDS
SELECT
COUNT(*)
FROM complaint_resolution_table_inc;

ALTER TABLE insurance_complaints.dbo.complaint_resolution_table_inc
ADD CONSTRAINT FK_complaint_resolution_hr
FOREIGN KEY(complaint_no, respondent_id) 
REFERENCES complaints_inc(complaint_no,respondent_id)
