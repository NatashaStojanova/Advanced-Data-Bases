-------------------------------------Query 1.0-----------------------------------------------------------
SELECT gp.id, COUNT(*) AS TOTAL_PATIENTS
INTO TEMP_TABLE
FROM general_practitioner gp   JOIN patient p on gp.id = p.id_doctor
     JOIN check_up cu on p.id = cu.patient_id
WHERE cu.date >= '2019-04-01' AND cu.date <= '2019-04-30'
GROUP BY gp.id;

-------------------------------------Query 1.1-----------------------------------------------------------
SELECT upper(d.name) || '_' || upper(d.surname)
FROM TEMP_TABLE T JOIN doctor d on T.id = d.id
WHERE T.TOTAL_PATIENTS >=300


--Она што го прави ова квери е: Прикажи ги имињата и презимињата на сите матични лекари кои направиле преглед на
--најмалку 300 пациенти во месец Април. Притоа форматот на името и презимето на лекарите треба да е следниот:
-- 'IME_PREZIME'

--Примената на ова квери би било доколку сакаме да видиме кој лекар колку пациенти имал(на одреден ден)
