--Create CheckUp ( The procedure is invoked by the doctor's ID, patient ID and description for the check up).
--Изврши преглед (Процедурата се повикува со ID на лекарот, ID на пациентот и опис за самиот преглед).
CREATE OR REPLACE FUNCTION createCheckUpFunction(BIGINT,BIGINT,VARCHAR)
RETURNS void AS $$
BEGIN
    IF $1 IN (SELECT id FROM doctor) AND $2 IN (SELECT id FROM patient)
    THEN
         insert into check_up VALUES(nextval('main_sequence'),$3,current_date,$2,null,$1);
    END IF;
END;
$$ LANGUAGE plpgsql;

SELECT createCheckUpFunction(107,10102,'function invoked');

