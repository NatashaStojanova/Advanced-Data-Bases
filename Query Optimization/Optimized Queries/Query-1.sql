SELECT d.id, COUNT(*) AS TOTAL_PATIENTS
INTO TEMP_TABLE
FROM doctor d JOIN check_up cu on d.id = cu.doctor_id
WHERE cu.date = '2019-01-02'
GROUP BY d.id;

SELECT upper(T.name) || '_' || upper(T.surname)
FROM TEMP_TABLE T JOIN general_practitioner GP ON T.id = GP.id
WHERE T.TOTAL_PATIENTS >=300

