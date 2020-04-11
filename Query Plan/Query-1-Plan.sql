----------------------------------------Query 1.0----------------------------------------------------------

EXPLAIN ANALYZE SELECT gp.id, COUNT(*) AS TOTAL_PATIENTS
INTO TEMP_TABLE
FROM general_practitioner gp   JOIN patient p on gp.id = p.id_doctor
     JOIN check_up cu on p.id = cu.patient_id
WHERE cu.date = '2019-01-02'
GROUP BY gp.id;

--Query Plan--

--Finalize GroupAggregate  (cost=23061.50..23206.93 rows=574 width=12) (actual time=1080.780..1082.217 rows=574 loops=1)
-- Group Key: gp.id
-- ->  Gather Merge  (cost=23061.50..23195.45 rows=1148 width=12) (actual time=1080.774..1104.787 rows=1714 loops=1)
--       Workers Planned: 2
--       Workers Launched: 2
--       ->  Sort  (cost=22061.48..22062.92 rows=574 width=12) (actual time=933.477..933.537 rows=571 loops=3)
--             Sort Key: gp.id
--             Sort Method: quicksort  Memory: 51kB
--             Worker 0:  Sort Method: quicksort  Memory: 51kB
--             Worker 1:  Sort Method: quicksort  Memory: 51kB
--             ->  Partial HashAggregate  (cost=22029.44..22035.18 rows=574 width=12) (actual time=932.926..933.086 rows=571 loops=3)
--                   Group Key: gp.id
--                   ->  Hash Join  (cost=351.92..22008.60 rows=4167 width=4) (actual time=9.475..927.815 rows=3333 loops=3)
--                         Hash Cond: (p.id_doctor = gp.id)
--                         ->  Hash Join  (cost=333.00..21978.67 rows=4167 width=4) (actual time=8.535..924.090 rows=3333 loops=3)
--                               Hash Cond: (p.id = cu.patient_id)
--                               ->  Parallel Seq Scan on patient p  (cost=0.00..19520.67 rows=416667 width=8) (actual time=0.736..806.358 rows=333333 loops=3)
--                               ->  Hash  (cost=208.00..208.00 rows=10000 width=4) (actual time=7.688..7.688 rows=10000 loops=3)
--                                     Buckets: 16384  Batches: 1  Memory Usage: 480kB
--                                     ->  Seq Scan on check_up cu  (cost=0.00..208.00 rows=10000 width=4) (actual time=0.577..4.867 rows=10000 loops=3)
--                                           Filter: (date = '2019-01-02'::date)
--                         ->  Hash  (cost=11.74..11.74 rows=574 width=4) (actual time=0.900..0.900 rows=574 loops=3)
--                               Buckets: 1024  Batches: 1  Memory Usage: 29kB
--                               ->  Seq Scan on general_practitioner gp  (cost=0.00..11.74 rows=574 width=4) (actual time=0.634..0.753 rows=574 loops=3)

--Total Cost(23206.93)




-------------------------------------------Query 1.1------------------------------------------------------

EXPLAIN SELECT upper(d.name) || '_' || upper(d.surname)
FROM TEMP_TABLE T JOIN doctor d on T.id = d.id
WHERE T.TOTAL_PATIENTS >=300

--QUERY PLAN--
--Hash Join  (cost=747.00..801.98 rows=719 width=32)
-- Hash Cond: (t.id = d.id)
-- ->  Seq Scan on temp_table t  (cost=0.00..35.50 rows=680 width=4)
--       Filter: (total_patients >= 300)
-- ->  Hash  (cost=497.00..497.00 rows=20000 width=36)
--       ->  Append  (cost=0.00..497.00 rows=20000 width=36)
--             ->  Seq Scan on doctor d  (cost=0.00..194.00 rows=10000 width=36)
--             ->  Seq Scan on medical_specialist d_1  (cost=0.00..191.26 rows=9426 width=36)
--             ->  Seq Scan on general_practitioner d_2  (cost=0.00..11.74 rows=574 width=34)


--Total Cost(801.98)


---------------------------------------------------------------------------------------------------------

--Final total cost( 23206.93 + 801.98 = 24,008.91)