--Function that will replace the icd10 code with new code for a given ID
--Функција која ќе го промени ICD10 кодот со нов код, за дадено ID
CREATE OR REPLACE FUNCTION changeICD10Function(INT,INT)
RETURNS void
AS $$
BEGIN
    UPDATE icd_10
    SET code = $2
    WHERE id = $1;
    COMMIT;
END;
$$ LANGUAGE plpgsql;




