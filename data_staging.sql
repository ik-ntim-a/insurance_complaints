-- THIS QUERY CREATES THE INSURANCE COMPLAINTS SCHEMA AND
-- THE TABLE THAT WILL HOLD THE ORIGINAL INSURANCE COMPLAINTS DATA.

DROP SCHEMA IF EXISTS insurance_complaints;
CREATE SCHEMA insurance_complaints;


DROP TABLE IF EXISTS insurance_complaints.complaints;
CREATE TABLE insurance_complaints.complaints
( 
complaint_no INT NOT NULL,
complaint_filed_against TEXT NULL,
complaint_filed_by TEXT NULL, 
reason_complaint_filed TEXT NULL,
confirmed_complaint TEXT NULL,
how_resolved TEXT NULL, 
received_date TEXT NULL,
closed_date TEXT NULL, 
complaint_type TEXT NULL,
coverage_type TEXT NULL,
coverage_level TEXT NULL,
others_involved  TEXT NULL,
respondent_id INT NOT NULL, 
respondent_role TEXT NULL, 
respondent_type TEXT NULL, 
complainant_type TEXT NULL,
keywords TEXT NULL,
PRIMARY KEY (complaint_no, respondent_id) 
);






