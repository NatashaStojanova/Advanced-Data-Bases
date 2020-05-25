--Function that will return total number of patients who visited their doctor for a specific date.
--Функција која за даден лекар, го дава просечниот број на пациенти кои ги прегледал за даден почетен и краен датум.
CREATE OR REPLACE FUNCTION AvgPatientsPerDoctorFunction(INT, DATE, DATE)
RETURNS INTEGER AS $$
BEGIN
    RETURN (
        SELECT AVG(cu.patient_id)
        FROM doctor D JOIN check_up CU ON D.id = CU.doctor_id
        WHERE (CU.date >= $2 AND CU.date <= $3) AND d.id = $1
    );

END;
$$ LANGUAGE plpgsql;

SELECT AvgPatientsPerDoctorFunction(102,'2019-01-02','2019-01-02');
