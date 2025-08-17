-- THIS QUERY COUNTS THE NUMBER OF INCOMPLETE RECORDS WITHIN THE complaints TABLE.
SELECT COUNT(*) AS `incomplete record count` FROM insurance_complaints.complaints
WHERE
complaint_filed_against IN (""," ") OR complaint_filed_against IS NULL OR
complaint_filed_by IN ("", " ") OR complaint_filed_by IS NULL OR
reason_complaint_filed IN (""," ") OR reason__complaint_filed IS NULL OR
confirmed_complaint in ("", " ") OR confirmed_complaint IS NULL OR
how_resolved IN ("", " ") OR how_resolved IS NULL OR
received_date IN (""," ") OR received_date IS NULL OR
closed_date IN (""," ") OR closed_date IS NULL OR
complaint_type IN ("", " ") OR complaint_type IS NULL OR
coverage_type IN ("", " ") OR 
coverage_level IN ("", " ") OR 
others_involved IN (""," ") OR
respondent_role IN ("", " ") OR
respondent_type IN ("", " ") OR
complainant_type IN ("", " ") OR
keywords IN ("", " ")
;