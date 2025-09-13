-- THIS QUERY COUNTS THE NUMBER OF INCOMPLETE RECORDS WITHIN THE complaints TABLE.
SELECT COUNT(*) AS "incomplete record count" FROM insurance_complaints.dbo.complaints
WHERE
complaint_filed_against IS NULL OR
complaint_filed_by IS NULL OR
reason_complaint_filed IS NULL OR
confirmed_complaint IS NULL OR
how_resolved IS NULL OR
received_date IS NULL OR
closed_date IS NULL OR
complaint_type IS NULL OR
coverage_type IS NULL OR
coverage_level IS NULL OR
others_involved IS NULL OR
respondent_role IS NULL OR
respondent_type IS NULL OR
complaint_type IS NULL OR
keywords IS NULL
;
