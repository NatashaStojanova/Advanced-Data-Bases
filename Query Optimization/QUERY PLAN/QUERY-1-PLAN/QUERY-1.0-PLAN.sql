EXPLAIN SELECT gp.id, COUNT(*) AS TOTAL_PATIENTS
INTO TEMP_TABLE
FROM general_practitioner gp   JOIN patient p on gp.id = p.id_doctor
     JOIN check_up cu on p.id = cu.patient_id
WHERE cu.date = '2019-01-02'
GROUP BY gp.id;

--QUERY PLAN--
Finalize GroupAggregate  (cost=23061.50..23206.93 rows=574 width=12)
  Group Key: gp.id
  ->  Gather Merge  (cost=23061.50..23195.45 rows=1148 width=12)
        Workers Planned: 2
        ->  Sort  (cost=22061.48..22062.92 rows=574 width=12)
              Sort Key: gp.id
              ->  Partial HashAggregate  (cost=22029.44..22035.18 rows=574 width=12)
                    Group Key: gp.id
                    ->  Hash Join  (cost=351.92..22008.60 rows=4167 width=4)
                          Hash Cond: (p.id_doctor = gp.id)
                          ->  Hash Join  (cost=333.00..21978.67 rows=4167 width=4)
                                Hash Cond: (p.id = cu.patient_id)
                                ->  Parallel Seq Scan on patient p  (cost=0.00..19520.67 rows=416667 width=8)
                                ->  Hash  (cost=208.00..208.00 rows=10000 width=4)
                                      ->  Seq Scan on check_up cu  (cost=0.00..208.00 rows=10000 width=4)
                                            Filter: (date = '2019-01-02'::date)
                          ->  Hash  (cost=11.74..11.74 rows=574 width=4)
                                ->  Seq Scan on general_practitioner gp  (cost=0.00..11.74 rows=574 width=4)
