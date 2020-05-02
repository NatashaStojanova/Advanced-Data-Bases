--Procedure that will return average number of patients that specific doctor examined them, on a specific start and end date
CREATE OR REPLACE PROCEDURE AvgPatientsPerDoctor(INT, DATE, DATE)
LANGUAGE plpgsql
AS $$
    DECLARE avgNum int;

BEGIN
        SELECT AVG(cu.patient_id)
        INTO avgNum
        FROM doctor D JOIN check_up CU ON D.id = CU.doctor_id
        WHERE (CU.date >= $2 AND CU.date <= $3) AND d.id = $1;
     raise notice 'Value: %', avgNum;
    COMMIT;
END;
$$;

--call procedure with doctor ID, start date and end date as an arguments
CALL AvgPatientsPerDoctor(102,'2019-01-02','2019-01-02');

--drop procedure
DROP  PROCEDURE AvgPatientsPerDoctor(INT, DATE, DATE);

