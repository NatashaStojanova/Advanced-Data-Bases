do
$do$
declare
     i int;
begin
for  i in 1..10000
loop
    insert into check_up VALUES(nextval('main_sequence'),concat('description-',i),date('01-02-2019'),floor(random()*(1056444-56445+1))+56445,null,floor(random()*(10101-102+1))+102);
end loop;
end
$do$;