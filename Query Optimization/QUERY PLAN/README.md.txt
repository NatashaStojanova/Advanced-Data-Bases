How to read QUERY PLAN?

EXAMPLE: 

EXPLAIN SELECT * FROM base_hospital LIMIT 10;

QUERY PLAN:

Limit  (cost=0.00..0.93 rows=10 width=638)
  ->  Seq Scan on base_hospital  (cost=0.00..11.20 rows=120 width=638)

The cost is represented as a tuple, e.g. the cost of the LIMIT is cost=0.00..0.93 and the cost of sequentially scanning post is cost=0.00..11.20.
The first number in the tuple is the startup cost and the second number is the total cost.
*Startup cost- time between when the component starts executing and when the component outputs its first row.
*Total cost is the entire execution time of the component, from when it begins reading in data to when it finishes writing its output.
Each "parent" node's costs includes the cost's of its child nodes.

Let's try this example:

EXPLAIN SELECT * FROM base_hospital ORDER BY name LIMIT 10;

QUERY PLAN:
Limit  (cost=0.14..4.29 rows=10 width=638)
  ->  Index Scan using base_hospital_name_key on base_hospital  (cost=0.14..49.94 rows=120 width=638)

Here, order by has a significant startup cost 0.14 because it has to sort the entire table before it can output even a single row.
Notice that the startup time of the LIMIT 0.14 is exactly equal to the startup time of the sort. This is not because LIMIT itself has a high startup time.
It actually has zero startup time by itself, but EXPLAIN rolls up all of the child costs for each parent, so the LIMIT startup time includes the sum startup times of its children.





	