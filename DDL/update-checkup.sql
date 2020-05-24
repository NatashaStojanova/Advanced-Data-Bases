--EXECUTE THIS AFTER YOU INSERT ROWS IN REFERRAL TABLE
do
$do$
declare
     i int;
begin
for  i in 1..10000
loop
   UPDATE check_up
SET refferal_id = floor(random()*(1067989-1057990+1))+1057990
WHERE id = i + 1020102 - 1;
end loop;
end
$do$;

