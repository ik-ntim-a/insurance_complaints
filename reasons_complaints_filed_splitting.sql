-- SPLITS reason_complaint_filed VALUES INTO MULTIPLE ROWS IF THE NUMBER OF reasons IS GREATER THAN 1.

DROP TABLE IF EXISTS no_of_reasons;
CREATE TABLE no_of_reasons
(no_of_reasons INT NOT NULL);

INSERT INTO no_of_reasons 
(no_of_reasons)
SELECT
(LENGTH(TRIM(reason_complaint_filed))-LENGTH(REPLACE(TRIM(reason_complaint_filed),";","")))+1 As `no_of_items`
FROM insurance_complaints.complaints
WHERE reason_complaint_filed IS NOT NULL AND reason_complaint_filed <> ""
GROUP BY (LENGTH(TRIM(reason_complaint_filed))-LENGTH(REPLACE(TRIM(reason_complaint_filed),";","")))+1
ORDER BY (LENGTH(TRIM(reason_complaint_filed))-LENGTH(REPLACE(TRIM(reason_complaint_filed),";","")))+1;

-- CREDIT FOR THIS SOLUTION GOES TO fthiella: https://stackoverflow.com/questions/17942508/sql-split-values-to-multiple-rows

DROP TABLE IF EXISTS complaint_reason_table;
CREATE TABLE complaint_reason_table 
( complaint_no INT NOT NULL,
respondent_id INT NOT NULL,
reason VARCHAR(255) NOT NULL,
PRIMARY KEY(complaint_no,respondent_id,reason),
FOREIGN KEY(complaint_no, respondent_id) REFERENCES complaints_desc(complaint_no, respondent_id)
);

INSERT INTO insurance_complaints.complaint_reason_table(
complaint_no, respondent_id, reason
)
SELECT
ic.complaint_no,
ic.respondent_id,
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(ic.reason_complaint_filed),";", no_of_reasons.no_of_reasons),";",-1)) AS `reason`
FROM no_of_reasons INNER JOIN insurance_complaints.complaints AS ic ON 
(LENGTH(TRIM(ic.reason_complaint_filed))-LENGTH(REPLACE(TRIM(ic.reason_complaint_filed),";",""))) + 1 >= (no_of_reasons.no_of_reasons)
WHERE reason_complaint_filed IS NOT NULL AND reason_complaint_filed <> ""
GROUP BY
complaint_no,
respondent_id,
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(ic.reason_complaint_filed),";", no_of_reasons.no_of_reasons),";",-1))
ORDER BY
complaint_no;

