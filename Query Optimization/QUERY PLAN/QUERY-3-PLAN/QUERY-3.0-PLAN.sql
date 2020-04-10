EXPLAIN SELECT bh.name,i.code,COUNT(*) AS TOTAL
INTO TEMP_TABLE
FROM base_hospital bh JOIN hospital h on bh.id = h.id_base_hospital
     JOIN doctor d on h.id = d.hospital_id
     JOIN check_up cu on d.id = cu.doctor_id
     JOIN check_up_icd cui on cu.id = cui.check_up_id
     JOIN icd_10 i on cui.icd_id = i.id
WHERE cu.date >= '2019-01-01' AND cu.date <= '2019-12-31'
GROUP BY bh.name,i.code;

--QUERY PLAN--
 HashAggregate  (cost=1377.08..1483.10 rows=10602 width=130)
  Group Key: bh.name, i.code
  ->  Hash Join  (cost=1109.25..1297.57 rows=10602 width=122)
        Hash Cond: (cui.icd_id = i.id)
        ->  Merge Join  (cost=820.25..980.73 rows=10602 width=122)
              Merge Cond: (cu.id = cui.check_up_id)
              ->  Nested Loop  (cost=0.86..15319.05 rows=10602 width=122)
                    ->  Nested Loop  (cost=0.72..12668.17 rows=10602 width=8)
                          ->  Nested Loop  (cost=0.57..10867.28 rows=10602 width=8)
                                ->  Index Scan using check_up_pkey on check_up cu  (cost=0.29..406.29 rows=10000 width=8)
                                      Filter: ((date >= '2019-01-01'::date) AND (date <= '2019-12-31'::date))
                                ->  Append  (cost=0.29..1.02 rows=3 width=8)
                                      ->  Index Scan using doctor_pkey on doctor d  (cost=0.29..0.35 rows=1 width=8)
                                            Index Cond: (id = cu.doctor_id)
                                      ->  Index Scan using medical_specialist_pkey on medical_specialist d_1  (cost=0.29..0.35 rows=1 width=8)
                                            Index Cond: (id = cu.doctor_id)
                                      ->  Index Scan using general_practitioner_pkey on general_practitioner d_2  (cost=0.28..0.30 rows=1 width=8)
                                            Index Cond: (id = cu.doctor_id)
                          ->  Index Scan using hospital_pkey on hospital h  (cost=0.15..0.17 rows=1 width=8)
                                Index Cond: (id = d.hospital_id)
                    ->  Index Scan using base_hospital_pkey on base_hospital bh  (cost=0.14..0.25 rows=1 width=122)
                          Index Cond: (id = h.id_base_hospital)
              ->  Sort  (cost=819.39..844.39 rows=10000 width=8)
                    Sort Key: cui.check_up_id
                    ->  Seq Scan on check_up_icd cui  (cost=0.00..155.00 rows=10000 width=8)
        ->  Hash  (cost=164.00..164.00 rows=10000 width=8)
              ->  Seq Scan on icd_10 i  (cost=0.00..164.00 rows=10000 width=8)
