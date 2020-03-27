SELECT p.age, COUNT(DISTINCT p.id) AS TOTAL
INTO TEMP_TABLE
FROM patient p JOIN check_up cu on p.id = cu.patient_id
    JOIN refferal r on cu.id = r.check_up_id
    JOIN medical_specialist ms on r.medical_specialist_id = ms.id
    JOIN department d on ms.department_id = d.id
WHERE cu.date >= '2019-01-01' AND cu.date <= '2019-12-31' AND d.name = 'Cardiology'
GROUP BY p.age;

SELECT age
FROM temp_table
WHERE TOTAL = (SELECT MAX(TOTAL)
               FROM temp_table )


--Ова квери гласи: Во 2019 година, на која возрасна група на пациенти им биле издадени најмногу упати за преглед
--кај медицинските специјалисти кои работат во одделот "Кардиологија".
-- Примената на ова би било, да дознаеме за минатата или тековната година, која
-- возрасна група најмногу страдала од некоја болест(на пример во овој случај е заболување на срце).