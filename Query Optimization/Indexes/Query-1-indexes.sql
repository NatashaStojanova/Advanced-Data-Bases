------------------------------------Query 1---------------------------------------------------------

---------------When to create indexes?------------------
--The column is queried frequently.
--A referential integrity constraint exists on the column.
--A UNIQUE key integrity constraint exists on the column.


CREATE INDEX idx_checkUp_date
ON check_up(date);

CREATE INDEX idx_patient
ON patient(id);

CREATE INDEX idx_general_practitioner
ON general_practitioner(id);

--If you want to force the use of the index by "disabling" sequential scans--
SET enable_seqscan = OFF;

--Even though I created indexes on these columns, I still got the same total cost.
--That's why I optimized the query: ../../OptimizedQueries/Query-1 by avoiding the JOIN.






