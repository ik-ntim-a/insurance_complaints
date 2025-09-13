-- CONVERTS THE received_date AND closed_Date field data types to DATE.
SELECT 
CONVERT(DATE,received_date,101),
CONVERT(DATE,closed_date, 101)
FROM insurance_complaints.dbo.complaints;