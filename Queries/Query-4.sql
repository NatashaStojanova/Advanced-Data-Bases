--Find all referrals given by a specific doctor, on a specific date.
SELECT r.description
FROM doctor d JOIN check_up cu on d.id = cu.doctor_id
    JOIN referral r on r.id = cu.refferal_id
WHERE  d.id = 4733 AND cu.date = '2019-01-02'


