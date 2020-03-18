do
$do$
declare
     i int;
begin
for  i in 1..10000
loop
    insert into check_up_icd VALUES(nextval('main_sequence'),floor(random()*(1066444-1056445+1))+1056445,floor(random()*(1076445-1066446+1))+1066446);
end loop;
end
$do$;