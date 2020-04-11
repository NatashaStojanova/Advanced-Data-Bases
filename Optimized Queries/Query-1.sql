----------------------------------------Query 1.0---------------------------------------------------------
CREATE MATERIALIZED VIEW TEMP_VIEW AS
SELECT d.id,d.name,d.surname, COUNT(*) AS TOTAL_PATIENTS
FROM doctor d JOIN check_up cu on d.id = cu.doctor_id
WHERE cu.date = '2019-01-02'
GROUP BY d.id;


---Query plan--

--HashAggregate  (cost=1189.03..1295.05 rows=10602 width=44)
--  Group Key: d.id
--  ->  Hash Join  (cost=747.00..1136.02 rows=10602 width=36)
--       Hash Cond: (cu.doctor_id = d.id)
--        ->  Seq Scan on check_up cu  (cost=0.00..208.00 rows=10000 width=4)
--              Filter: (date = '2019-01-02'::date)
--        ->  Hash  (cost=497.00..497.00 rows=20000 width=36)
--              ->  Append  (cost=0.00..497.00 rows=20000 width=36)
--                    ->  Seq Scan on doctor d  (cost=0.00..194.00 rows=10000 width=36)
--                    ->  Seq Scan on medical_specialist d_1  (cost=0.00..191.26 rows=9426 width=36)
--                    ->  Seq Scan on general_practitioner d_2  (cost=0.00..11.74 rows=574 width=34)


--Total Cost(1295.05)



----------------------------------------Query 1.1---------------------------------------------------------


EXPLAIN SELECT upper(T.name) || '_' || upper(T.surname)
FROM TEMP_TABLE T JOIN general_practitioner GP ON T.id = GP.id
WHERE T.TOTAL_PATIENTS >=300


--Query Plan--

--Hash Join  (cost=18.91..106.51 rows=570 width=32)
--  Hash Cond: (t.id = gp.id)
--  ->  Seq Scan on temp_table t  (cost=0.00..80.39 rows=570 width=240)
--        Filter: (total_patients >= 300)
--  ->  Hash  (cost=11.74..11.74 rows=574 width=4)
--        ->  Seq Scan on general_practitioner gp  (cost=0.00..11.74 rows=574 width=4)


--Total Cost(106.51)


----------------------------------------------------------------------------------------------------------

--Total Cost (1295.05 + 106.51 = 1401.56)