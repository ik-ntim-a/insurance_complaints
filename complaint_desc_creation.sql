-- CREATES THE complaints_desc TABLE. 
-- THE COLUMNS keywords, others_involved, reason_complaint_filed AND how_resolved ARE NOT PRESENT INTO THE  complaint_desc TABLE
-- ALL RECORDS WITH INCOMPLETE VALUES ARE NOT PRESENT IN THE complaint_desc TABLE. 

DROP TABLE IF EXISTS complaints_desc;
CREATE TABLE complaints_desc 
(complaint_no INT NOT NULL,
respondent_id INT NOT NULL,
complaint_filed_against TEXT NULL,
complaint_filed_by TEXT NULL,
confirmed_complaint TEXT NULL,
received_date DATE NULL, 
closed_date DATE NULL,
complaint_type TEXT NULL,
coverage_type TEXT NULL,
coverage_level TEXT NULL,
respondent_role TEXT NULL,
respondent_type TEXT NULL, 
complainant_type TEXT NULL,
PRIMARY KEY (complaint_no, respondent_id)
);

INSERT INTO insurance_complaints.complaints_desc 
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
TRIM(complaint_no),
TRIM(respondent_id),
TRIM(complaint_filed_against),
TRIM(complaint_filed_by),
TRIM(confirmed_complaint),
CAST(REPLACE(CONCAT(SUBSTRING_INDEX(received_date,"/",-1), SUBSTRING_INDEX(received_date,"/",2)),"/","") AS DATE) AS received_date,
CAST(REPLACE(CONCAT(SUBSTRING_INDEX(closed_date,"/",-1), SUBSTRING_INDEX(closed_date,"/",2)),"/","") AS DATE) AS closed_date,
TRIM(complaint_type),
TRIM(coverage_type),
TRIM(coverage_level),
TRIM(respondent_role),
TRIM(respondent_type), 
TRIM(complainant_type)
FROM insurance_complaints.complaints
WHERE 
complaint_filed_against NOT IN ("", " ") AND complaint_filed_against IS NOT NULL AND
complaint_filed_by NOT IN ("", " ") AND complaint_filed_against IS NOT NULL AND
confirmed_complaint NOT IN ("", " ") AND complaint_filed_against IS NOT NULL AND
received_date NOT IN ("", " ") AND complaint_filed_against IS NOT NULL AND
closed_date NOT IN ("", " ") AND complaint_filed_against IS NOT NULL AND
complaint_type NOT IN ("", " ") AND complaint_filed_against IS NOT NULL AND
coverage_type NOT IN ("", " ") AND coverage_type IS NOT NULL AND
coverage_level NOT IN ("", " ") AND coverage_level IS NOT NULL AND
respondent_role NOT IN ("", " ") AND respondent_role IS NOT NULL AND
respondent_type NOT IN ("", " ") AND respondent_type IS NOT NULL AND
complainant_type NOT IN ("", " " ) AND complainant_type IS NOT NULL;