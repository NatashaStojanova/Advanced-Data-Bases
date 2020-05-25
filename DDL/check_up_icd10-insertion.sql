do
$do$
declare
     i int;
begin
for  i in 1..10000
loop
    insert into check_up_icd VALUES(nextval('main_sequence'),floor(random()*(1020101-1010102+1))+1010102,floor(random()*(1030102-1020102+1))+1020102);
end loop;
end
$do$;