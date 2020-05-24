do
$do$
declare
     i int;
begin
for  i in 676..10102

loop
    INSERT INTO medical_specialist(id,ssn,name,surname,hospital_id,department_id)
    SELECT doctor.id,doctor.ssn,doctor.name,doctor.surname,doctor.hospital_id,floor(random()*(101-24+1) + 24)
    FROM doctor
    WHERE doctor.id = i;

end loop;
end
$do$;


