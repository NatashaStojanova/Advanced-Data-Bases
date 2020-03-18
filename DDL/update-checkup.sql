--EXECUTE THIS AFTER YOU INSERT ROWS IN REFFERAL TABLE
do
$do$
declare
     i int;
begin
for  i in 1..10000
loop
   UPDATE check_up
SET refferal_id = floor(random()*(1096445-1086446+1))+1086446
WHERE id = i + 1066445;
end loop;
end
$do$;