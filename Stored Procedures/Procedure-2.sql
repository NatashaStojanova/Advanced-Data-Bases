--Procedure that will return total number of patients who visited their doctor for a specific date
CREATE OR REPLACE PROCEDURE MonthlyReport(DATE)
LANGUAGE plpgsql
AS $$
    DECLARE total int;
BEGIN

   SELECT count(*)
   INTO total
   FROM check_up cu
   WHERE date = $1;

   raise notice 'Value: %', total;

    COMMIT;
END;
$$;

--call procedure with date as an argument
CALL MonthlyReport('2019-01-02');

--drop procedure
DROP  PROCEDURE MonthlyReport(DATE);

