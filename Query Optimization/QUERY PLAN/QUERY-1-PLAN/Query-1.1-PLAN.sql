EXPLAIN SELECT upper(d.name) || '_' || upper(d.surname)
FROM TEMP_TABLE T JOIN doctor d on T.id = d.id
WHERE T.TOTAL_PATIENTS >=300

--QUERY PLAN--
Hash Join  (cost=747.00..801.98 rows=719 width=32)
  Hash Cond: (t.id = d.id)
  ->  Seq Scan on temp_table t  (cost=0.00..35.50 rows=680 width=4)
        Filter: (total_patients >= 300)
  ->  Hash  (cost=497.00..497.00 rows=20000 width=36)
        ->  Append  (cost=0.00..497.00 rows=20000 width=36)
              ->  Seq Scan on doctor d  (cost=0.00..194.00 rows=10000 width=36)
              ->  Seq Scan on medical_specialist d_1  (cost=0.00..191.26 rows=9426 width=36)
              ->  Seq Scan on general_practitioner d_2  (cost=0.00..11.74 rows=574 width=34)
