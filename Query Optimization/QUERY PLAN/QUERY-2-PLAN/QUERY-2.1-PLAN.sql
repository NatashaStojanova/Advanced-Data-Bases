EXPLAIN SELECT age
FROM temp_table
WHERE TOTAL = (SELECT MAX(TOTAL)
               FROM temp_table )

--QUERY PLAN--
Seq Scan on temp_table  (cost=35.51..71.01 rows=10 width=4)
  Filter: (total = $0)
  InitPlan 1 (returns $0)
    ->  Aggregate  (cost=35.50..35.51 rows=1 width=8)
          ->  Seq Scan on temp_table temp_table_1  (cost=0.00..30.40 rows=2040 width=8)
