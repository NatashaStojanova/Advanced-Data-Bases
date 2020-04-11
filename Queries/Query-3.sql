-------------------------------------Query 3.0-----------------------------------------------------------
SELECT bh.name,i.code,COUNT(*) AS TOTAL
INTO TEMP_TABLE
FROM base_hospital bh JOIN hospital h on bh.id = h.id_base_hospital
     JOIN doctor d on h.id = d.hospital_id
     JOIN check_up cu on d.id = cu.doctor_id
     JOIN check_up_icd cui on cu.id = cui.check_up_id
     JOIN icd_10 i on cui.icd_id = i.id
WHERE cu.date >= '2019-01-01' AND cu.date <= '2019-12-31'
GROUP BY bh.name,i.code;

-------------------------------------Query 3.1-----------------------------------------------------------
 SELECT name,MAX(TOTAL) AS MAX_CODE
INTO TEMP_TABLE_2
FROM TEMP_TABLE
GROUP BY name;

-------------------------------------Query 3.2-----------------------------------------------------------
SELECT T1.name,T1.code
FROM TEMP_TABLE T1 , TEMP_TABLE_2 T2
WHERE T1.name = T2.name AND T1.TOTAL = T2.MAX_CODE


--За секоја болница да се каже кој ICD-10 код бил најчесто дијагностициран
--од страна на докторите за 2019 година.

--Ова понатаму можеби би се искористило во некои статистики за најчесто дијагностицирана болест
--во дадена година во секоја болница.