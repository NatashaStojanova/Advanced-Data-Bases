do
$do$
declare
     i int;
begin
for  i in 1..10000
loop
    insert into refferal VALUES(nextval('main_sequence'),concat('RefferalDescription-',i),floor(random()*(10102-676+1))+676,floor(random()*(1076445-1066446+1))+1066446);
end loop;
end
$do$;