do
$do$
declare
     i int;
begin
for  i in 1..10000
loop
    insert into referral VALUES(nextval('main_sequence'),concat('ReferralDescription-',i),floor(random()*(10000-676+1))+676,floor(random()*(1030101-1020102+1))+1020102);
end loop;
end
$do$;