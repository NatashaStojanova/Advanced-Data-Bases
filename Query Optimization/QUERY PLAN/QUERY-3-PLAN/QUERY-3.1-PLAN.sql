EXPLAIN SELECT name,MAX(TOTAL) AS MAX_CODE
INTO TEMP_TABLE_2
FROM TEMP_TABLE
GROUP BY name;

--QUERY PLAN--
HashAggregate  (cost=72.37..74.37 rows=200 width=126)
  Group Key: name
  ->  Seq Scan on temp_table  (cost=0.00..61.91 rows=2091 width=126)
