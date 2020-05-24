--Diagnosis history for a specific patient
SELECT DISTINCT i.code
FROM patient p  JOIN check_up cu on p.id = cu.patient_id
    JOIN check_up_icd cui on cu.id = cui.check_up_id
    JOIN icd_10 i on cui.icd_id = i.id
WHERE p.id = 884133;
