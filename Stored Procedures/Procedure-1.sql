--Procedure that will replace the icd10 code with new code for a given ID
CREATE OR REPLACE PROCEDURE changeICD10(INT, INT)
LANGUAGE plpgsql
AS $$
BEGIN

    UPDATE icd_10
    SET code = $2
    WHERE id = $1;
    COMMIT;
END;
$$;

--call procedure
-- the first argument is the id
--the second argument is the new code
CALL changeICD10(1010107,0);

--drop procedure
DROP  PROCEDURE changeICD10(INT, INT);

