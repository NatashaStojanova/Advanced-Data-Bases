------------------------------------Query 2---------------------------------------------------------

---------------When to create indexes?------------------
--The column is queried frequently.
--A referential integrity constraint exists on the column.
--A UNIQUE key integrity constraint exists on the column.


CREATE INDEX idx_checkUp_date
ON check_up(date);

CREATE INDEX idx_patient
ON patient(id);

CREATE INDEX idx_refferal
ON refferal(id);

CREATE INDEX idx_medical_specialist
ON medical_specialist(id);

CREATE INDEX idx_department
ON department(id);



--If you want to force the use of the index by "disabling" sequential scans--
SET enable_seqscan = OFF;

-- Even though I created indexes, I didn't notice any difference in performance.






