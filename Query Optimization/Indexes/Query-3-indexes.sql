------------------------------------Query 3---------------------------------------------------------

---------------When to create indexes?------------------
--The column is queried frequently.
--A referential integrity constraint exists on the column.
--A UNIQUE key integrity constraint exists on the column.

CREATE INDEX idx_checkUp_date
ON check_up(date);

CREATE INDEX idx_base_hospital
ON base_hospital(id);

CREATE INDEX idx_doctor
ON doctor(id);

CREATE INDEX idx_icd10_codes
ON icd_10(id);

CREATE  INDEX idx_icd_checkUp
ON check_up_icd(id);

--If you want to force the use of the index by "disabling" sequential scans--
SET enable_seqscan = OFF;



