-------------------------------------Query 2.0-----------------------------------------------------------

CREATE MATERIALIZED VIEW temp_table AS
SELECT p.age, COUNT(DISTINCT p.id) AS TOTAL
FROM patient p JOIN check_up cu on p.id = cu.patient_id
    JOIN refferal r on cu.id = r.check_up_id
    JOIN medical_specialist ms on r.medical_specialist_id = ms.id
    JOIN department d on ms.department_id = d.id
WHERE cu.date >= '2019-01-01' AND cu.date <= '2019-12-31' AND d.name = 'Cardiology'
GROUP BY p.age;


--Query plan
--GroupAggregate  (cost=686.03..698.55 rows=2 width=12)
--  Group Key: p.age
--  ->  Sort  (cost=686.03..690.20 rows=1667 width=8)
--        Sort Key: p.age
--        ->  Merge Join  (cost=567.21..596.82 rows=1667 width=8)
--              Merge Cond: (cu.id = r.check_up_id)
--              ->  Nested Loop  (cost=0.71..45987.29 rows=10000 width=12)
--                    ->  Index Scan using check_up_pkey on check_up cu  (cost=0.29..406.29 rows=10000 width=8)
--                          Filter: ((date >= '2019-01-01'::date) AND (date <= '2019-12-31'::date))
--                    ->  Index Scan using idx_patient on patient p  (cost=0.42..4.56 rows=1 width=8)
--                          Index Cond: (id = cu.patient_id)
--              ->  Sort  (cost=566.50..570.67 rows=1667 width=4)
--                    Sort Key: r.check_up_id
--                    ->  Hash Join  (cost=239.12..477.29 rows=1667 width=4)
--                          Hash Cond: (r.medical_specialist_id = ms.id)
--                          ->  Seq Scan on refferal r  (cost=0.00..184.00 rows=10000 width=8)
--                          ->  Hash  (cost=219.49..219.49 rows=1571 width=4)
--                                ->  Hash Join  (cost=2.14..219.49 rows=1571 width=4)
--                                      Hash Cond: (ms.department_id = d.id)
--                                      ->  Seq Scan on medical_specialist ms  (cost=0.00..191.26 rows=9426 width=8)
--                                      ->  Hash  (cost=1.98..1.98 rows=13 width=4)
--                                            ->  Seq Scan on department d  (cost=0.00..1.98 rows=13 width=4)
--                                                  Filter: ((name)::text = 'Cardiology'::text)

-- Total cost(698.55)
-------------------------------------Query 2.1-----------------------------------------------------------
EXPLAIN SELECT age
FROM temp_table
WHERE TOTAL = (SELECT MAX(TOTAL)
               FROM temp_table )


--Query plan
--Seq Scan on temp_table  (cost=35.51..71.01 rows=10 width=4)
--  Filter: (total = $0)
--  InitPlan 1 (returns $0)
--    ->  Aggregate  (cost=35.50..35.51 rows=1 width=8)
--          ->  Seq Scan on temp_table temp_table_1  (cost=0.00..30.40 rows=2040 width=8)

--Total cost(71.01)

-----------------------------------------------------------------------------------------------------------

--Final total cost(698.55 + 71.01 = 769.56)