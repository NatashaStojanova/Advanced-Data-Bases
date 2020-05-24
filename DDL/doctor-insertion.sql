do
$do$
declare
     i int;
begin
for  i in 1..10000
loop
    insert into doctor VALUES(nextval('main_sequence'),i+1,concat('doctorName-',i),concat('doctorSurname',i),floor(random()*(23-11+1))+11);
end loop;
end
$do$;