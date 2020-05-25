--Function that will return total number of patients who visited their doctor on a specific date.
--Функција која ќе го врати вкупниот број на пациенти кои го посетиле својот доктор на даден датум.

CREATE OR REPLACE FUNCTION MonthlyReportFunction(date)
RETURNS INTEGER AS $$
BEGIN
    RETURN (
        SELECT count(*)
        FROM check_up cu
        WHERE date = $1
    );

END;
$$ LANGUAGE plpgsql;

SELECT MonthlyReportFunction('2019-01-02');

