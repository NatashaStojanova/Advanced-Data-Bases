--EXECUTE THIS AFTER YOU INSERT ROWS IN REFERRAL TABLE
do
$do$
declare
     i int;
begin
for  i in 1..10000
loop
   UPDATE check_up
SET referral_id = floor(random()*(1050101-1040102+1))+1040102
WHERE id = i + 1020102 - 1;
end loop;
end
$do$;

