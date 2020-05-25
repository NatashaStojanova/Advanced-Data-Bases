--Create new Referral
--Креирај нов упат (Преку оваа функција креираме нов упат, каде што го наведуваме специјалистот, прегледот на кој бил издаден упатот како и опис за самиот упат).
CREATE OR REPLACE FUNCTION createReferralFunction(BIGINT,BIGINT,VARCHAR)
RETURNS void AS $$
BEGIN
     IF $2 IN (SELECT id FROM check_up)
    THEN
         INSERT INTO referral VALUES(nextval('main_sequence'),$3,$1,$2);
    END IF;
END;
$$ LANGUAGE plpgsql;

SELECT createReferralFunction(679,1020119,'this referral is created by the function');

