EXPLAIN SELECT DISTINCT i.code
FROM patient p  JOIN check_up cu on p.id = cu.patient_id
    JOIN check_up_icd cui on cu.id = cui.check_up_id
    JOIN icd_10 i on cui.icd_id = i.id
WHERE p.id = 884133;

--QUERY PLAN
--Unique  (cost=570.08..570.08 rows=1 width=4)
--  ->  Sort  (cost=570.08..570.08 rows=1 width=4)
--        Sort Key: i.code
--        ->  Nested Loop  (cost=374.72..570.07 rows=1 width=4)
--              ->  Nested Loop  (cost=374.44..569.73 rows=1 width=4)
--                    ->  Hash Join  (cost=374.01..561.27 rows=1 width=8)
--                          Hash Cond: (cui.check_up_id = cu.id)
--                          ->  Seq Scan on check_up_icd cui  (cost=0.00..161.00 rows=10000 width=8)
--                          ->  Hash  (cost=374.00..374.00 rows=1 width=8)
--                                ->  Seq Scan on check_up cu  (cost=0.00..374.00 rows=1 width=8)
--                                      Filter: (patient_id = 884133)
--                    ->  Index Only Scan using patient_pkey on patient p  (cost=0.42..8.44 rows=1 width=4)
--                          Index Cond: (id = 884133)
--              ->  Index Scan using icd_10_pkey on icd_10 i  (cost=0.29..0.34 rows=1 width=8)
--                    Index Cond: (id = cui.icd_id)
