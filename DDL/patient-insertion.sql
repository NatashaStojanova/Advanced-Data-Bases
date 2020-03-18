do
$do$
declare
     i int;
begin
for  i in 1..1000000
loop
    insert into patient VALUES(nextval('main_sequence'),i,concat('patientName-',i),concat('patientSurname-',i),concat('patientAddress-',random()),random(),floor(random()*(675-102+1))+102);
end loop;
end
$do$;