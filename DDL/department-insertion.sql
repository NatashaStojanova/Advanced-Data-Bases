do
$do$
declare
     i int;
begin
for  i in 11..23
loop
    insert into department VALUES(nextval('main_sequence'),'Cardiology','cardio',i);
    insert into department VALUES(nextval('main_sequence'),'Neurology','neuro',i);
    insert into department VALUES(nextval('main_sequence'),'Intense Care','intense',i);
    insert into department VALUES(nextval('main_sequence'),'Oncology','oncology',i);
    insert into department VALUES(nextval('main_sequence'),'Paediatric intensive care unit','paediatric',i);
    insert into department VALUES(nextval('main_sequence'),'Neonatal intensive care unit','intensive',i);
end loop;
end;
$do$;