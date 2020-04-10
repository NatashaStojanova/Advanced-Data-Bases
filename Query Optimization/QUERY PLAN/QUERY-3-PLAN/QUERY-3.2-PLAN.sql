EXPLAIN SELECT T1.name,T1.code
FROM TEMP_TABLE T1 , TEMP_TABLE_2 T2
WHERE T1.name = T2.name AND T1.TOTAL = T2.MAX_CODE



--QUERY PLAN--
Merge Join  (cost=543.34..595.64 rows=84 width=15)
  Merge Cond: (((t1.name)::text = (t2.name)::text) AND (t1.total = t2.max_code))
  ->  Sort  (cost=504.06..519.88 rows=6331 width=23)
        Sort Key: t1.name, t1.total
        ->  Seq Scan on temp_table t1  (cost=0.00..104.31 rows=6331 width=23)
  ->  Sort  (cost=39.28..40.61 rows=530 width=126)
        Sort Key: t2.name, t2.max_code
        ->  Seq Scan on temp_table_2 t2  (cost=0.00..15.30 rows=530 width=126)
