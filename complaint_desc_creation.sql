-- CREATES THE complaints_desc AND complaints_inc TABLE. 
-- THE COLUMNS keywords, others_involved, reason_complaint_filed AND how_resolved ARE NOT PRESENT INTO THE  complaint_desc TABLE
-- ALL RECORDS WITH INCOMPLETE VALUES ARE NOT PRESENT IN THE complaint_desc TABLE. 

USE insurance_complaints;

-- DELETING ALL CHILD TABLES BEFORE CREATING PARENT.
DROP TABLE IF EXISTS complaint_reason_table;
DROP TABLE IF EXISTS complaint_reason_table_inc;
DROP TABLE IF EXISTS complaint_resolution_table;
DROP TABLE IF EXISTS complaint_resolution_table_inc;

--CREATING PARENTS
DROP TABLE IF EXISTS complaints_desc;
CREATE TABLE complaints_desc 
(complaint_no INT NOT NULL,
respondent_id INT NOT NULL,
complaint_filed_against VARCHAR(max) NULL,
complaint_filed_by VARCHAR(max) NULL,
confirmed_complaint VARCHAR(max) NULL,
received_date DATE NULL, 
closed_date DATE NULL,
complaint_type VARCHAR(max) NULL,
coverage_type VARCHAR(max) NULL,
coverage_level VARCHAR(max) NULL,
respondent_role VARCHAR(max) NULL,
respondent_type VARCHAR(max) NULL, 
complainant_type VARCHAR(max) NULL,
PRIMARY KEY (complaint_no, respondent_id)
);

--TABLE TO CONTAIN INCOMPLETE VALUES
DROP TABLE IF EXISTS complaints_inc
CREATE TABLE complaints_inc
(complaint_no INT NOT NULL,
respondent_id INT NOT NULL,
complaint_filed_against VARCHAR(max) NULL,
complaint_filed_by VARCHAR(max) NULL,
confirmed_complaint VARCHAR(max) NULL,
received_date DATE NULL, 
closed_date DATE NULL,
complaint_type VARCHAR(max) NULL,
coverage_type VARCHAR(max) NULL,
coverage_level VARCHAR(max) NULL,
respondent_role VARCHAR(max) NULL,
respondent_type VARCHAR(max) NULL, 
complainant_type VARCHAR(max) NULL,
PRIMARY KEY (complaint_no, respondent_id))

-- complaints_desc IS THE DESCRIPTIVE ANALYSIS DATASET.
INSERT INTO insurance_complaints.dbo.complaints_desc 
(complaint_no,
respondent_id,
complaint_filed_against,
complaint_filed_by,
confirmed_complaint,
received_date, 
closed_date,
complaint_type,
coverage_type,
coverage_level,
respondent_role,
respondent_type, 
complainant_type)
SELECT 
complaint_no,
respondent_id,
TRIM(complaint_filed_against),
TRIM(complaint_filed_by),
TRIM(confirmed_complaint),
CONVERT(DATE,received_date,101),
CONVERT(DATE,closed_date, 101),
TRIM(complaint_type),
TRIM(coverage_type),
TRIM(coverage_level),
TRIM(respondent_role),
TRIM(respondent_type), 
TRIM(complainant_type)
FROM insurance_complaints.dbo.complaints
WHERE
complaint_no IS NOT NULL AND
respondent_id IS NOT NULL AND
complaint_filed_against IS NOT NULL AND
complaint_filed_by IS NOT NULL AND
confirmed_complaint IS NOT NULL AND
received_date IS NOT NULL AND 
closed_date IS NOT NULL AND
complaint_type IS NOT NULL AND
coverage_type IS NOT NULL AND
coverage_level IS NOT NULL AND
respondent_role IS NOT NULL AND
respondent_type IS NOT NULL AND 
complainant_type IS NOT NULL AND
how_resolved IS NOT NULL AND
reason_complaint_filed IS NOT NULL;

--LOADING DATA INTO complaints_inc dataset
INSERT INTO complaints_inc
(complaint_no,
respondent_id,
complaint_filed_against,
complaint_filed_by,
confirmed_complaint,
received_date, 
closed_date,
complaint_type,
coverage_type,
coverage_level,
respondent_role,
respondent_type, 
complainant_type)
SELECT
complaint_no,
respondent_id,
TRIM(complaint_filed_against),
TRIM(complaint_filed_by),
TRIM(confirmed_complaint),
CONVERT(DATE,received_date,101),
CONVERT(DATE,closed_date, 101),
TRIM(complaint_type),
TRIM(coverage_type),
TRIM(coverage_level),
TRIM(respondent_role),
TRIM(respondent_type), 
TRIM(complainant_type)
FROM insurance_complaints.dbo.complaints
WHERE
complaint_no IS NULL OR
respondent_id IS NULL OR
complaint_filed_against IS NULL OR
complaint_filed_by IS NULL OR
confirmed_complaint IS NULL OR
received_date IS NULL OR 
closed_date IS NULL OR
complaint_type IS NULL OR
coverage_type IS NULL OR
coverage_level IS NULL OR
respondent_role IS NULL OR
respondent_type IS NULL OR 
complainant_type IS NULL OR 
how_resolved IS NULL OR 
reason_complaint_filed IS NULL;

-- TABLE OF RECORD COUNTS.
SELECT
(SELECT 
COUNT(*) 
FROM insurance_complaints.dbo.complaints_desc) AS "complete record count",
(SELECT
COUNT(*) 
FROM insurance_complaints.dbo.complaints_inc) AS "incomplete record count",
(SELECT
COUNT(*) 
FROM insurance_complaints.dbo.complaints) AS "original dataset record count"