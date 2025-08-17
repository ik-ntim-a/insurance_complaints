-- THIS QUERY RETURNS RECORDS THAT APPEAR MORE THAN ONCE WITHIN THE DATASET. 
-- IF NO RECORDS ARE RETURNED, THIS MEANS THERE ARE NO DUPLICATES.
SELECT
complaint_no,
respondent_id,
COUNT(*) AS `no_of_occurences`
FROM insurance_complaints.complaints
GROUP BY complaint_no, respondent_id
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;