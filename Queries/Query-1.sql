SELECT gp.id, COUNT(*) AS TOTAL_PATIENTS
INTO TEMP_TABLE
FROM general_practitioner gp   JOIN patient p on gp.id = p.id_doctor
     JOIN check_up cu on p.id = cu.patient_id
WHERE cu.date = '2019-01-02'
GROUP BY gp.id;

SELECT upper(d.name) || '_' || upper(d.surname)
FROM TEMP_TABLE T JOIN doctor d on T.id = d.id
WHERE TOTAL_PATIENTS >=300


--Она што го прави ова квери е: Дај ми ги имињата и презимињата на сите матични лекари кои направиле преглед на
--најмалку 300 пациенти во на ден 01.02.2019. Притоа форматот на името и презимето на лекарите треба да е следниот:
-- 'IME_PREZIME'

--Примената на ова квери би било доколку сакаме да видиме кој лекар колку пациенти имал(на одреден ден)