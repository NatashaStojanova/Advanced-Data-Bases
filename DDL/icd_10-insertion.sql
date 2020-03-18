do
$do$
declare
     i int;
begin
for  i in 1..10000
loop
    insert into icd_10 VALUES(nextval('main_sequence'),concat('name-',i),i);
end loop;
end
$do$;