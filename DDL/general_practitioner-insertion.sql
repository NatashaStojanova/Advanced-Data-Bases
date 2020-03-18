--FIRST INSERT THE ID
do
$do$
declare
     i int;
begin
for  i in 102..675

loop
    INSERT INTO general_practitioner(id,ssn, name, surname, hospital_id)
    SELECT doctor.id,doctor.ssn,doctor.name,doctor.surname,doctor.hospital_id
    FROM doctor
    WHERE doctor.id = i;

end loop;
end
$do$;


