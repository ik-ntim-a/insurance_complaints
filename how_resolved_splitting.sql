-- -- SPLITS how_resolved VALUES INTO MULTIPLE ROWS IF THE NUMBER OF resolutions IS GREATER THAN 1.

DROP TABLE IF EXISTS no_of_resolutions;
CREATE TABLE no_of_resolutions (
    no_of_resolutions INT NOT NULL
);

INSERT INTO no_of_resolutions 
(no_of_resolutions)
SELECT
(LENGTH(TRIM(how_resolved))-LENGTH(REPLACE(TRIM(how_resolved),";","")))+1 As `no_of_items`
FROM insurance_complaints.complaints
WHERE how_resolved IS NOT NULL AND how_resolved <> ""
GROUP BY (LENGTH(TRIM(how_resolved))-LENGTH(REPLACE(TRIM(how_resolved),";","")))+1
ORDER BY (LENGTH(TRIM(how_resolved))-LENGTH(REPLACE(TRIM(how_resolved),";","")))+1;

-- CREDIT GOES TO fthiella: https://stackoverflow.com/questions/17942508/sql-split-values-to-multiple-rows

DROP TABLE IF EXISTS complaint_resolution_table;
CREATE TABLE complaint_resolution_table 
( complaint_no INT NOT NULL,
respondent_id INT NOT NULL,
resolution VARCHAR(255) NOT NULL,
PRIMARY KEY(complaint_no, respondent_id, resolution),
FOREIGN KEY(complaint_no, respondent_id) REFERENCES complaints_desc(complaint_no, respondent_id)
);

INSERT INTO insurance_complaints.complaint_resolution_table(
complaint_no, respondent_id, resolution
)
SELECT
ic.complaint_no,
ic.respondent_id,
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(ic.how_resolved),";", no_of_resolutions.no_of_resolutions),";",-1)) AS `reason`
FROM no_of_resolutions INNER JOIN insurance_complaints.complaints AS ic ON 
(LENGTH(TRIM(ic.how_resolved))-LENGTH(REPLACE(TRIM(ic.how_resolved),";",""))) + 1 >= (no_of_resolutions.no_of_resolutions)
WHERE how_resolved IS NOT NULL AND how_resolved <> ""
GROUP BY
complaint_no,
respondent_id,
TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(ic.how_resolved),";", no_of_resolutions.no_of_resolutions),";",-1))
ORDER BY
complaint_no;

