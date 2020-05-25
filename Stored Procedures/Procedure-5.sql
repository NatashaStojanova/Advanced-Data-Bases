--Create new Referral
--Креирај нов упат
CREATE PROCEDURE createReferral(BIGINT,BIGINT,VARCHAR)
    LANGUAGE plpgsql
AS
    $$
BEGIN

    IF $2 IN (SELECT id FROM check_up)
    THEN
         insert into referral VALUES(nextval('main_sequence'),$3,$1,$2);
    END IF;

END
$$;
CALL createReferral(679,1020119,'this is referral');
DROP PROCEDURE createReferral(BIGINT,BIGINT,VARCHAR);
