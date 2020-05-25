EXPLAIN SELECT r.*
FROM doctor d JOIN check_up cu on d.id = cu.doctor_id
    JOIN referral r on r.id = cu.refferal_id
WHERE  d.id = 4733 AND cu.date = '2019-01-02'



--QUERY PLAN
--Nested Loop  (cost=0.57..440.60 rows=6 width=36)
--  ->  Append  (cost=0.29..24.91 rows=3 width=4)
--        ->  Index Only Scan using doctor_pkey on doctor d  (cost=0.29..8.30 rows=1 width=4)
--              Index Cond: (id = 4733)
--        ->  Index Only Scan using medical_specialist_pkey on medical_specialist d_1  (cost=0.29..8.30 rows=1 width=4)
--              Index Cond: (id = 4733)
--        ->  Index Only Scan using general_practitioner_pkey on general_practitioner d_2  (cost=0.28..8.29 rows=1 width=4)
--              Index Cond: (id = 4733)
--  ->  Materialize  (cost=0.29..415.62 rows=2 width=40)
--        ->  Nested Loop  (cost=0.29..415.61 rows=2 width=40)
--              ->  Seq Scan on check_up cu  (cost=0.00..399.00 rows=2 width=8)
--                    Filter: ((doctor_id = 4733) AND (date = '2019-01-02'::date))
--              ->  Index Scan using referral_pkey on referral r  (cost=0.29..8.30 rows=1 width=36)
--                    Index Cond: (id = cu.refferal_id)
